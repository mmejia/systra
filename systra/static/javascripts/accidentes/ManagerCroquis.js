// Generated by CoffeeScript 1.6.3
define(['../core/sandbox'], function(sandbox) {
  var app;
  return app = {
    sandbox: null,
    simbologia: null,
    iniciar: function(accidente) {
      this.sandbox = new sandbox(this);
      this.simbologia = $('#ta_simbologia_pp');
      this.sandbox.on('limpiar-croquis-view', this.limpiarCroquisView);
      this.sandbox.on('show-croquis-view', this.showCroquis);
      this.sandbox.on('vaciar-simbologia-view', this.vaciarSimbologia);
      this.sandbox.on('add-text-simbologia', this.appendSimbologia);
      return this.sandbox.on('llenar-accidente-simbologia', this.llenarAccidenteSimbologia);
    },
    llenarAccidenteSimbologia: function() {
      var accidente;
      accidente = window.accidente;
      accidente.simbologia_croquis = this.simbologia.val();
    },
    limpiarCroquisView: function() {
      $('#img_croquis').removeAttr('src');
      return $('#img_croquis').hide();
    },
    showCroquis: function() {
      return $('#img_croquis').show();
    },
    vaciarSimbologia: function() {
      return this.simbologia.val('');
    },
    appendSimbologia: function(data) {
      this.simbologia.val(data.contenido);
    }
  };
});