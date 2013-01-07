class SourceView extends ListView
	tagName: 'li'
	className: 'key'
	events:
		'click': 'click'
	click: ->
		@trigger 'click'

class SourcesView extends ListView
	set_size: (value) ->
		@$('.size')[0].innerHTML = value

class SourcePresenter extends ItemPresenter
	constructor: (@model, @view, @id) ->
		@view.on 'click', @click
		@render {key: @model.get 'name'}, 'templates/source'
	click: =>
		$.ajax
			url: '/value/' + @model.get 'name'
			dataType: 'json'
			success: (data) =>
				valueView = new ValueView
				valuePresenter = new ValuePresenter data, valueView
				sources = new Keys
				targets = new Keys
				sourcesView = new SourcesView().render size: "0", 'templates/sources'
				sourcesPresenter = new SourcesPresenter sources, sourcesView, '#sources-container'
				targetsView = new SourcesView().render size: "0", 'templates/targets'
				targetsPresenter = new TargetsPresenter targets, targetsView, '#targets-container'
				for obj in data.sources
					sources.add(@model.collection.where name: obj.name) if @model.collection
				for obj in data.targets
					targets.add(@model.collection.where name: obj.name) if @model.collection
				sourcesView.set_size sources.size()
				targetsView.set_size targets.size()

class SourcesPresenter extends ListPresenter
	add: (model) ->
		view = new SourceView
		presenter = new SourcePresenter model, view, '#source-list'