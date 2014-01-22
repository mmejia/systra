#-*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse
from json import dumps, loads, JSONEncoder
from django.core import serializers
from django.views.generic.list import ListView
from accidentes.models import Accidentes
from accidentes.models import AccId
from accidentes.models import AccCabina
from accidentes.models import Resource
from accidentes.models import AccVehiculos
from accidentes.models import AccInvolucrados 
from accidentes.models import AccObjetos 
from accidentes.models import AccInveDetalles 
from django.db import  connection
from systra.utils_session import getAgentes, buildContext
from systra.util import buscarAgenteById
from systra.utils_session import getClasAccidente
from systra.utils_session import getComandancias
from systra.util import buscarClasAccidenteById
from systra.util import getUrlImagenesDeAccidenteUtil
from accidentes.BuildAccidente import  BuildAccidente
from accidentes.BuildPreliminar import BuildPreliminar
from accidentes.UtilMapa import *
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from GenerateFrontalPdf import GenerateFrontalPdf 
from GeneratePosteriorPdf import GeneratePosteriorPdf 
from systra.settings import 	CONTENT
from systra.settings import STATICFILES_DIRS
from django.core.exceptions import ObjectDoesNotExist
from  systra.utils_session import  info
from django.db.models import Q
import datetime

from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.db import connection
import uuid 
import logging
from datetime import date
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
def dump(obj):
	for attr in dir(obj):
		print "obj.%s = %s" % (attr, getattr(obj, attr))
#@csrf_exempt  
#@login_required
#def create_accidente(request):
#	accidente_str= request.POST.get('data')
@csrf_exempt  
@login_required 
def ventana_reporte_posterior_from_id(request,id_unico):
	build=BuildAccidente(request,id_unico)
	data=build.getDiccionario()
	folio= data['acc_folio_accidente'] 
	ruta=STATICFILES_DIRS[0] + "pdfs/accidente/posterior_"+ str(folio) +".pdf"
	gg=GeneratePosteriorPdf(data,ruta)
	gg.build_pdf()
	contexto={}
	contexto['ruta']='/static/pdfs/accidente/posterior_'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
@csrf_exempt  
@login_required 
def ventana_reporte_posterior(request):
	#try:
		accidente_str= request.POST.get('data')
		data= loads(accidente_str)
		folio= data['folio_accidente']
		print folio
		#folio= data['folio_accidente']
		ruta=STATICFILES_DIRS[0] + "pdfs/accidente/posterior_"+ str(folio) +".pdf"
		gg=GeneratePosteriorPdf(data,ruta)
		gg.build_pdf()
		contexto={}
		contexto['ruta']='/static/pdfs/accidente/posterior_'+ str(folio) + '.pdf'
		return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
	#except:
	#	return HttpResponse('ERROR DE APLICACION ESTAMOS TRABAJANDO',content_type='application/json;charset=utf-8', status=500)
	#return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)
@csrf_exempt  
@login_required 
def ventana_reporte(request):
	accidente_str= request.POST.get('data')
	data= loads(accidente_str)
	folio= data['folio_accidente']
	print folio
	#folio= data['folio_accidente']
	ruta=STATICFILES_DIRS[0] + "pdfs/accidente/"+ str(folio) +".pdf"
	gg=GenerateFrontalPdf(data,ruta)
	gg.build_pdf()
	print ruta
	contexto={}
	contexto['ruta']='/static/pdfs/accidente/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
	#return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)
@csrf_exempt  
@login_required 
def ventana_reporte_from_id(request,id_unico):
	build=BuildAccidente(request,id_unico)
	data=build.getDiccionario()
	folio= data['acc_folio_accidente']
	ruta=STATICFILES_DIRS[0] + "pdfs/accidente/"+ str(folio) +".pdf"
	gg=GenerateFrontalPdf(data,ruta)
	gg.build_pdf()
	contexto={}
	contexto['ruta']='/static/pdfs/accidente/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)
	#return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)

@login_required
def reporte_accidente(request):
	return render(request,'accidentes/accidentes/reporte.jade')
@login_required
def inicia_accidente(request):
	contexto= buildContext(request)
	info(log,"INGRESA A  CAPTURAR CABINA ",request)
	return render(request,'accidentes/accidentes/inicia.jade',contexto)
