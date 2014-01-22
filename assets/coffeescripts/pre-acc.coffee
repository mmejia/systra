window.loadAccidente=(id)->
	$.ajax
		type:'GET'
		url:'/accidente/getAccidente/' + id + '/'
		success:(data)->
			alert('Vamos a cargar')
			console.log data
			window.acciddente=data
			return