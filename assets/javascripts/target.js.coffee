class TargetPresenter extends ItemPresenter
	constructor: (@model, @view, @id) ->
		@render {key: @model.get 'name'}, 'templates/target'

class TargetsPresenter extends ListPresenter
	add: (model) ->
		view = new SourceView
		presenter = new SourcePresenter model, view, '#target-list'