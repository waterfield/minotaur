{ assert } = chai
describe 'Presenters', ->

	describe 'ItemPresenter', ->
		it 'should destroy model on "remove" event', ->
			view = new EventEmitter2
			view.remove = ->
			model = new Key
			sinon.spy model, 'destroy'
			presenter = new ItemPresenter model, view, ''
			view.emit 'remove'
			assert.equal model.destroy.called, true

	describe 'KeyPresenter', ->
		before ->
			@server = sinon.fakeServer.create()
			@view = new EventEmitter2
			@view.render = ->
			@model = sinon.stub(new Key)

		after ->
			@server.restore()

		it 'should create ajax request', ->
			@server.respondWith 'GET', '/value/a', [200, {"Content-Type": "application/json"}, '{"value": 4, "sources":[], "targets":[]}']
			@model.get.returns {"name": 'a'}
			sinon.spy($, 'ajax')
			presenter = new KeyPresenter model, view, ''
			@view.emit 'click'
			@server.respond()
			assert.equal $.ajax.called, true
			
		it 'should change class on "mouseover" event'

		it 'should change class on "mouseout" event'