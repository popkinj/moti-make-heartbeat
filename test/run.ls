require! \util
makeHeartbeat = require "#{__dirname}/../lib/ls/index"

options = do
  numSigns: 60
  numCorridors: 3
  historySize: 10

# We call the heartbeat function in tests differently because we are 
# requiring the module directly. In Prod you would call it
# like this.
# ```
# makeHeartbeat.create.heartbeat options
# ```
options
  |> makeHeartbeat.heartbeat
  |> util.inspect _, {colors: true, depth: 4}
  |> console.log
