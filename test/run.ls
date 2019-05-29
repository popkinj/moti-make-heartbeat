require! \util
makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 60
  numCorridors: 3
  historySize: 10

options
  |> makeHeartbeat.heartbeat
  |> util.inspect _, {colors: true, depth: 4}
  |> console.log
