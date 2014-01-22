# encoding: UTF-8
from django.http import HttpResponse
from django.shortcuts import render
from systra.utils_session import  buildContext
from accidentes.models import TbPensiones
from inventarios.models import BlockInventario
from django.core import serializers
from json import dumps, loads, JSONEncoder
from django.template import Context, Template
from inventarios.tplFoliosInventarioPorPension import tplFoliosInventarioPorPension
import time
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
def inventarios_admin_folio(request):
	contexto= buildContext(request)
	pensiones= TbPensiones.objects.all()
	current_anyo=time.strftime("%Y")
	anios= range(int(current_anyo)-5,int(current_anyo)+1)
	anios.reverse()
	contexto['anios']= anios
	contexto['pensiones']= pensiones
	return render(request,'inventarios/folios/admin-folio.jade',contexto)
def inventarios_foliosaniobypension(request,id_pension):
	bloques= BlockInventario.objects.filter(pension__id= id_pension)
	mes={}
	for bloque in bloques:
		fecha=bloque.fecha_recibido
		name_mes=getMes(fecha.month)
		if mes.has_key(name_mes):
			arreglo=mes.get(name_mes,None)
			print type(arreglo)
			arreglo.append(bloque)
		else:
			arreglo=[]
			arreglo.append(bloque)
			mes[name_mes]= arreglo
	t= Template(tplFoliosInventarioPorPension)
	print mes.keys()
	params={}
	params['mes']=mes
	c= Context(params)
	res= t.render(c)
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
def getMes(id_mes):
	mes={}
	mes[1]='Enero'
	mes[2]='Febrero'
	mes[3]='Marzo'
	mes[4]='Abril'
	mes[5]='Mayo'
	mes[6]='Junio'
	mes[7]='Julio'
	mes[8]='Agosto'
	mes[9]='Septiembre'
	mes[10]='Octubre'
	mes[11]='Noviembre'
	mes[12]='Diciembre'
	return mes[id_mes]

