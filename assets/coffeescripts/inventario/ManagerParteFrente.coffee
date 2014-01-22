define [
		'core/sandbox'		
],(sandbox)->
	ManagerParteFrente=
		cofre1: null
		cofre2: null
		cofre3: null
		cofre4: null
		toldo1: null
		toldo2: null
		toldo3: null
		toldo4: null
		parabrisas1: null
		parabrisas2: null
		parabrisas3: null
		parabrisas4: null
		unidadIzquierda1: null
		unidadIzquierda2: null
		unidadIzquierda3: null
		unidadIzquierda4: null
		unidadDerecha1: null
		unidadDerecha2: null
		unidadDerecha3: null
		unidadDerecha4: null
		parrilla1: null
		parrilla2: null
		parrilla3: null
		parrilla4: null
		defensaDelantera1: null
		defensaDelantera2: null
		defensaDelantera3: null
		defensaDelantera4: null
		facia1: null
		facia2: null
		facia3: null
		facia4: null
		tablillasCirc1: null
		tablillasCirc1: null
		tablillasCirc1: null
		tablillasCirc1: null
		cuartoDelanIz1: null
		cuartoDelanIz2: null
		cuartoDelanIz3: null
		cuartoDelanIz4: null
		cuartoDelanDe1: null
		cuartoDelanDe2: null
		cuartoDelanDe3: null
		cuartoDelanDe4: null
		limpiadores1: null
		limpiadores2: null
		limpiadores3: null
		limpiadores4: null
		emblemas1: null
		emblemas2: null
		emblemas3: null
		emblemas4: null
		spoiler1: null
		spoiler2: null
		spoiler3: null
		spoiler4: null
		faroNie1: null
		faroNie2: null
		faroNie3: null
		faroNie4: null
		burre1: null
		burre2: null
		burre3: null
		burre4: null
		accesorio1: null
		accesorio2: null
		accesorio3: null
		accesorio4: null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-parte-frente-view',this.mostrarParteFrenteView
			this.cofre1 = document.getElementById("cofre1_inv")
			this.cofre2 = document.getElementById("cofre2_inv")
			this.cofre3 = document.getElementById("cofre3_inv")
			this.cofre4 = document.getElementById("cofre4_inv")
			this.toldo1 = document.getElementById("toldo1_inv")
			this.toldo2 = document.getElementById("toldo2_inv")
			this.toldo3 = document.getElementById("toldo3_inv")
			this.toldo4 = document.getElementById("toldo4_inv")
			this.parabrisas1 = document.getElementById("parabrisas1_inv")
			this.parabrisas2 = document.getElementById("parabrisas2_inv")
			this.parabrisas3 = document.getElementById("parabrisas3_inv")
			this.parabrisas4 = document.getElementById("parabrisas4_inv")
			this.unidadIzquierda1 = document.getElementById("unidadIzquierda1_inv")
			this.unidadIzquierda2 = document.getElementById("unidadIzquierda2_inv")
			this.unidadIzquierda3 = document.getElementById("unidadIzquierda3_inv")
			this.unidadIzquierda4 = document.getElementById("unidadIzquierda4_inv")
			this.unidadDerecha1 = document.getElementById("unidadDerecha1_inv")
			this.unidadDerecha2 = document.getElementById("unidadDerecha2_inv")
			this.unidadDerecha3 = document.getElementById("unidadDerecha3_inv")
			this.unidadDerecha4 = document.getElementById("unidadDerecha4_inv")
			this.parrilla1 = document.getElementById("parrilla1_inv")
			this.parrilla2 = document.getElementById("parrilla2_inv")
			this.parrilla3 = document.getElementById("parrilla3_inv")
			this.parrilla4 = document.getElementById("parrilla4_inv")
			this.defensaDelantera1 = document.getElementById("defensaDelantera1_inv")
			this.defensaDelantera2 = document.getElementById("defensaDelantera2_inv")
			this.defensaDelantera3 = document.getElementById("defensaDelantera3_inv")
			this.defensaDelantera4 = document.getElementById("defensaDelantera4_inv")
			this.facia1 = document.getElementById("facia1_inv")
			this.facia2 = document.getElementById("facia2_inv")
			this.facia3 = document.getElementById("facia3_inv")
			this.facia4 = document.getElementById("facia4_inv")
			this.tablillasCirc1 = document.getElementById("tablillasCirc1_inv")
			this.tablillasCirc2 = document.getElementById("tablillasCirc2_inv")
			this.tablillasCirc3 = document.getElementById("tablillasCirc3_inv")
			this.tablillasCirc4 = document.getElementById("tablillasCirc4_inv")
			this.cuartoDelanIz1 = document.getElementById("1-4delanIz1_inv")
			this.cuartoDelanIz2 = document.getElementById("1-4delanIz2_inv")
			this.cuartoDelanIz3 = document.getElementById("1-4delanIz3_inv")
			this.cuartoDelanIz4 = document.getElementById("1-4delanIz4_inv")
			this.cuartoDelanDe1 = document.getElementById("1-4delanDe1_inv")
			this.cuartoDelanDe2 = document.getElementById("1-4delanDe2_inv")
			this.cuartoDelanDe3 = document.getElementById("1-4delanDe3_inv")
			this.cuartoDelanDe4 = document.getElementById("1-4delanDe4_inv")
			this.limpiadores1 = document.getElementById("limpiadores1_inv")
			this.limpiadores2 = document.getElementById("limpiadores2_inv")
			this.limpiadores3 = document.getElementById("limpiadores3_inv")
			this.limpiadores4 = document.getElementById("limpiadores4_inv")
			this.emblemas1 = document.getElementById("emblemas1_inv")
			this.emblemas2 = document.getElementById("emblemas2_inv")
			this.emblemas3 = document.getElementById("emblemas3_inv")
			this.emblemas4 = document.getElementById("emblemas4_inv")
			this.spoiler1 = document.getElementById("spoiler1_inv")
			this.spoiler2 = document.getElementById("spoiler2_inv")
			this.spoiler3 = document.getElementById("spoiler3_inv")
			this.spoiler4 = document.getElementById("spoiler4_inv")
			this.faroNie1 = document.getElementById("faroNie1_inv")
			this.faroNie2 = document.getElementById("faroNie2_inv")
			this.faroNie3 = document.getElementById("faroNie3_inv")
			this.faroNie4 = document.getElementById("faroNie4_inv")
			this.burre1 = document.getElementById("burre1_inv")
			this.burre2 = document.getElementById("burre2_inv")
			this.burre3 = document.getElementById("burre3_inv")
			this.burre4 = document.getElementById("burre4_inv")
			this.accesorio1 = document.getElementById("accesorio1_inv")
			this.accesorio2 = document.getElementById("accesorio2_inv")
			this.accesorio3 = document.getElementById("accesorio3_inv")
			this.accesorio4 = document.getElementById("accesorio4_inv")
			this.sandbox.on 'cancelar-parte-frente-view', this.cancelar 
		cancelar:->
			this.cofre1.checked= false
			this.cofre2.checked= false
			this.cofre3.checked= false
			this.cofre4.checked= false
			this.toldo1.checked= false
			this.toldo2.checked= false
			this.toldo3.checked= false
			this.toldo4.checked= false
			this.parabrisas1.checked= false
			this.parabrisas2.checked= false
			this.parabrisas3.checked= false
			this.parabrisas4.checked= false
			this.unidadIzquierda1.checked= false
			this.unidadIzquierda2.checked= false
			this.unidadIzquierda3.checked= false
			this.unidadIzquierda4.checked= false
			this.unidadDerecha1.checked= false
			this.unidadDerecha2.checked= false
			this.unidadDerecha3.checked= false
			this.unidadDerecha4.checked= false
			this.parrilla1.checked= false
			this.parrilla2.checked= false
			this.parrilla3.checked= false
			this.parrilla4.checked= false
			this.defensaDelantera1.checked= false
			this.defensaDelantera2.checked= false
			this.defensaDelantera3.checked= false
			this.defensaDelantera4.checked= false
			this.facia1.checked= false
			this.facia2.checked= false
			this.facia3.checked= false
			this.facia4.checked= false
			this.tablillasCirc1.checked= false
			this.tablillasCirc2.checked= false
			this.tablillasCirc3.checked= false
			this.tablillasCirc4.checked= false
			this.cuartoDelanIz1.checked= false
			this.cuartoDelanIz2.checked= false
			this.cuartoDelanIz3.checked= false
			this.cuartoDelanIz4.checked= false
			this.cuartoDelanDe1.checked= false
			this.cuartoDelanDe2.checked= false
			this.cuartoDelanDe3.checked= false
			this.cuartoDelanDe4.checked= false
			this.limpiadores1.checked= false
			this.limpiadores2.checked= false
			this.limpiadores3.checked= false
			this.limpiadores4.checked= false
			this.emblemas1.checked= false
			this.emblemas2.checked= false
			this.emblemas3.checked= false
			this.emblemas4.checked= false
			this.spoiler1.checked= false
			this.spoiler2.checked= false
			this.spoiler3.checked= false
			this.spoiler4.checked= false
			this.faroNie1.checked= false
			this.faroNie2.checked= false
			this.faroNie3.checked= false
			this.faroNie4.checked= false
			this.burre1.checked= false
			this.burre2.checked= false
			this.burre3.checked= false
			this.burre4.checked= false
			this.accesorio1.checked= false
			this.accesorio2.checked= false
			this.accesorio3.checked= false
			this.accesorio4.checked= false
		mostrarParteFrenteView:->
			parteFrente= window.inventario.parte_del_frente
			if parteFrente.cofre == 'BIEN'
				this.cofre1.checked= true
			else if parteFrente.cofre== 'REG'
				this.cofre2.checked= true
			else if parteFrente.cofre=='MAL'
				this.cofre3.checked= true
			else if parteFrente.cofre=='NO'
				this.cofre4.checked= true

			if parteFrente.toldo == 'BIEN'
				this.toldo1.checked= true
			else if parteFrente.toldo== 'REG'
				this.toldo2.checked= true
			else if parteFrente.toldo=='MAL'
				this.toldo3.checked= true
			else if parteFrente.toldo=='NO'
				this.toldo4.checked= true

			if parteFrente.parabrisas == 'BIEN'
				this.parabrisas1.checked= true
			else if parteFrente.parabrisas== 'REG'
				this.parabrisas2.checked= true
			else if parteFrente.parabrisas=='MAL'
				this.parabrisas3.checked= true
			else if parteFrente.parabrisas=='NO'
				this.parabrisas4.checked= true

			if parteFrente.unidad_de_luz_izquierdo == 'BIEN'
				this.unidadIzquierda1.checked= true
			else if parteFrente.unidad_de_luz_izquierdo== 'REG'
				this.unidadIzquierda2.checked= true
			else if parteFrente.unidad_de_luz_izquierdo=='MAL'
				this.unidadIzquierda3.checked= true
			else if parteFrente.unidad_de_luz_izquierdo=='NO'
				this.unidadIzquierda4.checked= true

			if parteFrente.unidad_de_luz_derecho == 'BIEN'
				this.unidadDerecha1.checked= true
			else if parteFrente.unidad_de_luz_derecho== 'REG'
				this.unidadDerecha2.checked= true
			else if parteFrente.unidad_de_luz_derecho=='MAL'
				this.unidadDerecha3.checked= true
			else if parteFrente.unidad_de_luz_derecho=='NO'
				this.unidadDerecha4.checked= true

			if parteFrente.parrilla == 'BIEN'
				this.parrilla1.checked= true
			else if parteFrente.parrilla== 'REG'
				this.parrilla2.checked= true
			else if parteFrente.parrilla=='MAL'
				this.parrilla3.checked= true
			else if parteFrente.parrilla=='NO'
				this.parrilla4.checked= true

			if parteFrente.defensa_delantera == 'BIEN'
				this.defensaDelantera1.checked= true
			else if parteFrente.defensa_delantera== 'REG'
				this.defensaDelantera2.checked= true
			else if parteFrente.defensa_delantera=='MAL'
				this.defensaDelantera3.checked= true
			else if parteFrente.defensa_delantera=='NO'
				this.defensaDelantera4.checked= true

			if parteFrente.facia == 'BIEN'
				this.facia1.checked= true
			else if parteFrente.facia== 'REG'
				this.facia2.checked= true
			else if parteFrente.facia=='MAL'
				this.facia3.checked= true
			else if parteFrente.facia=='NO'
				this.facia4.checked= true

			if parteFrente.tablillas_de_circulaciones == 'BIEN'
				this.tablillasCirc1.checked= true
			else if parteFrente.tablillas_de_circulaciones== 'REG'
				this.tablillasCirc2.checked= true
			else if parteFrente.tablillas_de_circulaciones=='MAL'
				this.tablillasCirc3.checked= true
			else if parteFrente.tablillas_de_circulaciones=='NO'
				this.tablillasCirc4.checked= true

			if parteFrente.cuarto_delantero_izquierdo == 'BIEN'
				this.cuartoDelanIz1.checked= true
			else if parteFrente.cuarto_delantero_izquierdo== 'REG'
				this.cuartoDelanIz2.checked= true
			else if parteFrente.cuarto_delantero_izquierdo=='MAL'
				this.cuartoDelanIz3.checked= true
			else if parteFrente.cuarto_delantero_izquierdo=='NO'
				this.cuartoDelanIz4.checked= true

			if parteFrente.cuarto_delantero_derecho == 'BIEN'
				this.cuartoDelanDe1.checked= true
			else if parteFrente.cuarto_delantero_derecho== 'REG'
				this.cuartoDelanDe2.checked= true
			else if parteFrente.cuarto_delantero_derecho=='MAL'
				this.cuartoDelanDe3.checked= true
			else if parteFrente.cuarto_delantero_derecho=='NO'
				this.cuartoDelanDe4.checked= true

			if parteFrente.limpiadores == 'BIEN'
				this.limpiadores1.checked= true
			else if parteFrente.limpiadores== 'REG'
				this.limpiadores2.checked= true
			else if parteFrente.limpiadores=='MAL'
				this.limpiadores3.checked= true
			else if parteFrente.limpiadores=='NO'
				this.limpiadores4.checked= true

			if parteFrente.emblemas == 'BIEN'
				this.emblemas1.checked= true
			else if parteFrente.emblemas== 'REG'
				this.emblemas2.checked= true
			else if parteFrente.emblemas=='MAL'
				this.emblemas3.checked= true
			else if parteFrente.emblemas=='NO'
				this.emblemas4.checked= true

			if parteFrente.spoilers == 'BIEN'
				this.spoiler1.checked= true
			else if parteFrente.spoilers== 'REG'
				this.spoiler2.checked= true
			else if parteFrente.spoilers=='MAL'
				this.spoiler3.checked= true
			else if parteFrente.spoilers=='NO'
				this.spoiler4.checked= true

			if parteFrente.faros_de_niebla == 'BIEN'
				this.faroNie1.checked= true
			else if parteFrente.faros_de_niebla== 'REG'
				this.faroNie2.checked= true
			else if parteFrente.faros_de_niebla=='MAL'
				this.faroNie3.checked= true
			else if parteFrente.faros_de_niebla=='NO'
				this.faroNie4.checked= true

			if parteFrente.burrera == 'BIEN'
				this.burre1.checked= true
			else if parteFrente.burrera== 'REG'
				this.burre2.checked= true
			else if parteFrente.burrera=='MAL'
				this.burre3.checked= true
			else if parteFrente.burrera=='NO'
				this.burre4.checked= true

			if parteFrente.accesorios == 'BIEN'
				this.accesorio1.checked= true
			else if parteFrente.accesorios== 'REG'
				this.accesorio2.checked= true
			else if parteFrente.accesorios=='MAL'
				this.accesorio3.checked= true
			else if parteFrente.accesorios=='NO'
				this.accesorio4.checked= true
		actualizarParteFrente:->
			parteFrente = window.parte_posterior
			if this.cofre1.checked == true
				parteFrente.cofre= 'BIEN'
			else if this.cofre2.checked == true
				parteFrente.cofre= "REG"
			else if this.cofre3.checked == true
				parteFrente.cofre= 'MAL'
			else if this.cofre4.checked == true
				parteFrente.cofre= 'NO'

			if this.toldo1.checked == true
				parteFrente.toldo= 'BIEN'
			else if this.toldo2.checked == true
				parteFrente.toldo= "REG"
			else if this.toldo3.checked == true
				parteFrente.toldo= 'MAL'
			else if this.toldo4.checked == true
				parteFrente.toldo= 'NO'

			if this.parabrisas1.checked == true
				parteFrente.parabrisas= 'BIEN'
			else if this.parabrisas2.checked == true
				parteFrente.parabrisas= "REG"
			else if this.parabrisas3.checked == true
				parteFrente.parabrisas= 'MAL'
			else if this.parabrisas4.checked == true
				parteFrente.parabrisas= 'NO'

			if this.unidadIzquierda1.checked == true
				parteFrente.unidad_de_luz_izquierdo= 'BIEN'
			else if this.unidadIzquierda2.checked == true
				parteFrente.unidad_de_luz_izquierdo= "REG"
			else if this.unidadIzquierda3.checked == true
				parteFrente.unidad_de_luz_izquierdo= 'MAL'
			else if this.unidadIzquierda4.checked == true
				parteFrente.unidad_de_luz_izquierdo= 'NO'

			if this.unidadDerecha1.checked == true
				parteFrente.unidad_de_luz_derecho= 'BIEN'
			else if this.unidadDerecha2.checked == true
				parteFrente.unidad_de_luz_derecho= "REG"
			else if this.unidadDerecha3.checked == true
				parteFrente.unidad_de_luz_derecho= 'MAL'
			else if this.unidadDerecha4.checked == true
				parteFrente.unidad_de_luz_derecho= 'NO'

			if this.parrilla1.checked == true
				parteFrente.parrilla= 'BIEN'
			else if this.parrilla2.checked == true
				parteFrente.parrilla= "REG"
			else if this.parrilla3.checked == true
				parteFrente.parrilla= 'MAL'
			else if this.parrilla4.checked == true
				parteFrente.parrilla= 'NO'

			if this.defeTrase1.checked == true
				parteFrente.defensa_delantera= 'BIEN'
			else if this.defeTrase2.checked == true
				parteFrente.defensa_delantera= "REG"
			else if this.defeTrase3.checked == true
				parteFrente.defensa_delantera= 'MAL'
			else if this.defeTrase4.checked == true
				parteFrente.defensa_delantera= 'NO'

			if this.facia1.checked == true
				parteFrente.facia= 'BIEN'
			else if this.facia2.checked == true
				parteFrente.facia= "REG"
			else if this.facia3.checked == true
				parteFrente.facia= 'MAL'
			else if this.facia4.checked == true
				parteFrente.facia= 'NO'

			if this.tablillasCirc1.checked == true
				parteFrente.tablillas_de_circulaciones= 'BIEN'
			else if this.tablillasCirc2.checked == true
				parteFrente.tablillas_de_circulaciones= "REG"
			else if this.tablillasCirc3.checked == true
				parteFrente.tablillas_de_circulaciones= 'MAL'
			else if this.tablillasCirc4.checked == true
				parteFrente.tablillas_de_circulaciones= 'NO'

			if this.cuartoDelanIz1.checked == true
				parteFrente.cuarto_delantero_izquierdo= 'BIEN'
			else if this.cuartoDelanIz2.checked == true
				parteFrente.cuarto_delantero_izquierdo= "REG"
			else if this.cuartoDelanIz3.checked == true
				parteFrente.cuarto_delantero_izquierdo= 'MAL'
			else if this.cuartoDelanIz4.checked == true
				parteFrente.cuarto_delantero_izquierdo= 'NO'

			if this.cuartoDelanDe1.checked == true
				parteFrente.cuarto_delantero_derecho= 'BIEN'
			else if this.cuartoDelanDe2.checked == true
				parteFrente.cuarto_delantero_derecho= "REG"
			else if this.cuartoDelanDe3.checked == true
				parteFrente.cuarto_delantero_derecho= 'MAL'
			else if this.cuartoDelanDe4.checked == true
				parteFrente.cuarto_delantero_derecho= 'NO'

			if this.limpiadores1.checked == true
				parteFrente.limpiadores= 'BIEN'
			else if this.limpiadores2.checked == true
				parteFrente.limpiadores= "REG"
			else if this.limpiadores3.checked == true
				parteFrente.limpiadores= 'MAL'
			else if this.limpiadores4.checked == true
				parteFrente.limpiadores= 'NO'

			if this.emblemas1.checked == true
				parteFrente.emblemas= 'BIEN'
			else if this.emblemas2.checked == true
				parteFrente.emblemas= "REG"
			else if this.emblemas3.checked == true
				parteFrente.emblemas= 'MAL'
			else if this.emblemas4.checked == true
				parteFrente.emblemas= 'NO'

			if this.spoiler1.checked == true
				parteFrente.spoilers= 'BIEN'
			else if this.spoiler2.checked == true
				parteFrente.spoilers= "REG"
			else if this.spoiler3.checked == true
				parteFrente.spoilers= 'MAL'
			else if this.spoiler4.checked == true
				parteFrente.spoilers= 'NO'

			if this.faroNie1.checked == true
				parteFrente.faros_de_niebla= 'BIEN'
			else if this.faroNie2.checked == true
				parteFrente.faros_de_niebla= "REG"
			else if this.faroNie3.checked == true
				parteFrente.faros_de_niebla= 'MAL'
			else if this.faroNie4.checked == true
				parteFrente.faros_de_niebla= 'NO'

			if this.burre1.checked == true
				parteFrente.burrera= 'BIEN'
			else if this.burre2.checked == true
				parteFrente.burrera= "REG"
			else if this.burre3.checked == true
				parteFrente.burrera= 'MAL'
			else if this.burre4.checked == true
				parteFrente.burrera= 'NO'

			if this.acccesorio1.checked == true
				parteFrente.accesorios= 'BIEN'
			else if this.acccesorio2.checked == true
				parteFrente.accesorios= "REG"
			else if this.acccesorio3.checked == true
				parteFrente.accesorios= 'MAL'
			else if this.acccesorio4.checked == true
				parteFrente.accesorios= 'NO'