class Key extends Backbone.Model
	args: ->
		@_args ?= for arg in @get('name').split(':')
			val = parseInt arg
			if val == val then val else arg