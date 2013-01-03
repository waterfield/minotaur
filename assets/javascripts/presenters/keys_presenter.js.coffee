class KeysPresenter extends ListPresenter
	add: (model) ->
		view = new KeyView
		presenter = new KeyPresenter model, view, '#key-list'