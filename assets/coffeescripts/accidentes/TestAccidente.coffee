define ['core/sandbox'
],(sandbox)->
	TestAccidente=
		iniciar:()->
			this.sandbox= new sandbox this
			that= this
			$('#cargar_accidente_parte1').on "click",()->
				console.log "llenamos vehiculo"
				that.llenarAccidente(0)
			$('#cargar_accidente_parte2').on "click",()->
				console.log "llenamos vehiculo"
				that.llenarAccidente(1)
			$('#cargar_accidente_parte3').on "click",()->
				console.log "llenamos vehiculo"
				that.llenarAccidente(2)
			$('#cargar_accidente_parte4').on "click",()->
				console.log "llenamos vehiculo"
				that.llenarAccidente(3)
			$('#cargar_accidente_parte5').on "click",()->
				console.log "llenamos vehiculo"
				that.llenarAccidente(4)
			
		llenarAccidente:(id)->
			window.accidente= acc_test[0]
			$("#folio_accidente").val(accidente.folio_accidente) 
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
			$("#nombre_agente_intervino_pp").val(accidente.intervino.gafete + "--" + accidente.intervino.nombre)
			#$("#gafete_intervino_pp").val(accidente.intervino.gafete)
			$("#unidad_intervino_pp").val(accidente.intervino.unidad + "--" + accidente.intervino.sector)
			#$("#sector_intervino_pp").val(accidente.intervino.sector)
			$("#nombre_agente_superviso_pp").val(accidente.superviso.gafete + "--" + accidente.superviso.nombre)
			#$("#gafete_superviso_pp").val(accidente.superviso.gafete)
			$("#unidad_superviso_pp").val(accidente.superviso.unidad + "--" + accidente.superviso.sector )
			
			$("#alumbrado_publico_o").val(accidente.otros.visibilidad)
			$("#parte_dia_o").val(accidente.otros.parte_dia)
			$("#tipo_calle_o").val(accidente.otros.tipo_calle)
			$("#no_carriles_o").val(accidente.otros.no_carriles)
			$("#sentido_calle_o").val(accidente.otros.sentido_calle)

			$("#alineacion_o").val(accidente.estado_calles.alineacion)
			$("#estado_pavimento_o").val(accidente.estado_calles.estado_pavimento)
			$("#clima_o").val(accidente.estado_calles.clima)
			$("#regulacion_o").val(accidente.estado_calles.regulacion)

			this.sandbox.emit "add-text-observaciones",
				contenido:accidente.observaciones

			this.sandbox.emit "add-text-investigaciones",
				contenido:accidente.investigaciones

			this.sandbox.emit "add-text-simbologia",
				contenido:accidente.simbologia_croquis
			this.sandbox.emit 'llenar-fotos',
				contenido:accidente.fotos
			this.sandbox.emit 'llenar-croquis',
				contenido:accidente.croquis
			this.sandbox.emit 'refrescar-articulos-view'
			this.sandbox.emit 'refresca-tabla-danos'
			 

			return
		llenarVehiculo:(id)->
			datos= acc_vehiculos_test[id]
			console.log datos.clas_vehiculo
			if datos.Clas_vehiculo =='Automovil' 
				console.log datos.clas_vehiculo
				$('#optionsRadios1').attr("checked",true)
			else if datos.clas_vehiculo =='Camioneta' 
				$('#optionsRadios2').attr("checked",true)
			else if datos.clas_vehiculo =='Motocicleta' 
				$('#optionsRadios3').attr("checked",true)
			else if datos.clas_vehiculo =='Bicicleta' 
				$('#optionsRadios4').attr("checked",true)
			else if datos.clas_vehiculo =='Otros' 
				$('#optionsRadios5').attr("checked",true)
			$('#interviene_como_pp').val(datos.intervino_como)
			$('#marca_vehiculo_pp').val(datos.marca)
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
			console.log datos.vehiculo_servicio
			$('#color_vehiculo_pp').val(datos.color)
			$('#detalle_color_vehiculo').val(datos.color_detalle)
			$('#estado_vehiculo_pp').val(datos.estadov)
			$('#municipio_vehiculo').val(datos.ciudadv)
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
			else if datos.conductor_estado_droga=="EBRIEDAD INCOMPLETA"
				$('#radEstadoConductorEbriedadInconpleta' ).attr("checked",true)
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
