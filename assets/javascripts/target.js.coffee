class TargetsPresenter extends ListPresenter
	add: (model) ->
		view = new SourceView
		presenter = new SourcePresenter model, view, '#target-list'