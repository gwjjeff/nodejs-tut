app = require('express').createServer()

# app.get('/user/:id', function(req, res)  or use immediate Regex
app.get /^\/users?(?:\/(\d+)(?:\.\.(\d+))?)?/, (req, res) ->
    res.send req.params

app.listen 8888
