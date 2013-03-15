class Key extends Backbone.Model
  args: ->
    @_args ?= for arg in @get('name').split(':')
      val = parseInt arg
      if val == val then val else arg
      
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

class KeysPresenter extends Presenter
  constructor: ->
    @keys = new Keys
    @view = new KeysView el: '#keys-container'
    @display null, 0
    @keys.on 'reset', => @display @keys.toJSON(), @keys.size()
    @view.on 'detail', (e) => @trigger 'detail', e
  display: (keys, size) ->
    @view.render keys, size
  search: (value) =>
    @keys.fetch data: pattern: value

class KeysView extends Backbone.View
  events:
    "click li": "click"
  render: (keys, size) ->
    @$el.html Handlebars.compile($('#keys-template').html()) size: size, keys: keys
    @
  set_size: (value) =>
    @$('.size')[0].innerHTML = value
  click: (e) ->
    @trigger 'detail', $(e.currentTarget).data('id')