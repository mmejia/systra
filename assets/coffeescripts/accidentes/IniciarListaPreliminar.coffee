define [
	'core/sandbox'
],(sandbox)->
	IniciarListaPreliminar=
		tabla:null
		isBuscar:true
		iniciar:()->
			that=this
			#that.llenarComandancias()
			that.iniciarCalendario()
			setModulo('accidente')
			$(".cancelar-preliminar").on 'click',(evento)->
				id=evento.currentTarget.id
				that.showCancelarPreliminar(id)
			$(".editar-preliminar").on 'click',(evento)->
				id=evento.currentTarget.id
				that.ocultarLista()
				that.showCaptura(id)
			$("#listaPreliminar_p td").on 'click',(evento)->
				elemento=evento.currentTarget
				if elemento.cellIndex>0
					id=$(elemento).parent('tr').attr('id')
					that.ocultarLista()
					that.showCaptura(id)
			$("#show-search").on 'click', (evento)->
				if that.isBuscar==true 
					that.isBuscar=false
					that.ocultarBuscar()
				else
					that.isBuscar=true
					that.mostrarBuscar()
			$('#mostrar-captura-preliminar').on 'click',(evento)->
				alert 'Hola mundo'
				that.ocultarLista()
				that.showAddCaptura()
			$(".url-nav").on 'click',(evento)->
				id=evento.currentTarget.id
				that.preDo(id)


					
			#$(".capturar-parte-from-preliminar").on 'click',(evento)->
			#	id=evento.currentTarget.id
			#	that.ocultarLista()
			#	that.showCapturaParte(id)
		preDo:(id)->
			$("#page").val(id)
			$("#form-search-preliminar").submit()
		showAddCaptura:(fn)->
			that=this
			$.get '/accidente/soloCapturaPreliminares',(data)->
				$("#pantalla-lista").html(data)
				$('#mostrar-captura-preliminar').on 'click',(evento)->
					that.ocultarLista()
					that.showCaptura()
				cambios=
					width: "98%"
					height: "700px"
					"min-height":"700px" 
					margin: "0 10px 0 10px"
					transition:"all 2s ease"
				el=$(".pantalla-captura").css(cambios)
				fn()
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
		llenarComandancias:->
			if !window.comandancias
				cargarComandancias this.llenarComandancias
			else
				valor=$("#comandancia").val()
				alert valor
				sel=$("#comandancia").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for comandancia in window.comandancias
					if comandancia.comandancia!="" and  comandancia.comandancia == valor
						opciones += '<option value="'+comandancia.comandancia+'" selected="selected">'+comandancia.comandancia+'</option>'
					else
						opciones += '<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
				sel.append(opciones)
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
		showMensaje:(titulo,msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)

		ocultarCaptura:()->
			el=$(".pantalla-captura")
			cambios=
				height: "0px"
				width: "auto"
				margin: "0 0 0 0"
				padding : "0"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		ocultarLista:()->
			el=$("#pantalla-lista")
			cambios=
				height: "0px"
				margin: "0 0 0 0"
				padding : "0"
				width: "auto"
				overflow:"hidden"
				transition:"all 4s ease"
			el.css(cambios)
		showCaptura:(id)->
			$.get '/accidente/soloCapturaPreliminar/' + id + '/',(data)->
				$(".pantalla-captura").html(data)
				window.cargarSelects(this.loadOnView)
				$('#mostrar-captura-preliminar').on 'click',->
					that.ocultarLista()
			el=$(".pantalla-captura")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el.css(cambios)
			#alert 'Comunicacion directa'
			alert 'Termino de cargarse'
		showCapturaParte:(id)->
			$.get '/accidente/captura/' + id + '/',(data)->
				$(".pantalla-captura").html(data)
				window.cargarSelects(this.loadOnView)
				$('#mostrar-captura-preliminar').on 'click',->
					that.ocultarLista()
			el=$(".pantalla-captura")
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el.css(cambios)
		showLista:->
			that=this
			cambios=
				height: "auto"
				width: "98%"
				margin: "0 10px 0 10px"
				transition:"all 4s ease"
			el=$("#pantalla-lista").css(cambios)
		showCancelarPreliminar:(id)->
			that=this
			$.get '/accidente/pantallas/cancelar_preliminar/',(data)->
				titulo="Cancelando folio de preliminar"
				that.showMensaje(titulo,data)
				$('#folio-cancelar-preliminar').html(id)
				$('#cancelar-folio-preliminar').on 'click', (evento)->
					causa=$('#status-cancelar-preliminar').val()
					id_cabina=$('#folio-cancelar-preliminar').html()
					dd =  
						motivo : causa
						ident : id_cabina
					$.post '/accidente/cancelarPreliminar/',dd,(resultado)->
						console.log "Se actualizo el "
		iniciarCalendario:->
			$('#fecha-inicia-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-final-append').datetimepicker
				pickTime: false
				language: 'es'
		cargarPreliminares:->
			that=this
			$.ajax
				type:'GET'
				url:'listaPreliminares.json'
				success:(data)->
					tabla=$("#listaPreliminar_r")
					$("#listaPreliminar_r>tbody").empty()
					opc=''
					for item in data
						opc='<tr>'
						opc+=  '<td><a href="#" class="updatePreliminar" id="' + item.id + '"><i class="icon-pencil"></i></a>  ' +  '<a href="#" class="viewAccidente" id="' + item.id + '"><i class="icon-eye-open"></i></a></td>' 
						opc+= '<td>' + item.fecha + '</td>'
						opc+= '<td>' + item.folio_evento + '</td>'
						opc+= '<td>' + item.agente + '</td>'
						opc+= '<td>' + item.lugar + '</td>' 
						opc+= '</tr>'
						tabla.append(opc)
						$('#' + item.id).on 'click', (evento)->
							console.log evento.currentTarget.id
							id= evento.currentTarget.id
							window.location.href="cargarPreliminar/" + id + "/" 
							return