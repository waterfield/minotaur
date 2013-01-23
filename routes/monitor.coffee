redis = require 'redis'

# Pages
exports.monitor = (req, res) ->
  res.render 'monitor'