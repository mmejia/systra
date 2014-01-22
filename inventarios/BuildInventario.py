from inventarios.models import Inventario
from django.template import Context, Template
from inventarios.tmplInventario import  tmplInventario
from django.core.exceptions import ObjectDoesNotExist
from inventarios.models import Resource
from json import dumps, loads, JSONEncoder
from django.core.exceptions import ObjectDoesNotExist
from systra.util import *

class BuildInventario:
	def __init__(self,request, id_temp):
		self.request= request
		self.id_temp= id_temp
	def cargarInventario(self):
		inventario= Inventario.objects.get(id__iexact= self.id_temp)
		inventario.num_interior=inventario.interior
		t= Template(tmplInventario)
		params={"inventario":inventario}
		id_frente= inventario.frente
		print id_frente
		try:
			frente= Resource.objects.get(id__exact=id_frente)
			if frente!=None:
				params['frente']= frente
		except ObjectDoesNotExist:
			params['frente']= None
		id_posterior= inventario.posterior
		print id_posterior
		try:
			posterior= Resource.objects.get(id__exact=id_posterior)
			if posterior!=None:
				params['posterior']= posterior
		except ObjectDoesNotExist:
			params['posterior']= None


		c=Context(params)
		res= t.render(c)
		return res


