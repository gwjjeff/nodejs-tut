express = require 'express'
app = express.createServer()
# app.set 'view options', {open: '{{=', close: '}}', layout: false}
app.set 'view options', {layout: false}
app.get '/', (req, res) ->
    res.render 'index.jade', { title: 'CSSer, 关注Web前端技术！' }

app.listen 8888
