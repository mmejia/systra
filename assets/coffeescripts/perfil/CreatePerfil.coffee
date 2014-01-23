define [
	'core/sandbox'
],(sandbox)->
	 CreatePerfil=
		iniciar:()->
			that=this
			this.sandbox= new sandbox(this)
			this.formCreatePerfil=$('#createPerfil').ajaxForm
				mod:that
				success:(data) ->
					that.sandbox.emit 'perfil-show-list'
				error:(err)->
					alert 'Error al intentar actualizar perfil'
			$('#create-perfil').on 'click',(evento)->
				that.formCreatePerfil.submit()
			that.llenarDelegaciones()
			that.llenarComandancias()
			that.llenarTurnos()
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
