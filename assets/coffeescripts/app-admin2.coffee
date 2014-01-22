define ['admin/ManagerListUsers'], (managerListUsers)->
		app=
			iniciar:()->
				managerListUsers.iniciar()
		return app
