define [
	'jade!/tpl/admin/ListUsers'
	'jade!/tpl/admin/AddUser'
	'core/sandbox'
],(template,tplAddUser,sandbox) ->
	ManagerListUsers=
		padreId:"#contenido"
		template : null
		padre:null
		tabla:null
		iniciar:()->
			that=this
			this.padre=$(this.padreId)
			this.sandbox= new sandbox(this)
			this.template= template
			this.padre.append(this.template)
			this.tplAddUser= tplAddUser
			this.tabla=$('#listaUsuarios').dataTable
						"bJQueryUI": true,
						"sPaginationType": "full_numbers"
			$('#addUsuario').on 'click', ->
				that.padre.html("")
				that.padre.append(that.tplAddUser)
				$('#guardarUsuario').on 'click',->
					that.saveUsuario()

			this.cargarUsuarios()
		showListUsuarios:->
			that=this
			that.padre.html("")
			that.padre.append(that.template)
			this.tabla=$('#listaUsuarios').dataTable
						"bJQueryUI": true,
						"sPaginationType": "full_numbers"
			this.cargarUsuarios()
			$('#guardarUsuario').on 'click',->
					that.saveUsuario()
		saveUsuario:()->
			that=this
			usuario=$('#usuario').val()
			pwd=$('#pwd').val()
			email= $('#email').val()
			foto=$('#foto').val()
			user=
				user:usuario
				pwd:pwd
				email:email
				foto:foto
				workspace:
					mensajes:[]
					inventarios:[]
					partes:[]
					preliminares:[]
					infracciones:[]
				ubicacion:
					comandancia:"1era Comandancia"
					sector:"Delegacion"
					delegacion:"Morelos"
				rol:
					nombre:"1era Comandancia"
			console.log user
			$.post 'addUser',user,(data)->
				that.showListUsuarios()
		cargarUsuarios:()->
			that= this
			$.ajax
				type:'GET'
				url:'listUsuarios.json'
				success:(data)->
					for item in data
						that.tabla.dataTable().fnAddData [
							""
							item.user
							item.rol.nombre
							item.foto
						]
					return
			return