define [],()->
		TablaManager=
			datos:null
			indice:0
			offset:5
			tam:0
			current:0
			getDatos:()->
				that=this
				$.ajax
					type:"GET"
					url:"/accidente/listarActivos"
					success:(datos)->
						that.datos= datos
						that.tabla.children('tbody').empty()
						for i in [that.indice..that.offset]
							dato=datos[i]
							if dato!= undefined
								opc='<tr>'
								opc+= '<td><a href="#" id="' + dato.id_unico + '"><i class="icon-ok-sign"></i></a> </td>' 
								opc+= '<td>' + dato.fecha_evento + '</td>'
								opc+= '<td>' + dato.folio_evento + '</td>'
								opc+= '<td>' + dato.agente_intervino + '</td>'
								opc+= '<td>' + dato.calle1 + '</td>'
								opc+= '</tr>'
								that.tabla.children('tbody').append(opc)
								that.registrarEvento(dato.id_unico)
						that.actualizarPaginacion()
			buscarActivos:(id_unico)->
				if this.datos
					for activo in this.datos
						if activo.id_unico== id_unico	
							return activo
				return null
			registrarEvento:(id_unico)->
				that=this
				$('#' + id_unico).on 'click', (evento)->
					id= evento.currentTarget.id
					preliminar=that.buscarActivos(id)
					if preliminar!=null
						accidente= window.accidente
						if !accidente
							that.reiniciarAccidente()
						accidente= window.accidente
						accidente.id_unico= preliminar.id_unico
						$("#folio_accidente").val(preliminar.folio_evento)
						$("#nombre_agente_intervino_pp").val(preliminar.agente_intervino)
						$("#delegacion_pp").val(preliminar.delegacion)
						window.actualizarComandanciaValor(preliminar.delegacion)
						$("#turno_pp").val(preliminar.turno)
						$("#fecha-fecha_pp").val(preliminar.fecha_evento)
						$("#hora-hora_pp").val(preliminar.hora_evento)
						$("#clasAccidente_pp").val(preliminar.id_clasificacion)
						$("#calle1_pp").val(preliminar.calle1)
						$("#calle2_pp").val(preliminar.calle2)
						$("#frente_num").val(preliminar.ref)
						$("#colonia_pp").val(preliminar.colonia)
						$("#estado_pp").val("GUANAJUATO")
						$("#municipio_pp").val("LEÓN")
						that.ocultarSelPreliminar()
					else
						that.ocultarSelPreliminar()
			ocultarSelPreliminar:()->
				el=$("#sel-preliminar")
				cambios=
					height: "0px"
					width: "0px"
				el.css(cambios)
			reiniciarAccidente:->
				window.accidente={};
				window.accidente.vehiculos=[];
				window.accidente.saldoSangres=[];
				window.accidente.intervino={}
				window.accidente.superviso={}
				window.accidente.fotos=[]
				window.accidente.croquis=''
				window.accidente.observaciones=''
				window.accidente.investigaciones=''
				window.accidente.competenciaJudiciales=[]
				window.accidente.articulos=[]
				window.accidente.otros={}
				window.accidente.estado_calles={}
				window.accidente.danos=[]
				window.accidente.simbologia_croquis=''
			actualizarTabla:()->
				that=this 
				that.tabla.children('tbody').empty()
				console.log "El indice : " + that.indice + "  offset:  " + that.offset
				for i in [that.indice..that.offset]
					dato=that.datos[i]
					opc='<tr>'
					opc+= '<td><a href="#" id="' + dato.id_unico + '"><i class="icon-ok-sign"></i></a> </td>' 
					opc+= '<td>' + dato.fecha_evento + '</td>'
					opc+= '<td>' + dato.folio_evento + '</td>'
					opc+= '<td>' + dato.agente_intervino + '</td>'
					opc+= '<td>' + dato.calle1 + '</td>'
					opc+= '</tr>'
					that.tabla.children('tbody').append(opc)
					that.registrarEvento(dato.id_unico)

				#that.actualizarPaginacion()
			actualizarPaginacion:()->
				that=this
				tam= that.datos.length
				numero=tam/that.offset
				residuo= tam % that.offset
				pag=$("#paginacion-sel-preliminar")
				pag.html('')
				ul=$("<ul></ul>")
				pag.append(ul)
				ul.append('<li><a id="pag-sel-pre-previo" href="#">Prev</a></li>')
				$('#pag-sel-pre-previo').on 'click',(evento)->
					if that.indice==0
						that.indice=0
					else
						that.indice= that.indice-that.offset
					that.actualizarTabla()
					that.desactivarLiga(ul,that.indice)
				for i in [0..numero]
					pos=i * that.offset
					#console.log pos
					tmp= i+1
					if pos==that.indice
						ul.append('<li class="disabled"><a id="pag-sel-pre--' + pos + '" href="#">' + tmp + '</a></li>')
					else
						ul.append('<li><a id="pag-sel-pre--' + pos + '" href="#">' + tmp + '</a></li>')
					$('#pag-sel-pre--' + pos).on 'click',(evento)->
						ident= evento.currentTarget.id
						her= ident.split('--')
						that.indice= her[1]
						that.actualizarTabla()
						that.desactivarLiga(ul,that.indice)
						 
				ul.append('<li ><a id="pag-sel-pre-next" href="#">Sig.</a></li>')
				$('#pag-sel-pre-next').on 'click',(evento)->
					if that.indice+ that.offset< that.datos.length
						that.indice=that.indice+that.offset
					that.actualizarTabla()
					that.desactivarLiga(ul,that.indice)
				 

			desactivarLiga:(ul,pos)->
				that=this
				indice= pos/that.offset
				indice= indice + 1
				ul.children('li').removeClass('disabled')
				ul.children('li:eq(' + indice + ')').addClass('disabled')


			iniciar:->
				that=this
				#$.fn.mitabla=()->
				#	that.tabla= this
				#	that.getDatos()


					

