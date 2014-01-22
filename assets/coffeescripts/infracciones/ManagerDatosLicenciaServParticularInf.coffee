define [
		'core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#recoje_licencia_spa_inf"
		elementId:"#DatosLicenciaServParticularInf-View"
		element:null
		template:null
		padre:null
		articulosSel:[]
		 
		iniciar:->
			that=this
			this.padre= $ this.padreId
			this.element= $ this.elementId
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append this.template
			this.element.hide()
			this.llenarEstados()
			return
		llenarEstados:->
			if !window.estados
							cargarEstados this.llenarEstados
						else
							nombres=[]
							for item in window.estados
								 
								nombres.push item.estado
							 
							$("#estado_dl_sp_inf").autocomplete
								source:nombres
			return