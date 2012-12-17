express = require 'express'
Mincer = require 'mincer'
redis = require 'redis'
Redeye = require 'redeye'
$ = require 'jquery'
routes = require './routes'
path = require 'path'
partials = require 'express-partials'

# Asset management
environment = new Mincer.Environment()
environment.appendPath 'assets/javascripts'
environment.appendPath 'assets/stylesheets'
environment.appendPath 'assets/templates'

db = redis.createClient()
app = express()
#app.use partials()

app.engine 'hamlc', require('haml-coffee').__express

app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'hamlc'
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
app.get '/keys', routes.keys
app.get '/keys/:prefix', routes.keys.prefix
app.use '/assets/', Mincer.createServer environment

app.listen 3000