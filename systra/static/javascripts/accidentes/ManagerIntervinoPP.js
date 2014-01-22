// Generated by CoffeeScript 1.6.3
define(['core/sandbox'], function(sandbox) {
  var ManagerIntervinoPP;
  return ManagerIntervinoPP = {
    padreId: "#intervino_pp",
    elementId: "#intervino_view",
    element: null,
    template: null,
    padre: null,
    iniciar: function() {
      this.padre = $(this.padreId);
      this.sandbox = new sandbox(this);
      this.llenarCatAgentes();
      this.llenarTbUnidades2008();
    },
    actualizarDatos: function() {
      var accidente;
      accidente = window.accidente;
      $("#nombre_agente_intervino_pp").val(accidente.intervino.gafete + "--" + accidente.intervino.nombre);
      return $("#unidad_intervino_pp").val(accidente.intervino.unidad + "--" + accidente.intervino.sector);
    },
    llenarCatAgentes: function() {
      var agente, agentes, nombre_agentes, str, _i, _len;
      if (!window.catAgentes) {
        cargarCatAgentes(this.llenarCatAgentes);
      } else {
        nombre_agentes = [];
        agentes = window.catAgentes;
        for (_i = 0, _len = agentes.length; _i < _len; _i++) {
          agente = agentes[_i];
          str = agente.num_cobro + "--" + agente.nombre;
          nombre_agentes.push(str);
        }
        $("#nombre_agente_intervino_pp").autocomplete({
          source: nombre_agentes
        });
      }
    },
    llenarTbUnidades2008: function() {
      var nombre_unidades, str, unidad, unidades, _i, _len;
      if (!window.tbUnidades2008) {
        cargarTbUnidades2008(this.llenarTbUnidades2008);
      } else {
        nombre_unidades = [];
        unidades = window.tbUnidades2008;
        for (_i = 0, _len = unidades.length; _i < _len; _i++) {
          unidad = unidades[_i];
          str = unidad.no_unidad;
          nombre_unidades.push(str);
        }
        $("#unidad_intervino_pp").autocomplete({
          source: nombre_unidades
        });
      }
    }
  };
});