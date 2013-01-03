class ValueView extends Backbone.View
	initialize: ->
	tagName: "ul"
	render: (data) =>
		@$el.html JST['value'] value: data.value, sources: data.sources.length, targets: data.targets.length
		this