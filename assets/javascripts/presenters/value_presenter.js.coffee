class ValuePresenter
	constructor: (@data, @view) ->
		@render()
	render: =>
		@view.render @data
		$('#value-container').html @view.el
		this