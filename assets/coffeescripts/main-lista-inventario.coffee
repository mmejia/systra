require ['app-lista-inventario'], (App)->
	console.log "Iniciando lista inventario"
	console.log App
	App.iniciar()
	return 

require.config
	urlArgs:"bust=" + (new Date()).getTime()