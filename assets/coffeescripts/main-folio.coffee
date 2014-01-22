require
	paths:
		jade:'vendor/jade'
	[
		'app-folio'

	], (App_folio)->
			App_folio.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()