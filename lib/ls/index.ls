require! {
  \moti-make-sign # maps to motiMakeSign
}

heartbeat = (o) ->
  motiMakeSign.create.full!

module.exports = {
  heartbeat
}
