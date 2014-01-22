define ['folios/IniciarFolios'], (managerListUsers)->
		app=
			iniciar:()->
				managerListUsers.iniciar()
		return app