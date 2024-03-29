define [ 
  'core/sandbox'
  'infracciones/ManagerArticulosServParticularInf'
  'infracciones/ManagerRecojeDocumentoInf'
  'infracciones/ManagerDatosInfractorServParticularInf'
  'infracciones/ManagerCaracteristicasVehiculoServParticularInf'
  'infracciones/ManagerDatosLicenciaServParticularInf'
  'infracciones/ManagerCertificadoMedicoServParticularInf'
  'infracciones/ManagerTipoServicioPublicoInf'
  'infracciones/ManagerSelPuntoGoogleViewInf'
], (sandbox,articulos,documentos,datosInfractor,caracteristicasVehiculos,datosLicencia,certificadoMedico,tipoServicioPublico,mapa)->
	app=
		rad_servicio_particular:null
		rad_servicio_publico:null
		rad_taxi:null
		rad_urbano:null
		rad_foraneo:null
		rad_policia:null
		rad_transito:null
		rr:null
		iniciarVentanaReportePdf:->
			that=this
			$("#generar_reporte_inf").on "click",(event)->
				that.refrescarWindowInfraccion()
				that.showSelReporte()
			return
		iniciar:->
			articulos.iniciar()
			documentos.iniciar()
			datosInfractor.iniciar()
			caracteristicasVehiculos.iniciar()
			datosLicencia.iniciar()
			certificadoMedico.iniciar()
			tipoServicioPublico.iniciar()
			mapa.iniciar()
			this.iniciarVentanaReportePdf()
			this.sandbox= new sandbox(this)
			return
		reiniciarInfraccion:->
			window.infraccion={}
			window.infraccion.articulos=[]
			window.infraccion.infractor={}
			window.infraccion.vehiculo={}
			return
		llenarInfraccion:->
			this.iniciarOnLoad()
			 
			inf=window.infraccion
			$('#folio_infraccion').val(inf.folio_infraccion)
			$('#nombre-agente-inf').val(inf.nombreAgente)
			$('#nom-cobro-agente-inf').val(inf.noCobro)
			if inf.servicio == "Servicio Publico"
				tipoServicioPublico.mostrar(true)
				this.rad_servicio_publico.checked=true
				if inf.tipo_servicio == "Taxi"
					this.rad_taxi.checked=true
				else if inf.tipo_servicio == "Urbano"
					this.rad_urbano.checked=true
				else if inf.tipo_servicio == "Foraneo"
					this.rad_foraneo.checked=true
				else if inf.tipo_servicio == "Policia"
					this.rad_policia.checked=true
				else if inf.tipo_servicio == "Transito"
					this.rad_transito.checked=true
					 
			else
				this.rad_servicio_particular.checked=true
			$('#fecha_inf').val(inf.fecha)
			$('#hora_inf').val(inf.hora)

			$('#delegacion_spa_inf').val(inf.delegacion)
			actualizarComandanciaValor(inf.delegacion)
			$('#comandancia_spa_inf').val(inf.comandancia)
			$('#turno_spa_inf').val(inf.turno)
			$('#colonia_spa_inf').val(inf.colonia)
			$('#calle1_spa_inf').val(inf.calle1)
			$('#calle2_spa_inf').val(inf.calle2)
			$('#referencia_spa_inf').val(inf.referencia)
			$('#lat_inf').val(inf.latitud)
			$('#lng_inf').val(inf.longitud)
			$('#tipo_operativo_spa_inf').val(inf.tipo_operativo)
			$('#circulacion_spa_inf').val(inf.circulacion)
			this.sandbox.emit 'update-articulos',
				contenido:infraccion.articulos
			this.sandbox.emit 'update-recoje'
			this.sandbox.emit 'update-infractor'
			this.sandbox.emit 'update-caracteristicas-vehiculo'
			this.sandbox.emit 'update-certificado-medico'
			if inf.firmo== 'si'
				$('#si_firmo_inf').attr("checked",true)
			else 
				$('#no_firmo_inf').attr("checked",true)
			this.llenarObservaciones()
			return
		iniciarOnLoad:->
			this.rad_servicio_particular= document.getElementById("radioServicioParticular")
			this.rad_servicio_publico= document.getElementById("radioServicioPublico")
			this.rad_taxi=document.getElementById("rd_taxi_spa_inf")
			this.rad_urbano=document.getElementById("rd_urbano_spa_inf")
			this.rad_foraneo=document.getElementById("rd_foraneo_spa_inf")
			this.rad_policia=document.getElementById("rd_policia_spa_inf(")
			this.rad_transito=document.getElementById("rd_transito_spa_inf")
		showMensaje:(titulo,msg)->
			$div=$('#myModal .modal-body').html(msg)
			$("#myModal").modal('show')
			$('#myModalLabel').html(titulo)
		llenarObservaciones:->
			infraccion=window.infraccion

			w5ref= $("observaciones_inf").data('wysihtml5')
			if w5ref
				w5ref.editor.setValue(infraccion.observaciones)
			else
				$("observaciones_inf").html(infraccion.observaciones)
			return 
		refrescarWindowInfraccion:->
			this.reiniciarInfraccion()
			inf= window.infraccion
			inf.folio_infraccion= $('#folio_infraccion').val()
			inf.nombreAgente=$('#nombre-agente-inf').val()
			inf.noCobro=$('#nom-cobro-agente-inf').val()
			if this.rad_servicio_particular.checked
				inf.tipo_servicio= "Servicio Particular"
			else if this.rad_servicio_publico.checked
				inf.tipo_servicio= "Servicio Publico"
				rd_taxi=document.getElementById("rd_taxi_spa_inf")
				rd_urbano=document.getElementById("rd_urbano_spa_inf")
				rd_foraneo=document.getElementById("rd_foraneo_spa_inf")
				rd_policia=document.getElementById("rd_policia_spa_inf")
				rd_transito=document.getElementById("rd_transito_spa_inf")
				if rd_taxi.checked 
					inf.tipo_publico= "Taxi"
				if rd_urbano.checked 
					inf.tipo_publico= "Urbano"
				if rd_foraneo.checked 
					inf.tipo_publico= "Foráneo"
				if rd_policia.checked 
					inf.tipo_publico= "Policía"
				if rd_transito.checked 
					inf.tipo_publico= "Tránsito"
			else
				inf.tipo_servicio= "Servicio Particular"
			
			inf.hora=$('#hora_inf').val()
			inf.fecha=$('#fecha_inf').val()
			inf.delegacion=$('#delegacion_spa_inf').val()
			inf.comandancia=$('#comandancia_spa_inf').val()
			inf.turno=$('#turno_spa_inf').val()
			inf.colonia=$('#colonia_spa_inf').val()
			inf.calle1=$('#calle1_spa_inf').val()
			inf.calle2=$('#calle2_spa_inf').val()
			inf.referencia=$('#referencia_spa_inf').val()
			inf.latitud=$('#lat_inf').val()
			inf.longitud=$('#lng_inf').val()
			inf.tipo_operativo=$('#tipo_operativo_spa_inf').val()
			inf.circulacion=$('#circulacion_spa_inf').val()
			this.sandbox.emit 'llenar-infraccion-articulos'
			this.sandbox.emit 'llenar-infraccion-recoje'
			this.sandbox.emit 'llenar-infraccion-infractor'
			this.sandbox.emit 'llenar-infraccion-caracteristicas-vehiculo'
			this.sandbox.emit 'llenar-infraccion-certificado-medico'
			if $('#si_firmo_inf').is(':checked')
				inf.firmo="si"
			else
				inf.firmo="no"
			return
		showSelReporte:(comp)->
			that=this
			this.refrescarWindowInfraccion()
			datos=
				data: JSON.stringify(window.infraccion)
			console.log JSON.stringify(window.infraccion)
			$.ajax
				type:"POST"
				url:'/infraccion/ventana_reporte_infraccion/'
				dataType:'html'
				data:datos
				success: (res)->
					that.showMensaje("Reporte para imprimir",res)
			return
		