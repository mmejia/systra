// Generated by CoffeeScript 1.6.3
define(['accidentes/IniciarListaPreliminar'], function() {
  var app, modules;
  modules = Array.prototype.slice.call(arguments);
  app = {
    iniciar: function() {
      var module, _i, _len;
      for (_i = 0, _len = modules.length; _i < _len; _i++) {
        module = modules[_i];
        module.iniciar();
      }
    }
  };
  return app;
});
