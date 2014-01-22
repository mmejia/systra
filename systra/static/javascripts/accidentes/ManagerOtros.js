// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerOtros;
  return ManagerOtros = {
    sandbox: null,
    dialogo: null,
    iniciar: function() {
      var btnAceptarDanos, btnAgregar, btnCancelarDanos, that;
      this.sandbox = new sandbox(this);
      that = this;
      this.llenarVisibilidades();
      this.llenarParteDias();
      this.llenarTipoCalles();
      this.llenarNoCarriles();
      this.llenarSentidos();
      this.llenarAlineaciones();
      this.llenarEstadoCalles();
      this.llenarClimas();
      this.llenarRegulaciones();
      this.llenarObjetosDanados();
      btnAgregar = $('#agregar_danos');
      btnAgregar.on('click', function() {
        return that.showCapturarDanos();
      });
      btnCancelarDanos = $('#cancelar-danos');
      btnCancelarDanos.on('click', function() {
        return that.cancelarCapturaDanos();
      });
      btnAceptarDanos = $('#aceptar-danos');
      btnAceptarDanos.on('click', function() {
        return that.aceptarDanos();
      });
      this.sandbox.on('show-otros-view', this.mostrarOtrosOnview);
      this.sandbox.on('refresca-tabla-danos', this.refrescarTablaDanos);
      this.sandbox.on('llenar-otros-window', this.actualizarOtros);
      return this.sandbox.on('borrar-otros-view', this.cancelar);
    },
    eliminarDano: function(ident) {
      var danos;
      danos = window.accidente.danos;
      danos.splice(ident, 1);
      return this.refrescarTablaDanos();
    },
    aceptarDanos: function() {
      var accidente, dano, danos;
      if (!this.validateFieldDanos()) {
        return;
      }
      accidente = window.accidente;
      danos = [];
      if (accidente.danos === void 0) {
        danos = accidente.danos = [];
      }
      danos = accidente.danos;
      dano = {};
      dano.obj = $('#objetos_danados_o').val();
      dano.tipo = $('#tipo_danos_o').val();
      dano.dueno = $('#dueno_o').val();
      dano.monto = $('#monto_danos_o').val();
      danos = this.agregarDanoArreglo(danos, dano);
      accidente.danos = danos;
      this.refrescarTablaDanos();
      return this.cancelarCapturaDanos();
    },
    agregarDanoArreglo: function(arr, dn) {
      var ban, clone, dano, i, _i, _len;
      clone = arr.slice(0);
      ban = false;
      for (i = _i = 0, _len = clone.length; _i < _len; i = ++_i) {
        dano = clone[i];
        if (dano.obj === dn.obj) {
          arr[i] = dn;
          ban = true;
        }
      }
      if (!ban) {
        arr.push(dn);
      }
      return arr;
    },
    vaciarTabla: function() {
      var tabla;
      tabla = $("#tab_otros>tbody");
      return tabla.empty();
    },
    refrescarTablaDanos: function() {
      var dano, danos, i, legenda, row, tabla, tam, that, txt, _i, _len;
      that = this;
      tabla = $("#tab_otros > tbody");
      tabla.empty();
      danos = accidente.danos;
      for (i = _i = 0, _len = danos.length; _i < _len; i = ++_i) {
        dano = danos[i];
        if (dano) {
          row = "<tr>						<td><a href=\"#tab_danos\" id=\"tdEliminar_" + i + "\" class=\"danoEliminar\"><i class='icon-remove'></i></a>							<a href=\"#editar_danos\" id=\"tdActualizar_" + i + "\" class=\"danoActualizar\"><i class='icon-edit'></i></a></td>						<td>" + dano.obj + "</td>						<td>" + dano.tipo + "</td>						<td>" + dano.dueno + "</td>						<td>" + dano.monto + "</td>						</tr>";
          tabla.append(row);
          $("#tdActualizar_" + i).on('click', function(evento) {
            var her, id;
            console.log(evento);
            id = evento.currentTarget.id;
            her = id.split('_');
            that.showDanoOnView(her[1]);
            return that.showCapturarDanos();
          });
          $("#tdEliminar_" + i).on('click', function(evento) {
            var her, id;
            id = evento.currentTarget.id;
            her = id.split('_');
            return that.eliminarDano(her[1]);
          });
        }
      }
      tam = window.accidente.danos.length;
      legenda = $("#num_danos");
      txt = "Daños acumulados" + '(<span class="indicador">' + tam + "</span>)";
      legenda.html(txt);
    },
    showDanoOnView: function(ident) {
      var dano, danos;
      danos = window.accidente.danos;
      dano = danos[ident];
      $('#objetos_danados_o').val(dano.obj);
      $('#tipo_danos_o').val(dano.tipo);
      $('#dueno_o').val(dano.dueno);
      return $('#monto_danos_o').val(dano.monto);
    },
    showCapturarDanos: function() {
      var cambios, cambiosTabla, el, tabla;
      el = $("#capturaDanos");
      tabla = $("#tab_otros_view");
      cambios = {
        height: "auto",
        width: "100%"
      };
      el.css(cambios);
      cambiosTabla = {
        height: "0px",
        width: "0%"
      };
      return tabla.css(cambiosTabla);
    },
    mostrarTabla: function() {
      var cambios, cambiosTabla, el, tabla;
      el = $("#capturaDanos");
      tabla = $("#tab_otros_view");
      cambios = {
        height: "0px",
        width: "0%"
      };
      el.css(cambios);
      cambiosTabla = {
        height: "auto",
        width: "100%"
      };
      return tabla.css(cambiosTabla);
    },
    cancelarCapturaDanos: function() {
      $('#objetos_danados_o').val('');
      $('#tipo_danos_o').val('');
      $('#dueno_o').val('');
      $('#monto_danos_o').val('');
      return this.mostrarTabla();
    },
    validateFieldDanos: function() {
      if ($('#objetos_danados_o').val() === 'SEL') {
        this.showFieldError($("#objetos_danados_o"), "Es necesario seleccionar el objeto dañado");
        return false;
      } else {
        this.showFieldSuccess($("#objetos_danados_o"));
      }
      if ($('#tipo_danos_o').val() === '') {
        this.showFieldError($("#tipo_danos_o"), "Es necesario seleccionar el tipo de daño");
        return false;
      } else {
        this.showFieldSuccess($("#tipo_danos_o"));
      }
      if ($('#dueno_o').val() === '') {
        this.showFieldError($("#dueno_o"), "Es necesario seleccionar nombre del dueño");
        return false;
      } else {
        this.showFieldSuccess($("#dueno_o"));
      }
      if ($('#monto_danos_o').val() === '') {
        this.showFieldError($("#monto_danos_o"), "Es necesario seleccionar el monto aprox");
        return false;
      } else {
        this.showFieldSuccess($("#monto_danos_o"));
      }
      this.quitarClasesDanos();
      return true;
    },
    mostrarTab: function() {
      return $('#complementarios_pp li:eq(1) a').tab('show');
    },
    validateFieldOtros: function() {
      if ($('#alumbrado_publico_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#alumbrado_publico_o"), "Es necesario establecer la visibilidad");
        return false;
      } else {
        this.showFieldSuccess($("#alumbrado_publico_o"));
      }
      if ($('#parte_dia_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#parte_dia_o"), "Es necesario establecer parte del día");
        return false;
      } else {
        this.showFieldSuccess($("#parte_dia_o"));
      }
      if ($('#tipo_calle_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#tipo_calle_o"), "Es necesario establecer el tipo de calle");
        return false;
      } else {
        this.showFieldSuccess($("#tipo_calle_o"));
      }
      if ($('#no_carriles_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#no_carriles_o"), "Es necesario establecer el número de carriles");
        return false;
      } else {
        this.showFieldSuccess($("#no_carriles_o"));
      }
      if ($('#sentido_calle_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#sentido_calle_o"), "Es necesario establecer el sentido de las calles");
        return false;
      } else {
        this.showFieldSuccess($("#sentido_calle_o"));
      }
      if ($('#alineacion_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#alineacion_o"), "Es necesario establecer la alineacion");
        return false;
      } else {
        this.showFieldSuccess($("#alineacion_o"));
      }
      if ($('#estado_pavimento_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#estado_pavimento_o"), "Es necesario establecer el estado del pavimento");
        return false;
      } else {
        this.showFieldSuccess($("#estado_pavimento_o"));
      }
      if ($('#clima_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#clima_o"), "Es necesario establecer el clima");
        return false;
      } else {
        this.showFieldSuccess($("#clima_o"));
      }
      if ($('#regulacion_o').val() === 'SEL') {
        this.mostrarTab();
        this.showFieldError($("#regulacion_o"), "Es necesario establecer la regulación");
        return false;
      } else {
        this.showFieldSuccess($("#regulacion_o"));
      }
      this.quitarClasesOtros();
      return true;
    },
    quitarClasesOtros: function() {
      $(".otros-v").removeClass("success");
      return $(".otros-v").removeClass("error");
    },
    quitarClasesDanos: function() {
      $(".danos-v").removeClass("success");
      return $(".danos-v").removeClass("error");
    },
    showFieldError: function(item, msg) {
      var padre;
      padre = item.parents("div.control-group");
      padre.addClass('error');
      padre.children('.help-inline').html(msg);
      return item.focus();
    },
    showFieldSuccess: function(item) {
      var padre;
      padre = item.parents("div.control-group");
      padre.addClass('success');
      return padre.children('.help-inline').html('');
    },
    cancelar: function() {
      $('#alumbrado_publico_o').val('');
      $('#parte_dia_o').val('');
      $('#tipo_calle_o').val('');
      $('#no_carriles_o').val('');
      $('#sentido_calle_o').val('');
      $('#alineacion_o').val('');
      $('#estado_pavimento_o').val('');
      $('#clima_o').val('');
      $('#regulacion_o').val('');
      return this.vaciarTabla();
    },
    actualizarOtros: function() {
      var estado_calles, otros;
      otros = window.accidente.otros = {};
      estado_calles = window.accidente.estado_calles = {};
      otros.visibilida = $('#alumbrado_publico_o').val();
      otros.parte_dia = $('#parte_dia_o').val();
      otros.tipo_calle = $('#tipo_calle_o').val();
      otros.no_carriles = $('#no_carriles_o').val();
      otros.sentido_calle = $('#sentido_calle_o').val();
      estado_calles.alineacion = $('#alineacion_o').val();
      estado_calles.estado_pavimento = $('#estado_pavimento_o').val();
      estado_calles.clima = $('#clima_o').val();
      return estado_calles.regulacion = $('#regulacion_o').val();
    },
    mostrarOtrosOnview: function() {
      var estado_calles, otros;
      if (!window.accidente.otros) {
        window.accidente.otros = {};
      }
      if (!window.accidente.estado_calles) {
        window.accidente.estado_calles = {};
      }
      if (!window.accidente.danos) {
        window.accidente.danos = [];
      }
      otros = window.accidente.otros;
      estado_calles = window.accidente.estado_calles;
      $('#alumbrado_publico_o').val(otros.visibilida);
      $('#parte_dia_o').val(otros.parte_dia);
      $('#tipo_calle_o').val(otros.tipo_calle);
      $('#no_carriles_o').val(otros.no_carriles);
      $('#sentido_calle_o').val(otros.sentido_calle);
      $('#alineacion_o').val(estado_calles.alineacion);
      $('#estado_pavimento_o').val(estado_calles.estado_pavimento);
      $('#clima_o').val(estado_calles.clima);
      $('#regulacion_o').val(estado_calles.regulacion);
      return this.refrescarTablaDanos();
    },
    llenarVisibilidades: function() {
      var ctl_visibilidades, opciones, visibilidad, _i, _len, _ref;
      if (!window.visibilidades) {
        cargarVisibilidades(this.llenarVisibilidades);
      } else {
        ctl_visibilidades = $('#alumbrado_publico_o');
        ctl_visibilidades.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.visibilidades;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          visibilidad = _ref[_i];
          opciones += '<option value="' + visibilidad.descripcion + '">' + visibilidad.descripcion + '</option>';
        }
        ctl_visibilidades.append(opciones);
      }
    },
    llenarParteDias: function() {
      var ctl_parteDias, opciones, parteDia, _i, _len, _ref;
      if (!window.parteDias) {
        cargarParteDias(this.llenarParteDias);
      } else {
        ctl_parteDias = $('#parte_dia_o');
        ctl_parteDias.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.parteDias;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          parteDia = _ref[_i];
          opciones += '<option value="' + parteDia.descripcion + '">' + parteDia.descripcion + '</option>';
        }
        ctl_parteDias.append(opciones);
      }
    },
    llenarTipoCalles: function() {
      var ctl_tipoCalles, opciones, tipoCalle, _i, _len, _ref;
      if (!window.tipoCalles) {
        cargarTipoCalles(this.llenarTipoCalles);
      } else {
        ctl_tipoCalles = $('#tipo_calle_o');
        ctl_tipoCalles.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.tipoCalles;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          tipoCalle = _ref[_i];
          opciones += '<option value="' + tipoCalle.descripcion_tipo + '">' + tipoCalle.descripcion_tipo + '</option>';
        }
        ctl_tipoCalles.append(opciones);
      }
    },
    llenarNoCarriles: function() {
      var ctl_noCarriles, noCarriles, opciones, _i, _len, _ref;
      if (!window.noCarriles) {
        cargarNoCarriles(this.llenarNoCarriles);
      } else {
        ctl_noCarriles = $('#no_carriles_o');
        ctl_noCarriles.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.noCarriles;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          noCarriles = _ref[_i];
          opciones += '<option value="' + noCarriles.carriles + '">' + noCarriles.carriles + '</option>';
        }
        ctl_noCarriles.append(opciones);
      }
    },
    llenarSentidos: function() {
      var ctl_sentidos, opciones, sentido, _i, _len, _ref;
      if (!window.sentidos) {
        cargarSentidos(this.llenarSentidos);
      } else {
        ctl_sentidos = $('#sentido_calle_o');
        ctl_sentidos.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.sentidos;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          sentido = _ref[_i];
          opciones += '<option value="' + sentido.sentido + '">' + sentido.sentido + '</option>';
        }
        ctl_sentidos.append(opciones);
      }
    },
    llenarAlineaciones: function() {
      var alineacion, ctl_alineaciones, opciones, _i, _len, _ref;
      if (!window.alineaciones) {
        cargarAlineaciones(this.llenarAlineaciones);
      } else {
        ctl_alineaciones = $('#alineacion_o');
        ctl_alineaciones.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.alineaciones;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          alineacion = _ref[_i];
          opciones += '<option value="' + alineacion.alicamino + '">' + alineacion.alicamino + '</option>';
        }
        ctl_alineaciones.append(opciones);
      }
    },
    llenarEstadoCalles: function() {
      var ctl_estadoCalles, estadoCalle, opciones, _i, _len, _ref;
      if (!window.estadoCalles) {
        cargarEstadoCalles(this.llenarEstadoCalles);
      } else {
        ctl_estadoCalles = $('#estado_pavimento_o');
        ctl_estadoCalles.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.estadoCalles;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          estadoCalle = _ref[_i];
          opciones += '<option value="' + estadoCalle.estado + '">' + estadoCalle.estado + '</option>';
        }
        ctl_estadoCalles.append(opciones);
      }
    },
    llenarClimas: function() {
      var clima, ctl_climas, opciones, _i, _len, _ref;
      if (!window.climas) {
        cargarClimas(this.llenarClimas);
      } else {
        ctl_climas = $('#clima_o');
        ctl_climas.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.climas;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          clima = _ref[_i];
          opciones += '<option value="' + clima.clima + '">' + clima.clima + '</option>';
        }
        ctl_climas.append(opciones);
      }
    },
    llenarRegulaciones: function() {
      var ctl_regulaciones, opciones, regulacion, _i, _len, _ref;
      if (!window.regulaciones) {
        cargarRegulaciones(this.llenarRegulaciones);
      } else {
        ctl_regulaciones = $('#regulacion_o');
        ctl_regulaciones.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.regulaciones;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          regulacion = _ref[_i];
          opciones += '<option value="' + regulacion.descripcion + '">' + regulacion.descripcion + '</option>';
        }
        ctl_regulaciones.append(opciones);
      }
    },
    llenarObjetosDanados: function() {
      var ctl_objetos_danados, objetosDanado, opciones, _i, _len, _ref;
      if (!window.objetosDanados) {
        cargarObjetosDanados(this.llenarObjetosDanados);
      } else {
        ctl_objetos_danados = $('#objetos_danados_o');
        ctl_objetos_danados.html("");
        opciones = '<option  value="SEL">**SELECCIONAR**</option>';
        _ref = window.objetosDanados;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          objetosDanado = _ref[_i];
          opciones += '<option value="' + objetosDanado.descripcion + '">' + objetosDanado.descripcion + '</option>';
        }
        ctl_objetos_danados.append(opciones);
      }
    }
  };
});