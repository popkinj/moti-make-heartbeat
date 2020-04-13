require! \util
makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 1
  numCorridors: 1
  historySize: 1
  header: fromEnvironment: 'PROD'

options
  |> makeHeartbeat.heartbeat
  # |> JSON.stringify
  # |> util.inspect _, {colors: true, depth: 4}
  |> console.log
