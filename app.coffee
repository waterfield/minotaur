express = require 'express'
Mincer = require 'mincer'
redis = require 'redis'
Redeye = require 'redeye'
$ = require 'jquery'
routes = require './routes'
jade = require 'jade'
path = require 'path'

# Asset management
environment = new Mincer.Environment()
environment.appendPath 'assets/javascripts'
environment.appendPath 'assets/stylesheets'
environment.appendPath 'assets/javascripts/templates'
environment.appendPath 'components'

db = redis.createClient()
app = express()

#app.engine 'jade', require('jade').__express

app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	app.locals.pretty = true
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.static "#{__dirname}/public"

# Redeye test
manager = new Redeye.Manager verbose: true, flush: true

manager.worker 'a', -> @each i:[1..4], @b
manager.worker 'b', 'i', -> @each i:[@i*5-4..(@i*5)], @c
manager.worker 'c', 'i', -> @d i: Math.floor(@i/4)
manager.worker 'd', 'i', -> @e()
manager.worker 'e', -> 'ok'

manager.run()
setTimeout (-> manager.request 'a'), 100

app.get '/', routes.index
app.get '/keyspace', routes.keyspace
app.get '/state', routes.state_page
app.get '/keys', routes.keys
app.get '/value/:key', routes.value
app.get '/state/:manager', routes.state
app.use '/assets/', Mincer.createServer environment
app.get '/tests', routes.tests
app.get '/test', routes.test

app.listen 3000