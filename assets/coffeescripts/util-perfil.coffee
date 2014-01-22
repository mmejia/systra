window.cargarComandancias=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/comandancias.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.comandancias=collection
			fn()
window.cargarDelegaciones= (fn)-> 
	$.ajax
		type : 'GET'
		url : "/catalogos/delegaciones.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.delegaciones= collection
			fn()
window.cargarTurnos= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/turnos.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.turnos= collection
			fn()