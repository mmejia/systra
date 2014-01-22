ww=document.body.clientWidth
window.cargarProfile=(fn)->
	$.ajax
		type:'GET'
		url:'/getProfile'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.profile= collection
			fn()
			return
iniciarMenu=()->
			$(".nav li a").each ()->
				if $(this).next().length >0
						$(this).addClass("parent")
			$('.toggleMenu').on 'click', (e)->
				e.preventDefault()
				$(this).toggleClass('active')
				$(".nav").toggle()
			adjustMenu()
			$(window).bind 'resize orientationchange',()->
				ww= document.body.clientWidth
				adjustMenu()

adjustMenu=->
	if ww<768
		$(".toggleMenu").css("display","inline-block")
		if(!$(".toggleMenu").hasClass("active"))
			$(".nav").hide()
		else
			$(".nav").show()
		$(".nav li").unbind('mouseenter mouseleave')
		$(".nav li a.parent").unbind('click').bind 'click', (e)->
			e.preventDefault()
			$(this).parent("li").toggleClass("hover")
	else if ww>=768
		$(".toggleMenu").css("display", "none")
		$(".nav").show()
		$(".nav li").removeClass("hover")
		$(".nav li a").unbind('click')
		$(".nav li").unbind('mouseenter mouseleave').bind 'mouseenter mouseleave', ()->
			$(this).toggleClass('hover')


window.sel= (select,valor)->
	console.log  "Entramos buscar el elemento"
	ctl=document.getElementById("delegacion_miguel")
	alert(ctl.options.length)
	for i in[0..ctl.options.length]
		alert ctl.options[i]
	#console.log select
	#console.log  $(select + ">option")
	#$("select#delegacion_miguel>option").each ()->
	#	alert('Hola mundo')
	#	console.log $(this).val()
	#console.log ctl
	#for op in ctl.options
	#	console.log op
	return
