// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerMenuMain;
  return ManagerMenuMain = {
    iniciar: function() {
      var that;
      that = this;
      this.sandbox = new sandbox(this);
      this.sandbox.on('update-menu-inventarios-local', this.refrescarMenuInventariosLocal);
      this.sandbox.on('update-menu-inventarios-server', this.refrescarMenuInventariosServer);
      this.renderInventariosLocal();
      return this.renderInventariosServer();
    },
    refrescarMenuInventariosServer: function(inventarios) {
      var inventario, lis, that, ul, _i, _len;
      that = this;
      ul = $('#ul-inventario-server');
      lis = '<li class="nav-header">INVENTARIOS SERVER</li>';
      for (_i = 0, _len = inventarios.length; _i < _len; _i++) {
        inventario = inventarios[_i];
        lis += '<li><a href="#" id="' + inventario + '" class="liLoadInventariosServer">' + inventario + '</a></li>';
      }
      ul.html('');
      ul.append(lis);
      return $('.liLoadInventariosServer').on('click', function(event) {
        var id;
        id = event.target.id;
        return that.cargarLocalInventarioServer(id);
      });
    },
    refrescarMenuInventariosLocal: function(inventarios) {
      var inventario, lis, that, ul, _i, _len;
      that = this;
      ul = $('#ul-inventario-local');
      lis = '<li class="nav-header">INVENTARIOS LOCALES</li>';
      for (_i = 0, _len = inventarios.length; _i < _len; _i++) {
        inventario = inventarios[_i];
        lis += '<li><a href="#" id="' + inventario.folio_del_inventario + '" class="liLoadInventario">' + inventario.folio_del_inventario + '</a></li>';
      }
      ul.html('');
      ul.append(lis);
      return $('.liLoadInventario').on('click', function(event) {
        var id;
        id = event.target.id;
        return that.cargarLocalInventario(id);
      });
    },
    cargarLocalInventario: function(id) {
      var a_inventario, inv, inventario, that, _i, _len;
      that = this;
      inv = sessionStorage.getItem('inventariosl');
      a_inventario = JSON.parse(inv);
      for (_i = 0, _len = a_inventario.length; _i < _len; _i++) {
        inventario = a_inventario[_i];
        if (inventario.folio_del_inventario === id) {
          window.inventario = inventario;
          this.sandbox.emit('cargar-inventario-en-view');
          return;
        }
      }
    },
    renderInventariosLocal: function() {
      var a_inventarios, inventarios;
      inventarios = sessionStorage.getItem('inventariosl');
      if (inventarios) {
        a_inventarios = JSON.parse(inventarios);
        this.sandbox.emit('update-menu-inventarios-local', a_inventarios);
      }
    },
    renderInventariosServer: function() {
      var a_inventarios, inventarios;
      inventarios = sessionStorage.getItem('inventarios-server');
      if (inventarios) {
        a_inventarios = JSON.parse(inventarios);
        this.sandbox.emit('update-menu-inventarios-server', a_inventarios);
      }
    },
    cargarLocalInventarioServer: function(id) {
      var that;
      that = this;
      that.sandbox.emit('cargar-inventario-en-view-server', id);
    }
  };
});