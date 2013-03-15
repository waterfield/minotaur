class Conductor extends Presenter
  constructor: ->
    searchP = new SearchPresenter
    keysP = new KeysPresenter
    sourcesP = new SourcesPresenter
    targetsP = new TargetsPresenter
    #valueP = new ValuePresenter

    searchP.on 'search', (e) => keysP.search e
    keysP.on 'detail', (e) =>
      # console.log "#{e}"
      $.ajax url: "/value/#{e}", success: (data) =>
        # console.log data
        sourcesP.value data.sources
        targetsP.value data.targets
        valueP.value data.value