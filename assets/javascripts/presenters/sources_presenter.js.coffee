class SourcesPresenter
	constructor: (@data, @view) ->
		@render()
	render: ->
		@view.render @data
		$('#sources-container').html @view.el
		this