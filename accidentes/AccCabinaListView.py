from django.views.generic.list import ListView
from accidentes.models import AccCabina
from systra.utils_session import  buildContext
from  systra.utils_session import  info
from systra.utils_session import getComandancias
from django.db.models import Q
from json import dumps, loads, JSONEncoder
import datetime
import logging
log = logging.getLogger(__name__)
class AccCabinaListView(ListView):
	model = AccCabina
	paginate_by = 10
	template_name='accidentes/accidentes/list_inicia.jade'
	def buildContextoBusqueda(self):
		data= self.request.GET
		respuesta={}
		fecha_inicial= data.get('fecha_inicial',"")
		fecha_final= data.get('fecha_final',"")
		tipo_evento= data.get('tipo_evento',"")
		status= data.get('status',-1)
		comandancia= data.get('comandancia',"")
		agente= data.get('agente',"")
		lugar= data.get('lugar',"")
		respuesta['fecha_inicial']= fecha_inicial
		respuesta['fecha_final']=fecha_final
		respuesta['status']=int(status)
		respuesta['comandancia']= comandancia
		respuesta['agente']= agente
		respuesta['lugar']= lugar
		respuesta['page']=data.get('page',1)
		respuesta['order_by']= data.get('order_by',"")
		respuesta['order_tipo']= data.get('order_tipo',"")
		comandancias=getComandancias(self.request)
		respuesta['comandancias']=comandancias
		 
		return respuesta
	def str2date(self, cadena):
		return datetime.datetime.strptime(cadena,"%Y-%m-%d")
	def get_queryset(self):
		respuesta=self.buildContextoBusqueda()
		fecha_inicial= respuesta.get('fecha_inicial',"")
		fecha_final= respuesta.get('fecha_final',"")
		status= respuesta.get('status',1)
		comandancia=respuesta.get('comandancia',"")
		agente=respuesta.get('agente',"")
		lugar=respuesta.get('lugar',"")
		page=respuesta.get("page",1)
		order_by=respuesta.get("order_by","")
		order_tipo=respuesta.get("order_tipo","")
		queries=[]
		if fecha_inicial!="" and fecha_final == "":
			date= self.str2date(fecha_inicial)
			queries.append(Q(fecha_evento=date))
		elif fecha_inicial=="" and fecha_final != "":
			date= self.str2date(fecha_final)
			queries.append(Q(fecha_evento=date))
		elif fecha_inicial=="" and fecha_final != "":
			date_i= self.str2date(fecha_inicial)
			date_f= self.str2date(fecha_final)
			queries.append(Q(fecha_evento__range=[fecha_inicial, fecha_final]))
		if status != -1:
			queries.append(Q(activo__exact=status))
		if comandancia!="NO":
			queries.append(Q(comandancia__exact=comandancia))
		if agente!="":
			queries.append(Q(agente_intervino__contains=agente))
		if lugar!="":
			queries.append(Q(calle1__contains=lugar))
		query=queries.pop()
		for item in queries:
			query  &= item
		if order_by == "":
			activos= AccCabina.objects.filter(query).order_by('folio_evento')
		else:
			if order_tipo!= "" or order_tipo=="asc":
					activos= AccCabina.objects.filter(query).order_by(order_by)
			elif order_tipo=="desc":
				order_by="-"+order_by
				activos= AccCabina.objects.filter(query).order_by(order_by)
			else:
				activos= AccCabina.objects.filter(query).order_by(order_by)
		return activos
	def get_context_data(self, **kwargs):
		context = super(AccCabinaListView, self).get_context_data(**kwargs)
		contexto2=buildContext(self.request)
		data= self.request.GET
		respuesta=self.buildContextoBusqueda()
		context.update(contexto2)
		context.update(respuesta)
		info(log,"LISTA CABINA ",self.request)
		return context