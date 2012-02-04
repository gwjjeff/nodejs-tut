express = require 'express'
pub = "#{__dirname}/public"
app = express.createServer()
app.use app.router
app.use express.static(pub)
app.use express.errorHandler({ dump: true, stack: true })
port = process.env.VMC_APP_PORT || 3000
host = process.env.VCAP_APP_HOST || 'localhost'

app.listen host, port
console.log "server #{__filename} started on prot: #{port} host: #{host}"

