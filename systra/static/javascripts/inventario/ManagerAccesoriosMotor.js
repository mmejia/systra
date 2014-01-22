// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerAccesoriosMotor;
  return ManagerAccesoriosMotor = {
    iniciar: function() {
      this.sandbox = new sandbox(this);
      this.sandbox.on('cargar-accesorios-motor-view', this.mostrarManagerAccesoriosMotor);
      return this.sandbox.on('cancelar-accesorios-motor-view', this.cancelar);
    },
    mostrarManagerAccesoriosMotor: function() {
      var accMotor;
      accMotor = window.inventario.accesorios_del_motor;
      $('#accesorioMotor').val(accMotor.titulo);
      $('#carburador').val(accMotor.carburador);
      $('#claxon').val(accMotor.claxon);
      $('#bujias').val(accMotor.bujias);
      $('#tapaDist').val(accMotor.tapa_de_dist);
      $('#compresora').val(accMotor.compresora);
      $('#taponAceite').val(accMotor.tapon_de_aceite);
      $('#marca').val(accMotor.marca);
      $('#bobinaEncendido').val(accMotor.bobina_se_encendido);
      $('#radiador').val(accMotor.radiador);
      $('#equiposAdi').val(accMotor.equipos_adicionales);
      $('#filtroAire').val(accMotor.filtro_de_aire);
      $('#bayonetaAceite').val(accMotor.bayoneta_de_aceite);
      $('#genAlter').val(accMotor.gen_alernador);
      $('#marcha').val(accMotor.marcha);
      $('#bateria').val(accMotor.bateria);
      $('#bandas').val(accMotor.bandas);
      $('#calefaccion').val(accMotor.calefaccion);
      return $('#mangueras').val(accMotor.mangueras);
    },
    cancelar: function() {
      $('#accesorioMotor').val('');
      $('#carburador').val('');
      $('#claxon').val('');
      $('#bujias').val('');
      $('#tapaDist').val('');
      $('#compresora').val('');
      $('#taponAceite').val('');
      $('#marca').val('');
      $('#bobinaEncendido').val('');
      $('#radiador').val('');
      $('#equiposAdi').val('');
      $('#filtroAire').val('');
      $('#bayonetaAceite').val('');
      $('#genAlter').val('');
      $('#marcha').val('');
      $('#bateria').val('');
      $('#bandas').val('');
      $('#calefaccion').val('');
      return $('#mangueras').val('');
    },
    actualizarAccesoriosMotor: function() {
      var managerAccesoriosMotor;
      managerAccesoriosMotor = window.accesorios_del_motor;
      managerAccesoriosMotor.titulo = $("#accesorioMotor");
      managerAccesoriosMotor.carburador = $("#carburador");
      managerAccesoriosMotor.tapa_de_dist = $("#tapaDist");
      managerAccesoriosMotor.marca = $("#marca");
      managerAccesoriosMotor.equipos_adicionales = $("#equiposAdi");
      managerAccesoriosMotor.gen_alernador = $("genAlter");
      managerAccesoriosMotor.bandas = $("#bandas");
      managerAccesoriosMotor.claxon = $("#claxon");
      managerAccesoriosMotor.compresora = $("#compresora");
      managerAccesoriosMotor.bobina_se_encendido = $("#bobinaEncendido");
      managerAccesoriosMotor.filtro_de_aire = $("#filtroAire");
      managerAccesoriosMotor.marcha = $("#marcha");
      managerAccesoriosMotor.calefaccion = $("#calefaccion");
      managerAccesoriosMotor.bujias = $("#bujias");
      managerAccesoriosMotor.tapon_de_aceite = $("#taponAceite");
      managerAccesoriosMotor.radiador = $("#radiador");
      managerAccesoriosMotor.bayoneta_de_aceite = $("#bayonetaAceite");
      managerAccesoriosMotor.bateria = $("#bateria");
      return managerAccesoriosMotor.mangueras = $("#mangueras");
    }
  };
});