window.validateUnidad=(dato)->
	if !window.tbUnidades2008
		cargarTbUnidades2008 this.validateUnidad(dato)
	else
		unidades= window.tbUnidades2008
		for unidad in unidades
			comp= unidad.no_unidad
			if dato==comp
				return{ 
					res:true
					msg:""
				}
		
		{
			res:false
			msg:"No se localizo la unidad que intervino"
		}
window.validateAgente=(dato)->
	if !window.catAgentes
		cargarCatAgentes this.llenarAgentes(dato)
	else
		agentes= window.catAgentes
		for agente in agentes
			comp= agente.num_cobro
			if dato==comp
				return{
					res:true
					msg:""					
				} 
		
		{
			res:false
			msg:"No se localizo al Agente que intervino"
		}

window.validateCalle=(dato)->
	if !window.calles
		cargarCalles this.validateCalle(dato)
	else
		calles= window.calles
		for calle in calles
			if dato==calle.calle
				return {
					res:true
					msg:""
				}
		{
			res:false
			msg:"No se localizo la calle, selecciona una valida"
		}

window.validateColonia=(dato)->
	if !window.colonias
		cargarColonias this.validateColonia(dato)
	else
		colonias= window.colonias
		for colonia in colonias
			if dato==colonia.nombre
				return{
					res:true
					msg:""
				}
		{
		res:false
		msg:"No se localizo la colonia, selecciona una valida"
		}
		 
window.validateInt=(valor,min=0,max=Number.MAX_VALUE)->
	if $.isNumeric(valor)
		return {
			res:true
			msg:""
		}
	else
		return {
			res:false
			msg:"El valor no es numerico"
		}
	if valor < min and valor > max
		return {
			res:false
			msg:"Debes de estar el valor entre " + min + y " " + max
		}
	else
		return {
			res:true
			msg:""
		}

window.actualizarComandanciaValor=(valor)->
	col=[]
	for comandancia in window.comandancias
		if comandancia.delegacion == valor
			col.push(comandancia)
	window.actualizarSelectComandancia(col)
	return

window.actualizarComandancia=()->
	console.log window.comandancias
	if !window.comandancias
		window.cargarComandancias window.actualizarComandancia
	else
		col=[]
		valor =$("#delegacion_pre option:first").val()
		for comandancia in window.comandancias
			if comandancia.delegacion == valor
				col.push(comandancia)
		window.actualizarSelectComandancia(col)
	return
window.actualizarSelectComandancia=(comandancias)->
	ctl_comandancia= $('#comandancia_pre')
	ctl_comandancia.html('')
	opciones='<option  value="NO">**SELECCIONAR**</option>'
	for comandancia in comandancias
		opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
	ctl_comandancia.append(opciones)
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
window.cargarProfiles= (fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/listProfile.json'
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.profiles= collection
			fn()
			return
