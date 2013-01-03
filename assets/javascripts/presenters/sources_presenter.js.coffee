class SourcesPresenter extends ListPresenter
	add: (model) ->
		console.log model
		view = new SourceView
		presenter = new SourcePresenter model, view, '#source-list'