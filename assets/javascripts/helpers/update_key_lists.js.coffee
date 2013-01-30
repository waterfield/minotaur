update_key_lists = (model, data) ->
    sources = new Keys
    targets = new Keys

    sourcesView = new SourcesView().render size: sources.size(), 'templates/sources'
    targetsView = new SourcesView().render size: targets.size(), 'templates/targets'

    sourcesPresenter = new SourcesPresenter sources, sourcesView, '#sources-container'
    targetsPresenter = new TargetsPresenter targets, targetsView, '#targets-container'

    valueView = new ValueView().render {}, 'templates/value'
    valuePresenter = new ValuePresenter data, valueView

    for obj in data.sources
      sources.add(model.collection.where name: obj.name) if model.collection

    for obj in data.targets
      targets.add(model.collection.where name: obj.name) if model.collection

    sourcesView.set_size sources.size()
    targetsView.set_size targets.size()