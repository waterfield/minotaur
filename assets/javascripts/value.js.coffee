class Value extends Backbone.Model
class ValuePresenter extends Presenter
	constructor: ->
		@model = new Value
		@view = new ValueView el: '#value-container'
		@display ""
		@view.on 'click', @click
	display: (data) ->
		@view.render data
	click: (target) ->
		if $(target).hasClass 'closed'
			$(target).removeClass 'closed'
		else
			$(target).addClass 'closed'
	value: (data) =>
		@display data

class ValueView extends Backbone.View
	events:
		'click li': 'click'
	render: (data) ->
		@$el.html Handlebars.compile($('#value-template').html()) html: json_to_tree data
		@
	click: (event) ->
		event.stopPropagation()
		@trigger 'click', event.currentTarget