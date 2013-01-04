class SourcePresenter extends ItemPresenter
	constructor: (@model, @view, @id) ->
		@view.on 'click', @click
		@render {key: @model.get 'name'}, 'source'
	click: =>
		$.ajax
			url: '/value/' + @model.get 'name'
			dataType: 'json'
			success: (data) =>
				valueView = new ValueView
				valuePresenter = new ValuePresenter data, valueView
				sources = new Keys
				targets = new Keys
				sourcesView = new SourcesView().render({}, 'sources')
				sourcesPresenter = new SourcesPresenter sources, sourcesView, '#sources-container'
				targetsView = new SourcesView().render({}, 'targets')
				targetsPresenter = new TargetsPresenter targets, targetsView, '#targets-container'
				for obj in data.sources
					sources.add(@model.collection.where name: obj.name) if @model.collection
				for obj in data.targets
					targets.add(@model.collection.where name: obj.name) if @model.collection