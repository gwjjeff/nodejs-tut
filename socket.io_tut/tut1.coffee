io = require 'socket.io'
express = require 'express'

app = express.createServer()
io = io.listen(app)

app.listen 8888

io.sockets.on 'connection', (socket) ->
    socket.emit 'news', hello: 'world'
    socket.on 'my other event', (data) ->
        console.log data


