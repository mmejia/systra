
window.llenarAccidente=(indice)->
	console.log $( "#addresspicker_map" )
	accidente= window.acc_test[0]
	$("#folio_accidente").val(accidente.folio_accidente) 
	alert comandancia.comandancia
	$("#delegacion_pp").val(accidente.delegacion) 
	$("#comandancia_pp").val(accidente.comandancia)
	$("#turno_pp").val(accidente.turno)
	$("#fecha-fecha_pp").val(accidente.fecha)
	$("#hora-hora_pp").val(accidente.hora)
	$("#clasAccidente_pp").val(accidente.clasificacion)
	$("#tipoAccidente_pp").val(accidente.tipo_choque)
	$("#lat_pp").val(accidente.latitud)
	$("#lng_pp").val(accidente.longitud)
	$("#calle1_pp").val(accidente.calle1)
	$("#calle2_pp").val(accidente.calle2)
	$("#calle3_pp").val(accidente.calle3)
	$("#frente_a_numero").val(accidente.frentea)
	$("#colonia_pp").val(accidente.colonia)
	$("#estado_pp").val(accidente.estado)
	$("#municipio_pp").val(accidente.municipio)
	$("#nombre_agente_intervino_pp").val(accidente.intervino.nombre)
	$("#gafete_intervino_pp").val(accidente.intervino.gafete)
	$("#unidad_intervino_pp").val(accidente.intervino.unidad)
	$("#sector_intervino_pp").val(accidente.intervino.sector)
	$("#nombre_agente_superviso_pp").val(accidente.superviso.nombre)
	$("#gafete_superviso_pp").val(accidente.superviso.gafete)
	$("#unidad_superviso_pp").val(accidente.superviso.unidad)
	$("#sector_superviso_pp").val(accidente.superviso.sector)
	area= $("#ta_observaciones_pp")
	area.setValue(accidente.observaciones)
	console.log "Dentro del  llenar accidente"
	ta_investigacion= $("#ta_investigaciones_pp")
	ta_investigacion.setValue(accidente.investigaciones)

	ta_simbologia= $("#ta_simbologia_pp")
	ta_simbologia.setValue(accidente.simbologia_croquis)
	console.log area
	return	 
