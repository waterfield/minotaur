redis = require 'redis'
$ = require 'jquery'
_ = require 'underscore'
msgpack = require 'msgpack'
async = require 'async'

db = redis.createClient(6379, "localhost", detect_buffers: true)

exports.index = (req, res) ->
	res.render 'index'

exports.keys = (req, res) ->
	db.keys '*', (error, keys) ->
		if error
			res.send []
		else
			key_list = []
			for key in keys
				prefix = key.split(':')[0]
				key_list.push {'name': key} unless prefix == 'sources' || prefix == 'lock' || prefix == 'targets' || prefix == 'heartbeat' || prefix == 'task'	
			res.send key_list
			# db.mget keys, (err, values) ->
			# 	if err
			# 		res.send []
			# 	else
					# prefixes = {}
					# for key in keys
					# 	prefix = key.split(':')[0]
					# 	prefixes[prefix] = true unless prefix == 'sources' || prefix == 'lock' || prefix == 'targets' || prefix == 'heartbeat' || prefix == 'task'
					# prefix_list = _.keys prefixes
					# prefix_list.sort()
					# prefix_list_json = []
					# for prefix in prefix_list
					# 	prefix_list_json.push {'name':prefix}
					# prefix_json = {'prefixes':prefix_list_json}
					# res.send values

exports.value = (req, res) ->
	async.parallel {
		value: (callback) ->
			db.get new Buffer(req.params.key), (err, value) ->
				new_value = msgpack.unpack value
				callback null, new_value
		sources: (callback) ->
			db.smembers "sources:#{req.params.key}", (err, sources) ->
				sources_list = []
				for key in sources
					sources_list.push {"name":key}
				callback null, sources_list
		targets: (callback) ->
			db.smembers "targets:#{req.params.key}", (err, targets) ->
				targets_list = []
				for key in targets
					targets_list.push {"name":key}
				callback null, targets_list
		}, (err, results) ->
				res.send results

exports.state = (req, res) ->
	res.send {}