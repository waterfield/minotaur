class ListPresenter
	constructor: (@collection, @view, @id) ->
		@collection.on 'add', @add, this
		@collection.on 'reset', @addAll, this
		@render()
	addAll: ->
		@collection.each @add
	render: ->
		$(@id).html @view.el
		this