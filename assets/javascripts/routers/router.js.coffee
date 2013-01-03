class Router extends Backbone.Router
	routes:
		"": "index"
	initialize: ->
	index: ->
		keys = new Keys
		keys.fetch()
		keysView = new KeysView null, 'keys'
		keysPresenter = new KeysPresenter keys, keysView, "#keys-container"
	start: ->
		Backbone.history.start pushState: true