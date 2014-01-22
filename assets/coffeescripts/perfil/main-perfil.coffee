require[
		'app-perfil'

	], (App_Perfil)->
			App_Perfil.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()