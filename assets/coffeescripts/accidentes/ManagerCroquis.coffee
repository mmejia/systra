define [ '../core/sandbox'
], (sandbox) ->
	app=
		sandbox:null
		simbologia:null
		iniciar:(accidente)->
			this.sandbox=new sandbox(this)
			this.simbologia=$('#ta_simbologia_pp')
			this.sandbox.on 'limpiar-croquis-view', this.limpiarCroquisView
			this.sandbox.on 'show-croquis-view', this.showCroquis
			this.sandbox.on 'vaciar-simbologia-view', this.vaciarSimbologia
			this.sandbox.on 'add-text-simbologia', this.appendSimbologia
			this.sandbox.on 'llenar-accidente-simbologia',this.llenarAccidenteSimbologia
		llenarAccidenteSimbologia:->
			accidente=window.accidente
			accidente.simbologia_croquis= this.simbologia.val()
			return  
		limpiarCroquisView:->
			$('#img_croquis').removeAttr('src')
			$('#img_croquis').hide()
		showCroquis:->
			$('#img_croquis').show()
		vaciarSimbologia:->
			 this.simbologia.val('')
		appendSimbologia:(data)->
			this.simbologia.val(data.contenido)
			return 




