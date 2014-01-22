define [ 'core/sandbox'
], (sandbox) ->
	ManagerOtros=
		sandbox:null
		dialogo:null
		iniciar:()->
			this.sandbox = new sandbox this
			that=this
			this.llenarVisibilidades()
			this.llenarParteDias()
			this.llenarTipoCalles()
			this.llenarNoCarriles()
			this.llenarSentidos()
			this.llenarAlineaciones()
			this.llenarEstadoCalles()
			this.llenarClimas()
			this.llenarRegulaciones()
			this.llenarObjetosDanados()
			btnAgregar= $('#agregar_danos')
			btnAgregar.on 'click',->
				that.showCapturarDanos()
			btnCancelarDanos=$('#cancelar-danos')
			btnCancelarDanos.on 'click', ->
				that.cancelarCapturaDanos()
			btnAceptarDanos=$('#aceptar-danos')
			btnAceptarDanos.on 'click',->
				that.aceptarDanos()
			this.sandbox.on 'show-otros-view', this.mostrarOtrosOnview
			this.sandbox.on 'refresca-tabla-danos', this.refrescarTablaDanos
			this.sandbox.on 'llenar-otros-window', this.actualizarOtros
			this.sandbox.on 'borrar-otros-view', this.cancelar

		eliminarDano:(ident)->
			danos= window.accidente.danos
			danos.splice(ident,1)
			this.refrescarTablaDanos()
		aceptarDanos:->
			if !this.validateFieldDanos()
				return 
			accidente= window.accidente
			danos=[]
			if accidente.danos == undefined
				danos=accidente.danos=[]
			danos= accidente.danos
			dano={}
			dano.obj=$('#objetos_danados_o').val()
			dano.tipo=$('#tipo_danos_o').val()
			dano.dueno=$('#dueno_o').val()
			dano.monto=$('#monto_danos_o').val()
			danos=this.agregarDanoArreglo(danos,dano)
			accidente.danos= danos
			this.refrescarTablaDanos()
			this.cancelarCapturaDanos()
		agregarDanoArreglo:(arr,dn)->
			clone = arr.slice(0)
			ban=false
			for dano,i in clone
				if dano.obj == dn.obj
					arr[i]= dn
					ban=true
			if !ban
				arr.push(dn)
			return arr
		vaciarTabla:->
			tabla=$("#tab_otros>tbody")
			tabla.empty()
		refrescarTablaDanos:->
			that=this
			tabla=$("#tab_otros > tbody")
			tabla.empty()
			danos= accidente.danos
			for dano,i in danos
				if dano
					row= "<tr>
						<td><a href=\"#tab_danos\" id=\"tdEliminar_#{i}\" class=\"danoEliminar\"><i class='icon-remove'></i></a>
							<a href=\"#editar_danos\" id=\"tdActualizar_#{i}\" class=\"danoActualizar\"><i class='icon-edit'></i></a></td>
						<td>#{dano.obj}</td>
						<td>#{dano.tipo}</td>
						<td>#{dano.dueno}</td>
						<td>#{dano.monto}</td>
						</tr>"
					#console.log row
					tabla.append(row)
					$("#tdActualizar_#{i}").on 'click', (evento)->
						console.log evento
						id=evento.currentTarget.id
						her= id.split('_')
						that.showDanoOnView(her[1])
						that.showCapturarDanos()
					$("#tdEliminar_#{i}").on 'click', (evento)->
						id=evento.currentTarget.id
						her= id.split('_')
						that.eliminarDano(her[1])
						
			tam = window.accidente.danos.length
			legenda=$("#num_danos")
			txt="Daños acumulados" + '(<span class="indicador">' + tam + "</span>)"
			legenda.html(txt)
			return
		showDanoOnView:(ident)->
			danos= window.accidente.danos
			dano= danos[ident]
			$('#objetos_danados_o').val(dano.obj)
			$('#tipo_danos_o').val(dano.tipo)
			$('#dueno_o').val(dano.dueno)
			$('#monto_danos_o').val(dano.monto)
		showCapturarDanos:->
			el=$("#capturaDanos")
			tabla=$("#tab_otros_view")
			cambios=
				height: "auto"
				width: "100%"
			el.css(cambios)
			cambiosTabla=
				height: "0px"
				width: "0%"
			tabla.css(cambiosTabla)
		mostrarTabla:()->
			el=$("#capturaDanos")
			tabla=$("#tab_otros_view")
			cambios=
				height: "0px"
				width: "0%"
			el.css(cambios)
			cambiosTabla=
				height: "auto"
				width: "100%"
			tabla.css(cambiosTabla)
		cancelarCapturaDanos:->
			$('#objetos_danados_o').val('')
			$('#tipo_danos_o').val('')
			$('#dueno_o').val('')
			$('#monto_danos_o').val('')
			this.mostrarTabla()
		validateFieldDanos:->
			if $('#objetos_danados_o').val()=='SEL'
				this.showFieldError($("#objetos_danados_o"),"Es necesario seleccionar el objeto dañado")
				return false
			else
				this.showFieldSuccess($("#objetos_danados_o"))

			if $('#tipo_danos_o').val()==''
				this.showFieldError($("#tipo_danos_o"),"Es necesario seleccionar el tipo de daño")
				return false
			else
				this.showFieldSuccess($("#tipo_danos_o"))

			if $('#dueno_o').val()==''
				this.showFieldError($("#dueno_o"),"Es necesario seleccionar nombre del dueño")
				return false
			else
				this.showFieldSuccess($("#dueno_o"))

			if $('#monto_danos_o').val()==''
				this.showFieldError($("#monto_danos_o"),"Es necesario seleccionar el monto aprox")
				return false
			else
				this.showFieldSuccess($("#monto_danos_o"))
			this.quitarClasesDanos()
			return true
		mostrarTab:()->
			$('#complementarios_pp li:eq(1) a').tab('show'); 
		validateFieldOtros:->
			if $('#alumbrado_publico_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#alumbrado_publico_o"),"Es necesario establecer la visibilidad")
				return false
			else
				this.showFieldSuccess($("#alumbrado_publico_o"))

			if $('#parte_dia_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#parte_dia_o"),"Es necesario establecer parte del día")
				return false
			else
				this.showFieldSuccess($("#parte_dia_o"))

			if $('#tipo_calle_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#tipo_calle_o"),"Es necesario establecer el tipo de calle")
				return false
			else
				this.showFieldSuccess($("#tipo_calle_o"))

			if $('#no_carriles_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#no_carriles_o"),"Es necesario establecer el número de carriles")
				return false
			else
				this.showFieldSuccess($("#no_carriles_o"))

			if $('#sentido_calle_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#sentido_calle_o"),"Es necesario establecer el sentido de las calles")
				return false
			else
				this.showFieldSuccess($("#sentido_calle_o"))

			if $('#alineacion_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#alineacion_o"),"Es necesario establecer la alineacion")
				return false
			else
				this.showFieldSuccess($("#alineacion_o"))

			if $('#estado_pavimento_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#estado_pavimento_o"),"Es necesario establecer el estado del pavimento")
				return false
			else
				this.showFieldSuccess($("#estado_pavimento_o"))

			if $('#clima_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#clima_o"),"Es necesario establecer el clima")
				return false
			else
				this.showFieldSuccess($("#clima_o"))

			if $('#regulacion_o').val()=='SEL'
				this.mostrarTab()
				this.showFieldError($("#regulacion_o"),"Es necesario establecer la regulación")
				return false
			else
				this.showFieldSuccess($("#regulacion_o"))
			this.quitarClasesOtros()
			return true
		quitarClasesOtros:()->
			$(".otros-v").removeClass("success")
			$(".otros-v").removeClass("error")
		quitarClasesDanos:()->
			$(".danos-v").removeClass("success")
			$(".danos-v").removeClass("error")
		showFieldError:(item,msg)->
			padre= item.parents("div.control-group")
			padre.addClass('error')
			padre.children('.help-inline').html(msg)
			item.focus()
		showFieldSuccess:(item)->
			padre= item.parents("div.control-group")
			padre.addClass('success')
			padre.children('.help-inline').html('')	
		cancelar:->
			#console.log "Borrar otros"
			$('#alumbrado_publico_o').val('')
			$('#parte_dia_o').val('')
			$('#tipo_calle_o').val('')
			$('#no_carriles_o').val('')
			$('#sentido_calle_o').val('')
			$('#alineacion_o').val('')
			$('#estado_pavimento_o').val('')
			$('#clima_o').val('')
			$('#regulacion_o').val('')
			this.vaciarTabla()
		actualizarOtros:->
			otros=window.accidente.otros={}
			estado_calles= window.accidente.estado_calles={}
			otros.visibilida=$('#alumbrado_publico_o').val()
			otros.parte_dia=$('#parte_dia_o').val()
			otros.tipo_calle=$('#tipo_calle_o').val()
			otros.no_carriles=$('#no_carriles_o').val()
			otros.sentido_calle=$('#sentido_calle_o').val()
			estado_calles.alineacion=$('#alineacion_o').val()
			estado_calles.estado_pavimento=$('#estado_pavimento_o').val()
			estado_calles.clima=$('#clima_o').val()
			estado_calles.regulacion=$('#regulacion_o').val()
		mostrarOtrosOnview:->
			#console.log window.accidente
			if !window.accidente.otros
				window.accidente.otros={}
			if !window.accidente.estado_calles
				window.accidente.estado_calles={}
			if !window.accidente.danos
				window.accidente.danos=[]
			otros=window.accidente.otros
			estado_calles= window.accidente.estado_calles
			$('#alumbrado_publico_o').val(otros.visibilida)
			$('#parte_dia_o').val(otros.parte_dia)
			$('#tipo_calle_o').val(otros.tipo_calle)
			$('#no_carriles_o').val(otros.no_carriles)
			$('#sentido_calle_o').val(otros.sentido_calle)
			$('#alineacion_o').val(estado_calles.alineacion)
			$('#estado_pavimento_o').val(estado_calles.estado_pavimento)
			$('#clima_o').val(estado_calles.clima)
			$('#regulacion_o').val(estado_calles.regulacion)
			this.refrescarTablaDanos()


	  		
		llenarVisibilidades:->
			if !window.visibilidades
				cargarVisibilidades this.llenarVisibilidades
			else
				ctl_visibilidades=$('#alumbrado_publico_o')
			
				ctl_visibilidades.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for visibilidad in window.visibilidades
					 opciones+='<option value="'+visibilidad.descripcion+'">'+visibilidad.descripcion+'</option>'
				ctl_visibilidades.append(opciones)
			return
		llenarParteDias:->
			if !window.parteDias
				cargarParteDias this.llenarParteDias
			else
				ctl_parteDias=$('#parte_dia_o')
				ctl_parteDias.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for parteDia in window.parteDias
					 opciones+='<option value="'+parteDia.descripcion+'">'+parteDia.descripcion+'</option>'
				ctl_parteDias.append(opciones)
			return
		llenarTipoCalles:->
			if !window.tipoCalles
				cargarTipoCalles this.llenarTipoCalles
			else
				ctl_tipoCalles=$('#tipo_calle_o')
			
				ctl_tipoCalles.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for tipoCalle in window.tipoCalles
					 opciones+='<option value="' + tipoCalle.descripcion_tipo + '">' + tipoCalle.descripcion_tipo + '</option>'
				ctl_tipoCalles.append(opciones)
			return
		llenarNoCarriles:->
			if !window.noCarriles
				cargarNoCarriles this.llenarNoCarriles
			else
				ctl_noCarriles=$('#no_carriles_o')
			
				ctl_noCarriles.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for noCarriles in window.noCarriles
					 opciones+='<option value="'+noCarriles.carriles+'">'+noCarriles.carriles+'</option>'
				ctl_noCarriles.append(opciones)
			return
		llenarSentidos:->
			if !window.sentidos
				cargarSentidos this.llenarSentidos
			else
				ctl_sentidos=$('#sentido_calle_o')
			
				ctl_sentidos.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for sentido in window.sentidos
					 opciones+='<option value="'+sentido.sentido+'">'+sentido.sentido+'</option>'
				ctl_sentidos.append(opciones)
			return
		llenarAlineaciones:->
			if !window.alineaciones
				cargarAlineaciones this.llenarAlineaciones
			else
				ctl_alineaciones=$('#alineacion_o')
				ctl_alineaciones.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for alineacion in window.alineaciones
					opciones+='<option value="'+alineacion.alicamino+'">'+alineacion.alicamino+'</option>'
					#console.log opciones
				ctl_alineaciones.append(opciones)
			return
		llenarEstadoCalles:->
			if !window.estadoCalles
				cargarEstadoCalles this.llenarEstadoCalles
			else
				ctl_estadoCalles=$('#estado_pavimento_o')
			
				ctl_estadoCalles.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for estadoCalle in window.estadoCalles
					 opciones+='<option value="'+ estadoCalle.estado + '">'+ estadoCalle.estado + '</option>'
				ctl_estadoCalles.append(opciones)
			return
		llenarClimas:->
			if !window.climas
				cargarClimas this.llenarClimas
			else
				ctl_climas=$('#clima_o')
			
				ctl_climas.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for clima in window.climas
					 opciones+='<option value="'+clima.clima+'">'+clima.clima+'</option>'
				ctl_climas.append(opciones)
			return
		llenarRegulaciones:->
			if !window.regulaciones
				cargarRegulaciones this.llenarRegulaciones
			else
				ctl_regulaciones=$('#regulacion_o')
				ctl_regulaciones.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for regulacion in window.regulaciones
					 opciones+='<option value="'+regulacion.descripcion+'">'+regulacion.descripcion+'</option>'
				ctl_regulaciones.append(opciones)
			return
		llenarObjetosDanados:->
			if !window.objetosDanados
				cargarObjetosDanados this.llenarObjetosDanados
			else
				ctl_objetos_danados=$('#objetos_danados_o')
				ctl_objetos_danados.html("")
				opciones='<option  value="SEL">**SELECCIONAR**</option>'
				for objetosDanado in window.objetosDanados
					 opciones+='<option value="'+objetosDanado.descripcion+'">'+objetosDanado.descripcion+'</option>'
				ctl_objetos_danados.append(opciones)
			return


			 