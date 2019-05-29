makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 60
  numCorridors: 3
  historySize: 10

console.log 'Testing heartbeat', makeHeartbeat.heartbeat options
