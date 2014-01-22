#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.core import serializers
import logging
from json import dumps, loads, JSONEncoder
from django.utils.encoding import smart_str, smart_unicode
from accidentes.models import CDelegaciones
from accidentes.models import CComandancias
from accidentes.models import CTurnos
from accidentes.models import AccClasAccidente
from accidentes.models import AccTipoAccidente
from accidentes.models import CCalles
from accidentes.models import TbColoniasOld
from accidentes.models import TbMunicipios
from accidentes.models import TbEstados
from accidentes.models import TbMarcas
from accidentes.models import AccVehiculoTipo
from accidentes.models import TbPensiones
from accidentes.models import TbColores
from accidentes.models import EnCustodia
from accidentes.models  import Profile


from accidentes.models import AccEdoConductor
from accidentes.models import AccEdoFisico
from accidentes.models import TbDetenido
from accidentes.models import TbLevantadopor
from accidentes.models import TbTrasladadoa
from accidentes.models import TbTipoLicencia
from accidentes.models import AccRestriccionesLicencia
from accidentes.models import CatAgentesNew
from accidentes.models import TbUnidades2008
from accidentes.models import TabuladorDesc
from accidentes.models import TbTipoOperativo

from accidentes.models import TbTipoEvento
from accidentes.models import Corporaciones
from accidentes.models import Competentes
from accidentes.models import AccVisibilidad
from accidentes.models import AccDiaNoche
from accidentes.models import TbTipoCalle
from accidentes.models import NoCarriles
from accidentes.models import Sentidos
from accidentes.models import AccAliCamino
from accidentes.models import AccEdoPavimento
from accidentes.models import AccClima
from accidentes.models import AccRegulacionCrucero
from accidentes.models import AccDanos
from accidentes.models import Circulaciones
from accidentes.models import InvCatLugar
from accidentes.models import InvCatAgenciasMp
from accidentes.models import DescVeh
from accidentes.models import CapVeh
from accidentes.models import AutCompInv

from django.contrib.auth  import authenticate,login
from django.contrib.auth.decorators import login_required



def is_asciibetical(str):
    try:
        str.encode('ascii')
        return True
    except UnicodeEncodeError:
        return False

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
		#valor =u'ú"'
		
		newval=''
		#print valor
		#print type(valor)
		if type(valor)== unicode:
			#print valor
			newval=dumps(valor)
			#print newval
		else:
			newval="\"" + str(valor) +"\""


		if i==0 or cadena=='{':
			cadena = cadena +'"'  +llave + '":' +newval+ ''
		else:
			cadena= cadena +',"' +llave + '":' +newval +''
	cadena=cadena+"}"
	return cadena
def tojson(objetos):
	arr="["
	for i in range(len(objetos)):
		obj= objetos[i]
		if i==0:
			arr=arr+ convertir(obj)
		else:
			arr=arr+ "," +convertir(obj)
	arr=arr+"]"
	return arr
def otrojson(lista):
	json_serializer=serializers.get_serializer('json')()
	txt_lista=json_serializer.serialize(lista)
	arreglo='['
	d=json.loads(txt_lista)

	for i in range(len(d)):
		x= d[i]
		item= x['fields']
		if i==0:
			arreglo=arreglo+ str(item)
		else:
			arreglo=arreglo+","+ str(item)

	arreglo=arreglo +"]"
	return arreglo
@login_required
def listProfile(request):
	profiles= Profile.objects.all()
	d=tojson(profiles)
	return HttpResponse(d, mimetype='application/json')
@login_required
def listCapVehs(request):
	capacidades= CapVeh.objects.all()
	d=tojson(capacidades)
	return HttpResponse(d,'application/json;charset=utf-8')

@login_required
def listDelegaciones(request):
	delegaciones= CDelegaciones.objects.all()
	d=tojson(delegaciones)
	return HttpResponse(d,'application/json;charset=utf-8')
