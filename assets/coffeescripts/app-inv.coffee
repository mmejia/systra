define [
	'accidentes/IniciarAccidente'  
	'accidentes/ManagerVehiculos'
	'accidentes/ManagerTableVehiculos'
	'accidentes/ManagerTablaSaldoSangre' 
	'accidentes/ManagerTablaCompetenciaJudicial' 
	'accidentes/ManagerIntervinoPP'
	'accidentes/ManagerSupervisoPP'
	'accidentes/ManagerObservacionesPP'
	'accidentes/TestAccidente'
	'accidentes/ManagerMenuMain'
	], ()->
		modules = Array.prototype.slice.call(arguments)
		App=  
			iniciar : ->  
				for modulo in modules
					modulo.iniciar()