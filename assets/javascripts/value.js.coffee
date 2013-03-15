class ValuePresenter extends Presenter
	constructor: ->
		@view = new ValueView el: 
		@view.on 'click', @click
		unless @data.value == undefined then @data_html = json_to_tree @data.value
		@render()
	render: =>
		@view.render @data_html
		$('#value-container').html @view.el
		@
	click: (target) ->
		if $(target).hasClass 'closed'
			$(target).removeClass 'closed'
		else
			$(target).addClass 'closed'

class ValueView extends Backbone.View
	events:
		'click li': 'click'
	render: (data) =>
		@$el.html Handlebars.compile($('#value-template').html()) html: data
		@
	click: (event) ->
		event.stopPropagation()
		@trigger 'click', event.currentTarget