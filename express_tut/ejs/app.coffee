express = require 'express'
app = express.createServer()

app.register '.html', require('ejs')

app.set 'views', __dirname + '/views'
app.set 'view engine', 'html'
app.set 'view options', {open: '{{', close: '}}'}

users = [
    { name: 'tj', email: 'tj@sencha.com' }
  , { name: 'ciaran', email: 'ciaranj@gmail.com' }
  , { name: 'aaron', email: 'aaron.heckmann+github@gmail.com' }
]

app.get '/', (req, res) ->
    res.render 'users', users: users

app.listen 8888
console.log 'Express app started on port 8888'
