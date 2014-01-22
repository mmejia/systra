define ['core/sandbox'
],(sandbox)->
	ManagerMenuMain=
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			this.sandbox.on 'update-menu-inventarios-local',this.refrescarMenuInventariosLocal
			this.sandbox.on 'update-menu-inventarios-server', this.refrescarMenuInventariosServer
			this.renderInventariosLocal()
			this.renderInventariosServer()
		refrescarMenuInventariosServer:(inventarios)->
			that=this
			ul= $('#ul-inventario-server')
			lis= '<li class="nav-header">INVENTARIOS SERVER</li>'
			for inventario in inventarios
				lis+= '<li><a href="#" id="' +  inventario + '" class="liLoadInventariosServer">' + inventario + '</a></li>'
			ul.html('')
			ul.append(lis)
			$('.liLoadInventariosServer').on 'click',(event)->
				id= event.target.id
				that.cargarLocalInventarioServer(id)
		refrescarMenuInventariosLocal:(inventarios)->
			that=this
			ul= $('#ul-inventario-local')
			lis= '<li class="nav-header">INVENTARIOS LOCALES</li>'
			for inventario in inventarios
				lis+= '<li><a href="#" id="' + inventario.folio_del_inventario + '" class="liLoadInventario">' + inventario.folio_del_inventario + '</a></li>'
			ul.html('')
			ul.append(lis)
			$('.liLoadInventario').on 'click',(event)->
				id= event.target.id
				that.cargarLocalInventario(id)

		cargarLocalInventario:(id)->
			that=this
			inv= sessionStorage.getItem('inventariosl')
			a_inventario=JSON.parse(inv)
			for inventario in a_inventario
				if inventario.folio_del_inventario == id
					window.inventario= inventario
					this.sandbox.emit 'cargar-inventario-en-view'
					return

		renderInventariosLocal:->
			inventarios= sessionStorage.getItem('inventariosl')
			if inventarios
				a_inventarios= JSON.parse(inventarios)
				this.sandbox.emit 'update-menu-inventarios-local', a_inventarios
			return
		renderInventariosServer:->
			inventarios= sessionStorage.getItem('inventarios-server')
			if inventarios
				a_inventarios=JSON.parse(inventarios)
				this.sandbox.emit 'update-menu-inventarios-server', a_inventarios
			return
		cargarLocalInventarioServer:(id)->
			that=this
			that.sandbox.emit 'cargar-inventario-en-view-server',id
			return

