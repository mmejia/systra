define [
	'core/sandbox'
],(sandbox)->
		ManagerVehiculos=
			botonAceptar:null
			botonCancelar:null
			element:null
			padre:null
			template:null
			rad_automovil:null
			rad_camioneta:null
			rad_moto:null
			rad_bici:null
			rad_otros:null
			rad_nombre:null
			rad_razon:null
			rad_ebriedad:null
			rad_inconpleta:null
			rad_drogas:null
			rad_aliento:null
			rad_normal:null
			rad_inconciente:null
			rad_sinexamen:null
			rad_ui:null
			rad_no_proporciono:null
			iniciar:()->
				that=this
				this.botonAceptar=$(this.botonAceptarId)
				this.botonCancelar=$(this.botonCancelarId)
				this.sandbox= new sandbox(this)
				this.sandbox.on 'agregar-vehiculo',this.agregarVehiculo
				this.rad_automovil=document.getElementById("optionsRadios1")
				this.rad_camioneta=document.getElementById("optionsRadios2")
				this.rad_moto=document.getElementById("optionsRadios3")
				this.rad_bici=document.getElementById("optionsRadios4")
				this.rad_otros=document.getElementById("optionsRadios5")
				
				this.rad_nombre=document.getElementById("tipoDuenoNombre")
				this.rad_razon=document.getElementById("tipoDuenoRazonSocial")

				this.rad_ebriedad=document.getElementById("radEstadoConductorEbriedadCompleta")
				this.rad_inconpleta=document.getElementById("radEstadoConductorEbriedadInconpleta")
				this.rad_drogas=document.getElementById("radEstadoConductorBajoInflujoDrogas")
				this.rad_aliento=document.getElementById("radEstadoConductorAlientoAlcoholico")
				this.rad_normal=document.getElementById("radEstadoConductorEstadoNormal")
				this.rad_inconciente=document.getElementById("radEstadoConductorInconsciente")
				this.rad_sinexamen=document.getElementById("radEstadoConductorSinExamen")
				
				this.llenarDescVehiculos()
				this.llenarMarcas()
				this.llenarClasVehiculos()
				this.llenarTipoVehiculos()
				this.llenarModelos()
				this.llenarPensiones()
				this.llenarColores()
				this.llenarDescVehiculos()
				this.llenarMunicipios()
				this.llenarEstados()
				this.llenarColonia_propietarios()
				this.llenarMunicipio_propietarios()
				this.llenarEstado_propietarios()
				this.llenarColonia_conductores()
				this.llenarMunicipio_conductores()
				this.llenarEstado_conductores()
				this.llenarAccEdoConductores()
				this.llenarAccEdoFisicos()
				this.llenarTbDetenidos()
				this.llenarEnCustodias()
				this.llenarTbLevantadoPors()
				this.llenarTbTrasladadoas()
				this.llenarTbTipoLicencias()
				this.llenarAccRestriccionesLicencias()
				this.llenarEstadoLicenciaConductores()
				this.iniciarCalendario()
				this.llenarCapVehs()
				this.establecerDefault()
				this.element=$(this.elementId)
				this.sandbox.on 'cargar-datos-vehiculo-en-view',this.cargarDatosVehiculoEnView
				$('#cargar_vehiculo_parte1').on "click",()->
					llenarVehiculo(0)
				$('#cargar_vehiculo_parte2').on "click",()->
					llenarVehiculo(1)
				$('#cargar_vehiculo_parte3').on "click",()->
					llenarVehiculo(2)
				$('#cargar_vehiculo_parte4').on "click",()->
					llenarVehiculo(3)
				$('#cargar_vehiculo_parte5').on "click",()->
					llenarVehiculo(4)
				$('#cancelar_vehiculo_parte').on "click",()->
					 that.cancelar()

				$('#guardar_vehiculo_parte').on "click",()->
					that.agregarVehiculo()
				$('#agregar-vehiculo').on "click",()->
					that.showCapturaVehiculo()
				that.rad_ui=document.getElementById("rad-uir")
				that.rad_no_proporciono=document.getElementById("rad-no-proporciono")
				$("#IgualConductorPropietario"). on  'click',(evento)->
					obj= evento.currentTarget
					if obj.checked==true
						that.activateEqualDuenoConductor()
				$("#rad-uir").on  'click',(evento)->
					obj= evento.currentTarget
					if obj.checked==true
						that.establecerSeDesconoceConductor()
						#that.rad_no_proporciono.checked= false
					else
						that.disEstablecerSeDesconoceConductor()
				$("#cancelar-se-desconoce-conductor").on  'click',(evento)->
					obj= evento.currentTarget
					if obj.checked==true
				 		that.disEstablecerSeDesconoceConductor()
				$("#rad-no-proporciono").on  'click',(evento)->
					obj= evento.currentTarget
					if obj.checked==true
						that.establecerSeDesconoceConductor()
						#that.rad_ui.checked= false
					else
						that.disEstablecerSeDesconoceConductor()
				$("#se-desconoce-dueno").on 'click', (evento)->
					obj= evento.currentTarget
					if obj.checked==true
						that.establecerSeDesconoceDueno()
					else
						that.disEstablecerSeDesconoceDueno()
				this.marca_vehiculo=$("#marca_vehiculo_pp")
				this.marca_vehiculo.on 'change',(evento)->
						valor= $('#' + evento.currentTarget.id).val()
						window.actualizarSubMarcaValor(valor)
						return

				$("#condiciones_fisicas_certificado_vehiculo_pp").on 'change',()->
					$(this).find(":selected").each ()->
						valor= $(this).val()
						if valor=='Normal'
								$('#detenido_en_certificado_vehiculo_pp').val("NO")
								$('#custodia_de_certificado_vehiculo').val("NO")
								$('#disposicion_de_certificado_vehiculo').val("NO")
								$('#levantado_por_certificado_vehiculo_pp').val("NINGUNO")
								$('#trasladado_a_certificado_vehiculo_pp').val("NO")

								$('#detenido_en_certificado_vehiculo_pp').prop("disabled",true)
								$('#custodia_de_certificado_vehiculo').prop("disabled",true)
								$('#disposicion_de_certificado_vehiculo').prop("disabled",true)
								$('#levantado_por_certificado_vehiculo_pp').prop("disabled",true)
								$('#trasladado_a_certificado_vehiculo_pp').prop("disabled",true)
						else
							$('#detenido_en_certificado_vehiculo_pp').prop("disabled",false)
							$('#custodia_de_certificado_vehiculo').prop("disabled",false)	
							$('#disposicion_de_certificado_vehiculo').prop("disabled",false)
							$('#levantado_por_certificado_vehiculo_pp').prop("disabled",false)
							$('#trasladado_a_certificado_vehiculo_pp').prop("disabled",false)
							$('#detenido_en_certificado_vehiculo_pp').val("SEL")
							$('#custodia_de_certificado_vehiculo').val("SEL")
							$('#disposicion_de_certificado_vehiculo').val("SEL")
							$('#levantado_por_certificado_vehiculo_pp').val("SEL")
							$('#trasladado_a_certificado_vehiculo_pp').val("SEL")
					return
			establecerDefault:()->
				$("#nombre_propietario_vehiculo_default").on 'click',->
					$("#nombre_propietario_vehiculo").val("SE DESCONOCE")
				$("#apellido_paterno_propietario_vehiculo_default").on 'click', ->
					$("#apellido_paterno_propietario_vehiculo").val("SE DESCONOCE")
				$("#apellido_materno_propietario_vehiculo_default").on 'click', ->
					$("#apellido_materno_propietario_vehiculo").val("SE DESCONOCE")
				$("#domicilio_propietario_vehiculo_default").on 'click', ->
					$("#domicilio_propietario_vehiculo").val("SE DESCONOCE")
				$("#telefono_propietario_vehiculo_default").on 'click', ->
					$("#telefono_propietario_vehiculo").val("SE DESCONOCE")
				$("#codigo_postal_propietario_vehiculo_default").on 'click', ->
					$("#codigo_postal_propietario_vehiculo").val("SE DESCONOCE")
				$("#colonia_propietario_vehiculo_pp_default").on 'click', ->
					$("#colonia_propietario_vehiculo_pp").val("SE DESCONOCE")
				$("#municipio_propietario_vehiculo_pp_default").on 'click', ->
					$("#municipio_propietario_vehiculo_pp").val("SE DESCONOCE")
				$("#estado_propietario_vehiculo_pp_default").on 'click', ->
					$("#estado_propietario_vehiculo_pp").val("SE DESCONOCE")

			disEstablecerSeDesconoceDueno:()->
				$('#nombre_propietario_vehiculo').val("")
				$('#apellido_paterno_propietario_vehiculo').val("")
				$('#apellido_materno_propietario_vehiculo').val("")
				$('#domicilio_propietario_vehiculo').val("")
				$('#telefono_propietario_vehiculo').val("")
				$('#codigo_postal_propietario_vehiculo').val("")
				$('#colonia_propietario_vehiculo_pp').val("")
				$('#municipio_propietario_vehiculo_pp').val("")
				$('#estado_propietario_vehiculo_pp').val("")

				$('#nombre_propietario_vehiculo').enable(true);
				$('#apellido_paterno_propietario_vehiculo').enable(true);
				$('#apellido_materno_propietario_vehiculo').enable(true);
				$('#domicilio_propietario_vehiculo').enable(true);
				$('#telefono_propietario_vehiculo').enable(true); 
				$('#codigo_postal_propietario_vehiculo').enable(true); 
				$('#colonia_propietario_vehiculo_pp').enable(true);
				$('#municipio_propietario_vehiculo_pp').enable(true); 
				$('#estado_propietario_vehiculo_pp').enable(true); 

			establecerSeDesconoceDueno:()->
				this.rad_nombre.checked=true
				$('#nombre_propietario_vehiculo').val("SE DESCONOCE")
				$('#apellido_paterno_propietario_vehiculo').val("SE DESCONOCE")
				$('#apellido_materno_propietario_vehiculo').val("SE DESCONOCE")
				$('#domicilio_propietario_vehiculo').val("SE DESCONOCE")
				$('#telefono_propietario_vehiculo').val("SE DESCONOCE")
				$('#codigo_postal_propietario_vehiculo').val("SE DESCONOCE")
				$('#colonia_propietario_vehiculo_pp').val("SE DESCONOCE")
				$('#municipio_propietario_vehiculo_pp').val("SE DESCONOCE")
				$('#estado_propietario_vehiculo_pp').val("SE DESCONOCE")

				$('#nombre_propietario_vehiculo').enable(false)
				$('#apellido_paterno_propietario_vehiculo').enable(false)
				$('#apellido_materno_propietario_vehiculo').enable(false)
				$('#domicilio_propietario_vehiculo').enable(false)
				$('#telefono_propietario_vehiculo').enable(false) 
				$('#codigo_postal_propietario_vehiculo').enable(false) 
				$('#colonia_propietario_vehiculo_pp').enable(false)
				$('#municipio_propietario_vehiculo_pp').enable(false) 
				$('#estado_propietario_vehiculo_pp').enable(false)

			establecerSeDesconoceConductor:()->
				$('#nombre_conductor_vehiculo').val("SE DESCONOCE")
				$('#appellido_paterno_conductor_vehiculo').val("SE DESCONOCE")
				$('#apellido_materno_conductor_vehiculo').val("SE DESCONOCE")
				$('#domicilio_conductor_vehiculo').val("SE DESCONOCE")
				$('#edad_conductor_vehiculo').val("SE DESCONOCE")
				$('#tipo_de_edad_conductor_vehiculo').val("SE DESCONOCE") ##
				$('#sexo_conductor_vehiculo').val("SE DESCONOCE")
				$('#colonia_conductor_vehiculo_pp').val("SE DESCONOCE")
				$('#folio_infraccion_conductor_vehiculo').val("SE DESCONOCE")
				$('#folio_certificado_medico_conductor_vehiculo').val("SE DESCONOCE")
				$('#estado_certificado_vehiculo_pp').val("SE DESCONOCE")
				$('#municipio_certificado_vehiculo_pp').val("SE DESCONOCE")
				$('#condiciones_fisicas_certificado_vehiculo_pp').val("Se Desconoce")
				$('#detenido_en_certificado_vehiculo_pp').val("DESCONOCE")
				$('#custodia_de_certificado_vehiculo').val("DESCONOCE")
				$('#disposicion_de_certificado_vehiculo').val("DESCONOCE")
				$('#persona_encontraba_certificado_vehiculo_pp').val("SE DESCONOCE")
				$('#levantado_por_certificado_vehiculo_pp').val("SE DESCONOCE")
				$('#trasladado_a_certificado_vehiculo_pp').val("SE DESCONOCE")
				$('#nolicencia_conductor').val("SE DESCONOCE")
				$('#tipo_licencia_conductor_vehiculo_pp').val("SE DESCONOCE")
				$('#restricciones_licencia_conductor_vehiculo_pp').val("SE DESCONOCE")
				$('#vigencia_licencia.input-fecha').val("SE DESCONOCE")
				$('#expedida_licencia_conductor_vehiculo_pp').val("SE DESCONOCE")

				$('#nombre_conductor_vehiculo').enable(false)
				$('#appellido_paterno_conductor_vehiculo').enable(false)
				$('#apellido_materno_conductor_vehiculo').enable(false)
				$('#domicilio_conductor_vehiculo').enable(false)
				$('#edad_conductor_vehiculo').enable(false)
				$('#tipo_de_edad_conductor_vehiculo').enable(false)
				$('#sexo_conductor_vehiculo').enable(false)
				$('#colonia_conductor_vehiculo_pp').enable(false)
				$('#folio_infraccion_conductor_vehiculo').enable(false)
				$('#folio_certificado_medico_conductor_vehiculo').enable(false)
				$('#estado_certificado_vehiculo_pp').enable(false)
				$('#municipio_certificado_vehiculo_pp').enable(false)
			disEstablecerSeDesconoceConductor:()->
				$('#nombre_conductor_vehiculo').val("")
				$('#appellido_paterno_conductor_vehiculo').val("")
				$('#apellido_materno_conductor_vehiculo').val("")
				$('#domicilio_conductor_vehiculo').val("")
				$('#edad_conductor_vehiculo').val("")
				$('#tipo_de_edad_conductor_vehiculo').val("") ##
				$('#sexo_conductor_vehiculo').val("")
				$('#colonia_conductor_vehiculo_pp').val("")
				$('#folio_infraccion_conductor_vehiculo').val("")
				$('#folio_certificado_medico_conductor_vehiculo').val("")
				$('#estado_certificado_vehiculo_pp').val("")
				$('#municipio_certificado_vehiculo_pp').val("")

				$('#nombre_conductor_vehiculo').enable(true)
				$('#appellido_paterno_conductor_vehiculo').enable(true)
				$('#apellido_materno_conductor_vehiculo').enable(true)
				$('#domicilio_conductor_vehiculo').enable(true)
				$('#edad_conductor_vehiculo').enable(true)
				$('#tipo_de_edad_conductor_vehiculo').enable(true)
				$('#sexo_conductor_vehiculo').enable(true)
				$('#colonia_conductor_vehiculo_pp').enable(true)
				$('#folio_infraccion_conductor_vehiculo').enable(true)
				$('#folio_certificado_medico_conductor_vehiculo').enable(true)
				$('#estado_certificado_vehiculo_pp').enable(true)
				$('#municipio_certificado_vehiculo_pp').enable(true)

				return
			showCapturaVehiculo:()->
				el=$("#datos_vehiculos")
				tabla=$("#tabla_vehiculos_view")
				cambios=
					height: "auto"
					width: "100%"
				el.css(cambios)
				cambiosTabla=
					height: "0px"
					width: "0%"
				tabla.css(cambiosTabla)
			mostrarTabla:()->
				el=$("#datos_vehiculos")
				tabla=$("#tabla_vehiculos_view")
				cambios=
					height: "0px"
					width: "0%"
				el.css(cambios)
				cambiosTabla=
					height: "auto"
					width: "100%"
				tabla.css(cambiosTabla)
				document.location="#editar-vehiculo"
			iniciarCalendario:->
				$('#date-vigencia-licencia').datetimepicker
					pickTime: false
					language: 'es'
			cargarDatosVehiculoEnView:(id)->
				vehiculos= window.accidente.vehiculos
				datos=null
				for vehiculo in vehiculos
					if vehiculo.intervino_como == id
						datos=vehiculo
						break
				if !datos 
					return
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
				$('#noInventario_vehiculo').val(datos.numero_inventario)
				$('#servicio_vehiculo_pp').val(datos.vehiculo_servicio)
				$('#color_vehiculo_pp').val(datos.color)
				$('#detalle_color_vehiculo').val(datos.color_detalle)
				$('#estado_vehiculo_pp').val(datos.estadov)
				$('#municipio_vehiculo').val(datos.ciudadv)
				#DATOS DEL PROPIETARIO
				if datos.tipo_dueno=="Nombre"
					this.rad_nombre.checked=true
				else
					this.rad_razon.checked=true
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
					this.rad_ebriedad.checked=true
				else if datos.conductor_estado_droga=="EBRIEDAD INCONPLETA"
					this.rad_drogas.checked=true
				else if datos.conductor_estado_droga=="BAJO INFLUJO DE DROGAS"
					this.rad_Inconpleta.checked=true
				else if datos.conductor_estado_droga=="ALIENTO ALCOHOLICO"
					this.rad_aliento.checked=true
				else if datos.conductor_estado_droga=="ESTADO NORMAL"
					this.rad_normal.checked=true
				else if datos.conductor_estado_droga=="INCONSCIENTE"
					this.rad_inconciente.checked=true
				else if datos.conductor_estado_droga=="SIN EXAMEN"
					this.rad_sinexament.checked=true

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
				$('#vigencia_licencia').val(datos.conductor_fecha_vigencia)
				$('#expedida_licencia_conductor_vehiculo_pp').val(datos.conductor_edo_licencia)
				this.showCapturaVehiculo()
			agregarVehiculo:()->
				if !this.validateFields()
					return 
				vehiculo={}
				vehiculo.intervino_como=$('#interviene_como_pp').val()
				vehiculo.clas_vehiculo=$('#desc_vehiculo_pp').val()
				vehiculo.marca=$('#marca_vehiculo_pp').val()
				vehiculo.submarca=$('#submarca_vehiculo_pp').val()
				vehiculo.modelo=$('#model_vehiculo_pp').val()
				vehiculo.tipo=$('#tipo_vehiculo_pp').val()
				vehiculo.datos_adicionales=$('#datosadicionales_vehiculo_pp').val()
				vehiculo.placa=$('#placas_vehiculo').val()
				vehiculo.serie=$('#noSerie_vehiculo').val()
				vehiculo.num_economico=$('#noeco_pp').val()
				vehiculo.capacidad=$('#capacidad_vehiculo_pp').val()
				vehiculo.num_grua=$('#nodegrua_vehiculo_pp').val()
				vehiculo.pension=$('#pension_vehiculo_pp').val()
				vehiculo.numero_inventario=$('#noInventario_vehiculo').val()
				vehiculo.vehiculo_servicio=$('#servicio_vehiculo_pp').val()
				vehiculo.color=$('#color_vehiculo_pp').val()
				vehiculo.color_detalle=$('#detalle_color_vehiculo').val()
				vehiculo.estadov=$('#estado_vehiculo_pp').val()
				vehiculo.ciudadv= $('#municipio_vehiculo').val()
				if this.rad_nombre.checked=true
					vehiculo.tipo_dueno="Nombre"
				else
					vehiculo.tipo_dueno="Razon Social"
				vehiculo.dueno_nombre=$('#nombre_propietario_vehiculo').val()
				vehiculo.dueno_apepaterno=$('#apellido_paterno_propietario_vehiculo').val()
				vehiculo.dueno_apematerno=$('#apellido_materno_propietario_vehiculo').val()
				vehiculo.dueno_calle=$('#domicilio_propietario_vehiculo').val()
				vehiculo.dueno_tel=$('#telefono_propietario_vehiculo').val()
				vehiculo.dueno_cp=$('#codigo_postal_propietario_vehiculo').val()
				vehiculo.dueno_colonia=$('#colonia_propietario_vehiculo_pp').val()
				vehiculo.dueno_ciudadp=$('#municipio_propietario_vehiculo_pp').val()
				vehiculo.dueno_estadop=$('#estado_propietario_vehiculo_pp').val()
				vehiculo.conductor_nombre=$('#nombre_conductor_vehiculo').val()
				vehiculo.conductor_apepaterno=$('#appellido_paterno_conductor_vehiculo').val()
				vehiculo.conductor_apematerno=$('#apellido_materno_conductor_vehiculo').val()
				vehiculo.conductor_calle=$('#domicilio_conductor_vehiculo').val()
				vehiculo.conductor_edad=$('#edad_conductor_vehiculo').val()
				vehiculo.conductor_tipo_edad=$('#tipo_de_edad_conductor_vehiculo').val()
				vehiculo.conductor_sexo=$('#sexo_conductor_vehiculo').val()
				vehiculo.conductor_colonia=$('#colonia_conductor_vehiculo_pp').val()
				vehiculo.folio_infraccion=$('#folio_infraccion_conductor_vehiculo').val()
				vehiculo.folio_certificado_medico=$('#folio_certificado_medico_conductor_vehiculo').val()
				if	$('#radEstadoConductorEbriedadCompleta' ).is(":checked")
					vehiculo.conductor_estado_droga=="EBRIEDAD COMPLETA"
				if	$('#radEstadoConductorEbriedadInconpleta' ).is(":checked")
					vehiculo.conductor_estado_droga=="EBRIEDAD INCONPLETA"
				else if	$('#radEstadoConductorBajoInflujoDrogas').is(":checked")
					vehiculo.conductor_estado_droga=="BAJO INFLUJO DE DROGAS"
				else if $('#radEstadoConductorAlientoAlcoholico' ).is(":checked")
					vehiculo.conductor_estado_droga=="ALIENTO ALCOHOLICO"
				else if $('#radEstadoConductorEstadoNormal' ).is(":checked")
					vehiculo.conductor_estado_droga=="ESTADO NORMAL"
				else if $('#radEstadoConductorInconsciente' ).is(":checked")
					vehiculo.conductor_estado_droga=="INCONSCIENTE"
				else if $('#radEstadoConductorSinExamen' ).is(":checked")
					vehiculo.conductor_estado_droga=="SIN EXAMEN"

				vehiculo.conductor_estado=$('#estado_certificado_vehiculo_pp').val()
				vehiculo.conductor_municipio=$('#municipio_certificado_vehiculo_pp').val()
				vehiculo.estado_herido=$('#condiciones_fisicas_certificado_vehiculo_pp').val()
				vehiculo.conductor_detenido_en=$('#detenido_en_certificado_vehiculo_pp').val()
				vehiculo.conductor_custodia=$('#custodia_de_certificado_vehiculo').val()
				vehiculo.conductor_disposicion=$('#disposicion_de_certificado_vehiculo').val()
				vehiculo.conductor_se_encontraba=$('#persona_encontraba_certificado_vehiculo_pp').val()
				vehiculo.conductor_levantado_por=$('#levantado_por_certificado_vehiculo_pp').val()
				vehiculo.conductor_trasladado_a=$('#trasladado_a_certificado_vehiculo_pp').val()
				vehiculo.conductor_num_licencia=$('#nolicencia_conductor').val()
				vehiculo.conductor_rest_licencia=$('#restricciones_licencia_conductor_vehiculo_pp').val()
				vehiculo.conductor_fecha_vigencia=$('#vigencia_licencia').val()
				vehiculo.conductor_edo_licencia=$('#expedida_licencia_conductor_vehiculo_pp').val()
				this.addVehiculoToArray(vehiculo)
				this.addSaldoSangre()
				this.addCompetenciaJudicial()
				this.sandbox.emit("actualizar-tabla-vehiculos")
				this.sandbox.emit("show-tabla-vehiculos_c")
				this.sandbox.emit('actualizar-tabla-saldo-sangre')
				this.sandbox.emit('actualizar-tabla-competencia-judicial')
				
				this.cancelar()
			addVehiculoToArray:(vehi)->
				vehiculos= window.accidente.vehiculos
				encontro=false
				index=0
				for vehiculo,i in vehiculos
					if vehiculo.intervino_como == vehi.intervino_como
						encontro=true
						index=i
				if encontro
					vehiculos[index]= vehi
				else
					vehiculos.push(vehi)

			addSaldoSangre:()->
				vehiculos= window.accidente.vehiculos
				window.accidente.saldosSangres=[]
				for vehiculo in vehiculos
					saldo={}
					if vehiculo.estado_herido=='Lesionado' or vehiculo.estado_herado=='Lesionado y Detenido' or  vehiculo.estado_herado=='Finado'
						saldo.nombre= vehiculo.conductor_nombre + " " + vehiculo.conductor_apepaterno + " " + vehiculo.conductor_apematerno
						saldo.edad=vehiculo.conductor_edad
						saldo.domicilio=vehiculo.conductor_calle
						saldo.se_encontraba=vehiculo.conductor_se_encontraba
						saldo.estado_herido=vehiculo.estado_herido
						saldo.levantado_por=vehiculo.conductor_levantado_por
						saldo.trasladado_a=vehiculo.conductor_trasladado_a
						window.accidente.saldoSangres.push(saldo)
			addCompetenciaJudicial:()->
				vehiculos= window.accidente.vehiculos
				window.accidente.competenciaJudiciales=[]
				for vehiculo in vehiculos
					competencia={}
					if vehiculo.estado_herido=='Detenido' or vehiculo.estado_herado=='Lesionado y Detenido'
						competencia.nombre= vehiculo.conductor_nombre + " " + vehiculo.conductor_apepaterno + " " + vehiculo.conductor_apematerno
						competencia.edad=vehiculo.conductor_edad
						competencia.domicilio=vehiculo.conductor_calle
						competencia.se_encontraba=vehiculo.conductor_se_encontraba
						competencia.estado_herido=vehiculo.estado_herido
						competencia.detenido_en=vehiculo.conductor_detenido_en
						competencia.disposicion=vehiculo.conductor_disposicion
						window.accidente.competenciaJudiciales.push(competencia)
			activateEqualDuenoConductor:(bandera)->
				$('#nombre_conductor_vehiculo').val($('#nombre_propietario_vehiculo').val())
				$('#appellido_paterno_conductor_vehiculo').val($('#apellido_paterno_propietario_vehiculo').val())
				$('#apellido_materno_conductor_vehiculo').val($('#apellido_materno_propietario_vehiculo').val())
				$('#domicilio_conductor_vehiculo').val($('#domicilio_propietario_vehiculo').val())
				$('#nombre_conductor_vehiculo').prop('disabled',bandera)
				$('#appellido_paterno_conductor_vehiculo').prop('disabled',bandera)
				$('#apellido_materno_conductor_vehiculo').prop('disabled',bandera)
				$('#domicilio_conductor_vehiculo').prop('disabled',bandera)
			limpiarValidate:()->
				$('.add-ve').removeClass('error')
				$('.add-ve').removeClass('success')

			validateFields:()->

				that=this
				that.limpiarValidate()
				
				if $('#interviene_como_pp').val()== ''
					this.showFieldError($("#interviene_como_pp"),"Es necesario establecer interviene como")
					return false
				else
					this.showFieldSuccess($("#interviene_como_pp"))

				val_marca= $('#marca_vehiculo_pp').val()
				if $('#marca_vehiculo_pp').val()==''
					this.showFieldError($("#marca_vehiculo_pp"),"Es necesario establecer la marca")
					return false
				else
					rr= window.validateMarca(val_marca)
					if !rr.res
						this.showFieldError($("#marca_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#marca_vehiculo_pp"))
				val_submarca=$('#submarca_vehiculo_pp').val()
				if $('#submarca_vehiculo_pp').val()==''
					this.showFieldError($("#submarca_vehiculo_pp"),"Es necesario establecer la submarca")
					return false
				else
					rr= window.validateSubMarca(val_submarca)
					if !rr.res
						this.showFieldError($("#submarca_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#submarca_vehiculo_pp"))
				if $('#model_vehiculo_pp').val()=='NO'
					this.showFieldError($("#model_vehiculo_pp"),"Es necesario establecer el modelo del vehículo")
					return false
				else
					this.showFieldSuccess($("#model_vehiculo_pp"))
				if $('#tipo_vehiculo_pp').val()=='NO'
					this.showFieldError($("#tipo_vehiculo_pp"),"Es necesario establecer el tipo de vehículo")
					return false
				else
					this.showFieldSuccess($("#tipo_vehiculo_pp"))

				if $('#placas_vehiculo').val()==''
					this.showFieldError($("#placas_vehiculo"),"Es necesario establecer las placas")
					return false
				else
					this.showFieldSuccess($("#placas_vehiculo"))
				
				if $('#noSerie_vehiculo').val()==''
					this.showFieldError($("#noSerie_vehiculo"),"Es necesario establecer la serie")
					return false
				else
					this.showFieldSuccess($("#noSerie_vehiculo"))

				if $('#capacidad_vehiculo_pp').val()==''
					this.showFieldError($("#capacidad_vehiculo_pp"),"Es necesario establecer la capacidad del vehículo")
					return false
				else
					this.showFieldSuccess($("#capacidad_vehiculo_pp"))
				if $('#clase_vehiculo_pp').val()=='NO'
					this.showFieldError($("#clase_vehiculo_pp"),"Es necesario establecer la clase del vehículo")
					return false
				else
					this.showFieldSuccess($("#clase_vehiculo_pp"))

				if $('#color_vehiculo_pp').val()=='NO'
					this.showFieldError($("#color_vehiculo_pp"),"Es necesario establecer color del vehiculo")
					return false
				else
					this.showFieldSuccess($("#color_vehiculo_pp"))
				val_estado=$('#estado_vehiculo_pp').val()
				if $('#estado_vehiculo_pp').val()==''
					this.showFieldError($("#estado_vehiculo_pp"),"Es necesario seleccionar el estado del vehículo")
					return false
				else
					rr= window.validateEstado(val_estado)
					if !rr.res
						this.showFieldError($("#estado_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#estado_vehiculo_pp"))

				val_municipio=$('#municipio_vehiculo_pp').val()
				if $('#municipio_vehiculo_pp').val()==''
					this.showFieldError($("#municipio_vehiculo_pp"),"Es necesario seleccionar el municipio del vehículo")
					return false
				else
					rr= window.validateMunicipio(val_municipio)
					if !rr.res
						this.showFieldError($("#municipio_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#municipio_vehiculo_pp"))
				###
				#DATOS DEL PROPIETARIO
				###
				if this.rad_nombre.checked==false and this.rad_razon.checked==false
					$("#tipoDuenoNombre").parents("div.control-group").addClass("error")
					$("#msg-tipo-propietario").html('Debes elegir una opción')
					return false
				else
					$("#tipoDuenoNombre").parents("div.control-group").addClass("success")
					$("#msg-tipo-propietario").html('')

				if $('#nombre_propietario_vehiculo').val()==''
					this.showFieldError($("#nombre_propietario_vehiculo"),"Es necesario establecer El nombre")
					return false
				else
					this.showFieldSuccess($("#nombre_propietario_vehiculo"))

				if $('#apellido_paterno_propietario_vehiculo').val()==''
					this.showFieldError($("#apellido_paterno_propietario_vehiculo"),"Es necesario establecer el Apellido Paterno del propietario")
					return false
				else
					this.showFieldSuccess($("#apellido_paterno_propietario_vehiculo"))


				if $('#apellido_materno_propietario_vehiculo').val()==''
					this.showFieldError($("#apellido_materno_propietario_vehiculo"),"Es necesario establecer el Apellido Materno del propietario")
					return false
				else
					this.showFieldSuccess($("#apellido_materno_propietario_vehiculo"))

				if $('#domicilio_propietario_vehiculo').val()==''
					this.showFieldError($("#domicilio_propietario_vehiculo"),"Es necesario establecer el Domicilio del propietario")
					return false
				else
					this.showFieldSuccess($("#domicilio_propietario_vehiculo"))

				if $('#telefono_propietario_vehiculo').val()==''
					this.showFieldError($("#telefono_propietario_vehiculo"),"Es necesario establecer el teléfono del propietario")
					return false
				else
					this.showFieldSuccess($("#telefono_propietario_vehiculo"))

				if $('#codigo_postal_propietario_vehiculo').val()==''
					this.showFieldError($("#codigo_postal_propietario_vehiculo"),"Es necesario establecer el codigo postal del propietario")
					return false
				else
					this.showFieldSuccess($("#codigo_postal_propietario_vehiculo"))
				val_colonia=$('#colonia_propietario_vehiculo_pp').val()
				if $('#colonia_propietario_vehiculo_pp').val()==''
					this.showFieldError($("#colonia_propietario_vehiculo_pp"),"Es necesario establecer colonia del propietario")
					return false
				else
					rr=window.validateColonia(val_colonia)
					if !rr.res
						this.showFieldError($("#colonia_propietario_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#colonia_propietario_vehiculo_pp"))
					
				val_municipio=$('#municipio_propietario_vehiculo_pp').val()
				if $('#municipio_propietario_vehiculo_pp').val()==''
					this.showFieldError($("#municipio_propietario_vehiculo_pp"),"Es necesario establecer municipio del propietario")
					return false
				else
					rr=window.validateMunicipio(val_municipio)
					if !rr.res
						this.showFieldError($("#municipio_propietario_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#municipio_propietario_vehiculo_pp"))
				val_estado=$('#estado_propietario_vehiculo_pp').val()
				if $('#estado_propietario_vehiculo_pp').val()==''
					this.showFieldError($("#estado_propietario_vehiculo_pp"),"Es necesario establecer estado del propietario")
					return false
				else
					rr=window.validateEstado(val_estado)
					if !rr.res
						this.showFieldError($("#estado_propietario_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#estado_propietario_vehiculo_pp"))
				
				#VALIDANDO CONDUCTOR
				if $('#nombre_conductor_vehiculo').val()==''
					this.showFieldError($("#nombre_conductor_vehiculo"),"Es necesario establecer El nombre")
					return false
				else
					this.showFieldSuccess($("#nombre_conductor_vehiculo"))
				
				if $('#appellido_paterno_conductor_vehiculo').val()==''
					this.showFieldError($("#appellido_paterno_conductor_vehiculo"),"Es necesario establecer El apellido")
					return false
				else
					this.showFieldSuccess($("#appellido_paterno_conductor_vehiculo"))

				if $('#apellido_materno_conductor_vehiculo').val()==''
					this.showFieldError($("#apellido_materno_conductor_vehiculo"),"Es necesario establecer El apellido")
					return false
				else
					this.showFieldSuccess($("#apellido_materno_conductor_vehiculo"))

				if $('#domicilio_conductor_vehiculo').val()==''
					this.showFieldError($("#domicilio_conductor_vehiculo"),"Es necesario establecer El Domicilio")
					return false
				else
					this.showFieldSuccess($("#domicilio_conductor_vehiculo"))

				val_edad=$('#edad_conductor_vehiculo').val()
				if $('#edad_conductor_vehiculo').val()==''
					this.showFieldError($("#edad_conductor_vehiculo"),"Es necesario establecer La edad")
					return false
				else
					rr=window.validateEdad(val_edad)
					if !rr.res
						this.showFieldError($("#edad_conductor_vehiculo"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#edad_conductor_vehiculo"))

				if $('#sexo_conductor_vehiculo').val()=='NO'
					this.showFieldError($("#sexo_conductor_vehiculo"),"Es necesario establecer el sexo del conductor")
					return false
				else
					this.showFieldSuccess($("#sexo_conductor_vehiculo"))
				val_colonia=$('#colonia_conductor_vehiculo_pp').val()
				if $('#colonia_conductor_vehiculo_pp').val()==''
					this.showFieldError($("#colonia_conductor_vehiculo_pp"),"Es necesario establecer colonia del propietario")
					return false
				else
					rr=window.validateColonia(val_colonia)
					if !rr.res
						this.showFieldError($("#colonia_conductor_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#colonia_conductor_vehiculo_pp"))
				if $('#folio_infraccion_conductor_vehiculo').val()==''
					this.showFieldError($("#folio_infraccion_conductor_vehiculo"),"Es necesario establecer el folio de infracción")
					return false
				else
					this.showFieldSuccess($("#folio_infraccion_conductor_vehiculo"))
				if this.rad_ebriedad.checked== false and this.rad_inconpleta.cheked== false and this.rad_drogas.checked== false and this.rad_aliento.checked== false and this.rad_normal.checked== false and this.rad_inconciente.checked== false and this.rad_sinexamen.checked== false
					$("#radEstadoConductorEbriedadCompleta").parents("div.control-group").addClass("error")
					$("#msg-estado-drogas").html('Debes elegir una opción')
					return false
				else
					$("#radEstadoConductorEbriedadCompleta").parents("div.control-group").addClass("success")
					$("#msg-estado-drogas").html('')
				val_estado=$("#estado_certificado_vehiculo_pp").val()
				if $('#estado_certificado_vehiculo_pp').val()==''
					this.showFieldError($("#estado_certificado_vehiculo_pp"),"Es necesario establecer estado del conductor")
					return false
				else
					rr=window.validateEstado(val_estado)
					if !rr.res
						this.showFieldError($("#estado_certificado_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#estado_certificado_vehiculo_pp"))

				val_municipio=$('#municipio_certificado_vehiculo_pp').val()
				if $('#municipio_certificado_vehiculo_pp').val()==''
					this.showFieldError($("#municipio_certificado_vehiculo_pp"),"Es necesario establecer municipio del conductor")
					return false
				else
					rr=window.validateMunicipio(val_municipio)
					if !rr.res
						this.showFieldError($("#municipio_certificado_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#municipio_certificado_vehiculo_pp"))
				if $('#condiciones_fisicas_certificado_vehiculo_pp').val()=='SEL'
					this.showFieldError($("#condiciones_fisicas_certificado_vehiculo_pp"),"Es necesario establecer las condiciones físicas del conductor")
					return false
				else
					this.showFieldSuccess($("#condiciones_fisicas_certificado_vehiculo_pp"))
				 
				if $('#detenido_en_certificado_vehiculo_pp').val()=='SEL'
					this.showFieldError($("#detenido_en_certificado_vehiculo_pp"),"Es necesario establecer detenido en")
					return false
				else
					this.showFieldSuccess($("#detenido_en_certificado_vehiculo_pp"))

				if $('#custodia_de_certificado_vehiculo').val()=='SEL'
					this.showFieldError($("#custodia_de_certificado_vehiculo"),"Es necesario establecer custodia en")
					return false
				else
					this.showFieldSuccess($("#custodia_de_certificado_vehiculo"))

				if $('#disposicion_de_certificado_vehiculo').val()=='SEL'
					this.showFieldError($("#disposicion_de_certificado_vehiculo"),"Es necesario establecer la disposicion de")
					return false
				else
					this.showFieldSuccess($("#disposicion_de_certificado_vehiculo"))

				if $('#persona_encontraba_certificado_vehiculo_pp').val()=='SEL'
					this.showFieldError($("#persona_encontraba_certificado_vehiculo_pp"),"Es necesario establecer se encontraba")
					return false
				else
					this.showFieldSuccess($("#persona_encontraba_certificado_vehiculo_pp"))

				if $('#levantado_por_certificado_vehiculo_pp').val()=='SEL'
					this.showFieldError($("#levantado_por_certificado_vehiculo_pp"),"Es necesario establecer levantado por")
					return false
				else
					this.showFieldSuccess($("#levantado_por_certificado_vehiculo_pp"))

				if $('#trasladado_a_certificado_vehiculo_pp').val()=='SEL'
					this.showFieldError($("#trasladado_a_certificado_vehiculo_pp"),"Es necesario trasladado a")
					return false
				else
					this.showFieldSuccess($("#trasladado_a_certificado_vehiculo_pp"))
				###
				if $('#nolicencia_conductor').val()==''
				if $('#restricciones_licencia_conductor_vehiculo_pp').val()==''
				if $('#vigencia_licencia').val()==''
				if $('#expedida_licencia_conductor_vehiculo_pp').val()==''
				###
				val_estado=$('#expedida_licencia_conductor_vehiculo_pp').val()
				if $('#expedida_licencia_conductor_vehiculo_pp').val()!=''
				 	rr=window.validateEstado(val_estado)
					if !rr.res
						this.showFieldError($("#expedida_licencia_conductor_vehiculo_pp"),rr.msg)
						return false
					else
						this.showFieldSuccess($("#expedida_licencia_conductor_vehiculo_pp"))
				this.quitarClases()
				return true
			quitarClases:()->
				$(".add-ve").removeClass("success")
				$(".add-ve").removeClass("error")
			showFieldError:(item,msg)->
				padre= item.parents("div.control-group")
				padre.addClass('error')
				padre.children('.help-inline').html(msg)
				item.focus()
			showFieldSuccess:(item)->
				padre= item.parents("div.control-group")
				padre.addClass('success')
				padre.children('.help-inline').html('')	
			cancelar:()->
				$('#interviene_como_pp').val('')
				$('#desc_vehiculo_pp').val('')
				$('#marca_vehiculo_pp').val('')
				$('#submarca_vehiculo_pp').val('')
				$('#model_vehiculo_pp').val('')
				$('#tipo_vehiculo_pp').val('')
				$('#datosadicionales_vehiculo_pp').val('') ##
				$('#placas_vehiculo').val('')
				$('#noSerie_vehiculo').val('')
				$('#noeco_pp').val('')
				$('#capacidad_vehiculo_pp').val('')
				$('#nodegrua_vehiculo_pp').val('')
				$('#pension_vehiculo_pp').val('')
				$('#noInventario_vehiculo').val('')
				$('#servicio_vehiculo_pp').val('')
				$('#color_vehiculo_pp').val('')
				$('#detalle_color_vehiculo').val('')
				$('#estado_vehiculo_pp').val('')
				$('#municipio_vehiculo').val('')
				#DATOS DEL PROPIETARIO
				$('#tipoDuenoNombre').attr("checked",false)
				$('#tipoDuenoRazonSocial').attr("checked",false)
				$('#nombre_propietario_vehiculo').val('')
				$('#apellido_paterno_propietario_vehiculo').val('')
				$('#apellido_materno_propietario_vehiculo').val('')
				$('#domicilio_propietario_vehiculo').val('')
				$('#telefono_propietario_vehiculo').val('')
				$('#codigo_postal_propietario_vehiculo').val('')
				$('#colonia_propietario_vehiculo_pp').val('')
				$('#municipio_propietario_vehiculo_pp').val('')
				$('#estado_propietario_vehiculo_pp').val('')
				$('#nombre_conductor_vehiculo').val('')
				$('#appellido_paterno_conductor_vehiculo').val('')
				$('#apellido_materno_conductor_vehiculo').val('')
				$('#domicilio_conductor_vehiculo').val('')
				$('#edad_conductor_vehiculo').val('')
				$('#tipo_de_edad_conductor_vehiculo').val('') ##
				$('#sexo_conductor_vehiculo').val('')
				$('#colonia_conductor_vehiculo_pp').val('')
				$('#folio_infraccion_conductor_vehiculo').val('')
				$('#folio_certificado_medico_conductor_vehiculo').val('')
				$('#radEstadoConductor0').attr("checked",true)
				$('#estado_certificado_vehiculo_pp').val('')
				$('#municipio_certificado_vehiculo_pp').val('')
				$('#condiciones_fisicas_certificado_vehiculo_pp').val('')
				$('#detenido_en_certificado_vehiculo_pp').val('')
				$('#custodia_de_certificado_vehiculo').val('')
				$('#disposicion_de_certificado_vehiculo').val('')
				$('#persona_encontraba_certificado_vehiculo_pp').val('')
				$('#levantado_por_certificado_vehiculo_pp').val('')
				$('#trasladado_a_certificado_vehiculo_pp').val('')
				$('#nolicencia_conductor').val('')
				$('#restricciones_licencia_conductor_vehiculo_pp').val('')
				$('#vigencia_licencia').val('')
				$('#expedida_licencia_conductor_vehiculo_pp').val('')
				this.quitarClases()
				this.mostrarTabla()

			llenarMarcas:()->
				if !window.marcas
					cargarMarcas this.llenarMarcas
				else
					sel=$("#marca_vehiculo_pp").html("")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					a_marcas=[]
					for marca in window.marcas
						a_marcas[marca.marca]=1
					for nombre in _.keys(a_marcas)
						opciones+='<option value="' + nombre + '">' + nombre + '</option>';
					sel.append opciones

				return
			llenarTipoVehiculos:()->
				if !window.tipoVehiculos
					cargarTipoVehiculos this.llenarTipoVehiculos
				else
					sel=$("#tipo_vehiculo_pp").html("")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for tipoVehiculo in window.tipoVehiculos
						 
						opciones+='<option value="' + tipoVehiculo.tipo + '">' + tipoVehiculo.tipo + '</option>';
					sel.append opciones
				return
			llenarPensiones:->
				if !window.pensiones
					cargarPensiones this.llenarPensiones
				else
					sel=$("#pension_vehiculo_pp").html("")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for pension in window.pensiones
						 
						opciones+='<option value="' + pension.nombre_pension + '">' + pension.nombre_pension + '</option>';
					sel.append opciones
				return
			llenarColores:->
				if !window.colores
					cargarColores this.llenarColores
				else
					sel=$("#color_vehiculo_pp").html("")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for color in window.colores
						 
						opciones+='<option value="' + color.color + '">' + color.color + '</option>';
					sel.append opciones
				return

			llenarModelos:()->
				sel=$('#model_vehiculo_pp').html("");
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for x in [2018..1910]
					opciones += '<option value="' + x + '">' + x + '</option>'
				opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
				sel.append(opciones)
				return
			llenarDescVehiculos:->
				if !window.descVehiculos
					cargarDescVehiculos this.llenarDescVehiculos
				else
					$("#desc_vehiculo_pp").html('')
					sel =$("#desc_vehiculo_pp")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for item in window.descVehiculos
						opciones+='<option value="' + item.descripcion + '">' + item.descripcion + '</option>';
					sel.append opciones

				return
			llenarClasVehiculos:->
				sel=$('#servicio_vehiculo_pp').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				opciones+='<option value="Servicio Particular">Servicio Particular</option>';
				opciones+='<option value="Servicio Public">ServicioPublico</option>';
				opciones+='<option value="Servicio Publico Federal">Servicio Publico Federal</option>';
				sel.append(opciones)
			llenarMunicipios:->
				if !window.municipios
					cargarMunicipios this.llenarMunicipios
				else
					nombres=[]
					for item in window.municipios
								 
								nombres.push item.municipio
					$("#municipio_vehiculo_pp").autocomplete
						source:nombres
				return
			llenarEstados:->
				if !window.estados
						cargarEstados this.llenarEstados
				else
					nombres=[]
					for item in window.estados
						 
						nombres.push item.estado
				$("#estado_vehiculo_pp").autocomplete
					source:nombres
				return
			llenarColonia_propietarios:->
				if !window.colonias
					cargarColonias this.llenarColonia_propietarios
				else
					nombres=[]
					for item in window.colonias
						nombres.push item.nombre
					$("#colonia_propietario_vehiculo_pp").autocomplete
						source:nombres
				return
			llenarMunicipio_propietarios:->
				if !window.municipios
					cargarMunicipios this.llenarMunicipio_propietarios
				else
					nombres=[]
					for item in window.municipios
						 
						nombres.push item.municipio
					$("#municipio_propietario_vehiculo_pp").autocomplete
						source:nombres
				return
			llenarEstado_propietarios:->
				if !window.estados
						cargarEstados this.llenarEstado_propietarios
				else
					nombres=[]
					for item in window.estados
						 
						nombres.push item.estado
				$("#estado_propietario_vehiculo_pp").autocomplete
					source:nombres
				return
			llenarColonia_conductores:->
				if !window.colonias
					cargarColonias this.llenarColonia_conductores
				else
					nombres=[]
					for item in window.colonias
						 
						nombres.push item.nombre
					$("#colonia_conductor_vehiculo_pp").autocomplete
						source:nombres
				return
			llenarMunicipio_conductores:->
				if !window.municipios
					cargarMunicipios this.llenarMunicipio_conductores
				else
					nombres=[]
					for item in window.municipios
						 
						nombres.push item.municipio
					$("#municipio_certificado_vehiculo_pp").autocomplete
						source:nombres
				return
			llenarEstado_conductores:->
				if !window.estados
						cargarEstados this.llenarEstado_conductores
				else
					nombres=[]
					for item in window.estados
						 
						nombres.push item.estado
				$("#estado_certificado_vehiculo_pp").autocomplete
					source:nombres
				return
				 
			llenarAccEdoConductores:->
				if !window.accEdoConductores
					cargarAccEdoConductores this.llenarAccEdoConductores
				else
					sel=$("#condiciones_fisicas_certificado_vehiculo_pp")
					
					#ss=$("#estado_ss")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for accEdoConductor in window.accEdoConductores
						 
						opciones+='<option value="' + accEdoConductor.descripcion + '">' + accEdoConductor.descripcion + '</option>';
					opciones+='<option  value="NO">NO</option>'
					sel.append opciones
					
					##ss.append opciones
				return
			llenarAccEdoFisicos:->
				if !window.accEdoFisicos
					cargarAccEdoFisicos this.llenarAccEdoFisicos
				else
					sel=$("#persona_encontraba_certificado_vehiculo_pp")
					sel_cj=$("#seencontraba_cj")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for estado in window.accEdoFisicos
						opciones+='<option value="' + estado.estado + '">' + estado.estado + '</option>';
					sel.append opciones
					sel_cj.append opciones
				return
			llenarEnCustodias:()->
				if !window.enCustodias
					cargarEnCustodias this.llenarEnCustodias
				else
					sel=$("#custodia_de_certificado_vehiculo")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for custodia in window.enCustodias
						opciones+='<option value="' + custodia.custodia + '">' + custodia.custodia + '</option>';
					opciones+='<option value="NO">NO</option>'
					sel.append opciones
			llenarTbDetenidos:->
				if !window.tbDetenidos
					cargarTbDetenidos this.llenarTbDetenidos
				else
					sel=$("#detenido_en_certificado_vehiculo_pp")
					disposicion=$("#disposicion_de_certificado_vehiculo")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					opciones+='<option  value="DESCONOCE">SE DESCONOCE</option>'
					for detenido in window.tbDetenidos
						opciones+='<option value="' + detenido.descripcion + '">' + detenido.descripcion + '</option>';
					opciones+='<option  value="DESCONOCE">SE DESCONOCE</option>'
					sel.append opciones
				return
			llenarTbLevantadoPors:->
				if !window.tbLevantadoPors
					cargarTbLevantadoPors this.llenarTbLevantadoPors
				else
					sel=$("#levantado_por_certificado_vehiculo_pp")
					sel_ss=$("#levantadopor_ss")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for levantadoPor in window.tbLevantadoPors
						 
						opciones+='<option value="' + levantadoPor.descripcion + '">' + levantadoPor.descripcion + '</option>';
					sel.append opciones
					sel_ss.append opciones
				return
				 
			llenarTbTrasladadoas:->
				if !window.tbTrasladadoas
					cargarTbTrasladadoas this.llenarTbTrasladadoas
				else
					sel=$("#trasladado_a_certificado_vehiculo_pp")
					sel_ss=$("#trasladadoa_ss")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for tbTrasladadoa in window.tbTrasladadoas
						 
						opciones+='<option value="' + tbTrasladadoa.descripcion + '">' + tbTrasladadoa.descripcion + '</option>';
					opciones+='<option  value="NO">NO</option>'
					sel.append opciones
					sel_ss.append opciones
				return
			llenarCapVehs:->
				if !window.capVehs
					cargarCapVehs this.llenarCapVehs
				else
					sel=$("#capacidad_vehiculo_pp")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for capacidad in window.capVehs
						opciones+='<option value="' + capacidad.descripcion + '">' + capacidad.descripcion + '</option>';
					sel.append opciones

			llenarTbTipoLicencias:->
				if !window.tbTipoLicencias
					cargarTbTipoLicencias this.llenarTbTipoLicencias
				else
					sel=$("#tipo_licencia_conductor_vehiculo_pp")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for tbTipoLicencia in window.tbTipoLicencias
						opciones+='<option value="' + tbTipoLicencia.tipo_licencia + '">' + tbTipoLicencia.tipo_licencia + '</option>';
					sel.append opciones
				return
			llenarAccRestriccionesLicencias:->
				if !window.accRestriccionesLicencias
					cargarAccRestriccionesLicencias this.llenarAccRestriccionesLicencias
				else
					sel=$("#restricciones_licencia_conductor_vehiculo_pp")
					opciones='<option  value="NO">**SELECCIONAR**</option>'
					for accRestriccionesLicencia in window.accRestriccionesLicencias
						opciones+='<option value="' + accRestriccionesLicencia.descripcion + '">' + accRestriccionesLicencia.descripcion + '</option>';
					sel.append opciones
				return
			llenarEstadoLicenciaConductores:->
				if !window.estados
						cargarEstados this.llenarEstadoLicenciaConductores
				else
					nombres=[]
					for item in window.estados
						 
						nombres.push item.estado
				$("#expedida_licencia_conductor_vehiculo_pp").autocomplete
					source:nombres
				return