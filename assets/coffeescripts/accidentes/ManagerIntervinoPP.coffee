define [
	'core/sandbox'
],(sandbox) ->
	ManagerIntervinoPP=
		padreId:"#intervino_pp"
		elementId:"#intervino_view"
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
			$("#nombre_agente_intervino_pp").val(accidente.intervino.gafete + "--" + accidente.intervino.nombre)
			#$("#gafete_intervino_pp").val(accidente.intervino.gafete)
			$("#unidad_intervino_pp").val(accidente.intervino.unidad + "--" + accidente.intervino.sector)
			#$("#sector_intervino_pp").val(accidente.intervino.sector)
		llenarCatAgentes:->
			if !window.catAgentes
				cargarCatAgentes this.llenarCatAgentes
			else
				nombre_agentes=[]
				agentes=window.catAgentes
				for agente in agentes
					str=agente.num_cobro + "--" + agente.nombre
					nombre_agentes.push(str)
				$("#nombre_agente_intervino_pp").autocomplete
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
				$("#unidad_intervino_pp").autocomplete
					source:nombre_unidades
			return

