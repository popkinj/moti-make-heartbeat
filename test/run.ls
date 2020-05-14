require! \util
makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 10
  numCorridors: 2
  historySize: 1
  header: fromEnvironment: 'LAB'

options
  |> makeHeartbeat.heartbeat
  |> JSON.stringify
  |> util.inspect _, {colors: false, depth: 10}
  |> console.log
