define ['infracciones/IniciarLista'], (lista)->
	app=
		iniciar:()->
			lista.iniciar()
	return app