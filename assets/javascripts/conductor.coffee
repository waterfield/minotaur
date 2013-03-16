class Conductor extends Presenter
  constructor: ->
    searchP = new SearchPresenter
    keysP = new KeysPresenter
    sourcesP = new SourcesPresenter
    targetsP = new TargetsPresenter
    valueP = new ValuePresenter

    update_keys = (e) =>
      keysP.search e
      $.ajax url: "/value/#{e}", success: (data) =>
        sourcesP.value data.sources
        targetsP.value data.targets
        valueP.value data.value

    searchP.on 'search', (e) => keysP.search e; sourcesP.clear(); targetsP.clear()
    keysP.on 'detail', (e) => update_keys e
    sourcesP.on 'detail', (e) => update_keys e
    targetsP.on 'detail', (e) => update_keys e