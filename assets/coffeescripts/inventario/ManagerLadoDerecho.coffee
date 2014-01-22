define [
		'core/sandbox'
],(sandbox)->
	MangerLadoDerecho=
		salpiDer1: null
		salpiDer2: null
		salpiDer3: null
		salpiDer4: null
		puertDela1: null
		puertDela2: null
		puertDela3: null
		puertDela4: null
		puertTra1: null
		puertTra2: null
		puertTra3: null
		puertTra4: null
		espejoLat1: null
		espejoLat2: null
		espejoLat3: null
		espejoLat4: null
		cristaPuer1: null
		cristaPuer2: null
		cristaPuer3: null
		cristaPuer4: null
		alet1: null
		alet2: null
		alet3: null
		alet4: null
		salTra1: null
		salTra2: null
		salTra3: null
		salTra4: null
		manijas1: null
		manijas2: null
		manijas3: null
		manijas4: null
		llantas1: null
		llantas2: null
		llantas3: null
		llantas4: null
		rines1: null
		rines2: null
		rines3: null
		rines4: null
		polvera1: null
		polvera2: null
		polvera3: null
		polvera4: null
		moldura1: null
		moldura2: null
		moldura3: null
		moldura4: null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-lado-derecho-view',this.mostrarLadoDerecho
			this.salpiDer1 = document.getElementById("salpiDer1_inv")
			this.salpiDer2 = document.getElementById("salpiDer2_inv")
			this.salpiDer3 = document.getElementById("salpiDer3_inv")
			this.salpiDer4 = document.getElementById("salpiDer4_inv")
			this.puertDela1 = document.getElementById("puertDela1_inv")
			this.puertDela2 = document.getElementById("puertDela2_inv")
			this.puertDela3 = document.getElementById("puertDela3_inv")
			this.puertDela4 = document.getElementById("puertDela4_inv")
			this.puertTra1 = document.getElementById("puerTra1_inv")
			this.puertTra2 = document.getElementById("puerTra2_inv")
			this.puertTra3 = document.getElementById("puerTra3_inv")
			this.puertTra4 = document.getElementById("puerTra4_inv")
			this.espejoLat1 = document.getElementById("espejoLat1_inv")
			this.espejoLat2 = document.getElementById("espejoLat2_inv")
			this.espejoLat3 = document.getElementById("espejoLat3_inv")
			this.espejoLat4 = document.getElementById("espejoLat4_inv")
			this.cristaPuer1 = document.getElementById("cristaPuer1_inv")
			this.cristaPuer2 = document.getElementById("cristaPuer2_inv")
			this.cristaPuer3 = document.getElementById("cristaPuer3_inv")
			this.cristaPuer4 = document.getElementById("cristaPuer4_inv")
			this.alet1 = document.getElementById("alet1_inv")
			this.alet2 = document.getElementById("alet2_inv")
			this.alet3 = document.getElementById("alet3_inv")
			this.alet4 = document.getElementById("alet4_inv")
			this.salTra1 = document.getElementById("salTra1_inv")
			this.salTra2 = document.getElementById("salTra2_inv")
			this.salTra3 = document.getElementById("salTra3_inv")
			this.salTra4 = document.getElementById("salTra4_inv")
			this.manijas1 = document.getElementById("manijas1_inv")
			this.manijas2 = document.getElementById("manijas2_inv")
			this.manijas3 = document.getElementById("manijas3_inv")
			this.manijas4 = document.getElementById("manijas4_inv")
			this.llantas1 = document.getElementById("llantas1_inv")
			this.llantas2 = document.getElementById("llantas2_inv")
			this.llantas3 = document.getElementById("llantas3_inv")
			this.llantas4 = document.getElementById("llantas4_inv")
			this.rines1 = document.getElementById("rines1_inv")
			this.rines2 = document.getElementById("rines2_inv")
			this.rines3 = document.getElementById("rines3_inv")
			this.rines4 = document.getElementById("rines4_inv")
			this.polvera1 = document.getElementById("polvera1_inv")
			this.polvera2 = document.getElementById("polvera2_inv")
			this.polvera3 = document.getElementById("polvera3_inv")
			this.polvera4 = document.getElementById("polvera4_inv")
			this.moldura1 = document.getElementById("moldura1_inv")
			this.moldura2 = document.getElementById("moldura2_inv")
			this.moldura3 = document.getElementById("moldura3_inv")
			this.moldura4 = document.getElementById("moldura4_inv")
			this.sandbox.on 'cancelar-lado-derecho-view', this.cancelar 
		cancelar:->
			this.salpiDer1.checked= false
			this.salpiDer2.checked= false
			this.salpiDer3.checked= false
			this.salpiDer4.checked= false
			this.puertDela1.checked= false
			this.puertDela2.checked= false
			this.puertDela3.checked= false
			this.puertDela4.checked= false
			this.puertTra1.checked= false
			this.puertTra2.checked= false
			this.puertTra3.checked= false
			this.puertTra4.checked= false
			this.espejoLat1.checked= false
			this.espejoLat2.checked= false
			this.espejoLat3.checked= false
			this.espejoLat4.checked= false
			this.cristaPuer1.checked= false
			this.cristaPuer2.checked= false
			this.cristaPuer3.checked= false
			this.cristaPuer4.checked= false
			this.alet1.checked= false
			this.alet2.checked= false
			this.alet3.checked= false
			this.alet4.checked= false
			this.salTra1.checked= false
			this.salTra2.checked= false
			this.salTra3.checked= false
			this.salTra4.checked= false
			this.manijas1.checked= false
			this.manijas2.checked= false
			this.manijas3.checked= false
			this.manijas4.checked= false
			this.llantas1.checked= false
			this.llantas2.checked= false
			this.llantas3.checked= false
			this.llantas4.checked= false
			this.rines1.checked= false
			this.rines2.checked= false
			this.rines3.checked= false
			this.rines4.checked= false
			this.polvera1.checked= false
			this.polvera2.checked= false
			this.polvera3.checked= false
			this.polvera4.checked= false
			this.moldura1.checked= false
			this.moldura2.checked= false
			this.moldura3.checked= false
			this.moldura4.checked= false
		mostrarLadoDerecho:->
			ladoDerecho= window.inventario.costado_derecho
			if ladoDerecho.salpicadera_delantera == 'BIEN'
				this.salpiDer1.checked= true
			else if ladoDerecho.salpicadera_delantera== 'REG'
				this.salpiDer2.checked= true
			else if ladoDerecho.salpicadera_delantera=='MAL'
				this.salpiDer3.checked= true
			else if ladoDerecho.salpicadera_delantera=='NO'
				this.salpiDer4.checked= true

			if ladoDerecho.puerta_delantera == 'BIEN'
				this.puertDela1.checked= true
			else if ladoDerecho.puerta_delantera== 'REG'
				this.puertDela2.checked= true
			else if ladoDerecho.puerta_delantera=='MAL'
				this.puertDela3.checked= true
			else if ladoDerecho.puerta_delantera=='NO'
				this.puertDela4.checked= true

			if ladoDerecho.puerta_trasera == 'BIEN'
				this.puertTra1.checked= true
			else if ladoDerecho.puerta_trasera== 'REG'
				this.puertTra2.checked= true
			else if ladoDerecho.puerta_trasera=='MAL'
				this.puertTra3.checked= true
			else if ladoDerecho.puerta_trasera=='NO'
				this.puertTra4.checked= true

			if ladoDerecho.espejo_lateral == 'BIEN'
				this.espejoLat1.checked= true
			else if ladoDerecho.espejo_lateral== 'REG'
				this.espejoLat2.checked= true
			else if ladoDerecho.espejo_lateral=='MAL'
				this.espejoLat3.checked= true
			else if ladoDerecho.espejo_lateral=='NO'
				this.espejoLat4.checked= true

			if ladoDerecho.cristales_de_puertas == 'BIEN'
				this.cristaPuer1.checked= true
			else if ladoDerecho.cristales_de_puertas== 'REG'
				this.cristaPuer2.checked= true
			else if ladoDerecho.cristales_de_puertas=='MAL'
				this.cristaPuer3.checked= true
			else if ladoDerecho.cristales_de_puertas=='NO'
				this.cristaPuer4.checked= true

			if ladoDerecho.aletas == 'BIEN'
				this.alet1.checked= true
			else if ladoDerecho.aletas== 'REG'
				this.alet2.checked= true
			else if ladoDerecho.aletas=='MAL'
				this.alet3.checked= true
			else if ladoDerecho.aletas=='NO'
				this.alet4.checked= true

			if ladoDerecho.salpicadera_trasera == 'BIEN'
				this.salTra1.checked= true
			else if ladoDerecho.salpicadera_trasera== 'REG'
				this.salTra2.checked= true
			else if ladoDerecho.salpicadera_trasera=='MAL'
				this.salTra3.checked= true
			else if ladoDerecho.salpicadera_trasera=='NO'
				this.salTra4.checked= true

			if ladoDerecho.manijas == 'BIEN'
				this.manijas1.checked= true
			else if ladoDerecho.manijas== 'REG'
				this.manijas2.checked= true
			else if ladoDerecho.manijas=='MAL'
				this.manijas3.checked= true
			else if ladoDerecho.manijas=='NO'
				this.manijas4.checked= true

			if ladoDerecho.llantas == 'BIEN'
				this.llantas1.checked= true
			else if ladoDerecho.llantas== 'REG'
				this.llantas2.checked= true
			else if ladoDerecho.llantas=='MAL'
				this.llantas3.checked= true
			else if ladoDerecho.llantas=='NO'
				this.llantas4.checked= true

			if ladoDerecho.rines == 'BIEN'
				this.rines1.checked= true
			else if ladoDerecho.rines== 'REG'
				this.rines2.checked= true
			else if ladoDerecho.rines=='MAL'
				this.rines3.checked= true
			else if ladoDerecho.rines=='NO'
				this.rines4.checked= true

			if ladoDerecho.polveras == 'BIEN'
				this.polvera1.checked= true
			else if ladoDerecho.polveras== 'REG'
				this.polvera2.checked= true
			else if ladoDerecho.polveras=='MAL'
				this.polvera3.checked= true
			else if ladoDerecho.polveras=='NO'
				this.polvera4.checked= true

			if ladoDerecho.molduras == 'BIEN'
				this.moldura1.checked= true
			else if ladoDerecho.molduras== 'REG'
				this.moldura2.checked= true
			else if ladoDerecho.molduras=='MAL'
				this.moldura3.checked= true
			else if ladoDerecho.molduras=='NO'
				this.moldura4.checked= true
		actualizarLadoDerecho:->
			ladoDerecho = window.costado_derecho
			if this.salpiDer1.checked == true
				ladoDerecho.salpicadera_delantera= 'BIEN'
			else if this.salpiDer2.checked == true
				ladoDerecho.salpicadera_delantera= "REG"
			else if this.salpiDer3.checked == true
				ladoDerecho.salpicadera_delantera= 'MAL'
			else if this.salpiDer4.checked == true
				ladoDerecho.salpicadera_delantera= 'NO'

			if this.puertDela1.checked == true
				ladoDerecho.puerta_delantera= 'BIEN'
			else if this.puertDela2.checked == true
				ladoDerecho.puerta_delantera= "REG"
			else if this.puertDela3.checked == true
				ladoDerecho.puerta_delantera= 'MAL'
			else if this.puertDela4.checked == true
				ladoDerecho.puerta_delantera= 'NO'

			if this.puertTra1.checked == true
				ladoDerecho.puerta_trasera= 'BIEN'
			else if this.puertTra2.checked == true
				ladoDerecho.puerta_trasera= "REG"
			else if this.puertTra3.checked == true
				ladoDerecho.puerta_trasera= 'MAL'
			else if this.puertTra4.checked == true
				ladoDerecho.puerta_trasera= 'NO'

			if this.espejoLat1.checked == true
				ladoDerecho.espejo_lateral= 'BIEN'
			else if this.espejoLat2.checked == true
				ladoDerecho.espejo_lateral= "REG"
			else if this.espejoLat3.checked == true
				ladoDerecho.espejo_lateral= 'MAL'
			else if this.espejoLat4.checked == true
				ladoDerecho.espejo_lateral= 'NO'

			if this.cristaPuert1.checked == true
				ladoDerecho.cristales_de_puertas= 'BIEN'
			else if this.cristaPuert2.checked == true
				ladoDerecho.cristales_de_puertas= "REG"
			else if this.cristaPuert3.checked == true
				ladoDerecho.cristales_de_puertas= 'MAL'
			else if this.cristaPuert4.checked == true
				ladoDerecho.cristales_de_puertas= 'NO'

			if this.alet1.checked == true
				ladoDerecho.aletas= 'BIEN'
			else if this.alet2.checked == true
				ladoDerecho.aletas= "REG"
			else if this.alet3.checked == true
				ladoDerecho.aletas= 'MAL'
			else if this.alet4.checked == true
				ladoDerecho.aletas= 'NO'

			if this.salTra1.checked == true
				ladoDerecho.salpicadera_trasera= 'BIEN'
			else if this.salTra2.checked == true
				ladoDerecho.salpicadera_trasera= "REG"
			else if this.salTra3.checked == true
				ladoDerecho.salpicadera_trasera= 'MAL'
			else if this.salTra4.checked == true
				ladoDerecho.salpicadera_trasera= 'NO'

			if this.manijas1.checked == true
				ladoDerecho.manijas= 'BIEN'
			else if this.manijas2.checked == true
				ladoDerecho.manijas= "REG"
			else if this.manijas3.checked == true
				ladoDerecho.manijas= 'MAL'
			else if this.manijas4.checked == true
				ladoDerecho.manijas= 'NO'

			if this.puertDela1.checked == true
				ladoDerecho.llantas= 'BIEN'
			else if this.puertDela2.checked == true
				ladoDerecho.llantas= "REG"
			else if this.puertDela3.checked == true
				ladoDerecho.llantas= 'MAL'
			else if this.puertDela4.checked == true
				ladoDerecho.llantas= 'NO'

			if this.rines1.checked == true
				ladoDerecho.rines= 'BIEN'
			else if this.rines2.checked == true
				ladoDerecho.rines= "REG"
			else if this.rines3.checked == true
				ladoDerecho.rines= 'MAL'
			else if this.rines4.checked == true
				ladoDerecho.rines= 'NO'

			if this.polvera1.checked == true
				partePosterior.polveras= 'BIEN'
			else if this.polvera2.checked == true
				partePosterior.polveras= "REG"
			else if this.polvera3.checked == true
				partePosterior.polveras= 'MAL'
			else if this.polvera4.checked == true
				partePosterior.polveras= 'NO'

			if this.moldura1.checked == true
				partePosterior.molduras= 'BIEN'
			else if this.moldura2.checked == true
				partePosterior.molduras= "REG"
			else if this.moldura3.checked == true
				partePosterior.molduras= 'MAL'
			else if this.moldura4.checked == true
				partePosterior.molduras= 'NO'