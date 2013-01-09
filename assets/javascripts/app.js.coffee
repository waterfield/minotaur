#= require jquery/jquery
#= require underscore/underscore
#= require backbone/backbone
#= require bootstrap/docs/assets/js/bootstrap
#= require jade/runtime
#= require chai/chai
#= require_tree templates
#= require item
#= require list
#= require key
#= require source
#= require target
#= require value
#= require router

$ ->
		router = new Router()
		router.start()