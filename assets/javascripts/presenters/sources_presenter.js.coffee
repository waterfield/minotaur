class SourcesPresenter extends ListPresenter
	add: (model) ->
		view = new SourceView
		presenter = new SourcePresenter model, view, '#source-list'