@login_required
def captura_accidente(request,id_preliminar):
	contexto={}
	contexto= buildContext(request)
	preliminar= AccCabina.objects.get(id__exact =id_preliminar)
	json_preliminar=convertir(preliminar)
	cad= "<script>window.preliminar=" + json_preliminar +";</script>"
	contexto['codigo']=cad
	contexto2=buildContext(request)
	contexto2.update(contexto)
	return render(request,'accidentes/accidentes/captura.jade',contexto2)

def captura_accidente_para_seleccionar_preliminar(request):
	lista=AccCabina.objects.filter(activo__exact =0 )
	folios=[]
	for item in lista:
		folios.append(item.folio_evento)
	contexto={}
	contexto["codigo"]=""
	contexto["folios"]=folios
	contexto2= buildContext(request)
	contexto2.update(contexto)
	info(log,"INGRESA A  CAPTURAR ACCIDENTE  ",request)
	return render(request,'accidentes/accidentes/captura-seleccionar-preliminar.jade',contexto2)
@login_required
def cargarAccidente_accidente(request,id_unico):
	print "Unoooooooooooo"
	build=BuildAccidente(request,id_unico)
	print "Unoooooooooooo1"
	info(log,"INGRESA A  VER EL ACCIDENTE %s" %(id_unico) ,request)
	print "Unoooooooooooo2"
	json_accidente=build.cargarAccidente()
	print "Unoooooooooooo3"
	#print dumps(json_accidente)
	#ff=dumps(json_accidente)
	#return HttpResponse(json_accidente,content_type='application/json;charset=utf-8', status=200)
	cad= "<script> window.accidente=" + json_accidente +"; console.log(window.accidente); </script>"
	print "Unoooooooooooo4"
	contexto={}
	print "Unoooooooooooo5"
	contexto['codigo']=cad
	print "Unoooooooooooo6"
	contexto2=buildContext(request)
	print "Unoooooooooooo7"
	contexto2.update(contexto)
	print "Unoooooooooooo8"
	print contexto2
	return render(request,'accidentes/accidentes/captura.jade',contexto2)
@login_required
def cargarPreliminar_accidente(request,id):
	build=BuildPreliminar(request,id)
	info(log,"CARGAR PRELIMINAR NUMERO %s ",id,request)
	json_preliminar=build.cargarPreliminar()
	cad= "<script>window.preliminar=" + json_preliminar +"; console.log(window.preliminar); </script>"
	return render(request,'accidentes/accidentes/inicia.jade',{"codigo":cad})
