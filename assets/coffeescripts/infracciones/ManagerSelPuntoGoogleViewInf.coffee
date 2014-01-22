define [
  'core/sandbox'
],(sandbox)->
	ManagerServicioParticlarInf=
		padreId:"#selPunto"
		elementId:"#selPuntoView"
		element:null
		template:null
		gg:null
		padre:null
		mapa:false
		map:null
		geocoder:null
		ver_mapa:false
		iniciar:()->
			that=this
			this.padre= $ this.padreId
			this.sandbox= new sandbox this
			$('#find-punto-infraccion').on 'click', (evento)->
				call=$("#geocomplete").val()
				alert call
				that.ubicarPorParametro(call)
			$('#buscar-punto-google').on 'mouseover', ()->
				google.maps.event.trigger(window.mapa,'resize')
			$('#editar_punto_inf').on 'click',(evento)->
				if !that.ver_mapa
					that.ver_mapa=true
					that.showSelMapa()
					$('#buscar_punto_inf').html "<i class=\"icosystra-minus\"></i>"
					if !that.mapa 
						that.iniciarPickerStreet()
						lat=$('#lat_inf').val()
						lng=$('#lng_inf').val()
						that.ubicarPuntoReferencia(lat,lng)
						that.ver_mapa=true
					
				else
					#alert 'Hola mundo'
					that.ver_mapa=false
					google.maps.event.trigger(that.mapa, 'resize')
					#alert 'Hola mundo'
					that.ocultarSelMapa()
					$('#buscar_punto_inf').html "<i class=\"icosystra-earth\"></i>"
			try
				that.gg= google
			catch
				that.gg=null

			$('#buscar_punto_inf').on 'click' ,(evento)->
				if !that.ver_mapa
					that.ver_mapa=true
					that.showSelMapa()
					$('#buscar_punto_inf').html "<i class=\"icosystra-minus\"></i>"
					if !that.mapa 
						that.iniciarPickerStreet()
						that.ubicarCalle()
						that.ver_mapa=true
					
				else
					#alert 'Hola mundo'
					that.ver_mapa=false
					google.maps.event.trigger(that.mapa, 'resize')
					#alert 'Hola mundo'
					that.ocultarSelMapa()
					$('#buscar_punto_inf').html "<i class=\"icosystra-earth\"></i>"
			try
				that.gg= google
			catch
				that.gg=null
			### 
			$('#buscar_punto_pp').on 'click' ,(evento)->
				if that.gg== null
					return
				if $('#buscar-punto-google').is(":visible")
					$('#buscar-punto-google').hide()
					$('#buscar_punto_pp').html "<i class=\"icon-globe\"></i>"
					gg.maps.event.trigger(that.mapa, 'resize')
					#that.mapa.onResize()
				else
					#that.iniciarPickerStreet()
					$('#buscar-punto-google').show()
					$('#buscar_punto_pp').html "<i class=\"icon-minus-sign\"></i>"
					#console.log that.mapa
					#google.maps.event.trigger(that.mapa, 'resize')
					#that.mapa.onResize()
					if !that.mapa 
						that.iniciarMapa()
			###
			return
		ubicarPuntoReferencia:(lat,long)->
			that=this
			ubicacion=calle
			window.mapa.setCenter(lat,long)
			window.marker.setPosition(lat,long)
		ubicarPorParametro:(calle)->
			that=this
			ubicacion=calle
			req=
				address:ubicacion
				componentRestrictions:
					country:"MX"
					administrativeArea:"GTO"
			window.geocoder.geocode req, (resultado,status)->
				if status== google.maps.GeocoderStatus.OK
					window.mapa.setCenter(resultado[0].geometry.location)
					window.marker.setPosition(resultado[0].geometry.location)
					primero=resultado[0]
					$("#geocomplete").val(primero.formatted_address)
					$("#lat_inf").val(primero.geometry.location.lat())
					$("#lng_inf").val(primero.geometry.location.lng())
			google.maps.event.addListener window.mapa, 'click',(e)->
				that.getAddress(e.latLng)

		ubicarCalle:()->
			that=this
			ubicacion=""
			calle1 = $('#calle1_spa_inf').val()
			#calle2= $('#calle2_spa_inf').val()
			calle2= $('#colonia_spa_inf').val()
			if calle1 == "" and calle2 == ""
				ubicacion="Zona Centro"
			if calle1 != "" and calle2 ==""
				ubicacion =calle1
			if calle1 == "" and calle2 != ""
				ubicacion=calle2
			if  calles !="" and calle2 != ""
				ubicacion = calle1 + ',' + calle2
			req=
				address:ubicacion
				componentRestrictions:
					country:"MX"
					administrativeArea:"GTO"
					locality:"León+de+Los+Aldama"
			window.geocoder.geocode req, (resultado,status)->
				if status== google.maps.GeocoderStatus.OK
					window.mapa.setCenter(resultado[0].geometry.location)
					window.marker.setPosition(resultado[0].geometry.location)
					primero=resultado[0]
					$("#geocomplete").val(primero.formatted_address)
					$("#lat_inf").val(primero.geometry.location.lat())
					$("#lng_inf").val(primero.geometry.location.lng())
			google.maps.event.addListener window.mapa, 'click',(e)->
				that.getAddress(e.latLng)

		showSelMapa:()->
			el=$("#buscar-punto-google")
			cambios=
				height: "500px"
				width: "100%"
			el.css(cambios)
		ocultarSelMapa:()->
			el=$("#buscar-punto-google")
			cambios=
				height: "0px"
				width: "0px"
			el.css(cambios)
		iniciarPickerStreet:->
			that=this
			options=
				zoom:17
				center:new google.maps.LatLng(21.15,-101.60)
				mapTypeId:google.maps.MapTypeId.ROADMAP
			window.mapa= new google.maps.Map(document.getElementById("map_canvas"),options)
			window.geocoder= new google.maps.Geocoder()
			window.marker= new google.maps.Marker
						map:window.mapa
			req=
				address:"Zona Centro"
				componentRestrictions:
					country:"MX"
					administrativeArea:"GTO"
					locality:"León+de+Los+Aldama"
			window.geocoder.geocode req, (resultado,status)->
				if status== google.maps.GeocoderStatus.OK
					window.mapa.setCenter(resultado[0].geometry.location)
					window.marker.setPosition(resultado[0].geometry.location)
			google.maps.event.addListener window.mapa, 'click',(e)->
				getAddress(e.latLng)
			getAddress=(latLng)->
					if !geocoder
						geocoder= new google.maps.Geocoder()
					if !window.marker
						window.marker= new google.maps.Marker
							map:window.mapa
					window.marker.setPosition(latLng)
					req=
						latLng:latLng
					geocoder.geocode req,(resultado,status)->
						primero=resultado[0]
						$("#geocomplete").val(primero.formatted_address)
						$("#lat_inf").val(primero.geometry.location.lat())
						$("#lng_inf").val(primero.geometry.location.lng())
				$("#geocomplete").bind "geocode:dragged", (event, latLng)->
					$("#lat_inf").val(latLng.lat());
					$("#lng_inf").val(latLng.lng());
					$("#reset").show();

				$("#geocomplete").geocomplete(options)
					.bind "geocode:error", (event, status)->
						$.log("ERROR: " + status)

				$("#geocomplete").geocomplete(options)
					.bind "geocode:multiple", (event, results)->
						$.log("Multiple: " + results.length + " results found");

				$("#find").click ()->
					$("#geocomplete").trigger("geocode")
