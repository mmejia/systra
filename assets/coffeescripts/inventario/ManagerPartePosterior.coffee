define [
		'core/sandbox'
],(sandbox)->
	ManagerPartePosterior=
		cajuela1: null
		cajuela2: null
		cajuela3: null
		cajuela4: null
		medallon1: null
		medallon1: null
		medallon2: null
		medallon4: null
		calaDe1: null
		calaDe2: null
		calaDe3: null
		calaDe4: null
		calaIz1: null
		calaIz2: null
		calaIz3: null
		calaIz4: null
		lucesDe1: null
		lucesDe2: null
		lucesDe3: null
		lucesDe4: null
		lucesIz1: null
		lucesIz2: null
		lucesIz3: null
		lucesIz4: null
		defeTrase1: null
		defeTrase2: null
		defeTrase3: null
		defeTrase4: null
		faciaTra1: null
		faciaTra2: null
		faciaTra3: null
		faciaTra4: null
		tabliCirc1: null
		tabliCirc2: null
		tabliCirc3: null
		tabliCirc4: null
		limp1: null
		limp2: null
		limp3: null
		limp4: null
		emble1: null
		emble2: null
		emble3: null
		emble4: null
		spoi1: null
		spoi2: null
		spoi3: null
		spoi4: null
		colillaEs1: null
		colillaEs2: null
		colillaEs3: null
		colillaEs4: null
		accesor1: null
		accesor2: null
		accesor3: null
		accesor4: null
		stopTra1: null
		stopTra2: null
		stopTra3: null
		stopTra4: null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-parte-posterior-view',this.mostrarPartePosteriorOnView
			this.cajuela1 = document.getElementById("cajuela1_inv")
			this.cajuela2 = document.getElementById("cajuela2_inv")
			this.cajuela3 = document.getElementById("cajuela3_inv")
			this.cajuela4 = document.getElementById("cajuela4_inv")
			this.medallon1 = document.getElementById("medallon1_inv")
			this.medallon1 = document.getElementById("medallon2_inv")
			this.medallon2 = document.getElementById("medallon3_inv")
			this.medallon4 = document.getElementById("medallon4_inv")
			this.calaDe1 = document.getElementById("calaDe1_inv")
			this.calaDe2 = document.getElementById("calaDe2_inv")
			this.calaDe3 = document.getElementById("calaDe3_inv")
			this.calaDe4 = document.getElementById("calaDe4_inv")
			this.calaIz1 = document.getElementById("calaIz1_inv")
			this.calaIz2 = document.getElementById("calaIz2_inv")
			this.calaIz3 = document.getElementById("calaIz3_inv")
			this.calaIz4 = document.getElementById("calaIz4_inv")
			this.lucesDe1 = document.getElementById("cuartLucesDe1_inv")
			this.lucesDe2 = document.getElementById("cuartLucesDe2_inv")
			this.lucesDe3 = document.getElementById("cuartLucesDe3_inv")
			this.lucesDe4 = document.getElementById("cuartLucesDe4_inv")
			this.lucesIz1 = document.getElementById("cuartoLucesIz1_inv")
			this.lucesIz2 = document.getElementById("cuartoLucesIz2_inv")
			this.lucesIz3 = document.getElementById("cuartoLucesIz3_inv")
			this.lucesIz4 = document.getElementById("cuartoLucesIz4_inv")
			this.defeTrase1 = document.getElementById("defeTrase1_inv")
			this.defeTrase2 = document.getElementById("defeTrase2_inv")
			this.defeTrase3 = document.getElementById("defeTrase3_inv")
			this.defeTrase4 = document.getElementById("defeTrase4_inv")
			this.faciaTra1 = document.getElementById("faciaTra1_inv")
			this.faciaTra2 = document.getElementById("faciaTra2_inv")
			this.faciaTra3 = document.getElementById("faciaTra3_inv")
			this.faciaTra4 = document.getElementById("faciaTra4_inv")
			this.tabliCirc1 = document.getElementById("tabliCir1_inv")
			this.tabliCirc2 = document.getElementById("tabliCir2_inv")
			this.tabliCirc3 = document.getElementById("tabliCir3_inv")
			this.tabliCirc4 = document.getElementById("tabliCir4_inv")
			this.limp1 = document.getElementById("limp1_inv")
			this.limp2 = document.getElementById("limp2_inv")
			this.limp3 = document.getElementById("limp3_inv")
			this.limp4 = document.getElementById("limp4_inv")
			this.emble1 = document.getElementById("emble1_inv")
			this.emble2 = document.getElementById("emble2_inv")
			this.emble3 = document.getElementById("emble3_inv")
			this.emble4 = document.getElementById("emble4_inv")
			this.spoi1 = document.getElementById("spoi1_inv")
			this.spoi2 = document.getElementById("spoi2_inv")
			this.spoi3 = document.getElementById("spoi3_inv")
			this.spoi4 = document.getElementById("spoi4_inv")
			this.colillaEs1 = document.getElementById("colillaEs1_inv")
			this.colillaEs2 = document.getElementById("colillaEs2_inv")
			this.colillaEs3 = document.getElementById("colillaEs3_inv")
			this.colillaEs4 = document.getElementById("colillaEs4_inv")
			this.accesor1 = document.getElementById("accesor1_inv")
			this.accesor2 = document.getElementById("accesor2_inv")
			this.accesor3 = document.getElementById("accesor3_inv")
			this.accesor4 = document.getElementById("accesor4_inv")
			this.stopTra1 = document.getElementById("stopTra1_inv")
			this.stopTra2 = document.getElementById("stopTra2_inv")
			this.stopTra3 = document.getElementById("stopTra3_inv")
			this.stopTra4 = document.getElementById("stopTra4_inv")
			this.sandbox.on 'cancelar-parte-posterior-view', this.cancelar 
		cancelar:->
			this.cajuela1.checked= false
			this.cajuela2.checked= false
			this.cajuela3.checked= false
			this.cajuela4.checked= false
			this.medallon1.checked= false
			this.medallon1.checked= false
			this.medallon2.checked= false
			this.medallon4.checked= false
			this.calaDe1.checked= false
			this.calaDe2.checked= false
			this.calaDe3.checked= false
			this.calaDe4.checked= false
			this.calaIz1.checked= false
			this.calaIz2.checked= false
			this.calaIz3.checked= false
			this.calaIz4.checked= false
			this.lucesDe1.checked= false
			this.lucesDe2.checked= false
			this.lucesDe3.checked= false
			this.lucesDe4.checked= false
			this.lucesIz1.checked= false
			this.lucesIz2.checked= false
			this.lucesIz3.checked= false
			this.lucesIz4.checked= false
			this.defeTrase1.checked= false
			this.defeTrase2.checked= false
			this.defeTrase3.checked= false
			this.defeTrase4.checked= false
			this.faciaTra1.checked= false
			this.faciaTra2.checked= false
			this.faciaTra3.checked= false
			this.faciaTra4.checked= false
			this.tabliCirc1.checked= false
			this.tabliCirc2.checked= false
			this.tabliCirc3.checked= false
			this.tabliCirc4.checked= false
			this.limp1.checked= false
			this.limp2.checked= false
			this.limp3.checked= false
			this.limp4.checked= false
			this.emble1.checked= false
			this.emble2.checked= false
			this.emble3.checked= false
			this.emble4.checked= false
			this.spoi1.checked= false
			this.spoi2.checked= false
			this.spoi3.checked= false
			this.spoi4.checked= false
			this.colillaEs1.checked= false
			this.colillaEs2.checked= false
			this.colillaEs3.checked= false
			this.colillaEs4.checked= false
			this.accesor1.checked= false
			this.accesor2.checked= false
			this.accesor3.checked= false
			this.accesor4.checked= false
			this.stopTra1.checked= false
			this.stopTra2.checked= false
			this.stopTra3.checked= false
			this.stopTra4.checked= false
		mostrarPartePosteriorOnView:->
			partePosterior= window.inventario.parte_posterior
			if partePosterior.cajuela == 'BIEN'
				this.cajuela1.checked= true
			else if partePosterior.cajuela== 'REG'
				this.cajuela2.checked= true
			else if partePosterior.cajuela=='MAL'
				this.cajuela3.checked= true
			else if partePosterior.cajuela=='NO'
				this.cajuela4.checked= true

			if partePosterior.medallon == 'BIEN'
				this.medallon1.checked= true
			else if partePosterior.medallon== 'REG'
				this.medallon2.checked= true
			else if partePosterior.medallon=='MAL'
				this.medallon3.checked= true
			else if partePosterior.medallon=='NO'
				this.medallon4.checked= true

			if partePosterior.calavera_derecha == 'BIEN'
				this.calaDe1.checked= true
			else if partePosterior.calavera_derecha== 'REG'
				this.calaDe2.checked= true
			else if partePosterior.calavera_derecha=='MAL'
				this.calaDe3.checked= true
			else if partePosterior.calavera_derecha=='NO'
				this.calaDe4.checked= true

			if partePosterior.calavera_izquierda == 'BIEN'
				this.calaIz1.checked= true
			else if partePosterior.calavera_izquierda== 'REG'
				this.calaIz2.checked= true
			else if partePosterior.calavera_izquierda=='MAL'
				this.calaIz3.checked= true
			else if partePosterior.calavera_izquierda=='NO'
				this.calaIz4.checked= true

			if partePosterior.cuarto_de_luces_posterior_derecho == 'BIEN'
				this.lucesDe1.checked= true
			else if partePosterior.cuarto_de_luces_posterior_derecho == 'REG'
				this.lucesDe2.checked= true
			else if partePosterior.cuarto_de_luces_posterior_derecho =='MAL'
				this.lucesDe3.checked= true
			else if partePosterior.cuarto_de_luces_posterior_derecho =='NO'
				this.lucesDe4.checked= true

			if partePosterior.cuarto_de_luces_posterior_izquierdo == 'BIEN'
				this.lucesIz1.checked= true
			else if partePosterior.cuarto_de_luces_posterior_izquierdo == 'REG'
				this.lucesIz2.checked= true
			else if partePosterior.cuarto_de_luces_posterior_izquierdo =='MAL'
				this.lucesIz3.checked= true
			else if partePosterior.cuarto_de_luces_posterior_izquierdo =='NO'
				this.lucesIz4.checked= true

			if partePosterior.defensa_trasera == 'BIEN'
				this.defeTrase1.checked= true
			else if partePosterior.defensa_trasera== 'REG'
				this.defeTrase2.checked= true
			else if partePosterior.defensa_trasera=='MAL'
				this.defeTrase3.checked= true
			else if partePosterior.defensa_trasera=='NO'
				this.defeTrase4.checked= true

			if partePosterior.facia_trasera == 'BIEN'
				this.faciaTra1.checked= true
			else if partePosterior.facia_trasera== 'REG'
				this.faciaTra2.checked= true
			else if partePosterior.facia_trasera=='MAL'
				this.faciaTra3.checked= true
			else if partePosterior.facia_trasera=='NO'
				this.faciaTra4.checked= true

			if partePosterior.tablillas_de_circulacion == 'BIEN'
				this.tabliCirc1.checked= true
			else if partePosterior.tablillas_de_circulacion== 'REG'
				this.tabliCirc2.checked= true
			else if partePosterior.tablillas_de_circulacion=='MAL'
				this.tabliCirc3.checked= true
			else if partePosterior.tablillas_de_circulacion=='NO'
				this.tabliCirc4.checked= true

			if partePosterior.limpiadores == 'BIEN'
				this.limp1.checked= true
			else if partePosterior.limpiadores== 'REG'
				this.limp2.checked= true
			else if partePosterior.limpiadores=='MAL'
				this.limp3.checked= true
			else if partePosterior.limpiadores=='NO'
				this.limp4.checked= true

			if partePosterior.emblema == 'BIEN'
				this.emble1.checked= true
			else if partePosterior.emblema== 'REG'
				this.emble2.checked= true
			else if partePosterior.emblema=='MAL'
				this.emble3.checked= true
			else if partePosterior.emblema=='NO'
				this.emble4.checked= true

			if partePosterior.spoiler == 'BIEN'
				this.spoi1.checked= true
			else if partePosterior.spoiler== 'REG'
				this.spoi2.checked= true
			else if partePosterior.spoiler=='MAL'
				this.spoi3.checked= true
			else if partePosterior.spoiler=='NO'
				this.spoi4.checked= true

			if partePosterior.colilla_de_escape == 'BIEN'
				this.colillaEs1.checked= true
			else if partePosterior.colilla_de_escape== 'REG'
				this.colillaEs2.checked= true
			else if partePosterior.colilla_de_escape=='MAL'
				this.colillaEs3.checked= true
			else if partePosterior.colilla_de_escape=='NO'
				this.colillaEs4.checked= true

			if partePosterior.accesorios == 'BIEN'
				this.accesor1.checked= true
			else if partePosterior.accesorios== 'REG'
				this.accesor2.checked= true
			else if partePosterior.accesorios=='MAL'
				this.accesor3.checked= true
			else if partePosterior.accesorios=='NO'
				this.accesor4.checked= true

			if partePosterior.stop_trasero == 'BIEN'
				this.stopTra1.checked= true
			else if partePosterior.stop_trasero== 'REG'
				this.stopTra2.checked= true
			else if partePosterior.stop_trasero=='MAL'
				this.stopTra3.checked= true
			else if partePosterior.stop_trasero=='NO'
				this.stopTra4.checked= true
		actualizarPartePosterior:->
			partePosterior = window.parte_posterior
			if this.cajuela1.checked == true
				partePosterior.cajuela= 'BIEN'
			else if this.cajuela2.checked == true
				partePosterior.cajuela= "REG"
			else if this.cajuela3.checked == true
				partePosterior.cajuela= 'MAL'
			else if this.cajuela4.checked == true
				partePosterior.cajuela= 'NO'

			if this.medallon1.checked == true
				partePosterior.medallon= 'BIEN'
			else if this.medallon2.checked == true
				partePosterior.medallon= "REG"
			else if this.medallon3.checked == true
				partePosterior.medallon= 'MAL'
			else if this.medallon4.checked == true
				partePosterior.medallon= 'NO'

			if this.calaDe1.checked == true
				partePosterior.calavera_derecha= 'BIEN'
			else if this.calaDe2.checked == true
				partePosterior.calavera_derecha= "REG"
			else if this.calaDe3.checked == true
				partePosterior.calavera_derecha= 'MAL'
			else if this.calaDe4.checked == true
				partePosterior.calavera_derecha= 'NO'

			if this.calaIz1.checked == true
				partePosterior.calavera_izquierda= 'BIEN'
			else if this.calaIz2.checked == true
				partePosterior.calavera_izquierda= "REG"
			else if this.calaIz3.checked == true
				partePosterior.calavera_izquierda= 'MAL'
			else if this.calaIz4.checked == true
				partePosterior.calavera_izquierda= 'NO'

			if this.lucesDe1.checked == true
				partePosterior.cuarto_de_luces_posterior_derecho= 'BIEN'
			else if this.lucesDe2.checked == true
				partePosterior.cuarto_de_luces_posterior_derecho= "REG"
			else if this.lucesDe3.checked == true
				partePosterior.cuarto_de_luces_posterior_derecho= 'MAL'
			else if this.lucesDe4.checked == true
				partePosterior.cuarto_de_luces_posterior_derecho= 'NO'

			if this.lucesIz1.checked == true
				partePosterior.cuarto_de_luces_posterior_izquierdo= 'BIEN'
			else if this.lucesIz2.checked == true
				partePosterior.cuarto_de_luces_posterior_izquierdo= "REG"
			else if this.lucesIz3.checked == true
				partePosterior.cuarto_de_luces_posterior_izquierdo= 'MAL'
			else if this.lucesIz4.checked == true
				partePosterior.cuarto_de_luces_posterior_izquierdo= 'NO'

			if this.defeTrase1.checked == true
				partePosterior.defensa_trasera= 'BIEN'
			else if this.defeTrase2.checked == true
				partePosterior.defensa_trasera= "REG"
			else if this.defeTrase3.checked == true
				partePosterior.defensa_trasera= 'MAL'
			else if this.defeTrase4.checked == true
				partePosterior.defensa_trasera= 'NO'

			if this.faciaTra1.checked == true
				partePosterior.facia_trasera= 'BIEN'
			else if this.faciaTra2.checked == true
				partePosterior.facia_trasera= "REG"
			else if this.faciaTra3.checked == true
				partePosterior.facia_trasera= 'MAL'
			else if this.faciaTra4.checked == true
				partePosterior.facia_trasera= 'NO'

			if this.tabliCirc1.checked == true
				partePosterior.tablillas_de_circulacion= 'BIEN'
			else if this.tabliCirc2.checked == true
				partePosterior.tablillas_de_circulacion= "REG"
			else if this.tabliCirc3.checked == true
				partePosterior.tablillas_de_circulacion= 'MAL'
			else if this.tabliCirc4.checked == true
				partePosterior.tablillas_de_circulacion= 'NO'

			if this.limp1.checked == true
				partePosterior.limpiadores= 'BIEN'
			else if this.limp2.checked == true
				partePosterior.limpiadores= "REG"
			else if this.limp3.checked == true
				partePosterior.limpiadores= 'MAL'
			else if this.limp4.checked == true
				partePosterior.limpiadores= 'NO'

			if this.emble1.checked == true
				partePosterior.emblema= 'BIEN'
			else if this.emble2.checked == true
				partePosterior.emblema= "REG"
			else if this.emble3.checked == true
				partePosterior.emblema= 'MAL'
			else if this.emble4.checked == true
				partePosterior.emblema= 'NO'

			if this.spoi1.checked == true
				partePosterior.spoiler= 'BIEN'
			else if this.spoi2.checked == true
				partePosterior.spoiler= "REG"
			else if this.spoi3.checked == true
				partePosterior.spoiler= 'MAL'
			else if this.spoi4.checked == true
				partePosterior.spoiler= 'NO'

			if this.colillaEs1.checked == true
				partePosterior.colilla_de_escape= 'BIEN'
			else if this.colillaEs2.checked == true
				partePosterior.colilla_de_escape= "REG"
			else if this.colillaEs3.checked == true
				partePosterior.colilla_de_escape= 'MAL'
			else if this.colillaEs4.checked == true
				partePosterior.colilla_de_escape= 'NO'

			if this.accesor1.checked == true
				partePosterior.accesorios= 'BIEN'
			else if this.accesor2.checked == true
				partePosterior.accesorios= "REG"
			else if this.accesor3.checked == true
				partePosterior.accesorios= 'MAL'
			else if this.accesor4.checked == true
				partePosterior.accesorios= 'NO'

			if this.stopTra1.checked == true
				partePosterior.stop_trasero= 'BIEN'
			else if this.stopTra2.checked == true
				partePosterior.stop_trasero= "REG"
			else if this.stopTra3.checked == true
				partePosterior.stop_trasero= 'MAL'
			else if this.stopTra4.checked == true
				partePosterior.stop_trasero= 'NO'