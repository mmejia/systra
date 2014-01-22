require
	paths:
		jade:'./vendor/jade'
	[
		'app-libera'

	], (App_libera)->
			App_libera.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()