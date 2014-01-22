window.showMensaje=()->
		#$div=$('#myModal .modal-body').html()
		#$("#myModal").modal('show')
		#$('#myModalLabel').html(titulo)
		return "Seguro que quieres dejar la pagina"

window.actualizarComandanciaValor=(valor)->
	col=[]
	console.log window.comandancias
	for comandancia in window.comandancias
		if comandancia.delegacion == valor
			col.push(comandancia)
	window.actualizarSelectComandancia(col)
	return

window.cargarDescVehiculos=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/descVehiculos.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.descVehiculos= collection
			fn()
			return
	return
window.actualizarComandancia=()->
	if !window.comandancias
		window.cargarComandancias window.actualizarComandancia
	else
		col=[]
		valor =$("#delegacion_spa_inf option:first").val()
		console.log valor
		for comandancia in window.comandancias
			if comandancia.delegacion == valor
				col.push(comandancia)
		if valor=='NO'		
			window.actualizarSelectComandancia(window.comandancias)
		else 
			window.actualizarSelectComandancia(col)
	return
window.actualizarSelectComandancia=(comandancias)->
	ctl_comandancia= $('#comandancia_spa_inf')
	ctl_comandancia.html('')
	opciones= '<option  value= "NO">**SELECCIONAR**</option>'
	for comandancia in comandancias
		opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
	ctl_comandancia.append(opciones)
	return
window.cargarProfiles=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/listProfile.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.profiles= collection
			fn()
			return
window.cargarCatAgentes=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/CatAgentesNew.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.catAgentes= collection
			fn()
			return
window.cargarCirculaciones=(fn)->
	$.ajax
		type:'GET'
		url:'/catalogos/circulaciones.json'
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.circulaciones= collection
			fn()
			return
window.cargarDelegaciones=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/delegaciones.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.delegaciones=collection
			fn()
window.cargarComandancias=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/comandancias.json"
		success:(data)->
			collection=[]
			for item in data
				collection.push item
			window.comandancias=collection
			console.log window.comandancias
			fn()
window.cargarTurnos=(fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/turnos.json"
		success:(data)->
			collection= []
			for item in data
				collection.push item
			window.turnos=collection
			fn()
window.cargarColonias= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/colonias.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.colonias=col
			fn()
window.cargarEstados= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/estados.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.estados=col
			fn()
window.cargarMunicipios= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/municipios.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.municipios=col
			fn()
window.refrescarTablaBlocks=(folio)->
	$.post '/folios/getBlocksByFolio/' + folio + "/" ,(data)->
			tabla= $("#listaFolios")
			$("#listaFolios>tbody").empty()
			for block in data
				if block
					row="<tr>
					<td><a href=\"#block-\" id=\"#{block.id}\" class=\"borrar-articulo\"><i class='icon-edit'></i></td>
					<td>#{block.no_blocks}</td>
					<td>#{block.fecha_recibido}</td>
					<td>#{block.folio_inicial}</td>
					<td>#{block.folio_final}</td>
					<td>#{block.faltantes}</td>
					<td>#{block.entregados}</td>
					</tr>"
				tabla.append(row)
				$("#block_" + block.id ).on 'click', (event)=> 
					identificador= evento.currentTarget.id
					her=identificador.split('-')
					id=her[1]
					that.borrarArticulo(id)
		return
window.borrarBlock=(id)->
			 $.post '/folios/remove/' + id ,(data)->
			 	that.showMensaje('Se elimino el folio  <span class="new-folio">' + data.id + '</span> exitosamente!!!')	

window.cargarCalles= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/calles.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.calles=col
			fn()
window.cargarOperativos= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/operativos.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.operativos=col
			fn()
window.cargarArticulos= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/articulos.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.articulos=col
			fn()

window.cargarPensiones= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/pensiones.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.pensiones=col
			fn()
window.cargarMarcas= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/marcas.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.marcas=col
			fn()

window.cargarColores= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/colores.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.colores=col
			fn()
	return
window.cargarTipoVehiculos= (fn)->
	$.ajax
		type : 'GET'
		url : "/catalogos/tipoVehiculo.json"
		success:(data)->
			col=[]
			for item in data
				col.push item
			window.tipoVehiculos=col
			fn()
	return
window.actualizarSubMarcaValor=(valor)->
	col=[]
	for marca in window.marcas
		if marca.marca == valor
			col.push(marca)
	window.actualizarSelectSubMarca(col)
	return
window.actualizarSelectSubMarca=(marcas)->
	ctl_submarca= $('#submarca_cv_spa_inf')
	ctl_submarca.html('')
	opciones='<option  value="NO">**SELECCIONAR**</option>'
	for marca in marcas
		opciones+='<option value="'+marca.submarca+'">'+marca.submarca+'</option>'
	ctl_submarca.append(opciones)
	return
window.validateFolioAgente= (dato)->
	if !window.catAgentes
		cargarCatAgentes this.llenarAgentes(dato)
	else
		agentes= window.catAgentes
		for agente in agentes
			comp= agente.num_cobro
			if dato==comp
				return{
					res:true
					msg:""					
				} 
		
		{
			res:false
			msg:"No se localizo al Agente que intervino"
		}








