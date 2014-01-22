define [
	'core/sandbox'
	'perfil/UpdatePerfil'
],(sandbox,updatePerfil)->
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
		cargarPerfil:(id)->
			$.ajax
				type:"GET"
				url:'/perfil/modificar/' + id + "/"
				dataType:'html'
				#data:datos
				success:(res)->
					$("#fichas-infracciones").html(res)
					updatePerfil.iniciar()
			

				



			