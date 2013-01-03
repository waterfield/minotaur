class KeyView extends Backbone.View
	tagName: "li"
	className: "key"
	events:
		"click": "value"
		"mouseover": "mouseover"
		"mouseout": "mouseout"
	render: (data) =>
		@$el.html JST['key'] key: data
		this
	value: ->
		@trigger "value"
	mouseover: ->
		@trigger "mouseover"
	mouseout: ->
		@trigger "mouseout"