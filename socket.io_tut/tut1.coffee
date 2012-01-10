io = require 'socket.io'
express = require 'express'

app = express.createServer()
io = io.listen(app)

app.listen 8888

io.sockets.on 'connection', (socket) ->
    socket.emit 'news', msg: 'hello world'
    socket.on 'my other event', (data) ->
        console.log data
        socket.emit 'news', msg: "received: #{data.my}" 

### browser client ( with coffeescirpt )
window.socket ?= io.connect 'http://pm.ultradp.com:8888'
socket.removeAllListeners('news')
socket.on 'news', (data) ->
    alert data.msg
    socket.emit 'my other event', my: 'doooo'
###
