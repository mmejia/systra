require
	paths:
		jade:'./vendor/jade'
	[
		'app-inv2'

	], (App_Inf)->
			App_Inf.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()