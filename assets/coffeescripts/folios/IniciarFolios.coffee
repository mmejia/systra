define [
  'core/sandbox'
],(sandbox)->
	IniciarFolios=
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			this.llenarProfiles()
			$("#guardar_inf").on 'click',(evento)->
				that.agregarFolio()
			$("#btn-agregar-block").on 'click',(evento)->
				that.showAddBlock()
		agregarFolio:()->
			that=this
			folio=$('#nom-cobro-agente-inf').val()
			block= $('#block-folio').val()
			desde=$('#desde-folio').val()
			hasta=$('#asta-folio').val()
			currentTime = new Date()
			month = currentTime.getMonth() + 1
			day = currentTime.getDate()
			year = currentTime.getFullYear()
			fecha= year + "-" + month + "-" + day 
			datos=
				folio:folio
				block:block
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
				refrescarTablaBlocks(data.data.num_cobro_agente)
				that.cancelar()
			return
		showAddBlock:()->
			el=$("#agregar-block")
			cambios=
				height: "auto"
				width: "100%"
			el.css(cambios)
		ocultarAddBlock:()->
			el=$("#agregar-block")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		showMensaje:(msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
		cancelar:()->
			$('#block-folio').val("")
			$('#desde-folio').val("")
			$('#asta-folio').val("")
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
									folio=$("#nom-cobro-agente-inf").val()
									refrescarTablaBlocks(folio)
			return

