define [ '../core/sandbox'
], (sandbox) ->
	app=
		sandbox:null
		investigacion:null
		iniciar:(accidente)->
			this.sandbox=new sandbox(this)
			this.investigacion=$('#ta_investigaciones_pp')
			this.sandbox.on 'investigacion-limpiar-texto', this.limpiarInvestigacion
			this.sandbox.on 'add-text-investigaciones', this.appendInvestigaciones
			this.sandbox.on 'llenar-accidente-investigaciones', this.llenarAccidenteInvestigaciones
		limpiarInvestigacion:(data)->
			this.investigacion.val('')
			return 
		appendInvestigaciones:(data)->
			this.investigacion.val(data.contenido)
			return 
		llenarAccidenteInvestigaciones:->
			accidente=window.accidente
			accidente.investigaciones= this.investigacion.val()
			return  




