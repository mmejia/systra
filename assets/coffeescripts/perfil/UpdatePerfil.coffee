define [
	'core/sandbox'
],(sandbox)->
	 UpdatePerfil=
		iniciar:()->
			that=this
			this.sandbox= new sandbox(this)
			this.formUpdatePerfil=$('#updatePerfil').ajaxForm
				mod:that
				success:(data) ->
					 alert 'Hola mundo'
			$('#update-perfil').on 'click',(evento)->
				that.formUpdatePerfil.submit()
			$.when(
				$.ajax("/catalogos/delegaciones.json"),
				$.ajax("/catalogos/comandancias.json"),
				$.ajax("/catalogos/turnos.json"),
			).done (delegaciones,comandancias,turnos)->
				window.delegaciones= delegaciones[0]
				window.comandancias= comandancias[0]
				window.turnos= turnos[0]
				that.llenarDelegaciones()
				that.llenarComandancias()
				that.llenarTurnos()
				that.cargarPerfilEnView()

		actualizarPerfil:()->
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

		cargarPerfilEnView:()->
			perfil= window.perfil
			$('#perf_id').val(perfil.id)
			$('#perf_cobro').val(perfil.cobro)
			$('#perf_nombre').val(perfil.nombre)
			$('#perf_comandancia').val(perfil.comandancia)
			$('#perf_turno').val(perfil.turno)
			$('#perf_delegacion').val(perfil.delegacion)
			$('#perf_comision').val(perfil.comision)
			$('#perf_color').val(perfil.color)
			$('#perf_tam_tablas').val(perfil.tam_tabla)

		llenarDelegaciones:->
			if !window.delegaciones
				window.cargarDelegaciones this.llenarDelegaciones
			else
				sel=$('#perf_delegacion').empty()
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				console.log  window.delegaciones
				for delegacion in window.delegaciones
					opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
				sel.append(opciones)
			return
		llenarTurnos:->
			if !window.turnos
				cargarTurnos this.llenarTurnos
			else
				sel=$('#perf_turno').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for turno in window.turnos
					opciones+='<option value="'+turno.turno+'">'+turno.turno+'</option>'
				sel.append(opciones)
				return
		llenarComandancias:->
			if !window.comandancias
				cargarComandancias this.llenarComandancias
			else
				sel=$('#perf_comandancia').html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for comandancia in window.comandancias
					opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
				sel.append(opciones)
				return
