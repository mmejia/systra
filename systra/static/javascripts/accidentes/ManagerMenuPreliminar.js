// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerMenuMain;
  return ManagerMenuMain = {
    iniciar: function() {
      var that;
      this.sandbox = new sandbox(this);
      that = this;
      this.sandbox.on('update-menu-preliminar-server', this.refrescarMenuPreliminarServer);
      $(".trigger").click(function() {
        $(".panel").toggle("fast");
        $(this).toggleClass("active");
        return false;
      });
      return this.renderPreliminaresServer();
    },
    refrescarMenuPreliminarServer: function(preliminares) {
      var lis, preliminar, that, ul, _i, _len, _results;
      that = this;
      ul = $('#ul-preliminares');
      ul.html('');
      lis = '<li class="nav-header">PRELIMINARES SERVER</li>';
      ul.append(lis);
      _results = [];
      for (_i = 0, _len = preliminares.length; _i < _len; _i++) {
        preliminar = preliminares[_i];
        lis = '<li><div class="item-menu-nice"><div class="linea"><a href="#" id="' + preliminar.id + '" class="liLoadAccidente">' + preliminar.numero_de_folio + '</a></div><div class="linea"><span>' + preliminar.tipo_de_evento + '</span></div></li>';
        ul.append(lis);
        _results.push($('#' + preliminar.id).on('click', function(event) {
          var id;
          id = event.currentTarget.id;
          return that.cargarLocalPreliminarServer(id);
        }));
      }
      return _results;
    },
    renderPreliminaresServer: function() {
      var a_preliminares, preliminares;
      preliminares = sessionStorage.getItem('preliminares-server');
      console.log(preliminares);
      if (preliminares) {
        a_preliminares = JSON.parse(preliminares);
        this.sandbox.emit('update-menu-preliminar-server', a_preliminares);
      }
    },
    cargarLocalPreliminarServer: function(id) {
      var that;
      that = this;
      that.sandbox.emit('cargar-preliminar-en-view-from-server', id);
    }
  };
});