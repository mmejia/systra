define [
 'infracciones/ManagerArticulosServParticularInf'
 'infracciones/ManagerRecojeDocumentoInf'
 'infracciones/ManagerDatosInfractorServParticularInf'
 'infracciones/ManagerCaracteristicasVehiculoServParticularInf'
 'infracciones/ManagerDatosLicenciaServParticularInf'
 'infracciones/ManagerCertificadoMedicoServParticularInf'
 'infracciones/ManagerTipoServicioPublicoInf'
 'infracciones/ManagerMenuMain'
 'infracciones/ManagerSelPuntoGoogleViewInf'
 'core/sandbox'
],(articulos,documentos,datosInfractor,caracteristicasVehiculos,datosLicencia,certificadoMedico,tipoServicioPublico,mod_manager_menu,sel_punto,sandbox)->
				ManagerServicioParticlarInf=
					padreId:"#ManagerServicioParticular"
					elementId:"#ServicioParticularInf"
					element:null
					template:null
					padre:null
					observaciones:null
					delegacion:null
					rad_servicio_particular:null
					rad_servicio_publico:null
					rad_taxi:null
					rad_urbano:null
					rad_foraneo:null
					rad_policia:null
					rad_transito:null
					iniciar:()-> 
						that=this
						this.padre= $ this.padreId
						this.sandbox= new sandbox this
						this.observaciones=$("#observaciones_inf").wysihtml5()
						this.sandbox.on 'limpiar-observaciones', this.limpiarObservaciones
						this.sandbox.on 'llenar-observaciones', this.llenarObservaciones
						this.sandbox.on 'cargar-infraccion-en-view',that.llenarInfraccion
						this.delegacion=$('#delegacion_spa_inf')
						this.delegacion.on 'change',(evento)->
							valor= $('#' + evento.currentTarget.id).val()
							window.actualizarComandanciaValor(valor)
							return
						this.rad_servicio_particular= document.getElementById("radioServicioParticular")
						this.rad_servicio_publico= document.getElementById("radioServicioPublico")
						this.rad_taxi=document.getElementById("rd_taxi_spa_inf")
						this.rad_urbano=document.getElementById("rd_urbano_spa_inf")
						this.rad_foraneo=document.getElementById("rd_foraneo_spa_inf")
						this.rad_policia=document.getElementById("rd_policia_spa_inf(")
						this.rad_transito=document.getElementById("rd_transito_spa_inf")
						$('#folio_infraccion').change (evento)->
							disponibles = $(this).autocomplete( "option", "source" );
							val=$(this).val()
							for disp in disponibles
								if "" + disp.label == "" + val
									for p in window.profiles
										if p
											if "" + p.cobro ==  "" + disp.folio_agente
												$("#nom-cobro-agente-inf").val( p.cobro)
												$("#nombre-agente-inf").val( p.nombre)
												$("#delegacion_spa_inf").val( p.delegacion)
												$("#comandancia_spa_inf").val( p.comandancia)
												$("#turno_spa_inf").val( p.turno)
												return 
						articulos.iniciar()
						documentos.iniciar()
						datosInfractor.iniciar()
						caracteristicasVehiculos.iniciar()
						certificadoMedico.iniciar()
						tipoServicioPublico.iniciar()
						sel_punto.iniciar()
						mod_manager_menu.iniciar()
						if !window.infraccion
							this.llenarFoliosDisponibles()
							this.llenarProfiles()
							this.llenarDelegaciones()
							#this.llenarComandancias()
							this.llenarTurnos()
							this.llenarColonias()
							this.llenarCalles()
							this.llenarOperativos()
							this.llenarCirculaciones()

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
								that.llenarProfiles()
								that.llenarDelegaciones()
								#this.llenarComandancias()
								that.llenarTurnos()
								that.llenarColonias()
								that.llenarCalles()
								that.llenarOperativos()
								that.llenarCirculaciones()
								that.llenarInfraccion()
						$('#myTab a').click (e)->
							e.preventDefault()
							$(this).tab 'show'
						this.delegacion.on 'change',(evento)->
							valor= $('#' + evento.currentTarget.id).val()
							window.actualizarComandanciaValor(valor)
							return
						return
					llenarFoliosDisponibles:->
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

					cancelar:->
						$('#folio_infraccion').val('')
						$('#nombre-agente-inf').val('')
						$('#nom-cobro-agente-inf').val('')
						$('#optServicioParticular').attr("checked",false)
						$('#delegacion_spa_inf').val('')
						$('#comandancia_spa_inf').val('')
						$('#turno_spa_inf').val('')
						$('#colonia_spa_inf').val('')
						$('#calle1_spa_inf').val('')
						$('#calle2_spa_inf').val('')
						$('#referencia_spa_inf').val('')
						$('#lat_inf').val('')
						$('#lng_inf').val('')
						$('#tipo_operativo_spa_inf').val('')
						this.sandbox.emit 'limpiar-articulos'
						this.sandbox.emit 'limpiar-recoje'
						this.sandbox.emit 'limpiar-infractor'
						this.sandbox.emit 'limpiar-caracteristicas-vehiculo'
						this.sandbox.emit 'limpiar-certificado-medico'
						$('#si_firmo_inf').attr("checked",false)
						$('#no_firmo_inf').attr("checked",false)
						this.limpiarObservaciones()
					limpiarObservaciones:->
						w5ref= this.observaciones.data('wysihtml5')
						if w5ref
							w5ref.editor.clear()
						else
							this.observaciones.html('')
						return
					reiniciarInfraccion:()->
						window.infraccion={}
						window.infraccion.articulos=[]
						window.infraccion.se_recoje=[]
						window.infractor={}
						window.vehiculo={}
						window.certificado={}
					agregarInfraccion:->
						inf= window.infraccion
						inf.folio_infraccion= $('#folio_infraccion').val()
						inf.nombreAgente=$('#nombre-agente-inf').val()
						inf.noCobro=$('#nom-cobro-agente-inf').val()
						if this.rad_servicio_particular.checked==true
							this.rad_servicio_particular.checked=true
							inf.tipo_servicio="Servicio Particular"
						else if this.rad_servicio_publico == true
							inf.tipo_servicio="Servicio Publico"
							if this.rad_taxi.checked==true
								inf.tipo_publico="Taxi"
							if this.rad_urbano.checked== true
								inf.tipo_publico="Urbano"
							if this.rad_foraneo.checked== true
								inf.tipo_publico="Foráneo"
							if this.rad_policia.checked==true
								inf.tipo_publico="Policía"
							if this.rad_transito.checked==true
								inf.tipo_publico="Tránsito"
						else
							inf.tipo_servicio="Servicio Particular"
						
						inf.fecha=$('#fecha_inf').val()
						inf.hora=$('#hora_inf').val()
						inf.delegacion=$('#delegacion_spa_inf').val()
						inf.comandancia=$('#comandancia_spa_inf').val()
						inf.turno=$('#turno_spa_inf').val()
						inf.colonia=$('#colonia_spa_inf').val()
						inf.calle1=$('#calle1_spa_inf').val()
						inf.calle2=$('#calle2_spa_inf').val()
						inf.referencia=$('#referencia_spa_inf').val()
						inf.latitud=$('#lat_inf').val()
						inf.longitud=$('#lng_inf').val()
						inf.tipo_operativo=$('#tipo_operativo_spa_inf').val()
						this.sandbox.emit 'llenar-infraccion-articulos'
						this.sandbox.emit 'llenar-infraccion-recoje'
						this.sandbox.emit 'llenar-infraccion-infractor'
						this.sandbox.emit 'llenar-infraccion-caracteristicas-vehiculo'
						this.sandbox.emit 'llenar-infraccion-certificado-medico'
						if $('#si_firmo_inf').is(':checked')
							inf.firmo="si"
						else
							inf.firmo="no"
						this.llenarInfraccionObservaciones()
						$.post '/infraccion/crear',inf,(data)->
							return
						this.cancelar()
						console.log inf
						return
					llenarInfraccionObservaciones:->
						infraccion=window.infraccion
						w5ref= this.observaciones.data('wysihtml5')
						if w5ref
							infraccion.observaciones= w5ref.editor.getValue()
						else
							infraccion.observaciones= this.element.html()
						return 
					llenarInfraccion:->
						inf=window.infraccion
						$('#folio_infraccion').val(inf.folio_infraccion)
						$('#nombre-agente-inf').val(inf.nombreAgente)
						$('#nom-cobro-agente-inf').val(inf.noCobro)
						 
						if inf.servicio == "Servicio Publico"
							tipoServicioPublico.mostrar(true)
							this.rad_servicio_publico.checked=true
							if inf.tipo_servicio == "Taxi"
								this.rad_taxi.checked=true
							else if inf.tipo_servicio == "Urbano"
								this.rad_urbano.checked=true
							else if inf.tipo_servicio == "Foraneo"
								this.rad_foraneo.checked=true
							else if inf.tipo_servicio == "Policia"
								this.rad_policia.checked=true
							else if inf.tipo_servicio == "Transito"
								this.rad_transito.checked=true
								 
						else
							this.rad_servicio_particular.checked=true
						$('#fecha_inf').val(inf.fecha)
						$('#hora_inf').val(inf.hora)

						$('#delegacion_spa_inf').val(inf.delegacion)
						actualizarComandanciaValor(inf.delegacion)
						$('#comandancia_spa_inf').val(inf.comandancia)
						$('#turno_spa_inf').val(inf.turno)
						$('#colonia_spa_inf').val(inf.colonia)
						$('#calle1_spa_inf').val(inf.calle1)
						$('#calle2_spa_inf').val(inf.calle2)
						$('#referencia_spa_inf').val(inf.referencia)
						$('#lat_inf').val(inf.latitud)
						$('#lng_inf').val(inf.longitud)
						$('#tipo_operativo_spa_inf').val(inf.tipo_operativo)
						$('#circulacion_spa_inf').val(inf.circulacion)
						this.sandbox.emit 'update-articulos',
							contenido:infraccion.articulos
						this.sandbox.emit 'update-recoje'
						this.sandbox.emit 'update-infractor'
						this.sandbox.emit 'update-caracteristicas-vehiculo'
						this.sandbox.emit 'update-certificado-medico'
						if inf.firmo== 'si'
							$('#si_firmo_inf').attr("checked",true)
						else 
							$('#no_firmo_inf').attr("checked",true)
						this.llenarObservaciones()
						return
					llenarObservaciones:->
						infraccion=window.infraccion
						w5ref= this.observaciones.data('wysihtml5')
						if w5ref
							w5ref.editor.setValue(infraccion.observaciones)
						else
							this.element.html(infraccion.observaciones)
						return 
					showTipoServicioPubico:(bol)->
						console.log  "Sabe llegar"
					llenarDelegaciones:->
						if !window.delegaciones
							cargarDelegaciones this.llenarDelegaciones
						else
							sel=$("#delegacion_spa_inf").html("")
							opciones='<option  value="NO">**SELECCIONAR**</option>'
							for delegacion in window.delegaciones
								opciones += '<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
							sel.append(opciones)
						window.actualizarComandancia()
						return
					llenarComandancias:->
						if !window.comandancias
							cargarComandancias this.llenarComandancias
						else
							sel=$("#comandancia_spa_inf").html("")
							opciones='<option  value="NO">**SELECCIONAR**</option>'
							for comandancia in window.comandancias
								 
								opciones += '<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
							sel.append(opciones)
						return
					llenarTurnos:->
						if !window.turnos
							cargarTurnos this.llenarTurnos
						else
							sel=$("#turno_spa_inf").html("")
							opciones='<option  value="NO">**SELECCIONAR**</option>'
							for turno in window.turnos
								 
								opciones += '<option value="'+turno.turno+'">'+turno.turno+'</option>'
							sel.append(opciones)
						return
					llenarColonias:->
						if !window.colonias
							cargarColonias this.llenarColonias
						else
							nombres=[]
							for item in window.colonias
								 
								nombres.push item.nombre
							 
							$("#colonia_spa_inf").autocomplete
								source:nombres
						return
					llenarProfiles:()->
						that= this
						if !window.profiles
							cargarProfiles this.llenarProfiles
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
					actualizarAgente:()->
						console.log "Oscuridad "
					llenarCalles:->
						if !window.calles
							cargarCalles this.llenarCalles
						else
							nombres=[]
							for item in window.calles
								nombres.push item.calle
							$("#calle1_spa_inf").autocomplete
									source:nombres
							$("#calle2_spa_inf").autocomplete
									source:nombres
						return
					llenarOperativos:->
						if !window.operativos
							cargarOperativos this.llenarOperativos
						else
							sel=$("#tipo_operativo_spa_inf").html("")
							opciones='<option  value="NO">**SELECCIONAR**</option>'
							for operativo in window.operativos
								 
								opciones += '<option value="' + operativo.descripcion+ '">' + operativo.descripcion + '</option>'
							sel.append(opciones)
						return
					llenarCirculaciones:->
						if !window.circulaciones
							cargarCirculaciones this.llenarCirculaciones
						else
							sel=$("#circulacion_spa_inf").html("")
							opciones='<option  value="NO">**SELECCIONAR**</option>'
							for circulacion in window.circulaciones
								opciones += '<option value="' + circulacion.circulacion+ '">' + circulacion.circulacion + '</option>'
							sel.append(opciones)
						return



