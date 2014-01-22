from accidentes.models import AccClasAccidente
from accidentes.models import CDelegaciones
from accidentes.models import CComandancias
from accidentes.models import CTurnos
from accidentes.models import TbTipoAccidentes
from accidentes.models import CCalles
from accidentes.models import TbColoniasOld
from accidentes.models import TbEstados
from accidentes.models import TbMunicipios
from accidentes.models import TbTipoCalle
from accidentes.models import NoCarriles
from accidentes.models import Sentidos
from accidentes.models import TbAgentes
from accidentes.models import TbDetenido
from accidentes.models import TbLevantadopor

from accidentes.models import AccClasVehiculo
from accidentes.models import AccVehiculoTipo
from accidentes.models import TbPensiones
from accidentes.models import TbColores
from accidentes.models import AccRestriccionesLicencia
from accidentes.models import CTipoVehiculo 
from accidentes.models import TbTipoOperativo
from accidentes.models import TbMarcas
from accidentes.models import Corporaciones
from accidentes.models import Competentes
from accidentes.models import InvCatAgenciasMp
from accidentes.models import InvCatTipoVehiculo
from accidentes.models import TbTipoEvento
from json import dumps, loads, JSONEncoder
from django.core import serializers
def info(log,msg,request):
	user= request.user
	http_host=request.META.get("HTTP_HOST","")
	user_agent=request.META.get("HTTP_USER_AGENT","")
	remote_addr=request.META.get("REMOTE_ADDR","")
	remote_host=request.META.get("REMOTE_HOST","") 
	usuario= user.username
	cad="%s , %s, %s, %s, %s,%s" %(http_host,user_agent,remote_addr,remote_host,usuario,msg)
	log.info(cad)
def convertir(obj):
	dic= obj.__dict__
	json_serializer=serializers.get_serializer('json')()
	llaves= dic.keys()
	cadena="{"
	for i  in range(len(llaves)):
		llave= llaves[i]
		if llave== "_state":
			continue
		valor= dic[llave]
		newval=''
		if type(valor)== unicode:
			newval=dumps(valor)
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":' +newval+ ''
			else:
				cadena= cadena +',"' +llave + '":' +newval +''
		else:
			newval=str(valor)
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":"' +newval+ '"'
			else:
				cadena= cadena +',"' +llave + '":"' +newval +'"'
	cadena=cadena+"}"
	return cadena

def convertirDiccionario(dic):
	json_serializer=serializers.get_serializer('json')()
	llaves= dic.keys()
	cadena="{"
	for i  in range(len(llaves)):
		llave= llaves[i]
		if llave== "_state":
			continue
		valor= dic[llave]
		newval=''
		if type(valor)== unicode:
			newval=dumps(valor)
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":' +newval+ ''
			else:
				cadena= cadena +',"' +llave + '":' +newval +''
		else:
			newval=str(valor)
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":"' +newval+ '"'
			else:
				cadena= cadena +',"' +llave + '":"' +newval +'"'
	cadena=cadena+"}"
	return cadena
def buildArrFromDic(arr):
	arr=[]
	for item in arr:
		arr.append(model_to_dict(item))
	return arr
def buildContext(request):
	contexto= {}
	user = request.user
	contexto['nombre_usuario']=user.username

	profile= request.session.get('profile',None)
	if profile==None:
		profile={}
	profile['id_session']= request.session._session_key
	json_profile= convertirDiccionario(profile)
	cad= "<script>window.profile=" + json_profile + ";</script>"
	contexto['codigo_profile']=cad
	contexto['profile']= profile
	contexto['permiso']=request.session.get('permiso-view')
	return contexto
def getNoCarriles(request):
	if request.session.get('list-nocarriles'):
		return request.session.get('list-nocarriles')
	else:
		nocarriles=NoCarriles.objects.all()
		lista=buildArrFromDic(nocarriles)
		request.session['list-nocarriles']=lista
		return nocarriles
def getMps(request):
	if request.session.get('list-mps'):
		return request.session.get('list-mps')
	else:
		mps=InvCatAgenciasMp.objects.all()
		lista=buildArrFromDic(mps)
		request.session['list-mps']=lista
		return nocarriles
def getSentidos(request):
	if request.session.get('list-sentidos'):
		return request.session.get('list-sentidos')
	else:
		sentidos=Sentidos.objects.all()
		lista=buildArrFromDic(sentidos)
		request.session['list-sentidos']=lista
		return sentidos
def getClasAccidente(request):
	if request.session.get('list-clas-accidente'):
		return request.session.get('list-clas-accidente')
	else:
		agentes=AccClasAccidente.objects.all()
		lista=buildArrFromDic(agentes)
		request.session['list-clas-accidente']=lista
		return agentes
def getTipoCalles(request):
	if request.session.get('list-tipo-calles'):
		return request.session.get('list-tipo-calles')
	else:
		tipos=TbTipoCalle.objects.all()
		lista=buildArrFromDic(tipos)
		request.session['list-tipo-calles']=lista
		return tipos
def getNoCarriles(request):
	if request.session.get('list-no-carriles'):
		return request.session.get('list-no-carriles')
	else:
		tipos=TbTipoCalle.objects.all()
		lista=buildArrFromDic(tipos)
		request.session['list-no-carriles']=lista
		return tipos
