// Generated by CoffeeScript 1.6.3
define(['inventario/IniciarInventario'], function() {
  var app, modules;
  modules = Array.prototype.slice.call(arguments);
  return app = {
    iniciar: function() {
      var module, _i, _len;
      for (_i = 0, _len = modules.length; _i < _len; _i++) {
        module = modules[_i];
        module.iniciar();
      }
    }
  };
});