@csrf_exempt  
@login_required
def create_accidente(request):
	accidente_str= request.POST.get('data')
	accidente= loads(accidente_str)
 	acc=Accidentes()
	acc.id_preliminar= accidente.get('folio_accidente',0)
	acc.id_unico=accidente.get('folio_unico',"")
	acc.fecha_registro=date.today()
	acc.clasificacion=accidente.get('clasificacion',"")
	acc.tipo_choque= accidente.get('tipo_choque',"")
	acc.calle1=accidente.get('calle1',"")
	acc.calle2= accidente.get('calle2',"")
	acc.frente_num= accidente.get('frente_num',"")
	acc.colonia= accidente.get('colonia',"")
	acc.estado=accidente.get('estado',"")
	acc.ciudad= accidente.get('municipio',"")
	estado_calles= accidente.get('estado_calles',"")
	acc.edo_alineacion= estado_calles.get('alineacion',"")
	acc.edo_piso= estado_calles.get('estado_pavimento',"")
	acc.edo_clima= estado_calles.get('clima',"")
	acc.regularizacion= estado_calles.get('regulacion',"")
	acc.convenio_delegacion=accidente.get('delegacion',"")
	acc.convenio_comandancia= accidente.get('comandancia',"")
	acc.convenio_turno= accidente.get('turno',"")
	acc.convenio_numero=accidente.get('folio_accidente',0)
	hora_actual=datetime.datetime.now().strftime('%H:%M')
	print hora_actual
	#acc.convenio_hora= accidente.get('hora','')
	acc.convenio_hora=''
	acc.convenio_fecha= accidente.get('fecha_mm',datetime.datetime.now().strftime('%Y-%m-%d'))
	acc.observaciones= accidente.get('observaciones',"")
	acc.usario="mmejia"
	acc.latitud= accidente.get('latitud',"")
	acc.longitud= accidente.get('longitud',"")
	croq= accidente.get('croquis',None)
	if croq != None  and croq!="":
		acc.croquis=croq.get('id',0)
	acc.simbologia= accidente.get('simbologia_croquis',"")
	acc.investigaciones=accidente.get('investigaciones',"")
	otros= accidente['otros']
	acc.tipo_calle= otros['tipo_calle']
	acc.num_carriles= otros['no_carriles']
	acc.sentido_calles= otros['sentido_calle']
	intervino=accidente['intervino']
	acc.nombre_intervino=intervino['nombre']
	acc.gafete_intervino= intervino['gafete']
	acc.unidad_intervino= intervino['unidad']
	#acc.sector_intervino= intervino['sector']
	superviso=accidente['superviso']
	acc.nombre_superviso= superviso['nombre']
	acc.gafete_superviso= superviso['gafete']
	acc.unidad_superviso= superviso['unidad']
	#acc.sector_superviso= superviso['sector']
	vehiculos= accidente['vehiculos']
	vehs=[]
	for veh  in vehiculos:
		d_veh=llenarVehiculo(acc.id,acc.id_preliminar,acc.id_unico,veh)
		vehs.append(d_veh)
	#vamos a salvar los vehiculos
	
	sangres= accidente['saldoSangres'];
	sans=[]
	for sangre in sangres:
		d_san=llenarEstadoHerido(acc.id,acc.id_preliminar,acc.id_unico,sangre)
		sans.append(d_san)
	
	#vamos a salvar la sangre
	judiciales= accidente['competenciaJudiciales']
	judas=[]
	for judicial in judiciales:
		d_jud=llenarCompetenciaJudicial(acc.id,acc.id_preliminar,acc.id_unico,judicial)
		judas.append(d_jud)
	dans=[]
	
	danos= accidente['danos']
	for dano in danos:
		d_dan=llenarDano(acc.id_unico,dano)
		dans.append(d_dan)
	articulos= accidente['articulos']	
	arts=[]
	for articulo in articulos:
		d_art= llenarArticulo(acc.id_unico,articulo)	
		arts.append(d_art)
	
	acc.save()
	for v in vehs:
		v.save()
	for san in sans:
		san.save()
	for jud in judas:
		jud.save()
	for da in dans:
		da.save()
	for art in arts:
		art.save()
	## ahora vamos a salvar a actualizar 
	print acc.id_unico
	try:
		cabina=AccCabina.objects.get(id_unico__iexact= acc.id_unico)
		cabina.activo=1
		cabina.save()
	except ObjectDoesNotExist:
		print "No encontro el acccabina"
	return HttpResponse('{"data":"exito"}',content_type='application/json;charset=utf-8', status=200)
@login_required
def generate(request):
	arr=AccId.objects.all().order_by('-id')
	lista= list(arr)
	if len(lista)>0:
		max_id=lista[0].folio
	else:
		max_id= 0
	max_id= max_id+1
	nuevo= AccId();
	nuevo.folio= max_id
	nuevo.usuario=request.user.username
	nuevo.id_unico=uuid.uuid4() 
	nuevo.save()
	return max_id
	 
def llenarArticulo(id_unico,articulo):
	art=AccInveDetalles()
	art.id_infraccion =0
	art.folio = 0 
	art.id_articulo = 0
	art.articulo = articulo.get('art',"") 
	art.parrafo = articulo.get('fracc',"") 
	art.concepto = articulo.get('descc',"") 
	art.id_unico = id_unico 
	return art

def llenarDano(id_unico,dano):
	obj=AccObjetos()
	obj.id_unico =id_unico
	obj.id_objeto =  dano['obj']
	obj.tipo_objeto = dano['tipo'] 
	obj.dueno_objeto = dano['dueno'] 
	obj.monto_dano =  dano['monto']
	obj.tipo_evento =  ''
	return obj

def llenarCompetenciaJudicial(id_accidente,id_preliminar,id_unico,judicial):
	invo= AccInvolucrados()
	invo.id_accidente = id_accidente
	invo.id_preliminar =  id_preliminar
	invo.id_vehiculo =  0
	invo.id_unico = id_unico
	invo.participa_como = 0
	invo.nombre =  judicial['nombre']
	invo.conductor_apepaterno =''  
	invo.conductor_apematerno = '' 
	invo.edad =  judicial['edad']
	invo.calle = judicial['domicilio']
	invo.colonia = ''
	invo.ciudad ='' 
	invo.estado =''  
	invo.nacionalidad =''  
	invo.sexo =''  
	invo.edo_ebriedad =0 
	invo.edo_fisico = 0 
	invo.edo_trasladado_por =  ''
	invo.edo_levantado_por = ''
	invo.estado_herido = judicial['estado_herido'] 
	invo.fecha_registro =None 
	invo.usuario =''  
	invo.nacionalidad4 =''  
	invo.conductor_detenido_en =judicial['detenido_en']  
	invo.conductor_disposicion =judicial['disposicion']  
	invo.custodia_de ='' 
	invo.intervino_como = judicial['se_encontraba']
	invo.tipo_edad = 0
	return invo

