class SourceView extends ListView
	tagName: 'li'
	className: 'key'
	events:
		'click': 'click'
	click: ->
		@trigger 'click'