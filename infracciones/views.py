# encoding: UTF-8
from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from json import dumps, loads, JSONEncoder
from infracciones.models import *
from infracciones.util_inf import *
from infracciones.BuildInfraccion import BuildInfraccion
from infracciones.SaveInfraccion import SaveInfraccion
from infracciones.UpdateInfraccion import UpdateInfraccion
from django.template import Context, Template
from infracciones.tmplListaInfraccion import tmplListaInfraccion
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.views.generic.list import ListView
from infracciones.view_folio import actualizarFolioByNum_Cobro
from systra.settings import 	CONTENT
from systra.settings import STATICFILES_DIRS
from GenerateInfraccion import GenerateInfraccionPdf
from  systra.utils_session import  info
from systra.utils_session import  buildContext
import logging
log = logging.getLogger(__name__)
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
			if i==0:
				cadena = cadena +'"'  +llave + '":' +newval+ ''
			else:
				cadena= cadena +',"' +llave + '":' +newval +''
		else:
			newval=str(valor)
			if i==0:
				cadena = cadena +'"'  +llave + '":"' +newval+ '"'
			else:
				cadena= cadena +',"' +llave + '":"' +newval +'"'
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

def captura_infraccion(request):
	contexto= buildContext(request)
	info(log,"INGRESA A  CAPTURAR INFRACCION ",request)
	return render(request,'infracciones/captura.jade',contexto)
def create_infraccion(request):
	contexto= buildContext(request)
	info(log,"INGRESA A  CAPTURAR INFRACCION ",request)
	return render(request,'infraccion/captura.jade',contexto)

def solo_captura_infraccion(request,id):
	build=BuildInfraccion(request,id)
	json_infraccion=build.cargarInfraccion()
	info(log,"INGRESA A  CAPTURAR INFRACCION ",request)
	cad= "<script>window.infraccion=" + json_infraccion +";console.log(window.preliminar);</script>"
	return render(request,'infracciones/infraccion/pantallas/solo-captura-infraccion.jade',{"codigo":cad})
def viewInfraccion(request,id):
	build=BuildInfraccion(request,id)
	json_infraccion= build.cargarInfraccion()
	cad= "<script>window.view_infraccion=" + json_infraccion +"; console.log(window.view_infraccion); </script>"
	contexto={}
	contexto['codigo']= cad
	return render(request,'infracciones/view-infraccion/view.jade', contexto)
	#return render(request,'infracciones/view-infraccion/view.jade')
def cargarInfraccion_infraccion(request,id):
	build=BuildInfraccion(request,id)
	json_accidente=build.cargarInfraccion()
	#print dumps(json_accidente)
	#ff=dumps(json_accidente)
	#return HttpResponse(json_accidente,content_type='application/json;charset=utf-8', status=200)
	cad= "<script>window.infraccion=" + json_accidente +"; console.log(window.infraccion); </script>"
	return render(request,'infraccion/captura.jade',{"codigo":cad})

def listInfracciones_infraccion(request):
	queryset = Infraccion.objects.raw("SELECT222  id, folio,delegacion,comandancia,fecha_infrac,servicio FROM Tb_Infracciones1 limit 0,10")
	arreglo= list(queryset)
	lista =[]
	for inf in arreglo:
		class item:
			pass
		item.id=inf.id
		item.folio=inf.folio
		item.lista_articulos= findArticulosByFolio(inf.folio)
		item.nombre_delegacion=inf.delegacion
		item.nombre_comandancia= inf.comandancia
		item.fecha_infrac= inf.fecha_infrac.strftime('%Y-%m-%d')
		item.nombre_servicio= inf.servicio
		lista.append(item)
	t= Template(tmplListaInfraccion)
	params={}
	params['infracciones']= lista
	c= Context(params)
	res = t.render(c)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def get_infraccion(request,id):
	infraccion= Infraccion.objects.get(id=id)
	build= BuildInfraccion(request,id)
	json_infraccion=build.cargarInfraccion()
	return HttpResponse(json_infraccion,content_type='application/json;charset=utf-8', status=200)
def cargarInfraccion_infraccion(request, id):
	build=BuildInfraccion(request,id)
	json_infraccion=build.cargarInfraccion()
	cad= "<script>window.infraccion=" + json_infraccion +"; console.log(window.infraccion); </script>"
	return render(request,'infracciones/captura.jade',{"codigo":cad})

def dump(obj):
  for attr in dir(obj):
    print "obj.%s = %s" % (attr, getattr(obj, attr))
@csrf_exempt
def ventana_reporte_infraccion(request):
	infraccion_str= request.POST.get('data')
	print infraccion_str
	data= loads(infraccion_str)
	folio= data['folio_infraccion']
	print folio
	ruta=STATICFILES_DIRS[0] + "pdfs/infraccion/"+ str(folio) +".pdf"
	gg=GenerateInfraccionPdf(data,ruta)
	gg.build_pdf()
	print ruta
	contexto={}
	contexto['ruta']='/static/pdfs/infraccion/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
	#return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)
def ventana_reporte_infraccion_from_id(request,id):
	build=BuildInfraccion(request,id)
	infraccion_str= build.cargarInfraccion()
	print infraccion_str
	data= loads(infraccion_str)
	folio= data['folio_infraccion']
	ruta=STATICFILES_DIRS[0] + "pdfs/infraccion/"+ str(folio) +".pdf"
	gg=GenerateInfraccionPdf(data,ruta)
	gg.build_pdf()
	print ruta
	contexto={}
	contexto['ruta']='/static/pdfs/infraccion/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
	#return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)
def removeInfraccion(request, id):
	infraccion =Infraccion.objects.get(id=id)
	infractor=infraccion.infractor
	vehiculo =infraccion.vehiculo
	mo=infraccion.detalles.all()
  	for det in infraccion.detalles.all():
		print "vamos a borrar"
		det.delete()
	infraccion.delete()
	infractor.delete()
	vehiculo.delete()
	res= "{\"id\":\"" + id + "\"}"
	 
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)

@csrf_exempt
def crearInfraccion_infraccion(request):
	save = SaveInfraccion(request)
	ident=save.do()
	res= "{\"id\":\"" + str(ident) + "\"}"
	#dump(tbinf)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def updateInfraccion_infraccion(request):
	update= UpdateInfraccion(request)
	ident= update.do()
	res= "{\"id\":\"" + str(ident) + "\"}"
	#dump(tbinf)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def getHistInfractor(request,num_licencia):
	historial= HistorialInfractor.objects.filter(infractor_num_licencia=num_licencia)
	lista= list(historial)
	his=None
	if len(historial):
		his= list(historial)[0]
	if his != None:
		cad= convertir(his)
		return HttpResponse(cad,content_type='application/json;charset=utf-8', status=200)
	else:
		res='{"data":"not-found"}'
		return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)

def getHistVehiculo(request,placa):
	historial= HistorialVehiculo.objects.filter(veh_placas=placa)
	lista= list(historial)
	his=None
	if len(historial):
		his= list(historial)[0]
	if his != None:
		cad= convertir(his)
		return HttpResponse(cad,content_type='application/json;charset=utf-8', status=200)
	else:
		res='{"data":"not-found"}'
		return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)




	 

