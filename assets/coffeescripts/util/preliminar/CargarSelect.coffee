loadOnView=()->
			#this.limpiarColorFields()
	preliminar= window.preliminar
	if preliminar
		$("#folio_pre").val(preliminar.folio_evento)
		$("#fecha_preliminar").val(preliminar.fecha_evento)
		$("#hora_preliminar").val(preliminar.hora_evento)
		$('#delegacion_pre').val(preliminar.delegacion)
		window.actualizarComandanciaValor(preliminar.delegacion)
		$("#comandancia_pre").val(preliminar.comandancia)
		$("#turno_pre").val(preliminar.turno)
		$("#tipo_evento_pre").val(preliminar.tipo_evento)
		$("#clasificacion_pre").val(preliminar.id_clasificacion)
		$("#calle1_pre").val(preliminar.calle1)
		$('#calle2_pre').val(preliminar.calle1)
		$('#ref_pre').val(preliminar.ref)
		$("#colonia_pre").val(preliminar.colonia)
		$("#operativo_pre").val(preliminar.tipo_operativo)
		$("#no_vehiculos_pre").val(preliminar.no_veh_participantes)
		$("#no_detenidos_pre").val(preliminar.no_detenidos)
		$("#no_heridos_pre").val(preliminar.no_heridos)
		$("#no_muertos_pre").val(preliminar.no_muertos)
		$("#pension_pre").val(preliminar.pension)
		$("#no_de_inventario_pre").val(preliminar.no_de_inventario)
		$("#intervino_pre").val(preliminar.agente_intervino)
		$("#unidad_pre").val(preliminar.unidad_intervino)
		appendObservaciones(preliminar.observaciones_evento)
appendObservaciones=(data)->
	el=$('#observaciones_pre')
	w5ref= el.data('wysihtml5')
	if w5ref
		w5ref.editor.setValue(data)
	else
		el.html(data)
	return 
window.cargarSelects=()->
	$('#observaciones_pre').wysihtml5()
	if !window.preliminar
		llenarDelegaciones()
		llenarComandancias()
		llenarTurnos()
		llenarClasAccidentes()
		llenarCalles()
		llenarColonias()
		llenarOperativos()
		llenarTipoEventos()
		llenarAgentes()
		llenarUnidades()
		llenarPensiones()
		iniciarCalendario()
		window.spinner.stop()
	else
		$.when( 
			$.ajax("/catalogos/delegaciones.json"),
			$.ajax("/catalogos/comandancias.json"),
			$.ajax("/catalogos/turnos.json"),
			$.ajax("/catalogos/clasAccidente.json"),
			$.ajax("/catalogos/calles.json"),
			$.ajax("/catalogos/colonias.json"),
			$.ajax("/catalogos/operativos.json"),
			$.ajax('/catalogos/tipoEventos.json'),
			$.ajax("/catalogos/CatAgentesNew.json"),
			$.ajax("/catalogos/TbUnidades2008.json"),
			$.ajax('/catalogos/pensiones.json'))
			.done (delegaciones,comandancias,turnos,clasAccidentes,calles,colonias,operativos,tipoEventos,agentes,unidades,pensiones)->
					window.delegaciones=delegaciones[0]
					window.comandancias=comandancias[0]
					window.turnos= turnos[0]
					window.clasAccidentes= clasAccidentes[0]
					window.calles= calles[0]
					window.colonias= colonias[0]
					window.operativos = operativos[0]
					window.tipoEventos =tipoEventos[0]
					window.catAgentes= agentes[0]
					window.tbUnidades2008= unidades[0]
					window.pensiones = pensiones[0]

					llenarDelegaciones()
					llenarComandancias()
					llenarTurnos()
					llenarClasAccidentes()
					llenarCalles()
					llenarColonias()
					llenarOperativos()
					llenarTipoEventos()
					llenarAgentes()
					llenarUnidades()
					llenarPensiones()
					iniciarCalendario()
					loadOnView()
					window.spinner.stop()
llenarDelegaciones=()->
	if !window.delegaciones
		cargarDelegaciones llenarDelegaciones
	else
		sel=$('#delegacion_pre').empty()
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		sel.append opciones
		for delegacion in window.delegaciones
			sel.append $ '<option>',  
					value: delegacion.delegacion
					text : delegacion.delegacion
	window.actualizarComandancia()
	return
