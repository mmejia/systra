require
	paths:
		jade:'vendor/jade'
	[
		'app-arbol'

	], (App_arbol)->
			App_arbol.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()