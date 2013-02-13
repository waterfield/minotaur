class SourceView extends ListView
  tagName: 'li'
  className: 'key'
  events:
    'click': 'click'
  click: (event) ->
    @trigger 'click', event.target

class SourcesView extends ListView
  set_size: (value) ->
    @$('.size')[0].innerHTML = value

class SourcePresenter extends ItemPresenter
  constructor: (@model, @view, @id) ->
    @view.on 'click', @click
    @render {key: @model.get 'name'}, 'templates/source'
  click: (target) =>
    $.ajax
      url: '/value/' + @model.get 'name'
      dataType: 'json'
      success: (data) =>
        update_key_lists @model, data

class SourcesPresenter extends ListPresenter
  add: (model) ->
    view = new SourceView
    presenter = new SourcePresenter model, view, '#source-list'