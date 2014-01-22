require [
		'app-list-perfil'

	], (App_List_Perfil)->
			alert 'Hola mundo'
			App_List_Perfil.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()