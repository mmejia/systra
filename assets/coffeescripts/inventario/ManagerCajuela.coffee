define [
		'core/sandbox'
],(sandbox)->
	ManagerCajuela=
		gato1: null
		gato2: null
		gato3: null
		gato4: null
		llave1: null
		llave2: null
		llave3: null
		llave4: null
		desarmadores1: null
		desarmadores2: null
		desarmadores3: null
		desarmadores4: null
		pinzaz1: null
		pinzaz2: null
		pinzaz3: null
		pinzaz4: null
		cruzL1: null
		cruzL2: null
		cruzL3: null
		cruzL4: null
		banderasLum1: null
		banderasLum2: null
		banderasLum3: null
		banderasLum4: null
		palancas1: null
		palancas2: null
		palancas3: null
		palancas4: null
		extintor1: null
		extintor2: null
		extintor3: null
		extintor4: null
		llantasRef1: null
		llantasRef2: null
		llantasRef3: null
		llantasRef4: null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-cajuela-view',this.mostrarCajuelaOnView
			this.gato1 = document.getElementById("gato1_inv")
			this.gato2 = document.getElementById("gato2_inv")
			this.gato3 = document.getElementById("gato3_inv")
			this.gato4 = document.getElementById("gato4_inv")
			this.llave1 = document.getElementById("llave1_inv")
			this.llave2 = document.getElementById("llave2_inv")
			this.llave3 = document.getElementById("llave3_inv")
			this.llave4 = document.getElementById("llave4_inv")
			this.desarmadores1 = document.getElementById("desarmadores1_inv")
			this.desarmadores2 = document.getElementById("desarmadores2_inv")
			this.desarmadores3 = document.getElementById("desarmadores3_inv")
			this.desarmadores4 = document.getElementById("desarmadores4_inv")
			this.pinzaz1 = document.getElementById("pinzaz1_inv")
			this.pinzaz2 = document.getElementById("pinzaz2_inv")
			this.pinzaz3 = document.getElementById("pinzaz3_inv")
			this.pinzaz4 = document.getElementById("pinzaz4_inv")
			this.cruzL1 = document.getElementById("cruzL1_inv")
			this.cruzL2 = document.getElementById("cruzL2_inv")
			this.cruzL3 = document.getElementById("cruzL3_inv")
			this.cruzL4 = document.getElementById("cruzL4_inv")
			this.banderasLum1 = document.getElementById("banderasLum1_inv")
			this.banderasLum2 = document.getElementById("banderasLum2_inv")
			this.banderasLum3 = document.getElementById("banderasLum3_inv")
			this.banderasLum4 = document.getElementById("banderasLum4_inv")
			this.palancas1 = document.getElementById("palancas1_inv")
			this.palancas2 = document.getElementById("palancas2_inv")
			this.palancas3 = document.getElementById("palancas3_inv")
			this.palancas4 = document.getElementById("palancas4_inv")
			this.extintor1 = document.getElementById("extintor1_inv")
			this.extintor2 = document.getElementById("extintor2_inv")
			this.extintor3 = document.getElementById("extintor3_inv")
			this.extintor4 = document.getElementById("extintor4_inv")
			this.llantasRef1 = document.getElementById("llantasRef1_inv")
			this.llantasRef2 = document.getElementById("llantasRef1_inv")
			this.llantasRef3 = document.getElementById("llantasRef1_inv")
			this.llantasRef4 = document.getElementById("llantasRef1_inv")
			this.sandbox.on 'cancelar-cajuela-view', this.cancelar 
		cancelar:->
			this.gato1.checked= false
			this.gato2.checked= false
			this.gato3.checked= false
			this.gato4.checked= false
			this.llave1.checked= false
			this.llave2.checked= false
			this.llave3.checked= false
			this.llave4.checked= false
			this.desarmadores1.checked= false
			this.desarmadores2.checked= false
			this.desarmadores3.checked= false
			this.desarmadores4.checked= false
			this.pinzaz1.checked= false
			this.pinzaz2.checked= false
			this.pinzaz3.checked= false
			this.pinzaz4.checked= false
			this.cruzL1.checked= false
			this.cruzL2.checked= false
			this.cruzL3.checked= false
			this.cruzL4.checked= false
			this.banderasLum1.checked= false
			this.banderasLum2.checked= false
			this.banderasLum3.checked= false
			this.banderasLum4.checked= false
			this.palancas1.checked= false
			this.palancas2.checked= false
			this.palancas3.checked= false
			this.palancas4.checked= false
			this.extintor1.checked= false
			this.extintor2.checked= false
			this.extintor3.checked= false
			this.extintor4.checked= false
			this.llantasRef1.checked= false
			this.llantasRef2.checked= false
			this.llantasRef3.checked= false
			this.llantasRef4.checked= false
		mostrarCajuelaOnView:->
			cajuela= window.inventario.cajuela
			if cajuela.gato == 'BIEN'
				this.gato1.checked= true
			else if cajuela.gato== 'REG'
				this.gato2.checked= true
			else if cajuela.gato=='MAL'
				this.gato3.checked= true
			else if cajuela.gato=='NO'
				this.gato4.checked= true

			if cajuela.llaves == 'BIEN'
				this.llave1.checked= true
			else if cajuela.llaves== 'REG'
				this.llave2.checked= true
			else if cajuela.llaves=='MAL'
				this.llave3.checked= true
			else if cajuela.llaves=='NO'
				this.llave4.checked= true

			if cajuela.desarmador == 'BIEN'
				this.desarmadores1.checked= true
			else if cajuela.desarmador == 'REG'
				this.desarmadores2.checked= true
			else if cajuela.desarmador =='MAL'
				this.desarmadores3.checked= true
			else if cajuela.desarmador =='NO'
				this.desarmadores4.checked= true

			if cajuela.pinzas == 'BIEN'
				this.pinzaz1.checked= true
			else if cajuela.pinzas== 'REG'
				this.pinzaz2.checked= true
			else if cajuela.pinzas=='MAL'
				this.pinzaz3.checked= true
			else if cajuela.pinzas=='NO'
				this.pinzaz4.checked= true

			if cajuela.cruzeta_l == 'BIEN'
				this.cruzL1.checked= true
			else if cajuela.cruzeta_l== 'REG'
				this.cruzL2.checked= true
			else if cajuela.cruzeta_l=='MAL'
				this.cruzL3.checked= true
			else if cajuela.cruzeta_l=='NO'
				this.cruzL4.checked= true

			if cajuela.banderas_luminosas == 'BIEN'
				this.banderasLum1.checked= true
			else if cajuela.banderas_luminosas== 'REG'
				this.banderasLum2.checked= true
			else if cajuela.banderas_luminosas=='MAL'
				this.banderasLum3.checked= true
			else if cajuela.banderas_luminosas=='NO'
				this.banderasLum4.checked= true

			if cajuela.palancas == 'BIEN'
				this.palancas1.checked= true
			else if cajuela.palancas== 'REG'
				this.palancas2.checked= true
			else if cajuela.palancas=='MAL'
				this.palancas3.checked= true
			else if cajuela.palancas=='NO'
				this.palancas4.checked= true

			if cajuela.extintor == 'BIEN'
				this.extintor1.checked= true
			else if cajuela.extintor== 'REG'
				this.extintor2.checked= true
			else if cajuela.extintor=='MAL'
				this.extintor3.checked= true
			else if cajuela.extintor=='NO'
				this.extintor4.checked= true

			if cajuela.llantas_de_refaccion == 'BIEN'
				this.llantasRef1.checked= true
			else if cajuela.llantas_de_refaccion== 'REG'
				this.llantasRef2.checked= true
			else if cajuela.llantas_de_refaccion=='MAL'
				this.llantasRef3.checked= true
			else if cajuela.llantas_de_refaccion=='NO'
				this.llantasRef4.checked= true
		actualizarLadoDerecho:->
			cajuela = window.cajuela
			if this.gato1.checked == true
				cajuela.gato= 'BIEN'
			else if this.gato2.checked == true
				cajuela.gato= "REG"
			else if this.gato3.checked == true
				cajuela.gato= 'MAL'
			else if this.gato4.checked == true
				cajuela.gato= 'NO'

			if this.llave1.checked == true
				cajuela.llaves= 'BIEN'
			else if this.llave2.checked == true
				cajuela.llaves= "REG"
			else if this.llave3.checked == true
				cajuela.llaves= 'MAL'
			else if this.llave4.checked == true
				cajuela.llaves= 'NO'

			if this.desarmadores1.checked == true
				cajuela.desarmador= 'BIEN'
			else if this.desarmadores2.checked == true
				cajuela.desarmador= "REG"
			else if this.desarmadores3.checked == true
				cajuela.desarmador= 'MAL'
			else if this.desarmadores4.checked == true
				cajuela.desarmador= 'NO'

			if this.pinzaz1.checked == true
				cajuela.pinzas= 'BIEN'
			else if this.pinzaz2.checked == true
				cajuela.pinzas= "REG"
			else if this.pinzaz3.checked == true
				cajuela.pinzas= 'MAL'
			else if this.pinzaz4.checked == true
				cajuela.pinzas= 'NO'

			if this.cruzL1.checked == true
				cajuela.cruzeta_l= 'BIEN'
			else if this.cruzL2.checked == true
				cajuela.cruzeta_l= "REG"
			else if this.cruzL3.checked == true
				cajuela.cruzeta_l= 'MAL'
			else if this.cruzL4.checked == true
				cajuela.cruzeta_l= 'NO'

			if this.banderasLum1.checked == true
				cajuela.banderas_luminosas= 'BIEN'
			else if this.banderasLum2.checked == true
				cajuela.banderas_luminosas= "REG"
			else if this.banderasLum3.checked == true
				cajuela.banderas_luminosas= 'MAL'
			else if this.banderasLum4.checked == true
				cajuela.banderas_luminosas= 'NO'

			if this.palancas1.checked == true
				cajuela.palancas= 'BIEN'
			else if this.palancas2.checked == true
				cajuela.palancas= "REG"
			else if this.palancas3.checked == true
				cajuela.palancas= 'MAL'
			else if this.palancas4.checked == true
				cajuela.palancas= 'NO'

			if this.extintor1.checked == true
				cajuela.extintor= 'BIEN'
			else if this.extintor2.checked == true
				cajuela.extintor= "REG"
			else if this.extintor3.checked == true
				cajuela.extintor= 'MAL'
			else if this.extintor4.checked == true
				cajuela.extintor= 'NO'

			if this.llantasRef1.checked == true
				cajuela.llantas_de_refaccion= 'BIEN'
			else if this.llantasRef2.checked == true
				cajuela.llantas_de_refaccion= "REG"
			else if this.llantasRef3.checked == true
				cajuela.llantas_de_refaccion= 'MAL'
			else if this.llantasRef4.checked == true
				cajuela.llantas_de_refaccion= 'NO'