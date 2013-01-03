class ListView extends Backbone.View
	initialize: (data, template) ->
		@render(data, template)
	render: (data, template) ->
		@$el.html JST[template] data
		this