define [
	'accidentes/IniciarMapa'  
], ()->
	modules = Array.prototype.slice.call(arguments)
	App=
		iniciar : ->  
			for modulo in modules
				modulo.iniciar()