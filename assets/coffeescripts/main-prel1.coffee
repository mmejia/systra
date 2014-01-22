require
	paths:
		jade:'./vendor/jade'
	[
		'app-prel5'

	], (App_Prel)->
			App_Prel.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()