define [ 
  'core/sandbox'
  'infracciones/BasicOperations'
], (sandbox,bo)->
	app=
		tabla:null
		bo:null
		isBuscar:true
		iniciar:()->
			that=this
			this.bo= bo
			this.sandbox= new sandbox this
			$(".editar-infraccion").on 'click',(evento)->
				ident=evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.ocultarLista()
				that.showCaptura(id)
			that.llenarDisponibles()
			that.iniciarCalendario()
			$('#add-field-search').on 'click', (evento)->
				that.appendSearchField()
			$("#show-search").on 'click', (evento)->
				if that.isBuscar==true 
					that.isBuscar=false
					that.ocultarBuscar()
				else
					that.isBuscar=true
					that.mostrarBuscar()
			$('.view-infraccion').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showViewInfraccion(id)
			$('.print-infraccion').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showPdfInfraccion(id)
			$('#exportarPdf').on 'click', (evento)->
				that.showPdfListInfraccion()
			$('.remove-infraccion').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.removeInfraccion(id)
			$("#buscarInfracciones").on 'click', (evento)->
				#evento.preventDefault()
				$("#page").val('')
			$(".url-nav").on 'click',(evento)->
				id=evento.currentTarget.id
				that.preDo(id)
			$("#exportarExcel").on 'click', (evento)->
				evento.preventDefault()
				$("#frm-search-infracciones").attr('action','/infraccion/excel').submit()
				$("#frm-search-infracciones").attr('action','/infraccion/list')
			that.ordenar_head()
		preDo:(id)->
			$("#page").val(id)
			$("#frm-search-infracciones").submit()
		ordenar_head:()->
			$("#ordenar_folio_asc").on 'click',(evento)->
				$("#order_by").val("folio")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_folio_desc").on 'click',(evento)->
				$("#order_by").val("folio")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()

			$("#ordenar_delegacion_asc").on 'click',(evento)->
				$("#order_by").val("delegacion")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_delegacion_desc").on 'click',(evento)->
				$("#order_by").val("delegacion")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()

			$("#ordenar_comandancia_asc").on 'click',(evento)->
				$("#order_by").val("comandancia")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_comandancia_desc").on 'click',(evento)->
				$("#order_by").val("comandancia")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()

			$("#ordenar_fecha_infrac_asc").on 'click',(evento)->
				$("#order_by").val("fecha_infrac")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_fecha_infrac_desc").on 'click',(evento)->
				$("#order_by").val("fecha_infrac")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()

			$("#ordenar_motivo_asc").on 'click',(evento)->
				$("#order_by").val("motivo")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_motivo_desc").on 'click',(evento)->
				$("#order_by").val("motivo")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_servicio_asc").on 'click',(evento)->
				$("#order_by").val("servicio")
				$("#order_tipo").val("asc")
				$("#frm-search-infracciones").submit()
			$("#ordenar_servicio_desc").on 'click',(evento)->
				$("#order_by").val("servicio")
				$("#order_tipo").val("desc")
				$("#frm-search-infracciones").submit()
			return
		ocultarBuscar:()->
			$("#show-search").html('<i class="icosystra-zoom-in"></i>')
			el=$("#div-search")
			cambios=
				height: "0px"
				width: "auto"
				margin: "0 0 0 0"
				padding : "0"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		mostrarBuscar:()->
			$("#show-search").html('<i class="icosystra-zoom-out"></i>')
			el=$("#div-search")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el.css(cambios)
		removeInfraccion:(folio)->
			that=this
			$.ajax
				type:"GET"
				url:'/infraccion/removeInfraccion/' + folio + '/'
				dataType:'json'
				success: (res)->
					$("#frm-search-infracciones").submit()
				error: (error)->
					console.log error
					that.showMensajeError(error.responseText)
			return

		showPdfInfraccion:(id_unico)->
			that=this
			that.iniciarSpiner()
			$.ajax
				type:"GET"
				url:'/infraccion/ventana_reporte_infraccion_from_id/' + id_unico + '/'
				dataType:'html'
				success: (res)->
					that.showMensaje("INFRACCIÓN ",res)
					window.spinner.stop()
				error: (error)->
					that.showMensajeError(error.responseText)
					window.spinner.stop()
			return
		showPdfListInfraccion:()->
			that=this
			that.iniciarSpiner()
			$.ajax
				type:"GET"
				url:'/infraccion/pdf_list/'
				data: $("#frm-search-infracciones").serialize()
				dataType:'html'
				success: (res)->
					that.showMensaje("INFORME ",res)
					window.spinner.stop()
				error: (error)->
					that.showMensajeError(error.responseText)
					window.spinner.stop()
			return
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

		showViewInfraccion:(id)->
			that=this
			that.iniciarSpiner()
			$.ajax
				type:"GET"
				url:'/infraccion/viewInfraccion/' + id + '/'
				dataType:'html'
				success: (res)->
					that.showMensaje("INFRACCION ",res,that.llenarViewInfraccion)
					window.spinner.stop()
				error: (error)->
					console.log error
					window.spinner.stop()
					that.showMensajeError(error.responseText)
			return
		llenarViewInfraccion:()->
			that= this
			if window.view_infraccion
				inf= window.view_infraccion
				$('#view_folio_infraccion').html(inf.folio_infraccion)
				if inf.nombreAgente == 'None'
					$('#view_nombre-agente-inf').html("")
				else
					$('#view_nombre-agente-inf').html(inf.nombreAgente)

				
				$('#view_nom-cobro-agente-inf').html(inf.noCobro)
				rd_taxi=document.getElementById("view_rd_taxi_spa_inf")
				rd_urbano=document.getElementById("view_rd_urbano_spa_inf")
				rd_foraneo=document.getElementById("view_rd_foraneo_spa_inf")
				rd_policia=document.getElementById("view_rd_policia_spa_inf")
				rd_transito=document.getElementById("view_rd_transito_spa_inf")
				$('#view_fecha_inf').html(inf.fecha)
				$('#view_hora_inf').html(inf.hora)
				$('#view_delegacion_spa_inf').html(inf.delegacion)
				$('#view_comandancia_spa_inf').html(inf.comandancia)
				$('#view_turno_spa_inf').html(inf.turno)
				$('#view_colonia_spa_inf').html(inf.colonia)
				$('#view_calle1_spa_inf').html(inf.calle1)
				$('#view_calle2_spa_inf').html(inf.calle2)
				$('#view_referencia_spa_inf').html(inf.referencia)
				$('#view_lat_inf').html(inf.latitud)
				$('#view_lng_inf').html(inf.longitud)
				$('#view_tipo_operativo_spa_inf').html(inf.tipo_operativo)
				$('#view_circulacion_spa_inf').html(inf.circulacion)
				onlyViewRecoje()
				onlyViewArticulos()
				onlyViewInfractor()
				onlyViewCaracteristicasVehiculo()
				viewOnlyCertificadoMedico()
				#this.sandbox.emit 'view_update-caracteristicas-vehiculo'
				#this.sandbox.emit 'view_update-certificado-medico'
				 
				if inf.firmo== 'si'
					$('#si_firmo_inf').click()
				else 
					$('#no_firmo_inf').click()
				 
				viewOnlyObservaciones()
				#this.sandbox.emit 'view_llenar-observaciones'
		showMensajeError:(msg)->
			$div=$('#myErrorModal .modal-body').html(msg)
			$("#myErrorModal").modal('show')
			$('#myErrorModalLabel').html('ERROR')
		showMensaje:(titulo,msg,fn,sandbox)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)
			if fn
				fn(sandbox)
				window.spinner.stop()
		appendSearchField:->
			seleccionado=$('#campos').val()
			div=$('<div class="span4"></div>')
			label='<label>' + seleccionado + '</label>'
			inp='<input id="' + seleccionado + '" name="' + seleccionado + '" type="text">'
			div.append(label)
			div.append(inp)
			$search=$('#search-append')
			$search.append(div)
			this.quitarDisponible(seleccionado)
		quitarDisponible:(campo)->
			for disponible,i in window.disponibles_json
				if disponible == campo
					window.disponibles_json.splice(i,1)
			this.llenarDisponibles()
		llenarDisponibles:->
			sel=$('#campos').empty()
			if window.disponibles_json
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for disponible in window.disponibles_json
					opciones+='<option value="'+disponible+'">'+disponible+'</option>'
				sel.append(opciones)
		ocultarLista:->
			el=$("#pantalla-lista")
			cambios=
				height: "0px"
				margin: "0 0 0 0"
				padding : "0"
				width: "auto"
				overflow:"hidden"
				transition:"all 4s ease"
			el.css(cambios)
		iniciarCalendario:->
			$('#fecha-inicia-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-final-append').datetimepicker
				pickTime: false
				language: 'es'
		showCaptura:(id)->
			that=this
			gg=$.get '/infraccion/solo_captura_infraccion/' + id + '/',(data)->
				$(".pantalla-captura").html(data)
				that.bo.iniciar()
				window.cargarSelects(that.bo)
				$('#mostrar-captura-preliminar').on 'click',->
					that.ocultarLista()
			gg.fail ()->
				alert 'Error'
			el=$(".pantalla-captura")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el.css(cambios)
		cargarInfracciones:->
			that= this
			$.ajax
				type:'GET'
				url:'listInfracciones.json'
				success:(data)->
					for item in data
						articulos= item.articulos
						nom_articulo=''
						for articulo in articulos
							nom_articulo= articulo.ART + " " + articulo.FRACC + "/" 
						that.tabla.dataTable().fnAddData [
							'<a href="#" class="updateInfraccion" id="'+ item.id + '"><i class="icon-pencil"></i></a>  ' + '<a href="#" class="viewInfraccion" id="' + item.id + '"><i class="icon-print"></i></a> ' + '<a href="#" class="deleteInfraccion" id="' + item.id + '"><i class="icon-remove"></i></a>'
							item.folio
							item.delegacion
							item.comandancia
							item.fecha
							nom_articulo
							item.tipo_servicio
						]
						$('#' + item.id).on 'click', (evento)->
							id= evento.currentTarget.id
							window.location.href="cargarInfraccion/"+ id + "/"
							return
						$('#' + item.id).on 'click', ()->
							console.log "Vamos a ver la infraccion"
						$('#' + item.id).on 'click', ()->
							console.log "Vamos a Borrar el accidente"
		cargarAccidente:->
			


