start = ->
    noop = ->
    sleep = (millis) ->
        startTime = new Date().getTime()
        noop() while new Date().getTime() < startTime + millis
    sleep 10000
    console.log "Request handler 'start' was called."
    "Hello start"

upload = ->
    console.log "Request handler 'upload' was called."
    "Hello 上传"

exports.start = start
exports.upload = upload
