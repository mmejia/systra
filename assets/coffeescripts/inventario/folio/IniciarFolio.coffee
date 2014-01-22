define [
	'/static/javascripts/core/sandbox.js'
	],(sandbox)->
		IniciarLibera=
			iniciar:()->
				$('#cal-folios a').click (event)-> 
					event.preventDefault()
					$(this).tab('show')
					return
				
				