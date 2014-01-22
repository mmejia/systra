require ['app-lista-infraccion'], (App)->
			App.iniciar()

require.config
	urlArgs:"bust=" + (new Date()).getTime()