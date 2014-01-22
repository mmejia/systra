window.actualizarSubMarcaValor= (valor)->
	col= []
	for marca in window.marcas
		if marca.marca == valor
			col.push(marca)
	window.actualizarSelectSubMarca(col)
	return
viewInventario=()->
	if window.inventario
		inv= window.inventario
		$('#folio_inventa').html(inv.folio_del_inventario)
		$('#delegacion_inv').html(inv.delegacion)
		$('#comandancia_inv').html(inv.comandancia)
		$('#turnos_inv').html(inv.turno)
		$('#corporacion_inv').html(inv.corporacion) 
		$('#autoridadCompetente_inv').html(inv.autoridad_competente) 
		
		$('#folioAccidente_inv').html(inv.folio_inventario)
		$('#folioInfraccion_inv').html(inv.folio_infraccion)
		$('#fechaIncidente_inv').html(inv.fecha_incidente)
		$('#calle1_inv').html(inv.calle1)
		$('#exterior_inv').html(inv.exterior)
		$('#interior_inv').html(inv.num_interior)
		$('#calle2_inv').html(inv.calle2)
		$('#colonia_inv').html(inv.colonia)
		$('#depositadoEn_inv').html(inv.depositado_en)
		$('#mp_inv').html(inv.mp)
		$('#marca_inv').html(inv.marca)
		$('#submarca_inv').html(inv.submarca)
		$('#modelo_inv').html(inv.modelo)
		$('#color_inv').html(inv.color)
		$('#detalle_inv').html(inv.detalle)
		$('#placas_inv').html(inv.placas)
		$('#noEcon_inv').html(inv.no_econ)
		$('#serie_inv').html(inv.serie)
		$('#desc-vehiculo').html(inv.clas_vehiculo)
		$('#tipoVehiculo_inv').html(inv.tipoveh)
		$('#nombreConductor_inv').html(inv.conductor_nombre)
		$('#apellidoPaterno_inv').html(inv.apellido_paterno)
		$('#apellidoMaterno_inv').html(inv.apellido_materno)
		$('#lugar_inv').html(inv.lugar)
		$('#hora_inv').html(inv.hora)
		$('#fecha-entrada-inventario').html(inv.fecha_entrada)
		$('#hora-entrada-inventario').html(inv.hora_entrada)
		$('#recibidoPor_inv').html(inv.recibido_por)
		$('#folio_agente').html(inv.folio_agente)
		#this.refresc.folio_agente)
		$('#agente_inv').html(inv.nombre_agente)

window.actualizarSelectSubMarca= (marcas)->
	ctl_submarca= $('#submarca_inv')
	ctl_submarca.html('')
	opciones= '<option  value="NO">**SELECCIONAR**</option>'
	for marca in marcas
		opciones+='<option value="'+marca.submarca+'">'+marca.submarca+'</option>'
	ctl_submarca.append(opciones)
	return
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
window.cargarComandancias= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/comandancias.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.comandancias= collection
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
window.cargarDescVehiculos= (fn)->
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
window.cargarCorporaciones= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/corporaciones.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.corporaciones= collection
			fn()
window.cargarCalles= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/calles.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.calles= col
			fn()
window.cargarColonias= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/colonias.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.colonias= col
			fn()
window.cargarPensiones= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/pensiones.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.pensiones= col
			fn()
window.cargarCompetentes= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/aut_comp_inv.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.autCompInvs= col
			fn()
window.cargarMps= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/mps.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.mps= col
			fn()
window.cargarMarcas= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/marcas.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.marcas= col
			fn()
 
window.cargarColores= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/colores.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.colores= col
			fn()
	return
window.cargarTipos= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/tipoVehiculo.json"
		success:(data)->
			col= []
			for item in data
				col.push item
			window.tipos= col
			fn()
	return
window.cargarLugares= (fn)->
	$.ajax
			type : 'GET'
			url : "/catalogos/lugares.json"
			success:(data)->
				col= []
				for item in data
					col.push item
				window.lugares= col
				fn()
	return
window.validateCalle= (dato)->
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

window.validateColonia= (dato)->
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
window.validateMarca= (dato)->
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
window.validateSubMarca= (dato)->
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
												
	