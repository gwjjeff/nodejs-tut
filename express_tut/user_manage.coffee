express = require 'express'
app = express.createServer()

users = [{name: 'www.csser.com'}]

loadUser = (req, res, next) ->
    user = users[req.params.id]
    if user
        req.user = user
        next()
    else
        next(new Error "不存在的用户 #{req.params.id}")

app.get '/user/:id', loadUser, (req, res) ->
    res.send "viewing #{req.user.name}"


app.get '*', (req, res) ->
    res.send 'what???', 404

app.listen 8888
