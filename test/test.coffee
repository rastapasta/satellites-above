SatellitesAbove = require "../index.js"
_ = require "lodash"

describe "General tests for satellites-above-node:", =>
	satellites = null

	describe "Load and parse TLE files:", =>
		beforeEach =>
			satellites = new SatellitesAbove()
			null

		it "from included gps-ops.txt", (done) =>
			satellites.load().should.eventually.equal(31).notify done
			null

		it "by downloading", (done) =>
			@timeout = 5000
			satellites.load(download: true).then (count) ->
				expect count > 20
				done()
			null

	describe "Return satellites above location:", =>
		seen = []
		other = []

		beforeEach (done) =>
			satellites = new SatellitesAbove()
			satellites.load().then -> done()
			null

		it ".above should return satellites", (done) =>
			seen = satellites.above(0, 0)
			expect seen.length > 0
			done()

		it ".above should return for the other side of the world as well", (done) =>
			other = satellites.above(0, 179)
			expect other.length > 0
			done()

		it "visible satellites on opposite sides of the earth should completely differ", (done) =>
			seenIds = (s.prn for s in seen)
			otherIds = (s.prn for s in other)

			expect _.intersection(seenIds, otherIds) is 0 
			done()
