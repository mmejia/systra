define [
  'core/sandbox'
  'inventario/ManagerMenuMain'
  'vendor/bootstrap-select'
],(sandbox,mod_menu,select)->
	IniciarInventnario=
		servicio_publico:null
		servicio_particular:null
		infraccion:null
		accidente:null
		accidenteInfraccion:null
		resguardo:null
		propiosMedios:null
		grua:null
		transito:null
		rad_taxi:null
		rad_urbano:null
		rad_foraneo:null
		rad_policia:null
		rad_transito:null
		rad_infraccion:null
		rad_optInfraccion:null
		rad_Accidente_infraccion:null
		rad_resguardos:null
		rad_ServicioPublico:null
		rad_ServicioParticular:null
		rad_propiosMedios:null
		rad_grua:null
		rad_Transiton:null		
		rad_accidente:null
		rad_AccidenteInfraccion:null
		rad_resguardo:null
		formSubirFoto:null
		formSubirInventarioFrente:null
		formSubirInventarioPosterior:null
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			that.iniciarDate()
			#setModulo('liberacion')
			this.sandbox.on 'cargar-inventario-en-view',this.cargarInventarioEnView
			this.sandbox.on 'limpiar-view-inventario', this.cancelar
			this.sandbox.on 'guardar-inventario-server', this.guardarInventarioServer
			this.sandbox.on 'cargar-inventario-en-view-server',this.cargarInventarioServer
			mod_menu.iniciar()
			this.establecerDefault()
			$('.selectpicker').selectpicker();
			this.servicio_particular= document.getElementById("radServicioParticular_inv")
			this.servicio_publico= document.getElementById("radServicioPublico_inv")
			this.infraccion= document.getElementById("optInfraccion_inv")
			this.accidenteInfraccion= document.getElementById("optAccidenteInfraccion_inv")
			this.resguardo= document.getElementById("resguardo_inv")
			this.propiosMedios= document.getElementById("propiosMedios_inv")
			this.grua= document.getElementById("grua_inv")
			this.transito= document.getElementById("deTransito")
			this.rad_infraccion= document.getElementById("optInfraccion_inv")


			this.rad_accidente= document.getElementById("optAccidente_inv")
			this.rad_AccidenteInfraccion= document.getElementById("optAccidenteInfraccion_inv")
			this.rad_resguardo= document.getElementById("resguardo_inv")


			this.rad_ServicioParticular= document.getElementById("radServicioParticular_inv")
			this.rad_ServicioPublico= document.getElementById("radServicioPublico_inv")

			this.rad_propiosMedios= document.getElementById("propiosMedios_inv")
			this.rad_grua= document.getElementById("grua_inv")
			this.rad_Transiton= document.getElementById("deTransito")


			this.rad_optInfraccion= document.getElementById("optInfraccion_inv")
			this.rad_AccidenteInfraccion= document.getElementById("optAccidenteInfraccion_inv")
			this.rad_resguardos= document.getElementById("resguardo_inv")

			$('#myTab a').click (e)->
				e.preventDefault()
				$(this).tab 'show'
				return
			  
			this.iniciarCalendario()
			this.marca_vehiculo=$("#marca_inv")
			this.marca_vehiculo.on 'change',(evento)->
				valor= $('#' + evento.currentTarget.id).val()
				window.actualizarSubMarcaValor(valor)
				return
			if !window.inventario
				this.llenarDelegaciones()
				this.llenarComandancias()
				this.llenarTurnos()
				this.llenarCorporaciones()
				this.llenarCalles()
				this.llenarColonias()
				this.llenarPensiones()
				this.llenarCompetentes()
				this.llenarMps()
				this.llenarDescVehiculos()
				this.llenarMarcas()
				this.llenarModelos()
				this.llenarColores()
				this.llenarTipo()
				this.llenarLugares()
				this.llenarHoras()
				this.llenarMinutos()
				this.llenarPensionesPar()
				this.llenarProfiles()
				this.reiniciarInventario()
			else
				$.when(
					$.ajax("/catalogos/delegaciones.json"),
					$.ajax("/catalogos/comandancias.json"),
					$.ajax("/catalogos/turnos.json"),
					$.ajax("/catalogos/corporaciones.json"),
					$.ajax("/catalogos/calles.json"),
					$.ajax("/catalogos/colonias.json"),
					$.ajax("/catalogos/pensiones.json"),
					$.ajax("/catalogos/aut_comp_inv.json"),
					$.ajax("/catalogos/mps.json"),
					$.ajax("/catalogos/descVehiculos.json"),
					$.ajax("/catalogos/marcas.json"),
					$.ajax("/catalogos/colores.json"),
					$.ajax("/catalogos/tipoVehiculo.json"),
					$.ajax("/catalogos/lugares.json"),
					$.ajax("/catalogos/listProfile.json"),
				).done (delegaciones,comandancias,turnos,corporaciones,calles,colonias,pensiones,competentes,mps,descVehiculos,marcas,colores,tipos,lugares,profiles)->
					window.delegaciones= delegaciones[0]
					window.comandancias= comandancias[0]
					window.turnos= turnos[0]
					window.corporaciones= corporaciones[0]
					window.calles= calles[0]
					window.colonias= colonias[0]
					window.colores= colores[0]
					window.pensiones= pensiones[0]
					window.autCompInvs= competentes[0]
					window.mps= mps[0]
					window.descVehiculos= descVehiculos[0]
					window.marcas= marcas[0]
					window.tipos= tipos[0]
					window.lugares= lugares[0]
					window.profiles= profiles[0]
					that.llenarDelegaciones()
					that.llenarComandancias()
					that.llenarTurnos()
					that.llenarCorporaciones()
					that.llenarCalles()
					that.llenarColonias()
					that.llenarPensiones()
					that.llenarCompetentes()
					that.llenarMps()
					that.llenarDescVehiculos()
					that.llenarMarcas()
					that.llenarModelos()
					that.llenarColores()
					that.llenarTipo()
					that.llenarLugares()
					that.llenarHoras()
					that.llenarMinutos()
					that.llenarPensionesPar()
					that.cargarInventarioEnView()
					that.llenarProfiles()
			$("#managerTipoServicioPublico_spa_inv_view").hide()
			$('#optInfraccion_inv').on  'click',(evento)->
				$("#folioInfraccion_inv").prop("disabled",false)
				$("#folioAccidente_inv").prop("disabled",false)
				obj= evento.currentTarget
				if obj.checked==true
					$("#folioAccidente_inv").prop("disabled",true)
					that.cargarFoliosInfraccionCapturados()
				else
					$("#folioAccidente_inv").prop("disabled",false)
			$('#optAccidenteInfraccion_inv').on  'click',(evento)->
				obj= evento.currentTarget
				if obj.checked==true
					that.cargarFoliosInfraccionCapturados()
					that.cargarFoliosAccidentesCapturados()
					$("#folioInfraccion_inv").prop("disabled",false)
					$("#folioAccidente_inv").prop("disabled",false)
			$('#resguardo_inv').on  'click',(evento)->
				obj= evento.currentTarget
				if obj.checked==true
					$("#folioInfraccion_inv").prop("disabled",true)
					$("#folioAccidente_inv").prop("disabled",true)
				else
					$("#folioInfraccion_inv").prop("disabled",false)
					$("#folioAccidente_inv").prop("disabled",false)
			#this.cargarInventarioEnView()
			$('#cargar1').on "click",()->
					that.cargarInventarioEnView()
			$('#cancelar').on 'click', ()->
				that.cancelar()
			$('#guardarLocal').on  'click',->
				that.guardarInventarioLocal()
			$('#guardar').on  'click',->
				that.sandbox.emit 'guardar-inventario-server'
			$(".trigger").click ()->
				$(".panel").toggle("fast")
				$(this).toggleClass("active")
				return false
			this.formSubirFoto=$('#formSubirFotografia').ajaxForm
				mod:that
				beforeSubmit: ->
					$('#resultado_foto').html('Subiendo la foto')
				success:(data) ->
					id= data.id
					nombre= data.nombre
					window.inventario.fotos.push(data)
					this.mod.refrescarFotos()
					sal= $('#resultado_foto')
					sal.html('Se subio correctamente el archivo')
			this.formSubirInventarioFrente=$('#formSubirInventarioFrente').ajaxForm
				mod:that
				beforeSubmit: ->
					$('#resultado_inventario-frente').html('Subiendo el  el frente del inventario')
				success:(data) ->
					console.log data
					window.inventario.frente= data
					console.log JSON.stringify(window.inventario)
					this.mod.refrescarFrente()
					sal= $('#resultado_croquis')
					sal.html('Se subio correctamente la parte del frente')
			this.formSubirInventarioPosterior=$('#formSubirInventarioPosterior').ajaxForm
				mod:that
				beforeSubmit: ->
					$('#resultado_inventario-posterior').html('Subiendo el  posterior del inventario')
				success:(data) ->
					window.inventario.posterior= data
					this.mod.refrescarPosterior()
					sal= $('#resultado_croquis')
					sal.html('Se subio correctamente la parte posterior')

			$('#subir_img-posterior').on "click",()->
				that.subirPosterior()
			$('#subir_img-frente').on "click",()->
				that.subirFrente()
			$('#subir_fotografia').on "click",()->
				that.subiFotografia()
			$("#generar_reporte_pp").on "click", ->
				that.showSelReporte()
			return
		showSelReporte:->
			that= this
			this.actualizarAccidente()
			datos=
				data: JSON.stringify(window.inventario)
			#console.log JSON.stringify(window.inventario)
			$.ajax
				type:"POST"
				url:'/inventario/ventana_reporte/'
				dataType:'html'
				data:datos
				success: (res)->
					that.showMensaje("Reporte para imprimir",res)
			return
		limpiarFrente:->
			window.inventario.frente= ""
			croquis= $('#img-frente')
			liga_frente= $('#liga-img-frente')
			liga_frente.attr('title','ROJO')
			croquis.attr('src','/static/img/crojo.jpg')
			liga_frente.attr('href','/static/img/crojo.jpg')
			liga_frente.attr('data-gallery','data-gallery')
			croquis.attr('alt','ROJO')
		refrescarFrente:->
			croquis= $('#img-frente')
			liga_frente= $('#liga-img-frente')
			croquis.attr('src','/content/content/'+ window.inventario.frente.id)
			liga_frente.attr('href','/content/content/'+ window.inventario.frente.id)
			liga_frente.attr('data-gallery','data-gallery')
		limpiarPosterior:->
			croquis= $('#img-posterior')
			liga_posterior= $('#liga-img-posterior')
			croquis.attr('src','/static/img/crojo.jpg')
			liga_posterior.attr('href','/static/img/crojo.jpg')
			liga_posterior.attr('title','ROJO')
			liga_posterior.attr('data-gallery','data-gallery')
			croquis.attr('alt','ROJO')
		refrescarPosterior:->
			croquis= $('#img-posterior')
			liga_posterior= $('#liga-img-posterior')
			croquis.attr('src','/content/content/'+ window.inventario.posterior.id)
			liga_posterior.attr('href','/content/content/'+ window.inventario.posterior.id)
			liga_posterior.attr('data-gallery','data-gallery')
		limpiarFotos:->
			galeria= $('#links-fotos')
			galeria.html('')
			window.inventario.fotos= []
			a=$('<a></a>')
			a.addClass("muestra-img")
			a.attr('href','/static/img/crojo.jpg')
			a.attr('title','ROJO')
			a.attr('data-gallery','data-gallery')
			img=$('<img ></img>')
			img.attr('src','/static/img/crojo.jpg')
			img.attr('alt','ROJO')
			a.append(img)
			galeria.append(a)
		refrescarFotos:->
			galeria= $('#links-fotos')
			galeria.html('')
			fotos = window.inventario.fotos
			for foto in fotos
				a=$('<a></a>')
				a.addClass("muestra-img")
				a.attr('href','/content/content/' + foto.id)
				a.attr('title',foto.nombre)
				a.attr('data-gallery','data-gallery')
				img=$('<img></img>')
				img.attr('src','/content/content/' + foto.id)
				img.attr('alt',foto.nombre)
				a.append(img)
				galeria.append(a)
 		cargarFoliosAccidentesCapturados:->
			this.url= '/accidente/folios_totales'
			that= this
			$.ajax
				type:'GET'
				url: that.url
				success:(data)->
					$("#folioAccidente_inv").autocomplete
						source:data
		cargarFoliosInfraccionCapturados:->
			this.url= '/folios/folios_capturados'
			that= this
			$.ajax
				type:'GET'
				url: that.url
				success:(data)->
					$("#folioInfraccion_inv").autocomplete
						source:data
						change:(evento,ui)->
							valor= ui.item.value
							$.get '/infraccion/getInfraccion/' + valor + '/' ,(data)->
								that.llenarDatosDeInfraccion(data)


		llenarDatosDeInfraccion:(infraccion)->
			servicio= infraccion.servicio
			if servicio=="Servicio Particular"
				this.servicio_particular.checked= true
			else
				this.servicio_publico.checked= true
			
			$('#delegacion_inv').val(infraccion.delegacion)
			$('#comandancia_inv').val(infraccion.comandancia)
			$('#turno_inv').val(infraccion.turno)
			$('#calle1_inv').val(infraccion.Calle1)
			$('#calle2_inv').val(infraccion.Calle2)
			$('#exterior_inv').val(infraccion.frente_num)
			$('#colonia_inv').val(infraccion.colonia)
			$('#desc-vehiculo').val(infraccion.Clas_vehiculo)
			$('#marca_inv').val(infraccion.marca)
			$('#submarca_inv').val(infraccion.Submarca)
			$('#modelo_inv').val(infraccion.veh_modelo)
			$('#color_inv').val(infraccion.veh_color)
			$('#detalle_inv').val(infraccion.veh_color_detalle)
			$('#placas_inv').val(infraccion.veh_placas)
			$('#noEcon_inv').val(infraccion.numero_economico)
			$('#serie_inv').val(infraccion.veh_serie)
			$('#tipoVehiculo_inv').val(infraccion.sp_tipo)
		iniciarCalendario:->
			$('#fecha-incidente').datetimepicker
				pickTime: false
				language: 'es'
			$('#fecha-entrada-inventario-append').datetimepicker
				pickTime: false
				language: 'es'
			$('#hora-entrada-inventario-append').datetimepicker
				pickDate: false
				language: 'es'
		iniciarGalerias:()->
			console.log "Hola mundo"
		cargarInventarioServer:(id)->
			this.id= id
			this.url= 'getInventario/'+ this.id
			that= this
			$.ajax
				type:'GET'
				url: that.url
				success:(data)->
					window.inventario= data[0]
					that.cargarInventarioEnView()
		showFieldError:(item,msg)->
			padre= item.parents("div.control-group")
			padre.addClass('error')
			padre.children('.help-inline').html(msg)
			item.focus()
		showFieldSuccess:(item)->
			padre= item.parents("div.control-group")
			padre.addClass('success')
			padre.children('.help-inline').html('')
		limpiarColorFields:()->
			$(".control-group").removeClass('error')
			$(".control-group").removeClass('success')

			###formSubirFoto:null
		formSubirInventarioFrente:null
		formSubirInventarioPosterior:null
		###
		subirFrente:->
			that= this
			$('input[name="id_unico"]').val($('#folio_inventa').val())
			this.formSubirInventarioFrente.submit()
			return
		subirPosterior:->
			that= this
			$('input[name="id_unico"]').val($('#folio_inventa').val())
			this.formSubirInventarioPosterior.submit()
			return
		subiFotografia:->
			that= this
			$('input[name="id_unico"]').val($('#folio_inventa').val())
			this.formSubirFoto.submit()
			return
		establecerDefault:->
			that= this
			$("#placas_default").on 'click', ->
				placa=$('#placas_inv').val() 
				if placa != ""
					that.cargarVehiculo(placa)
			$("#noecon_default").on 'click', ->
				$("#noEcon_inv").val("NO APLICA")
			$("#serie_default").on 'click', ->
				$("#serie_inv").val("NO APLICA")
			$("#nombreConductor_inv_default").on 'click', ->
				$("#nombreConductor_inv").val("NO APLICA")
			$("#apellidoPaterno_inv_default").on 'click', ->
				$("#apellidoPaterno_inv").val("NO APLICA")
			$("#apellidoMaterno_inv_default").on 'click', ->
				$("#apellidoMaterno_inv").val("NO APLICA")
			
			 



		validateFields:()->
			this.limpiarColorFields()
			that= this
			if $("#folio_inventa").val() ==''
				this.showFieldError($("#folio_inventa"),"Debes elegir un folio")
				return false
			else
				this.showFieldSuccess($("#folio_inventa"))

			if this.rad_optInfraccion.checked==false and this.rad_AccidenteInfraccion.checked==false and this.rad_resguardos.checked==false
				$("#optInfraccion_inv").parents("div.control-group").addClass("error")
				$("#msg-tipo-inventario").html('Debes elegir una opción')
				return false
			else
				$("#optInfraccion_inv").parents("div.control-group").addClass("success")
				$("#msg-tipo-inventario").html('')
				if this.rad_optInfraccion.checked==true
					if $("#folioInfraccion_inv").val() ==''
						this.showFieldError($("#folioInfraccion_inv"),"Debes elegir un folio")
						return false
					else
						this.showFieldSuccess($("#folioInfraccion_inv"))
				else
					if $("#folioAccidente_inv").val() ==''
						this.showFieldError($("#folioAccidente_inv"),"Debes elegir un folio")
						return false
					else
						this.showFieldSuccess($("#folioAccidente_inv"))

			if $("#fechaIncidente_inv").val() ==''
				this.showFieldError($("#fechaIncidente_inv"),"Es necesario elegir la fecha")
				return false
			else
				this.showFieldSuccess($("#fechaIncidente_inv"))			
				
			if $("#delegacion_inv").val() =='NO'
				this.showFieldError($("#delegacion_inv"),"Debes elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#delegacion_inv"))

			if $("#comandancia_inv").val() =='NO'
				this.showFieldError($("#comandancia_inv"),"Debes  elegir una opcion")
				return false
			else 
				this.showFieldSuccess($("#comandancia_inv"))

			if $("#turnos_inv").val() =='NO'
				this.showFieldError($("#turnos_inv"),"Debes elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#turnos_inv"))	

			if $("#corporacion_inv").val() =='NO'
				this.showFieldError($("#corporacion_inv"),"Debes elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#corporacion_inv"))
				
			val_calle1=$('#calle1_inv').val()
			
			if val_calle1== ''
				this.showFieldError($("#calle1_inv"),"Debes elegir una calle")
				return false
			else
				rr=window.validateCalle(val_calle1)
				if !rr.res
					this.showFieldError($("#calle1_inv"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#calle1_inv"))

			if $("#exterior_inv").val() ==''
				this.showFieldError($("#exterior_inv"),"Debes  elegir una opcion")
				return false
			else 
				this.showFieldSuccess($("#exterior_inv"))

			if $("#interior_inv").val() ==''
				this.showFieldError($("#interior_inv"),"Debes  elegir una opcion")
				return false
			else 
				this.showFieldSuccess($("#interior_inv"))
				
			val_calle2=$('#calle2_inv').val()
			if val_calle2!= ''
			 	rr= window.validateCalle(val_calle2)
				if !rr.res
					this.showFieldError($("#calle2_inv"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#calle2_inv"))

			val_colonia=$('#colonia_inv').val()
			if val_colonia== ''
				this.showFieldError($("#colonia_inv"),"Debes elegir una colonia")
				return false
			else
				rr= window.validateColonia(val_colonia)
				if !rr.res
					this.showFieldError($("#colonia_inv"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#colonia_inv"))

			if $("#depositadoEn_inv").val() =='NO'
				this.showFieldError($("#depositadoEn_inv"),"Debes  elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#depositadoEn_inv"))
			
			
			if $("#autoridadCompetente_inv").val() =='NO'
				this.showFieldError($("#autoridadCompetente_inv"),"Debes  elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#autoridadCompetente_inv"))

			if $("#mp_inv").val() =='NO'
				this.showFieldError($("#mp_inv"),"Debes  elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#mp_inv"))
					#DATOS DEL VEHICULO
			if this.rad_ServicioParticular.checked==false and this.rad_ServicioPublico.checked==false 
				$("#radServicioParticular_inv").parents("div.control-group").addClass("error")
				$("#msg-tipo-inventario").html('Debes elegir una opción')
				return false
			else
				$("#radServicioParticular_inv").parents("div.control-group").addClass("success")
				$("#msg-tipo-inventario").html('')

			if $("#desc-vehiculo").val() =='NO'
				this.showFieldError($("#desc-vehiculo"),"Debes  elegir una opcion")
				return false
			else
				this.showFieldSuccess($("#desc-vehiculo"))

				
			val_marca= $('#marca_inv').val()
			if $('#marca_inv').val()==''
				this.showFieldError($("#marca_inv"),"Es necesario establecer la marca")
				return false
			else
				rr= window.validateMarca(val_marca)
				if !rr.res
					this.showFieldError($("#marca_inv"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#marca_inv"))

			val_submarca=$('#submarca_inv').val()
			if $('#submarca_inv').val()==''
				this.showFieldError($("#submarca_inv"),"Es necesario establecer la submarca")
				return false
			else
				rr= window.validateSubMarca(val_submarca)
				if !rr.res
					this.showFieldError($("#submarca_inv"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#submarca_inv"))

			if $("#modelo_inv").val() =='NO'
				this.showFieldError($("#modelo_inv"),"Debes  elegir el modelo")
				return false
			else
				this.showFieldSuccess($("#modelo_inv"))

			if $("#color_inv").val() =='NO'
				this.showFieldError($("#color_inv"),"Debes  elegir el color")
				return false
			else
				this.showFieldSuccess($("#color_inv"))

			if $("#detalle_inv").val() ==''
				this.showFieldError($("#detalle_inv"),"Debes elegir el detalle")
				return false
			else
				this.showFieldSuccess($("#detalle_inv"))

			if $("#placas_inv").val() ==''
				this.showFieldError($("#placas_inv"),"Debes elegir el numero de las placas")
				return false
			else
				this.showFieldSuccess($("#placas_inv"))	

			if $("#noEcon_inv").val() ==''
				this.showFieldError($("#noEcon_inv"),"Debes elegir noEcon")
				return false
			else
				this.showFieldSuccess($("#noEcon_inv"))

			if $("#serie_inv").val() ==''
				this.showFieldError($("#serie_inv"),"Debes elegir la serie")
				return false
			else
				this.showFieldSuccess($("#serie_inv"))

			if $("#tipoVehiculo_inv").val() =='NO'
				this.showFieldError($("#tipoVehiculo_inv"),"Debes  elegir el tipo del vehiculo")
				return false
			else
				this.showFieldSuccess($("#tipoVehiculo_inv"))

			if $("#nombreConductor_inv").val() ==''
				this.showFieldError($("#nombreConductor_inv"),"Debes elegir el nombre")
				return false
			else
				this.showFieldSuccess($("#nombreConductor_inv"))

			if $("#apellidoPaterno_inv").val() ==''
				this.showFieldError($("#apellidoPaterno_inv"),"Debes elegir el apellido paterno")
				return false
			else
				this.showFieldSuccess($("#apellidoPaterno_inv"))

			if $("#apellidoMaterno_inv").val() ==''
				this.showFieldError($("#apellidoMaterno_inv"),"Debes elegir el appellido materno")
				return false
			else
				this.showFieldSuccess($("#apellidoMaterno_inv"))

			if $("#lugar_inv").val() =='NO'
				this.showFieldError($("#lugar_inv"),"Debes  elegir el lugar")
				return false
			else
				this.showFieldSuccess($("#lugar_inv"))

			if $("#fecha-entrada-inventario").val() ==''
				this.showFieldError($("#fecha-entrada-inventario"),"Es necesario elegir la fecha")
				return false
			else
				this.showFieldSuccess($("#fecha-entrada-inventario"))
				
			if $("#hora-entrada-inventario").val() ==''
				this.showFieldError($("#hora-entrada-inventario"),"Es necesario elegir la hora")
				return false
			else
				this.showFieldSuccess($("#hora-entrada-inventario"))
				
			if $("#recibidoPor_inv").val() ==''
				this.showFieldError($("#recibidoPor_inv"),"Quien lo resibio")
				return false
			else
				this.showFieldSuccess($("#recibidoPor_inv"))

			if this.rad_propiosMedios.checked==false and this.rad_grua.checked==false and this.rad_Transiton.checked==false
				$("#propiosMedios_inv").parents("div.control-group").addClass("error")
				$("#msg-tipo-inventario").html('Debes elegir una opción')
				return false
			else
				$("#propiosMedios_inv").parents("div.control-group").addClass("success")
				$("#msg-tipo-inventario").html('')

			if $("#folio_agente").val() ==''
				this.showFieldError($("#folio_agente"),"Debes elegir un folio")
				return false
			else
				this.showFieldSuccess($("#folio_agente"))

			if $("#agente_inv").val() ==''
				this.showFieldError($("#agente_inv"),"Debes elegir el agente")
				return false
			else
				this.showFieldSuccess($("#agente_inv"))																						

			return true
					
		guardarInventarioServer:->
			that= this
			console.log JSON.stringify(window.inventario)
			this.actualizarInventario()
			console.log JSON.stringify(window.inventario)
			if !this.validateFields()
				return
			#console.log JSON.stringify(window.inventario)
			datos=
				data: JSON.stringify(window.inventario)
			#console.log JSON.stringify(window.inventario)
			$.ajax
				type:"POST"
				url:'/inventario/crear'
				dataType:"json"
				data:datos
				success:(data)->
					if data.ERROR != '' and data.ERROR != undefined
						that.showMensaje("ERROR",data.ERROR)	
						return
					a = new Date()
					inventario=window.inventario
					noticia=
						titulo:inventario.folio_de_inventario + "    " + inventario.calle1 + "   " + inventario.calle2 + "    " + inventario.colonia
						noticia:""
						tags:"INVENTARIO"
						archivos:"/static/fotos_subidas/foto.jpg"
						capturado_por:window.profile.nombre
						fecha:a.format("%Y-%m-%d %H:%M:%S", true)
					#window.client.emit 'add-new', noticia
					that.showMensaje("Mensaje de captura",'Se guardo el inventario con numero de folio <span class="new-folio">' + inventario.folio_del_inventario + '</span> exitosamente!!!')
					that.sandbox.emit 'limpiar-view-inventario'
				error:(error)->
						that.showMensajeError(error.responseText)
		showMensaje:(titulo,msg)->
				$div=$('#myModal .modal-body').html(msg)
				$("#myModal").modal('show')
				$('#myModalLabel').html(titulo)
		reiniciarInventario:->
			window.inventario= {}
			window.inventario.fotos= []
			return
		guardarLocalInventarioServer:->
			inv_server= sessionStorage.getItem('inventarios-server')
			id = window.inventario.folio_del_inventario
			if !inv_server
				inventarios= []
				inventarios.push(id)
				obj = JSON.stringify(inventarios)
				sessionStorage.setItem('inventarios-server',obj)
				this.sandbox.emit 'update-menu-inventarios-server',inventarios
			else
				a_inventarios = JSON.parse(inv_server) 
				if a_inventarios.length >5
					a_inventarios.shift()
				a_inventarios.push(id)
				obj = JSON.stringify(a_inventarios)
				sessionStorage.setItem('inventarios-server',obj)
				this.sandbox.emit 'update-menu-inventarios-server',a_inventarios
		iniciarDate:->
			Date.prototype.format =(fstr, utc) ->
				that = this
				if utc
					pre ='getUTC'
				else
					pre='get'
				return fstr.replace(/%[YmdHMS]/g,(m)-> 
					switch m
						when '%Y' then return that[pre + 'FullYear']()
						when '%m' then m = 1 + that[pre + 'Month']()
						when '%d' then m = that[pre + 'Date']()
						when '%H' then m = that[pre + 'Hours']() 
						when '%M' then m = that[pre + 'Minutes']() 
						when '%S' then m = that[pre + 'Seconds']()
						else return m.slice(1)
					return ('0' + m).slice(-2)
				)
		guardarInventarioLocal:->
			this.actualizarInventario()
			inv= window.inventario
			inventarios= sessionStorage.getItem('inventariosl')
			if !inventarios
				inventarios= []
				inventarios.push(inv)
				obj = JSON.stringify(inventarios)
				sessionStorage.setItem('inventariosl',obj)
				this.sandbox.emit 'update-menu-inventarios-local', inventarios
			else
				a_inventarios= JSON.parse(inventarios)
				if a_inventarios.length>5
					a_inventarios.shift()
				this.agregarInventario(a_inventarios,inv)
				obj= JSON.stringify(a_inventarios)
				sessionStorage.setItem("inventariosl",obj)
				this.sandbox.emit 'update-menu-inventarios-local',a_inventarios
			this.sandbox.emit 'limpiar-view-inventario'
		agregarInventario:(col,p_inf)->
			clone = col.slice(0)
			ban= false
			indice= 0
			for inf,i in clone
				if inf.folio_del_inventario == p_inf.folio_del_inventario
					indice= i
					ban= true
			if ban
				col[indice]= p_inf
			else
				col.push(p_inf)
			return
 
		llenarDelegaciones:->
			if !window.delegaciones
				window.cargarDelegaciones this.llenarDelegaciones
			else
				sel=$('#delegacion_inv').html("")
				opciones= '<option value= "NO">**SELECCIONAR**</option>'
				console.log window.delegaciones
				for delegacion in window.delegaciones
					opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
				console.log  opciones
				sel.append(opciones)
			return
		llenarComandancias:->
			if !window.comandancias
				cargarComandancias this.llenarComandancias
			else
				sel=$('#comandancia_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>';
				for comandancia in window.comandancias
					opciones+= '<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
				sel.append(opciones)
			return
		llenarTurnos:->
			if !window.turnos
				cargarTurnos this.llenarTurnos
			else
				sel=$('#turnos_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>';
				for turno in window.turnos
					 
					opciones+='<option value="'+turno.turno+'">'+turno.turno+'</option>'
				sel.append(opciones)
				return
		llenarCorporaciones:->
			if !window.corporaciones
				cargarCorporaciones this.llenarCorporaciones
			else
				sel=$('#corporacion_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>';
				for corporacion in window.corporaciones
					 
					opciones+='<option value="'+corporacion.corporacion+'">'+corporacion.corporacion+'</option>'
				sel.append(opciones)
				return	
		llenarCalles:->
			if !window.calles
				cargarCalles this.llenarCalles
			else
				nombres= []
				for item in window.calles
					nombres.push item.calle
				$("#calle1_inv").autocomplete
						source:nombres
				$("#calle2_inv").autocomplete
						source:	nombres	
			return
		llenarColonias:->
			if !window.colonias
				cargarColonias this.llenarColonias
			else
				nombres= []
				for item in window.colonias
					nombres.push item.nombre
				$("#colonia_inv").autocomplete
					source:nombres
			return
		llenarPensiones:->
			if !window.pensiones
				cargarPensiones this.llenarPensiones
			else
				sel=$('#depositadoEn_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>'
				for pension in window.pensiones
					 
					opciones+='<option value="'+pension.nombre_pension+'">'+pension.nombre_pension+'</option>'
				sel.append(opciones)
				return
		llenarCompetentes:->
			if !window.autCompInvs
				cargarCompetentes this.llenarCompetentes
			else
				sel=$('#autoridadCompetente_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>'
				for competente in window.autCompInvs
					opciones+= '<option value="'+competente.autoridad+'">'+competente.autoridad+'</option>'
				sel.append(opciones)
				return
		llenarMps:->
			if !window.mps
				cargarMps this.llenarMps
			else
				sel=$('#mp_inv').html("")
				opciones= '<option value="NO">**SELECCIONAR**</option>'
				for mp in window.mps
					opciones+='<option value="'+mp.agencia+'">'+mp.agencia+'</option>'
				sel.append(opciones)
				return
		llenarMarcas:->
			if !window.marcas
					cargarMarcas this.llenarMarcas
			else
				sel=$("#marca_inv").html("")
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				a_marcas= []
				for marca in window.marcas
					a_marcas[marca.marca]=1
				for nombre in _.keys(a_marcas)
					opciones+='<option value="' + nombre + '">' + nombre + '</option>';
				sel.append opciones

			return
		llenarModelos:()->
				sel= $('#modelo_inv').html("");
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				for x in [1910..2020]
					opciones += '<option value="' + x + '">' + x + '</option>'
				opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
				sel.append(opciones)
				return
		llenarColores:->
			if !window.colores
				cargarColores this.llenarColores
			else
				sel=$('#color_inv').html("")
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				for color in window.colores
					opciones+= '<option value="'+color.color+'">'+color.color+'</option>'
				sel.append(opciones)
				return
		llenarProfiles:->
			that= this
			if !window.profiles
				cargarProfiles this.llenarProfiles
			else
				list_cobro= []
				agentes=window.profiles
				for agente in agentes
					list_cobro.push(agente.cobro)
				$("#folio_agente").autocomplete
					source:list_cobro
					change:(evento,ui)->
						for p in window.profiles
							if p
								if p.cobro==ui.item.value
									$("#agente_inv").val( p.nombre)
		llenarDescVehiculos:->
				if !window.descVehiculos
					cargarDescVehiculos this.llenarDescVehiculos
				else
					$("#desc-vehiculo").html('')
					sel =$("#desc-vehiculo")
					opciones= '<option  value="SEL">**SELECCIONAR**</option>'
					for item in window.descVehiculos
						opciones+='<option value="' + item.descripcion + '">' + item.descripcion + '</option>';
					sel.append opciones
				return
		llenarTipo:->
			if !window.tipos
				cargarTipos this.llenarTipo
			else
				sel=$('#tipoVehiculo_inv').html("")
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				for tipo in window.tipos
					opciones+='<option value="'+tipo.tipo+'">'+tipo.tipo+'</option>'
				sel.append(opciones)
				return
		llenarLugares:->
			if !window.lugares
				cargarLugares this.llenarLugares
			else
				sel=$('#lugar_inv').html("")
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				for lugar in window.lugares
					opciones+='<option value="'+lugar.descripcion+'">'+lugar.descripcion+'</option>'
				sel.append(opciones)
				return
		llenarHoras:()->
				sel= $('#hora_inv').html("");
				opciones= ''
				for x in [1..12]
					opciones += '<option value="' + x + '">' + x + '</option>'
				opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
				sel.append(opciones)
				return
		llenarMinutos:()->
				sel= $('#minutos_inv').html("");
				opciones= ''
				for x in [1..60]
					opciones += '<option value="' + x + '">' + x + '</option>'
				opciones += '<option value="' + -1 + '">' + "SE DESCONOCE" + '</option>'
				sel.append(opciones)
				return
		llenarPensionesPar:->
			if !window.pensiones
				cargarPensiones this.llenarPensionesPar
			else
				sel=$('#pensionPart_inv').html("")
				opciones= '<option  value="NO">**SELECCIONAR**</option>'
				for pension in window.pensiones
					opciones+='<option value="'+pension.nombre_pension+'">'+pension.nombre_pension+'</option>'	
				sel.append(opciones)
		cargarInventarioEnView:()->
			that=this
			inv= window.inventario
			$('#folio_inventa').val(inv.folio_del_inventario)
			$('#delegacion_inv').val(inv.delegacion)
			$('#comandancia_inv').val(inv.comandancia)
			$('#turnos_inv').val(inv.turno)
			$('#corporacion_inv').val(inv.corporacion) 
			$('#autoridadCompetente_inv').val(inv.autoridad_competente) 
			if inv.motivo_de_recojimiento == "Infraccion"
				this.rad_infraccion.checked= true
			else if inv.motivo_de_recojimiento == "Accidente o Infraccion"
				this.rad_accidente_infraccion.checked= true
			else if inv.motivo_de_recojimiento == "Resguardo"
				this.rad_resguardo.checked= true
			$('#folioAccidente_inv').val(inv.folio_inventario)
			$('#folioInfraccion_inv').val(inv.folio_infraccion)
			$('#fechaIncidente_inv').val(inv.fecha_incidente)
			$('#calle1_inv').val(inv.calle1)
			$('#exterior_inv').val(inv.exterior)
			$('#interior_inv').val(inv.num_interior)
			$('#calle2_inv').val(inv.calle2)
			$('#colonia_inv').val(inv.colonia)
			$('#depositadoEn_inv').val(inv.depositado_en)
			$('#mp_inv').val(inv.mp)
			if inv.tipo_servicio =='Servicio Particular'

				this.servicio_particular.checked = true
			else
				this.servicio_publico.checked = true
			$('#marca_inv').val(inv.marca)
			window.actualizarSubMarcaValor(inv.marca)
			$('#submarca_inv').val(inv.submarca)
			$('#modelo_inv').val(inv.modelo)
			$('#color_inv').val(inv.color)
			$('#detalle_inv').val(inv.detalle)
			$('#placas_inv').val(inv.placas)
			$('#noEcon_inv').val(inv.no_econ)
			$('#serie_inv').val(inv.serie)
			$('#desc-vehiculo').val(inv.clas_vehiculo)
			$('#tipoVehiculo_inv').val(inv.tipoveh)
			$('#nombreConductor_inv').val(inv.conductor_nombre)
			$('#apellidoPaterno_inv').val(inv.apellido_paterno)
			$('#apellidoMaterno_inv').val(inv.apellido_materno)
			$('#lugar_inv').val(inv.lugar)
			$('#hora_inv').val(inv.hora)
			$('#fecha-entrada-inventario').val(inv.fecha_entrada)
			$('#hora-entrada-inventario').val(inv.hora_entrada)
			$('#recibidoPor_inv').val(inv.recibido_por)
			if inv.vehiculo_transportado_por == "Propios Medios"
				this.propiosMedios.checked= true
				$('#pensionPart_inv').val('')
				$('#deTransito').val('')
			else if inv.vehiculo_transportado_por == "Grua Particular"
				this.grua.checked= true
				$('#pensionPart_inv').val(inv.vehiculo_transportado_pension)
				$('#deTransito').val(inv.vehiculo_transportado_unidad_transito)
			else if inv.vehiculo_transportado_por == "De Transito"
				this.transito.checked= true
				$('#pensionPart_inv').val('')
				$('#deTransito').val('')
			 
			$('#folio_agente').val(inv.folio_agente)
			#this.refresc.folio_agente)
			$('#agente_inv').val(inv.nombre_agente)
			#that.refrescararPosterior()
			##that.refrescarFotos()
			return
		cargarVehiculo:(placa)->
			alert  placa
			$.ajax
				type:'GET'
				url:'/infraccion/getHistVehiculo/' + placa + '/'
				success:(data)->
					console.log  data
					$('#marca_inv').val(data.marca)
					$('#submarca_inv').val(data.submarca)
					$('#modelo_inv').val(data.veh_modelo)
					$('#color_inv').val(data.veh_color)
					$('#detalle_inv').val(data.veh_color_detalle)
					$('#tipo_cv_spa_inf').val(data.sp_tipo)
					$('#serie_inv').val(data.veh_serie)
					$('#tipoVehiculo_inv').val(data.sp_tipo)
					$('#noEcon_inv').val(data.sp_no_economico)
					alert 'Elvia'
				error:(error)->
					console.log  error
			return

		cancelar:->
			this.servicio_particular.checked= false
			this.servicio_publico.checked= false
			$('#folio_inventa').val('')
			$('#optInfraccion_inv').val('')
			$('#optAccidenteInfraccion_inv').val('')
			$('#delegacion_inv').val('')
			$('#comandancia_inv').val('')
			$('#turnos_inv').val('')
			$('#extempo_inv').val('')
			$('#corporacion_inv').val('')
			this.infraccion.checked= false
			this.accidenteInfraccion.checked= false
			this.resguardo.checked= false
			$('#folioInfraccion_inv').val('')
			$('#folioInventario_inv').val('')
			$('#folioAccidente_inv').val('')
			$('#fechaIncidente_inv').val('')
			$('#calle1_inv').val('')
			$('#exterior_inv').val('')
			$('#interior_inv').val('')
			$('#calle2_inv').val('')
			$('#colonia_inv').val('')
			$('#depositadoEn_inv').val('')
			$('#autoridadCompetente_inv').val('')
			$('#llaves_inv').val('')
			$('#mp_inv').val('')
			$('#desc-vehiculo').val('')
			$('#marca_inv').val('')
			$('#submarca_inv').val('')
			$('#modelo_inv').val('')
			$('#color_inv').val('')
			$('#detalle_inv').val('')
			$('#placas_inv').val('')
			$('#noEcon_inv').val('')
			$('#serie_inv').val('')
			$('#noVisible').val('')
			$('#tipoVehiculo_inv').val('')
			$('#nombreConductor_inv').val('')
			$('#apellidoPaterno_inv').val('')
			$('#apellidoMaterno_inv').val('')
			$('#pensionPart_inv').val('')
			$("#lugar_inv").val('')
			$('#fecha-entrada-inventario').val('')
			$('#hora-entrada-inventario').val('')
			$('#recibidoPor_inv').val('')
			$('#folio_agente').val('')
			$('#llevadoUnidad_inv').val('')
			$('#agente_inv').val('')
			$('#deTransito').val('')
			this.propiosMedios.checked= false
			this.grua.checked= false
			this.transito.checked= false
			$('#pensionPart_inv').val('')
			this.limpiarFrente()
			this.limpiarPosterior()
			this.limpiarFotos()
			 
		actualizarInventario:->
			#this.reiniciarInventario()
			inventario= window.inventario
			inventario.folio_del_inventario= $('#folio_inventa').val()
			inventario.delegacion= $('#delegacion_inv').val()
			if this.servicio_particular.checked == true
				inventario.tipo_servicio= 'Servicio Particular'
			else if this.servicio_publico.checked == true
				inventario.tipo_servicio= "Servicio Publico"
			inventario.comandancia= $('#comandancia_inv').val()
			inventario.turno= $('#turnos_inv').val()
			inventario.corporacion= $('#corporacion_inv').val()
			if this.infraccion.checked == true
				inventario.motivo_de_recojimiento= 'Infraccion'
			else if this.accidenteInfraccion.checked == true
				inventario.motivo_de_recojimiento= 'Accidente o Infraccion'
			else if this.resguardo.checked == true
				inventario.motivo_de_recojimiento= 'Resguardo'
			inventario.folio_infraccion= $('#folioInfraccion_inv').val()
			inventario.folio_accidente= $('#folioAccidente_inv').val()
			inventario.fecha_incidente= $('#fechaIncidente_inv').val()
			inventario.calle1= $('#calle1_inv').val()
			inventario.exterior = $('#exterior_inv').val()
			inventario.num_interior = $('#interior_inv').val()
			inventario.calle2= $('#calle2_inv').val()
			inventario.colonia= $('#colonia_inv').val()
			inventario.depositado_en= $('#depositadoEn_inv').val()
			inventario.autoridad_competente= $('#autoridadCompetente_inv').val()
			inventario.mp= $('#mp_inv').val()
			inventario.marca= $('#marca_inv').val()
			inventario.submarca= $('#submarca_inv').val()
			inventario.modelo= $('#modelo_inv').val()
			inventario.color = $('#color_inv').val()
			inventario.detalle= $('#detalle_inv').val()
			inventario.placas= $('#placas_inv').val()
			inventario.numero_economico= $('#noEcon_inv').val()
			inventario.serie= $('#serie_inv').val()
			inventario.clas_vehiculo=$('#desc-vehiculo').val()
			inventario.tipoveh= $('#tipoVehiculo_inv').val()
			inventario.conductor_nombre= $('#nombreConductor_inv').val()
			inventario.apellido_paterno= $('#apellidoPaterno_inv').val()
			inventario.apellido_materno= $('#apellidoMaterno_inv').val()
			inventario.lugar= $('#lugar_inv').val()
			inventario.fecha_entrada= $('#fecha-entrada-inventario').val()
			inventario.hora_entrada= $('#hora-entrada-inventario').val()
			inventario.recibido_por= $('#recibidoPor_inv').val()
			if this.propiosMedios.checked == true
				inventario.vehiculo_transportado_por= 'Propios Medios'
				inventario.vehiculo_transportado_pension= ''
				inventario.vehiculo_transportado_unidad_transito= ''
			else if this.grua.checked == true
				inventario.vehiculo_transportado_por= "Grua Particular"
				inventario.vehiculo_transportado_pension=$('#pensionPart_inv').val()
				inventario.vehiculo_transportado_unidad_transito= ''
			else if this.transito.checked == true
				inventario.vehiculo_transportado_por= 'De Transito'
				inventario.vehiculo_transportado_pension= ''
				inventario.vehiculo_transportado_unidad_transito=$('#deTransito').val()
			inventario.folio_agente=$('#folio_agente').val()
			inventario.nombre_agente=$('#agente_inv').val()
			inventario.usuario=window.profile.nombre
			return
