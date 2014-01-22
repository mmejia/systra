// Generated by CoffeeScript 1.6.3
define(['/static/javascripts/core/sandbox.js'], function(sandbox) {
  var IniciaMain;
  ({
    tpl_noticia: null
  });
  return IniciaMain = {
    iniciar: function() {
      var that;
      that = this;
      this.sandbox = new sandbox(this);
      that.llenarDelegaciones();
      that.llenarComandancias();
      that.llenarTurnos();
      that.iniciarPickeColor();
    },
    iniciarPickeColor: function() {
      return $('.pick-a-color').pickAColor({
        showSpectrum: true,
        showSavedColors: true,
        saveColorsPerElement: true,
        fadeMenuToggle: true,
        showAdvanced: true,
        showBasicColors: true,
        showHexInput: true,
        allowBlank: true
      });
    },
    llenarDelegaciones: function() {
      var delegacion, opciones, sel, _i, _len, _ref;
      if (!window.delegaciones) {
        window.cargarDelegaciones(this.llenarDelegaciones);
      } else {
        sel = $('#perf_delegacion').empty();
        opciones = '<option  value="NO">**SELECCIONAR**</option>';
        _ref = window.delegaciones;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          delegacion = _ref[_i];
          opciones += '<option value="' + delegacion.delegacion + '">' + delegacion.delegacion + '</option>';
        }
        sel.append(opciones);
      }
    },
    llenarComandancias: function() {
      var comandancia, opciones, sel, _i, _len, _ref;
      if (!window.comandancias) {
        window.cargarComandancias(this.llenarComandancias);
      } else {
        sel = $('#perf_comandancia').empty();
        opciones = '<option  value="NO">**SELECCIONAR**</option>';
        _ref = window.comandancias;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          comandancia = _ref[_i];
          opciones += '<option value="' + comandancia.comandancia + '">' + comandancia.comandancia + '</option>';
        }
        sel.append(opciones);
      }
    },
    llenarComandancias: function() {
      var comandancia, opciones, sel, _i, _len, _ref;
      if (!window.comandancias) {
        window.cargarComandancias(this.llenarComandancias);
      } else {
        sel = $('#perf_comandancia').empty();
        opciones = '<option  value="NO">**SELECCIONAR**</option>';
        _ref = window.comandancias;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          comandancia = _ref[_i];
          opciones += '<option value="' + comandancia.comandancia + '">' + comandancia.comandancia + '</option>';
        }
        sel.append(opciones);
      }
    },
    llenarTurnos: function() {
      var opciones, sel, turno, _i, _len, _ref;
      if (!window.turnos) {
        return cargarTurnos(this.llenarTurnos);
      } else {
        sel = $('#perf_turno').html("");
        opciones = '<option  value="NO">**SELECCIONAR**</option>';
        _ref = window.turnos;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          turno = _ref[_i];
          opciones += '<option value="' + turno.turno + '">' + turno.turno + '</option>';
        }
        sel.append(opciones);
      }
    }
  };
});
