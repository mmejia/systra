window.validateSubMarca=(dato)->
	if !window.marcas
		cargarMarca this.validateMarca(dato)
	else
		marcas= window.marcas
		for marca in marcas
			if dato==marca.submarca
				return{
					res:true
					msg:""
				}
		{
		res:false
		msg:"No se localizo la submarca, selecciona una valida"
		}
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
		cargarCatAgentes this.validateAgentes(dato)
	else
		agentes= window.catAgentes
		for agente in agentes
			comp= agente.num_cobro + "--" + agente.nombre
			if dato==comp
				return{
					res:true
					msg:""					
				} 
		
		{
			res:false
			msg:"No se localizo al Agente que intervino"
		}
	
window.validateMarca=(dato)->
	if !window.marcas
		cargarMarca this.validateMarca(dato)
	else
		marcas= window.marcas
		for marca in marcas
			if dato==marca.marca
				return{
					res:true
					msg:""
				}
		{
		res:false
		msg:"No se localizo la marca, selecciona una valida"
		}
window.validateEdad=(valor)->
	if $.isNumeric(valor)
		if valor>=0 and valor<=150
			return{
				res:true
				msg:""
			}
		else
			return{
				res:false
				msg:"El dato de edad debe de ser valido"
			}
	else
		if valor=='SE DESCONOCE'
			return{
				res:true
				msg:""
			}
		else
			return{
				res:false
				msg:"No se permite este valor"

			}

window.validateMunicipio=(dato)->
	if !window.municipios
		cargarMunicipios this.validateMunicipio(dato)
	else
		municipios= window.municipios
		for municipio in municipios
			if dato==municipio.municipio
				return{
					res:true
					msg:""
				}
		{
		res:false
		msg:"No se localizo el municipio, selecciona uno valido"
		}
window.validateEstado=(dato)->
	if !window.estados
		cargarEstados this.validateEstados(dato)
	else
		estados= window.estados
		for estado in estados
			if dato==estado.estado
				return{
					res:true
					msg:""
				}
		{
		res:false
		msg:"No se localizo el estado, selecciona una valida"
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


window.actualizarComandanciaValor=(valor)->
	col=[]
	for comandancia in window.comandancias
		if comandancia.delegacion == valor
			col.push(comandancia)
	console.log col
	window.actualizarSelectComandancia(col)
	return
window.actualizarSubMarcaValor=(valor)->
	col=[]
	for marca in window.marcas
		if marca.marca == valor
			col.push(marca)
	window.actualizarSelectSubMarca(col)
	return
window.actualizarMapa=(calle,colonia)->

	geocoder= new google.maps.Geocoder()
	 
	req=
		address:calle
		componentRestrictions:
			country:"MX"
			administrativeArea:"GTO"
			locality:"León+de+Los+Aldama"
	geocoder.geocode req, (resultado,status)->
		if status== google.maps.GeocoderStatus.OK
			primero=resultado[0]
			window.mapa.setCenter(primero.geometry.location)
			window.marker.setPosition(primero.geometry.location)
			$("#geocomplete").val(primero.formatted_address)
			$("#lat_pp").val(primero.geometry.location.lat())
			$("#lng_pp").val(primero.geometry.location.lng())
	google.maps.event.trigger(window.mapa,'resize')
window.actualizarComandancia=()->
	if !window.comandancias
		window.cargarComandancias window.actualizarComandancia
	else
		col=[]
		valor =$("#delegacion_pp option:first").val()
		for comandancia in window.comandancias
			if comandancia.delegacion == valor
				col.push(comandancia)
		window.actualizarSelectComandancia(col)
	return

window.actualizarSelectComandancia=(comandancias)->
	ctl_comandancia= $('#comandancia_pp')
	ctl_comandancia.html('')
	opciones='<option  value="NO">**SELECCIONAR**</option>'
	for comandancia in comandancias
		opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
	ctl_comandancia.append(opciones)
	return
window.actualizarSelectSubMarca=(marcas)->
	ctl_submarca= $('#submarca_vehiculo_pp')
	ctl_submarca.html('')
	opciones='<option  value="NO">**SELECCIONAR**</option>'
	for marca in marcas
		opciones+='<option value="'+marca.submarca+'">'+marca.submarca+'</option>'
	ctl_submarca.append(opciones)
	return
window.cargarTipoVehiculos=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/tipoVehiculo.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.tipoVehiculos= collection
			fn()
			return
	return
window.cargarCapVehs=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/capVehs.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.capVehs= collection
			fn()
			return
	return
window.cargarDescVehiculos=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/descVehiculos.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.descVehiculos= collection
			fn()
			return
	return

window.cargarPensiones=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/pensiones.json'
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.pensiones= col
			fn()
			return
	return
window.cargarEnCustodias=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/enCustodias.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.enCustodias= collection
			fn()
			return
	return
window.cargarColores=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/colores.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.colores= collection
			fn()
			return
	return
window.cargarVisibilidades=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/visibilidades.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.visibilidades= collection
			fn()
			return
	return

window.cargarParteDias=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/partedias.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.parteDias= collection
			fn()
			return
	return
window.cargarTipoCalles=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/tipocalles.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.tipoCalles= collection
			fn()
			return
	return
window.cargarNoCarriles=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/nocarriles.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.noCarriles= collection
			fn()
			return
	return
window.cargarSentidos=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/sentidos.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.sentidos= collection
			fn()
			return
	return
window.cargarAlineaciones=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/alineaciones.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.alineaciones= collection
			fn()
			return
	return
window.cargarEstadoCalles=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/estadocalles.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.estadoCalles= collection
			fn()
			return
	return
window.cargarClimas=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/climas.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.climas= collection
			fn()
			return
	return
window.cargarRegulaciones=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/regulaciones.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.regulaciones= collection
			fn()
			return
	return
window.cargarObjetosDanados=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/objetosdanados.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.objetosDanados= collection
			fn()
			return
	return