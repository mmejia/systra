from django.views.generic.list import ListView
from infracciones.models import Infraccion
from systra.utils_session import  buildContext
from  systra.utils_session import  info
from django.http import HttpResponseNotFound
from json import dumps, loads, JSONEncoder
from django.db.models import Q
import operator
import datetime
import logging
log = logging.getLogger(__name__)
class InfraccionListView(ListView):
	model = Infraccion
	template_name='infracciones/list.jade'
	paginate_by = 10
	allow_empty = True
	def buildContextoBusqueda(self):
		data= self.request.GET
		inf= Infraccion()
		dic=inf.__dict__
		llaves=dic.keys()
		usados={}
		disponibles=[]
		for i in range(len(llaves)):
			llave= llaves[i]
			if llave== '_state' or llave =='id' or llave=='fecha_infrac' or llave=='status' or llave=='page' or llave=='order_by' or llave=='order_tipo':
				continue
			if data.has_key(llave):
				usados[llave]= data.get(llave,"")
			else:
				disponibles.append(llave)
		usados['fecha_inicial']= data.get('fecha_inicial',"")
		usados['fecha_final']= data.get('fecha_final',"")
		usados['status']= data.get('status',1)
		usados['page']=data.get('page',1)
		usados['order_by']= data.get('order_by',"")
		usados['order_tipo']= data.get('order_tipo',"")
		respuesta={}
		respuesta['usados']=usados
		respuesta['disponibles']= disponibles
		respuesta['usados_json']=dumps(usados)
		respuesta['disponibles_json']= dumps(disponibles)
		return respuesta
	def str2date(self, cadena):
		return datetime.datetime.strptime(cadena,"%Y-%m-%d")
	def get_queryset(self):
		respuesta=self.buildContextoBusqueda()
		usados= respuesta['usados']
		fecha_inicial=usados.get("fecha_inicial","")
		fecha_final=usados.get("fecha_final","")
		status=usados.get("status",1)
		page=usados.get("page","")
		order_by=usados.get("order_by","")
		order_tipo=usados.get("order_tipo","")
		queries=[]
		if fecha_inicial!="" and fecha_final == "":
			date= self.str2date(fecha_inicial)
			queries.append(Q(fecha_infrac=date))
		elif fecha_inicial=="" and fecha_final != "":
			date= self.str2date(fecha_final)
			queries.append(Q(fecha_infrac=date))
		elif fecha_inicial!="" and fecha_final != "":
			date_i= self.str2date(fecha_inicial)
			date_f= self.str2date(fecha_final)
			queries.append(Q(fecha_infrac__range=[date_i, date_f]))
		if status != -1:
			queries.append(Q(activo__exact=status))
		llaves=usados.keys()
		for llave in llaves:
			if llave == 'fecha_inicial' or llave == 'fecha_final' or llave== "status"  or llave == "page" or llave == "order_by" or llave == "order_tipo":
				continue
			valor= usados.get(llave,"")
			if valor!="":
				camp= llave + '__contains'
				queries.append(Q(**{camp:valor}))
		if len(queries)>0:
			query=queries.pop()
			for item in queries:
				query  &= item
			if order_by == "":
				activos= Infraccion.objects.filter(query).order_by('folio')
			else:
				if order_tipo!= "" or order_tipo=="asc":
					activos= Infraccion.objects.filter(query).order_by(order_by)
				elif order_tipo=="desc":
					order_by="-"+order_by
					activos= Infraccion.objects.filter(query).order_by(order_by)
				else:
					activos= Infraccion.objects.filter(query).order_by(order_by)

			activos= Infraccion.objects.filter(query)
		else:
			activos=[]
		for act in activos:
			act.motivo=self.getTextDetalles(act)
		print "flor de mayo"
		return activos
	def getTextDetalles(self,infraccion):
		detalles= infraccion.detalles.all()
		txt=""
		for det in detalles:
			if txt=="":
				txt=det.articulo
			else:
				txt= txt + "," + det.articulo 
		return txt
	def get_context_data(self, **kwargs):
		context={}
		try:
			context = super(InfraccionListView, self).get_context_data(**kwargs)
		except:
			contexto2= buildContext(self.request)
			respuesta=self.buildContextoBusqueda()
			contexto2.update(respuesta)
			contexto2['codigo']='<script>window.usados_json=' +respuesta['usados_json']+ ';window.disponibles_json=' +respuesta['disponibles_json']+';</script>'
			return contexto2
			#return HttpResponseNotFound('<h1>Page not found</h1>')
		contexto2= buildContext(self.request)
		respuesta=self.buildContextoBusqueda()
		contexto2.update(context)
		contexto2.update(respuesta)
		contexto2['codigo']='<script>window.usados_json=' +respuesta['usados_json']+ ';window.disponibles_json=' +respuesta['disponibles_json']+';</script>'
		info(log,"SOLICITA VER LA LISTA DE INFRACCIONES ",self.request)
		return contexto2 