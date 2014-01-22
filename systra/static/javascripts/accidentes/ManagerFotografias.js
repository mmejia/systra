// Generated by CoffeeScript 1.6.3
define(['../core/sandbox'], function(sandbox) {
  var app;
  return app = {
    sandbox: null,
    iniciar: function(accidente) {
      this.sandbox = new sandbox(this);
      this.sandbox.on('cargar-lista-fotografias', this.cargarListaFotografias);
      return this.sandbox.on('show-foto-actual', this.showImagen);
    },
    showImagen: function(id) {
      $('.item-galeria').hide();
      return $('#div_' + id).show();
    },
    cargarListaFotografias: function() {
      var foto, fotos, id, opciones, that, ulFotos, _i, _len;
      that = this;
      if (window.accidente) {
        if (window.accidente.fotos) {
          fotos = window.accidente.fotos;
          ulFotos = $('#ligaFotos');
          ulFotos.html('');
          console.log(fotos);
          opciones = '';
          for (_i = 0, _len = fotos.length; _i < _len; _i++) {
            foto = fotos[_i];
            id = foto.id;
            opciones += '<li><a href="#ff" id="foto_' + id + '" class="selectFoto"><img class="fotitos"  src="/content/content/' + id + '"> </a></li>';
          }
          opciones += '';
          ulFotos.append(opciones);
          return $('.selectFoto').on('click', function(evento) {
            var her, id_foto;
            id = evento.currentTarget.id;
            her = id.split('_');
            id_foto = her[1];
            return that.showImagen(id_foto);
          });
        }
      }
    }
  };
});
