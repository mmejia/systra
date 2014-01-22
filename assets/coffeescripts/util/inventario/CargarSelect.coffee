window.cargarSelects=(fn)->
	$('#myTab a').click (e)->
		e.preventDefault()
		$(this).tab 'show'
		return
	if !window.inventario
		llenarDelegaciones()
		llenarComandancias()
		llenarTurnos()
		llenarCorporaciones()
		llenarCalles()
		llenarColonias()
		llenarPensiones()
		llenarCompetentes()
		llenarMps()
		llenarDescVehiculos()
		llenarMarcas()
		llenarModelos()
		llenarColores()
		llenarTipo()
		llenarLugares()
		llenarHoras()
		llenarMinutos()
		llenarPensionesPar()
		llenarProfiles()
		reiniciarInventario()
	else
		$.when(
			$.ajax("/catalogos/delegaciones.json"),
			$.ajax("/catalogos/comandancias.json"),
			$.ajax("/catalogos/turnos.json"),
			$.ajax("/catalogos/corporaciones.json"),
			$.ajax("/catalogos/calles.json"),
			$.ajax("/catalogos/colonias.json"),
			$.ajax("/catalogos/pensiones.json"),
			$.ajax("/catalogos/aut_comp_inv.json"),
			$.ajax("/catalogos/mps.json"),
			$.ajax("/catalogos/descVehiculos.json"),
			$.ajax("/catalogos/marcas.json"),
			$.ajax("/catalogos/colores.json"),
			$.ajax("/catalogos/tipoVehiculo.json"),
			$.ajax("/catalogos/lugares.json"),
			$.ajax("/catalogos/listProfile.json"),
		).done (delegaciones,comandancias,turnos,corporaciones,calles,colonias,pensiones,competentes,mps,descVehiculos,marcas,colores,tipos,lugares,profiles)->
			window.delegaciones=delegaciones[0]
			window.comandancias=comandancias[0]
			window.turnos=turnos[0]
			window.corporaciones=corporaciones[0]
			window.calles=calles[0]
			window.colonias=colonias[0]
			window.pensiones= pensiones[0]
			window.autCompInvs=competentes[0]
			window.mps= mps[0]
			window.descVehiculos=descVehiculos[0]
			window.marcas= marcas[0]
			window.colores= colores[0]
			window.tipos= tipos[0]
			window.lugares= lugares[0]
			window.profiles= profiles[0]
			llenarDelegaciones()
			llenarComandancias()
			llenarTurnos()
			llenarCorporaciones()
			llenarCalles()
			llenarColonias()
			llenarPensiones()
			llenarCompetentes()
			llenarMps()
			llenarDescVehiculos()
			llenarMarcas()
			llenarModelos()
			llenarColores()
			llenarTipo()
			llenarLugares()
			llenarHoras()
			llenarMinutos()
			llenarPensionesPar()
			llenarProfiles()
			iniciarCalendario()
			fn.loadInventarioOnView()
iniciarCalendario=->
			$('#fecha-incidente').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-entrada-inventario-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#hora-entrada-inventario-append').datetimepicker
				pickDate: false
				language: 'es'
llenarDelegaciones=->
	if !window.delegaciones
		window.cargarDelegaciones llenarDelegaciones
	else
		sel=$('#delegacion_inv').html("")
		opciones= '<option value= "NO">**SELECCIONAR**</option>';
		for delegacion in window.delegaciones
			opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
		sel.append(opciones)
	return
