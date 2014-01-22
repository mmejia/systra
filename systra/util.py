from systra.utils_session import *
from accidentes.models import Resource

def buscarAgenteById(agentes,id):
	for agente in agentes:
		if agente.ID== id:
			return agente
	return None
def buscarClasAccidenteById(clasAccidente, id):
	for clas in clasAccidente:
		if clas.id== id:
			return clas
	return None
def getUrlImagenesDeAccidenteUtil(request,id_unico):
	queryset= Resource.objects.filter(id_unico__iexact=id_unico)
	lista= list(queryset)
	res="["
	i=0
	for item in lista:
		if i>0:
			res+=',"' + str(item.id) + '"'
		else:
			res+='"' + str(item.id) + '"'
		i=i+1
	res +=']'
	return res
def getArrImagenesDeAccidenteUtil(request,id_unico):
	queryset= Resource.objects.filter(id_unico__iexact=id_unico)
	lista= list(queryset)
	res=[]
	for item in lista:
		res.append(item.id)
	return res
def buscarDelegacionesById(request,id):
	delegaciones= getDelegaciones(request)
	for delegacion in delegaciones:
		if delegacion.id== id:
			return delegacion
	return None
def buscarDelegacionNombreById(request,id):
	delegaciones= getDelegaciones(request)
	for delegacion in delegaciones:
		if delegacion.id== id:
			return delegacion.delegacion
	return ''
def buscarComandanciaById(request,id):
	comandancias= getComandancia(request)
	for delegacion in delegaciones:
		if delegacion.id== id:
			return delegacion
	return None
def buscarTurnoNombreById(request,id):
	turnos= getTurnos(request)
	for turno in turnos:
		if turno.id== id:
			return turno.turno
	return ''
def buscarComandanciaNombreById(request,id):
	comandancias= getComandancias(request)
	for comandancia in comandancias:
		if comandancia.id== id:
			return comandancia.comandancia
	return ''
def buscarColoniaNombreById(request,id):
	colonias= getColonias(request)
	for colonia in colonias:
		if colonia.id== id:
			return colonia.nombre
	return ''
def buscarCalleNombreById(request,id):
	calles= getCalles(request)
	for calle in calles:
		if calle.id== id:
			return calle.calle
	return ''
def buscarPensionNombreById(request,id):
	pensiones= listTbPensiones(request)
	for pension in pensiones:
		if pension.id== id:
			return pension.nombre_pension
	return ''
def buscarCompetentesNombreById(request,id):
	competentes= listCompetentes(request)
	for competente in competentes:
		if competente.id== id:
			return competente.nombre
	return ''

def buscarInfraccionAccidente(tipo):
	if tipo== "I":
		return "Infraccion"
	elif tipo=="A":
		return "Accidente"
	elif tipo=="R":
		return "Resguardo"
	elif tipo=="C":
		return "Consignacion"
	else:
		return tipo
def buscarSinPlacas(tipo):
	if tipo== "0":
		return "No"
	elif tipo=="1":
		return "Si"
	else:
		return "No"
def buscarPensionLugar(tipo):
	if tipo== "1":
		return "Ciudad"
	elif tipo== "2":
		return "Carretera"
	else:
		return "Ciudad"

def buscarNombreTipoVehiculoById(request,id):
	tipos=listInvCatTipoVehiculo(request)
	for tipo in tipos:
		if tipo.id== id:
			return tipo.tipo
	return ''
def buscarNumeroMpById(request,id):
	tipos=getMps(request)
	for tipo in tipos:
		if tipo.id== id:
			return tipo.agencia
	return ''
def buscarNombreCorporacionById(request,id):
	corporaciones=getCorporaciones(request)
	for corp in corporaciones:
		if corp.id== id:
			return corp.corporacion
	return 'TRANSITO'
def getServicio(tipo):
	if tipo=='1':
		return 'Servicio Particular'
	elif tipo=='2':
		return 'Servicio Publlico'
	else:
		return 'Servicio Particular'
def getLlaves(llaves):
	if llaves=='0':
		return 'No'
	elif llaves=='1':
		return 'Si'
	else:
		return 'No'
def getTipoServicio(tipo):
	if tipo=='1':
		return 'Taxi'
	elif tipo=='2':
		return 'Urbano'
	elif tipo=='3':
		return 'Foraneo'
	elif tipo=='4':
		return 'Policia'
	elif tipo=='5':
		return 'Transito'
	else:
		return ''
def qn(dato):
	if dato == None:
		return ''
	else: 
		return dato
