window.actualizarComandanciaValor=(valor)->
	col=[]
	valor =$("#bus_delegacion option:first").val()
	for comandancia in window.comandancias
		if comandancia.delegacion == valor
			col.push(comandancia)
	window.actualizarSelectComandancia(col)
	return
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
window.actualizarComandancia=()->
	if !window.comandancias
		window.cargarComandancias window.actualizarComandancia
	else
		col=[]
		valor =$("#bus_delegacion option:first").val()
		for comandancia in window.comandancias
			if comandancia.delegacion == valor
				col.push(comandancia)
		window.actualizarSelectComandancia(col)
	return

window.actualizarSelectComandancia=(comandancias)->
	ctl_comandancia= $('#bus_comandancia')
	ctl_comandancia.html('')
	opciones=''
	for comandancia in comandancias
		opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
	ctl_comandancia.append(opciones)
	return
window.cargarDelegaciones=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/delegaciones.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.delegaciones=collection
			fn()