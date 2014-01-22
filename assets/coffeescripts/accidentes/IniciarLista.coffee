define [
  '../core/sandbox'
  'vendor/min/moment'
], (sandbox,momento) ->
	app=
		tabla:null
		isBuscar:true
		iniciar:()->
			that=this
			#this.tabla=$('#listaPartes').dataTable
			#				"bJQueryUI": true,
			#				"sPaginationType": "full_numbers"
			##this.cargarAccidentes()
			$('.view-parte').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showViewAccidente(id)
			$('.parte-frente').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showPdfFrenteAccidente(id)
			$('.parte-posterior').on 'click', (evento)->
				ident= evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showPdfPosteriorAccidente(id)
			$("#show-search").on 'click', (evento)->
				if that.isBuscar==true 
					that.isBuscar=false
					that.ocultarBuscar()
				else
					that.isBuscar=true
					that.mostrarBuscar()
			$(".url-nav").on 'click',(evento)->
				id=evento.currentTarget.id
				that.preDo(id)
			$('#add-field-search').on 'click', (evento)->
				that.appendSearchField()
			$("#buscarPartes").on 'click', (evento)->
				$("#page").val('')
			that.llenarDisponibles()
			that.iniciarCalendario()
			$("#buscarPartes").on 'click', (evento)->
				$("#page").val('')
			$(".url-nav").on 'click',(evento)->
				ident=evento.currentTarget.id
				that.preDo(ident)
			$("#exportarExcel").on 'click', (evento)->
				evento.preventDefault()
				$("#form-search-accidente").attr('action','/accidentes/excel').submit()
				$("#form-search-accidente").attr('action','/accidentes/list')
			that.ordenar_head()
		preDo:(id)->
			$("#page").val(id)
			$("#form-search-accidente").submit()
		ordenar_head:()->
			$("#ordenar_id_preliminar_asc").on 'click',(evento)->
				$("#order_by").val("id_preliminar")
				$("#order_tipo").val("asc")
				$("#form-search-accidente").submit()
			$("#ordenar_id_preliminar_desc").on 'click',(evento)->
				$("#order_by").val("id_preliminar")
				$("#order_tipo").val("desc")
				$("#form-search-accidente").submit()

			$("#ordenar_convenio_fecha_asc").on 'click',(evento)->
				$("#order_by").val("convenio_fecha")
				$("#order_tipo").val("asc")
				$("#form-search-accidente").submit()
			$("#ordenar_convenio_fecha_desc").on 'click',(evento)->
				$("#order_by").val("convenio_fecha")
				$("#order_tipo").val("desc")
				$("#form-search-accidente").submit()

			$("#ordenar_nombre_intervino_asc").on 'click',(evento)->
				$("#order_by").val("nombre_intervino")
				$("#order_tipo").val("asc")
				$("#form-search-accidente").submit()
			$("#ordenar_nombre_intervino_desc").on 'click',(evento)->
				$("#order_by").val("nombre_intervino")
				$("#order_tipo").val("desc")
				$("#form-search-accidente").submit()

			$("#ordenar_unidad_intervino_asc").on 'click',(evento)->
				$("#order_by").val("unidad_intervino")
				$("#order_tipo").val("asc")
				$("#form-search-accidente").submit()
			$("#ordenar_unidad_intervino_desc").on 'click',(evento)->
				$("#order_by").val("unidad_intervino")
				$("#order_tipo").val("desc")
				$("#form-search-accidente").submit()
			$("#ordenar_clasificacion_asc").on 'click',(evento)->
				$("#order_by").val("clasificacion")
				$("#order_tipo").val("asc")
				$("#form-search-accidente").submit()
			$("#ordenar_clasificacion_desc").on 'click',(evento)->
				$("#order_by").val("clasificacion")
				$("#order_tipo").val("desc")
				$("#form-search-accidente").submit()
			return
		showPdfFrenteAccidente:(id_unico)->
			that=this
			$.ajax
				type:"GET"
				url:'/accidente/ventana_reporte_from_id/' + id_unico + '/'
				dataType:'html'
				success: (res)->
					that.showMensaje("PARTE PARA IMPRIMIR ",res)
				error: (error)->
					console.log error
					that.showMensajeError(error.responseText)
			return
		showPdfPosteriorAccidente:(id_unico)->
			that=this
			$.ajax
				type:"GET"
				url:'/accidente/ventana_reporte_posterior_from_id/' + id_unico + '/'
				dataType:'html'
				success: (res)->
					that.showMensaje("PARTE PARA IMPRIMIR ",res)
				error: (error)->
					console.log error
					that.showMensajeError(error.responseText)
			return
		showViewAccidente:(id_unico)->
			that=this
			$.ajax
				type:"GET"
				url:'/accidente/viewAccidente/' + id_unico + '/'
				dataType:'html'
				success: (res)->
					that.showMensaje("Accidente ",res)
				error: (error)->
					console.log error
					that.showMensajeError(error.responseText)
			return
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
		cargarAccidentes:->
			that= this
			$.ajax
				type:'GET'
				url:'listAccidentes.json'
				success:(data)->
					tabla=$("#listaPartes")
					$("#listaPartes>tbody").empty()
					opc=''
					for item in data
						momento= new moment(item.convenio_fecha)
						fecha= momento.format('YYYY-MM-DD hh:mm')
						opc='<tr>'
						opc+= '<td><a href="#" class="updateAccidente" id="' + item.id_unico + '"><i class="icon-pencil"></i></a>  ' +  '<a href="#" class="viewAccidente" id="' + item.id_unico + '"><i class="icon-print"></i></a> ' + '<a href="#" class="deleteAccidente" id="' + item.id_unico + '"><i class="icon-remove"></i></a></td>' 
						opc+= '<td>' + item.id + '</td>'
						opc+= '<td>' + fecha + '</td>'
						opc+= '<td>' + item.nombre_agente + '</td>'
						opc+= '<td>' + item.unidad + '</td>'
						opc+= '<td>' + item.nombre_clasificacion + '</td>' 
						opc+= '</tr>'
						tabla.append(opc)
						$('#' + item.id_unico).on 'click', (evento)->
							id= evento.currentTarget.id
							window.location.href="cargarAccidente/" + id + "/" 
							return
						$("#listaPartes-pa td").on 'click',(evento)->
							elemento=evento.currentTarget
							if elemento.cellIndex>0
								id=$(elemento).parent('tr').attr('id')
								id= evento.currentTarget.id
								window.location.href="cargarAccidente/" + id + "/" 
								return

						
						##$('.deleteAccidente').on 'click', ()->
							 
		ocultarBuscar:()->
			$("#show-search").html('<span class="icosystra-zoom-in"></span>')
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
			$("#show-search").html('<span class="icosystra-zoom-out"></span>')
			el=$("#div-search")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el.css(cambios)
		iniciarCalendario:->
			$('#fecha-inicia-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-final-append').datetimepicker
				pickTime: false
				language: 'es'
		showMensajeError:(msg)->
			$div=$('#myErrorModal .modal-body').html(msg)
			$("#myErrorModal").modal('show')
			$('#myErrorModalLabel').html('ERROR')
		showMensaje:(titulo,msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)
			