llenarComandancias=->
	if !window.comandancias
		cargarComandancias llenarComandancias
	else
		sel=$('#comandancia_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>';
		for comandancia in window.comandancias
			 
			opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
		sel.append(opciones)
	return
llenarTurnos=->
	if !window.turnos
		cargarTurnos llenarTurnos
	else
		sel=$('#turnos_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>';
		for turno in window.turnos
			 
			opciones+='<option value="'+turno.turno+'">'+turno.turno+'</option>'
		sel.append(opciones)
		return
llenarCorporaciones=->
	if !window.corporaciones
		cargarCorporaciones llenarCorporaciones
	else
		sel=$('#corporacion_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>';
		for corporacion in window.corporaciones
			 
			opciones+='<option value="'+corporacion.corporacion+'">'+corporacion.corporacion+'</option>'
		sel.append(opciones)
		return	
llenarCalles=->
	if !window.calles
		cargarCalles llenarCalles
	else
		nombres= []
		for item in window.calles
			nombres.push item.calle
		$("#calle1_inv").autocomplete
				source:nombres
		$("#calle2_inv").autocomplete
				source:	nombres	
	return
llenarColonias=->
	if !window.colonias
		cargarColonias llenarColonias
	else
		nombres= []
		for item in window.colonias
			nombres.push item.nombre
		$("#colonia_inv").autocomplete
			source:nombres
	return
llenarPensiones=->
	if !window.pensiones
		cargarPensiones llenarPensiones
	else
		sel=$('#depositadoEn_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>'
		for pension in window.pensiones
			 
			opciones+='<option value="'+pension.nombre_pension+'">'+pension.nombre_pension+'</option>'
		sel.append(opciones)
		return
llenarCompetentes=->
	if !window.autCompInvs
		cargarCompetentes llenarCompetentes
	else
		sel=$('#autoridadCompetente_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>'
		for competente in window.autCompInvs
			opciones+='<option value="'+competente.autoridad+'">'+competente.autoridad+'</option>'
		sel.append(opciones)
		return
llenarMps=->
	if !window.mps
		cargarMps this.llenarMps
	else
		sel=$('#mp_inv').html("")
		opciones= '<option value="NO">**SELECCIONAR**</option>'
		for mp in window.mps
			opciones+='<option value="'+mp.agencia+'">'+mp.agencia+'</option>'
		sel.append(opciones)
		return
llenarMarcas=->
	if !window.marcas
			cargarMarcas llenarMarcas
	else
		sel=$("#marca_inv").html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		a_marcas=[]
		for marca in window.marcas
			a_marcas[marca.marca]=1
		for nombre in _.keys(a_marcas)
			opciones+='<option value="' + nombre + '">' + nombre + '</option>';
		sel.append opciones

	return
llenarModelos=->
		sel= $('#modelo_inv').html("");
		opciones= '<option  value="NO">**SELECCIONAR**</option>'
		for x in [1910..2020]
			opciones += '<option value="' + x + '">' + x + '</option>'
		opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
		sel.append(opciones)
		return
llenarColores=->
	if !window.colores
		cargarColores llenarColores
	else
		sel=$('#color_inv').html("")
		opciones= '<option  value="NO">**SELECCIONAR**</option>'
		for color in window.colores
			opciones+='<option value="'+color.color+'">'+color.color+'</option>'
		sel.append(opciones)
		return
llenarProfiles=->
	that= this
	if !window.profiles
		cargarProfiles llenarProfiles
	else
		list_cobro=[]
		agentes=window.profiles
		for agente in agentes
			list_cobro.push(agente.cobro)
		$("#folio_agente").autocomplete
			source:list_cobro
			change:(evento,ui)->
				for p in window.profiles
					if p
						if p.cobro==ui.item.value
							$("#agente_inv").val( p.nombre)
llenarDescVehiculos=->
		if !window.descVehiculos
			cargarDescVehiculos llenarDescVehiculos
		else
			$("#desc-vehiculo").html('')
			sel =$("#desc-vehiculo")
			opciones='<option  value="SEL">**SELECCIONAR**</option>'
			for item in window.descVehiculos
				opciones+='<option value="' + item.descripcion + '">' + item.descripcion + '</option>';
			sel.append opciones
		return
llenarTipo=->
	if !window.tipos
		cargarTipos llenarTipo
	else
		sel=$('#tipoVehiculo_inv').html("")
		opciones= '<option  value="NO">**SELECCIONAR**</option>'
		for tipo in window.tipos
			opciones+='<option value="'+tipo.tipo+'">'+tipo.tipo+'</option>'
		sel.append(opciones)
		return
llenarLugares=->
	if !window.lugares
		cargarLugares llenarLugares
	else
		sel=$('#lugar_inv').html("")
		opciones= '<option  value="NO">**SELECCIONAR**</option>'
		for lugar in window.lugares
			opciones+='<option value="'+lugar.descripcion+'">'+lugar.descripcion+'</option>'
		sel.append(opciones)
		return
llenarHoras=->
		sel= $('#hora_inv').html("");
		opciones= ''
		for x in [1..12]
			opciones += '<option value="' + x + '">' + x + '</option>'
		opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
		sel.append(opciones)
		return
llenarMinutos=->
		sel= $('#minutos_inv').html("");
		opciones= ''
		for x in [1..60]
			opciones += '<option value="' + x + '">' + x + '</option>'
		opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
		sel.append(opciones)
		return
llenarPensionesPar=->
	if !window.pensiones
		cargarPensiones llenarPensionesPar
	else
		sel=$('#pensionPart_inv').html("")
		opciones= '<option  value="NO">**SELECCIONAR**</option>'
		for pension in window.pensiones
			opciones+='<option value="'+pension.nombre_pension+'">'+pension.nombre_pension+'</option>'	
		sel.append(opciones)
reiniciarInventario=->
	window.inventario= {}
	window.inventario.fotos=[]
	return
