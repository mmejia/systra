define ['core/sandbox'
],(sandbox)->
	ManagerMenuMain=
		iniciar:()->
			this.sandbox= new sandbox this
			that= this
			this.sandbox.on 'update-menu-preliminar-server',this.refrescarMenuPreliminarServer
			$(".trigger").click ()->
				$(".panel").toggle("fast")
				$(this).toggleClass("active")
				return false

			this.renderPreliminaresServer()
		refrescarMenuPreliminarServer:(preliminares)->
			that=this
			ul= $('#ul-preliminares')
			ul.html('')
			lis= '<li class="nav-header">PRELIMINARES SERVER</li>'
			ul.append(lis)
			for preliminar in preliminares
				#lis+= '<li><a href="#" id="' + preliminar + '" class="liLoadAccidenteServer">' + preliminar + '</a></li>'
				lis= '<li><div class="item-menu-nice"><div class="linea"><a href="#" id="' + preliminar.id + '" class="liLoadAccidente">' + preliminar.numero_de_folio + '</a></div><div class="linea"><span>'+ preliminar.tipo_de_evento + '</span></div></li>' #<div class="linea"><span>' + preliminar.fecha + '</span></div></div></li>'
				ul.append(lis)
				$('#' + preliminar.id).on 'click',(event)->
					id= event.currentTarget.id
					that.cargarLocalPreliminarServer(id)
			#ul.html('</ul>')
		renderPreliminaresServer:->
			preliminares= sessionStorage.getItem('preliminares-server')
			console.log preliminares
			if preliminares
				a_preliminares = JSON.parse(preliminares) 
				this.sandbox.emit 'update-menu-preliminar-server',a_preliminares
			return
		cargarLocalPreliminarServer:(id)->
			that=this
			that.sandbox.emit 'cargar-preliminar-en-view-from-server',id
			return


