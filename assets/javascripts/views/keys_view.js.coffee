class KeysView extends Backbone.View
	initialize: ->
		@render()
	render: ->
		@$el.html JST['keys']
		this