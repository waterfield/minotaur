#= require vendor/jquery-1.8.3
#= require vendor/underscore
#= require vendor/backbone
#= require index
$ ->
	$("#hello").html JST["index"] name:"Foo"