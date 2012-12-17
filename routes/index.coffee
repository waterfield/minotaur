exports.index = (req, res) ->
	res.render 'index'

exports.keys = (req, res) ->
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
						prefixes.push(split[0]) unless $.inArray(split[0], prefixes) != -1 || split[0] == 'sources' || split[0] == 'lock' || split[0] == 'targets' || split[0] == 'heartbeat' || split[0] == 'task'
					prefixes.sort()
					res.send prefixes

exports.keys.prefix = (req, res) ->
	db.keys "#{req.params.prefix}*", (error, keys) ->
		if error
			res.send []
		else
			res.send keys