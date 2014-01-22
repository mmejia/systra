define [
  'core/sandbox'
  'infracciones/arbol/ManagerHistorial'
  'perfil/IniciarListPerfil'
], (sandbox,mh, iniciar_lista_perfil)->
	app=
		block_add:false
		iniciar:()->
			that=this
			this.sandbox= new sandbox this
			mh.iniciar()
			#iniciar_lista_perfil.iniciar()
			that.colapsarComandancias()
			$(".view-profile-historial-folios").on 'click',(evento)->
				ident=evento.currentTarget.id
				her=ident.split('_')
				id= her[1] 
				that.showProfileHistorialFolios(id)
			$("#todos_profiles").change ->
				id=$(this).val()
				if id == "NO"
					that.limpiarElemento()
					return
				that.showProfileHistorialFolios(id)
				return
			$("#list-4ta").on 'click',(evento)->
				that.cargarComandancia("4TA")
			$("#list-10ma").on 'click',(evento)->
				that.cargarComandancia("10MA")
			$("#list-feria").on 'click',(evento)->
				that.cargarComandancia("FERIA")
			$("#list-5ta").on 'click',(evento)->
				that.cargarComandancia("5TA")
			$("#list-7ma").on 'click',(evento)->
				that.cargarComandancia("7MA")
			$("#list-6ta").on 'click',(evento)->
				that.cargarComandancia("6TA")
			$("#list-3ra").on 'click',(evento)->
				that.cargarComandancia("3RA")
			$("#list-9na").on 'click',(evento)->
				that.cargarComandancia("9NA")
			$("#list-8va").on 'click',(evento)->
				that.cargarComandancia("8VA")
			$("#list-1ra").on 'click',(evento)->
				that.cargarComandancia("1RA")
			$("#list-2da").on 'click',(evento)->
				that.cargarComandancia("2DA")
			window.IniciarArbol=this
			$('#lista-perfil').on 'click',(evento)->
				that.showListPerfil()
			return
		showListPerfil:->
			$.ajax
				type:"GET"
				url:'/perfil/list'
				dataType:'html'
				#data:datos
				success:(res)->
					$("#fichas-infracciones").html(res)
					iniciar_lista_perfil.iniciar()

			return
		cargarComandancia:(comandancia)->
			that=this
			$.ajax
				type:"GET"
				url:'/folios/list_comandancia/' + comandancia + '/'
				dataType:'html'
				success: (res)->
					$("#fichas-infracciones").html(res)
					#that.iniciarHistorial()
					#window.spinner.stop()
				error: (error)->
					#window.spinner.stop()
					that.showMensajeError(error.responseText)
			return
		colapsarComandancias:()->
			comandancias=["#span-1ra","#span-10ma","#span-2da","#span-3ra","#span-4ta","#span-5ta","#span-6ta","#span-7ma","#span-8va","#span-9na"]
			for com in comandancias
				children =$(com).parent('li.parent_li').find(" > ul > li")
				if children.is(":visible")
					children.hide "fast"
					$(this).attr("title", "Expande esta rama").find(" > i").addClass("icon-plus-sign").removeClass "icon-minus-sign"

		iniciarHistorial:()->
			that=window.IniciarArbol
			that.actualizarAddBlocHistory()
			$('#guardar_inf').on 'click',(evento)->
				that.agregarFolio()
			$("#agregar-bloque").on 'click',(evento)->
				if that.block_add #esto es cuando agregar  esta activo
					that.block_add= false
					that.sandbox.emit 'hidden-add-block'
					that.sandbox.emit 'show-history-block'
				else
					that.sandbox.emit 'show-add-block'
					that.sandbox.emit 'hidden-history-block'
					that.block_add=true
			$('.view-detail-block').on 'click',(evento)->
				ident=evento.currentTarget.id
				her=ident.split('_')
				id= her[1]
				if $("#" + ident).html() == "Ver detalles »"
					$("#" + ident).html("Ocultar detalles «") 
					that.cargarDetailBlock(id)
				else
					$("#" + ident).html("Ver detalles »") 
					$("#detailblock-"+ id).html('')

			$('.remove-block').on 'click',(evento)->
				ident=evento.currentTarget.id
				her=ident.split('_')
				id= her[1]
				that.removeBlock(id)

		removeBlock:(id)->
			that=this
			$.ajax
				type:"GET"
				url:'/folios/borrar_block/' + id + '/'
				dataType:'json'
				success: (res)->
					#that.iniciarHistorial()
					folio= $('#view_cobro').html()
					that.showProfileHistorialFolios(folio)
					
				error: (error)->
					that.showMensajeError(error.responseText)
			return

		agregarFolio:()->
			that=this
			folio=$('#folio').val()
			desde=$('#desde-folio').val()
			hasta=$('#asta-folio').val()
			currentTime = new Date()
			month = currentTime.getMonth() + 1
			day = currentTime.getDate()
			year = currentTime.getFullYear()
			fecha= year + "-" + month + "-" + day 
			datos=
				folio:folio
				desde:desde
				hasta:hasta
				fecha:fecha
			dd=
				data: JSON.stringify(datos)	
			
			$.post '/folios/add', dd,(data)->
				status= data.status
				if status=="OK"
					that.showMensaje('Se guardo el block <span class="new-folio">' + data.data.no_blocks + '</span> exitosamente!!!')
				else
					that.showMensaje(data.msg)
				console.log data
				that.refrescarHistory(data.data.num_cobro_agente)
				that.cancelar()
			return
		cancelar:()->
			$('#desde-folio').val("")
			$('#asta-folio').val("")
		refrescarHistory:(cobro)->
			console.log "Hola mundo"	
		limpiarElemento:()->
			$("#fichas-infracciones").html("")
		actualizarAddBlocHistory:->
			that=window.IniciarArbol
			if this.block_add
				that.sandbox.emit 'show-add-block'
				that.sandbox.emit 'hidden-history-block'
			else
				that.sandbox.emit 'hidden-add-block'
				that.sandbox.emit 'show-history-block'

		showProfileHistorialFolios:(id)->
			that=this
			that.iniciarSpiner()
			$.ajax
				type:"GET"
				url:'/folios/profile_historial_folios/' + id + '/'
				dataType:'html'
				success: (res)->
					$("#fichas-infracciones").html(res)
					that.iniciarHistorial()
					window.spinner.stop()
				error: (error)->
					window.spinner.stop()
					that.showMensajeError(error.responseText)
			return
		cargarDetailBlock:(id)->
			that=this
			that.iniciarSpiner()
			$.ajax
				type:"GET"
				url:'/folios/get_detail_from_folio/' + id + '/'
				dataType:'html'
				success: (res)->
					$("#detailblock-"+ id).html(res)
					window.spinner.stop()
				error: (error)->
					window.spinner.stop()
					that.showMensajeError(error.responseText)
			return

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





