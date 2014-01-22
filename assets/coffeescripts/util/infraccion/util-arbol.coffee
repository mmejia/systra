$(".tree li:has(ul)").addClass("parent_li").find(" > span").attr "title", "Collapsa esta rama"
$(".tree li.parent_li > span").on "click", (e) ->
	children = $(this).parent("li.parent_li").find(" > ul > li")
	if children.is(":visible")
		children.hide "fast"
		$(this).attr("title", "Expnde esta rama").find(" > i").addClass("icon-plus-sign").removeClass "icon-minus-sign"
	else
		children.show "fast"
		$(this).attr("title", "Collapsa esta rama").find(" > i").addClass("icon-minus-sign").removeClass "icon-plus-sign"
	e.stopPropagation()

window.cargarDelegaciones=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/delegaciones.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.delegaciones=collection
			fn()
window.cargarComandancias=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/comandancias.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.comandancias=collection
			fn()
window.cargarTurnos=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/turnos.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.turnos=collection
			fn()
