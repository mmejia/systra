define [ 
  'core/sandbox'
 ], (sandbox)->
		app=
			servicio_publico:null
			servicio_particular:null
			rad_infraccion:null
			rad_accidente:null
			rad_accidente_infraccion:null
			rad_resguardo:null
			propiosMedios:null
			grua:null
			transito:null
			iniciar:()->
				this.servicio_particular= document.getElementById("radServicioParticular_inv")
				this.servicio_publico= document.getElementById("radServicioPublico_inv")
				this.rad_infraccion= document.getElementById("optInfraccion_inv")
				this.rad_accidente= document.getElementById("optAccidente_inv")
				this.rad_accidente_infraccion= document.getElementById("optAccidenteInfraccion_inv")
				this.rad_resguardo= document.getElementById("resguardo_inv")
				this.propiosMedios= document.getElementById("propiosMedios_inv")
				this.grua= document.getElementById("grua_inv")
				this.transito= document.getElementById("pensionPart_inv")
				return
			loadInventarioOnView:->
				inv= window.inventario
				$('#folio_inventa').val(inv.folio_inventario)
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

				$('#folioInfraccion_inv').val(inv.folio_infraccion)
				$('#folioAccidente_inv').val(inv.folio_inventario)
				$('#fechaIncidente_inv').val(inv.fecha_incid)
				$('#calle1_inv').val(inv.calle1)
				$('#exterior_inv').val(inv.exterior)
				$('#interior_inv').val(inv.interior)
				$('#calle2_inv').val(inv.calle2)
				$('#colonia_inv').val(inv.colonia)
				$('#depositadoEn_inv').val(inv.depositado_en)
				$('#autoridadCompetente_inv').val(inv.autoridad_competente)
				$('#mp_inv').val(inv.agencia_mp)
				if inv.tipo_servicio =='Servicio Particular'

					this.servicio_particular.checked = true
				else
					this.servicio_publico.checked = true
				$('#marca_inv').val(inv.marca)
				window.actualizarSubMarcaValor(inv.marca)
				$('#submarca_inv').val(inv.submarca)
				$('#modelo_inv').val(inv.veh_modelo)
				$('#color_inv').val(inv.veh_color)
				$('#detalle_inv').val(inv.veh_color_detalle)
				$('#placas_inv').val(inv.veh_placas)
				$('#noEcon_inv').val(inv.numero_economico)
				$('#serie_inv').val(inv.veh_serie)
				$('#desc-vehiculo').val(inv.clas_vehiculo)
				$('#tipoVehiculo_inv').val(inv.tipo)
				$('#nombreConductor_inv').val(inv.infractor_nombre)
				$('#apellidoPaterno_inv').val(inv.infractor_apepaterno)
				$('#apellidoMaterno_inv').val(inv.infractor_apematerno)
				$('#lugar_inv').val(inv.pension_lugar)
				$('#hora-entrada-inventario').val(inv.pension_hora)
				$('#fecha-entrada-inventario').val(inv.pension_fecha)
				$('#recibidoPor_inv').val(inv.pension_recibido_por)
				if inv.pension_transportado_por == "Propios Medios"
					this.propiosMedios.checked= true
					$('#pensionPart_inv').val('')
					$('#deTransito').val('')
				else if inv.pension_transportado_por == "Grua Particular"
					this.grua.checked= true
					$('#pensionPart_inv').val(inv.vehiculo_transportado_pension)
					$('#deTransito').val(inv.vehiculo_transportado_unidad_transito)
				else if inv.pension_transportado_por == "De Transito"
					this.transito.checked= true
					$('#pensionPart_inv').val('')
					$('#deTransito').val('')
				 
				$('#folio_agente').val(inv.folio_agente)
				$('#agente_inv').val(inv.nombre_agente)
				this.refrescarFrente()
				this.refrescarPosterior()
				this.refrescarFotos()
				return
			limpiarFrente:->
				window.inventario.frente=""
				croquis= $('#img-frente')
				liga_frente= $('#liga-img-frente')
				liga_frente.attr('title','ROJO')
				croquis.attr('src','/static/img/crojo.jpg')
				liga_frente.attr('href','/static/img/crojo.jpg')
				croquis.attr('alt','ROJO')
			refrescarFrente:->
				croquis= $('#img-frente')
				liga_frente= $('#liga-img-frente')
				croquis.attr('src','/content/content/'+ window.inventario.frente.id) + "/"
				liga_frente.attr('href','/content/content/'+ window.inventario.frente.id) + "/"

			limpiarPosterior:->
				croquis= $('#img-posterior')
				liga_posterior= $('#liga-img-posterior')
				croquis.attr('src','/static/img/crojo.jpg')
				liga_posterior.attr('href','/static/img/crojo.jpg')
				liga_posterior.attr('title','ROJO')
				croquis.attr('alt','ROJO')
			refrescarPosterior:->
				console.log window.inventario.posterior
				croquis= $('#img-posterior')
				liga_posterior= $('#liga-img-posterior')
				croquis.attr('src','/content/content/'+ window.inventario.posterior.id + "/"
				liga_posterior.attr('href','/content/content/'+ window.inventario.posterior.id + "/"
			limpiarFotos:->
				galeria= $('#links-fotos')
				galeria.html('')
				window.inventario.fotos=[]
				a=$('<a></a>')
				a.addClass("muestra-img")
				a.attr('href','/static/img/crojo.jpg')
				a.attr('title','ROJO')
				a.attr('data-gallery','data-gallery')
				img=$('<img></img>')
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
		return app


			