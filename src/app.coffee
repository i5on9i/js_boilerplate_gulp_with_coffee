unless namespace
	namespace = (target, name, block) ->
		[target, name, block] = [(if typeof exports isnt "undefined" then exports else window), arguments...] if arguments.length < 3
		top = target
		target = target[item] or= {} for item in name.split '.'
		block target, top


###
	Class Test
###
class Test
	contructor : ->

	do: ()->
		console.log(this)
		page = require('webpage').create()
		page.open 'http://example.com', (status) ->
			console.log 'Status: ' + status
			if status == 'success'
				page.render 'example.png'
			phantom.exit()
			return

###
  ------------------------------------------------------------------------

  Namespace

  ------------------------------------------------------------------------
###
namespace 'snaver', (exports) ->
	exports.Test = Test
	

do ()->
	t = new snaver.Test()
	t.do()