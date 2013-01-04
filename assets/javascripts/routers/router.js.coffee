class Router extends Backbone.Router
	routes:
		'keyspace': 'keyspace'
	initialize: ->
	keyspace: ->
		keys = new Keys

		keysView = new KeysView().render size: '0', 'keys'
		sourcesView = new SourcesView().render size: '0', 'sources'
		targetsView = new SourcesView().render size: '0', 'targets'
		valueView = new ValueView().render {}, 'value'

		keysPresenter = new KeysPresenter keys, keysView, '#keys-container'
		sourcesPresenter = new SourcesPresenter new Keys, sourcesView, '#sources-container'
		targetsPresenter = new TargetsPresenter new Keys, targetsView, '#targets-container'
		valuePresenter = new ValuePresenter {}, valueView

		keys.fetch
			success: ->
				#keysView.render size: keys.size(), 'keys'
	start: ->
		Backbone.history.start pushState: true