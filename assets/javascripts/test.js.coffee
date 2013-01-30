#= require jquery/jquery
#= require underscore/underscore
#= require backbone/backbone
#= require mocha/mocha
#= require chai/chai
#= require sinon/lib/sinon
#= require sinon/lib/sinon/spy
#= require sinon/lib/sinon/stub
#= require sinon/lib/sinon/util/fake_xml_http_request
#= require sinon/lib/sinon/util/fake_server
#= require eventemitter2/lib/eventemitter2
#= require setup_mocha
#= require_tree helpers
#= require item
#= require list
#= require key
#= require source
#= require target
#= require value
#= require router
#= require_tree test

$ ->
	mocha.run()