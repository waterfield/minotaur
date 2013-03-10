class Conductor extends Presenter
  constructor: ->
    searchP = new SearchPresenter
    keysP = new KeysPresenter

    searchP.on 'search', (e) => keysP.search e