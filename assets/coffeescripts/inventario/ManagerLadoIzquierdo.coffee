define [
  'core/sandbox'
],(sandbox)->
	MangerLadoIzquierdo=
		salpiDer11: null
		salpiDer21: null
		salpiDer31: null
		salpiDer41: null
		puertDela12: null
		puertDela22: null
		puertDela32: null
		puertDela42: null
		puertTra13: null
		puertTra23: null
		puertTra33: null
		puertTra43: null
		espejoLat14: null
		espejoLat24: null
		espejoLat34: null
		espejoLat44: null
		cristaPuer15: null
		cristaPuer25: null
		cristaPuer35: null
		cristaPuer45: null
		alet16: null
		alet26: null
		alet36: null
		alet46: null
		salTra17: null
		salTra27: null
		salTra37: null
		salTra47: null
		manijas18: null
		manijas28: null
		manijas38: null
		manijas48: null
		llantas19: null
		llantas29: null
		llantas39: null
		llantas49: null
		rines10: null
		rines20: null
		rines30: null
		rines40: null
		polvera112: null
		polvera212: null
		polvera312: null
		polvera412: null
		moldura113: null
		moldura213: null
		moldura313: null
		moldura413: null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-lado-izquierdo-view',this.mostrarLadoIzquierdoOnView
			this.salpiDer11 = document.getElementById("salpiDer11_inv")
			this.salpiDer21 = document.getElementById("salpiDer21_inv")
			this.salpiDer31 = document.getElementById("salpiDer31_inv")
			this.salpiDer41 = document.getElementById("salpiDer41_inv")
			this.puertDela12 = document.getElementById("puertDela12_inv")
			this.puertDela22 = document.getElementById("puertDela22_inv")
			this.puertDela32 = document.getElementById("puertDela32_inv")
			this.puertDela42 = document.getElementById("puertDela42_inv")
			this.puertTra13 = document.getElementById("puerTra13_inv")
			this.puertTra23 = document.getElementById("puerTra23_inv")
			this.puertTra33 = document.getElementById("puerTra33_inv")
			this.puertTra43 = document.getElementById("puerTra43_inv")
			this.espejoLat14 = document.getElementById("espejoLat14_inv")
			this.espejoLat24 = document.getElementById("espejoLat24_inv")
			this.espejoLat34 = document.getElementById("espejoLat34_inv")
			this.espejoLat44 = document.getElementById("espejoLat44_inv")
			this.cristaPuer15 = document.getElementById("cristaPuer15_inv")
			this.cristaPuer25 = document.getElementById("cristaPuer25_inv")
			this.cristaPuer35 = document.getElementById("cristaPuer35_inv")
			this.cristaPuer45 = document.getElementById("cristaPuer45_inv")
			this.alet16 = document.getElementById("alet16_inv")
			this.alet26 = document.getElementById("alet26_inv")
			this.alet36 = document.getElementById("alet36_inv")
			this.alet46 = document.getElementById("alet46_inv")
			this.salTra17 = document.getElementById("salTra17_inv")
			this.salTra27 = document.getElementById("salTra27_inv")
			this.salTra37 = document.getElementById("salTra37_inv")
			this.salTra47 = document.getElementById("salTra47_inv")
			this.manijas18 = document.getElementById("manijas18_inv")
			this.manijas28 = document.getElementById("manijas28_inv")
			this.manijas38 = document.getElementById("manijas38_inv")
			this.manijas48 = document.getElementById("manijas48_inv")
			this.llantas19 = document.getElementById("llantas19_inv")
			this.llantas29 = document.getElementById("llantas29_inv")
			this.llantas39 = document.getElementById("llantas39_inv")
			this.llantas49 = document.getElementById("llantas49_inv")
			this.rines10 = document.getElementById("rines10_inv")
			this.rines20 = document.getElementById("rines20_inv")
			this.rines30 = document.getElementById("rines30_inv")
			this.rines40 = document.getElementById("rines40_inv")
			this.polvera112 = document.getElementById("polvera112_inv")
			this.polvera212 = document.getElementById("polvera212_inv")
			this.polvera312 = document.getElementById("polvera312_inv")
			this.polvera412 = document.getElementById("polvera412_inv")
			this.moldura113 = document.getElementById("moldura113_inv")
			this.moldura213 = document.getElementById("moldura213_inv")
			this.moldura313 = document.getElementById("moldura313_inv")
			this.moldura413 = document.getElementById("moldura413_inv")
			this.sandbox.on 'cancelar-lado-izquierdo-view', this.cancelar 
		cancelar:->
			this.salpiDer11.checked= false
			this.salpiDer21.checked= false
			this.salpiDer31.checked= false
			this.salpiDer41.checked= false
			this.puertDela12.checked= false
			this.puertDela22.checked= false
			this.puertDela32.checked= false
			this.puertDela42.checked= false
			this.puertTra13.checked= false
			this.puertTra23.checked= false
			this.puertTra33.checked= false
			this.puertTra43.checked= false
			this.espejoLat14.checked= false
			this.espejoLat24.checked= false
			this.espejoLat34.checked= false
			this.espejoLat44.checked= false
			this.cristaPuer15.checked= false
			this.cristaPuer25.checked= false
			this.cristaPuer35.checked= false
			this.cristaPuer45.checked= false
			this.alet16.checked= false
			this.alet26.checked= false
			this.alet36.checked= false
			this.alet46.checked= false
			this.salTra17.checked= false
			this.salTra27.checked= false
			this.salTra37.checked= false
			this.salTra47.checked= false
			this.manijas18.checked= false
			this.manijas28.checked= false
			this.manijas38.checked= false
			this.manijas48.checked= false
			this.llantas19.checked= false
			this.llantas29.checked= false
			this.llantas39.checked= false
			this.llantas49.checked= false
			this.rines10.checked= false
			this.rines20.checked= false
			this.rines30.checked= false
			this.rines40.checked= false
			this.polvera112.checked= false
			this.polvera212.checked= false
			this.polvera312.checked= false
			this.polvera412.checked= false
			this.moldura113.checked= false
			this.moldura213.checked= false
			this.moldura313.checked= false
			this.moldura413.checked= false
		mostrarLadoIzquierdoOnView:->
			ladoIzquierdo= window.inventario.costado_izquierdo
			if ladoIzquierdo.salpicadera_delantera == 'BIEN'
				this.salpiDer11.checked= true
			else if ladoIzquierdo.salpicadera_delantera== 'REG'
				this.salpiDer21.checked= true
			else if ladoIzquierdo.salpicadera_delantera=='MAL'
				this.salpiDer31.checked= true
			else if ladoIzquierdo.salpicadera_delantera=='NO'
				this.salpiDer41.checked= true

			if ladoIzquierdo.puerta_delantera == 'BIEN'
				this.puertDela12.checked= true
			else if ladoIzquierdo.puerta_delantera== 'REG'
				this.puertDela22.checked= true
			else if ladoIzquierdo.puerta_delantera=='MAL'
				this.puertDela32.checked= true
			else if ladoIzquierdo.puerta_delantera=='NO'
				this.puertDela42.checked= true

			if ladoIzquierdo.puerta_trasera == 'BIEN'
				this.puertTra13.checked= true
			else if ladoIzquierdo.puerta_trasera== 'REG'
				this.puertTra23.checked= true
			else if ladoIzquierdo.puerta_trasera=='MAL'
				this.puertTra33.checked= true
			else if ladoIzquierdo.puerta_trasera=='NO'
				this.puertTra43.checked= true

			if ladoIzquierdo.espejo_lateral == 'BIEN'
				this.espejoLat14.checked= true
			else if ladoIzquierdo.espejo_lateral== 'REG'
				this.espejoLat24.checked= true
			else if ladoIzquierdo.espejo_lateral=='MAL'
				this.espejoLat34.checked= true
			else if ladoIzquierdo.espejo_lateral=='NO'
				this.espejoLat44.checked= true

			if ladoIzquierdo.cristales_de_puertas == 'BIEN'
				this.cristaPuer15.checked= true
			else if ladoIzquierdo.cristales_de_puertas== 'REG'
				this.cristaPuer25.checked= true
			else if ladoIzquierdo.cristales_de_puertas=='MAL'
				this.cristaPuer35.checked= true
			else if ladoIzquierdo.cristales_de_puertas=='NO'
				this.cristaPuer45.checked= true

			if ladoIzquierdo.aletas == 'BIEN'
				this.alet16.checked= true
			else if ladoIzquierdo.aletas== 'REG'
				this.alet26.checked= true
			else if ladoIzquierdo.aletas=='MAL'
				this.alet36.checked= true
			else if ladoIzquierdo.aletas=='NO'
				this.alet46.checked= true

			if ladoIzquierdo.salpicadera_trasera == 'BIEN'
				this.salTra17.checked= true
			else if ladoIzquierdo.salpicadera_trasera== 'REG'
				this.salTra27.checked= true
			else if ladoIzquierdo.salpicadera_trasera=='MAL'
				this.salTra37.checked= true
			else if ladoIzquierdo.salpicadera_trasera=='NO'
				this.salTra47.checked= true

			if ladoIzquierdo.manijas == 'BIEN'
				this.manijas18.checked= true
			else if ladoIzquierdo.manijas== 'REG'
				this.manijas28.checked= true
			else if ladoIzquierdo.manijas=='MAL'
				this.manijas38.checked= true
			else if ladoIzquierdo.manijas=='NO'
				this.manijas48.checked= true

			if ladoIzquierdo.llantas == 'BIEN'
				this.llantas19.checked= true
			else if ladoIzquierdo.llantas== 'REG'
				this.llantas29.checked= true
			else if ladoIzquierdo.llantas=='MAL'
				this.llantas39.checked= true
			else if ladoIzquierdo.llantas=='NO'
				this.llantas49.checked= true

			if ladoIzquierdo.rines == 'BIEN'
				this.rines10.checked= true
			else if ladoIzquierdo.rines== 'REG'
				this.rines20.checked= true
			else if ladoIzquierdo.rines=='MAL'
				this.rines30.checked= true
			else if ladoIzquierdo.rines=='NO'
				this.rines40.checked= true

			if ladoIzquierdo.polveras == 'BIEN'
				this.polvera112.checked= true
			else if ladoIzquierdo.polveras== 'REG'
				this.polvera212.checked= true
			else if ladoIzquierdo.polveras=='MAL'
				this.polvera312.checked= true
			else if ladoIzquierdo.polveras=='NO'
				this.polvera412.checked= true

			if ladoIzquierdo.molduras == 'BIEN'
				this.moldura113.checked= true
			else if ladoIzquierdo.molduras== 'REG'
				this.moldura213.checked= true
			else if ladoIzquierdo.molduras=='MAL'
				this.moldura313.checked= true
			else if ladoIzquierdo.molduras=='NO'
				this.moldura413.checked= true
		actualizarladoIzquierdo:->
			ladoIzquierdo = window.costado_izquierdo
			if this.salpiDer11.checked == true
				ladoIzquierdo.salpicadera_delantera= 'BIEN'
			else if this.salpiDer21.checked == true
				ladoIzquierdo.salpicadera_delantera= "REG"
			else if this.salpiDer31.checked == true
				ladoIzquierdo.salpicadera_delantera= 'MAL'
			else if this.salpiDer41.checked == true
				ladoIzquierdo.salpicadera_delantera= 'NO'

			if this.puertDela12.checked == true
				ladoIzquierdo.puerta_delantera= 'BIEN'
			else if this.puertDela22.checked == true
				ladoIzquierdo.puerta_delantera= "REG"
			else if this.puertDela32.checked == true
				ladoIzquierdo.puerta_delantera= 'MAL'
			else if this.puertDela42.checked == true
				ladoIzquierdo.puerta_delantera= 'NO'

			if this.puertTra13.checked == true
				ladoIzquierdo.puerta_trasera= 'BIEN'
			else if this.puertTra23.checked == true
				ladoIzquierdo.puerta_trasera= "REG"
			else if this.puertTra33.checked == true
				ladoIzquierdo.puerta_trasera= 'MAL'
			else if this.puertTra43.checked == true
				ladoIzquierdo.puerta_trasera= 'NO'

			if this.espejoLat14.checked == true
				ladoIzquierdo.espejo_lateral= 'BIEN'
			else if this.espejoLat24.checked == true
				ladoIzquierdo.espejo_lateral= "REG"
			else if this.espejoLat34.checked == true
				ladoIzquierdo.espejo_lateral= 'MAL'
			else if this.espejoLat44.checked == true
				ladoIzquierdo.espejo_lateral= 'NO'

			if this.cristaPuert15.checked == true
				ladoIzquierdo.cristales_de_puertas= 'BIEN'
			else if this.cristaPuert25.checked == true
				ladoIzquierdo.cristales_de_puertas= "REG"
			else if this.cristaPuert35.checked == true
				ladoIzquierdo.cristales_de_puertas= 'MAL'
			else if this.cristaPuert45.checked == true
				ladoIzquierdo.cristales_de_puertas= 'NO'

			if this.alet16.checked == true
				ladoIzquierdo.aletas= 'BIEN'
			else if this.alet26.checked == true
				ladoIzquierdo.aletas= "REG"
			else if this.alet36.checked == true
				ladoIzquierdo.aletas= 'MAL'
			else if this.alet46.checked == true
				ladoIzquierdo.aletas= 'NO'

			if this.salTra17.checked == true
				ladoIzquierdo.salpicadera_trasera= 'BIEN'
			else if this.salTra27.checked == true
				ladoIzquierdo.salpicadera_trasera= "REG"
			else if this.salTra37.checked == true
				ladoIzquierdo.salpicadera_trasera= 'MAL'
			else if this.salTra47.checked == true
				ladoIzquierdo.salpicadera_trasera= 'NO'

			if this.manijas18.checked == true
				ladoIzquierdo.manijas= 'BIEN'
			else if this.manijas28.checked == true
				ladoIzquierdo.manijas= "REG"
			else if this.manijas38.checked == true
				ladoIzquierdo.manijas= 'MAL'
			else if this.manijas48.checked == true
				ladoIzquierdo.manijas= 'NO'

			if this.puertDela19.checked == true
				ladoIzquierdo.llantas= 'BIEN'
			else if this.puertDela29.checked == true
				ladoIzquierdo.llantas= "REG"
			else if this.puertDela39.checked == true
				ladoIzquierdo.llantas= 'MAL'
			else if this.puertDela49.checked == true
				ladoIzquierdo.llantas= 'NO'

			if this.rines10.checked == true
				ladoIzquierdo.rines= 'BIEN'
			else if this.rines20.checked == true
				ladoIzquierdo.rines= "REG"
			else if this.rines30.checked == true
				ladoIzquierdo.rines= 'MAL'
			else if this.rines40.checked == true
				ladoIzquierdo.rines= 'NO'

			if this.polvera112.checked == true
				partePosterior.polveras= 'BIEN'
			else if this.polvera212.checked == true
				partePosterior.polveras= "REG"
			else if this.polvera312.checked == true
				partePosterior.polveras= 'MAL'
			else if this.polvera412.checked == true
				partePosterior.polveras= 'NO'

			if this.moldura1.checked == true
				partePosterior.molduras= 'BIEN'
			else if this.moldura213.checked == true
				partePosterior.molduras= "REG"
			else if this.moldura313.checked == true
				partePosterior.molduras= 'MAL'
			else if this.moldura413.checked == true
				partePosterior.molduras= 'NO'