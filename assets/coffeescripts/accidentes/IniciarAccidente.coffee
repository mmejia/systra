define [
  'core/sandbox'
  'accidentes/ManagerTablaArticulos'
  'accidentes/ManagerInvestigacion'
  'accidentes/ManagerObservacionesPP'
  'accidentes/ManagerCroquis'
  'accidentes/ManagerFotografias'
  'accidentes/reporte_pdf'
  'accidentes/posterior_pdf'
  'accidentes/ManagerCapturaSaldoSangre'
  'accidentes/ManagerCapturaCJ'
  'accidentes/ManagerOtros'
  'accidentes/TablaManager'
  'vendor/min/moment'

],(sandbox,mod_tablaArticulos,mod_investigacion,mod_observaciones,mod_croquis,fotografias,reporte_pdf,posterior_pdf, mod_CapturaSaldoSangre, mod_CapturaCompetenciaJudicial,mod_otros,mod_table,momento)->
	IniciarAccidente=
		currentArticulo:null
		articulosSeleccionados:[]
		formSubirFoto:null
		formSubirCroquis:null
		ta_simbologia:null
		delegacion:null
		refsync:null
		client:null
		mapa:false
		geocoder:null
		map:null
		ver_prel:false
		ver_mapa:false
		spinner:null
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			window.refsync=window.ip_sys_msg
			window.client= io.connect(window.refsync)
			setModulo("accidente")
			this.delegacion=$("#delegacion_pp")
			this.delegacion.on 'change',(evento)->
					valor= $('#' + evento.currentTarget.id).val()
					window.actualizarComandanciaValor(valor)
					return
			$('#refrescar-ubicacion-calle').on 'click', (evento)->
				that.ubicarCalle()
			if !window.accidente and !window.preliminar
				this.llenarDelegaciones()
				this.llenarTurnos()
				this.llenarClasAccidentes()
				this.llenarTipoAccidentes()
				this.llenarCalles()
				this.llenarColonias()
				this.llenarMunicipios()
				this.llenarEstados()
				this.llenarArticulos()
				this.reiniciarAccidente()
			else
				this.iniciarSpiner()
				$.when(
					$.ajax("/catalogos/delegaciones.json"),
					$.ajax("/catalogos/comandancias.json"),
					$.ajax("/catalogos/turnos.json"),
					$.ajax("/catalogos/clasAccidente.json"),
					$.ajax("/catalogos/tipoAccidente.json"),
					$.ajax("/catalogos/calles.json"),
					$.ajax("/catalogos/colonias.json"),
					$.ajax("/catalogos/municipios.json"),
					$.ajax("/catalogos/estados.json"),
					$.ajax("/catalogos/articulos.json")
					).done (delegaciones,comandancias,turnos,clasAccidentes,tipoAccidentes,calles,colonias,municipios,estados,articulos)->
						window.delegaciones=delegaciones[0]
						window.comandancias=comandancias[0]
						window.turnos= turnos[0]
						window.clasAccidentes= clasAccidentes[0]
						window.tipoAccidentes= tipoAccidentes[0]
						window.calles= calles[0]
						window.colonias= colonias[0]
						window.municipios= municipios[0]
						window.articulos = articulos[0]
						#that.llenarPreliminar()
						that.llenarDelegaciones()
						that.llenarTurnos()
						that.llenarClasAccidentes()
						that.llenarTipoAccidentes()
						that.llenarCalles()
						that.llenarColonias()
						that.llenarMunicipios()
						that.llenarEstados()
						that.llenarArticulos()
						#that.reiniciarAccidente()
						#alert 'Hola mundo'
						if window.accidente
							that.llenarAccidente()
						if window.preliminar
							#alert 'Entra aqui'
							that.llenarConPreliminar()
						that.spinner.stop()
			this.iniciarCalendario()
			this.iniciarVentanaSelPunto()
			this.iniciarVentanaReportePdf()
			this.establecerDefault()
			fotografias.iniciar()
			mod_croquis.iniciar()
			mod_investigacion.iniciar()
			mod_observaciones.iniciar()
			mod_tablaArticulos.iniciar()
			mod_CapturaSaldoSangre.iniciar()
			mod_CapturaCompetenciaJudicial.iniciar()
			mod_otros.iniciar()
			mod_table.iniciar()
			that=this
			this.ocultarCSS=
				margin:0
				overflow:"hidden"
				padding:0
				width:0
			this.mostrarCSS=
				height:"auto"
				opacity:1
				width:"40%"
			#ele= document.getElementById("buscar-punto-google")
			#console.log ele
			$('#buscar-punto-google').on 'mouseover', ()->
				google.maps.event.trigger(window.mapa,'resize')
			this.sandbox.on('show-tabla-vehiculos',this.mostrarTablaVehiculos)
			this.sandbox.on('show-captura-vehiculos',this.mostrarCapturaVehiculos)
			this.sandbox.on('llenar-fotos', this.llenarFotos)
			this.sandbox.on('llenar-croquis', this.llenarCroquis)
			#this.sandbox.on('llenar-accidente-simbologia', this.llenarAccidenteSimbologia)
			#this.sandbox.on('llenar-accidente-investigaciones', this.llenarAccidenteInvestigaciones)
			this.sandbox.on('llenar-accidente-articulos', this.llenarAccidenteArticulos)
			this.sandbox.on('cargar-accidente-en-view', this.llenarAccidente)
			this.sandbox.on('cargar-accidente-en-view-server', this.cargarAccidenteServer)
			this.formSubirFoto=$('#formSubirFotografia').ajaxForm
				mod:that
				beforeSubmit: ->
					$('#resultado_foto').html('Subiendo la foto')
				success:(data) ->
					id= data.id
					nombre= data.nombre
					#console.log data
					window.accidente.fotos.push(data)
					this.mod.refrescarFotos()
					this.mod.sandbox.emit 'show-foto-actual',id
					sal= $('#resultado_foto')
					sal.html('Se subio correctamente el archivo')
			this.formSubirCroquis=$('#formSubirCroquis').ajaxForm
				mod:that
				beforeSubmit: ->
					$('#resultado_croquis').html('Subiendo el croquis')
				success:(data) ->
					window.accidente.croquis= data
					this.mod.refrescarCroquis()
					sal= $('#resultado_croquis')
			$("#showTablaVehiculo").on "click",->
				that.sandbox.emit("show-tabla-vehiculos")
			$("#showCapturaVehiculo").on "click",->
				that.sandbox.emit("show-captura-vehiculos")
			###$('#vehiculosConductores_pp a').click (event)-> 
					event.preventDefault()
					$(this).tab('show')
					return
			###
			$("#folio_accidente").change ->
				id=$(this).val()
				that.llenarCamposFromPreliminar(id)
			#options=
			#	datos:[]
			
			#$("#selPreliminar").mitabla(options)
			$('#complementarios_pp a').click (event)-> 
					event.preventDefault()
					$(this).tab('show')
					return
			$('#cancelar_accidente_pp').on "click",()->
				that.cancelar()
			$('#guardar_accidente_pp').on "click",()->
				that.agregarAccidente()
			$('#guardar_local_accidente_pp').on "click",()->
				that.guardarLocalAccidente()
			$('#subir_fotografia').on "click",()->
				that.subirFotografia()
			$('#subir_croquis').on "click",()->
				that.subirCroquis()
			$('#sel-articulo-pp').on "click",()->
				window.accidente.articulos.push(window.currentArticulo)
				delete window.currentArticulo
				that.sandbox.emit 'refrescar-articulos-view'
				$('#articulos_pp').val('')
				
			
			$(".trigger").click ()->
				$(".panel").toggle("fast")
				$(this).toggleClass("active")
				return false
			$("#search-activos").on 'click' ,()->
				if !that.ver_prel
					that.showSelPreliminar()
					#that.llenarActivos()
					$('#search-activos').html "<i class=\"icosystra-minus\"></i>"
					that.ver_prel=true
				else
					that.ocultarSelPreliminar()
					$('#search-activos').html "<i class=\"icosystra-earth\"></i>"
					that.ver_prel=false

			$('#buscar_punto_pp').on 'click' ,(evento)->
				#Lo ocultamos
				if !that.ver_mapa
					that.showSelMapa()
					$('#buscar_punto_pp').html "<i class=\"icosystra-minus\"></i>"
					if !that.mapa 
						that.iniciarPickerStreet()

					that.ubicarCalle()
					that.ver_mapa=true
				else
					google.maps.event.trigger(that.mapa, 'resize')
					that.ocultarSelMapa()
					$('#buscar_punto_pp').html "<i class=\"icosystra-earth\"></i>"
					that.ver_mapa=false
			$('button.close').on 'click', ()->
				 console.log "Hola"
			$(document).keypress 'ctrl+l',(evento)->
				if evento.ctrlKey
					#alert 'La tecla tecleada  ' + evento.charCode  + '  '
					if evento.charCode==22 #cuando es v
						that.sandbox.emit 'agregar-vehiculo'
					if evento.charCode==3 #cuando es c
						that.sandbox.emit 'agregar-saldo-sangre'
					if evento.charCode==24 #cuando es x
						that.sandbox.emit 'agregar-competencia-judicial'
					if evento.charCode ==16 #cuando es p
						that.showSelReporte(that)
					else if evento.charCode == 19 # cuando es s
						that.agregarAccidente()
					else if evento.charCode == 12 # cuando es l
						that.guardarLocalAccidenteServer()
						
				return
					
		## VAMOS A GENERAR LOS EVENTOS QUE VAN A SER AUTOMATICOS
			#this.iniciarMenu()
		iniciarSpiner:->
			opts = 
				lines: 13 
				length: 20 
				width: 10 
				radius: 30 
				corners: 1 
				rotate: 0 
				direction: 1 
				color: '#000' 
				speed: 1 
				trail: 60 
				shadow: false 
				hwaccel: false 
				className: 'spinner' 
				zIndex: 2e9 
				top: 'auto' 
				left: 'auto' 
			target = document.getElementById('loading');
			this.spinner = new Spinner(opts).spin(target);
			target.appendChild(this.spinner.el);
		llenarCamposFromPreliminar:(id)->
			that=this
			$.get '/accidente/getPreliminar/' + id + '/',(data)->
				window.preliminar=data
				that.llenarConPreliminar()
		showSelMapa:()->
			el=$("#buscar-punto-google")
			cambios=
				height: "500px"
				width: "100%"
			el.css(cambios)
		ocultarSelMapa:()->
			el=$("#buscar-punto-google")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		showSelPreliminar:()->
			el=$("#sel-preliminar")
			tabla= $("#selPreliminar")
			#tabla.css(cambios)
			mod_table.actualizarTabla()
			cambios=
				height: "auto"
				width: "100%"
			el.css(cambios)
		ocultarSelPreliminar:()->
			el=$("#sel-preliminar")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		llenarConPreliminar:()->
			preliminar= window.preliminar
			console.log preliminar
			$("#folio_accidente").val(preliminar.folio_evento)
			$("#nombre_agente_intervino_pp").val(preliminar.agente_intervino)
			$("#gafete_agente_intervino_pp").val(preliminar.gafete_intervino)
			$("#calle1_pp").val(preliminar.calle1)
			$("#calle2_pp").val(preliminar.calle2)
			$("#delegacion_pp").val(preliminar.delegacion)
			window.actualizarComandanciaValor(preliminar.delegacion)
			$("#comandancia_pp").val(preliminar.comandancia)
			$("#fecha_pp").val(preliminar.fecha_evento)
			$("#hora_pp").val(preliminar.hora_evento)
			$("#colonia_pp").val(preliminar.colonia)
			$("#frente_num").val(preliminar.ref)
			$("#turno_pp").val(preliminar.turno)
			$("#clasAccidente_pp").val(preliminar.id_clasificacion)
			if window.accidente== undefined
				this.reiniciarAccidente()
			window.accidente.folio_unico= preliminar.id_unico


		llenarActivos:()->
			that=this
			$.ajax
				type:"GET"
				url:"/accidente/listarActivos"
				success:(data)->
					datos=[]
					for activo in data
						activo.ToString=()->
							return this.folio_evento
						datos.push activo 
					sel=$("#selPreliminar>tbody").empty()
					opc=''
					window.activos= datos
					for dato in datos
						opc='<tr>'
						opc+= '<td><a href="#" id="' + dato.id_unico + '"><i class="icon-ok-sign"></i></a> </td>' 
						opc+= '<td>' + dato.fecha_evento + '</td>'
						opc+= '<td>' + dato.folio_evento + '</td>'
						opc+= '<td>' + dato.agente_intervino + '</td>'
						opc+= '<td>' + dato.calle1 + '</td>'
						opc+= '</tr>'
						sel.append(opc)
						$('#' + dato.id_unico).on 'click', (evento)->
							id= evento.currentTarget.id
							preliminar=that.buscarActivos(id)
							if preliminar!=null
								accidente= window.accidente
								if !accidente
									that.reiniciarAccidente()
								accidente= window.accidente
								accidente.id_unico= preliminar.id_unico
								$("#folio_accidente").val(preliminar.folio_evento)
								$("#nombre_agente_intervino_pp").val(preliminar.agente_intervino)
								$("#gafete_agente_intervino_pp").val(preliminar.agente_intervino)
								$("#calle1_pp").val(preliminar.calle1)
								$("#calle2_pp").val(preliminar.calle2)
								that.ocultarSelPreliminar()
							else
								that.ocultarSelPreliminar()
		buscarActivos:(id_unico)->
			if window.activos
				for activo in activos
					if activo.id_unico== id_unico	
						return activo
			return null
		cargarAccidenteServer:(id)->
			this.id= id
			this.url='getAccidente/'+ this.id
			that= this
			console.log this.url
			$.ajax
				type:'GET'
				url: that.url
				success:(data)->
					window.accidente=data[0]
					that.llenarAccidente()
		establecerDefault:->
			$("#noSerie_vehiculo_default").on 'click', ->
				$("#noSerie_vehiculo").val("NO VISIBLE")
			$("#placas_default").on 'click',->
				$("#placas_vehiculo").val("NO VISIBLE")
			$("#noeco_pp_default").on 'click',->
				$("#noeco_pp").val("NO VISIBLE")
			$("#capacidad_vehiculo_pp_default").on 'click',->
				$("#capacidad_vehiculo_pp").val("NO VISIBLE")
			$("#nodegrua_vehiculo_pp_default").on 'click',->
				$("#nodegrua_vehiculo_pp").val("NO VISIBLE")
			$("#noInventario_vehiculo_default").on 'click',->
				$("#noInventario_vehiculo").val("NO VISIBLE")
			$("#estado_vehiculo_pp_default").on 'click',->
				$("#estado_vehiculo_pp").val("SE DESCONOCE")
			$("#municipio_vehiculo_pp_default").on 'click',->
				$("#municipio_vehiculo_pp").val("SE DESCONOCE")

		guardarLocalAccidente:->
			this.actualizarAccidente()
			acc= window.accidente
			accidentes= sessionStorage.getItem('accidentesl')
			if !accidentes
				accidentes=[]
				accidentes.push(acc)
				obj = JSON.stringify(accidentes)
				sessionStorage.setItem('accidentesl',obj)
				this.sandbox.emit 'update-menu-accidente-local',accidentes
			else
				a_accidentes = JSON.parse(accidentes) 
				if a_accidentes.length >5
					a_accidentes.shift()
				console.log acc
				a_accidentes.push(acc)
				obj = JSON.stringify(a_accidentes)
				sessionStorage.setItem('accidentesl',obj)
				this.sandbox.emit 'update-menu-accidente-local',a_accidentes
			#$.localStorage["accidente"]= window.accidente
			this.cancelar()
		llenarAccidente:()->
			console.log window.accidente
			$("#folio_accidente").val(accidente.folio_accidente) 
			$("#delegacion_pp").val(accidente.delegacion) 
			$("#comandancia_pp").val(accidente.comandancia)
			$("#turno_pp").val(accidente.turno)
			$("#fecha_pp").val(accidente.fecha)
			$("#hora_pp").val(accidente.hora)
			$("#clasAccidente_pp").val(accidente.clasificacion)
			$("#tipoAccidente_pp").val(accidente.tipo_choque)
			$("#lat_pp").val(accidente.latitud)
			$("#lng_pp").val(accidente.longitud)
			$("#calle1_pp").val(accidente.calle1)
			$("#calle2_pp").val(accidente.calle2)
			$("#frente_num").val(accidente.frente_num)
			$("#frente_a_numero").val(accidente.frentea)
			$("#colonia_pp").val(accidente.colonia)
			$("#estado_pp").val(accidente.estado)
			$("#municipio_pp").val(accidente.municipio)
			$("#nombre_agente_intervino_pp").val(accidente.intervino.nombre)
			$("#gafete_agente_intervino_pp").val(accidente.intervino.gafete)
			$("#unidad_intervino_pp").val(accidente.intervino.unidad)
			$("#sector_intervino_pp").val(accidente.intervino.sector )
			$("#nombre_agente_superviso_pp").val(accidente.superviso.nombre)
			$("#gafete_agente_superviso_pp").val(accidente.superviso.gafete)
			$("#unidad_superviso_pp").val(accidente.superviso.unidad)
			$("#sector_superviso_pp").val(accidente.superviso.sector)
			this.sandbox.emit 'cargar-vehiculos-en-view'
			this.sandbox.emit "add-text-observaciones",
				contenido:accidente.observaciones
			this.sandbox.emit 'cargar-lista-fotografias'
			this.sandbox.emit "add-text-investigaciones",
				contenido:accidente.investigaciones
			this.sandbox.emit "add-text-simbologia",
				contenido:accidente.simbologia_croquis
			this.sandbox.emit 'llenar-fotos',
				contenido:accidente.fotos
			this.sandbox.emit 'llenar-croquis',
				contenido:accidente.croquis
			this.sandbox.emit 'refrescar-articulos-view'
			this.sandbox.emit 'show-croquis-view'
			this.sandbox.emit 'show-otros-view'
			return

		llenarArticulos:(comp)->
			that=this
			if !window.articulos
				this.cargarArticulos this, this.llenarArticulos
			else
				nombres=[]
				for item in window.articulos
					item.toString= ()->
						this.art + "-" + this.fracc + "-" + this.descc
					#str= campos.art + "-" + campos.fracc + "-" + campos.descc
					nombres.push
						 value:item

				$("#articulos_pp").autocomplete
					source : nombres
					that:that
					select:(event,ui)->
						window.currentArticulo=ui.item.value
			return
		cargarArticulos:(comp,fn)->
			$.ajax
				type : 'GET'
				url : "/catalogos/articulos.json"
				success:(data)->
					col=[]
					for item in data
						col.push item
					window.articulos=col
					fn(comp)
		showFieldError:(item,msg)->
			padre= item.parents("div.control-group")
			padre.addClass('error')
			padre.children('.help-inline').html(msg)
			item.focus()
		showFieldSuccess:(item)->
			padre= item.parents("div.control-group")
			padre.addClass('success')
			padre.children('.help-inline').html('')	
		limpiarCabecera:()->
			$(".cabecera-parte").removeClass('error')
			$(".cabecera-parte").removeClass('success')
		validateHeadAccidente:()->
			this.limpiarCabecera()
			if $("#folio_accidente").val() ==''
				this.showFieldError($("#folio_accidente"),"Es necesario seleccionar el folio")
				return false
			else
				this.showFieldSuccess($("#folio_accidente"))

			if $("#delegacion_pp").val() =='NO'
				this.showFieldError($("#delegacion_pp"),"Es necesario seleccionar la delegación")
				return false
			else
				this.showFieldSuccess($("#delegacion_pp"))

			if $("#comandancia_pp").val() =='NO'
				this.showFieldError($("#comandancia_pp"),"Es necesario seleccionar la comandancia")
				return false
			else
				this.showFieldSuccess($("#comandancia_pp"))

			if $("#turno_pp").val() =='NO'
				this.showFieldError($("#turno_pp"),"Es necesario seleccionar el turno")
				return false
			else
				this.showFieldSuccess($("#turno_pp"))

			if $("#fecha_pp").val() ==''
				this.showFieldError($("#fecha_pp"),"Es necesario seleccionar la fecha")
				return false
			else
				this.showFieldSuccess($("#fecha_pp"))

			if $("#hora_pp").val() ==''
				this.showFieldError($("#hora_pp"),"Es necesario seleccionar la hora")
				return false
			else
				this.showFieldSuccess($("#hora_pp"))

			if $("#clasAccidente_pp").val() =='NO'
				this.showFieldError($("#clasAccidente_pp"),"Es necesario seleccionar la clasificacion del accidente")
				return false
			else
				this.showFieldSuccess($("#clasAccidente_pp"))
			
			if $("#tipoAccidente_pp").val() =='NO'
				this.showFieldError($("#tipoAccidente_pp"),"Es necesario seleccionar el tipo de accidente")
				return false
			else
				this.showFieldSuccess($("#tipoAccidente_pp"))

			val_calle1= $("#calle1_pp").val()
			if val_calle1 ==''
				this.showFieldError($("#calle1_pp"),"Es necesario seleccionar la calle 1")
				return false
			else
				rr= window.validateCalle(val_calle1)
				if !rr.res
					this.showFieldError($("#calle1_pre"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#calle1_pp"))
			val_calle2=$('#calle2_pp').val()
			if val_calle2 !=''
				rr= window.validateCalle(val_calle2)
				if !rr.res
					this.showFieldError($("#calle2_pp"),rr.msg)
					return false
			else
				this.showFieldSuccess($("#calle2_pp"))
			val_colonia= $("#colonia_pp").val()
			if $("#colonia_pp").val() ==''
				this.showFieldError($("#colonia_pp"),"Es necesario seleccionar la colonia")
				return false
			else
				rr= window.validateColonia(val_colonia)
				if !rr.res
					this.showFieldError($("#colonia_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#colonia_pp"))
			#alert 'parte'
			if $("#lat_pp").val() ==''
				this.showFieldError($("#lat_pp"),"Es necesario seleccionar La latitud del Accidente")
				return false
			else
				this.showFieldSuccess($("#lat_pp"))
			
			if $("#lng_pp").val() ==''
				this.showFieldError($("#lng_pp"),"Es necesario seleccionar la longitud del accidente")
				return false
			else
				this.showFieldSuccess($("#lng_pp"))
			val_estado=  $("#estado_pp").val()

			if val_estado ==''
				this.showFieldError($("#estado_pp"),"Es necesario seleccionar el estado")
			else
				rr= window.validateEstado(val_estado)
				if !rr.res
					this.showFieldError($("#estado_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#estado_pp"))

			val_municipio= $("#municipio_pp").val()
			if val_municipio==''
				this.showFieldError($("#municipio_pp"),"Es necesario seleccionar el municipio")
				return false
			else
				rr=window.validateMunicipio(val_municipio)
				if !rr.res
					this.showFieldError($("#municipio_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#municipio_pp"))
			val_agente_intervino=$("#nombre_agente_intervino_pp").val()	
			if val_agente_intervino ==''
				this.showFieldError($("#nombre_agente_intervino_pp"),"Es necesario seleccionar el agente que interviene")
				return false
			else
				rr= window.validateAgente(val_agente_intervino)
				if !rr.res
					this.showFieldError($("#nombre_agente_intervino_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#nombre_agente_intervino_pp"))
			val_unidad_intervino=$("#unidad_intervino_pp").val()
			if val_unidad_intervino ==''
				this.showFieldError($("#unidad_intervino_pp"),"Es necesario seleccionar la unidad que interviene")
				return false
			else
				rr= window.validateUnidad(val_unidad_intervino)
				if !rr.res
					this.showFieldError($("#unidad_intervino_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#unidad_intervino_pp"))
			val_agente_superviso=$("#nombre_agente_superviso_pp").val()
			if val_agente_superviso ==''
				this.showFieldError($("#nombre_agente_superviso_pp"),"Es necesario seleccionar el agente que supervisa")
				return false
			else
				rr= window.validateAgente(val_agente_superviso)
				if !rr.res
					this.showFieldError($("#nombre_agente_superviso_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#nombre_agente_superviso_pp"))
			val_unidad_superviso=$("#unidad_superviso_pp").val()
			if val_unidad_superviso ==''
				this.showFieldError($("#unidad_superviso_pp"),"Es necesario seleccionar la unidad que supervisa")
				return false
			else
				rr= window.validateUnidad(val_unidad_superviso)
				if !rr.res
					this.showFieldError($("#unidad_superviso_pp"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#unidad_superviso_pp"))
			return true

		validateFields:()->
			that=this
			if !this.validateHeadAccidente()
				return false
			if !mod_otros.validateFieldOtros() 
				return false
			val_obs= mod_observaciones.getValorObservaciones()

			if val_obs==''
				#alert val_obs
				padre=$("#obs-parte")
				padre.addClass("error")
				msg=$("#msg-observaciones")
				msg.html("Se debe de llenar el campo de observaciones")
				$("#ta_observaciones_pp").focus()
				return false
			else
				padre=$("#obs-parte")
				padre.addClass("success")
				msg=$("#msg-observaciones")
				msg.html("")
			
			val_simb=$("#ta_simbologia_pp").val()
			if val_simb==''
				padre=$("#simb-parte")
				padre.addClass("error")
				msg=$("#msg-simb-croquis")
				msg.html("Se debe de llenar el campo de simbología")
				$('#complementarios_pp li:eq(2) a').tab('show'); 
				$("#ta_simbologia_pp").focus()
				return false
			else
				padre=$("#simb-parte")
				padre.addClass("success")
				msg=$("#msg-simb-croquis")
				msg.html("")

			val_inve=$("#ta_investigaciones_pp").val()
			if val_inve==''
				padre=$("#inv-parte")
				padre.addClass("error")
				msg=$("#msg-inv-parte")
				msg.html("Se debe de llenar el campo de Investigaciones")
				$('#complementarios_pp li:eq(3) a').tab('show'); 
				$("#ta_investigaciones_pp").focus()
				return false
			else
				padre=$("#inv-parte")
				padre.addClass("success")
				msg=$("#msg-inv-parte")
				msg.html("")

			###this.sandbox.emit("vaciar-tabla-vehiculos")
			this.sandbox.emit("vaciar-tabla-saldo-sangre")
			this.sandbox.emit("vaciar-tabla-competencia-judicial")
			this.sandbox.emit("vaciar-observaciones")
			this.sandbox.emit 'limpiar-croquis-view'
			this.sandbox.emit 'vaciar-simbologia-view'
			this.sandbox.emit 'investigacion-limpiar-texto'
			this.sandbox.emit 'borrar-all-articulos-view'
			this.sandbox.emit 'borrar-otros-view'
			this.reiniciarAccidente()
			###
			
		cancelar:->
			$("#folio_accidente").val('') 
			$("#delegacion_pp").val('') 
			$("#comandancia_pp").val('')
			$("#turno_pp").val('')
			$("#fecha_pp").val('')
			$("#hora_pp").val('')
			$("#clasAccidente_pp").val('')
			$("#tipoAccidente_pp").val('')
			$("#lat_pp").val('')
			$("#lng_pp").val('')
			$("#calle1_pp").val('')
			$("#calle2_pp").val('')
			$("#frente_num").val('')
			$("#frente_num").val('')
			$("#colonia_pp").val('')
			$("#estado_pp").val('')
			$("#municipio_pp").val('')
			$("#nombre_agente_intervino_pp").val('')
			$("#gafete_intervino_pp").val('')
			$("#unidad_intervino_pp").val('')
			$("#sector_intervino_pp").val('')
			$("#nombre_agente_superviso_pp").val('')
			$("#gafete_superviso_pp").val('')
			$("#unidad_superviso_pp").val('')
			$("#sector_superviso_pp").val('')
			this.sandbox.emit("vaciar-tabla-vehiculos")
			this.sandbox.emit("vaciar-tabla-saldo-sangre")
			this.sandbox.emit("vaciar-tabla-competencia-judicial")
			this.sandbox.emit("vaciar-observaciones")
			this.sandbox.emit 'limpiar-croquis-view'
			this.sandbox.emit 'vaciar-simbologia-view'
			this.sandbox.emit 'investigacion-limpiar-texto'
			this.sandbox.emit 'borrar-all-articulos-view'
			this.sandbox.emit 'borrar-otros-view'
			this.reiniciarAccidente()
			return
		reiniciarAccidente:->
			window.accidente={};
			window.accidente.vehiculos=[];
			window.accidente.saldoSangres=[];
			window.accidente.intervino={}
			window.accidente.superviso={}
			window.accidente.fotos=[]
			window.accidente.croquis=''
			window.accidente.observaciones=''
			window.accidente.investigaciones=''
			window.accidente.competenciaJudiciales=[]
			window.accidente.articulos=[]
			window.accidente.otros={}
			window.accidente.estado_calles={}
			window.accidente.danos=[]
			window.accidente.simbologia_croquis=''
		actualizarAccidente:->
			console.log window.accidente
			accidente= window.accidente
			accidente.folio_accidente=$("#folio_accidente").val() 
			dd= $("#delegacion_pp").val() 
			accidente.delegacion=dd
			accidente.comandancia=$("#comandancia_pp").val()
			accidente.turno=$("#turno_pp").val()
			accidente.hora=$("#hora_pp").val()
			accidente.fecha=$("#fecha_pp").val()
			accidente.clasificacion=$("#clasAccidente_pp").val()
			accidente.tipo_choque=$("#tipoAccidente_pp").val()
			accidente.latitud=$("#lat_pp").val()
			accidente.longitud=$("#lng_pp").val()
			accidente.calle1=$("#calle1_pp").val()
			accidente.calle2=$("#calle2_pp").val()
			accidente.frente_num=$("#frente_num").val()
			accidente.frentea=$("#frente_a_numero").val()
			accidente.colonia=$("#colonia_pp").val()
			accidente.estado=$("#estado_pp").val()
			accidente.municipio=$("#municipio_pp").val()
			accidente.intervino.nombre=$("#nombre_agente_intervino_pp").val()
			accidente.intervino.gafete=$("#gafete_agente_intervino_pp").val()
			accidente.intervino.unidad=$("#unidad_intervino_pp").val()
			accidente.intervino.sector=$("#sector_intervino_pp").val()

			 
			accidente.superviso.nombre=$("#nombre_agente_superviso_pp").val()
			accidente.superviso.gafete=$("#gafete_agente_superviso_pp").val()
			accidente.superviso.unidad=$("#unidad_superviso_pp").val()
			accidente.superviso.sector=$("#sector_superviso_pp").val()
			this.sandbox.emit("llenar-accidente-observaciones")
			
			this.sandbox.emit("llenar-accidente-simbologia")
			this.sandbox.emit('llenar-accidente-investigaciones')
			this.sandbox.emit('llenar-accidente-articulos')
			this.sandbox.emit 'llenar-otros-window'
		guardarLocalAccidenteServer:->
			this.validateFields()
			acc_server= sessionStorage.getItem('accidentes-server')
			id = window.accidente.folio_accidente
			if !acc_server
				accidentes=[]
				accidentes.push(id)
				obj = JSON.stringify(accidentes)
				sessionStorage.setItem('accidentes-server',obj)
				this.sandbox.emit 'update-menu-accidente-server',accidentes
			else
				a_accidentes = JSON.parse(acc_server) 
				if a_accidentes.length >5
					a_accidentes.shift()
				a_accidentes.push(id)
				obj = JSON.stringify(a_accidentes)
				sessionStorage.setItem('accidentes-server',obj)
				this.sandbox.emit 'update-menu-accidente-server',a_accidentes
		agregarAccidente:->
			that= this
			if !this.validateFields()
				return
			this.actualizarAccidente()
			this.guardarLocalAccidenteServer()
			datos=
				data: JSON.stringify(window.accidente)
			console.log JSON.stringify(window.accidente)
			$.ajax
				type:"POST"
				url:'/accidente/crear'
				dataType:'json'
				data:datos
				a = new Date()
				success: (data)->
					acc=window.accidente
					noticia=
						titulo:acc.folio_accidente + "    " +  acc.clasificacion + "   " + acc.hora + "    " + acc.tipo_choque
						noticia:""
						tags:"Accidente"
						archivos:"/static/fotos_subidas/foto.jpg"
						capturador_por:window.profile.nombre
						fecha:a.format("%Y-%m-%d %H:%M:%S", true)
					window.client.emit 'add-new', noticia
					that.cancelar()
					that.showMensaje("Guardando accidente",'Se guardo el accidente con numero de folio <span class="new-folio">' + data.folio_accidente + '</span> exitosamente!!!')
				error: (error)->
					that.showMensajeError(error.responseText)

					return
		mostrarTablaVehiculos:->
			$("#datos_vehiculos").hide()
			$("#tabla_vehiculos_view").show()
			return
		showMensajeError:(msg)->
			$div=$('#myErrorModal .modal-body').html(msg)
			$("#myErrorModal").modal('show')
			$('#myErrorModalLabel').html('ERROR')
		showMensaje:(titulo,msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)
		mostrarCapturaVehiculos:->
			$("#datos_vehiculos").show();
			$("#tabla_vehiculos_view").hide()
			return
		subirCroquis:->
			that=this
			this.formSubirCroquis.submit()
			this.sandbox.emit 'show-croquis-view'
			return
		subirFotografia:->
			that= this
			this.formSubirFoto.submit()
			return
		refrescarCroquis:->
			croquis= $('#img_croquis')
			croquis.attr('src','/content/content/'+ window.accidente.croquis.id)
		llenarFotos:(data)->
			window.accidente.fotos= data.contenido
			this.refrescarFotos()
		llenarCroquis:(data)->
			window.accidente.croquis= data.contenido
			this.refrescarCroquis()
		refrescarFotos:()->
			padre=$('#fotos_galeria')
			padre.html('')
			muestra=''
			val=0
			for foto in window.accidente.fotos
				id=foto.id
				#nombre= foto.nombre
				muestra += '<div id="div_' + id + '" class="item-galeria"><a  href="#"> <img src="/content/content/' + id + '" class ="thuim-galeria"></a></div>'
				val=id
			#console.log muestra
			padre.append(muestra)
			this.sandbox.emit 'cargar-lista-fotografias'
			this.sandbox.emit 'show-foto-actual', val
		iniciarVentanaReportePdf:->
			$( "#dialogo-reporte" ).dialog
				autoOpen:false
				width:600
				height:500
				modal: true
			$( "#dialogo-posterior" ).dialog
				autoOpen:false
				width:600
				height:500
				modal: true
			that=this
			$("#generar_reporte_pp").on "click", ->
				that.showSelReporte()
			$("#generar_posterior_pp").on "click", ->
				that.showPosteriorPdf()
			return
		showPosteriorPdf:->
			that=this
			this.actualizarAccidente()
			datos=
				data: JSON.stringify(window.accidente)
			console.log JSON.stringify(window.accidente)
			$.ajax
				type:"POST"
				url:'/accidente/ventana_reporte_posterior/'
				dataType:'html'
				data:datos
				success: (res)->
					that.showMensaje("Reporte para imprimir",res)
				error: (error)->
					console.log error
					that.showMensajeError(error.responseText)
			return
		showSelReporte:->
			that=this
			this.actualizarAccidente()
			datos=
				data: JSON.stringify(window.accidente)
			console.log JSON.stringify(window.accidente)
			$.ajax
				type:"POST"
				url:'/accidente/ventana_reporte/'
				dataType:'html'
				data:datos
				success: (res)->
					that.showMensaje("Reporte para imprimir",res)
			return
		generarPdf:()->
			this.actualizarAccidente()
			console.log window.accidente
			string =reporte_pdf.generar(window.accidente)
			#$("#ventana_pdf").attr('src',string)
			return string
		
		iniciarVentanaSelPunto:->
			that=this
			$( "#dialog-modal" ).dialog
				autoOpen:false
				width:600
				height:500
				modal: true
			$("#buscar_punto_pp").on "click",this.showSelPunto
			return
		iniciarGaleriaFotos:->
			Galleria.loadTheme('/javascripts/vendor/galleria.classic.min.js')
			Galleria.run('#galleria')
			return
		showSelPunto:->
			$("#dialog-modal").dialog("open");
			return
		iniciarPickerStreet:->
			that=this
			options=
				zoom:17
				center:new google.maps.LatLng(21.15,-101.60)
				mapTypeId:google.maps.MapTypeId.ROADMAP
			window.mapa= new google.maps.Map(document.getElementById("map_canvas"),options)
			window.geocoder= new google.maps.Geocoder()
			window.marker= new google.maps.Marker
					map:window.mapa
			req=
				address:"Zona Centro"
				componentRestrictions:
					country:"MX"
					administrativeArea:"GTO"
					locality:"León+de+Los+Aldama"

			window.geocoder.geocode req, (resultado,status)->
				if status== google.maps.GeocoderStatus.OK
					window.mapa.setCenter(resultado[0].geometry.location)
					window.marker.setPosition(resultado[0].geometry.location)
					primero=resultado[0]
					$("#geocomplete").val(primero.formatted_address)
					$("#lat_pp").val(primero.geometry.location.lat())
					$("#lng_pp").val(primero.geometry.location.lng())

			google.maps.event.addListener window.mapa, 'click',(e)->
				that.getAddress(e.latLng)
		getAddress:(latLng)->
			if !window.geocoder
				window.geocoder= new google.maps.Geocoder()
			if !window.marker
				window.marker= new google.maps.Marker
					map:window.mapa
			window.marker.setPosition(latLng)
			req=
				latLng:latLng
			window.geocoder.geocode req,(resultado,status)->
				primero=resultado[0]
				$("#geocomplete").val(primero.formatted_address)
				$("#lat_pp").val(primero.geometry.location.lat())
				$("#lng_pp").val(primero.geometry.location.lng())
		ubicarCalle:->
			ubicacion=""
			calle1 = $('#calle1_pp').val()
			calle2= $('#calle2_pp').val()
			if calle1 == "" and calle2 == ""
				ubicacion="Zona Centro"
			if calle1 != "" and calle2 ==""
				ubicacion =calle1
			if calle1 == "" and calle2 != ""
				ubicacion=calle2
			if  calles !="" and calle2 != ""
				ubicacion = calle1 + ',' + calle2
			req=
				address:ubicacion
				componentRestrictions:
					country:"MX"
					administrativeArea:"GTO"
					locality:"León+de+Los+Aldama"
			window.geocoder.geocode req, (resultado,status)->
				if status== google.maps.GeocoderStatus.OK
					window.mapa.setCenter(resultado[0].geometry.location)
					window.marker.setPosition(resultado[0].geometry.location)
					primero=resultado[0]
					$("#geocomplete").val(primero.formatted_address)
					$("#lat_pp").val(primero.geometry.location.lat())
					$("#lng_pp").val(primero.geometry.location.lng())
			google.maps.event.addListener window.mapa, 'click',(e)->
				that.getAddress(e.latLng)

		iniciarCalendario:->
			$('#datetimepicker1').datetimepicker
				pickTime: false
				language: 'es'
			$('#datetimepicker2').datetimepicker
				pickDate: false
				language: 'es'
			  
		llenarCalles:->
			that= this

			if !window.calles
				cargarCalles this.llenarCalles
			else
				nombres=[]
				#console.log  "llenamos calles"
				#console.log  window.calles 
				for calle in window.calles
					nombres.push calle.calle 
				$("#calle1_pp").autocomplete
					source: nombres
				$("#calle2_pp").autocomplete
					source: nombres
			return
		llenarDelegaciones:->
			if !window.delegaciones
				window.cargarDelegaciones this.llenarDelegaciones
			else
				sel=$('#delegacion_pp').empty()
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for delegacion in window.delegaciones
					opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
				sel.append(opciones)
			window.actualizarComandancia()
			return
		llenarTurnos:->
			if !window.turnos
				cargarTurnos this.llenarTurnos
			else
				sel=$('#turno_pp').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for turno in window.turnos
					opciones+='<option value="'+turno.turno+'">'+turno.turno+'</option>'
				sel.append(opciones)
				return
		llenarClasAccidentes:->
			if !window.clasAccidentes
				cargarClasAccidentes this.llenarClasAccidentes
			else
				sel=$('#clasAccidente_pp').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for clasAccidente in window.clasAccidentes
					opciones+='<option value="'+clasAccidente.clas+'">'+clasAccidente.clas+'</option>'
				sel.append(opciones)
			return
		llenarTipoAccidentes:->
			if !window.tipoAccidentes
				cargarTipoAccidentes this.llenarTipoAccidentes
			else
				sel=$('#tipoAccidente_pp').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for tipoAccidente in window.tipoAccidentes
					 
					opciones+='<option value="'+tipoAccidente.tipo+'">'+tipoAccidente.tipo+'</option>'
				sel.append(opciones)
			return
		llenarColonias:->
			if !window.colonias
				cargarColonias this.llenarColonias
			else
				nombres=[]
				
	#console.log "Amance quiero verte todo el dia"
				for colonia in window.colonias
					nombres.push colonia.nombre
					#console.log colonia
				$("#colonia_pp").autocomplete
					source: nombres
			return
		llenarMunicipios:->
			if !window.municipios
				cargarMunicipios this.llenarMunicipios
			else
				nombres=[]
				for item in window.municipios
					nombres.push item.municipio
				$("#municipio_pp").autocomplete
					source:nombres
			return
		llenarEstados:->
			if !window.estados
				cargarEstados this.llenarEstados
			else
				nombres=[]
				for item in window.estados
					nombres.push item.estado
				$("#estado_pp").autocomplete
					source:nombres
				#$("#estado_ss").autocomplete
				#	source:nombres
				#$("#estado_cj").autocomplete
				#	source:nombres

			return
		#this.sandbox.on('llenar-accidente-simbologia', this.llenarAccidenteSimbologia)
		#this.sandbox.on('llenar-accidente-investigaciones', this.llenarAccidenteInvestigaciones)
		#this.ta_investigaciones=$('#ta_investigaciones_pp').wysihtml5()
		#this.ta_simbologia=$('#ta_simbologia_pp').wysihtml5()
		llenarAccidenteArticulos:->
			##alert 'Hola mundo'
			#accidente= window.accidente
			#accidente.articulos= this.articulosSeleccionados
		llenarAccidenteInvestigaciones:->
			w5ref= this.ta_investigaciones.data('wysihtml5')
			accidente=window.accidente
			if w5ref
				accidente.investigaciones=w5ref.editor.getValue()
			else
				accidente.investigaciones= this.element.html()
			return  