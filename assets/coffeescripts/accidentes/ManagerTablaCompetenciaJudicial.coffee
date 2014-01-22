define [
    'core/sandbox'
],(sandbox)->
	ManagerCompetenciaJudicial=
		botonId:'#agregar_competencia_judicial'
		elementId:'#tabla_saldo_sangre_view'
		padreId:"#competencia-judicial"
		boton:null
		element:null
		padre:null
		template:null
		ocultarCSS:null
		mostrarCSS:null
		iniciar:->
			that= this
			this.boton= $(this.botonId)
			this.sandbox=  new sandbox(this)
			this.padre= $(this.padreId)
			#this.template=template
			#this.padre.append(this.template)
			this.element=$(this.elementId)
			this.sandbox.on('actualizar-tabla-competencia-judicial',this.actualizarTablaCompetenciaJudicial)
			this.sandbox.on('vaciar-tabla-competencia-judicial',this.vaciarTabla)
			this.sandbox.on('cargar-competencia-judicial-view',this.cargarCompetenciaJudicialView)
			if window.accidente
				this.actualizarTablaCompetenciaJudicial()
			return
		cargarCompetenciaJudicialView:()->
			this.actualizarTablaCompetenciaJudicial()
		vaciarTabla:->
			tabla=$("#tab_competencia_judicial>tbody")
			tabla.empty()
		borrarCompetenciaJudicial:(evento)->
			identificador= evento.target.id
			her = identificador.split('-')
			id=her[1]
			competenciaJudiciales= window.accidente.competenciaJudiciales
			competenciaJudiciales.splice(id,1)
			window.accidente.competenciaJudiciales= competenciaJudiciales
			this.actualizarTablaCompetenciaJudicial()

		actualizarTablaCompetenciaJudicial:->
			that=this
			$("#tab_competencia_judicial>tbody").empty()
			tabla= $("#tab_competencia_judicial")
			for competencia,i in window.accidente.competenciaJudiciales
				if competencia
					row= "<tr>
						<td><a href=\"#editar-judicial\" id=\"borrarCompetenciaJudicial-#{i}\" class=\"borrarCompetenciaJudicial\"><i class='icon-remove'></i></a>
							<a href=\"#editar-judicial\" id=\"actualizarCompetenciaJudicial-#{i}\" class=\"actualizarCompetenciaJudicial\"><i class='icon-edit'></i></a></td>
						<td>#{competencia.nombre}</td>
						<td>#{competencia.domicilio}</td>
						<td>#{competencia.estado_herido}</td>
						<td>#{competencia.se_encontraba}</td>
						<td>#{competencia.detenido_en}</td>
						<td>#{competencia.disposicion}</td>
						</tr>"
					console.log row
					tabla.append(row)
			for comp,i in window.accidente.competenciaJudiciales
				if comp
					$("#borrarCompetenciaJudicial-#{i}").on  'click',(evento)->
						that.borrarCompetenciaJudicial(evento)
					$("#actualizarCompetenciaJudicial-#{i}").on  'click',(evento)->
						identificador= evento.currentTarget.id
						her= identificador.split('-')
						id= her[1]
						that.sandbox.emit 'llenar-competencia-judicial-view', id
			tam = window.accidente.competenciaJudiciales.length
			legenda=$("#num_competencia")
			txt="III Competencia Judicial" + '(<span class="indicador">' + tam + "</span>)"
			legenda.html(txt)
