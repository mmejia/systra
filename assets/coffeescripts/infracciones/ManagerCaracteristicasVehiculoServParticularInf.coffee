define [
		'core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#managerCaracteristicasVehiculo_spa_inf"
		elementId:"#CaracteristicasVehiculoServParticularInf-View"
		element:null
		template:null
		padre:null
		articulosSel:[]
		auto:null
		camioneta:null
		camion:null
		bicicleta:null
		otros:null
		servicio_publico:null
		radServicioPublico:null
		radServicioParticular:null
		iniciar:->
			that=this
			this.padre= $ this.padreId
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append this.template
			this.llenarMarcas()
			#this.llenarSubMarcas()
			this.llenarModelos()
			this.llenarColores()
			this.llenarEstados()
			this.llenarTipoVehiculos()
			this.establecerDefault()
			this.radServicioPublico=document.getElementById("radioServicioPublico")
			this.radServicioParticular=document.getElementById("radioServicioParticular")
			$("#radioServicioParticular").on 'click', (evento)->
				obj= evento.currentTarget
				if obj.checked ==true
					that.ocultarServicioParticular()
			$("#radioServicioPublico").on 'click', (evento)->
				obj= evento.currentTarget
				if obj.checked ==true
					that.showServicioParticular()
			this.sandbox.on 'update-caracteristicas-vehiculo', this.updateCaracteristicasVehiculos
			this.sandbox.on 'limpiar-caracteristicas-vehiculo', this.limpiarCaracteristicasVehiculos
			this.sandbox.on 'llenar-infraccion-caracteristicas-vehiculo', this.llenarInfraccionCaracteristicasVehiculo
			this.tipo_servicio=document.getElementById("#tipo_cv_spa_inf")
			this.marca_vehiculo=$("#marca_cv_spa_inf")
			this.marca_vehiculo.on 'change',(evento)->
					valor= $('#' + evento.currentTarget.id).val()
					window.actualizarSubMarcaValor(valor)
					return
			return
		updateCaracteristicasVehiculos:()->
			this.renderCaracteristicasVehiculos()
		establecerDefault:->
			that=this
			$("#detalle_color_cv_spa_inf_default").on 'click', ->
				$("#detalle_color_cv_spa_inf").val("SE DESCONOCE")
			$("#placas_cv_spa_inf_default").on 'click', ->
				placa=$('#placas_cv_spa_inf').val() 
				if placa != ""
					that.cargarVehiculo(placa)
			$("#estado_cv_spa_inf_default").on 'click', ->
				$("#estado_cv_spa_inf").val("SE DESCONOCE")
			$("#serie_cv_spa_inf_default").on 'click', ->
				$("#serie_cv_spa_inf").val("NO VISIBLE")
		cargarVehiculo:(placa)->
			$.ajax
				type:'GET'
				url:'/infraccion/getHistVehiculo/' + placa + '/'
				success:(data)->
					console.log  data
					$('#marca_cv_spa_inf').val(data.veh_marca)
					$('#submarca_cv_spa_inf').val(data.submarca)
					$('#modelo_cv_spa_inf').val(data.veh_modelo)
					$('#color_cv_spa_inf').val(data.veh_color)
					$('#detalle_color_cv_spa_inf').val(data.veh_color_detalle)
					$('#tipo_cv_spa_inf').val(data.sp_tipo)
					#$('#placas_cv_spa_inf').val(data.)
					#$('#estado_cv_spa_inf').val(data.estado_placa)
					$('#serie_cv_spa_inf').val(data.veh_serie)
					$('#tipo_vehiculo_cv_spa_inf').val(data.sp_tipo)
					$('#empresa_cv_spa_inf').val(data.veh_empresa)
					#$('#ruta_cv_spa_inf').val(data.ruta)
					$('#no_economico_cv_spa_inf').val(data.sp_no_economico)
					$('#no_tarjeton_cv_spa_inf').val(data.sp_no_tarjeton)
			return
		showServicioParticular:->
			el=$("#cont-servicio-publico")
			cambios=
				width: "100%"
				height: "auto"
			el.css(cambios)
		ocultarServicioParticular:->
			el=$("#cont-servicio-publico")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		limpiarCaracteristicasVehiculos:()->
			$('#marca_cv_spa_inf').val('')
			$('#submarca_cv_spa_inf').val('')
			$('#modelo_cv_spa_inf').val('')
			$('#color_cv_spa_inf').val('')
			$('#detalle_color_cv_spa_inf').val('')
			$('#tipo_cv_spa_inf').val('')
			$('#placas_cv_spa_inf').val('')
			$('#estado_cv_spa_inf').val('')
			$('#serie_cv_spa_inf').val('')
			$('#tipo_vehiculo_cv_spa_inf').val('')
			$('#empresa_cv_spa_inf').val('')
			$('#ruta_cv_spa_inf').val('')
			$('#no_economico_cv_spa_inf').val('')
			$('#no_tarjeton_cv_spa_inf').val('')

		llenarInfraccionCaracteristicasVehiculo:->
			vehiculo= window.infraccion.vehiculo
			vehiculo.marca=$('#marca_cv_spa_inf').val()
			vehiculo.submarca=$('#submarca_cv_spa_inf').val()
			vehiculo.modelo=$('#modelo_cv_spa_inf').val()
			vehiculo.color=$('#color_cv_spa_inf').val()
			vehiculo.detalle_color=$('#detalle_color_cv_spa_inf').val()
			vehiculo.tipo_placa=$('#tipo_cv_spa_inf').val()
			vehiculo.placas=$('#placas_cv_spa_inf').val()
			vehiculo.estado_placa=$('#estado_cv_spa_inf').val()
			vehiculo.serie=$('#serie_cv_spa_inf').val()
			vehiculo.tipo=$('#tipo_vehiculo_cv_spa_inf').val()
			vehiculo.empresa=$('#empresa_cv_spa_inf').val()
			vehiculo.ruta=$('#ruta_cv_spa_inf').val()
			vehiculo.no_economico=$('#no_economico_cv_spa_inf').val()
			vehiculo.no_tarjeton=$('#no_tarjeton_cv_spa_inf').val()
			return

		renderCaracteristicasVehiculos:()->
			vehiculo= window.infraccion.vehiculo
			$('#marca_cv_spa_inf').val(vehiculo.marca)
			window.actualizarSubMarcaValor(vehiculo.marca)
			$('#submarca_cv_spa_inf').val(vehiculo.submarca)
			$('#modelo_cv_spa_inf').val(vehiculo.modelo)
			$('#color_cv_spa_inf').val(vehiculo.color)
			$('#detalle_color_cv_spa_inf').val(vehiculo.detalle_color)
			$('#tipo_cv_spa_inf').val(vehiculo.tipo_placa)
			$('#placas_cv_spa_inf').val(vehiculo.placas)
			$('#estado_cv_spa_inf').val(vehiculo.estado_placa)
			$('#serie_cv_spa_inf').val(vehiculo.serie)
			$('#tipo_vehiculo_cv_spa_inf').val(vehiculo.tipo)
			$('#empresa_cv_spa_inf').val(vehiculo.empresa)
			$('#ruta_cv_spa_inf').val(vehiculo.ruta)
			$('#no_economico_cv_spa_inf').val(vehiculo.no_economico)
			$('#no_tarjeton_cv_spa_inf').val(vehiculo.no_tarjeton)
			return
		llenarMarcas:->
			if !window.marcas
				cargarMarcas this.llenarMarcas
			else
				sel=$("#marca_cv_spa_inf").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				a_marcas=[]
				for marca in window.marcas
					 a_marcas[marca.marca]=1
				temp =_.keys(a_marcas)
				temp.sort()
				for nombre in temp
						opciones+='<option value="' + nombre + '">' + nombre + '</option>';
					sel.append opciones
			return
		llenarSubMarcas:->
			if !window.marcas
				cargarMarcas this.llenarSubMarcas
			else
				sel=$("#submarca_cv_spa_inf").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for marca in window.marcas
					 
					opciones += '<option value="'+marca.submarca+'">'+marca.submarca+'</option>'
				sel.append(opciones)
			return
		llenarModelos:->
			sel=$("#modelo_cv_spa_inf").html("")
			opciones='<option  value="NO">**SELECCIONAR**</option>'
			for x in [2018..1910]
				opciones += '<option value="'+x+'">'+x+'</option>'
			opciones += '<option value="SE DESCONOCE">SE DESCONOCE</option>'
			sel.append(opciones)
			return
		llenarColores:->
			if !window.colores
							cargarColores this.llenarColores
			else
				sel=$("#color_cv_spa_inf").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for color in window.colores
					 
					opciones += '<option value="'+color.color+'">'+color.color+'</option>'
				sel.append(opciones)
			return
		llenarEstados:->
			if !window.estados
							cargarEstados this.llenarEstados
						else
							nombres=[]
							for item in window.estados
								 
								nombres.push item.estado
							 
							$("#estado_cv_spa_inf").autocomplete
								source:nombres
			return
		llenarTipoVehiculos:->
			if !window.tipoVehiculos
				cargarTipoVehiculos this.llenarTipoVehiculos
			else
				sel=$("#tipo_vehiculo_cv_spa_inf").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for tipo in window.tipoVehiculos
					 
					opciones += '<option value="'+tipo.tipo+'">'+tipo.tipo+'</option>'
				sel.append(opciones)
			return

