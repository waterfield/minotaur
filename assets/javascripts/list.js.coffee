class ListView extends Backbone.View
  render: (data, template) ->
    @$el.html JST[template] data
    this

class ListPresenter
  constructor: (@collection, @view, @id) ->
    @collection.on 'add', @add
    @collection.on 'reset', @addAll
    @render()
  addAll: =>
    console.log "Reset"
    @collection.each @add
  render: ->
    $(@id).html @view.el
    this