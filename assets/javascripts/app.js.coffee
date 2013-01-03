#= require vendor/jquery-1.8.3
#= require vendor/underscore
#= require vendor/backbone
#= require vendor/bootstrap
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./presenters
#= require_tree ./routers

$ ->
	router = new Router()
	router.start()