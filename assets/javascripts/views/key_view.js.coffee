class KeyView extends ItemView
	tagName: 'li'
	className: 'key'
	events:
		'click': 'click'
		'mouseover': 'mouseover'
		'mouseout': 'mouseout'
	click: ->
		@trigger 'click'
	mouseover: ->
		@trigger 'mouseover'
	mouseout: ->
		@trigger 'mouseout'