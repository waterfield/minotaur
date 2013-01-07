#= require jquery/jquery.min
#= require underscore/underscore-min
#= require backbone/backbone-min
# require requirejs/require
#= require jade/runtime
#= require chai/chai
#= require_tree ./templates
#= require item
#= require list
#= require value
#= require source
#= require target
#= require key
#= require router

$ ->
	router = new Router()
	router.start()