def llenarEstadoHerido(id_accidente,id_preliminar,id_unico,estado_herido):
	invo= AccInvolucrados()
	invo.id_accidente = id_accidente
	invo.id_preliminar =  id_preliminar
	invo.id_vehiculo =  0
	invo.id_unico = id_unico
	invo.participa_como = 0
	invo.nombre =  estado_herido['nombre']
	invo.conductor_apepaterno =''  
	invo.conductor_apematerno = '' 
	invo.edad =  estado_herido['edad']
	invo.calle = estado_herido['domicilio']
	invo.colonia = ''
	invo.ciudad ='' 
	invo.estado =''  
	invo.nacionalidad =''  
	invo.sexo =''  
	invo.edo_ebriedad =0  
	invo.edo_fisico = 0
	invo.edo_trasladado_por = estado_herido['trasladado_a']
	invo.edo_levantado_por = estado_herido['levantado_por'] 
	invo.estado_herido = estado_herido['estado_herido']
	invo.fecha_registro =None 
	invo.usuario =''  
	invo.nacionalidad4 =''  
	invo.conductor_detenido_en =''  
	invo.conductor_disposicion =''  
	invo.custodia_de ='' 
	invo.intervino_como = ''
	invo.tipo_edad = 0
	return invo
def viewAccidente(request,id_unico):
	contexto={}
	build=BuildAccidente(request,id_unico)
	contexto=build.getDiccionario()
	return render(request,'accidentes/accidentes/pantallas/solo-view-accidente.jade', contexto)
def llenarVehiculo(id_accidente,id_preliminar,id_unico,vehiculo):
	veh= AccVehiculos()
	veh.id_accidente =  id_accidente
	veh.id_preliminar =  id_preliminar
	veh.id_unico = id_unico 
	veh.intervino_como = vehiculo.get('intervino_como',"")
	veh.clas_vehiculo = vehiculo.get('clas_vehiculo',"")
	veh.color =  vehiculo.get('color',"")
	veh.color_detalle = vehiculo.get('color_detalle',"")
	veh.placa =  vehiculo.get('placa',"") 
	veh.modelo = vehiculo.get('modelo',"") 
	veh.marca =  vehiculo.get('marca',"")
	veh.submarca =  vehiculo.get('submarca',"")
	veh.capacidad = vehiculo.get('capacidad',"") 
	veh.estadov =  vehiculo.get('estadov',"")
	veh.ciudadv = '' 
	veh.serie = vehiculo.get('serie',"")
	veh.tipo = vehiculo.get('tipo',"") 
	veh.serviciopp = vehiculo.get('vehiculo_servicio',"") 
	veh.num_economico =  vehiculo.get('num_economico',"")
	veh.num_grua = vehiculo.get('num_grua',"")
	veh.pension =  vehiculo.get('pension',"") 
	veh.conductor_nombre =  vehiculo.get('conductor_nombre',"")
	veh.conductor_apepaterno = vehiculo.get('conductor_apepaterno',"") 
	veh.conductor_apematerno = vehiculo.get('conductor_apematerno',"")
	veh.conductor_calle = vehiculo.get('conductor_calle',"")
	veh.conductor_colonia = ''
	veh.ciudad = vehiculo.get('conductor_municipio',"") 
	veh.estado = vehiculo.get('conductor_estado',"")  
	veh.conductor_edad = vehiculo.get('conductor_edad',"") 
	veh.conductor_edo_licencia =vehiculo.get('conductor_edo_licencia',"")  
	veh.conductor_pais_licencia =  ''
	veh.conductor_num_licencia =  vehiculo.get('conductor_num_licencia',"")
	veh.conductor_tipo_licencia =  ''
	veh.conductor_rest_licencia =  vehiculo.get('conductor_rest_licencia',"")
	veh.conductor_fecha_expedida = None
	if vehiculo['conductor_fecha_vigencia']=='None' or vehiculo['conductor_fecha_vigencia']=='' :
		veh.conductor_fecha_vigencia =None
	else:
		veh.conductor_fecha_vigencia =vehiculo.get('conductor_fecha_vigencia',"") 
	veh.conductor_sexo =  vehiculo.get('conductor_sexo',"") 
	veh.conductor_detenido_en =   vehiculo.get('conductor_detenido_en',"")
	veh.conductor_disposicion =  vehiculo.get('conductor_disposicion',"") 
	veh.tipo_dueno =  vehiculo.get('tipo_dueno',"") 
	veh.dueno_nombre = vehiculo.get('dueno_nombre',"") 
	veh.dueno_calle =  vehiculo.get('dueno_calle',"")
	veh.dueno_colonia = vehiculo.get('dueno_colonia',"") 
	veh.dueno_tel = vehiculo.get('dueno_tel',"") 
	veh.dueno_estadop = vehiculo.get('dueno_estadop',"")
	veh.dueno_ciudadp = vehiculo.get('dueno_ciudadp',"")
	veh.dueno_cp = vehiculo.get('dueno_cp',"") 
	veh.fecha_registro =  date.today()
	veh.usuario ="mmejia"  
	veh.especificaciones = ''
	veh.nacionalidad3 =  ''
	veh.nacionalidad2 ='' 
	veh.estado_herido = vehiculo.get('conductor_estado',"") 
	veh.especificar_vehiculo =''
	veh.uso_vehiculo =''
	veh.dv_num_inventario =''
	veh.dueno_apepaterno =vehiculo.get('dueno_apepaterno',"")
	veh.dueno_apematerno =vehiculo.get('dueno_apematerno',"")
	veh.folio_infraccion =0
	veh.folio_certificado_medico =0
	veh.servicio_publico =vehiculo.get('vehiculo_servicio',"")
	return veh 

