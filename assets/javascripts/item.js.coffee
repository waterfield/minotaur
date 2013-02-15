class ItemView extends Backbone.View
	render: (data, template) ->
		@$el.html JST[template] data
		this
		
class ItemPresenter
	render: (data, template) ->
		@view.render data, template
		$(@id).append @view.el
		this
	remove: ->
		@model.destroy()
		@view.remove()