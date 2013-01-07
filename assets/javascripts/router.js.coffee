class Router extends Backbone.Router
	routes:
		'keyspace': 'keyspace'
	keyspace: ->
		keys = new Keys

		keysView = new KeysView().render size: '0', 'templates/keys'
		sourcesView = new SourcesView().render size: '0', 'templates/sources'
		targetsView = new SourcesView().render size: '0', 'templates/targets'
		valueView = new ValueView().render {}, 'templates/value'

		keysPresenter = new KeysPresenter keys, keysView, '#keys-container'
		sourcesPresenter = new SourcesPresenter new Keys, sourcesView, '#sources-container'
		targetsPresenter = new TargetsPresenter new Keys, targetsView, '#targets-container'
		valuePresenter = new ValuePresenter {}, valueView

		keys.fetch
			success: ->
				keysView.set_size keys.size()

	start: ->
		Backbone.history.start pushState: true