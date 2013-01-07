class ValueView extends Backbone.View
	render: (data) =>
		@$el.html JST['templates/value'] value: data.value
		this
		
class ValuePresenter
	constructor: (@data, @view) ->
		@render()
	render: =>
		@view.render @data
		$('#value-container').html @view.el
		this