@login_required	 
def listComandancias(request):
	comandancias= tojson(CComandancias.objects.all())
	return HttpResponse(comandancias,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTurnos(request):
	
	turnos= tojson(CTurnos.objects.all())
	return HttpResponse(turnos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listClasAccidente(request):
	
	clasAccidente= tojson(AccClasAccidente.objects.all())

	return HttpResponse(clasAccidente,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAccTipoAccidente(request):
	tipoAccidente= tojson(AccTipoAccidente.objects.all())
	return HttpResponse(tipoAccidente,content_type='application/json;charset=utf-8', status=200)
#def listDelegaciones(request):
#	objetos= CDelegaciones.objects.all()
#	cad= tojson(objetos)
#	return HttpResponse(cad,content_type='application/json;charset=utf-8', status=200)
@login_required
def listCalles(request):
	calles= tojson(CCalles.objects.all())
	return HttpResponse(calles,content_type='application/json;charset=utf-8', status=200)
@login_required
def listColonias(request):
	colonias= tojson(TbColoniasOld.objects.all())
	return HttpResponse(colonias,content_type='application/json;charset=utf-8', status=200)
@login_required
def listEstados(request):
	estados= tojson(TbEstados.objects.all())
	return HttpResponse(estados,content_type='application/json;charset=utf-8', status=200)
@login_required
def listMunicipios(request):
	
	municipios= tojson(TbMunicipios.objects.all())
	return HttpResponse(municipios,content_type='application/json;charset=utf-8', status=200)
@login_required
def listMarcas(request):
	
	marcas= tojson(TbMarcas.objects.all())
	return HttpResponse(marcas,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTipoVehiculo(request):
	
	tipo_vehiculos= tojson(AccVehiculoTipo.objects.all())
	return HttpResponse(tipo_vehiculos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listPensiones(request):
	
	pensiones= tojson(TbPensiones.objects.all())
	return HttpResponse(pensiones,content_type='application/json;charset=utf-8', status=200)
@login_required
def listColores(request):
	
	colores= tojson(TbColores.objects.all())
	return HttpResponse(colores,content_type='application/json;charset=utf-8', status=200)
#aqui estan los otros 6
@login_required
def listAccEdoConductor(request):
	
	accEdoConductor= tojson(AccEdoConductor.objects.all())
	return HttpResponse(accEdoConductor,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAccEdoFisico(request):
	
	accEdoFisico= tojson(AccEdoFisico.objects.all())
	return HttpResponse(accEdoFisico,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTbDetenido(request):
	
	tbDetenido= tojson(TbDetenido.objects.all())
	return HttpResponse(tbDetenido,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTbLevantadopor(request):
	
	tbLevantadopor= tojson(TbLevantadopor.objects.all())
	return HttpResponse(tbLevantadopor,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTbTrasladadoa(request):
	
	tbTrasladadoa= tojson(TbTrasladadoa.objects.all())
	return HttpResponse(tbTrasladadoa,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTbTipoLicencia(request):
	
	tbTipoLicencia= tojson(TbTipoLicencia.objects.all())
	return HttpResponse(tbTipoLicencia,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAccRestriccionesLicencia(request):
	
	accRestriccionesLicencia= tojson(AccRestriccionesLicencia.objects.all())
	return HttpResponse(accRestriccionesLicencia,content_type='application/json;charset=utf-8', status=200)
@login_required
def listCatAgentesNew(request):
	
	catAgentesNew= tojson(CatAgentesNew.objects.all())
	return HttpResponse(catAgentesNew,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTbUnidades2008(request):
	
	tbUnidades2008= tojson(TbUnidades2008.objects.all())
	return HttpResponse(tbUnidades2008,content_type='application/json;charset=utf-8', status=200)
@login_required
def listOperativos(request):
	operativos= tojson(TbTipoOperativo.objects.all())
	return HttpResponse(operativos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listArticulos(request):
	articulos= tojson(TabuladorDesc.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTipoEventos(request): 
	articulos= tojson(TbTipoEvento.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listCorporaciones (request):
	articulos= tojson(Corporaciones.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listCompetentes (request):
	articulos= tojson(Competentes.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAutCompInv(request):
	comp= tojson(AutCompInv.objects.all())
	return HttpResponse(comp,content_type='application/json;charset=utf-8', status=200)
@login_required
def listMps(request):
	articulos= tojson(InvCatAgenciasMp.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listVisibilidades(request):
	articulos= tojson(AccVisibilidad.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listParteDias(request): 
	articulos= tojson(AccDiaNoche.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listTipoCalles(request): 
	articulos= tojson(TbTipoCalle.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listNoCarriles(request):
	articulos= tojson(NoCarriles.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200) 
@login_required
def listSentidos(request): 
	articulos= tojson(Sentidos.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAlineaciones(request): 
	articulos= tojson(AccAliCamino.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listEstadoCalles (request):
	articulos= tojson(AccEdoPavimento.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listClimas(request): 
	articulos= tojson(AccClima.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listRegulaciones(request): 
	articulos= tojson(AccRegulacionCrucero.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listObjetosDanados(request): 
	articulos= tojson(AccDanos.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listCirculaciones(request): 
	articulos= tojson(Circulaciones.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listLugares(request): 
	articulos= tojson(InvCatLugar.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listLugares(request): 
	articulos= tojson(InvCatLugar.objects.all())
	return HttpResponse(articulos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listDescVehiculos(request): 
	descvehiculos= tojson(DescVeh.objects.all())
	return HttpResponse(descvehiculos,content_type='application/json;charset=utf-8', status=200)

@login_required
def listEnCustodias(request):
	custodias= tojson(EnCustodia.objects.all())
	return HttpResponse(custodias,content_type='application/json;charset=utf-8', status=200)


