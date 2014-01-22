require
	paths:
		jade:'../vendor/jade'
	[
		'app2'

	], (App)->
			App.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()