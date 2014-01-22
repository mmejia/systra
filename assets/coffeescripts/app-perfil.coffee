define ['perfil/IniciarPerfil'], (iniciaPerfil)->
	app=
		iniciar:()->
			iniciaPerfil.iniciar()
			return