require 
	paths:
		jade:'./vendor/jade'
	[
		'app-main'
  ], (App_Main)->
		App_Main.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()