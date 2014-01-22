define [
  'core/sandbox'
  'vendor/min/moment'
],(sandbox,momento)->
	ManagerBusquedaEstMapas=
		mapa:null
		map:null
		tam:15
		index:0
		first:null
		previo:null
		next:null
		last:null
		data_seleccionada:[]
		data:null
		marcas:[]
		iniciar:()->
			that= this
			this.sandbox= new sandbox this
			this.sandbox.on 'llenar-tabla-puntos',this.llenarTabla
			this.sandbox.on 'mostrar-uno-mapa',this.mostrarUnoMap
			this.mapa= document.getElementById('map1')
			this.first=$('#firstMarcas-mapa')
			this.first.on 'click' ,(event)->
				that.doFirst()

			this.previo=$('#previoMarcas-mapa')
			this.previo.on 'click' ,(event)->
				that.doPrevio()

			this.next=$('#nextMarcas-mapa')
			this.next.on 'click' ,(event)->
				that.doNext()

			this.last=$('#lastMarcas-mapa')
			this.last.on 'click' ,(event)->
				that.doLast()
			latlng= new google.maps.LatLng(21.0971262226, -101.646839608 )
			params=
				center:latlng
				zoom:11
				mapTypeId:google.maps.MapTypeId.ROADMAP
				mapTypeControl:true
				streetViewControl:true
			this.map= new google.maps.Map(this.mapa,params)
			frm=$("#frm-bus-map")
			frm.submit ()->
				console.log "Dentro de la consulta";
				$.ajax
					data:frm.serialize()
					type:frm.attr('method')
					url:frm.attr('action')
					csrfmiddlewaretoken: '{{ csrf_token }}'
					success:(data)->
						#that.ponerMarcas(data)
						that.sandbox.emit 'llenar-tabla-puntos',data
					error:(data)->
						console.log "ERrorrrr"
				return false;

		llenarTabla:(data)->
			that=this
			$("#boton_resultado").click()
			tabla= $("#resultado-bus-map>tbody")
			$("#resultado-bus-map>tbody").empty()
			this.data= data
			i=0
			for item in data
				if i> this.tam
					break
				momento= new moment(item.fecha)
				fecha= momento.format('YYYY-MM-DD hh:mm')
				row="<tr>
						<td><input type=\"checkbox\" class=\"showMapaPunto\" id=\"#{item.id_unico}\"></td>
						<td>#{item.id_preliminar}</td>
						<td>#{item.tipo}</td>
						<td>#{fecha}</td>
						</tr>"
				tabla.append(row)
				$("#" + item.id_unico ).on 'click', (event)=> 
					that.sandbox.emit 'mostrar-uno-mapa' ,event
				i++


		buildIndice:(op ,data)->
			console.log data.length
			inicio=0
			fin=0
			if op == 'first'
				inicio=0
				if data.length> inicio+this.tam
					fin=inicio+this.tam
				else
					fin= data.length
			else if op=="previo"
				fin=this.index
				if this.index-this.tam >0
					incio=this.index-this.tam
				else
					inicio=0
			else if op=="next"
				inicio=this.index 
				if this.index+this.tam <data.length
					fin=this.index+this.tam
				else
					fin=data.length
			else if op=="last"
				fin= data.length
				if data.length>this.tam
					inicio= data.length
				else
					inicio=0
			console.log "El inicioooooo: " + inicio  + "   find: " + fin
			return [inicio,fin]
		doFirst:()->
			this.showItemsTabla('first')
		doPrevio:()->
			this.showItemsTabla('previo')
		doNext:()->
			this.showItemsTabla('next')	
		doLast:()->
			this.showItemsTabla('last')	
		showItemsTabla:(op)->
			tabla= $("#resultado-bus-map>tbody")
			$("#resultado-bus-map>tbody").empty()
			if this.data
				data=this.data
				indices= this.buildIndice(op,data)
				this.index= indices[1]
				console.log "El indice  " + indices[0] + "  fin: " + indices[1]  
				for i in [indices[0]..indices[1]]
					console.log "El indice"
					item= data[i]
					momento= new moment(item.fecha)
					fecha= momento.format('YYYY-MM-DD hh:mm')
					row="<tr>
							<td><input type=\"checkbox\" class=\"showMapaPunto\" id=\"#{item.id_unico}\"></td>
							<td>#{item.id_preliminar}</td>
							<td>#{item.tipo}</td>
							<td>#{fecha}</td>
							</tr>"
					tabla.append(row)
				$(".showMapaPunto" ).on 'click', (event)=> 
					that.sandbox.emit 'mostrar-uno-mapa' ,event
		mostrarUnoMap:(evento)->
			elem=evento.currentTarget
			id= elem.id
			if elem.checked 
				this.addSeleccionado(id)
			else
				this.removeSeleccionado(id)
			this.actualizarMarcas()

		addSeleccionado:(id)->
			for item in this.data
				if item.id_unico == id
					this.data_seleccionada.push(item)
		removeSeleccionado:(id)->
			newarr=[]
			for item in this.data_seleccionada
				if item.id_unico != id
					newarr.push(item)
			this.data_seleccionada= newarr
		limpiarMarcas:()->
			for marca in this.marcas
				marca.setMap(null)
			marcas=[]
		actualizarMarcas:()->
			that=this
			this.limpiarMarcas()
			data= this.data_seleccionada
			primero= data[0]
			latlng= new google.maps.LatLng(primero.lat,primero.lng)
			that.map.setCenter(latlng)
			ventanas=[]
			buildVentana=(i,item)->
				$.ajax
					type:'GET'
					url:'/accidente/getUrlImagenesDeAccidente/' + item.id_unico + "/"
					success:(id_recursos)->
								cad='<a class="mapa-cargarAccidente" href="/accidente/cargarAccidente/' + item.id_unico + '/">Ver</a>'
								for id in id_recursos
									cad+='<img class="imagen-mapa" src="/content/content/' + id + '"></img>' 
								ventanas[i]= new google.maps.InfoWindow
										content:cad
			makeListener=(i,item)->
				()->
					for ventana in ventanas
						ventana.close()
						ventanas[i].open(that.map,that.marcas[i])
			for item,i in data
				this.marcas[i]= new google.maps.Marker
					position:new google.maps.LatLng(item.lat,item.lng)
					map:that.map
					title:item.id_preliminar
				buildVentana(i,item)
				google.maps.event.addListener(this.marcas[i],'click',makeListener(i,item))

			
			 