window.llenarVehiculo=(id)->
		datos= acc_vehiculos_test[id]
		console.log datos.clas_vehiculo
		$('#interviene_como_pp').val(datos.intervino_como)
		$('#desc_vehiculo_pp').val(datos.clas_vehiculo)
		$('#marca_vehiculo_pp').val(datos.marca)
		window.actualizarSubMarcaValor(datos.marca)
		$('#submarca_vehiculo_pp').val(datos.submarca)
		$('#model_vehiculo_pp').val(datos.modelo)
		$('#tipo_vehiculo_pp').val(datos.tipo)
		$('#datosadicionales_vehiculo_pp').val(datos.datos_adicionales) ##
		$('#placas_vehiculo').val(datos.placa)
		$('#noSerie_vehiculo').val(datos.serie)
		$('#noeco_pp').val(datos.num_economico)
		$('#capacidad_vehiculo_pp').val(datos.capacidad)
		$('#nodegrua_vehiculo_pp').val(datos.num_grua)
		$('#pension_vehiculo_pp').val(datos.pension)
		$('#noInventario_vehiculo').val(datos.dv_numero_inventario)
		$('#clase_vehiculo_pp').val(datos.vehiculo_servicio)
		$('#color_vehiculo_pp').val(datos.color)
		$('#detalle_color_vehiculo').val(datos.color_detalle)
		$('#estado_vehiculo_pp').val(datos.estadov)
		$('#municipio_vehiculo_pp').val(datos.ciudadv)
		#DATOS DEL PROPIETARIO
		if datos.tipo_dueno=="Nombre"
			$('#tipoDuenoNombre').attr("checked",true)
		else
			$('#tipoDuenoRazonSocial').attr("checked",true)
		 
		$('#nombre_propietario_vehiculo').val(datos.dueno_nombre)
		$('#apellido_paterno_propietario_vehiculo').val(datos.dueno_apepaterno)
		$('#apellido_materno_propietario_vehiculo').val(datos.dueno_apematerno)
		$('#domicilio_propietario_vehiculo').val(datos.dueno_calle)
		$('#telefono_propietario_vehiculo').val(datos.dueno_tel)
		$('#codigo_postal_propietario_vehiculo').val(datos.dueno_cp)
		$('#colonia_propietario_vehiculo_pp').val(datos.dueno_colonia)
		$('#municipio_propietario_vehiculo_pp').val(datos.dueno_ciudadp)
		$('#estado_propietario_vehiculo_pp').val(datos.dueno_estadop)
		#DATOS DEL CONDUCTOR
		$('#nombre_conductor_vehiculo').val(datos.conductor_nombre)
		$('#appellido_paterno_conductor_vehiculo').val(datos.conductor_apepaterno)
		$('#apellido_materno_conductor_vehiculo').val(datos.conductor_apematerno)
		$('#domicilio_conductor_vehiculo').val(datos.conductor_calle)
		$('#edad_conductor_vehiculo').val(datos.conductor_edad)
		$('#tipo_de_edad_conductor_vehiculo').val(datos.conductor_tipo_edad) ##
		$('#sexo_conductor_vehiculo').val(datos.conductor_sexo)
		$('#colonia_conductor_vehiculo_pp').val(datos.conductor_colonia)
		$('#folio_infraccion_conductor_vehiculo').val(datos.folio_infraccion)
		$('#folio_certificado_medico_conductor_vehiculo').val(datos.folio_certificado_medico)
		if datos.conductor_estado_droga=="EBRIEDAD COMPLETA"
			$('#radEstadoConductorEbriedadCompleta' ).attr("checked",true)
		else if datos.conductor_estado_droga=="EBRIEDAD INCONPLETA"
			$('#radEstadoConductorEbriedadInconpleta').attr("checked",true)
		else if datos.conductor_estado_droga=="BAJO INFLUJO DE DROGAS"
			$('#radEstadoConductorBajoInflujoDrogas').attr("checked",true)
		else if datos.conductor_estado_droga=="ALIENTO ALCOHOLICO"
			$('#radEstadoConductorAlientoAlcoholico' ).attr("checked",true)
		else if datos.conductor_estado_droga=="ESTADO NORMAL"
			$('#radEstadoConductorEstadoNormal' ).attr("checked",true)
		else if datos.conductor_estado_droga=="INCONSCIENTE"
			$('#radEstadoConductorInconsciente' ).attr("checked",true)
		else if datos.conductor_estado_droga=="SIN EXAMEN"
			$('#radEstadoConductorSinExamen' ).attr("checked",true)

		$('#estado_certificado_vehiculo_pp').val(datos.conductor_estado) ##
		$('#municipio_certificado_vehiculo_pp').val(datos.conductor_municipio) ##
		$('#condiciones_fisicas_certificado_vehiculo_pp').val(datos.estado_herido)
		$('#detenido_en_certificado_vehiculo_pp').val(datos.conductor_detenido_en)
		$('#custodia_de_certificado_vehiculo').val(datos.conductor_custodia) ##
		$('#disposicion_de_certificado_vehiculo').val(datos.conductor_disposicion)
		$('#persona_encontraba_certificado_vehiculo_pp').val(datos.conductor_se_encontraba) ##
		$('#levantado_por_certificado_vehiculo_pp').val(datos.conductor_levantado_por) ##
		$('#trasladado_a_certificado_vehiculo_pp').val(datos.conductor_trasladado_a) ##
		$('#nolicencia_conductor').val(datos.conductor_num_licencia)
		$('#restricciones_licencia_conductor_vehiculo_pp').val(datos.conductor_rest_licencia)
		$('#vigencia_licencia_input').val(datos.conductor_fecha_vigencia)
		$('#expedida_licencia_conductor_vehiculo_pp').val(datos.conductor_edo_licencia)