# satellites-above
![travis](https://travis-ci.org/rastapasta/satellites-above-node.svg)
[![npm version](https://badge.fury.io/js/satellites-above.svg)](https://badge.fury.io/js/satellites-above)
![dependencies](https://david-dm.org/rastapasta/satellites-above-node.svg)
![license](https://img.shields.io/github/license/rastapasta/satellites-above-node.svg)

This node module allows you to easily gather information about the GPS satellites which are currently visible from a given location on earth. Additional information about the satellites' relative elevation and azimuth are returned as well. Using [JsPredict](https://github.com/nsat/jspredict) for smooth calculations.

## How to install it?

```bash
npm install --save satellites-above
```

## How to use it?

```javascript
const SatellitesAbove = require('satellites-above');

let satellites = new SatellitesAbove();
satellites
.load({download: true})
.then(() => {
	let sats = satellites.above(52.520645, 13.409779);
	console.log(sats);
});
```

```bash
$> node example.js 
[+] Downloading TLE file..
[+] Loaded 31 GPS satellites
[+] Finding satellites above 52.520645, 13.409779
[ { pnr: '10',
    azimuth: 162.64770521748392,
    elevation: 39.92090170684154 },
  { pnr: '16',
    azimuth: 223.13576718986934,
    elevation: 58.74067393499978 },
  { pnr: '18',
    azimuth: 108.7719771229539,
    elevation: 53.685250648551936 },
  { pnr: '20',
    azimuth: 46.941697880412825,
    elevation: 21.617107809987786 },
  { pnr: '08',
    azimuth: 292.8757183035666,
    elevation: 24.704872916607023 } ]
```

## Special thanks
* [rosh93](https://github.com/rosh93) for his work on [JsPredict](https://github.com/nsat/jspredict)
* [Tr4sHCr4fT](https://github.com/Tr4sHCr4fT) for inspiring me with his python based [gpsinfo](https://github.com/Tr4sHCr4fT/gpsinfo) :)
