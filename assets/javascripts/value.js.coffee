class ValueView extends Backbone.View
	events:
		'click li': 'click'
	render: (data) =>
		@$el.html JST['templates/value'] html: data
		this
	click: (event) ->
		event.stopPropagation()
		@trigger 'click', event.currentTarget

class ValuePresenter
	constructor: (@data, @view) ->
		@view.on 'click', @click
		unless @data.value == undefined then @data_html = json_to_tree @data.value
		@render()
	render: =>
		@view.render @data_html
		$('#value-container').html @view.el
		this
	click: (target) ->
		if $(target).hasClass 'closed'
			$(target).removeClass 'closed'
		else
			$(target).addClass 'closed'