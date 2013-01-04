class ValueView extends Backbone.View
	render: (data) =>
		@$el.html JST['value'] value: data.value
		this