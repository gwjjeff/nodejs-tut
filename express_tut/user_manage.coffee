express = require 'express'
app = express.createServer()

users = [{name: 'www.csser.com'}]

app.all '/user/:id/:op?', (req, res, next) ->
    req.user = users[req.params.id]
    if req.user
        next()
    else
        next(new Error "cannot find user #{req.params.id}")

app.get '/user/:id', (req, res) ->
    res.send "viewing #{req.user.name}"

app.get '/user/:id/edit', (req, res) ->
    res.send "editing #{req.user.name}"

app.get '/user/:id', (req, res) ->
    res.send "updating #{req.user.name}"

app.get '*', (req, res) ->
    res.send 'what???', 404

app.listen 8888
