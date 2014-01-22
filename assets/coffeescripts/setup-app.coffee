window.ip_sys_msg="192.168.95.252:3000"
#window.ip_sys_msg="10.90.101.6:3000"
##window.refsync=window.ip_sys_msg
##window.client= io.connect(window.refsync)
#window.client.emit 'login',window.profile
window.client.on 'profile-with-preliminares',(data)->
	showPreliminares(data)
window.client.on 'twitter-new-preliminar',(preliminar)->
	agregarPreliminar(preliminar);
window.agregarPreliminar=(preliminar)->
	avatar=$("#avatar-preliminares")
	$div=$('<div class="item-avatar"></div>')
	$a= $('<a href="#">' + preliminar.folio_evento + '</a>')
	$div.append($a)
	avatar.append($div)
	return
window.setModulo=(modulo)->
	$("header ul.nav li").removeClass('active')
	$("#li-" + modulo).addClass('active')

window.showPreliminares=(data)->
	avatar=$("#avatar-preliminares").html('')
	preliminares= data.preliminares
	for preliminar in preliminares
		$div=$('<div class="item-avatar"></div>')
		$a= $('<a href="#">' + preliminar.folio_evento + '</a>')
		$div.append($a)
		avatar.append($div)
	return