require! {
  \moment
  \moti-make-sign # maps to motiMakeSign
}

/* ## header
  Create the header object
  @param o {object} Options for creating header
  @return {object} Header object
 */
header = (o) ->
  # Set up defaults
  fromBusinessSystemName    = if o?fromBusinessSystemName then that else "Big Business"
  fromBusinessSystemVersion = if o?fromBusinessSystemVersion then that else "version 2"
  fromEnvironment           = if o?fromEnvironment then that else "DEV"
  targetEnvironment         = if o?targetEnvironment then that else "DEV"
  messageSchemaVersion      = if o?messageSchemaVersion then that else "version 1.5.0"
  messageSendDateTime       = if o?messageSendDateTime then that else moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
  messageUuid               = if o?messageUuid then that else "d33a9e93-8fce-4dd0-84a0-54e9e1606bbc"

  {
    fromBusinessSystemName
    fromBusinessSystemVersion
    fromEnvironment
    targetEnvironment
    messageSchemaVersion
    messageSendDateTime
    messageUuid
  }


heartbeat = (o) ->
  numSigns = if o?numSigns then that else 1
  numCorridors = if o?numCorridors then that else 1
  historySize = if o?historySize then that else 5

  corridorSize = Math.floor(numSigns / numCorridors)

  heartbeat = do
    header: header o.header
    corridors: []

  segmentId = 0

  for corridorId in [1 to numCorridors]
    corridorName = "Corridor #corridorId"
    isCorridorEnabled = yes
    segments = []

    for [1 to corridorSize]
      ++segmentId
      direction = if Math.random! > 0.5 then "North" else "South"
      s = motiMakeSign.create.full {historySize, segmentId, direction}
      segments.push s

    heartbeat.corridors.push {
      corridorId
      corridorName
      isCorridorEnabled
      segments
    }

  heartbeat

module.exports = {
  heartbeat
}
