define [
	'jade!/static/tpl/main/noticia'
	'core/sandbox'
],(tpl_noticia,sandbox)->
	tpl_noticia:null
	IniciaMain=
		iniciar:()->
			that=this
			this.sandbox= new sandbox(this)
			this.tpl_noticia=tpl_noticia
			window.client.emit 'login',window.profile
			window.client.emit 'get-news'
			window.client.on 'tus-noticias',(data)->
				that.showUltimasNoticias(data)
			window.client.on 'profile-with-preliminares',(data)->
				showPreliminares(data)
			window.client.on 'last-new',(data)->
				that.showUltimasNoticias(data)
				return
			window.client.on 'refresh-folio',(data)->
				that.showUltimoFolio(data)
			
			return
		 
		showUltimoFolio:(data)->
			$('#last-folio').html(data)
		showUltimasNoticias:(data)->
			contenido=''
			noticias= data.noticias
			$('#num_noticias').html(data.length)
			for item in data.reverse()
				contenido += this.tpl_noticia(item)
			$("#pantalla-noticias").html('')
			$("#pantalla-noticias").html(contenido)
			return








