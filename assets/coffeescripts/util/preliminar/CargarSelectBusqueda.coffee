
llenarComandancias=->
	if !window.comandancias
		cargarComandancias llenarComandancias
	else
		sel=$('#comandancia').html("")
		opciones='<option  value= "NO">**SELECCIONAR**</option>';
		sel.append(opciones)
		#for comandancia in window.comandancias
		#	opciones+='<option value="'+comandancia.comandancia+'">'+comandancia.comandancia+'</option>'
		#sel.append(opciones)
	return