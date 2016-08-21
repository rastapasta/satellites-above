var SatellitesAbove = require('./index');

satellites = new SatellitesAbove({debug: true})
satellites
.load({download: true})
.then(() => {
	satellites = satellites.over(52.520645, 13.409779);
	console.log(satellites);
});