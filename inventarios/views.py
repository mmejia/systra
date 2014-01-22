from inventarios.BuildInventario import BuildInventario
from inventarios.models import Inventario
from inventarios.models import Resource
from django.http import HttpResponse
from django.shortcuts import render
from django.template import Context, Template
from inventarios.tmplListInventario import tmplListInventario
from django.views.generic.list import ListView
from django.core import serializers
from json import dumps, loads, JSONEncoder
from systra.util import *
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from datetime import date
from django.db.models import Q
from systra.settings import STATICFILES_DIRS
from GenerateInventarioPdf  import GenerateInventarioPdf
from inventarios.SaveInventario import SaveInventario
from inventarios.UpdateInventario import UpdateInventario
import logging
import xlwt
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
def captura_inventario(request):
	contexto= buildContext(request)
	print contexto;
	info(log,"INGRESA A  CAPTURAR INVENTARIO ",request)
	info(log, "ESTOY MANDANDO EL ARCHIVO DE CAPTURA INVENTARIO",request)
	return render(request,'inventarios/captura.jade',contexto)

@csrf_exempt
def  libera_reporte(request):
	inventario_str= request.POST.get('data')
	data= loads(inventario_str)
	folio= data.get('folio_del_inventario',"")
	print folio
	#folio= data['folio_accidente']
	ruta=STATICFILES_DIRS[0] + "pdfs/inventario/"+ str(folio) +".pdf"
	gg=GenerateInventarioPdf(data,ruta)
	gg.build_pdf()
	contexto={}
	contexto['ruta']='/static/pdfs/inventario/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)

def  libera_reporte_from_id(request,id):
	build= BuildInventario(request,id)
	data= build.cargarInventario()
	print data
	folio= data['folio_inventario']
	ruta=STATICFILES_DIRS[0] + "pdfs/inventario/"+ str(folio) +".pdf"
	gg=GenerateInventarioPdf(data,ruta)
	gg.build_pdf()
	contexto={}
	contexto['ruta']='/static/pdfs/inventario/'+ str(folio) + '.pdf'
	return render(request,'accidentes/accidentes/accidentes/VentanaReporte.jade',contexto)

@csrf_exempt
def crear_liberar(request):
	inventario=request.POST
	id_inventario=inventario.get('id')
	inve= Inventario.objects.get(id__exact =id_inventario)
	inve.liberacion_fecha=inventario.get('liberacion_fecha')
	inve.liberacion_hora=inventario.get('liberacion_hora')
	inve.liberacion_recibe=inventario.get('liberacion_recibe')
	inve.persona_fisica=inventario.get('persona_fisica')
	inve.persona_moral=inventario.get('persona_moral')
	inve.activo=1
	inve.save()
	res= "{\"id\":\"" + str(inve.id) + "\"}" 
	#inv =
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def solo_captura_inventario(request,id):
	build= BuildInventario(request,id)
	json_inventario= build.cargarInventario()
	codigo= "<script>window.inventario=" + json_inventario +";console.log(window.inventario);</script>"
	return render(request,'inventarios/inventario/pantallas/solo-captura-inventario.jade',{"codigo":codigo})
def viewInventario(request,id):
	build=BuildInventario(request,id)
	json_inventario= build.cargarInventario()
	codigo= "<script>window.inventario=" + json_inventario +";viewInventario();</script>"
	return render(request,'inventarios/inventario/pantallas/solo-view-inventario.jade', {"codigo":codigo})
def excel_view(request):
	normal_style = xlwt.easyxf("""
     font:
         name Verdana
     """) 
	response = HttpResponse(mimetype='application/ms-excel')
	wb = xlwt.Workbook()
	ws0 = wb.add_sheet('Worksheet')
	ws0.write(0, 0, "something", normal_style)
	wb.save(response)
	return response

@csrf_exempt
def update_inventario(request):
	update= UpdateInventario(request)
	res= update.do()
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def crear_inventario(request):
	save= SaveInventario(request)
	res= save.do()
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def remove_inventario(request,id):
	inventario =Inventario.objects.get(id=id)
	inventario.fotos.all()
	for fot in inventario.fotos.all():
		fot.delete()
	inventario.delete()
	res= "{\"id\":\"" + id + "\"}"
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def get_inventario_con_otros(request,id):
	build=BuildInventario(request,id)
	json_inventario= build.cargarInventario()
	cad=  json_inventario 
	return HttpResponse(cad,content_type='application/json;charset=utf-8', status=200)
def liberar_inventario(request,id):
	build=BuildInventario(request,id)
	contexto2=buildContext(request)
	json_inventario=build.cargarInventario()
	cad= "<script>window.inventario=" + json_inventario +"; console.log(window.inventario); </script>"
	contexto2['codigo']=cad
	return render(request,'inventarios/liberar.jade',contexto2)
def liberar_seleccionando(request):
	#print  lista
	# 0 es para los anteriores
	# 1 para ingresados
	# 2 para liberados
	lista=Inventario.objects.filter(activo__exact =1 )
	folios=[]
	class KeyValue:
		pass
	for item in list(lista):
		kv= KeyValue()
		kv.id= item.id
		kv.folio_inventario=item.folio_inventario
		folios.append(kv)
	contexto={}
	contexto["codigo"]=""
	contexto["folios"]=folios
	contexto2=buildContext(request)
	contexto2.update(contexto)
	 
	return render(request,'inventarios/liberar_seleccionando.jade',contexto2)
def cargarInventario_inventario(request,id_temp):
	build=BuildInventario(request,id_temp)
	json_inventario=build.cargarInventario()
	#print dumps(json_accidente)
	#ff=dumps(json_accidente)
	#return HttpResponse(json_accidente,content_type='application/json;charset=utf-8', status=200)
	cad= "<script>window.inventario=" + json_inventario +"; console.log(window.inventario); </script>"
	return render(request,'inventarios/captura.jade',{"codigo":cad})

def get_inventario(request,id_temp):
	build= BuildInventario(request,id_temp)
	json_inventario= build.cargarInventario()
	return HttpResponse(json_inventario,content_type='application/json;charset=utf-8', status=200)
def listInventarios_inventario(request):
	queryset= Inventario.objects.raw("SELECT id,id_temp,fecha_incid,fecha_entrega,id_inventario,folio_inf_acc,folio_accidente,clas_vehiculo,comandancia,turno,infrac_accid FROM Inventario_Vehiculo where id>52576  limit 0, 50")
	arreglo= list(queryset)
	lista=[]
	for inv in arreglo:
		class item:
			pass
		item.id_temp= inv.id_temp
		item.id_inventario= inv.id_inventario
		item.fecha_incid= inv.fecha_incid
		item.fecha_entrega= qn(inv.fecha_entrega)
		item.folio_acc=qn(inv.folio_accidente)
		item.folio_inf=qn(inv.folio_inf_acc)
		item.tipo_vehiculo= buscarNombreTipoVehiculoById(request,inv.clas_vehiculo)
		item.comandancia= buscarComandanciaNombreById(request,inv.comandancia)
		item.turno= buscarTurnoNombreById(request,inv.turno)
		item.infrac_accid= buscarInfraccionAccidente(inv.infrac_accid)
		lista.append(item)
	t= Template(tmplListInventario)
	params={}
	params['inventarios']=lista
	c= Context(params)
	res= t.render(c)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
#def list_inventario(request):
	#queryset =Inventario.objects.all() 
	#return object_list(request, template_name = 'inventarios/list.jade',
    #     queryset = queryset, paginate_by = 10)

#@login_required

