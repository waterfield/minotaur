class ItemView extends Backbone.View
	initialize: ->
	render: (data, template) ->
		@$el.html JST[template] data
		this