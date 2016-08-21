# satellites-above
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

satellites = new SatellitesAbove();
satellites
.load({download: true})
.then(() => {
	satellites = satellites.above(52.520645, 13.409779);
	console.log(satellites);
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
  { pnr: '15',
    azimuth: 60.79742835048778,
    elevation: 13.732653333559668 },
  { pnr: '16',
    azimuth: 223.13576718986934,
    elevation: 58.74067393499978 },
  { pnr: '18',
    azimuth: 108.7719771229539,
    elevation: 53.685250648551936 },
  { pnr: '20',
    azimuth: 46.941697880412825,
    elevation: 21.617107809987786 },
  { pnr: '21',
    azimuth: 69.98852149562943,
    elevation: 45.78739380934678 },
  { pnr: '26',
    azimuth: 189.98603432164091,
    elevation: 36.94228243440462 },
  { pnr: '27',
    azimuth: 292.56120764840387,
    elevation: 61.9697154411121 },
  { pnr: '07',
    azimuth: 316.92969181185975,
    elevation: 13.936164307716842 },
  { pnr: '08',
    azimuth: 292.8757183035666,
    elevation: 24.704872916607023 } ]
```

## Special thanks
* [rosh93](https://github.com/rosh93) for his work on [JsPredict](https://github.com/nsat/jspredict)
