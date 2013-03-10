class SearchPresenter extends Presenter
  constructor: ->
    @view = new SearchView
    @display()
    @view.on 'search', (e) => @trigger 'search', e
  display: ->
    @view.render()

class SearchView extends Backbone.View
  events:
    "click #search": "click"
  render: ->
    @$el.html $('#search-template').html()
    $('#search-container').html @el
    @
  click: ->
    @trigger 'search', @$('#search-data').val()