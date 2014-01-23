define [
	'core/sandbox'
	'perfil/UpdatePerfil'
	'perfil/CreatePerfil'
],(sandbox,updatePerfil,createPerfil)->
	tpl_noticia:null
	IniciarListPerfil=
		iniciar:()->
			that=this
			this.sandbox= new sandbox(this)
			$(".editar-perfil").on  'click', (evento)->
				ident=evento.currentTarget.id
				her=ident.split('_')
				id=her[1]
				that.cargarPerfil(id)
			$("#captura-perfil").on  'click', (evento)->
				 that.cargarCapturaPerfil()
		cargarCapturaPerfil:()->
			$.ajax
				type:"GET"
				url:'/perfil/capturar/'
				dataType:'html'
				#data:datos
				success:(res)->
					$("#fichas-infracciones").html(res)
					createPerfil.iniciar()
		cargarPerfil:(id)->
			$.ajax
				type:"GET"
				url:'/perfil/modificar/' + id + "/"
				dataType:'html'
				#data:datos
				success:(res)->
					$("#fichas-infracciones").html(res)
					updatePerfil.iniciar()
			

				



			