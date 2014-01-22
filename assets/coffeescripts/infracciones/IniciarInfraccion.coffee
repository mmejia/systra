define [
  'core/sandbox'
],(sandbox,reporte_pdf)->
	IniciarInfraccion=
		observaciones:null
		radServicioParticular:null
		radServicioPublico:null
		iniciar:()->
			this.sandbox= new sandbox this
			that= this
			this.observaciones=$('#observaciones_inf').wysihtml5()
			#this.sandbox.on 'cargar-infraccion-en-view',this.cargarInfraccionEnView
			this.sandbox.on 'guardar-infraccion-local', this.guardarInfraccionLocal
			this.sandbox.on 'refrescar-window-infraccion', this.refrescarWindowInfraccion
			this.sandbox.on 'limpiar-view-infraccion', this.cancelar
			this.sandbox.on 'guardar-infraccion-server', this.guardarInfraccionServer
			this.sandbox.on 'cargar-infraccion-en-view-server',this.cargarInfraccionServer
			that.iniciarDate()
			this.radServicioPublico=document.getElementById("radioServicioPublico")
			this.radServicioParticular=document.getElementById("radioServicioParticular")
			window.refsync=window.ip_sys_msg
			window.client=io.connect(window.refsync)
			$('#guardar_local_infraccion').on  'click',->
				that.sandbox.emit 'guardar-infraccion-local'
			$('#guardar_inf').on  'click',->
				that.sandbox.emit 'guardar-infraccion-server'
			$('#cancelar_inf').on "click",()->
				that.sandbox.emit 'limpiar-view-infraccion'
			$('#refrescar-ubicacion-calle').on 'click', (evento)->
				that.ubicarCalle()
			$('#cargar_inf').on 'click', (evento)->
				console.log window.infraccion
				that.cargarInfraccionEnView()
			$('.only-number').numeric()
			window.onunload = that.doThisWhenUserLeaves
			#window.onunload = that.doThisWhenUserLeaves
			#else if window.onbeforeunload
			window.onbeforeunload = that.doThisBeforeUserLeaves
			this.iniciarVentanaReportePdf()
			this.iniciarCalendario()

			$(document).keypress 'ctrl+l',(evento)->
				if evento.ctrlKey
					if evento.charCode ==16 #cuando es p
						that.showSelReporte(that)
					else if evento.charCode == 12 # cuando es l
						that.guardarInfraccionLocal()
				return
			$(".trigger").click ()->
				$(".panel").toggle("fast")
				$(this).toggleClass("active")
				return false
			this.llenarDefaultFecha()
		iniciarCalendario:()->
			$("#fecha-capt-inf2").datetimepicker
				maskInput: true
				pickTime: false
				language:'es'
			$("#hora-capt-inf2").datetimepicker
				pickDate: false
				maskInput:true
				language:'es'
			#$("#fecha_inf").mask("99-99-9999");
			#$("#hora_inf").mask("99:99");
		doThisWheUserLeaves:->
			showMensaje()
		doThisBeforeUserLeaves:->
			showMensaje()
			#alert "Cuando el usuario antes de dejar la pagina"
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
			that= this
			val_FolioAgente= $("#nom-cobro-agente-inf").val()
			if val_FolioAgente== ''
				this.showFieldError($("#nom-cobro-agente-inf"),"debes elegir un cobro")
				return false
			else
				rr= window.validateFolioAgente(val_FolioAgente)
				if !rr.res
					this.showFieldError($("#nom-cobro-agente-inf"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#nom-cobro-agente-inf"))
			return true		
		iniciarVentanaReportePdf:->
			that=this
			$("#generar_reporte_inf").on "click",(event)->
				that.refrescarWindowInfraccion()
				that.showSelReporte()
			return
		showMensaje:(titulo,msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)
		showSelReporte:(comp)->
			that=this
			this.refrescarWindowInfraccion()
			datos=
				data: JSON.stringify(window.infraccion)
			console.log JSON.stringify(window.infraccion)
			$.ajax
				type:"POST"
				url:'/infraccion/ventana_reporte_infraccion/'
				dataType:'html'
				data:datos
				success:(res)->
					console.log res
					that.showMensaje("Reporte para imprimir",res)
			return
		cargarInfraccionServer:(id)->
			this.id= id
			this.url= 'getInfraccion/'+ this.id
			that= this
			$.ajax
				type:'GET'
				url: that.url
				success:(data)->
					window.infraccion= data[0]
					that.sandox.emit 'cargar-infraccion-en-view'
		guardarInfraccionServer:->
			this.refrescarWindowInfraccion()
			this.guardarLocalInfraccionServer()
			if !this.validateFields()
				return
			that=this
			that.infr= window.infraccion
			datos=
				data: JSON.stringify(window.infraccion)
			$.ajax
				type:"POST"
				url:'/infraccion/crear'
				dataType:"json"
				data:datos
				success:(data)->
					if data.ERROR != '' and data.ERROR != undefined
						that.showMensaje("ERROR",data.ERROR)	
						return
					a = new Date()
					noticia=
						titulo:that.infr.folio_infraccion + "    " +  that.infr.infractor.nombre + "   " + that.infr.calle1 + "    " + that.infr.calle2
						noticia:""
						tags:"Infraccion"
						archivos:"/static/fotos_subidas/foto.jpg"
						capturado_por:window.profile.nombre
						fecha:a.format("%Y-%m-%d %H:%M:%S", true)
					window.client.emit 'add-new', noticia
					that.showMensaje("Mensaje de captura",'Se guardo la infracción con numero de folio <span class="new-folio">' + that.infr.folio_infraccion + '</span> exitosamente!!!')
					that.sandbox.emit 'limpiar-view-infraccion'
				error:(error)->
						that.showMensajeError(error.responseText)
			return
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
		showMensajeError:(msg)->
			$div=$('#myErrorModal .modal-body').html(msg)
			$("#myErrorModal").modal('show')
			$('#myErrorModalLabel').html('ERROR')
		guardarLocalInfraccionServer:->
			that=this
			inf_server= sessionStorage.getItem('infracciones-server')
			id = window.infraccion.folio_infraccion
			if !inf_server
				infracciones=[]
				infracciones.push(id)
				obj = JSON.stringify(infracciones)
				sessionStorage.setItem('infracciones-server',obj)
				this.sandbox.emit 'update-menu-infracciones-server',infracciones
			else
				a_infracciones = JSON.parse(inf_server) 
				if a_infracciones.length >5
					a_infracciones.shift()
				that.agregarInventarioServerToLocalStorage(a_infracciones,id)
				obj = JSON.stringify(a_infracciones)
				sessionStorage.setItem('infracciones-server',obj)
				this.sandbox.emit 'update-menu-infracciones-server',a_infracciones
		agregarInventarioServerToLocalStorage:(col,p_folio)->
			clone = col.slice(0)
			ban= false
			indice= 0
			for folio,i in clone
				if folio == p_folio
					indice= i
					ban= true
			if ban
				col[indice]= p_folio
			else
				col.push(p_folio)
			return

		llenarDefaultFecha:()->
			d= new Date()
			curr_date= d.getDate()
			curr_month=d.getMonth()+1
			curr_year=d.getFullYear()
			curr_hora= d.getHours()
			curr_minuto= d.getMinutes()
			$("#fecha_inf").val( curr_date  + "-" +  curr_month + "-" + curr_year)
			tt= curr_hora + ":" + curr_hora
			$("#hora_inf").val(tt) 
		cancelar:->
			$('#folio_infraccion').val('')
			$('#nombre-agente-inf').val('')
			$('#nom-cobro-agente-inf').val('')
			this.llenarDefaultFecha()
			$('#delegacion_spa_inf').val('NO')
			$('#comandancia_spa_inf').val('NO')
			$('#turno_spa_inf').val('NO')
			$('#colonia_spa_inf').val('')
			$('#calle1_spa_inf').val('')
			$('#calle2_spa_inf').val('')
			$('#referencia_spa_inf').val('')
			$('#lat_inf').val('')
			$('#lng_inf').val('')
			$('#tipo_operativo_spa_inf').val('')
			$('#circulacion_spa_inf').val('')
			this.sandbox.emit 'limpiar-articulos'
			this.sandbox.emit 'limpiar-recoje'
			this.sandbox.emit 'limpiar-infractor'
			this.sandbox.emit 'limpiar-caracteristicas-vehiculo'
			this.sandbox.emit 'limpiar-certificado-medico'
			$('#si_firmo_inf').attr("checked",false)
			$('#no_firmo_inf').attr("checked",false)
			this.sandbox.emit 'limpiar-observaciones'
		reiniciarInfraccion:->
			window.infraccion={}
			window.infraccion.articulos=[]
			window.infraccion.infractor={}
			window.infraccion.vehiculo={}
			return

		refrescarWindowInfraccion:->
			this.reiniciarInfraccion()
			inf= window.infraccion
			inf.folio_infraccion= $('#folio_infraccion').val()
			inf.nombreAgente=$('#nombre-agente-inf').val()
			inf.noCobro=$('#nom-cobro-agente-inf').val()
			if this.radServicioParticular.checked
				inf.tipo_servicio= "Servicio Particular"
			else if this.radServicioPublico.checked
				inf.tipo_servicio= "Servicio Publico"
				rd_taxi=document.getElementById("rd_taxi_spa_inf")
				rd_urbano=document.getElementById("rd_urbano_spa_inf")
				rd_foraneo=document.getElementById("rd_foraneo_spa_inf")
				rd_policia=document.getElementById("rd_policia_spa_inf")
				rd_transito=document.getElementById("rd_transito_spa_inf")
				if rd_taxi.checked 
					inf.tipo_publico= "Taxi"
				if rd_urbano.checked 
					inf.tipo_publico= "Urbano"
				if rd_foraneo.checked 
					inf.tipo_publico= "Foráneo"
				if rd_policia.checked 
					inf.tipo_publico= "Policía"
				if rd_transito.checked 
					inf.tipo_publico= "Tránsito"
			else
				inf.tipo_servicio= "Servicio Particular"
			
			inf.hora=$('#hora_inf').val()
			inf.fecha=$('#fecha_inf').val()
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
			inf.circulacion=$('#circulacion_spa_inf').val()
			this.sandbox.emit 'llenar-infraccion-articulos'
			this.sandbox.emit 'llenar-infraccion-recoje'
			this.sandbox.emit 'llenar-infraccion-infractor'
			this.sandbox.emit 'llenar-infraccion-caracteristicas-vehiculo'
			this.sandbox.emit 'llenar-infraccion-certificado-medico'
			if $('#si_firmo_inf').is(':checked')
				inf.firmo="si"
			else
				inf.firmo="no"
			return
		guardarInfraccionLocal:->
			this.refrescarWindowInfraccion()
			inf= window.infraccion
			infracciones= sessionStorage.getItem('infraccionesl')
			if !infracciones
				infracciones=[]
				infracciones.push(inf)
				obj =JSON.stringify(infracciones)
				sessionStorage.setItem('infraccionesl',obj)
				this.sandbox.emit 'update-menu-infracciones-local', infracciones
			else
				a_infracciones=JSON.parse(infracciones)
				if a_infracciones.length>5
					a_infracciones.shift()
				#a_infracciones.push(inf)
				this.agregarInfraccion(a_infracciones,inf)
				obj= JSON.stringify(a_infracciones)
				sessionStorage.setItem("infraccionesl",obj)
				this.sandbox.emit 'update-menu-infracciones-local',a_infracciones
			this.sandbox.emit 'limpiar-view-infraccion'
		agregarInfraccion:(col,p_inf)->
			clone = col.slice(0)
			ban=false
			indice=0
			for inf,i in clone
				if inf.folio_infraccion == p_inf.folio_infraccion
					indice=i
					ban=true
			if ban
				col[indice]= p_inf
			else
				col.push(p_inf)
			return

		cargarInfraccionEnView:->
			alert 'Hola estoy cargando on view'
			inf=window.infraccion
			$('#folio_infraccion').val(inf.folio_infraccion)
			$('#nombre-agente-inf').val(inf.nombreAgente)
			$('#nom-cobro-agente-inf').val(inf.noCobro)
			rd_taxi=document.getElementById("rd_taxi_spa_inf")
			rd_urbano=document.getElementById("rd_urbano_spa_inf")
			rd_foraneo=document.getElementById("rd_foraneo_spa_inf")
			rd_policia=document.getElementById("rd_policia_spa_inf")
			rd_transito=document.getElementById("rd_transito_spa_inf")
			if inf.tipo_servicio == "Servicio Publico"
				this.sandbox.emit 'show-servicio-publico', true
				optServicioPublico.checked=true
				if inf.tipo_publico == "Taxi"
					rd_taxi.checked=true
				else if inf.tipo_publico == "Urbano"
					rd_urbano.checked=true
				else if inf.tipo_publico == "Foráneo"
					rd_foraneo.checked=true
				else if inf.tipo_publico == "Policía"
					rd_policia.checked=true
				else if inf.tipo_publico == "Tránsito"
					rd_transito.checked=true
			else
				this.sandbox.emit 'show-servicio-publico', false
				optServicioPublico.checked=false
				optServicioParticular.checked=true
				rd_taxi.checked=false
				rd_urbano.checked=false
				rd_foraneo.checked=false
				rd_policia.checked=false
				rd_transito.checked=false
			$('#hora').val(inf.fecha_hora)
			$('#delegacion_spa_inf').val(inf.delegacion)
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
				$('#si_firmo_inf').click()
			else 
				$('#no_firmo_inf').click()
			this.sandbox.emit 'llenar-observaciones'
			return