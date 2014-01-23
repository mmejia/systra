define [
	'/static/javascripts/core/sandbox.js'
	],(sandbox)->
		IniciarLibera=
			iniciar:()->
				that=this
				$('#cal-folios a').click (event)-> 
					event.preventDefault()
					$(this).tab('show')
					return
				$('.cargar-folio-pension').on 'click', (evento)->
					ident=evento.currentTarget.id
					her=ident.split('_')
					id=her[1]
					that.cargarFoliosPension(id)
			cargarFoliosPension:(id)->
				anio=$('#anios-folios-inventario').val()
				console.log  anio
				#$.ajax
				#	type:"GET"
				#	url:'/perfil/capturar/'
				#	dataType:'json'
					#data:datos
				#	success:(res)->
				#		$("#fichas-infracciones").html(res)
				#		createPerfil.iniciar()
				