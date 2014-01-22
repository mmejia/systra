// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var IniciarLibera;
  return IniciarLibera = {
    susmedios: null,
    particular: null,
    transito: null,
    personaFisica: null,
    personaMoral: null,
    factura_fisica: null,
    titulo_propiedad_fisica: null,
    tarjeta_circulacion_fisica: null,
    refrendo_fisica: null,
    carta_factura_fisica: null,
    cred_electoral_fisica: null,
    cartilla_fisica: null,
    licencia_conductor_fisica: null,
    cedula_fisica: null,
    pasaporte_fisica: null,
    factura_moral: null,
    titulo_propiedad_moral: null,
    tarjeta_circulacion_moral: null,
    carta_factura_moral: null,
    rd_documentos_moral_legal: null,
    rd_documentos_moral_diversa: null,
    cred_electoral_moral: null,
    cartilla_moral1: null,
    licencia_conductor_moral1: null,
    cedula_moral1: null,
    pasaporte_moral1: null,
    carta_poder_moral1: null,
    cred_electoral_moral1: null,
    cartilla_moral1: null,
    licencia_conductor_moral1: null,
    iniciar: function() {
      var personaFisica, personaMoral, that;
      that = this;
      this.iniciarSpiner();
      this.susmedios = document.getElementById("susmedios");
      this.grua = document.getElementById("grua");
      this.particular = document.getElementById("particular");
      this.transito = document.getElementById("transito");
      personaFisica = document.getElementById("personaFisica");
      personaMoral = document.getElementById("personaMoral");
      this.factura_fisica = document.getElementById("factura_fisica");
      this.titulo_propiedad_fisica = document.getElementById("titulo_propiedad_fisica");
      this.tarjeta_circulacion_fisica = document.getElementById("tarjeta_circulacion_fisica");
      this.refrendo_fisica = document.getElementById("refrendo_fisica");
      this.carta_factura_fisica = document.getElementById("carta_factura_fisica");
      this.cred_electoral_fisica = document.getElementById("cred_electoral_fisica");
      this.cartilla_fisica = document.getElementById("cartilla_fisica");
      this.licencia_conductor_fisica = document.getElementById("licencia_conductor_fisica");
      this.cedula_fisica = document.getElementById("cedula_fisica");
      this.pasaporte_fisica = document.getElementById("pasaporte_fisica");
      this.factura_moral = document.getElementById("factura_moral");
      this.titulo_propiedad_moral = document.getElementById("titulo_propiedad_moral");
      this.tarjeta_circulacion_moral = document.getElementById("tarjeta_circulacion_moral");
      this.carta_factura_moral = document.getElementById("carta_factura_moral");
      this.rd_documentos_moral_legal = document.getElementById("rd_documentos_moral_legal");
      this.rd_documentos_moral_diversa = document.getElementById("rd_documentos_moral_diversa");
      this.cred_electoral_moral = document.getElementById("cred_electoral_moral1");
      this.cartilla_moral1 = document.getElementById("cartilla_moral1");
      this.licencia_conductor_moral1 = document.getElementById("licencia_conductor_moral1");
      this.cedula_moral1 = document.getElementById("cedula_moral1");
      this.pasaporte_moral1 = document.getElementById("pasaporte_moral1");
      this.carta_poder_moral1 = document.getElementById("carta_poder_moral1");
      this.cred_electoral_moral1 = document.getElementById("cred_electoral_moral1");
      this.cartilla_moral1 = document.getElementById("cartilla_moral1");
      this.licencia_conductor_moral1 = document.getElementById("licencia_conductor_moral1");
      this.llenarInventario();
      this.iniciarCalendario();
      this.llenarDefaultFecha();
      this.iniciarVentanaReportePdf();
      $('#liberar').on('click', function(evento) {
        return that.guardarLiberacion();
      });
      $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
      });
      $('#personaFisica').on('click', function(evento) {
        var obj;
        obj = evento.currentTarget;
        if (obj.checked === true) {
          that.showDocumentosFisico();
          return that.ocultarDocumentosMoral();
        }
      });
      $('#personaMoral').on('click', function(evento) {
        var obj;
        obj = evento.currentTarget;
        if (obj.checked === true) {
          that.showDocumentosMoral();
          return that.ocultarDocumentosFisico();
        }
      });
      $('#rd_documentos_moral_legal').on('click', function(evento) {
        var obj;
        obj = evento.currentTarget;
        if (obj.checked === true) {
          that.showDocumentosSubMoralLegal();
          return that.ocultarDocumentosSubMoralDiversa();
        }
      });
      $('#rd_documentos_moral_diversa').on('click', function(evento) {
        var obj;
        obj = evento.currentTarget;
        if (obj.checked === true) {
          that.ocultarDocumentosSubMoralLegal();
          return that.showDocumentosSubMoralDiversa();
        }
      });
      window.spinner.stop();
      return $("#folio_inventario").change(function() {
        var id;
        id = $(this).val();
        return that.cargarInventarioOnSelect(id);
      });
    },
    showMensaje: function(titulo, msg) {
      var $div;
      $div = $('#myModal .modal-body').html(msg);
      $("#myModal").modal('show');
      return $('#myModalLabel').html(titulo);
    },
    showDocumentosFisico: function() {
      var cambios, el;
      el = $("#documentos_fisica");
      cambios = {
        height: "auto",
        width: "100%"
      };
      return el.css(cambios);
    },
    showDocumentosMoral: function() {
      var cambios, el;
      el = $("#documentos_moral");
      cambios = {
        height: "auto",
        width: "100%"
      };
      return el.css(cambios);
    },
    iniciarSpiner: function() {
      var opts, target;
      opts = {
        lines: 13,
        length: 20,
        width: 10,
        radius: 30,
        corners: 1,
        rotate: 0,
        direction: 1,
        color: '#000',
        speed: 1,
        trail: 60,
        shadow: false,
        hwaccel: false,
        className: 'spinner',
        zIndex: 2e9,
        top: 'auto',
        left: 'auto'
      };
      target = document.getElementById('loading');
      window.spinner = new Spinner(opts).spin(target);
      return target.appendChild(window.spinner.el);
    },
    ocultarDocumentosFisico: function() {
      var cambios, el;
      el = $("#documentos_fisica");
      cambios = {
        height: "0px",
        width: "0px"
      };
      return el.css(cambios);
    },
    ocultarDocumentosMoral: function() {
      var cambios, el;
      el = $("#documentos_moral");
      cambios = {
        height: "0px",
        width: "0px"
      };
      return el.css(cambios);
    },
    showDocumentosSubMoralLegal: function() {
      var cambios, el;
      el = $("#documentos-sub-moral-legal");
      cambios = {
        height: "auto",
        width: "100%"
      };
      return el.css(cambios);
    },
    showDocumentosSubMoralDiversa: function() {
      var cambios, el;
      el = $("#documentos-sub-moral-diversa");
      cambios = {
        height: "auto",
        width: "100%"
      };
      return el.css(cambios);
    },
    ocultarDocumentosSubMoralLegal: function() {
      var cambios, el;
      el = $("#documentos-sub-moral-legal");
      cambios = {
        height: "0px",
        width: "0px"
      };
      return el.css(cambios);
    },
    ocultarDocumentosSubMoralDiversa: function() {
      var cambios, el;
      el = $("#documentos-sub-moral-diversa");
      cambios = {
        height: "0px",
        width: "0px"
      };
      return el.css(cambios);
    },
    showReportePdf: function() {
      var datos, that;
      that = this;
      this.actualizarInventario();
      datos = {
        data: JSON.stringify(window.inventario)
      };
      console.log(JSON.stringify(window.inventario));
      $.ajax({
        type: "POST",
        url: '/inventario/ventana_reporte/',
        dataType: 'html',
        data: datos,
        success: function(res) {
          return that.showMensaje("Reporte para imprimir", res);
        }
      });
    },
    cancelar: function() {
      return console.log("Vamos a cancelar el asunto");
    },
    guardarLiberacion: function() {
      this.actualizarInventario();
      window.inventario.id = window.cadena.inventario[0].pk;
      console.log(window.cadena.inventario);
      console.log(JSON.stringify(window.inventario));
      return $.post('/inventario/crear_liberar', window.inventario, function(data) {});
    },
    actualizarInventario: function() {
      var cad, inv;
      inv = window.inventario;
      inv.liberacion_fecha = $('#fecha_liberacion').val();
      inv.liberacion_hora = $('#hora_lib').val();
      inv.liberacion_lugar = $('#lugar_liberacion').val();
      inv.recibo_pago = $('#no_recibo').val();
      if (personaFisica.checked === true) {
        cad = '';
        if (this.factura_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.titulo_propiedad_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.tarjeta_circulacion_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.refrendo_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.carta_factura_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cred_electoral_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cartilla_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.licencia_conductor_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cedula_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.pasaporte_fisica.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        inventario.persona_fisica = cad;
        inventario.persona_moral = '';
      } else {
        cad === '';
        if (this.rd_documentos_moral_legal.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.rd_documentos_moral_diversa.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cred_electoral_moral.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cartilla_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.licencia_conductor_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cedula_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.pasaporte_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.carta_poder_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cred_electoral_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.cartilla_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        if (this.licencia_conductor_moral1.checked === true) {
          cad = cad + '1';
        } else {
          cad = cad + '0';
        }
        inventario.persona_moral = cad;
        inventario.persona_fisica = '';
      }
      return inventario.liberacion_recibe = $('#liberacion_recibe').val();
    },
    iniciarVentanaReportePdf: function() {
      var that;
      that = this;
      return $("#generar_reporte_pp").on("click", function() {
        return that.showReportePdf();
      });
    },
    llenarInventario: function() {
      return this.cargarInventarioOnView();
    },
    iniciarCalendario: function() {
      $('#fecha-ingreso').datetimepicker({
        pickTime: false,
        language: 'es'
      });
      $('#fecha-liberacion').datetimepicker({
        pickTime: false,
        language: 'es'
      });
      $('#hora-ingreso').datetimepicker({
        pickDate: false,
        language: 'es'
      });
      return $('#hora-lib').datetimepicker({
        pickDate: false,
        language: 'es'
      });
    },
    cargarLiberacionOnview: function() {
      var inv;
      if (window.inventario !== void 0) {
        inv = window.inventario;
        $('#folio_inventario').val(inv.folio_inventario);
        $('#concepto').val(inv.motivo_de_recojimiento);
        $('#folio_infraccion').val(inv.folio_infraccion);
        $('#no_accidente').val(inv.folio_accidente);
        $('#calle1').val(inv.calle1);
        $('#exterior').val(inv.exterior);
        $('#interior').val(inv.interior);
        $('#calle2').val(inv.calle2);
        $('#colonia').val(inv.colonia);
        $('#depositado').val(inv.depositado_en);
        $('#marca').val(inv.marca);
        $('#tipo').val(inv.tipo);
        $('#modelo').val(inv.veh_modelo);
        $('#placas').val(inv.veh_placas);
        $('#color').val(inv.veh_color);
        $('#serie').val(inv.veh_serie);
        $('#conductor').val(inv.infractor_nombre + " " + inv.infractor_apepaterno + " " + inv.infractor_apematerno);
        $("#lugar_ingreso").val(inv.pension_lugar);
        $("#fecha_ingreso").val(inv.pension_fecha);
        $('#hora_ingreso').val(inv.pension_hora);
        $('#recibido_ingreso').val(inv.pension_recibido_por);
        if (inv.pension_transportado_por === 'Propios Medios') {
          this.susmedios.checked = true;
        } else if (inv.pension_transportado_por === 'Grua Particular') {
          this.grua.checked = true;
          $("#particular").val(inv.pension_transportado_pension);
        } else if (inv.pension_transportado_por === 'Grua Particular') {
          this.transito.checked = true;
          $("#numero_unidad").val(inv.pension_transportado_unidad_transito);
        }
        this.refrescarFrente();
        this.refrescarPosterior();
        return this.refrescarFotos();
      }
    },
    cargarInventarioOnSelect: function(id) {
      var that;
      that = this;
      return $.get('/inventario/get_inventario_con_otros/' + id + '/', function(data) {
        window.inventario = data;
        return that.cargarInventarioOnView();
      });
    },
    cargarInventarioOnView: function() {
      var inv;
      if (window.inventario !== void 0) {
        inv = window.inventario;
        $('#folio_inventario').html(inv.folio_del_inventario);
        $('#concepto').html(inv.motivo_de_recojimiento);
        $('#folio_infraccion').html(inv.folio_infraccion);
        $('#no_accidente').html(inv.folio_accidente);
        $('#calle1').html(inv.calle1);
        $('#exterior').html(inv.exterior);
        $('#interior').html(inv.interior);
        $('#calle2').html(inv.calle2);
        $('#colonia').html(inv.colonia);
        $('#depositado').html(inv.depositado_en);
        $('#marca').html(inv.marca);
        $('#tipo').html(inv.tipoveh);
        $('#modelo').html(inv.modelo);
        $('#placas').html(inv.placas);
        $('#color').html(inv.color);
        $('#serie').html(inv.serie);
        $('#conductor').html(inv.conductor_nombre + " " + inv.apellido_paterno + " " + inv.apellido_materno);
        $("#lugar_ingreso").html(inv.lugar);
        $("#fecha_ingreso").html(inv.fecha_entrada);
        $('#hora_ingreso').html(inv.hora_entrada);
        $('#recibido_ingreso').html(inv.recibido_por);
        if (inv.pension_transportado_por === 'Propios Medios') {
          this.susmedios.checked = true;
        } else if (inv.pension_transportado_por === 'Grua Particular') {
          this.grua.checked = true;
          $("#particular").val(inv.pension_transportado_pension);
        } else if (inv.pension_transportado_por === 'Grua Particular') {
          this.transito.checked = true;
          $("#numero_unidad").val(inv.pension_transportado_unidad_transito);
        }
        this.refrescarFrente();
        this.refrescarPosterior();
        return this.refrescarFotos();
      }
    },
    refrescarFrente: function() {
      var croquis, liga_frente;
      croquis = $('#img-frente');
      liga_frente = $('#liga-img-frente');
      if (inventario !== void 0 && inventario.frente !== void 0) {
        croquis.attr('src', '/content/content/' + window.inventario.frente.id);
        return liga_frente.attr('href', '/content/content/' + window.inventario.frente.id);
      }
    },
    llenarDefaultFecha: function() {
      var curr_date, curr_hora, curr_minuto, curr_month, curr_year, d, tt;
      d = new Date();
      curr_date = d.getDate();
      curr_month = d.getMonth() + 1;
      curr_year = d.getFullYear();
      curr_hora = d.getHours();
      curr_minuto = d.getMinutes();
      $("#fecha_liberacion").val(curr_year + "-" + curr_month + "-" + curr_date);
      tt = curr_hora + ":" + curr_hora;
      return $("#hora_lib").val(tt);
    },
    refrescarPosterior: function() {
      var croquis, liga_posterior;
      croquis = $('#img-posterior');
      liga_posterior = $('#liga-img-posterior');
      if (inventario !== void 0 && inventario.posterior !== void 0) {
        croquis.attr('src', '/content/content/' + window.inventario.posterior.id);
        return liga_posterior.attr('href', '/content/content/' + window.inventario.posterior.id);
      }
    },
    refrescarFotos: function() {
      var a, foto, fotos, galeria, img, _i, _len, _results;
      galeria = $('#links-fotos');
      galeria.html('');
      fotos = window.inventario.fotos;
      _results = [];
      for (_i = 0, _len = fotos.length; _i < _len; _i++) {
        foto = fotos[_i];
        a = $('<a></a>');
        a.addClass("muestra-img");
        a.attr('href', '/content/content/' + foto.id);
        a.attr('title', foto.nombre_archivo);
        a.attr('data-gallery', 'data-gallery');
        img = $('<img></img>');
        img.attr('src', '/content/content/' + foto.id);
        img.attr('alt', foto.nombre_archivo);
        a.append(img);
        _results.push(galeria.append(a));
      }
      return _results;
    }
  };
});