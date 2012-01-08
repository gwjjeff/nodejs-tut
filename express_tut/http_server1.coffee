app = require('express').createServer()

app.get '/', (req, res) ->
    res.send 'hello world from csser.com!'

app.listen 8888
