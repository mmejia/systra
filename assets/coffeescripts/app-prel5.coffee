define ['accidentes/IniciaPreliminar'], (iniciaPreliminar)->

		app=
			iniciar:()->
				iniciaPreliminar.iniciar()
				return
		return app
