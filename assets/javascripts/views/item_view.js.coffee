class ItemView extends Backbone.View
	render: (data, template) ->
		@$el.html JST[template] data
		this