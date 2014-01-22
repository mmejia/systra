define [
    'core/sandbox'
],(sandbox)->
	ManagerTableVehiculos=
		botonId:'#guardar_vehiculo_parte'
		vehiculos:[]
		elementId:'#tabla_vehiculos_view'
		padreId:"#tab_vehiculos"
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
			this.sandbox.on('actualizar-tabla-vehiculos',this.actualizarTablaVehiculos)
			this.sandbox.on('show-tabla-vehiculos_c', this.showTablaVehiculos)
			this.sandbox.on('vaciar-tabla-vehiculos', this.vaciarTabla)
			this.sandbox.on('cargar-vehiculos-en-view',this.cargarVehiculosEnView)
			if window.accidente
				this.actualizarTablaVehiculos()
			return
		cargarVehiculosEnView:()->
			this.actualizarTablaVehiculos()
			this.sandbox.emit 'cargar-saldo-sangre-view'
			this.sandbox.emit 'cargar-competencia-judicial-view'

		vaciarTabla:()->
			tabla=$("#tab_vehiculos>tbody")
			tabla.empty()
			legenda=$("#num_vehiculos")
			txt="I Vehículos y Conductores Involucrados" + ' (<span class="indicador">' + 0 + "</span>)"
			legenda.html(txt)


		showTablaVehiculos:->
			$('a[href="#pane1"]').tab('show')

		removeVehiculoFromTabla:(id)->
			index=-1
			vehiculos=window.accidente.vehiculos
			for vehiculo,i in vehiculos
				if vehiculo.intervino_como== id
					index=i
					break
			if index>=0
				vehiculos.splice(index,1)
				this.actualizarTablaVehiculos()
		actualizarTablaVehiculos:->
			that=this
			tabla=$("#tab_vehiculos>tbody")
			tabla.empty()
			for vehiculo in window.accidente.vehiculos
				if vehiculo
					row= "<tr>
						<td><a href=\"#editar-vehiculo\" id=\"del_#{vehiculo.intervino_como}\" class=\"vehiculoEliminar\"><span class=\"icosystra-remove\"></span></a>
							<a href=\"#editar-vehiculo\" id=\"up_#{vehiculo.intervino_como}\" class=\"vehiculoActualizar\"><span class=\"icosystra-pencil\"></span></a></td>
						<td>#{vehiculo.intervino_como}</td>
						<td>#{vehiculo.placa}</td>
						<td>#{vehiculo.marca}</td>
						<td>#{vehiculo.submarca}</td>
						<td>#{vehiculo.tipo}</td>
						<td>#{vehiculo.modelo}</td>
						<td>#{vehiculo.color}</td>
						</tr>"
					tabla.append(row)
					$('#up_'+ vehiculo.intervino_como).on "click", (evento)->
						id= evento.currentTarget.id
						her = id.split('_')
						that.sandbox.emit 'cargar-datos-vehiculo-en-view', her[1]
						tam = window.accidente.vehiculos.length
						legenda=$("#num_vehiculos")
						txt="I Vehículos y Conductores Involucrados" + ' (<span class="indicador">' + tam + "</span>)"
						legenda.html(txt)
					$('#del_'+ vehiculo.intervino_como).on 'click',(evento)->
						id= evento.currentTarget.id
						her = id.split('_')
						that.removeVehiculoFromTabla(her[1])
						tam = window.accidente.vehiculos.length
						legenda=$("#num_vehiculos")
						txt="I Vehículos y Conductores Involucrados" + ' (<span class="indicador">' + tam + "</span>)"
						legenda.html(txt)
			tam = window.accidente.vehiculos.length
			legenda=$("#num_vehiculos")
			txt="I Vehículos y Conductores Involucrados" + ' (<span class="indicador">' + tam + "</span>)"
			legenda.html(txt)




		mostrarAgregarVehiculo:->
			this.sandbox.emit('agregar-vehiculo')
			return
