exec = (require "child_process").exec

start = (response) ->
    console.log "Request handler 'start' was called."

    exec "find /", { timeout: 5000, maxBuffer: 20000*1024 }, (error, stdout, stderr) ->
        response.writeHead 200, "Content-Type": "text/plain"
        response.write stdout
        response.end()

upload = (response) ->
    console.log "Request handler 'upload' was called."
    response.writeHead 200, "Content-Type": "text/plain"
    response.write "Hello 上传"
    response.end()

exports.start = start
exports.upload = upload
