class ItemPresenter
	constructor: (@model, @view, @id) ->
		@view.on 'remove', @remove
	render: (data, template) ->
		@view.render data, template
		$(@id).append @view.el
		this
	remove: ->
		@model.destroy()
		@view.remove()

