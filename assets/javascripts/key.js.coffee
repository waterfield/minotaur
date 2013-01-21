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
		@view.on 'mouseover', @mouseover
		@view.on 'mouseout', @mouseout
		@render {key: @model.get 'name'}, 'templates/key'
	click: (target) =>
		$('#key-list .active').removeClass 'active'
		$(target).addClass 'active'
		$.ajax
			url: '/value/' + @model.get 'name'
			dataType: 'json'
			success: (data) =>
				valueView = new ValueView().render {}, 'templates/value'
				valuePresenter = new ValuePresenter data, valueView
				sources = new Keys
				targets = new Keys
				sourcesView = new SourcesView().render size: sources.size(), 'templates/sources'
				targetsView = new SourcesView().render size: targets.size(), 'templates/targets'
				sourcesPresenter = new SourcesPresenter sources, sourcesView, '#sources-container'
				targetsPresenter = new TargetsPresenter targets, targetsView, '#targets-container'
				for obj in data.sources
					sources.add(@model.collection.where name: obj.name) if @model.collection
				for obj in data.targets
					targets.add(@model.collection.where name: obj.name) if @model.collection
				sourcesView.set_size sources.size()
				targetsView.set_size targets.size()

	mouseover: =>
		@view.$el.addClass 'key-hover'
	mouseout: =>
		@view.$el.removeClass 'key-hover'

class KeysPresenter extends ListPresenter
	add: (model) =>
		view = new KeyView
		presenter = new KeyPresenter model, view, '#key-list'