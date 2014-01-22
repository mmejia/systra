// Generated by CoffeeScript 1.6.3
window.actualizarComandanciaValor = function(valor) {
  var col, comandancia, _i, _len, _ref;
  col = [];
  valor = $("#bus_delegacion option:first").val();
  _ref = window.comandancias;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    comandancia = _ref[_i];
    if (comandancia.delegacion === valor) {
      col.push(comandancia);
    }
  }
  window.actualizarSelectComandancia(col);
};

window.cargarComandancias = function(fn) {
  return $.ajax({
    type: 'GET',
    url: "/catalogos/comandancias.json",
    success: function(data) {
      var collection, item, _i, _len;
      collection = [];
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        item = data[_i];
        collection.push(item);
      }
      window.comandancias = collection;
      return fn();
    }
  });
};

window.actualizarComandancia = function() {
  var col, comandancia, valor, _i, _len, _ref;
  if (!window.comandancias) {
    window.cargarComandancias(window.actualizarComandancia);
  } else {
    col = [];
    valor = $("#bus_delegacion option:first").val();
    _ref = window.comandancias;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      comandancia = _ref[_i];
      if (comandancia.delegacion === valor) {
        col.push(comandancia);
      }
    }
    window.actualizarSelectComandancia(col);
  }
};

window.actualizarSelectComandancia = function(comandancias) {
  var comandancia, ctl_comandancia, opciones, _i, _len;
  ctl_comandancia = $('#bus_comandancia');
  ctl_comandancia.html('');
  opciones = '';
  for (_i = 0, _len = comandancias.length; _i < _len; _i++) {
    comandancia = comandancias[_i];
    opciones += '<option value="' + comandancia.comandancia + '">' + comandancia.comandancia + '</option>';
  }
  ctl_comandancia.append(opciones);
};

window.cargarDelegaciones = function(fn) {
  return $.ajax({
    type: 'GET',
    url: "/catalogos/delegaciones.json",
    success: function(data) {
      var collection, item, _i, _len;
      collection = [];
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        item = data[_i];
        collection.push(item);
      }
      window.delegaciones = collection;
      return fn();
    }
  });
};
