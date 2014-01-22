define [
	'/static/javascripts/core/sandbox.js'
],(sandbox)->
	tpl_noticia:null
	IniciaMain=
		iniciar:()->
			that=this
			this.sandbox= new sandbox(this)
			that.llenarDelegaciones()
			that.llenarComandancias()
			that.llenarTurnos()
			that.iniciarPickeColor()
			return
		iniciarPickeColor:->
			$('.pick-a-color').pickAColor
				showSpectrum: true
				showSavedColors: true
				saveColorsPerElement: true
				fadeMenuToggle: true
				showAdvanced: true
				showBasicColors: true
				showHexInput: true
				allowBlank: true

		llenarDelegaciones:->
			if !window.delegaciones
				window.cargarDelegaciones this.llenarDelegaciones
			else
				sel=$('#perf_delegacion').empty()
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for delegacion in window.delegaciones
					opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
				sel.append(opciones)
			return
		llenarComandancias:->
			if !window.comandancias
				window.cargarComandancias this.llenarComandancias
			else
				sel=$('#perf_comandancia').empty()
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for comandancia in window.comandancias
					opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
				sel.append(opciones)
			return
		llenarComandancias:->
			if !window.comandancias
				window.cargarComandancias this.llenarComandancias
			else
				sel=$('#perf_comandancia').empty()
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for comandancia in window.comandancias
					opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
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
