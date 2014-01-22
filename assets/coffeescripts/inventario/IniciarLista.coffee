define [ 
  'core/sandbox'
  'inventario/BasicOperationsInventario'
],(sandbox,boi)->
			app=
				tabla:null
				boi:null
				isBuscar:true
				iniciar:()->
					that=this
					this.boi=boi
					$(".editar-inventario").on 'click',(evento)->
						ident=evento.currentTarget.id
						her= ident.split('_')
						id=her[1]
						that.ocultarLista()
						that.showCaptura(id)
					that.llenarDisponibles()
					that.iniciarCalendario()
					that.ocultarCaptura()
					$('#add-field-search').on 'click', (evento)->
						that.appendSearchField()
					$("#show-search").on 'click', (evento)->
						if that.isBuscar==true 
							that.isBuscar=false
							that.ocultarBuscar()
						else
							that.isBuscar=true
							that.mostrarBuscar()
					$('.view-inventario').on 'click', (evento)->
						ident= evento.currentTarget.id
						her=ident.split('_')
						id= her[1] 
						that.showViewInventario(id)
					$('.print-inventario').on 'click', (evento)->
						ident= evento.currentTarget.id
						her=ident.split('_')
						id= her[1] 
						that.showPdfInventario(id)
					$("#buscarInventarios").on 'click', (evento)->
						$("#page").val('')
					$(".url-nav").on 'click',(evento)->
						id=evento.currentTarget.id
						that.preDo(id)
					$("#ordenar_fecha_inventario_asc").on 'click',(evento)->
						$("#order_by").val("fecha_incid")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_fecha_inventario_desc").on 'click',(evento)->
						$("#order_by").val("fecha_incid")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_fecha_entrega_asc").on 'click',(evento)->
						$("#order_by").val("liberacion_fecha")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_fecha_entrega_desc").on 'click',(evento)->
						$("#order_by").val("liberacion_fecha")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_folio_asc").on 'click',(evento)->
						$("#order_by").val("folio_inventario")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_folio_desc").on 'click',(evento)->
						$("#order_by").val("folio_inventario")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_folio_accidente_asc").on 'click',(evento)->
						$("#order_by").val("motivo_de_recojimiento")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_folio_accidente_desc").on 'click',(evento)->
						$("#order_by").val("motivo_de_recojimiento")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_tipo_vehiculo_asc").on 'click',(evento)->
						$("#order_by").val("clas_vehiculo")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_tipo_vehiculo_desc").on 'click',(evento)->
						$("#order_by").val("clas_vehiculo")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_comandancia_asc").on 'click',(evento)->
						$("#order_by").val("comandancia")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_comandancia_desc").on 'click',(evento)->
						$("#order_by").val("comandancia")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()

					$("#ordenar_turno_asc").on 'click',(evento)->
						$("#order_by").val("turno")
						$("#order_tipo").val("asc")
						$("#form-search-inventarios").submit()
					$("#ordenar_turno_desc").on 'click',(evento)->
						$("#order_by").val("turno")
						$("#order_tipo").val("desc")
						$("#form-search-inventarios").submit()
					$("#exportarExcel").on 'click', (evento)->
						evento.preventDefault()
						$("#form-search-inventarios").attr('action','/inventario/excel').submit()
						$("#form-search-inventarios").attr('action','/inventario/list')
					$(".remove-inventario").on 'click',(evento)->
						ident= evento.currentTarget.id
						her=ident.split('_')
						id= her[1] 
						that.removeInventario(id)
					
				removeInventario:(id)->
					that=this
					$.ajax
						type:"GET"
						url:'/inventario/removeInventario/' + id + '/'
						dataType:'json'
						success: (res)->
							$("#frm-search-inventarios").submit()
						error: (error)->
							that.showMensajeError(error.responseText)
					return


				preDo:(id)->
					$("#page").val(id)
					$("#form-search-inventarios").submit()
					return
				showPdfInventario:(id)->
					that=this
					$.ajax
						type:"GET"
						url:'/inventario/ventana_reporte_from_id/' + id + '/'
						dataType:'html'
						success: (res)->
							that.showMensaje("INFRACCIÓN ",res)
						error: (error)->
							console.log error
							that.showMensajeError(error.responseText)
					return
				showViewInventario:(id)->
					that=this
					$.ajax
						type:"GET"
						url:'/inventario/viewInventario/' + id + '/'
						dataType:'html'
						success: (res)->
							that.showMensaje("INVENTARIO ",res)
						error: (error)->
							that.showMensajeError(error.responseText)
					return
				showMensajeError:(msg)->
					$div=$('#myErrorModal .modal-body').html(msg)
					$("#myErrorModal").modal('show')
					$('#myErrorModalLabel').html('ERROR')
				showMensaje:(titulo,msg)->
					$div=$('#myModal .modal-body').html(msg)
					$("#myModal").modal('show')
					$('#myModalLabel').html(titulo)
				ocultarBuscar:()->
					$("#show-search").html('<i class="icosystra-zoom-in"></i>')
					el=$("#div-search")
					cambios=
						height: "0px"
						width: "auto"
						margin: "0 0 0 0"
						padding : "0"
						overflow:"hidden"
						transition:"all 2s ease"
					el.css(cambios)
				mostrarBuscar:()->
					$("#show-search").html('<i class="icosystra-zoom-out"></i>')
					el=$("#div-search")
					cambios=
						height: "auto"
						width: "98%"
						margin: "0 10px 0 10px"
						transition:"all 4s ease"
					el.css(cambios)
				appendSearchField:->
					seleccionado=$('#campos').val()
					div=$('<div class="span4"></div>')
					label='<label>' + seleccionado + '</label>'
					inp='<input id="' + seleccionado + '" name="' + seleccionado + '" type="text">'
					div.append(label)
					div.append(inp)
					$search=$('#search-append')
					$search.append(div)
					this.quitarDisponible(seleccionado)
				quitarDisponible:(campo)->
					for disponible,i in window.disponibles_json
						if disponible == campo
							window.disponibles_json.splice(i,1)
					this.llenarDisponibles()
				llenarDisponibles:->
					sel=$('#campos').empty()
					if window.disponibles_json
						opciones='<option  value="NO">**SELECCIONAR**</option>'
						for disponible in window.disponibles_json
							opciones+='<option value="'+disponible+'">'+disponible+'</option>'
						sel.append(opciones)
				iniciarCalendario:->
					$('#fecha-inicia-append').datetimepicker
						pickTime: false
						language: 'es'
					$('#fecha-final-append').datetimepicker
						pickTime: false
						language: 'es'
				ocultarLista:->
					el=$("#pantalla-lista")
					cambios=
						height: "0px"
						margin: "0 0 0 0"
						padding : "0"
						width: "0"
						overflow:"hidden"
						transition:"all 4s ease"
					el.css(cambios)
				showCaptura:(id)->
					that=this
					$.get '/inventario/solo_captura_inventario/' + id + '/',(data)->
						$(".pantalla-captura").html(data)
						that.boi.iniciar()
						window.cargarSelects(that.boi)
						$('#mostrar-captura-preliminar').on 'click',->
							that.ocultarLista()
					el=$(".pantalla-captura")
					cambios=
						height: "auto"
						width: "98%"
						margin: "0 10px 0 10px"
						border: "1px solid #d5d5d5"
						transition:"all 4s ease"
					el.css(cambios)
				ocultarCaptura:(id)->
					el=$(".pantalla-captura")
					cambios=
						height: "0"
						width: "0"
						margin: "0"
						transition:"all 4s ease"
					el.css(cambios)
				cargarInventarios:->
					that= this
					$.ajax
						type:'GET'
						url:'listInventarios.json'
						success:(data)->
							for item in data
								tipo
								if item.folio_acc != ''
									tipo=item.folio_acc
								else
									tipo=item.folio_inf 
								that.tabla.dataTable().fnAddData [
									'<a href="#" class="updateInventario" id="'+ item.id_temp+ '">Modificar</a>  ' +  '<a href="#" class="viewInventario" id="'+ item.id_temp + '">Ver</a> ' + '<a href="#" class="deleteInventario" id="'+ item.id_temp + '">Borrar</a>' + item.id_inventario
									item.fecha_incid
									item.fecha_entrega
									item.id_inventario
									tipo
									item.tipo_vehiculo
									item.comandancia
									item.turno
									item.infrac_accid
								]
								$('.updateInventario').on 'click', (evento)->
									console.log evento.target.id
									console.log window
									id= evento.target.id
									window.location.href="cargarInventario/"+ id
									return
								$('.viewInfraccion').on 'click', ()->
									console.log "Vamos a ver el inventario"
								$('.deleteInfraccion').on 'click', ()->
									console.log "Vamos a Borrar el inventario"
				cargarInventario:->
					console.log "llover"
			return app
				


