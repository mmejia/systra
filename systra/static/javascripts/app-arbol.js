// Generated by CoffeeScript 1.6.3
define(['infracciones/arbol/IniciarArbol'], function() {
  var app, modules;
  modules = Array.prototype.slice.call(arguments);
  app = {
    iniciar: function() {
      var module, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = modules.length; _i < _len; _i++) {
        module = modules[_i];
        _results.push(module.iniciar());
      }
      return _results;
    }
  };
  return app;
});
