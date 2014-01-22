define [ '../core/sandbox'
], (sandbox) ->
	app=
		sandbox:null
		investigacion:null
		iniciar:(accidente)->
			this.sandbox=new sandbox(this)
			this.sandbox.on 'refrescar-articulos-view', this.refrescarArticulos
			this.sandbox.on 'borrar-articulo-view', this.borrarArticulo
			this.sandbox.on 'borrar-all-articulos-view' ,this.borrarAllArticulos

		borrarAllArticulos:->
			window.accidente.articulos=[]
			this.refrescarArticulos()
		agregarArticulo:(articulo)->
			#alert 'Agregando articulo'
			console.log articulo
			window.accidente.articulos.push(articulo)
			this.sandbox.emit 'refrescar-articulos-view'
			$('#articulos_pp').val('')

		borrarArticulo:(evento)->
			id= evento.target.id
			lista=window.accidente.articulos
			clone=[]
			clone=lista.slice(0)
			borrar=[]
			for articulo,i in clone
				if articulo
					if '' + articulo.id == '' + id
						borrar.push(i)
			 
			for i in borrar
				delete lista[i]
			
			this.sandbox.emit 'refrescar-articulos-view'
			return
		refrescarArticulos:->
			that=this
			tabla= $("#tab_articulos_pp")
			$("#tab_articulos_pp>tbody").empty()
			console.log window.accidente.articulos
			for articulo in window.accidente.articulos
				if articulo
					row="<tr>
						<td><a href=\"#\" id=\"#{articulo.id}\" class=\"borrar-articulo\"><i class='icon-edit'></i></td>
						<td>#{articulo.art}</td>
						<td>#{articulo.fracc}</td>
						<td>#{articulo.descc}</td>
						</tr>"
					tabla.append(row)
				$(".borrar-articulo" ).on 'click', (event)=> 
					that.sandbox.emit 'borrar-articulo-view' ,event
			return
			 
