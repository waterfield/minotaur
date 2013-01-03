class KeyPresenter
	constructor: (@model, @view, @id) ->
		@view.on 'remove', @remove
		@view.on 'value', @value
		@view.on 'mouseover', @mouseover
		@view.on 'mouseout', @mouseout
		@render()
	render: ->
		@view.render @model.get 'name'
		$(@id).append @view.el
		this
	remove: ->
		@model.destroy()
		@view.remove()
	value: =>
		$.ajax
			url: '/value/' + @model.get 'name'
			dataType: 'json'
			success: (data) ->
				valueView = new ValueView
				sourcesView = new SourcesView
				valuePresenter = new ValuePresenter data, valueView
				sourcesPresenter = new SourcePresenter data, sourcesView
	mouseover: =>
		console.log 'mouseover'
		console.log @view.el
		@view.$el.addClass 'key-hover'
	mouseout: =>
		console.log 'mouseout'
		@view.$el.removeClass 'key-hover'
