// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerServicioParticlarInf;
  return ManagerServicioParticlarInf = {
    padreId: "#selPunto",
    elementId: "#selPuntoView",
    element: null,
    template: null,
    gg: null,
    padre: null,
    mapa: false,
    map: null,
    geocoder: null,
    ver_mapa: false,
    iniciar: function() {
      var that;
      that = this;
      this.padre = $(this.padreId);
      this.sandbox = new sandbox(this);
      $('#find-punto-infraccion').on('click', function(evento) {
        var call;
        call = $("#geocomplete").val();
        alert(call);
        return that.ubicarPorParametro(call);
      });
      $('#buscar-punto-google').on('mouseover', function() {
        return google.maps.event.trigger(window.mapa, 'resize');
      });
      $('#editar_punto_inf').on('click', function(evento) {
        var lat, lng;
        if (!that.ver_mapa) {
          that.ver_mapa = true;
          that.showSelMapa();
          $('#buscar_punto_inf').html("<i class=\"icosystra-minus\"></i>");
          if (!that.mapa) {
            that.iniciarPickerStreet();
            lat = $('#lat_inf').val();
            lng = $('#lng_inf').val();
            that.ubicarPuntoReferencia(lat, lng);
            return that.ver_mapa = true;
          }
        } else {
          that.ver_mapa = false;
          google.maps.event.trigger(that.mapa, 'resize');
          that.ocultarSelMapa();
          return $('#buscar_punto_inf').html("<i class=\"icosystra-earth\"></i>");
        }
      });
      try {
        that.gg = google;
      } catch (_error) {
        that.gg = null;
      }
      $('#buscar_punto_inf').on('click', function(evento) {
        if (!that.ver_mapa) {
          that.ver_mapa = true;
          that.showSelMapa();
          $('#buscar_punto_inf').html("<i class=\"icosystra-minus\"></i>");
          if (!that.mapa) {
            that.iniciarPickerStreet();
            that.ubicarCalle();
            return that.ver_mapa = true;
          }
        } else {
          that.ver_mapa = false;
          google.maps.event.trigger(that.mapa, 'resize');
          that.ocultarSelMapa();
          return $('#buscar_punto_inf').html("<i class=\"icosystra-earth\"></i>");
        }
      });
      try {
        that.gg = google;
      } catch (_error) {
        that.gg = null;
      }
      /* 
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
      */

    },
    ubicarPuntoReferencia: function(lat, long) {
      var that, ubicacion;
      that = this;
      ubicacion = calle;
      window.mapa.setCenter(lat, long);
      return window.marker.setPosition(lat, long);
    },
    ubicarPorParametro: function(calle) {
      var req, that, ubicacion;
      that = this;
      ubicacion = calle;
      req = {
        address: ubicacion,
        componentRestrictions: {
          country: "MX",
          administrativeArea: "GTO"
        }
      };
      window.geocoder.geocode(req, function(resultado, status) {
        var primero;
        if (status === google.maps.GeocoderStatus.OK) {
          window.mapa.setCenter(resultado[0].geometry.location);
          window.marker.setPosition(resultado[0].geometry.location);
          primero = resultado[0];
          $("#geocomplete").val(primero.formatted_address);
          $("#lat_inf").val(primero.geometry.location.lat());
          return $("#lng_inf").val(primero.geometry.location.lng());
        }
      });
      return google.maps.event.addListener(window.mapa, 'click', function(e) {
        return that.getAddress(e.latLng);
      });
    },
    ubicarCalle: function() {
      var calle1, calle2, req, that, ubicacion;
      that = this;
      ubicacion = "";
      calle1 = $('#calle1_spa_inf').val();
      calle2 = $('#colonia_spa_inf').val();
      if (calle1 === "" && calle2 === "") {
        ubicacion = "Zona Centro";
      }
      if (calle1 !== "" && calle2 === "") {
        ubicacion = calle1;
      }
      if (calle1 === "" && calle2 !== "") {
        ubicacion = calle2;
      }
      if (calles !== "" && calle2 !== "") {
        ubicacion = calle1 + ',' + calle2;
      }
      req = {
        address: ubicacion,
        componentRestrictions: {
          country: "MX",
          administrativeArea: "GTO",
          locality: "León+de+Los+Aldama"
        }
      };
      window.geocoder.geocode(req, function(resultado, status) {
        var primero;
        if (status === google.maps.GeocoderStatus.OK) {
          window.mapa.setCenter(resultado[0].geometry.location);
          window.marker.setPosition(resultado[0].geometry.location);
          primero = resultado[0];
          $("#geocomplete").val(primero.formatted_address);
          $("#lat_inf").val(primero.geometry.location.lat());
          return $("#lng_inf").val(primero.geometry.location.lng());
        }
      });
      return google.maps.event.addListener(window.mapa, 'click', function(e) {
        return that.getAddress(e.latLng);
      });
    },
    showSelMapa: function() {
      var cambios, el;
      el = $("#buscar-punto-google");
      cambios = {
        height: "500px",
        width: "100%"
      };
      return el.css(cambios);
    },
    ocultarSelMapa: function() {
      var cambios, el;
      el = $("#buscar-punto-google");
      cambios = {
        height: "0px",
        width: "0px"
      };
      return el.css(cambios);
    },
    iniciarPickerStreet: function() {
      var getAddress, options, req, that;
      that = this;
      options = {
        zoom: 17,
        center: new google.maps.LatLng(21.15, -101.60),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      window.mapa = new google.maps.Map(document.getElementById("map_canvas"), options);
      window.geocoder = new google.maps.Geocoder();
      window.marker = new google.maps.Marker({
        map: window.mapa
      });
      req = {
        address: "Zona Centro",
        componentRestrictions: {
          country: "MX",
          administrativeArea: "GTO",
          locality: "León+de+Los+Aldama"
        }
      };
      window.geocoder.geocode(req, function(resultado, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          window.mapa.setCenter(resultado[0].geometry.location);
          return window.marker.setPosition(resultado[0].geometry.location);
        }
      });
      google.maps.event.addListener(window.mapa, 'click', function(e) {
        return getAddress(e.latLng);
      });
      getAddress = function(latLng) {
        var geocoder;
        if (!geocoder) {
          geocoder = new google.maps.Geocoder();
        }
        if (!window.marker) {
          window.marker = new google.maps.Marker({
            map: window.mapa
          });
        }
        window.marker.setPosition(latLng);
        req = {
          latLng: latLng
        };
        return geocoder.geocode(req, function(resultado, status) {
          var primero;
          primero = resultado[0];
          $("#geocomplete").val(primero.formatted_address);
          $("#lat_inf").val(primero.geometry.location.lat());
          return $("#lng_inf").val(primero.geometry.location.lng());
        });
      };
      $("#geocomplete").bind("geocode:dragged", function(event, latLng) {
        $("#lat_inf").val(latLng.lat());
        $("#lng_inf").val(latLng.lng());
        return $("#reset").show();
      });
      $("#geocomplete").geocomplete(options).bind("geocode:error", function(event, status) {
        return $.log("ERROR: " + status);
      });
      $("#geocomplete").geocomplete(options).bind("geocode:multiple", function(event, results) {
        return $.log("Multiple: " + results.length + " results found");
      });
      return $("#find").click(function() {
        return $("#geocomplete").trigger("geocode");
      });
    }
  };
});