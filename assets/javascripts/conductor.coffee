class Conductor extends Presenter
  constructor: ->
    searchP = new SearchPresenter
    keysP = new KeysPresenter
    sourcesP = new SourcesPresenter
    targetsP = new TargetsPresenter
    valueP = new ValuePresenter

    searchP.on 'search', (e) => keysP.search e
    keysP.on 'detail', (e) =>
      $.ajax url:"/value/#{value}",
        success: (data) =>
          sourcesP.value data.sources
          targetsP.value data.targets
          valueP.value data.value