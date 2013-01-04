#= require vendor/jquery-1.8.3
#= require vendor/underscore
#= require vendor/backbone
#= require vendor/bootstrap
#= require vendor/jade_runtime
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require ./views/item_view
#= require ./views/list_view
#= require_tree ./views
#= require ./presenters/item_presenter
#= require ./presenters/list_presenter
#= require_tree ./presenters
#= require_tree ./routers

$ ->
	router = new Router()
	router.start()