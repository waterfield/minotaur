express = require 'express'
Mincer = require 'mincer'
redis = require 'redis'
redeye = require 'redeye'
$ = require 'jquery'

environment = new Mincer.Environment()
environment.appendPath 'assets/javascripts'
environment.appendPath 'assets/stylesheets'

db = redis.createClient()
app = express()

manager = new redeye.Manager verbose: true, flush: true

manager.worker 'a', -> @each i:[1..4], @b
manager.worker 'b', 'i', -> @each i:[@i*5-4..(@i*5)], @c
manager.worker 'c', 'i', -> @d i: Math.floor(@i/4)
manager.worker 'd', 'i', -> @e()
manager.worker 'e', -> 'ok'

manager.run()
setTimeout (-> manager.request 'a'), 100

app.get '/', (req, res) ->
	res.send 'hello world'

app.get '/keys', (req, res) ->
	db.keys '*', (error, keys) ->
		if error
			res.send []
		else
			db.mget keys, (err, values) ->
				if err
					res.send []
				else
					prefixes = []
					for key, i in keys
						split = key.split(':')
						prefixes.push(split[0]) unless $.inArray(split[0], prefixes) != -1 || split[0] == 'sources' || split[0] == 'lock' || split[0] == 'targets' || split[0] == 'heartbeat' || split[0] == 'tasks'
					prefixes.sort()
					res.send prefixes

app.use '/assets/', Mincer.createServer environment

app.listen 3000