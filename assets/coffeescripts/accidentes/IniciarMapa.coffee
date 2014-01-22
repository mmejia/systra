define [
  'core/sandbox'
  'accidentes/ManagerBusquedaEstMapas'
  ],(sandbox,mod_busqueda)->
	IniciarMapa=
		mapa:null
		map:null
		delegacion:null
		iniciar:()->
			this.sandbox= new sandbox this
			mod_busqueda.iniciar()
			this.delegacion= $("#bus_delegacion")
			this.iniciarCalendario()
			#$(".collapse").collapse()
			this.llenarDelegaciones()
			#this.llenarComandancias()
			this.delegacion.on 'change',(evento)->
				valor= $('#' + evento.currentTarget.id).val()
				window.actualizarComandanciaValor(valor)
				return
			$("#boton_buscar").click()
			$("#bus_fechai").val('2007-11-02')
			$("#bus_fechaf").val('2007-12-27')
		llenarDelegaciones:->
			if !window.delegaciones
				window.cargarDelegaciones this.llenarDelegaciones
			else
				sel=$('#bus_delegacion').html("")
				opciones=''
				for delegacion in window.delegaciones
					opciones+='<option value="'+delegacion.delegacion+'">'+delegacion.delegacion+'</option>'
				sel.append(opciones)
			window.actualizarComandancia()
			return
		iniciarCalendario:()->
			$('#bus-mapa-fechai').datetimepicker
				pickTime: false
				language: 'pt-BR'
			$('#bus-mapa-fechaf').datetimepicker
				pickTime: false
				language: 'pt-BR'


