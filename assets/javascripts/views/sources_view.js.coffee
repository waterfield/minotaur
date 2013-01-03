class SourcesView extends Backbone.View
	initialize: ->
	tagName: 'ul'
	render: ->
		@$el.html JST['sources'] value: data.value, sources: data.sources.length, targets: data.targets.length
		this