#def listar_accidente(request):
	#queryset =Accidentes.objects.all() 
	#return object_list(request, template_name = 'accidentes/accidentes/list.jade',
    #     queryset = queryset, paginate_by = 10)
def mapa_busqueda_accidente(request):
	contexto=buildContext(request)
	info(log,"SOLICITA BUSQUEDA POR MAPAS ",request)
	return render(request,'accidentes/accidentes/map_accidente.jade',contexto)
@csrf_exempt
def listPuntosAccidentes(request):
	dic= request.POST
	fechai= dic.get('fechai')
	fechaf= dic.get('fechaf')
	print fechai
	print fechaf
	puntos= getPuntos(fechai,fechaf)
	return HttpResponse(puntos,content_type='application/json;charset=utf-8', status=200)
@login_required
def listAccidentes_accidente(request):
	clasAccidentes= getClasAccidente(request)
	queryset =Accidentes.objects.raw("SELECT id_unico,id,convenio_fecha,nombre_intervino, gafete_intervino,unidad,clasificacion FROM dbo_Accidentes1 ")
	arreglo= list(queryset)
	newar=[]
	for accidente in arreglo:
		intervino= accidente.gafete_intervino
		accidente.nombre_clasificacion=accidente.clasificacion
		accidente.nombre_agente=accidente.nombre_intervino
		newar.append(accidente)
	json= tojson(arreglo)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200)
	#return HttpResponse("Hola mundo",content_type='application/json;charset=utf-8', status=200)
@login_required
def getAccidente_accidente(request,id_unico):
	build=BuildAccidente(request,id_unico)
	json_accidente=build.cargarAccidente()
	return HttpResponse(json_accidente,content_type='application/json;charset=utf-8', status=200)
@login_required
def getUrlImagenesDeAccidente(request,id_unico):
	res= getUrlImagenesDeAccidenteUtil(request,id_unico)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
