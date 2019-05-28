makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 1
  numCorridors: 60
  historySize: 10

console.log 'Testing heatbeat', makeHeartbeat.create options
