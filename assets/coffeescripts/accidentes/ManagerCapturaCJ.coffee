define [
  'core/sandbox'
],(sandbox)->
	CapturaCompetenciaJudicial=
		btnAgregar:null
		dialogo:null
		iniciar:->
			that=this
			this.sandbox= new sandbox this
			this.sandbox.on 'llenar-competencia-judicial-view', this.mostrarCompetenciaJudicialOnView
			this.sandbox.on 'agregar-competencia-judicial',this.actualizarCompetenciaJudicial
			btnAgregar=$('#agregar_cj_pp')
			this.llenarAccEdoFisicos()
			this.llenarDetenidoEn()
			btnAgregar.on 'click', ->
				that.showCapturaCompetenciaJudicial()
			#cancelar-competencia-judicial
			btnCancelar=$("#dialogo-cancelar-competencia-judicial")
			btnCancelar.on 'click',->
				that.cancelar()
			btnAgregar=$('#dialogo-aceptar-competencia-judicial')
			btnAgregar.on 'click', ->
				that.actualizarCompetenciaJudicial()
			$("#cargar-competencia-judicial").on 'click',(evento)->
				that.mostrarCompetenciaJudicialOnView(0)
		showCapturaCompetenciaJudicial:->
			el=$("#CapturaCompetenciaJudicialView")
			tabla=$("#tabla_competencia_judicial_view")
			cambios=
				height: "auto"
				width: "100%"
			el.css(cambios)
			cambiosTabla=
				height: "0px"
				width: "0%"
			tabla.css(cambiosTabla)
		mostrarCompetenciaJudicialOnView:(id)->
			accidente= window.accidente
			competenciasJudiciales=accidente.competenciaJudiciales
			competenciaJudicial= competenciasJudiciales[id]
			$("#nombre_cj").val(competenciaJudicial.nombre)
			$('#estado_cj').val(competenciaJudicial.estado_herido)
			$("#edad_cj").val(competenciaJudicial.edad)
			$("#domicilio_cj").val(competenciaJudicial.domicilio)
			$("#detenidoen_cj").val(competenciaJudicial.detenido_en)
			$("#adisposicionde_cj").val(competenciaJudicial.disposicion)
			$("#seencontraba_cj").val(competenciaJudicial.se_encontraba)
			this.showCapturaCompetenciaJudicial()
		actualizarCompetenciaJudicial:->
			if !this.validateField()
				return
			accidente= window.accidente
			competenciaJudiciales= accidente.competenciaJudiciales
			competenciaJudicial= {}
			competenciaJudicial.nombre= $("#nombre_cj").val()
			competenciaJudicial.estado_herido=$('#estado_cj').val()
			competenciaJudicial.edad=$("#edad_cj").val()
			competenciaJudicial.domicilio=$("#domicilio_cj").val()
			competenciaJudicial.detenido_en=$("#detenidoen_cj").val()
			competenciaJudicial.disposicion=$("#adisposicionde_cj").val()
			competenciaJudicial.se_encontraba= $("#seencontraba_cj").val()
			encontro=-1
			for competencia, i in competenciaJudiciales
				if competencia.nombre + competencia.edad == competenciaJudicial.nombre + competenciaJudicial.edad
					encontro=i
			if encontro > -1
				competenciaJudiciales[encontro]=competenciaJudicial
			else
				competenciaJudiciales.push(competenciaJudicial)
			window.accidente.competenciaJudiciales= competenciaJudiciales
			this.cancelar()
			this.sandbox.emit 'actualizar-tabla-competencia-judicial'
		validateField:()->
			if $("#nombre_cj").val()==''
				this.showFieldError($("#nombre_cj"),"Es necesario establecer El nombre")
				return false
			else
				this.showFieldSuccess($("#nombre_cj"))
			
			 
			if $('#estado_cj').val()=='SEL'
				this.showFieldError($("#estado_cj"),"Es necesario establecer El estado del  persona")
				return false
			else
				this.showFieldSuccess($("#estado_cj"))

			val_edad=$("#edad_cj").val()
			if $("#edad_cj").val()==''
				this.showFieldError($("#edad_cj"),"Es necesario establecer La edad")
				return false
			else
				rr=window.validateEdad(val_edad)
				if !rr.res
					this.showFieldError($("#edad_cj"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#edad_cj"))

			if $("#domicilio_cj").val()==''
				this.showFieldError($("#domicilio_cj"),"Es necesario establecer El domicilio")
				return false
			else
				this.showFieldSuccess($("#domicilio_cj"))
			if $("#detenidoen_cj").val()=='SEL'
				this.showFieldError($("#detenidoen_cj"),"Es necesario establecer detenido en")
				return false
			else
				this.showFieldSuccess($("#detenidoen_cj"))

			if $("#adisposicionde_cj").val()=='SEL'
				this.showFieldError($("#adisposicionde_cj"),"Es necesario establecer a disposición de")
				return false
			else
				this.showFieldSuccess($("#adisposicionde_cj"))

			if $("#seencontraba_cj").val()=='SEL'
				this.showFieldError($("#seencontraba_cj"),"Es necesario establecer se encontraba")
				return false
			else
				this.showFieldSuccess($("#seencontraba_cj"))

			this.quitarClases()
			return true
		cancelar:->
			$("#nombre_cj").val('')
			$('#estado_cj').val('')
			$("#edad_cj").val('')
			$("#domicilio_cj").val('')
			$("#detenidoen_cj").val('')
			$("#adisposicionde_cj").val('')
			$("#seencontraba_cj").val('')
			this.mostrarTabla()
		quitarClases:()->
			$(".cj").removeClass("success")
			$(".cj").removeClass("error")
		showFieldError:(item,msg)->
			padre= item.parents("div.control-group")
			padre.addClass('error')
			padre.children('.help-inline').html(msg)
			item.focus()
		showFieldSuccess:(item)->
			padre= item.parents("div.control-group")
			padre.addClass('success')
			padre.children('.help-inline').html('')	
		mostrarTabla:()->
			el=$("#CapturaCompetenciaJudicialView")
			tabla=$("#tabla_competencia_judicial_view")
			cambios=
				height: "0px"
				width: "0%"
			el.css(cambios)
			cambiosTabla=
				height: "auto"
				width: "100%"
			tabla.css(cambiosTabla)
		llenarAccEdoFisicos:->
			sel_ss=$("#estado_cj")
			opciones='<option  value="SEL">**SELECCIONAR**</option>'
			opciones+='<option value="Detenido">Detenido</option>'
			opciones+='<option value="Lesionado y Detenido">Lesionado y Detenido</option>';
			opciones+='<option value="A Disposición">A Disposición</option>';
			opciones+='<option value="SE DESCONOCE">SE DESCONOCE</option>';
			sel_ss.append opciones 
			return
		llenarDetenidoEn:->
			if !window.tbDetenidos
					cargarTbDetenidos this.llenarDetenidoEn
				else
					sel=$("#detenidoen_cj")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for detenido in window.tbDetenidos
						opciones+='<option value="' + detenido.descripcion + '">' + detenido.descripcion + '</option>';
					sel.append opciones
				return



			
