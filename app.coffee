express = require 'express'
Mincer = require 'mincer'
#redis = require 'redis'
#Redeye = require 'redeye'
$ = require 'jquery'
jade = require 'jade'

# Routes
main = require './routes/index'
minotaur = require './routes/minotaur'
monitor = require './routes/monitor'

# Asset management
environment = new Mincer.Environment()
environment.appendPath 'assets/javascripts'
environment.appendPath 'assets/stylesheets'
environment.appendPath 'assets/javascripts/templates'
environment.appendPath 'components'

#db = redis.createClient()
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

# Pages
app.get '/', minotaur.index
app.get '/keyspace', minotaur.keyspace
app.get '/state', minotaur.state_page
app.get '/monitor', monitor.monitor

# API
app.get '/keys', minotaur.keys
app.get '/value/:key', minotaur.value
app.get '/state/:manager', minotaur.state

# Misc
app.use '/assets/', Mincer.createServer environment
app.get '/tests', main.tests
app.get '/test', main.test

app.listen 3000