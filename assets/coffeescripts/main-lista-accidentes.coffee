
require ['app-lista-accidentes'], (App)->
			App.iniciar()

require.config
	urlArgs:"bust=" + (new Date()).getTime()