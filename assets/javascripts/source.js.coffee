class Source extends Backbone.Model
class Sources extends Backbone.Collection
  model: Source

class SourcesPresenter extends Presenter
  constructor: ->
    @sources = new Sources
    @view = new SourcesView el: '#sources-container'
    @display null, 0
    @sources.on 'reset', =>
      @display @sources.toJSON(), @sources.size()
  display: (keys, size) ->
    @view.render keys, size
  value: (value) ->

class SourcesView extends Backbone.View
  events:
    "click li": "click"
  render: (keys, size) ->
    @$el.html Handlebars.compile($('#sources-template').html()) size: size, keys: keys
    @
  set_size: (value) =>
    @$('.size')[0].innerHTML = value
  click: (e) ->
    console.log "source click"