@login_required
def crearPreliminar_accidente(request):
	preliminar= request.POST
	cabina= AccCabina()
	#cabina.folio_evento= preliminar.get('numero_de_folio')
	cabina.folio_evento=generate(request)
	cabina.fecha_evento= preliminar.get('fecha')
	cabina.hora_evento= preliminar.get('hora')
	cabina.delegacion= preliminar.get('delegacion')
	cabina.comandancia= preliminar.get('comandancia')
	cabina.turno= preliminar.get('turno')
	cabina.id_clasificacion= preliminar.get('clasificacion_de_accidente')
	cabina.calle1=preliminar.get('calle1')
	cabina.calle2=preliminar.get('calle2')
	cabina.ref=preliminar.get('ref')
	cabina.colonia=preliminar.get('colonia')
	cabina.no_veh_participantes=preliminar.get('no_vehiculos_participantes')
	cabina.no_detenidos=preliminar.get('no_de_detenidos')
	cabina.no_heridos=preliminar.get('no_de_heridos')
	cabina.no_muertos=preliminar.get('no_de_muertos')
	cabina.pension=preliminar.get('pension')
	cabina.no_inventario=preliminar.get('no_de_inventario')
	cabina.nombre_agente_intervino= preliminar.get('nombre_agente')
	cabina.gafete_agente_intervino= preliminar.get('gafete_agente')
	cabina.unidad_intervino= preliminar.get('unidad')
	cabina.sector_intervino= preliminar.get('sector')
	cabina.observaciones_evento=preliminar.get('observaciones_evento')
	cabina.id_unico=uuid.uuid4() 
	cabina.usuario=request.user.username
	cabina.activo=0
	cabina.save()
	#AccCabina.objects.create(preliminar)
	#print(cabina.id)
	res= '{"id":"' + str(cabina.id) + '","folio_evento":"' + str(cabina.folio_evento) + '"}'
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@login_required
def addPreliminar_accidente(request):
	return render(request,'accidentes/captura.jade')
@csrf_exempt
@login_required
def cancelar_preliminar(request):
	## 0 ES INICIADO
	## 1 ES CAPTURADO
	## 2 ES CANCELADO
	data= request.POST
	id_preliminar=data['ident']
	motivo= data['motivo']
	cabina=AccCabina.objects.get(id__exact =id_preliminar)
	cabina.activo=1
	cabina.tipo_evento= motivo
	cabina.save()
	res={'id':id_preliminar,"STATUS":"OK"}
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
 
def soloCapturarPreliminar(request,id):
	preliminar= AccCabina.objects.get(id__exact =id)
	json_preliminar=convertir(preliminar)
	cad= "<script>window.preliminar=" + json_preliminar +";console.log(window.preliminar);</script>"
	return render(request,'accidentes/accidentes/pantallas/solo-captura-preliminar.jade',{"codigo":cad})
class AccCabinaSoloListView(ListView):
	model = AccCabina
	paginate_by = 10
	template_name='accidentes/accidentes/pantallas/solo-list-preliminar.jade'
	def get_context_data(self, **kwargs):
		context = super(AccCabinaSoloListView, self).get_context_data(**kwargs)
		return context 
#@login_required
#def listarPreliminar_accidente(request):
	#clasAccidentes= getClasAccidente(request)
	#queryset =AccCabina.objects.all() 
	#return object_list(request, template_name = 'accidentes/accidentes/list_inicia.jade',
    #     queryset = queryset, paginate_by = 10)
	'''arreglo= list(queryset)
	newar=[]
	for preliminar in arreglo:
		class item:
			pass
		item.id= preliminar.id
		if preliminar.fecha_evento!= None:
			item.fecha= preliminar.fecha_evento.strftime('%Y-%m-%d') + "  " + preliminar.hora_evento.strftime('%H:%M')
		else:
			item.fecha=''
		item.folio_evento= preliminar.folio_evento
		item.lugar=  preliminar.localizacion_evento
		item.agente=  preliminar.agente_intervino
		item.colonia= preliminar.colonia
		newar.append(item)

	json= tojson(newar)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200)
	'''
@login_required
def listar_preliminar_accidente(request):
	contexto= buildContext(request)
	info(log,"INGRESA A  CAPTURAR CABINA  POR ",request)
	return render(request,'accidentes/accidentes/list_inicia.jade',contexto)
@login_required
def listar_Activos(request):
	activos= AccCabina.objects.filter(activo__exact= 0)
	lista= list(activos)
	json = tojson(lista)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200)
def listar_folios_accidente(request):
	activos= AccCabina.objects.all()
	folios=[]
	for act  in activos:
		folios.append(str(act.folio_evento))
	return HttpResponse(dumps(folios),content_type='application/json;charset=utf-8', status=200)	
@login_required
def getPreliminar_accidente(request,id):
	cabina=  AccCabina.objects.get(folio_evento__exact =id)
	json_preliminar= convertir(cabina)
	return HttpResponse(json_preliminar,content_type='application/json;charset=utf-8', status=200)
@login_required
def upload_croquis_accidente(request):
	return render(request,'accidentes/captura.jade')