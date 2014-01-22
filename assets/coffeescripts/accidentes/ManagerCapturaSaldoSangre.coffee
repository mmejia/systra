define [
  'core/sandbox'
],(sandbox)->
	CapturaSaldoSangre=
		btnAgregar:null
		dialogo:null
		iniciar:->
			that=this
			this.sandbox= new sandbox this
			this.sandbox.on 'llenar-saldo-sangre-view', this.mostrarSaldoSangreOnView
			this.sandbox.on 'agregar-saldo-sangre',this.actualizarSaldoSangre
			this.llenarAccEdoFisicos()
			this.llenarSeEncontraba()
			btnShow=$('#agregar_ss_pp')
			btnShow.on 'click', ->
				that.showCapturaSaldoSangre()
			btnCancelar=$("#cancelar-saldo-sangre")
			btnCancelar.on 'click',->
				that.cancelar()
			btnAgregar=$('#dialogo-aceptar-saldo-sangre')
			btnAgregar.on 'click', ->
				that.actualizarSaldoSangre()
			$("#cargar-saldo-sangre").on  'click', (evento)->
				that.mostrarSaldoSangreOnView(0)
		showCapturaSaldoSangre:->
			el=$("#CapturaSaldoSangreView")
			tabla=$("#tabla_saldo_sangre_view")
			cambios=
				height: "auto"
				width: "100%"
			el.css(cambios)
			cambiosTabla=
				height: "0px"
				width: "0%"
			tabla.css(cambiosTabla)
			
		mostrarSaldoSangreOnView:(id)->
			console.log window.accidente
			accidente= window.accidente
			sangres=accidente.saldoSangres
			saldoSangre= sangres[id]
			$("#nombre_ss").val(saldoSangre.nombre)
			$("#edad_ss").val(saldoSangre.edad)
			$("#domicilio_ss").val(saldoSangre.domicilio)
			$("#seencontraba_ss").val(saldoSangre.se_encontraba)
			$('#estado_ss').val(saldoSangre.estado_herido)
			$("#levantadopor_ss").val(saldoSangre.levantado_por)
			$("#trasladadoa_ss").val(saldoSangre.trasladado_a)
			$("#adisposicionde_ss").val(saldoSangre.disposicion)
			$("#nacionalidad_ss").val(saldoSangre.nacionalidad)
			this.showCapturaSaldoSangre()

		actualizarSaldoSangre:->
			alert 'Como te recurdo'
			if !this.validateField()
				return
			accidente= window.accidente
			sangres=accidente.saldoSangres
			saldoSangre={}
			saldoSangre.nombre= $("#nombre_ss").val()
			saldoSangre.edad=$("#edad_ss").val()
			saldoSangre.domicilio=$("#domicilio_ss").val()
			saldoSangre.se_encontraba= $("#seencontraba_ss").val()
			saldoSangre.estado_herido=$('#estado_ss').val()
			saldoSangre.levantado_por= $("#levantadopor_ss").val()
			saldoSangre.trasladado_a=$("#trasladadoa_ss").val()
			saldoSangre.disposicion=$("#adisposicionde_ss").val()
			saldoSangre.nacionalidad=$("#nacionalidad_ss").val()
			encontro=-1
			for sangre, i in sangres
				if sangre.nombre + sangre.edad == saldoSangre.nombre + saldoSangre.edad
					encontro=i
			if encontro > -1
				sangres[encontro]=saldoSangre
			else
				sangres.push(saldoSangre)
			window.accidente.saldoSangres= sangres
			this.cancelar()
			this.sandbox.emit 'actualizar-tabla-saldo-sangre'
		cancelar:->
			$("#nombre_ss").val('')
			$("#edad_ss").val('')
			$("#domicilio_ss").val('')
			$("#seencontraba_ss").val('')
			$('#estado_ss').val('')
			$("#levantadopor_ss").val('')
			$("#trasladadoa_ss").val('')
			$("#adisposicionde_ss").val('')
			$("#nacionalidad_ss").val('')
			this.mostrarTabla()
		validateField:->
			if $("#nombre_ss").val()==''
				this.showFieldError($("#nombre_ss"),"Es necesario establecer El nombre")
				return false
			else
				this.showFieldSuccess($("#nombre_ss"))
			 
			if $('#estado_ss').val()=='SEL'
				this.showFieldError($("#estado_ss"),"Es necesario establecer El estado del  persona")
				return false
			else
				this.showFieldSuccess($("#estado_ss"))
			val_edad=$("#edad_ss").val()
			if $("#edad_ss").val()==''
				this.showFieldError($("#edad_ss"),"Es necesario establecer La edad")
				return false
			else
				rr=window.validateEdad(val_edad)
				if !rr.res
					this.showFieldError($("#edad_ss"),rr.msg)
					return false
				else
					this.showFieldSuccess($("#edad_ss"))
			if $("#nacionalidad_ss").val()==''
				this.showFieldError($("#nacionalidad_ss"),"Es necesario establecer la nacionalidad")
				return false
			else
				this.showFieldSuccess($("#nacionalidad_ss"))

			if $("#domicilio_ss").val()==''
				this.showFieldError($("#domicilio_ss"),"Es necesario establecer El domicilio")
				return false
			else
				this.showFieldSuccess($("#domicilio_ss"))
			
			if $("#levantadopor_ss").val()=='SEL'
				this.showFieldError($("#levantadopor_ss"),"Es necesario establecer levantado por")
				return false
			else
				this.showFieldSuccess($("#levantadopor_ss"))
			if $("#trasladadoa_ss").val()=='SEL'
				this.showFieldError($("#trasladadoa_ss"),"Es necesario establecer trasladado a")
				return false
			else
				this.showFieldSuccess($("#trasladadoa_ss"))
			if $("#adisposicionde_ss").val()=='SEL'
				this.showFieldError($("#adisposicionde_ss"),"Es necesario establecer a disposicion de")
				return false
			else
				this.showFieldSuccess($("#adisposicionde_ss"))
			if $("#seencontraba_ss").val()=='SEL'
				this.showFieldError($("#seencontraba_ss"),"Es necesario establecer se encontraba")
				return false
			else
				this.showFieldSuccess($("#seencontraba_ss"))
			this.quitarClases()
			return true
		quitarClases:()->
			alert "Hola mundo"
			$(".ss").removeClass("success")
			$(".ss").removeClass("error")
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
			el=$("#CapturaSaldoSangreView")
			tabla=$("#tabla_saldo_sangre_view")
			cambios=
				height: "0px"
				width: "0%"
			el.css(cambios)
			cambiosTabla=
				height: "auto"
				width: "100%"
			tabla.css(cambiosTabla)
		llenarAccEdoFisicos:->
			sel_ss=$("#estado_ss")
			opciones='<option  value="SEL">**SELECCIONAR**</option>'
			opciones+='<option value="Lesionado">Lesionado</option>'
			opciones+='<option value="Lesionado y Detenido">Lesionado y Detenido</option>';
			opciones+='<option value="Finado">Finado</option>';
			opciones+='<option value="SE DESCONOCE">SE DESCONOCE</option>';
			sel_ss.append opciones 
			return
		llenarSeEncontraba:->
			if !window.accEdoFisicos
					cargarAccEdoFisicos this.llenarSeEncontraba
				else
					sel=$("#seencontraba_ss")
					opciones='<option  value="SEL">**SELECCIONAR**</option>'
					for estado in window.accEdoFisicos
						opciones+='<option value="' + estado.estado + '">' + estado.estado + '</option>';
					sel.append opciones
				return

			







			
