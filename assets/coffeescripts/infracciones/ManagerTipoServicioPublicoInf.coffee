define ['core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#ManagerTipoServicioPublico"
		elementId:"#managerTipoServicioPublico_spa_inf_view"
		element:null
		template:null
		padre:null
		articulosSel:[]
		iniciar:->
			that=this
			this.padre= $(this.padreId)
			this.element= $(this.elementId)
			this.sandbox= new sandbox this
			this.sandbox.on 'show-servicio-publico', this.showTipoServicioPublico
			this.padre.hide()
			$('input[name="optServicio"]').on "click", ->
				if ""+ this.value == "Servicio Particular"
					that.sandbox.emit 'show-servicio-publico', false
				else if this.value =="Servicio Publico"
					that.sandbox.emit 'show-servicio-publico', true
			return
		showTipoServicioPublico:(bol)->
				this.mostrar(bol)
				return
		mostrar:(bol)->
			if bol 
				this.padre.show()
			else 
				this.padre.hide()
