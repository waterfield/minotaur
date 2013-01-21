class ValueView extends Backbone.View
	events:
		'click li': 'click'
	render: (data) =>
		@$el.html JST['templates/value'] value: data.value
		this
	click: (event) ->
		console.log event
		event.stopPropagation()
		@trigger 'click', event.currentTarget

class ValuePresenter
	constructor: (@data, @view) ->
		@view.on 'click', @click
		@render()
	render: =>
		@view.render @data
		$('#value-container').html @view.el
		this
	click: (target) ->
		if $(target).hasClass 'closed'
			$(target).removeClass 'closed'
		else
			$(target).addClass 'closed'