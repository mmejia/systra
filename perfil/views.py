# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from json import dumps, loads, JSONEncoder
from django.core import serializers
from perfil.forms import *
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from perfil.models import Perfil
from django.views.decorators.csrf import csrf_exempt, csrf_protect
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
def perfil_captura(request):
	return render_to_response('perfil/captura.jade')
def modificar_perfil(request,id):
	perfil= Perfil.objects.get(id= id)
	json_perfil=convertir(perfil)
	ctx={}
	cad= "<script>window.perfil=" + json_perfil +";</script>"
	ctx['codigo']=cad
	return render_to_response('perfil/modificar.jade',ctx )
@csrf_exempt
def perfil_update(request):
	post= request.POST
	id= post.get('id',None)
	if id!=None:
		perfil= Perfil.objects.get(id=id)
		perfil.cobro=post.get('cobro',"")
		perfil.nombre=post.get('nombre',"")
		perfil.comandancia=post.get('comandancia',"")
		perfil.turno=post.get('turno',"")
		perfil.delegacion=post.get('delegacion',"")
		perfil.comision=post.get('comision',"")
		perfil.color=post.get('color',"")
		perfil.tam_tabla=post.get('tam_tabla',"")
		perfil.save()
		res= "{\"id\":\"" + str(perfil.id) + "\"}"
		return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
	else:
		res= "{\"ERROR\"}"
		return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
