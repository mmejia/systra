define [
		'infracciones/ManagerDatosLicenciaServParticularInf'
		'core/sandbox'
],(datos_licencia,sandbox)->
	modulo=
		padreId:"#managerRecojeDocumento_spa_inf"
		elementId:"#managerRecojeDocumento_spa_inf_view"
		element:null
		padre:null
		articulosSel:[]
		optionVehiculoId :'#optionVehiculo_spa_inf'
		optionTarjetaId:'#optionTarjeta_spa_inf'
		optionPlacaId:'#optionPlaca_spa_inf'
		optionLicenciaId:'#optionLicencia_spa_inf'
		optionCortesiaId:'#optionCortesia_spa_inf'
		optionPagoMovilId:'#optionPagoMovil_spa_inf'
		iniciar :->
			that=this
			this.padre= $(this.padreId)
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append(this.template)
			this.llenarPensiones()
			datos_licencia.iniciar()
			this.iniciarCalendario()
			$('input[name="recoje"]').on "click", (evento)->
				console.log evento
				if "" + this.value == "VEHICULO"
					that.showRecojeVehiculo()
					that.ocultarRecojeLicencia()
				else if this.value == "TARJETA DE CIRCULACION"
					that.ocultarRecojeVehiculo()
					that.ocultarRecojeLicencia()
				else if this.value == "PLACAS"
					that.ocultarRecojeVehiculo()
					that.ocultarRecojeLicencia()
				else if this.value == "LICENCIA"
					that.ocultarRecojeVehiculo()
					that.showRecojeLicencia()
				else if this.value == "CORTESIA"
					that.ocultarRecojeVehiculo()
					that.ocultarRecojeLicencia()
				else if this.value == "PAGO MOVIL"
					that.ocultarRecojeVehiculo()
					that.ocultarRecojeLicencia()

			this.sandbox.on 'update-recoje',this.updateSeRecoje
			this.sandbox.on 'limpiar-recoje',this.limpiarSeRecoje
			this.sandbox.on 'llenar-infraccion-recoje',this.llenarInfraccionRecoje
			return
		ocultarRecojeVehiculo:->
			el=$("#recoje_vehiculo_spa_inf")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		ocultarRecojeLicencia:->
			el=$("#cont-se-recoje-licencia")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		showRecojeVehiculo:->
			el=$("#recoje_vehiculo_spa_inf")
			console.log el
			cambios=
				width: "100%"
				height: "auto"
			el.css(cambios)
		showRecojeLicencia:->
			el=$("#cont-se-recoje-licencia")
			cambios=
				width: "100%"
				height: "auto"
			el.css(cambios)
		llenarInfraccionRecoje:->
			se_recoje= window.infraccion.se_recoje={}
			rd_vehiculo=document.getElementById("rd_vehiculo_spa_inf")
			rd_tarjeta=document.getElementById("rd_tarjeta_spa_inf")
			rd_placa=document.getElementById("rd_placa_spa_inf")
			rd_licencia=document.getElementById("rd_licencia_spa_inf")
			rd_cortesia=document.getElementById("rd_cortesia_spa_inf")
			rd_movil=document.getElementById("rd_pago_movil_spa_inf")
			if rd_vehiculo.checked
				se_recoje.tipo="VEHICULO"
				datos=se_recoje.datos={}
				datos.recoje_vehiculo_pension=$("#recoje_vehiculo_pension_spa_inf").val()
				datos.recoje_vehiculo_no_inventario=$('#recoje_vehiculo_no_inventario_spa_inf').val()
			else if rd_tarjeta.checked
				se_recoje.tipo="TARJETA DE CIRCULACION"
			else if rd_placa.checked
				se_recoje.tipo="PLACAS"
				 
				#$("#recoje_placa_spa_inf").show()
			else if rd_licencia.checked
				datos=se_recoje.datos={}
				se_recoje.tipo="LICENCIA"
				datos.recoje_licencia_estado=$('#estado_dl_sp_inf').val()
				datos.recoje_licencia_no_conducir=$('#no_licencia_dl_sp_inf').val()
				datos.recoje_licencia_fecha_vencimiento=$('#fecha_vencimiento_dl_sp_inf').val()
				datos.recoje_licencia_tipo=$('#tipo_licencia_dl_sp_inf').val()
				datos.recoje_licencia_licencia_restricciones=$('#restriciones_licencia_dl_sp_inf').val()
				#$("#recoje_licencia_spa_inf").show()
			else if rd_cortesia.checked
				se_recoje.tipo="CORTESIA"
			else if rd_movil.checked
				se_recoje.tipo="PAGO MOVIL"
		limpiarSeRecoje:()->
			that=this
			document.getElementById("rd_vehiculo_spa_inf").checked=false
			document.getElementById("rd_tarjeta_spa_inf").checked=false
			document.getElementById("rd_placa_spa_inf").checked=false
			document.getElementById("rd_licencia_spa_inf").checked=false
			document.getElementById("rd_cortesia_spa_inf").checked=false
			document.getElementById("rd_pago_movil_spa_inf").checked=false
			#$("#recoje_vehiculo_spa_inf").hide()
			#$("#recoje_tarjeta_spa_inf").hide()
			#$("#recoje_placa_spa_inf").hide()
			#$("#recoje_licencia_spa_inf").hide()
			$('#recoje_vehiculo_pension_spa_inf').val('')
			$("#recoje_vehiculo_no_inventario_spa_inf").val('')
			$("#recoje_tarjeta_tipo_spa_inf").val('')
			$("#recoje_tarjeta_placas_spa_inf").val('')	 
			$('#recoje_tarjeta_tipo_spa_inf').val('')
			$('#recoje_tarjeta_placas_spa_inf').val('')
			$('#recoje_placa_tipo_spa_inf').val('')
			$('#recoje_placa_placas_spa_inf').val('')
			$('#estado_dl_sp_inf').val('')
			$('#no_licencia_dl_sp').val('')
			$('#fecha_vencimiento_dl_sp_inf').val('')
			$('#tipo_licencia_dl_sp_inf').val('')
			$('#restriciones_licencia_dl_sp_inf').val('')
			return
		updateSeRecoje:()->
			this.renderSeRecoje()
		renderSeRecoje:->
			that=this
			se_recoje= window.infraccion.se_recoje
			#that.ocultarRecojeVehiculo()
			#that.ocultarRecojeLicencia()
			switch se_recoje.tipo
				when "VEHICULO"
					$('#recoje_vehiculo_pension_spa_inf').val(se_recoje.datos.recoje_vehiculo_pension)
					$("#recoje_vehiculo_no_inventario_spa_inf").val(se_recoje.datos.recoje_vehiculo_no_inventario)
					that.showRecojeVehiculo()
					that.ocultarRecojeLicencia()
					document.getElementById("rd_vehiculo_spa_inf").checked=true	 
				when "TARJETA DE CIRCULACION"
					document.getElementById("rd_tarjeta_spa_inf").checked=true
				when "PLACAS"
					document.getElementById("rd_placa_spa_inf").checked=true
				when "LICENCIA"
					$('#estado_dl_sp_inf').val(se_recoje.datos.recoje_licencia_estado)
					$('#no_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_no_conducir)
					$('#fecha_vencimiento_dl_sp_inf').val(se_recoje.datos.recoje_licencia_fecha_vencimiento)
					$('#tipo_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_tipo)
					$('#restriciones_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_restricciones)
					that.ocultarRecojeVehiculo()
					that.showRecojeLicencia()
					document.getElementById("rd_licencia_spa_inf").checked=true
				when "CORTESIA"
					document.getElementById("rd_cortesia_spa_inf").checked=true
				when "PAGO MOVIL"
					document.getElementById("rd_pago_movil_spa_inf").checked=true
			return
		iniciarCalendario:->
			$('#fecha-venc-inf').datetimepicker
				pickTime: false
				language: 'es'
		llenarPensiones:->
			if !window.pensiones
				cargarPensiones this.llenarPensiones
			else
				sel=$("#recoje_vehiculo_pension_spa_inf").html("")
				opciones='<option  value="NO">**SELECCIONAR**</option>'
				for pension in window.pensiones
					 
					opciones+= '<option value="' + pension.nombre_pension + '">' + pension.nombre_pension + '</option>';
				sel.append(opciones)
			return