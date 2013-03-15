class SearchPresenter extends Presenter
  constructor: ->
    @view = new SearchView el: "#search-container"
    @display()
    @view.on 'search', (e) => @trigger 'search', e
  display: ->
    @view.render()

class SearchView extends Backbone.View
  events:
    "click #search": "click"
  render: ->
    @$el.html $('#search-template').html()
    @
  click: ->
    @trigger 'search', @$('#search-data').val()