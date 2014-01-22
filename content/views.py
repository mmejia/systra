# Create your views here.
from django.http import HttpResponse
from accidentes.models import Resource
from systra.settings import 	CONTENT
from datetime import *
import os
import uuid 
from django.views.decorators.csrf import csrf_exempt, csrf_protect
def content_content(request,id):
	recurso=Resource.objects.get(id=id)
	if recurso!=None:
		ruta= recurso.ruta
		print ruta
		f= open(ruta,'r')
		archivo= f.read()
		f.close()
		return HttpResponse(archivo,content_type='image/jpeg', status=200)
	else:
		return  HttpResponse("error",content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def upload_fotografia(request):
	res= subirContenido(request)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def upload_croquis(request):
	res= subirContenido(request)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def subirContenido(request):
	if request.method=='POST':
		archivo= request.FILES.get('file_name')
		tipo=request.POST.get('tipo')
		modulo=request.POST.get('modulo')
		id_unico=request.POST.get('id_unico')
		dir(archivo)
		nombre= archivo.name
		ruta =obtenerRuta()
		#print "La ruta obtenida: "+ ruta
		newname= uuid.uuid1()
		print newname
		#newname="Hola"
		all_ruta=ruta + str(newname)
		arch=open(all_ruta ,'wb+')
		for chunk in archivo.chunks():
			arch.write(chunk)
		rec= Resource()
		rec.ruta=all_ruta
		rec.nombre_archivo= nombre
		rec.tipo=tipo
		rec.modulo=modulo
		rec.id_unico= id_unico
		rec.save()
		res='{"id":"'+str(rec.id)+'","nombre":"'+rec.nombre_archivo+'"}'
		#res='{"id":"0","nombre":"None"}'
		return res
	else:
		res='{"id":"0","nombre":"None"}'
		return res
def obtenerRuta():
	hoy=datetime.now()
	dia = hoy.timetuple().tm_yday
	print dia
	anio= hoy.year
	print anio
	hora= hoy.hour
	print hora
	print CONTENT
	builddir= CONTENT+str(anio) +"/"+str(dia)+"/"+str(hora)+"/"
	print "El valor de builddir: "+ builddir
	if not os.path.exists(builddir):
		os.makedirs(builddir)
	return builddir




