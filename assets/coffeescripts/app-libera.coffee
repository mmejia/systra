define [
	'inventario/IniciarLibera'
],(libera) ->
	modules= Array.prototype.slice.call(arguments)
	app=
		iniciar:()->
			for module in modules
				module.iniciar()
			return