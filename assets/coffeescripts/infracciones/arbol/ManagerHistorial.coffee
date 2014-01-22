define ['core/sandbox'
],(sandbox)->
	ManagerHistorial=
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			this.sandbox.on 'show-add-block',this.showAddBlock
			this.sandbox.on 'hidden-add-block',this.hiddenAddBlock
			this.sandbox.on 'show-history-block',this.showHistoryBlock
			this.sandbox.on 'hidden-history-block',this.hiddenHistoryBlock
		showAddBlock:->
			$("#agregar-bloque").html('<span class="icosystra-history"></span>')
			el=$("#folio-agregar-folio")
			cambios=
				height: "auto"
				width: "100%"
				margin: "1em"
				padding : "1em"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		showHistoryBlock:->
			$("#agregar-bloque").html('<span class="icosystra-plus"></span>')
			el=$("#historia-bloques")
			cambios=
				height: "auto"
				width: "100%"
				margin: "1em"
				padding : "1em"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		hiddenAddBlock:->
			$("#agregar-bloque").html('<span class="icosystra-plus"></span>')
			el=$("#folio-agregar-folio")
			cambios=
				height: "0"
				width: "0"
				margin: "0"
				padding : "0"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
		hiddenHistoryBlock:->
			$("#agregar-bloque").html('<span class="icosystra-history"></span>')
			el=$("#historia-bloques")
			cambios=
				height: "0"
				width: "0"
				margin: "0"
				padding : "0"
				overflow:"hidden"
				transition:"all 2s ease"
			el.css(cambios)
			