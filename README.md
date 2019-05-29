# moti-make-heartbeat

The Variable Speed Sign application accepts *heartbeat* JSON payloads from trusted sources. This library produces fake data that can be used for testing.

## Installing
```
npm i moti-make-heartbeat
```

## Usage
There are three parameters to adjust.
1. numSigns - The number of signs
1. numCorridors - The number of corridors
1. historySize - The number of history records

The _numSigns_ are split evenly amoung all corridors specified within _numCorridors_. The historySize refers to the number of sign changes in the history array for each sign. Speeds within the history are random between 50 - 100. The timestamps within the history step back ten minutes per record from the current time.

```javascript
const request = require('request');
const makeHeartbeat = require('moti-make-heartbeat');

const options = {
  numSigns: 60,
  numCorridors: 3,
  historySize: 10
}

const heartbeat = makeHeartbeat.create.heartbeat(options);

request({
  url: "https://url.to.server",
  method: "POST",
  json: heartbeat
});
```

## Testing
Create a test heartbeat object and print to the console
```
cd moti-make-heartbeat
npm test
```

You can adjust the parameters in the _test/run.ls_ file.
