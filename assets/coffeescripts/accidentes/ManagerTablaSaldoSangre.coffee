define [ 
    'core/sandbox'
],(sandbox)->
	ManagerSaldoSangre=
		botonId:'#agregar_saldo_sangre'
		elementId:'#tabla_saldo_sangre_view'
		padreId:"#saldo-sangre"
		boton:null
		element:null
		padre:null
		template:null
		ocultarCSS:null
		mostrarCSS:null
		num_saldo:0
		iniciar:->
			that= this
			this.boton= $(this.botonId)
			this.sandbox=  new sandbox(this)
			this.padre= $(this.padreId)
			#this.template=template
			#this.padre.append(this.template)
			this.element=$(this.elementId)
			this.sandbox.on('actualizar-tabla-saldo-sangre',this.actualizarTablaSaldoSangre)
			this.sandbox.on('vaciar-tabla-saldo-sangre',this.vaciarTabla)
			this.sandbox.on('cargar-saldo-sangre-view',this.cargarSaldoSangreEnView)
			if window.accidente
				this.actualizarTablaSaldoSangre()
			return
		vaciarTabla:->
			tabla=$("#tab_saldo_sangre>tbody")
			tabla.empty()
		cargarSaldoSangreEnView:()->
			this.actualizarTablaSaldoSangre()
		borrarSaldoSangre:(evento)->
			identificador= evento.target.id
			her = identificador.split('-')
			id=her[1]
			saldoSangres= window.accidente.saldoSangres;
			saldoSangres.splice(id,1)
			window.accidente.saldoSangres= saldoSangres
			this.actualizarTablaSaldoSangre()
		actualizarTablaSaldoSangre:->
			that=this
			tabla=$("#tab_saldo_sangre>tbody")
			tabla.empty()
			for saldo,i in window.accidente.saldoSangres
				if saldo
					row= "<tr>
						<td><a href=\"#editar-sangre\" id=\"borrarSaldo-#{i}\" class=\"borrarSaldoSangre\"><i class='icon-remove'></i></a>
							<a href=\"#editar-sangre\" id=\"actualizarSaldo-#{i}\" class=\"actualizarSaldoSangre\"><i class='icon-edit'></i></a></td>
						<td>#{saldo.nombre}</td>
						<td>#{saldo.edad}</td>
						<td>#{saldo.domicilio}</td>
						<td>#{saldo.se_encontraba}</td>
						<td>#{saldo.estado_herido}</td>
						<td>#{saldo.levantado_por}</td>
						<td>#{saldo.trasladado_a}</td>
						</tr>"
					tabla.append(row)
			for saldo,i in window.accidente.saldoSangres
				if saldo
					$("#borrarSaldo-#{i}").on  'click',(evento)->
						that.borrarSaldoSangre(evento)
					$("#actualizarSaldo-#{i}").on  'click',(evento)->
						identificador= evento.currentTarget.id
						her= identificador.split('-')
						id= her[1]
						that.sandbox.emit 'llenar-saldo-sangre-view', id
			tam = window.accidente.saldoSangres.length
			legenda=$("#num_sangres")
			txt="II Saldo de Sangre" + '(<span class="indicador">' + tam + "</span>)"
			legenda.html(txt)
