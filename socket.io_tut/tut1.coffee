io = require 'socket.io'
express = require 'express'
http = require 'http'

app = express()
server = http.createServer(app)
io = io.listen(server)

app.configure ->
    app.use express.static "#{__dirname}/public"

io.configure ->
    io.set 'transports', [
      'websocket'
    , 'flashsocket'
    , 'htmlfile'
    , 'xhr-polling'
    , 'jsonp-polling'
    ]

server.listen 8888

io.sockets.on 'connection', (socket) ->
    socket.emit 'news', msg: 'hello world'
    socket.on 'my other event', (data) ->
        console.log data
        socket.emit 'news', msg: "received: #{data.my}"

### browser client ( with coffeescirpt )
window.socket ?= io.connect '/'
socket.removeAllListeners 'news'
socket.removeAllListeners 'connect'
socket.removeAllListeners 'disconnect'

socket.on 'news', (data) ->
    alert data.msg
socket.on 'connect', ->
    alert 'connected'
socket.on 'disconnect', ->
    alert 'disconnected'
socket.emit 'my other event', my: 'doooo12'
###
