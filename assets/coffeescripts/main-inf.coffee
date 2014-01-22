require
	paths:
		jade:'./vendor/jade'
	[
		'app-inf'

	], (App_Inf)->
			App_Inf.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()