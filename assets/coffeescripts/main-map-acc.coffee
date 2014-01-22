require [
  'app-map-acc'
], (App)->
	App.iniciar()
require.config
	urlArgs:"bust=" + (new Date()).getTime()