def getDelegaciones(request):
	if request.session.get('list-delegaciones'):
		return request.session.get('list-delegaciones')
	else:
		delegaciones=CDelegaciones.objects.all()
		lista=buildArrFromDic(delegaciones)
		request.session['list-delegaciones']=lista
		return delegaciones
def getCorporaciones(request):
	if request.session.get('list-corporaciones'):
		return request.session.get('list-corporaciones')
	else:
		corporaciones=Corporaciones.objects.all()
		lista=buildArrFromDic(corporaciones)
		request.session['list-corporaciones']=lista
		return corporaciones
def listCompetentes(request):
	if request.session.get('list-competentes'):
		return request.session.get('list-competentes')
	else:
		competentes=Competentes.objects.all()
		lista=buildArrFromDic(competentes)
		request.session['list-competentes']=lista
		return competentes
def getComandancias(request):
	if request.session.get('list-comandancias'):
		return request.session.get('list-comandancias')
	else:
		comandancias=CComandancias.objects.all()
		lista=buildArrFromDic(comandancias)
		request.session['list-comandancias']=lista
		return comandancias

def getTurnos(request):
	if request.session.get('list-turnos'):
		return request.session.get('list-turnos')
	else:
		turnos=CTurnos.objects.all()
		lista=buildArrFromDic(turnos)
		request.session['list-turnos']=lista
		return turnos

def getTipoAccidente(request):
	if request.session.get('list-tipo-choques'):
		return request.session.get('list-tipo-choques')
	else:
		tipos=AccClasVehiculo.objects.all()
		lista=buildArrFromDic(tipos)
		request.session['list-tipo-choques']=lista
		return tipos
def getCalles(request):
	if request.session.get('list-calles'):
		return request.session.get('list-calles')
	else:
		calles=CCalles.objects.all()
		lista=buildArrFromDic(calles)
		request.session['list-calles']=lista
		return calles
def getColonias(request):
	if request.session.get('list-colonias'):
		return request.session.get('list-colonias')
	else:
		colonias=TbColoniasOld.objects.all()
		lista=buildArrFromDic(colonias)
		request.session['list-colonias']=lista
		return colonias

def getEstados(request):
	if request.session.get('list-estados'):
		return request.session.get('list-estados')
	else:
		estados=TbEstados.objects.all()
		lista=buildArrFromDic(estados)
		request.session['list-estados']=lista
		return estados
def getMunicipios(request):
	if request.session.get('list-municipios'):
		return request.session.get('list-municipios')
	else:
		municipios=TbMunicipios.objects.all()
		lista=buildArrFromDic(municipios)
		request.session['list-municipios']=lista
		return municipios
def getAgentes(request):
	if request.session.get('list-agentess'):
		return request.session.get('list-agentess')
	else:
		agentes=TbAgentes.objects.all()
		lista=buildArrFromDic(agentes)
		request.session['list-agentess']=lista
		return agentes

def getDetenidos(request):
	if request.session.get('list-detenidos'):
		res=request.session.get('list-detenidos')
		return res
	else:
		detenidos=TbDetenido.objects.all()
		lista=buildArrFromDic(detenidos)
		request.session['list-detenidos']=lista
		return lista
def getLevantadosPor(request):
	if request.session.get('list-levantadoss'):
		return request.session.get('list-levantadoss')
	else:
		levantados=TbLevantadopor.objects.all()
		lista=buildArrFromDic(levantados)
		request.session['list-levantadoss']=lista
		return levantados

def listAccClasVehiculo(request):
	if request.session.get('list-classvehiculoss'):
		return request.session.get('list-classvehiculoss')
	else:
		clases=CTipoVehiculo.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-classvehiculoss']=lista
		return clases
def listAccVehiculoTipo(request):
	if request.session.get('list-tipovehiculos'):
		return request.session.get('list-tipovehiculos')
	else:
		clases=AccVehiculoTipo.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-tipovehiculos']=lista
		return clases
def listInvCatTipoVehiculo(request):
	if request.session.get('list-inv-tipovehiculos'):
		return request.session.get('list-inv-tipovehiculos')
	else:
		clases=InvCatTipoVehiculo.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-inv-tipovehiculos']=lista
		return clases
def listTbPensiones(request):
	if request.session.get('list-pensiones'):
		return request.session.get('list-pensiones')
	else:
		clases=TbPensiones.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-pensiones']=lista
		return clases

def listTbColores(request):
	if request.session.get('list-colores'):
		return request.session.get('list-colores')
	else:
		clases=TbColores.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-colores']=lista
		return clases
def listAccRestriccionesLicencia(request):
	if request.session.get('list-restricciones'):
		return request.session.get('list-restricciones')
	else:
		clases=AccRestriccionesLicencia.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-restricciones']=lista
		return clases

def listTbTipoOperativo(request):
	if request.session.get('list-operativos'):
		return request.session.get('list-operativos')
	else:
		clases=TbTipoOperativo.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-operativos']=lista
		return clases
def listTbMarcas(request):
	if request.session.get('list-marcas'):
		return request.session.get('list-marcas')
	else:
		clases=TbMarcas.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-marcas']=lista
		return clases

def listTbTipoEvento(request): 
	if request.session.get('list-tipo-evento'):
		return request.session.get('list-tipo-evento')
	else:
		clases=TbTipoEvento.objects.all()
		lista=buildArrFromDic(clases)
		request.session['list-tipo-evento']=lista
		return clases
def getUser(request):
	if request.session.get('user'):
		return request.session.get('user')
	else:
		request.session['user']="mmejia"
	return request.session['user']



