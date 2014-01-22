// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerMenuMain;
  return ManagerMenuMain = {
    iniciar: function() {
      var that;
      this.sandbox = new sandbox(this);
      that = this;
      this.sandbox.on('update-menu-accidente-local', this.refrescarMenuAccidentesLocal);
      this.sandbox.on('update-menu-accidente-server', this.refrescarMenuAccidentesServer);
      this.renderAccidentesLocal();
      return this.renderAccidentesServer();
    },
    refrescarMenuAccidentesLocal: function(accidentes) {
      var accidente, div, lis, that, ul, _i, _len;
      that = this;
      div = $('#ul-accidente-local');
      div.html('<span> ACCIDENTES LOCALES</span>');
      ul = $('<ul></ul>');
      for (_i = 0, _len = accidentes.length; _i < _len; _i++) {
        accidente = accidentes[_i];
        lis = '<li><div class="item-menu-nice"><a href="#" id="' + accidente.folio_accidente + '" class="liLoadAccidente">' + accidente.folio_accidente + '</a><span>' + accidente.clasificacion + '</span><span>' + accidente.fecha + '</span></li>';
        ul.append(lis);
      }
      div.append(ul);
      return $('.liLoadAccidente').on('click', function(event) {
        var id;
        id = event.target.id;
        return that.cargarLocalAccidente(id);
      });
    },
    renderAccidentesLocal: function() {
      var a_accidentes, accidentes;
      accidentes = sessionStorage.getItem('accidentesl');
      if (accidentes) {
        a_accidentes = JSON.parse(accidentes);
        this.sandbox.emit('update-menu-accidente-local', a_accidentes);
      }
    },
    cargarLocalAccidente: function(id) {
      var a_accidente, acc, accidente, that, _i, _len;
      that = this;
      acc = sessionStorage.getItem('accidentesl');
      a_accidente = JSON.parse(acc);
      for (_i = 0, _len = a_accidente.length; _i < _len; _i++) {
        accidente = a_accidente[_i];
        if (accidente.folio_accidente === id) {
          window.accidente = accidente;
          this.sandbox.emit('cargar-accidente-en-view');
          return;
        }
      }
    },
    refrescarMenuAccidentesServer: function(accidentes) {
      var accidente, lis, that, ul, _i, _len;
      that = this;
      ul = $('#ul-accidente-server');
      lis = '<li class="nav-header">Accidentes SERVER</li>';
      for (_i = 0, _len = accidentes.length; _i < _len; _i++) {
        accidente = accidentes[_i];
        lis += '<li><a href="#" id="' + accidente + '" class="liLoadAccidenteServer">' + accidente + '</a></li>';
      }
      ul.html('');
      ul.append(lis);
      return $('.liLoadAccidenteServer').on('click', function(event) {
        var id;
        id = event.target.id;
        return that.cargarLocalAccidenteServer(id);
      });
    },
    renderAccidentesServer: function() {
      var a_accidentes, accidentes;
      accidentes = sessionStorage.getItem('accidentes-server');
      if (accidentes) {
        a_accidentes = JSON.parse(accidentes);
        this.sandbox.emit('update-menu-accidente-server', a_accidentes);
      }
    },
    cargarLocalAccidenteServer: function(id) {
      var that;
      that = this;
      that.sandbox.emit('cargar-accidente-en-view-server', id);
    }
  };
});