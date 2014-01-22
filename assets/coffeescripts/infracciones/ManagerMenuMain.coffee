define ['core/sandbox'
],(sandbox)->
	ManagerMenuMain=
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			this.sandbox.on 'update-menu-infracciones-local',this.refrescarMenuInfraccionesLocal
			this.sandbox.on 'update-menu-infracciones-server', this.refrescarMenuInfraccionesServer
			this.renderInfraccionesLocal()
			this.renderInfraccionesServer()
		refrescarMenuInfraccionesServer:(infracciones)->
			that=this
			ul= $('#ul-infraccion-server')
			lis= '<li class="nav-header">INFRACCIONES SERVER</li>'
			ul.html(lis)
			for infraccion in infracciones
				lis= '<li><a href="#" id="mm_' +  infraccion + '" class="liLoadInfraccionesServer">' + infraccion + '</a></li>'
				ul.append(lis)
				$("#mm_" + infraccion).on 'click',(evento)->
					mm= evento.currentTarget.id
					her= mm.split("_")
					id=her[1]
					that.cargarLocalInfraccionServer(id)
		refrescarMenuInfraccionesLocal:(infracciones)->
			console.log  infracciones
			that=this
			ul= $('#ul-infraccion-local')
			lis= '<li class="nav-header">INFRACCIONES LOCALES</li>'
			ul.html(lis)
			for infraccion in infracciones
				lis ='<li><a href="#" id="' + infraccion.folio_infraccion + '" class="liLoadInfraccion">' + infraccion.folio_infraccion + '</a></li>'
				ul.append(lis)
				$('#' + infraccion.folio_infraccion).on 'click',(event)->
					id= event.currentTarget.id
					that.cargarLocalInfraccion(id)

		cargarLocalInfraccion:(id)->
			that=this
			inf= sessionStorage.getItem('infraccionesl')
			a_infraccion=JSON.parse(inf)
			for infraccion in a_infraccion
				if infraccion.folio_infraccion == id
					window.infraccion= infraccion
					this.sandbox.emit 'cargar-infraccion-en-view'
					return

		renderInfraccionesLocal:->
			infracciones= sessionStorage.getItem('infraccionesl')
			if infracciones
				a_infracciones= JSON.parse(infracciones)
				this.sandbox.emit 'update-menu-infracciones-local', a_infracciones
			return
		renderInfraccionesServer:->
			infracciones= sessionStorage.getItem('infracciones-server')
			if infracciones
				a_infracciones=JSON.parse(infracciones)
				this.sandbox.emit 'update-menu-infracciones-server', a_infracciones
			return
		cargarLocalInfraccionServer:(id)->
			that=this
			that.sandbox.emit 'cargar-infraccion-en-view-server',id
			return

