# encoding: UTF-8
from systra.utils_session import *
from infracciones.models import Detalle
from infracciones.models import Infraccion
from infracciones.tmplInfraccion import tmplInfraccion
from json import dumps, loads, JSONEncoder
from django.core.exceptions import ObjectDoesNotExist
from django.template import Context, Template
class BuildInfraccion:
	def __init__(self,request, id):
		self.request= request
		self.id= id
	def findSexo(self,id):
		if str(id) == "1":
			return "HOMBRE"
		elif str(id)== "0":
			return "MUJER"
		else:
			return id
	def findFirmo(self,id):
		if str(id) == "0":
			return "SI"
		else: 
			return "NO"
	def findServicio(self,id):
		if str(id) == "1":
			return "Servicio Particular"
		else: 
			return "Servicio Publico"
	def findTipoOperativo(self,id):
		modelos=listTbTipoOperativo(self.request)
		for modelo in modelos:
			if str(modelo.id) == str(id):
				return modelo.descripcion
		return ''
	def cargarInfraccion(self):
		infraccion= Infraccion.objects.get(id__iexact= self.id)
		t= Template(tmplInfraccion)
		params={}
		droga= infraccion.estado_conductor
		estado={}
		params['certificado_medico']=infraccion.certificado_medico 
		print "El valor de droga "  + droga
		if droga == 'Normal':
			params["ebriedad_incompleta"]="no"
			params["ebriedad_completa"]="no"
			params["influjo_droga"]="no"
			params["normal"]="si"
			params["aliento_alcoholico"]="no"
		if droga == 'Ebriedad Incompleta':
			params["ebriedad_incompleta"]="si"
			params["ebriedad_completa"]="no"
			params["influjo_droga"]="no"
			params["normal"]="no"
			params["aliento_alcoholico"]="no"
		if droga == 'Ebriedad Completa':
			params["ebriedad_incompleta"]="no"
			params["ebriedad_completa"]="si"
			params["influjo_droga"]="no"
			params["normal"]="no"
			params["aliento_alcoholico"]="no"
		if droga == 'Influjo Droga':
			params["ebriedad_incompleta"]="no"
			params["ebriedad_completa"]="no"
			params["influjo_droga"]="si"
			params["normal"]="no"
			params["aliento_alcoholico"]="no"
		if droga == 'Aliento Alcoholico':
			params["ebriedad_incompleta"]="no"
			params["ebriedad_completa"]="no"
			params["influjo_droga"]="no"
			params["normal"]="no"
			params["aliento_alcoholico"]="si"

		params['inf']= infraccion
		c=Context(params)
		res= t.render(c)
		return res