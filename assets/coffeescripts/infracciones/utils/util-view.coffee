viewOnlyObservaciones=->
	if window.view_infraccion
		observaciones= window.view_infraccion.observaciones
		$('#view_observaciones_inf').html(observaciones)
window.viewOnlyCertificadoMedico=->
	if window.view_infraccion
		certificado= window.view_infraccion.certificado
		$('#view_certificado_medico_cm_sp_inf').val(certificado.certificado_numero)
		if certificado.ebriedad_incompleta == 'si'
			$('#view_ebriedad_incompleta_cm_spa_inf').click()
		if certificado.ebriedad_completa == 'si'
			$('#view_ebriedad_completa_cm_spa_inf').click()
		if certificado.influjo_droga == "si"
			$('#view_bajo_influjo_drogas_cm_spa_inf').click()
		if certificado.aliento_alcoholico == "si"
			$('#view_aliento_alcoholico_cm_spa_inf').click()
		if certificado.normal =='si'
			$('#view_estado_normal_cm_spa_inf').click()
		return

window.onlyViewRecoje=()->
	ocultarRecojeVehiculo=->
		el=$("#view_recoje_vehiculo_spa_inf")
		cambios=
			height: "0px"
			width: "0px"
		el.css(cambios)
	ocultarRecojeLicencia=->
		el=$("#view_cont-se-recoje-licencia")
		cambios=
			height: "0px"
			width: "0px"
		el.css(cambios)
	showRecojeVehiculo=->
		el=$("#view_recoje_vehiculo_spa_inf")
		cambios=
			width: "100%"
			height: "auto"
		el.css(cambios)
	showRecojeLicencia=->
		el=$("#view_cont-se-recoje-licencia")
		cambios=
			width: "100%"
			height: "auto"
		el.css(cambios)
	if window.view_infraccion
		se_recoje= window.view_infraccion.se_recoje
		ocultarRecojeVehiculo()
		ocultarRecojeLicencia()
		switch se_recoje.tipo
			when "VEHICULO"
				$('#view_recoje_vehiculo_pension_spa_inf').val(se_recoje.datos.recoje_vehiculo_pension)
				$("#view_recoje_vehiculo_no_inventario_spa_inf").val(se_recoje.datos.recoje_vehiculo_no_inventario)
				document.getElementById("view_rd_vehiculo_spa_inf").checked=true	
				showRecojeVehiculo()
			when "TARJETA DE CIRCULACION"
				document.getElementById("view_rd_tarjeta_spa_inf").checked=true
			when "PLACAS"
				document.getElementById("view_rd_placa_spa_inf").checked=true
			when "LICENCIA"
				$('#view_estado_dl_sp_inf').val(se_recoje.datos.recoje_licencia_estado)
				$('#view_no_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_no_conducir)
				$('#view_fecha_vencimiento_dl_sp_inf').val(se_recoje.datos.recoje_licencia_fecha_vencimiento)
				$('#view_tipo_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_tipo)
				$('#view_restriciones_licencia_dl_sp_inf').val(se_recoje.datos.recoje_licencia_restricciones)
				document.getElementById("view_rd_licencia_spa_inf").checked=true
				showRecojeLicencia()
			when "CORTESIA"
				document.getElementById("view_rd_cortesia_spa_inf").checked=true
			when "PAGO MOVIL"
				document.getElementById("view_rd_pago_movil_spa_inf").checked=true
	return

window.onlyViewArticulos=()->
	if window.view_infraccion
		tabla= $("#view_tab_articulos_spa_inf")
		$("#view_tab_articulos_spa_inf>tbody").empty()
		articulos= window.view_infraccion.articulos
		for articulo in articulos
			if articulo or articulo != undefined
				row="<tr>
					<td><a href=\"#\" id=\"infr_#{articulo.id}\" class=\"tablaBorrarArticulo\"><i class=\"icosystra-remove\"></i></a></td>
					<td>#{articulo.art}</td>
					<td>#{articulo.fracc}</td>
					<td>#{articulo.descc}</td>
					</tr>"
				tabla.append(row);
window.onlyViewCaracteristicasVehiculo=()->
	if window.view_infraccion
		vehiculo= window.view_infraccion.vehiculo
		$('#view_marca_cv_spa_inf').html(vehiculo.marca)
		$('#view_submarca_cv_spa_inf').html(vehiculo.submarca)
		$('#view_modelo_cv_spa_inf').html(vehiculo.modelo)
		$('#view_color_cv_spa_inf').html(vehiculo.color)
		$('#view_detalle_color_cv_spa_inf').html(vehiculo.detalle_color)
		$('#view_tipo_cv_spa_inf').html(vehiculo.tipo_placa)
		$('#view_placas_cv_spa_inf').html(vehiculo.placas)
		$('#view_estado_cv_spa_inf').html(vehiculo.estado_placa)
		$('#view_serie_cv_spa_inf').html(vehiculo.serie)
		$('#view_tipo_vehiculo_cv_spa_inf').html(vehiculo.tipo)
		$('#view_empresa_cv_spa_inf').html(vehiculo.empresa)
		$('#view_ruta_cv_spa_inf').html(vehiculo.ruta)
		$('#view_no_economico_cv_spa_inf').html(vehiculo.no_economico)
		$('#view_no_tarjeton_cv_spa_inf').html(vehiculo.no_tarjeton)

window.onlyViewInfractor=()->
	if window.view_infraccion
		infractor =window.view_infraccion.infractor
		if infractor.nombre=="None"
			$('#view_nombre_di_sp_inf').html("")
		else
			$('#view_nombre_di_sp_inf').html(infractor.nombre)
		$('#view_appPaterno_di_sp_inf').html(infractor.appPat)
		$('#view_appMaterno_di_sp_inf').html(infractor.appMat)
		$('#view_sexo_di_sp_inf').html(infractor.sexo)
		$('#view_edad_di_sp_inf').html(infractor.edad)
		$('#view_domicilio_di_sp_inf').html(infractor.domicilio)
		$('#view_nom_di_sp_inf').html(infractor.numero)
		$('#view_colonia_di_sp_inf').html(infractor.colonia)
		$('#view_ciudad_di_sp_inf').html(infractor.ciudad)
		$('#view_estado_di_sp_inf').html(infractor.estado)
		$('#view_no_licencia_di_sp_inf').html(infractor.no_licencia)
llenarViewInfraccion=()->
	if window.view_infraccion
		inf= window.view_infraccion
		$('#view_folio_infraccion').html(inf.folio_infraccion)
		$('#view_nombre-agente-inf').html(inf.nombreAgente)
		$('#view_nom-cobro-agente-inf').html(inf.noCobro)
		rd_taxi=document.getElementById("view_rd_taxi_spa_inf")
		rd_urbano=document.getElementById("view_rd_urbano_spa_inf")
		rd_foraneo=document.getElementById("view_rd_foraneo_spa_inf")
		rd_policia=document.getElementById("view_rd_policia_spa_inf")
		rd_transito=document.getElementById("view_rd_transito_spa_inf")
		###if inf.tipo_servicio == "Servicio Publico"
			this.sandbox.emit 'view_show-servicio-publico', true
			optServicioPublico.checked=true
			if inf.tipo_publico == "Taxi"
				rd_taxi.checked=true
			else if inf.tipo_publico == "Urbano"
				rd_urbano.checked=true
			else if inf.tipo_publico == "Foráneo"
				rd_foraneo.checked=true
			else if inf.tipo_publico == "Policía"
				rd_policia.checked=true
			else if inf.tipo_publico == "Tránsito"
				rd_transito.checked=true
		else
			this.sandbox.emit 'show-servicio-publico', false
			optServicioPublico.checked=false
			optServicioParticular.checked=true
			rd_taxi.checked=false
			rd_urbano.checked=false
			rd_foraneo.checked=false
			rd_policia.checked=false
			rd_transito.checked=false
		###
		$('#view_fecha_inf').html(inf.fecha)
		$('#view_hora_inf').html(inf.hora)
		$('#view_delegacion_spa_inf').html(inf.delegacion)
		$('#view_comandancia_spa_inf').html(inf.comandancia)
		$('#view_turno_spa_inf').html(inf.turno)
		$('#view_colonia_spa_inf').html(inf.colonia)
		$('#view_calle1_spa_inf').html(inf.calle1)
		$('#view_calle2_spa_inf').html(inf.calle2)
		$('#view_referencia_spa_inf').html(inf.referencia)
		$('#view_lat_inf').html(inf.latitud)
		$('#view_lng_inf').html(inf.longitud)
		$('#view_tipo_operativo_spa_inf').html(inf.tipo_operativo)
		$('#view_circulacion_spa_inf').html(inf.circulacion)
		
		#this.sandbox.emit 'view_update-articulos',
		#	contenido:inf.articulos
		#this.sandbox.emit 'view_update-recoje'
		#this.sandbox.emit 'view_update-infractor'
		#this.sandbox.emit 'view_update-caracteristicas-vehiculo'
		#this.sandbox.emit 'view_update-certificado-medico'
		###
		if inf.firmo== 'si'
			$('#si_firmo_inf').click()
		else 
			$('#no_firmo_inf').click()
		##this.sandbox.emit 'view_llenar-observaciones'
		###