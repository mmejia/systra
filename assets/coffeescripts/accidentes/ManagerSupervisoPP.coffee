define [
	'core/sandbox'
],(sandbox) ->
	SupervisoIntervinoPP=
		padreId:"#superviso_pp"
		elementId:"#superviso_view"
		element:null
		template:null
		padre:null
		iniciar:()->
			this.padre=$ this.padreId
			this.sandbox= new sandbox this
			#this.template=template;
			#this.padre.append this.template
			this.llenarCatAgentes()
			this.llenarTbUnidades2008()
			#if window.accidente
			#	this.actualizarDatos()
			return
		actualizarDatos:->
			accidente= window.accidente
			$("#nombre_agente_superviso_pp").val(accidente.superviso.gafete + "--" + accidente.superviso.nombre)
			#$("#gafete_superviso_pp").val(accidente.superviso.gafete)
			$("#unidad_superviso_pp").val(accidente.superviso.sector + "--" + accidente.superviso.unidad)
			#$("#sector_superviso_pp").val(accidente.superviso.sector)
			
		llenarCatAgentes:->
			if !window.catAgentes
				cargarCatAgentes this.llenarCatAgentes
			else
				nombre_agentes=[]
				agentes=window.catAgentes
				for agente in agentes
					str=agente.num_cobro + "--" + agente.nombre
					nombre_agentes.push(str)
				$("#nombre_agente_superviso_pp").autocomplete
													source:nombre_agentes
			return
		llenarTbUnidades2008:->
			if !window.tbUnidades2008
				cargarTbUnidades2008 this.llenarTbUnidades2008
			else
				nombre_unidades=[]
				unidades=window.tbUnidades2008
				for unidad in unidades
					 
					str=unidad.no_unidad
					nombre_unidades.push(str)
				$("#unidad_superviso_pp").autocomplete
					source:nombre_unidades
			return

