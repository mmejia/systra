define [
		'core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#managerDatosInfractor_spa_inf"
		elementId:"#DatosInfractorServParticularInf-View"
		element:null
		template:null
		padre:null
		articulosSel:[]
		 
		iniciar:->
			that=this
			this.padre= $ this.padreId
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append this.template
			this.llenarColonias()
			this.llenarMunicipios()
			this.llenarEstados()
			this.establecerDefault()
			this.sandbox.on 'update-infractor', this.updateInfractor
			this.sandbox.on 'limpiar-infractor', this.limpiarInfractor
			this.sandbox.on 'llenar-infraccion-infractor',this.llenarInfraccionInfractor
			$("#se-desconoce-conductor").on 'click', (evento)->
					obj= evento.currentTarget
					if obj.checked==true
						that.establecerSeDesconoceConductor()
					else
						that.disEstablecerSeDesconoceConductor()
		llenarInfraccionInfractor:->
			infractor= window.infraccion.infractor={}
			infractor.nombre=$('#nombre_di_sp_inf').val()
			infractor.appPat=$('#appPaterno_di_sp_inf').val()
			infractor.appMat=$('#appMaterno_di_sp_inf').val()
			infractor.sexo=$('#sexo_di_sp_inf').val()
			infractor.edad=$('#edad_di_sp_inf').val()
			infractor.domicilio=$('#domicilio_di_sp_inf').val()
			infractor.numero=$('#nom_di_sp_inf').val()
			infractor.colonia=$('#colonia_di_sp_inf').val()
			infractor.ciudad=$('#ciudad_di_sp_inf').val()
			infractor.estado=$('#estado_di_sp_inf').val()
			infractor.no_licencia=$('#no_licencia_di_sp_inf').val()
			return
		establecerDefault:->
			that=this
			$("#nombre_di_sp_inf_default").on 'click', ->
				$("#nombre_di_sp_inf").val("SE DESCONOCE")
			$("#appPaterno_di_sp_inf_default").on 'click', ->
				$("#appPaterno_di_sp_inf").val("SE DESCONOCE")
			$("#appMaterno_di_sp_inf_default").on 'click', ->
				$("#appMaterno_di_sp_inf").val("SE DESCONOCE")
			$("#edad_di_sp_inf_default").on 'click', ->
				$("#edad_di_sp_inf").val("SE DESCONOCE")
			$("#domicilio_di_sp_inf_default").on 'click', ->
				$("#domicilio_di_sp_inf").val("SE DESCONOCE")
			$("#nom_di_sp_inf_default").on 'click', ->
				$("#nom_di_sp_inf").val("SE DESCONOCE")
			$("#colonia_di_sp_inf_default").on 'click', ->
				$("#colonia_di_sp_inf").val("SE DESCONOCE")
			$("#ciudad_di_sp_inf_default").on 'click', ->
				$("#ciudad_di_sp_inf").val("SE DESCONOCE")
			$("#estado_di_sp_inf_default").on 'click', ->
				$("#estado_di_sp_inf").val("SE DESCONOCE")
			$("#no_licencia_di_sp_inf_default").on 'click', ->
				lic=$('#no_licencia_di_sp_inf').val() 
				if lic != ""
					that.cargarInfractor(lic)
		updateInfractor:()->
			this.renderInfractor()
			return
		cargarInfractor:(licencia)->
			$.ajax
				type:'GET'
				url:'/infraccion/getHistInfractor/' + licencia + '/'
				success:(data)->
					$('#nombre_di_sp_inf').val(data.infractor_nombre)
					$('#appPaterno_di_sp_inf').val(data.infractor_apepaterno)
					$('#appMaterno_di_sp_inf').val(data.infractor_apematerno)
					$('#sexo_di_sp_inf.input').val(data.infractor_sexo)
					$('#edad_di_sp_inf').val(data.infractor_edad)
					$('#domicilio_di_sp_inf').val(data.infractor_domicilio)
					$('#colonia_di_sp_inf').val(data.colonia)
					$('#ciudad_di_sp_inf').val(data.ciudad)
					$('#estado_di_sp_inf').val(data.estado)
			return
		disEstablecerSeDesconoceConductor:()->
			$('#nombre_di_sp_inf').val("")
			$('#appPaterno_di_sp_inf').val("")
			$('#appMaterno_di_sp_inf').val("")
			$('#sexo_di_sp_inf').val("")
			$('#edad_di_sp_inf').val("")
			$('#domicilio_di_sp_inf').val("")
			$('#nom_di_sp_inf').val("")
			$('#colonia_di_sp_in').val("")
			$('#ciudad_di_sp_inf').val("")
			$('#estado_di_sp_inf').val("")
			$('#no_licencia_di_sp_in').val("")

			$('#nombre_di_sp_inf').prop("disabled",false)
			$('#appPaterno_di_sp_inf').prop("disabled",false)
			$('#appMaterno_di_sp_inf').prop("disabled",false)
			$('#sexo_di_sp_inf').prop("disabled",false)
			$('#edad_di_sp_inf').prop("disabled",false)
			$('#domicilio_di_sp_inf').prop("disabled",false)
			$('#nom_di_sp_inf').prop("disabled",false)
			$('#colonia_di_sp_inf').prop("disabled",false)
			$('#ciudad_di_sp_inf').prop("disabled",false)
			$('#estado_di_sp_inf').prop("disabled",false)
			$('#no_licencia_di_sp_in').prop("disabled",false)
		establecerSeDesconoceConductor:()->
			$('#nombre_di_sp_inf').val("SE DESCONOCE")
			$('#appPaterno_di_sp_inf').val("SE DESCONOCE")
			$('#appMaterno_di_sp_inf').val("SE DESCONOCE")
			$('#sexo_di_sp_inf').val("SE DESCONOCE")
			$('#edad_di_sp_inf').val("SE DESCONOCE")
			$('#domicilio_di_sp_inf').val("SE DESCONOCE")
			$('#nom_di_sp_inf').val("SE DESCONOCE")
			$('#colonia_di_sp_inf').val("SE DESCONOCE")
			$('#ciudad_di_sp_inf').val("SE DESCONOCE")
			$('#estado_di_sp_inf').val("SE DESCONOCE")
			$('#no_licencia_di_sp_inf').val("SE DESCONOCE")

			$('#nombre_di_sp_inf').prop("disabled",true)
			$('#appPaterno_di_sp_inf').prop("disabled",true)
			$('#appMaterno_di_sp_inf').prop("disabled",true)
			$('#sexo_di_sp_inf').prop("disabled",true)
			$('#edad_di_sp_inf').prop("disabled",true)
			$('#domicilio_di_sp_inf').prop("disabled",true)
			$('#nom_di_sp_inf').prop("disabled",true)
			$('#colonia_di_sp_in').prop("disabled",true)
			$('#ciudad_di_sp_inf').prop("disabled",true)
			$('#estado_di_sp_inf').prop("disabled",true)
			$('#no_licencia_di_sp_in').prop("disabled",true)

		limpiarInfractor:()->
			$('#nombre_di_sp_inf').val('')
			$('#appPaterno_di_sp_inf').val('')
			$('#appMaterno_di_sp_inf').val('')
			$('#sexo_di_sp_inf.input').val('')
			$('#edad_di_sp_inf').val('')
			$('#domicilio_di_sp_inf').val('')
			$('#nom_di_sp_inf').val('')
			$('#colonia_di_sp_inf').val('')
			$('#ciudad_di_sp_inf').val('')
			$('#estado_di_sp_inf').val('')
			$('#no_licencia_di_sp_inf').val('')
		renderInfractor:()->
			infractor= window.infraccion.infractor
			$('#nombre_di_sp_inf').val(infractor.nombre)
			$('#appPaterno_di_sp_inf').val(infractor.appPat)
			$('#appMaterno_di_sp_inf').val(infractor.appMat)
			$('#sexo_di_sp_inf').val(infractor.sexo)
			$('#edad_di_sp_inf').val(infractor.edad)
			$('#domicilio_di_sp_inf').val(infractor.domicilio)
			$('#nom_di_sp_inf').val(infractor.numero)
			$('#colonia_di_sp_inf').val(infractor.colonia)
			$('#ciudad_di_sp_inf').val(infractor.ciudad)
			$('#estado_di_sp_inf').val(infractor.estado)
			$('#no_licencia_di_sp_inf').val(infractor.no_licencia)
			return
		llenarColonias:->
			if !window.colonias
							cargarColonias this.llenarColonias
						else
							nombres=[]
							for item in window.colonias
								 
								nombres.push item.nombre
							 
							$("#colonia_di_sp_inf").autocomplete
								source:nombres
						return
		llenarMunicipios:->
			if !window.municipios
							cargarMunicipios this.llenarMunicipios
						else
							nombres=[]
							for item in window.municipios
								 
								nombres.push item.municipio
							 
							$("#ciudad_di_sp_inf").autocomplete
								source:nombres
						return
		llenarEstados:->
			if !window.estados
							cargarEstados this.llenarEstados
						else
							nombres=[]
							for item in window.estados
								 
								nombres.push item.estado
							 
							$("#estado_di_sp_inf").autocomplete
								source:nombres
			return