define [
		'core/sandbox'
],(sandbox)->
	MangerInterior=
		sandbox:null
		guantera1:null
		guantera2:null
		guantera3:null
		guantera4:null
		chapa1:null
		chapa2:null
		chapa3:null
		chapa4:null
		perillaVel1:null
		perillaVel2:null
		perillaVel3:null
		perillaVel4:null
		direcc1:null
		direcc2:null
		direcc3:null
		direcc4:null
		freno1:null
		freno2:null
		freno3:null
		freno4:null
		encendor1:null
		encendor2:null
		encendor3:null
		encendor4:null
		tapiceria1:null
		tapiceria2:null
		tapiceria3:null
		tapiceria4:null
		cabecera1:null
		cabecera2:null
		cabecera3:null
		cabecera4:null
		coderas1:null
		coderas2:null
		coderas3:null
		coderas4:null
		dirccionales1:null
		dirccionales2:null
		dirccionales3:null
		dirccionales4:null
		tablero1:null
		tablero2:null
		tablero3:null
		tablero4:null
		retrovisor1:null
		retrovisor2:null
		retrovisor3:null
		retrovisor4:null
		tapete1:null
		tapete2:null
		tapete3:null
		tapete4:null
		perillasLuces1:null
		perillasLuces2:null
		perillasLuces3:null
		perillasLuces4:null
		cenicero1:null
		cenicero2:null
		cenicero3:null
		cenicero4:null
		maniMa1:null
		maniMa2:null
		maniMa3:null
		maniMa4:null
		radio1:null
		radio2:null
		radio3:null
		radio4:null
		estereo1:null
		estereo2:null
		estereo3:null
		estereo4:null
		ecualiazador1:null
		ecualiazador2:null
		ecualiazador3:null
		ecualiazador4:null
		fuentePoder1:null
		fuentePoder2:null
		fuentePoder3:null
		fuentePoder4:null
		biceras1:null
		biceras2:null
		biceras3:null
		biceras4:null
		bocina1:null
		bocina2:null
		bocina3:null
		bocina4:null
		bafle1:null
		bafle2:null
		bafle3:null
		bafle4:null
		iniciar:->
			this.sandbox= new sandbox this
			this.sandbox.on 'cargar-interior-view',this.mostrarInteriorOnView
			this.guantera1 = document.getElementById("guantera1_inv")
			this.guantera2 = document.getElementById("guantera2_inv")
			this.guantera3 = document.getElementById("guantera3_inv")
			this.guantera4 = document.getElementById("guantera4_inv")
			this.chapa1 = document.getElementById("chapa1_inv")
			this.chapa2 = document.getElementById("chapa2_inv")
			this.chapa3 = document.getElementById("chapa3_inv")
			this.chapa4 = document.getElementById("chapa4_inv")
			this.perillaVel1 = document.getElementById("perillaVe1_inv")
			this.perillaVel2 = document.getElementById("perillaVe2_inv")
			this.perillaVel3 = document.getElementById("perillaVe3_inv")
			this.perillaVel4 = document.getElementById("perillaVe4_inv")
			this.direcc1 = document.getElementById("direcc1_inv")
			this.direcc2 = document.getElementById("direcc2_inv")
			this.direcc3 = document.getElementById("direcc3_inv")
			this.direcc4 = document.getElementById("direcc4_inv")
			this.freno1 = document.getElementById("freno1_inv")
			this.freno2 = document.getElementById("freno2_inv")
			this.freno3 = document.getElementById("freno3_inv")
			this.freno4 = document.getElementById("freno4_inv")
			this.encendor1 = document.getElementById("encendedor1_inv")
			this.encendor2 = document.getElementById("encendedor2_inv")
			this.encendor3 = document.getElementById("encendedor3_inv")
			this.encendor4 = document.getElementById("encendedor4_inv")
			this.tapiceria1 = document.getElementById("tapiceria1_inv")
			this.tapiceria2 = document.getElementById("tapiceria2_inv")
			this.tapiceria3 = document.getElementById("tapiceria3_inv")
			this.tapiceria4 = document.getElementById("tapiceria4_inv")
			this.cabecera1 = document.getElementById("cabecera1_inv")
			this.cabecera2 = document.getElementById("cabecera2_inv")
			this.cabecera3 = document.getElementById("cabecera3_inv")
			this.cabecera4 = document.getElementById("cabecera4_inv")
			this.coderas1 = document.getElementById("coderas1_inv")
			this.coderas2 = document.getElementById("coderas2_inv")
			this.coderas3 = document.getElementById("coderas3_inv")
			this.coderas4 = document.getElementById("coderas4_inv")
			this.dirccionales1 = document.getElementById("dirccionales1_inv")
			this.dirccionales2 = document.getElementById("dirccionales2_inv")
			this.dirccionales3 = document.getElementById("dirccionales3_inv")
			this.dirccionales4 = document.getElementById("dirccionales4_inv")
			this.tablero1 = document.getElementById("tablero1_inv")
			this.tablero2 = document.getElementById("tablero2_inv")
			this.tablero3 = document.getElementById("tablero3_inv")
			this.tablero4 = document.getElementById("tablero4_inv")
			this.retrovisor1 = document.getElementById("retrovisor1_inv")
			this.retrovisor2 = document.getElementById("retrovisor2_inv")
			this.retrovisor3 = document.getElementById("retrovisor3_inv")
			this.retrovisor4 = document.getElementById("retrovisor4_inv")
			this.tapete1 = document.getElementById("tapete1_inv")
			this.tapete2 = document.getElementById("tapete2_inv")
			this.tapete3 = document.getElementById("tapete3_inv")
			this.tapete4 = document.getElementById("tapete4_inv")
			this.perillasLuces1 = document.getElementById("perillasLuces1_inv")
			this.perillasLuces2 = document.getElementById("perillasLuces2_inv")
			this.perillasLuces3 = document.getElementById("perillasLuces3_inv")
			this.perillasLuces4 = document.getElementById("perillasLuces4_inv")
			this.cenicero1 = document.getElementById("cenicero1_inv")
			this.cenicero2 = document.getElementById("cenicero2_inv")
			this.cenicero3 = document.getElementById("cenicero3_inv")
			this.cenicero4 = document.getElementById("cenicero4_inv")
			this.maniMa1 = document.getElementById("maniMa1_inv")
			this.maniMa2 = document.getElementById("maniMa2_inv")
			this.maniMa3 = document.getElementById("maniMa3_inv")
			this.maniMa4 = document.getElementById("maniMa4_inv")
			this.radio1 = document.getElementById("radio1_inv")
			this.radio2 = document.getElementById("radio2_inv")
			this.radio3 = document.getElementById("radio3_inv")
			this.radio4 = document.getElementById("radio4_inv")
			this.estereo1 = document.getElementById("estereo1_inv")
			this.estereo2 = document.getElementById("estereo2_inv")
			this.estereo3 = document.getElementById("estereo3_inv")
			this.estereo4 = document.getElementById("estereo4_inv")
			this.ecualiazador1 = document.getElementById("ecualizador1_inv")
			this.ecualiazador2 = document.getElementById("ecualizador2_inv")
			this.ecualiazador3 = document.getElementById("ecualizador3_inv")
			this.ecualiazador4 = document.getElementById("ecualizador4_inv")
			this.fuentePoder1 = document.getElementById("fuentePoder1_inv")
			this.fuentePoder2 = document.getElementById("fuentePoder2_inv")
			this.fuentePoder3 = document.getElementById("fuentePoder3_inv")
			this.fuentePoder4 = document.getElementById("fuentePoder4_inv")
			this.biceras1 = document.getElementById("biceras1_inv")
			this.biceras2 = document.getElementById("biceras2_inv")
			this.biceras3 = document.getElementById("biceras3_inv")
			this.biceras4 = document.getElementById("biceras4_inv")
			this.bocina1 = document.getElementById("bocina1_inv")
			this.bocina2 = document.getElementById("bocina2_inv")
			this.bocina3 = document.getElementById("bocina3_inv")
			this.bocina4 = document.getElementById("bocina4_inv")
			this.bafle1 = document.getElementById("bafle1_inv")
			this.bafle2 = document.getElementById("bafle2_inv")
			this.bafle3 = document.getElementById("bafle3_inv")
			this.bafle4 = document.getElementById("bafle4_inv")
			this.sandbox.on 'cancelar-interior-view', this.cancelar 
		cancelar:->
			this.guantera1.checked= false
			this.guantera2.checked= false
			this.guantera3.checked= false
			this.guantera4.checked= false
			this.chapa1.checked= false
			this.chapa2.checked= false
			this.chapa3.checked= false
			this.chapa4.checked= false
			this.perillaVel1.checked= false
			this.perillaVel2.checked= false
			this.perillaVel3.checked= false
			this.perillaVel4.checked= false
			this.direcc1.checked= false
			this.direcc2.checked= false
			this.direcc3.checked= false
			this.direcc4.checked= false
			this.freno1.checked= false
			this.freno2.checked= false
			this.freno3.checked= false
			this.freno4.checked= false
			this.encendor1.checked= false
			this.encendor2.checked= false
			this.encendor3.checked= false
			this.encendor4.checked= false
			this.tapiceria1.checked= false
			this.tapiceria2.checked= false
			this.tapiceria3.checked= false
			this.tapiceria4.checked= false
			this.cabecera1.checked= false
			this.cabecera2.checked= false
			this.cabecera3.checked= false
			this.cabecera4.checked= false
			this.coderas1.checked= false
			this.coderas2.checked= false
			this.coderas3.checked= false
			this.coderas4.checked= false
			this.dirccionales1.checked= false
			this.dirccionales2.checked= false
			this.dirccionales3.checked= false
			this.dirccionales4.checked= false
			this.tablero1.checked= false
			this.tablero2.checked= false
			this.tablero3.checked= false
			this.tablero4.checked= false
			this.retrovisor1.checked= false
			this.retrovisor2.checked= false
			this.retrovisor3.checked= false
			this.retrovisor4.checked= false
			this.tapete1.checked= false
			this.tapete2.checked= false
			this.tapete3.checked= false
			this.tapete4.checked= false
			this.perillasLuces1.checked= false
			this.perillasLuces2.checked= false
			this.perillasLuces3.checked= false
			this.perillasLuces4.checked= false
			this.cenicero1.checked= false
			this.cenicero2.checked= false
			this.cenicero3.checked= false
			this.cenicero4.checked= false
			this.maniMa1.checked= false
			this.maniMa2.checked= false
			this.maniMa3.checked= false
			this.maniMa4.checked= false
			this.radio1.checked= false
			this.radio2.checked= false
			this.radio3.checked= false
			this.radio4.checked= false
			this.estereo1.checked= false
			this.estereo2.checked= false
			this.estereo3.checked= false
			this.estereo4.checked= false
			this.ecualiazador1.checked= false
			this.ecualiazador2.checked= false
			this.ecualiazador3.checked= false
			this.ecualiazador4.checked= false
			this.fuentePoder1.checked= false
			this.fuentePoder2.checked= false
			this.fuentePoder3.checked= false
			this.fuentePoder4.checked= false
			this.biceras1.checked= false
			this.biceras2.checked= false
			this.biceras3.checked= false
			this.biceras4.checked= false
			this.bocina1.checked= false
			this.bocina2.checked= false
			this.bocina3.checked= false
			this.bocina4.checked= false
			this.bafle1.checked= false
			this.bafle2.checked= false
			this.bafle3.checked= false
			this.bafle4.checked= false
		mostrarInteriorOnView:->
			interior= window.inventario.interior
			if interior.guantera == 'BIEN'
				this.guantera1.checked= true
			else if interior.guantera== 'REG'
				this.guantera2.checked= true
			else if interior.guantera=='MAL'
				this.guantera3.checked= true
			else if interior.guantera=='NO'
				this.guantera4.checked= true

			if interior.chapa == 'BIEN'
				this.chapa1.checked= true
			else if interior.chapa== 'REG'
				this.chapa2.checked= true
			else if interior.chapa=='MAL'
				this.chapa3.checked= true
			else if interior.chapa=='NO'
				this.chapa4.checked= true

			if interior.perilla_vel == 'BIEN'
				this.perillaVel1.checked= true
			else if interior.perilla_vel== 'REG'
				this.perillaVel2.checked= true
			else if interior.perilla_vel=='MAL'
				this.perillaVel3.checked= true
			else if interior.perilla_vel=='NO'
				this.perillaVel4.checked= true

			if interior.direccion == 'BIEN'
				this.direcc1.checked= true
			else if interior.direccion== 'REG'
				this.direcc2.checked= true
			else if interior.direccion=='MAL'
				this.direcc3.checked= true
			else if interior.direccion=='NO'
				this.direcc4.checked= true

			if interior.freno_mano == 'BIEN'
				this.freno1.checked= true
			else if interior.freno_mano== 'REG'
				this.freno2.checked= true
			else if interior.freno_mano=='MAL'
				this.freno3.checked= true
			else if interior.freno_mano=='NO'
				this.freno4.checked= true

			if interior.encendedor == 'BIEN'
				this.encendor1.checked= true
			else if interior.encendedor == 'REG'
				this.encendor2.checked= true
			else if interior.encendedor =='MAL'
				this.encendor3.checked= true
			else if interior.encendedor =='NO'
				this.encendor4.checked= true

			if interior.tapiceria == 'BIEN'
				this.tapiceria1.checked= true
			else if interior.tapiceria== 'REG'
				this.tapiceria2.checked= true
			else if interior.tapiceria=='MAL'
				this.tapiceria3.checked= true
			else if interior.tapiceria=='NO'
				this.tapiceria4.checked= true

			if interior.cabeceras == 'BIEN'
				this.cabecera1.checked= true
			else if interior.cabeceras== 'REG'
				this.cabecera2.checked= true
			else if interior.cabeceras=='MAL'
				this.cabecera3.checked= true
			else if interior.cabeceras=='NO'
				this.cabecera4.checked= true

			if interior.coderas == 'BIEN'
				this.coderas1.checked= true
			else if interior.coderas== 'REG'
				this.coderas2.checked= true
			else if interior.coderas=='MAL'
				this.coderas3.checked= true
			else if interior.coderas=='NO'
				this.coderas4.checked= true

			if interior.direccionales == 'BIEN'
				this.dirccionales1.checked= true
			else if interior.direccionales== 'REG'
				this.dirccionales2.checked= true
			else if interior.direccionales=='MAL'
				this.dirccionales3.checked= true
			else if interior.direccionales=='NO'
				this.dirccionales4.checked= true

			if interior.tablero == 'BIEN'
				this.tablero1.checked= true
			else if interior.tablero== 'REG'
				this.tablero2.checked= true
			else if interior.tablero=='MAL'
				this.tablero3.checked= true
			else if interior.tablero=='NO'
				this.tablero4.checked= true

			if interior.retrovisor == 'BIEN'
				this.retrovisor1.checked= true
			else if interior.retrovisor == 'REG'
				this.retrovisor2.checked= true
			else if interior.retrovisor =='MAL'
				this.retrovisor3.checked= true
			else if interior.retrovisor =='NO'
				this.retrovisor4.checked= true

			if interior.tapetes == 'BIEN'
				this.tapete1.checked= true
			else if interior.tapetes== 'REG'
				this.tapete2.checked= true
			else if interior.tapetes=='MAL'
				this.tapete3.checked= true
			else if interior.tapetes=='NO'
				this.tapete4.checked= true

			if interior.perilla_de_luces == 'BIEN'
				this.perillasLuces1.checked= true
			else if interior.perilla_de_luces== 'REG'
				this.perillasLuces2.checked= true
			else if interior.perilla_de_luces=='MAL'
				this.perillasLuces3.checked= true
			else if interior.perilla_de_luces=='NO'
				this.perillasLuces4.checked= true

			if interior.cenicero == 'BIEN'
				this.cenicero1.checked= true
			else if interior.cenicero== 'REG'
				this.cenicero2.checked= true
			else if interior.cenicero=='MAL'
				this.cenicero3.checked= true
			else if interior.cenicero=='NO'
				this.cenicero4.checked= true

			if interior.manijas_manivelas == 'BIEN'
				this.maniMa1.checked= true
			else if interior.manijas_manivelas== 'REG'
				this.maniMa2.checked= true
			else if interior.manijas_manivelas=='MAL'
				this.maniMa3.checked= true
			else if interior.manijas_manivelas=='NO'
				this.maniMa4.checked= true

			if interior.radio == 'BIEN'
				this.radio1.checked= true
			else if interior.radio== 'REG'
				this.radio2.checked= true
			else if interior.radio=='MAL'
				this.radio3.checked= true
			else if interior.radio=='NO'
				this.radio4.checked= true

			if interior.estereo == 'BIEN'
				this.estereo1.checked= true
			else if interior.estereo== 'REG'
				this.estereo2.checked= true
			else if interior.estereo=='MAL'
				this.estereo3.checked= true
			else if interior.estereo=='NO'
				this.estereo4.checked= true

			if interior.ecualizador == 'BIEN'
				this.ecualiazador1.checked= true
			else if interior.ecualizador == 'REG'
				this.ecualiazador2.checked= true
			else if interior.ecualizador =='MAL'
				this.ecualiazador3.checked= true
			else if interior.ecualizador =='NO'
				this.ecualiazador4.checked= true

			if interior.fuente_de_poder == 'BIEN'
				this.fuentePoder1.checked= true
			else if interior.fuente_de_poder== 'REG'
				this.fuentePoder2.checked= true
			else if interior.fuente_de_poder=='MAL'
				this.fuentePoder3.checked= true
			else if interior.fuente_de_poder=='NO'
				this.fuentePoder4.checked= true

			if interior.biceras == 'BIEN'
				this.biceras1.checked= true
			else if interior.biceras== 'REG'
				this.biceras2.checked= true
			else if interior.biceras=='MAL'
				this.biceras3.checked= true
			else if interior.biceras=='NO'
				this.biceras4.checked= true

			if interior.bocinas == 'BIEN'
				this.bocina1.checked= true
			else if interior.bocinas== 'REG'
				this.bocina2.checked= true
			else if interior.bocinas=='MAL'
				this.bocina3.checked= true
			else if interior.bocinas=='NO'
				this.bocina4.checked= true

			if interior.bafles == 'BIEN'
				this.bafle1.checked= true
			else if interior.bafles== 'REG'
				this.bafle2.checked= true
			else if interior.bafles=='MAL'
				this.bafle3.checked= true
			else if interior.bafles=='NO'
				this.bafle4.checked= true
		actualizarInterior:->
			interior = window.interior
			if this.guantera1.checked == true
				interior.guantera= 'BIEN'
			else if this.guantera2.checked == true
				interior.guantera= "REG"
			else if this.guantera3.checked == true
				interior.guantera= 'MAL'
			else if this.guantera4.checked == true
				interior.guantera= 'NO'

			if this.chapa1.checked == true
				interior.chapa= 'BIEN'
			else if this.chapa2.checked == true
				interior.chapa= "REG"
			else if this.chapa3.checked == true
				interior.chapa= 'MAL'
			else if this.chapa4.checked == true
				interior.chapa= 'NO'

			if this.perillaVel1.checked == true
				interior.perilla_vel= 'BIEN'
			else if this.perillaVel2.checked == true
				interior.perilla_vel= "REG"
			else if this.perillaVel3.checked == true
				interior.perilla_vel= 'MAL'
			else if this.perillaVel4.checked == true
				interior.perilla_vel= 'NO'

			if this.direcc1.checked == true
				interior.direccion= 'BIEN'
			else if this.direcc2.checked == true
				interior.direccion= "REG"
			else if this.direcc3.checked == true
				interior.direccion= 'MAL'
			else if this.direcc4.checked == true
				interior.direccion= 'NO'

			if this.freno1.checked == true
				interior.freno_mano= 'BIEN'
			else if this.freno2.checked == true
				interior.freno_mano= "REG"
			else if this.freno3.checked == true
				interior.freno_mano= 'MAL'
			else if this.freno4.checked == true
				interior.freno_mano= 'NO'

			if this.encendor1.checked == true
				interior.encendedor= 'BIEN'
			else if this.encendor2.checked == true
				interior.encendedor= "REG"
			else if this.encendor3.checked == true
				interior.encendedor= 'MAL'
			else if this.encendor4.checked == true
				interior.encendedor= 'NO'

			if this.tapiceria1.checked == true
				interior.tapiceria= 'BIEN'
			else if this.tapiceria2.checked == true
				interior.tapiceria= "REG"
			else if this.tapiceria3.checked == true
				interior.tapiceria= 'MAL'
			else if this.tapiceria4.checked == true
				interior.tapiceria= 'NO'

			if this.cabecera1.checked == true
				interior.cabeceras= 'BIEN'
			else if this.cabecera2.checked == true
				interior.cabeceras= "REG"
			else if this.cabecera3.checked == true
				interior.cabeceras= 'MAL'
			else if this.cabecera4.checked == true
				interior.cabeceras= 'NO'

			if this.coderas1.checked == true
				interior.coderas= 'BIEN'
			else if this.coderas2.checked == true
				interior.coderas= "REG"
			else if this.coderas3.checked == true
				interior.coderas= 'MAL'
			else if this.coderas4.checked == true
				interior.coderas= 'NO'

			if this.dirccionales1.checked == true
				interior.direccionales= 'BIEN'
			else if this.dirccionales2.checked == true
				interior.direccionales= "REG"
			else if this.dirccionales3.checked == true
				interior.direccionales= 'MAL'
			else if this.dirccionales4.checked == true
				interior.direccionales= 'NO'

			if this.tablero1.checked == true
				interior.tablero= 'BIEN'
			else if this.tablero2.checked == true
				interior.tablero= "REG"
			else if this.tablero3.checked == true
				interior.tablero= 'MAL'
			else if this.tablero4.checked == true
				interior.tablero= 'NO'

			if this.retrovisor1.checked == true
				interior.retrovisor= 'BIEN'
			else if this.retrovisor2.checked == true
				interior.retrovisor= "REG"
			else if this.retrovisor3.checked == true
				interior.retrovisor= 'MAL'
			else if this.retrovisor4.checked == true
				interior.retrovisor= 'NO'

			if this.tapete1.checked == true
				interior.tapetes= 'BIEN'
			else if this.tapete2.checked == true
				interior.tapetes= "REG"
			else if this.tapete3.checked == true
				interior.tapetes= 'MAL'
			else if this.tapete4.checked == true
				interior.tapetes= 'NO'

			if this.perillasLuces1.checked == true
				interior.perilla_de_luces= 'BIEN'
			else if this.perillasLuces2.checked == true
				interior.perilla_de_luces= "REG"
			else if this.perillasLuces3.checked == true
				interior.perilla_de_luces= 'MAL'
			else if this.perillasLuces4.checked == true
				interior.perilla_de_luces= 'NO'

			if this.cenicero1.checked == true
				interior.cenicero= 'BIEN'
			else if this.cenicero2.checked == true
				interior.cenicero= "REG"
			else if this.cenicero3.checked == true
				interior.cenicero= 'MAL'
			else if this.cenicero4.checked == true
				interior.cenicero= 'NO'

			if this.maniMa1.checked == true
				interior.manijas_manivelas= 'BIEN'
			else if this.maniMa2.checked == true
				interior.manijas_manivelas= "REG"
			else if this.maniMa3.checked == true
				interior.manijas_manivelas= 'MAL'
			else if this.maniMa4.checked == true
				interior.manijas_manivelas= 'NO'

			if this.radio1.checked == true
				interior.radio= 'BIEN'
			else if this.radio2.checked == true
				interior.radio= "REG"
			else if this.radio3.checked == true
				interior.radio= 'MAL'
			else if this.radio4.checked == true
				interior.radio= 'NO'

			if this.estereo1.checked == true
				interior.estereo= 'BIEN'
			else if this.estereo2.checked == true
				interior.estereo= "REG"
			else if this.estereo3.checked == true
				interior.estereo= 'MAL'
			else if this.estereo4.checked == true
				interior.estereo= 'NO'

			if this.ecualiazador1.checked == true
				interior.ecualizador= 'BIEN'
			else if this.ecualiazador2.checked == true
				interior.ecualizador= "REG"
			else if this.ecualiazador3.checked == true
				interior.ecualizador= 'MAL'
			else if this.ecualiazador4.checked == true
				interior.ecualizador= 'NO'

			if this.fuentePoder1.checked == true
				interior.fuente_de_poder= 'BIEN'
			else if this.fuentePoder2.checked == true
				interior.fuente_de_poder= "REG"
			else if this.fuentePoder3.checked == true
				interior.fuente_de_poder= 'MAL'
			else if this.fuentePoder4.checked == true
				interior.fuente_de_poder= 'NO'

			if this.biceras1.checked == true
				interior.biceras= 'BIEN'
			else if this.biceras2.checked == true
				interior.biceras= "REG"
			else if this.biceras3.checked == true
				interior.biceras= 'MAL'
			else if this.biceras4.checked == true
				interior.biceras= 'NO'

			if this.bocina1.checked == true
				interior.bocinas= 'BIEN'
			else if this.bocina2.checked == true
				interior.bocinas= "REG"
			else if this.bocina3.checked == true
				interior.bocinas= 'MAL'
			else if this.bocina4.checked == true
				interior.bocinas= 'NO'

			if this.bafle1.checked == true
				interior.bafles= 'BIEN'
			else if this.bafle2.checked == true
				interior.bafles= "REG"
			else if this.bafle3.checked == true
				interior.bafles= 'MAL'
			else if this.bafle4.checked == true
				interior.bafles= 'NO'