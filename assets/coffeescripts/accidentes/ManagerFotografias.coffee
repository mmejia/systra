define [ '../core/sandbox'
], (sandbox) ->
	app=
		sandbox:null
		iniciar:(accidente)->
			this.sandbox=new sandbox(this)
			this.sandbox.on('cargar-lista-fotografias', this.cargarListaFotografias)
			this.sandbox.on 'show-foto-actual' ,this.showImagen
		showImagen:(id)->
			$('.item-galeria').hide()
			$('#div_'+ id).show()

		cargarListaFotografias:()->
			that=this
			if window.accidente
				if window.accidente.fotos
					fotos= window.accidente.fotos
					ulFotos= $('#ligaFotos')
					ulFotos.html('')
					console.log fotos
					opciones= ''
					for foto in fotos
						id= foto.id
						opciones += '<li><a href="#ff" id="foto_' + id + '" class="selectFoto"><img class="fotitos"  src="/content/content/' + id + '"> </a></li>'
					opciones+=''
					ulFotos.append(opciones)
					$('.selectFoto').on 'click',(evento)->
						id= evento.currentTarget.id
						her= id.split('_')
						id_foto= her[1]
						that.showImagen(id_foto)
