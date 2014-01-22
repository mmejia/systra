define ['perfil/IniciarListPerfil'], (iniciaListPerfil)->
	app=
		iniciar:()->
			iniciaListPerfil.iniciar()
			alert 'Hola mundo'
			return