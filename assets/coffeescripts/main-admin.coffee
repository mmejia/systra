require
	paths:
		jade:'vendor/jade'
	[
		'app-admin2'

	], (App_Admin)->
			App_Admin.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()