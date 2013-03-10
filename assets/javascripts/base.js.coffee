class Presenter
  _.extend @::, Backbone.Events
  Backbone.Collection.prototype.toJSON = ->
    @map (model) -> model.toJSON()
  retrigger: (args...) =>
    @trigger args...
  bind_events: ->

class ItemView extends Backbone.View
  render: (data, template) ->
    @$el.html Handlebars.compile($(template).html()) data
    @
    
class ItemPresenter extends Presenter
  render: (data, template) ->
    @view.render data, template
    $(@id).append @view.el
    @
  remove: ->
    @model.destroy()
    @view.remove()

class ListView extends Backbone.View
  render: (data, template) ->
    @$el.html Handlebars.compile($(template).html()) data
    @

class ListPresenter extends Presenter
  constructor: (@collection, @view, @id) ->
    @collection.on 'add', @add
    @collection.on 'reset', @addAll
    @render()
  addAll: =>
    @collection.each @add
  render: ->
    $(@id).html @view.el
    @