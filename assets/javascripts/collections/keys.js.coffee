class Keys extends Backbone.Collection
	model: Key
	url: '/keys'
	
	comparator: (x, y) ->
		x = x.args()
		y = y.args()
		for x_, i in x
			y_ = y[i]
			return -1 if x_ < y_
			return 1 if x_ > y_
		return 0