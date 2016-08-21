const SatellitesAbove = require('./index');

satellites = new SatellitesAbove({debug: true})
satellites
.load({download: true})
.then(() => {
	let sats = satellites.above(52.520645, 13.409779);
	console.log(sats);
});