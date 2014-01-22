define [
	'core/sandbox'
],(sandbox) ->
	ManagerObservacionesPP=
		padreId:"#observaciones_pp"
		elementId:"#observaciones_pp_view"
		element:null
		template:null
		padre:null
		iniciar:()->
			this.padre=$ this.padreId
			this.sandbox= new sandbox this
			this.element= $("#ta_observaciones_pp")
			this.sandbox.on("add-text-observaciones", this.appendText)
			this.sandbox.on("vaciar-observaciones", this.vaciarTabla)
			this.sandbox.on("llenar-accidente-observaciones",this.llenarAccidenteObservaciones)
			return
		getValorObservaciones:()->
			valor=''
			valor= this.element.val()
			return valor
		vaciarTabla:->
			this.element.val('')
		llenarAccidenteObservaciones:->
			valor=''
			 
			accidente=window.accidente
			accidente.observaciones= this.element.val()
			return  


		appendText:(data)->
			this.element.val(data.contenido)
			return 

