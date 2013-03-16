class Target extends Backbone.Model
class Targets extends Backbone.Collection
  model: Target

class TargetsPresenter extends Presenter
  constructor: ->
    @collection = new Targets
    @view = new TargetsView el: '#targets-container'
    @display null, 0
    @collection.on 'reset', =>
      @display @collection.toJSON(), @collection.size()
    @view.on 'detail', (e) =>
      @trigger 'detail', e
  display: (keys, size) ->
    @view.render keys, size
  value: (value) =>
    @collection.reset value
  clear: =>
    @collection.reset

class TargetsView extends Backbone.View
  events:
    "click li": "click"
  render: (keys, size) ->
    @$el.html Handlebars.compile($('#targets-template').html()) keys: keys, size: size
    @
  set_size: (value) =>
    @$('.size')[0].innerHTML = value
  click: (e) ->
    @trigger 'detail', $(e.currentTarget).data('id')