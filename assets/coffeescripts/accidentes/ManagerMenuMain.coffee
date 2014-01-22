define ['core/sandbox'
],(sandbox)->
	ManagerMenuMain=
		iniciar:()->
			this.sandbox= new sandbox this
			that= this
			this.sandbox.on 'update-menu-accidente-local',this.refrescarMenuAccidentesLocal
			this.sandbox.on 'update-menu-accidente-server',this.refrescarMenuAccidentesServer
			this.renderAccidentesLocal()
			this.renderAccidentesServer()
		refrescarMenuAccidentesLocal:(accidentes)->
			that=this
			div= $('#ul-accidente-local')
			div.html('<span> ACCIDENTES LOCALES</span>')
			ul= $('<ul></ul>')
			for accidente in accidentes
				lis= '<li><div class="item-menu-nice"><a href="#" id="' + accidente.folio_accidente + '" class="liLoadAccidente">' + accidente.folio_accidente + '</a><span>'+ accidente.clasificacion + '</span><span>' + accidente.fecha + '</span></li>'
				ul.append(lis)
			div.append(ul)
			$('.liLoadAccidente').on 'click',(event)->
				id= event.target.id
				that.cargarLocalAccidente(id)

		renderAccidentesLocal:->
			accidentes= sessionStorage.getItem('accidentesl')
			if accidentes
				a_accidentes = JSON.parse(accidentes) 
				this.sandbox.emit 'update-menu-accidente-local',a_accidentes
			return
		cargarLocalAccidente:(id)->
			that=this
			acc= sessionStorage.getItem('accidentesl')
			a_accidente=JSON.parse(acc)
			for accidente in a_accidente
				if accidente.folio_accidente == id
					window.accidente= accidente
					this.sandbox.emit 'cargar-accidente-en-view'
					return
		refrescarMenuAccidentesServer:(accidentes)->
			that=this
			ul= $('#ul-accidente-server')
			lis= '<li class="nav-header">Accidentes SERVER</li>'
			for accidente in accidentes
				lis+= '<li><a href="#" id="' + accidente + '" class="liLoadAccidenteServer">' + accidente + '</a></li>'
			ul.html('')
			ul.append(lis)
			$('.liLoadAccidenteServer').on 'click',(event)->
				id= event.target.id
				that.cargarLocalAccidenteServer(id)

		renderAccidentesServer:->
			accidentes= sessionStorage.getItem('accidentes-server')
			if accidentes
				a_accidentes = JSON.parse(accidentes) 
				this.sandbox.emit 'update-menu-accidente-server',a_accidentes
			return
		cargarLocalAccidenteServer:(id)->
			that=this
			that.sandbox.emit 'cargar-accidente-en-view-server',id
			return


