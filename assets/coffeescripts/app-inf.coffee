define ['infracciones/ManagerServicioParticularInf'
		'infracciones/IniciarInfraccion'],() ->
	modules= Array.prototype.slice.call(arguments)
	app=
		iniciar:()->
			this.llenarCatAgentes()
			this.iniciarCalendario()
			for module in modules
				module.iniciar()
			that=this
			return
		llenarCatAgentes:()->
			if !window.catAgentes
				cargarCatAgentes this.llenarCatAgentes
			else
				nombre_agentes=[]
				for agente in window.catAgentes
					str=agente.no_nuevo + "--" + agente.nombre
					nombre_agentes.push str
			$("#nombre-agente-inf").autocomplete
				source:nombre_agentes
				select: (event,ui)->
					item =ui.item.value
					her= item.split "--"
					for agente in window.catAgentes
						if '' + agente.no_nuevo  == her[0] && agente.nombre == her[1]
							#console.log "ENtro " +  this.noCobroAgenteId
							$('#nom-cobro-agente-inf').val(agente.empleado)
			return
		iniciarCalendario:()->
			#$("#fecha-capt-inf").datetimepicker
			#	pickTime: false
			#	language:'es'
			#$("#hora-capt-inf").datetimepicker
			#	pickDate: false
			#	language:'es'

	return app
