exec = (require "child_process").exec

start = ->
    console.log "Request handler 'start' was called."
    content = "empty"
    exec "ls -lah", (error, stdout, stderr) ->
        content = stdout
    content

upload = ->
    console.log "Request handler 'upload' was called."
    "Hello 上传"

exports.start = start
exports.upload = upload
