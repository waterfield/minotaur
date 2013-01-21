class ValueView extends Backbone.View
	events:
		'click li': 'click'
	render: (data) =>
		@$el.html JST['templates/value'] value: data.value
		this
	click: (event) ->
		event.stopPropagation()
		@trigger 'click', event.target

class ValuePresenter
	constructor: (@data, @view) ->
		@view.on 'click', @click
		@render()
	render: =>
		@view.render @data
		$('#value-container').html @view.el
		this
	click: (target) ->
		console.log $(target)
		if $(target).hasClass 'closed'
			$(target).removeClass 'closed'
		else
			$(target).addClass 'closed'