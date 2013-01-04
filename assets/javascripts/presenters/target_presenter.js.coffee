class TargetPresenter extends ItemPresenter
	constructor: (@model, @view, @id) ->
		@render {key: @model.get 'name'}, 'target'