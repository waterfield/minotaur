class Source extends Backbone.Model
class Sources extends Backbone.Collection
  model: Source

class SourcesPresenter extends Presenter
  constructor: ->
    @collection = new Sources
    @view = new SourcesView el: '#sources-container'
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

class SourcesView extends Backbone.View
  events:
    'click li': 'click'
  render: (keys, size) ->
    @$el.html Handlebars.compile($('#sources-template').html()) keys: keys, size: size
    @
  set_size: (value) =>
    @$('.size')[0].innerHTML = value
  click: (e) ->
    @trigger 'detail', $(e.currentTarget).data('id')