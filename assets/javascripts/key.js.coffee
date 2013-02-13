class Key extends Backbone.Model
	args: ->
		@_args ?= for arg in @get('name').split(':')
			val = parseInt arg
			if val == val then val else arg
			
class Keys extends Backbone.Collection
	model: Key
	url: '/keys'
	
	comparator: (x, y) ->
		x = x.args()
		y = y.args()
		for x_, i in x
			y_ = y[i]
			return -1 if x_ < y_
			return 1 if x_ > y_
		return 0

class KeyView extends ItemView
	tagName: 'li'
	className: 'key'
	events:
		'click': 'click'
		'mouseover': 'mouseover'
		'mouseout': 'mouseout'
	click: (event) ->
		event.stopPropagation()
		@trigger 'click', event.target
	mouseover: ->
		@trigger 'mouseover'
	mouseout: ->
		@trigger 'mouseout'

class KeysView extends ListView
	set_size: (value) ->
		@$('.size')[0].innerHTML = value

class KeyPresenter extends ItemPresenter
	constructor: (@model, @view, @id) ->
		@view.on 'click', @click
		@model.collection.on 'reset', @reset
		@render {key: @model.get 'name'}, 'templates/key'
	click: (target) =>
		$('#key-list .active').removeClass 'active'
		$(target).addClass 'active'
		$.ajax
			url: '/value/' + @model.get 'name'
			dataType: 'json'
			success: (data) =>
	reset: =>
		@model.destroy()
		@view.remove()

class KeysPresenter extends ListPresenter
	add: (model) =>
		view = new KeyView model
		presenter = new KeyPresenter model, view, '#key-list'