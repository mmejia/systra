define [
	'core/sandbox'
	'accidentes/ManagerMenuPreliminar'
],(sandbox,modMenuPreliminar)-> 
	IniciaPreliminar= 
		padre:null
		tblTabla:null
		tabla:null
		CARGAR_EN_VIEW:"cargar-preliminar-en-view"
		CARGAR_EN_VIEW_FROM_SERVER:"cargar-preliminar-en-view-from-server"
		CLEAR_VIEW:"clear-preliminar-en-view"
		observaciones:null
		cargar_inicia:true
		menu_oculto:false 
		spinner:null
		iniciar:()->
			that=this
			this.iniciarSpiner()
			this.sandbox= new sandbox(this)
			window.refsync=window.ip_sys_msg
			window.client= io.connect(window.refsync)
			modMenuPreliminar.iniciar()
			this.sandbox.on this.CARGAR_EN_VIEW,window.loadOnView
			this.sandbox.on this.CARGAR_EN_VIEW_FROM_SERVER , this.loadOnViewFromServer
			this.observaciones= $('#observaciones_pre').wysihtml5()
			this.llenarProfile()
			this.iniciarDate()
			#this.ocultarLista()
			setModulo('accidente')
			$('#delegacion_pre').on 'change',(evento)->
				valor= $('#' + evento.currentTarget.id).val()
				window.actualizarComandanciaValor(valor)
				return
			$('#cerrar-menu').on 'click',(evento)->
					that.ocultar_menu()
			window.cargarSelects() 
			loadOnView()
			this.padre=$('#contenido')
			if !window.preliminar
				this.reiniciarPreliminar()
			else
				loadOnView()
			this.observaciones= $('#observaciones_pre').wysihtml5()
			$('#guardar_preliminar_pre').on 'click', ->
				that.agregarPreliminar()
				return
			$('#cancelar_preliminar_pre').on 'click', ->
					that.cancelar()
					return
			$(document).keypress 'ctrl+l',(evento)->
				if evento.ctrlKey
					#alert 'La tecla tecleada  ' + evento.charCode  + '  '
					if evento.charCode ==16 #cuando es p
						that.showSelReporte(that)
					else if evento.charCode == 12 # cuando es l
						that.agregarPreliminar()
				return
			$('#mostrar-lista-preliminar').on 'click',->
				that.ocultarCaptura()
				that.showLista(that.iniciarCalendarioLista)
			iniciarMenu()
			return
		iniciarCalendarioLista:->
			$('#fecha-inicia-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-final-append').datetimepicker
				pickTime: false
				language: 'es'
		iniciarDate:->
			Date.prototype.format =(fstr, utc) ->
				that = this
				if utc
					pre ='getUTC'
				else
					pre='get'
				return fstr.replace(/%[YmdHMS]/g,(m)-> 
					switch m
						when '%Y' then return that[pre + 'FullYear']()
						when '%m' then m = 1 + that[pre + 'Month']()
						when '%d' then m = that[pre + 'Date']()
						when '%H' then m = that[pre + 'Hours']() 
						when '%M' then m = that[pre + 'Minutes']() 
						when '%S' then m = that[pre + 'Seconds']()
						else return m.slice(1)
					return ('0' + m).slice(-2)
				)
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
			window.spinner = new Spinner(opts).spin(target);
			target.appendChild(window.spinner.el);
		llenarProfile:()->
			if !window.profile
				cargarProfile this.llenarProfile
			else
		ocultar_menu:()->
			if this.menu_oculto
				this.menu_oculto=false
				$('ul.nav').hide()
				$('#cerrar-menu').html('')
				$('#cerrar-menu').append('<i class="icon-plus-sign"/>')
			else
				this.menu_oculto=true
				$('ul.nav').show()
				$('#cerrar-menu').html('')
				$('#cerrar-menu').append('<i class="icon-minus-sign"/>')
		cancelar:()->
			this.limpiarColorFields()
			$("#folio_pre").val('')
			$("#fecha_preliminar").val('')
			$("#hora_preliminar").val('')
			$('#delegacion_pre').val('')
			$("#comandancia_pre").val('')
			$("#turno_pre").val('')
			$("#tipo_evento_pre").val('')
			$("#clasificacion_pre").val('')
			$("#calle1_pre").val('')
			$("#calle2_pre").val('')
			$("#ref_pre").val('')
			$("#colonia_pre").val('')
			$("#operativo_pre").val('')
			$("#no_vehiculos_pre").val('')
			$("#no_detenidos_pre").val('')
			$("#no_heridos_pre").val('')
			$("#no_muertos_pre").val('')
			$("#pension_pre").val('')
			$("#no_de_inventario_pre").val('')
			$("#cobro_agente_pre").val('')
			$("#nombre_agente_pre").val('')
			$("#gafete_agente_pre").val('')
			$("#unidad_pre").val('')
			$("#sector_pre").val('')
			this.limpiarObservaciones()
		loadOnViewFromServer:(id)->
			that=this
			url='/accidente/getPreliminar/' + id + "/" 
			that= this
			$.ajax
				type:'GET'
				url: url
				success:(data)->
					window.preliminar=data

					console.log data
					loadOnView()
					return

		
			###area1=$('#observaciones_pre').data('wysihtml5') ###

		limpiarObservaciones:()->
			this.observaciones.val('')
			return 

		appendObservaciones:(data)->
			w5ref= this.observaciones.data('wysihtml5')
			if w5ref
				w5ref.editor.setValue(data)
			else
				this.observaciones.html(data)
			return 
		llenarObservacionesPreliminar:(data)->
			preliminar= window.preliminar
			w5ref= this.observaciones.data('wysihtml5')
			if w5ref
				preliminar.observaciones_evento=w5ref.editor.getValue()
			else
				preliminar.observaciones_evento= this.observaciones.html()
			return 
		agregarToMenu:()->
			acc_preliminar= sessionStorage.getItem('preliminares-server')
			preliminar= window.preliminar
			if !acc_preliminar
				preliminares=[]
				preliminares.push(preliminar)
				obj= JSON.stringify(preliminares)
				sessionStorage.setItem('preliminares-server',obj)
				this.sandbox.emit 'update-menu-preliminar-server',preliminares

			else
				a_preliminares = JSON.parse(acc_preliminar) 
				if a_preliminares.length >5
					a_preliminares.shift()
				a_preliminares.push(preliminar)
				obj = JSON.stringify(a_preliminares)
				sessionStorage.setItem('preliminares-server',obj)
				this.sandbox.emit 'update-menu-preliminar-server',a_preliminares
		showFieldError:(item,msg)->
			padre= item.parents("div.control-group")
			padre.addClass('error')
			padre.children('.help-inline').html(msg)
			item.focus()
		showFieldSuccess:(item)->
			padre= item.parents("div.control-group")
			padre.addClass('success')
			padre.children('.help-inline').html('')	
		limpiarColorFields:()->
			$(".control-group").removeClass('error')
			$(".control-group").removeClass('success')
		validateFields:()->
			this.limpiarColorFields()
			that=this
			if $("#fecha_preliminar").val() ==''
				this.showFieldError($("#fecha_preliminar"),"Debes elegir la fecha")
				return false
			else
				this.showFieldSuccess($("#fecha_preliminar"))

			if $("#hora_preliminar").val() ==''
				this.showFieldError($("#hora_preliminar"),"Debes elegir la hora")
				return false
			else
				this.showFieldSuccess($("#hora_preliminar"))

			if $("#delegacion_pre").val() == 'NO'
				this.showFieldError($("#delegacion_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#delegacion_pre"))
			if $("#comandancia_pre").val()=='NO'
				this.showFieldError($("#comandancia_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#comandancia_pre"))
			if $("#turno_pre").val()=='NO'
				this.showFieldError($("#turno_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#turno_pre"))
			if $("#tipo_evento_pre").val()=='NO'
				this.showFieldError($("#tipo_evento_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#tipo_evento_pre"))
			if $("#clasificacion_pre").val()=='NO'
				this.showFieldError($("#clasificacion_pre"),"Debes elegir una opción")
				return false 
			else
				this.showFieldSuccess($("#clasificacion_pre"))
			val_calle1=$('#calle1_pre').val()
			
			if val_calle1== ''
				this.showFieldError($("#calle1_pre"),"Debes elegir una calle")
				return false
			else
				rr=window.validateCalle(val_calle1)
				if !rr.res
					this.showFieldError($("#calle1_pre"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#calle1_pre"))
			val_calle2=$('#calle2_pre').val()
			if val_calle2!= ''
			 	rr=window.validateCalle(val_calle2)
				if !rr.res
					this.showFieldError($("#calle2_pre"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#calle2_pre"))
			val_colonia=$('#colonia_pre').val()
			if val_colonia== ''
				this.showFieldError($("#colonia_pre"),"Debes elegir una colonia")
				return false
			else
				rr=window.validateColonia(val_colonia)
				if !rr.res
					this.showFieldError($("#colonia_pre"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#colonia_pre"))
			
			if $("#operativo_pre").val()=='NO'
				this.showFieldError($("#operativo_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#operativo_pre"))

			if $("#no_vehiculos_pre").val()==''
				this.showFieldError($("#no_vehiculos_pre"),"Es necesario especificar el número de vehículos")
				return false
			else
				this.showFieldSuccess($("#no_vehiculos_pre"))
			res=window.validateInt($("#no_vehiculos_pre").val(),0,Number.MAX_VALUE)
			if !res.res
				this.showFieldError($("#no_vehiculos_pre"),res.msg)
				return false
			else
				this.showFieldSuccess($("#no_vehiculos_pre"))
				#Detenidos
			if $("#no_detenidos_pre").val()==''
				this.showFieldError($("#no_detenidos_pre"),"Es necesario especificar el número de vehículos")
				return false
			else
				this.showFieldSuccess($("#no_detenidos_pre"))
			res=window.validateInt($("#no_detenidos_pre").val(),0,Number.MAX_VALUE)
			if !res.res
				this.showFieldError($("#no_detenidos_pre"),res.msg)
				return false
			else
				this.showFieldSuccess($("#no_detenidos_pre"))
			#Heridos
			if $("#no_heridos_pre").val()==''
				this.showFieldError($("#no_heridos_pre"),"Es necesario especificar el número de vehículos")
				return false
			else
				this.showFieldSuccess($("#no_heridos_pre"))
			res=window.validateInt($("#no_heridos_pre").val(),0,Number.MAX_VALUE)
			if !res.res
				this.showFieldError($("#no_heridos_pre"),res.msg)
				return false
			else
				this.showFieldSuccess($("#no_heridos_pre"))

				#Muetros
			if $("#no_vehiculos_pre").val()==''
				this.showFieldError($("#no_muertos_pre"),"Es necesario especificar el número de vehículos")
				return false
			else
				this.showFieldSuccess($("#no_muertos_pre"))
			res=window.validateInt($("#no_muertos_pre").val(),0,Number.MAX_VALUE)
			if !res.res
				this.showFieldError($("#no_muertos_pre"),res.msg)
				return false
			else
				this.showFieldSuccess($("#no_muertos_pre"))

			if $("#pension_pre").val()=='NO'
				this.showFieldError($("#pension_pre"),"Debes elegir una opción")
				return false
			else
				this.showFieldSuccess($("#pension_pre"))

			gafete_intervino=$('#gafete_agente_pre').val()
			if gafete_intervino== ''
				this.showFieldError($("#gafete_agente_pre"),"Debes elegir el número del Elemento")
				return false
			else
				rr=window.validateAgente(gafete_intervino)
				if rr.res==false
					this.showFieldError($("#gafete_agente_pre"),res.msg)
					return false
				else
					this.showFieldSuccess($("#gafete_agente_pre"))
			#validamos la unidad
			unidad=$('#unidad_pre').val()
			if unidad== ''
				this.showFieldError($("#unidad_pre"),"Debes elegir una unidad")
				return false
			else
				rr=window.validateUnidad(unidad)
				if !rr.res
					this.showFieldError($("#unidad_pre"),res.msg)
					return false
				else
					this.showFieldSuccess($("#intervino_pre"))
			that.llenarObservacionesPreliminar()
			return true

		agregarPreliminar:()->
			that=this
			this.actualizarPreliminar()
			if !this.validateFields()
				return
			$.ajax
				data: window.preliminar
				type:"POST"
				url:'/accidente/crearPreliminar/'
				#csrfmiddlewaretoken:'{{ csrf_token }}'
				success:(data)->
					window.preliminar.id=data.id
					pre= window.preliminar
					window.preliminar.folio_evento=data.folio_evento
					that.agregarToMenu()
					a = new Date()
					noticia=
						titulo:data.folio_evento + "    " +  pre.clasificacion_de_accidente + "   " + pre.calle1 + "    " + pre.agente
						noticia:""
						tags:"Preliminar"
						archivos:"/static/fotos_subidas/foto.jpg"
						capturado_por:window.profile.nombre
						fecha:a.format("%Y-%m-%d %H:%M:%S", true)

					dd= 
						noticia:noticia
						last_folio:data.folio_evento 
					window.client.emit 'add-new-preliminar', dd
					that.cancelar()
					that.showMensaje('Se guardo el preliminar con numero de folio <span class="new-folio">' + data.folio_evento + '</span> exitosamente!!!')
					
			return
		showMensaje:(msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
		showCancelarPreliminar:(id)->
			that=this
			$.get 'accidente/pantallas/cancelar_preliminar/',(data)->
				that.showMensaje(data)
		ocultarCaptura:()->
			el=$(".pantalla-captura")
			cambios=
				height: "0px"
				width: "auto"
				height: "0"
				margin: "0 0 0 0"
				padding : "0"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		ocultarLista:()->
			el=$("#pantalla-lista")
			cambios=
				height: "0px"
				"min-height":"0px"
				margin: "0 0 0 0"
				padding : "0"
				width: "auto"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		showCaptura:->
			el=$(".pantalla-captura")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 2s ease"
			el.css(cambios)
		showLista:(fn)->
			that=this
			$.get '/accidente/soloListaPreliminares',(data)->
				$("#pantalla-lista").html(data)
				$('#mostrar-captura-preliminar').on 'click',(evento)->
					that.ocultarLista()
					that.showCaptura()
					#evento.preventDefault()
				cambios=
					width: "98%"
					height: "700px"
					"min-height":"700px" 
					margin: "0 10px 0 10px"
					transition:"all 2s ease"
				el=$("#pantalla-lista").css(cambios)
				fn()
		actualizarPreliminar:()->
			that=this
			preliminar=window.preliminar={}
			preliminar.fecha=$("#fecha_preliminar").val()
			preliminar.hora=$("#hora_preliminar").val()
			preliminar.numero_de_folio=$("#folio_pre").val()
			preliminar.delegacion=$("#delegacion_pre").val()
			preliminar.comandancia=$("#comandancia_pre").val()
			preliminar.turno=$("#turno_pre").val()
			preliminar.tipo_de_evento=$("#tipo_evento_pre").val()
			preliminar.clasificacion_de_accidente=$("#clasificacion_pre").val()
			preliminar.calle1=$("#calle1_pre").val()
			preliminar.calle2=$("#calle2_pre").val()
			preliminar.ref=$("#ref_pre").val()
			preliminar.colonia=$("#colonia_pre").val()
			preliminar.operativo=$("#operativo_pre").val()
			preliminar.no_vehiculos_participantes=$("#no_vehiculos_pre").val()
			preliminar.no_de_detenidos=$("#no_detenidos_pre").val()
			preliminar.no_de_heridos=$("#no_heridos_pre").val()
			preliminar.no_de_muertos=$("#no_muertos_pre").val()
			preliminar.pension=$("#pension_pre").val()
			preliminar.no_de_inventario=$("#no_de_inventario").val()
			preliminar.nombre_agente=$("#nombre_intervino_pre").val()
			preliminar.gafete_agente=$("#gafete_intervino_pre").val()
			preliminar.unidad=$("#unidad_pre").val()
			preliminar.sector=$("#sector_pre").val()
			this.llenarObservacionesPreliminar()
		reiniciarPreliminar:->
			window.preliminar={}
		cargarPreliminar:(fn)->
			that= this
			$.ajax
				type:'GET'
				url:'listaPreliminares.json'
				success:(data)->
					fn(data)
					return
			return
		







