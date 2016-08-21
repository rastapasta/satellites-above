predict = require 'jspredict'
requestPromise = require 'request-promise'
Promise = require 'bluebird'
fs = require 'fs'
fs = Promise.promisifyAll require "fs"

module.exports = class SatellitesAbove
	debug: true
	tleUrl: 'https://www.celestrak.com/NORAD/elements/supplemental/gps.txt'
	
	satellites: {}

	constructor: (options) ->
		@debug = options?.debug or false

	load: (options) ->
		promise = if options?.download
			@downloadTLE()
		else
			fs.readFileAsync options?.file or "data/gps-ops.txt"

		promise
		.then (file) =>
			@parseSatellites file
		.then (count) =>
			@log "[+] Loaded #{count} GPS satellites"
			count

	downloadTLE: ->
		@log "[+] Downloading TLE file.."
		
		requestPromise
		.get @tleUrl

	parseSatellites: (content) ->
		lines = content.toString().split /\r*\n/
		loaded = 0
		while lines.length >= 3
			lte = lines[0..2].join "\n"
			
			prn = if match = lines[0].match /PRN (\d+)/
				match[1]
			continue unless prn

			loaded++
			@satellites[prn] = lte
			lines = lines.splice 3
		loaded

	above: (lat, lng, altitude=0.1, minimalElevation=10) ->
		@log "[+] Finding satellites above #{lat}, #{lng}"
		visible = []
		for id,satellite of @satellites
			data = predict.observe satellite, [lat, lng, altitude]
			if data.elevation > minimalElevation
				visible.push
					pnr: id
					azimuth: data.azimuth
					elevation: data.elevation
		visible

	log: (event) ->
		console.log event if @debug
