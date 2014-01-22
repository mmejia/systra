require [
  'app_list_pre'
 ],(App)->
		App.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()