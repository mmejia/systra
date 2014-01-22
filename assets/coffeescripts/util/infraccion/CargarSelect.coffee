llenarFoliosDisponibles=->
	$.ajax
		type:'GET'
		url:'/folios/folios_disponibles'
		success:(data)->
			collection=[]
			for item in data
				collection.push  item
			$("#folio_infraccion").autocomplete
				source:collection
				change:(evento,ui)->
					for p in window.profiles
						if p
							if p.cobro==ui.item.folio_agente
								$("#nom-cobro-agente-inf").val( p.cobro)
								$("#nombre-agente-inf").val( p.nombre)
								$("#delegacion_spa_inf").val( p.delegacion)
								$("#comandancia_spa_inf").val( p.comandancia)
								$("#turno_spa_inf").val( p.turno)
	return
llenarCalles=->
	if !window.calles
		cargarCalles llenarCalles
	else
		nombres=[]
		for item in window.calles
			nombres.push item.calle
		$("#calle1_spa_inf").autocomplete
				source:nombres
		$("#calle2_spa_inf").autocomplete
				source:nombres
	return
llenarOperativos=->
	if !window.operativos
		cargarOperativos this.llenarOperativos
	else
		sel=$("#tipo_operativo_spa_inf").html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for operativo in window.operativos
			 
			opciones += '<option value="' + operativo.descripcion+ '">' + operativo.descripcion + '</option>'
		sel.append(opciones)
	return

llenarCirculaciones=->
	if !window.circulaciones
		cargarCirculaciones this.llenarCirculaciones
	else
		sel=$("#circulacion_spa_inf").html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for circulacion in window.circulaciones
			opciones += '<option value="' + circulacion.circulacion+ '">' + circulacion.circulacion + '</option>'
		sel.append(opciones)
	return
llenarArticulos=->
	that= this
	if !window.articulos
		cargarArticulos llenarArticulos
	else
		nombres=[]
		for item in window.articulos
			 
			item.toString= ()->
				this.art + "-" + this.fracc + "-" + this.descc
			#str= campos.art + "-" + campos.fracc + "-" + campos.descc
			nombres.push
				 value:item
		$("#articulos_spa_inf").autocomplete
			that:that
			source : nombres
			select:(event,ui)->
				that.currentArticulo=ui.item.value
				return 
	return
window.cargarSelects=(fn)->
	that=this
	that.fn=fn
	iniciarCalendario()
	if !window.infraccion
		llenarFoliosDisponibles()
		llenarProfiles()
		llenarDelegaciones()
		#this.llenarComandancias()
		llenarTurnos()
		llenarColonias()
		llenarCalles()
		llenarOperativos()
		llenarCirculaciones()
		llenarArticulos()

	else
		$.when(
			$.ajax("/catalogos/delegaciones.json"),	
			$.ajax("/catalogos/comandancias.json"),
			$.ajax("/catalogos/turnos.json"),
			$.ajax("/catalogos/colonias.json"),
			$.ajax("/catalogos/calles.json"),
			$.ajax("/catalogos/operativos.json"),
			$.ajax("/catalogos/circulaciones.json"))
		.done (delegaciones,comandancias,turnos,colonias,calles,operativos,circulaciones)->
			window.delegaciones= delegaciones[0]
			window.comandancias= comandancias[0]
			window.turnos=turnos[0]
			window.colonias= colonias[0]
			window.calles= calles[0]
			window.operativos= operativos[0]
			window.circulaciones= circulaciones[0]
			llenarProfiles()
			llenarDelegaciones()
			#this.llenarComandancias()
			llenarTurnos()
			llenarColonias()
			llenarCalles()
			llenarOperativos()
			llenarCirculaciones()
			llenarArticulos()
			that.fn.llenarInfraccion()
iniciarCalendario=->
	$('#fecha-capt-inf').datetimepicker
		pickTime: false
		language: 'es'
	$('#hora-capt-inf').datetimepicker
		pickDate: false
		language: 'es'

llenarProfiles=()->
	that= this
	if !window.profiles
		cargarProfiles llenarProfiles
	else
		list_cobro=[]
		agentes=window.profiles
		for agente in agentes
			list_cobro.push(agente.cobro)
		$("#nom-cobro-agente-inf").autocomplete
			source:list_cobro
			change:(evento,ui)->
				for p in window.profiles
					if p
						if p.cobro==ui.item.value
							$("#nombre-agente-inf").val( p.nombre)
							$("#delegacion_spa_inf").val( p.delegacion)
							$("#comandancia_spa_inf").val( p.comandancia)
							$("#turno_spa_inf").val( p.turno)
	return
llenarDelegaciones=->
	if !window.delegaciones
		cargarDelegaciones llenarDelegaciones
	else
		sel=$("#delegacion_spa_inf").html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for delegacion in window.delegaciones
			opciones += '<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
		sel.append(opciones)
	window.actualizarComandancia()
	return
llenarTurnos=->
	if !window.turnos
		cargarTurnos llenarTurnos
	else
		sel=$("#turno_spa_inf").html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for turno in window.turnos
			 
			opciones += '<option value="'+turno.turno+'">'+turno.turno+'</option>'
		sel.append(opciones)
	return
llenarColonias=->
	if !window.colonias
		cargarColonias llenarColonias
	else
		nombres=[]
		for item in window.colonias
			 
			nombres.push item.nombre
		 
		$("#colonia_spa_inf").autocomplete
			source:nombres
	return


