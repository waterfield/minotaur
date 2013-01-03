class KeysPresenter
	constructor: (@collection, @view, @id) ->
		@collection.on "add", @add, this
		@collection.on "reset", @addAll, this
		@render()
	add: (model) ->
		view = new KeyView()
		presenter = new KeyPresenter model, view, '#key-list'
	addAll: ->
		@collection.each @add
	render: ->
		$(@id).html @view.el
		this