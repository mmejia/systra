#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.shortcuts import render
from json import dumps, loads, JSONEncoder
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
def calles_conflictivas(request):
	calles= tojson(CCalles.objects.all())
	return HttpResponse(calles,content_type='application/json;charset=utf-8', status=200)
