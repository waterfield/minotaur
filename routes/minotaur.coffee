redis = require 'redis'
msgpack = require 'msgpack'
async = require 'async'

db = redis.createClient(6379, 'localhost', detect_buffers: true)

# Pages
exports.index = (req, res) ->
  res.render 'index'

exports.keyspace = (req, res) ->
  res.render 'keyspace'

exports.state_page = (req, res) ->
  res.render 'state'

# API
exports.keys = (req, res) ->
  console.log req.param('pattern')
  db.keys req.param('pattern'), (error, keys) ->
    if error
      res.send []
    else
      key_list = []
      for key in keys
        prefix = key.split(':')[0]
        key_list.push {'name': key} unless prefix == 'sources' || prefix == 'lock' || prefix == 'targets' || prefix == 'heartbeat' || prefix == 'task'  
      res.send key_list

exports.value = (req, res) ->
  async.parallel {
    value: (callback) ->
      db.get new Buffer(req.params.key), (err, value) ->
        if err
          res.send []
        else
          new_value = msgpack.unpack value
          callback null, new_value
    sources: (callback) ->
      db.smembers "sources:#{req.params.key}", (err, sources) ->
        if err
          res.send []
        else
          sources_list = []
          for key in sources
            sources_list.push {'name':key}
          callback null, sources_list
    targets: (callback) ->
      db.smembers "targets:#{req.params.key}", (err, targets) ->
        if err
          res.send []
        else
          targets_list = []
          for key in targets
            targets_list.push {'name':key}
          callback null, targets_list
    }, (err, results) ->
        res.send results
        
exports.state = (req, res) ->
  res.send []