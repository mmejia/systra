// Generated by CoffeeScript 1.6.3
window.ip_sys_msg = "192.168.95.252:3000";

window.client.on('profile-with-preliminares', function(data) {
  return showPreliminares(data);
});

window.client.on('twitter-new-preliminar', function(preliminar) {
  return agregarPreliminar(preliminar);
});

window.agregarPreliminar = function(preliminar) {
  var $a, $div, avatar;
  avatar = $("#avatar-preliminares");
  $div = $('<div class="item-avatar"></div>');
  $a = $('<a href="#">' + preliminar.folio_evento + '</a>');
  $div.append($a);
  avatar.append($div);
};

window.setModulo = function(modulo) {
  $("header ul.nav li").removeClass('active');
  return $("#li-" + modulo).addClass('active');
};

window.showPreliminares = function(data) {
  var $a, $div, avatar, preliminar, preliminares, _i, _len;
  avatar = $("#avatar-preliminares").html('');
  preliminares = data.preliminares;
  for (_i = 0, _len = preliminares.length; _i < _len; _i++) {
    preliminar = preliminares[_i];
    $div = $('<div class="item-avatar"></div>');
    $a = $('<a href="#">' + preliminar.folio_evento + '</a>');
    $div.append($a);
    avatar.append($div);
  }
};