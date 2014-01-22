define [
		'core/sandbox'
],(sandbox)->
	modulo=
		padreId:"#managerArticulos_spa_inf"
		elementId:"#managerArticulosView_spa_inf"
		element:null
		template:null
		padre:null
		articulosSel:[]
		botonAgregarId:'#sel-articulo-spa-inf'
		botonBorrarClass:'botonBorrarArticulo_spa_inf'
		txtSelArticulo:"#articulos_spa_inf"
		currentArticulo:null
		articulosSeleccionados:[]
		that:this
		iniciar:->
			that=this
			this.padre= $ this.padreId
			this.sandbox= new sandbox this
			#this.template=template
			#this.padre.append this.template
			$(this.botonAgregarId).on 'click', ()=> 
				that.buscarAgregarArticulo(that.currentArticulo,this)
				return
			

			this.sandbox.on("agregar-articulo-spa-inf",this.agregarArticulo)
			this.sandbox.on("borrar-articulo-spa-inf",this.borrarArticulo)
			this.sandbox.on('update-articulos', this.updateArticulos)
			this.sandbox.on('limpiar-articulos', this.limpiarArticulos)
			this.sandbox.on 'llenar-infraccion-articulos', this.llenarInfraccionArticulos
			this.llenarArticulos()
		llenarInfraccionArticulos:->
			inf= window.infraccion
			inf.articulos=this.articulosSeleccionados
			console.log window.infraccion
		updateArticulos:(data)->
			this.articulosSeleccionados= data.contenido
			this.renderArticulos(this)
		limpiarArticulos:->
			this.articulosSeleccionados=[]
			this.renderArticulos()

		llenarArticulos:->
			that= this
			if !window.articulos
				cargarArticulos this.llenarArticulos
			else
				nombres=[]
				for item in window.articulos
					 
					item.toString= ()->
						this.art + "-" + this.fracc + "-" + this.descc
					#str= campos.art + "-" + campos.fracc + "-" + campos.descc
					nombres.push
						 value:item
				$("#articulos_spa_inf").autocomplete
					that:that
					source : nombres
					select:(event,ui)->
						that.currentArticulo=ui.item.value
						return 
			return
		buscarAgregarArticulo:(articulo)->
			this.sandbox.emit 'agregar-articulo-spa-inf',
					value:articulo
			return
		buscarBorrarArticulo:(articulo)->
			this.sandbox.emit 'borrarticulo-spa-inf',
					value:articulo
			return
		renderArticulos: ()->
			that=this
			tabla= $("#tab_articulos_spa_inf")
			$("#tab_articulos_spa_inf>tbody").empty()
			console.log this.articulosSeleccionados
			for articulo in this.articulosSeleccionados
				console.log articulo
				if articulo or articulo != undefined
					row="<tr>
						<td><a href=\"#\" id=\"infr_#{articulo.id}\" class=\"tablaBorrarArticulo\"><i class=\"icosystra-remove\"></i></a></td>
						<td>#{articulo.art}</td>
						<td>#{articulo.fracc}</td>
						<td>#{articulo.descc}</td>
						</tr>"
					tabla.append(row);
					$("#infr_" + articulo.id ).on 'click', (evento)=> 
						that.borrarArticulo(evento);
						return
			return

		agregarArticulo:(elemento)->
			if this.that.currentArticulo == null
				return
			this.addArticulo(this.articulosSeleccionados,this.that.currentArticulo)
			this.renderArticulos()
			this.that.currentArticulo=null
			$(this.txtSelArticulo).val("")
			return
		addArticulo:(seleccionados, p_art)->
			clone = seleccionados.slice(0)
			for art in clone
				if art
					if art.art == p_art.art and  art.fracc== p_art.fracc
						return
			seleccionados.push(p_art)
		borrarArticulo:(evento)->
			console.log evento.currentTarget.id
			ident= evento.currentTarget.id
			her = ident.split "_"
			id= her[1]
			console.log  id
			lista=this.articulosSeleccionados
			clone=[]
			clone=this.articulosSeleccionados.slice(0)
			borrar=[]
			for articulo,i in clone
				if articulo
					if '' + articulo.id == '' + id
						borrar.push(i)
			for i in borrar
				delete this.articulosSeleccionados[i]
			this.renderArticulos()
			return





