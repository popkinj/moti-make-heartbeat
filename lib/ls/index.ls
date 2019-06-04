require! {
  \moment
  \moti-make-sign # maps to motiMakeSign
}

heartbeat = (o) ->
  numSigns = if o?numSigns then that else 1
  numCorridors = if o?numCorridors then that else 1
  historySize = if o?historySize then that else 5

  corridorSize = Math.floor(numSigns / numCorridors)

  heartbeat = do
    recordDate: moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
    corridors: []

  segmentId = 0

  for corridorId in [1 to numCorridors]
    corridorName = "Corridor #corridorId"
    segments = []

    for [1 to corridorSize]
      ++segmentId
      direction = if Math.random! > 0.5 then 'North' else 'South'
      s = motiMakeSign.create.full {historySize, segmentId, direction}
      segments.push s

    heartbeat.corridors.push {corridorId,corridorName,segments}

  heartbeat

module.exports = {
  heartbeat
}