llenarComandancias=->
	if !window.comandancias
		cargarComandancias llenarComandancias
	else
		sel=$('#comandancia_pre').html("")
		opciones='<option  value= "NO">**SELECCIONAR**</option>';
		sel.append(opciones)
		#for comandancia in window.comandancias
		#	opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
		#sel.append(opciones)
	return
llenarPensiones=->
	if !window.pensiones
		cargarPensiones llenarPensiones
	else
		sel=$('#pension_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for pension in window.pensiones
			opciones+='<option value="'+pension.nombre_pension+'">'+pension.nombre_pension+'</option>'
		sel.append(opciones)
	return

llenarOperativos=->
	if !window.operativos
		cargarOperativos llenarOperativos
	else
		sel=$('#operativo_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for operativo in window.operativos
			opciones+='<option value="'+operativo.descripcion+'">'+operativo.descripcion+'</option>'
		sel.append(opciones)
	return
llenarTipoEventos=->
	if !window.tipoEventos
		cargarTipoEventos llenarTipoEventos
	else
		sel=$('#tipo_evento_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for evento in window.tipoEventos
			opciones+='<option value="'+evento.tipo_evento+'">'+evento.tipo_evento+'</option>'
		sel.append(opciones)
	return

	return
llenarAgentes=->
	if !window.profiles
		cargarProfiles llenarAgentes
	else
		nombre_agentes=[]
		agentes=window.profiles
		for agente in agentes
			str=agente.cobro 
			nombre_agentes.push(str)
		$("#gafete_agente_pre").autocomplete
			source:nombre_agentes
			change:(evento,ui)->
				for p in window.profiles
					if p
						if p.cobro==ui.item.value
							$("#nombre_agente_pre").val( p.nombre)
	return
llenarUnidades=->
	if !window.tbUnidades2008
		cargarTbUnidades2008 llenarUnidades
	else
		nombre_unidades=[]
		nombre_sector=[]
		unidades=window.tbUnidades2008
		for unidad in unidades
			str_unidad=unidad.no_unidad 
			str_sector = unidad.sector
			nombre_unidades.push(str_unidad)
		nombre_unidades.push('NINGUNA')
		$("#unidad_pre").autocomplete
			source:nombre_unidades
			change: (evento,ui)->
				for p in window.tbUnidades2008
					if p
						if p.no_unidad ==ui.item.value
							$("#sector_pre").val( p.sector)
	return

llenarCalles=->
	if !window.calles
		cargarCalles llenarCalles
	else
		nombres=[]
		for calle in window.calles
			nombres.push calle.calle 
		$("#calle1_pre").autocomplete
			source: nombres
		$("#calle2_pre").autocomplete
			source: nombres
	return
llenarColonias=->
	if !window.colonias
		cargarColonias llenarColonias
	else
		nombres=[]
		for colonia in window.colonias
			nombres.push colonia.nombre
		$("#colonia_pre").autocomplete
			source: nombres
	return

llenarTurnos=->
	if !window.turnos
		cargarTurnos llenarTurnos
	else
		sel=$('#turno_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for turno in window.turnos
			opciones+='<option value="'+turno.turno+'">'+turno.turno+'</option>'
		sel.append(opciones)
		return
llenarClasAccidentes=->
	if !window.clasAccidentes
		window.cargarClasAccidentes llenarClasAccidentes
	else
		sel=$('#clasificacion_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for clasAccidente in window.clasAccidentes
			 
			opciones+='<option value="'+clasAccidente.clas+'">'+clasAccidente.clas+'</option>'
		sel.append(opciones)
	return
llenarTipoAccidentes=->
	if !window.tipoAccidentes
		window.cargarTipoAccidentes llenarTipoAccidentes
	else
		sel=$('#tipo_pre').html("")
		opciones='<option  value="NO">**SELECCIONAR**</option>'
		for tipoAccidente in window.tipoAccidentes
			opciones+='<option value="'+tipoAccidente.tipo+'">'+tipoAccidente.tipo+'</option>'
		sel.append(opciones)
	return
iniciarCalendario=->
	#alert 'Vamos a llenar el calendarios'
	$('#date-fecha-preliminar').datetimepicker
		pickTime: false
		language: 'es'
	$('#date-hora-preliminar').datetimepicker
		pickDate: false
		language: 'es'
