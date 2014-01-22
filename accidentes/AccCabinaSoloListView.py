from django.views.generic.list import ListView
from accidentes.models import AccCabina
from systra.utils_session import  buildContext
from  systra.utils_session import  info
from systra.utils_session import getComandancias
from django.db.models import Q
import datetime
import logging
log = logging.getLogger(__name__)
class AccCabinaSoloListView(ListView):
	model = AccCabina
	paginate_by = 10
	template_name='accidentes/accidentes/pantallas/solo-list-preliminar.jade'
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
		comandancias=getComandancias(self.request)
		respuesta['comandancias']=comandancias
		return respuesta
	def str2date(self, cadena):
		return datetime.datetime.strptime(cadena,"%Y-%m-%d")
	def get_queryset(self):
		respuesta=self.buildContextoBusqueda()
		fecha_inicial= respuesta['fecha_inicial']
		fecha_final= respuesta['fecha_final']
		status= respuesta['status']
		comandancia=respuesta['comandancia']
		agente=respuesta['agente'] 
		lugar=respuesta['lugar'] 
		queries=[]

		#activos= AccCabina.objects
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
		activos= AccCabina.objects.filter(query)
		return activos
	def get_context_data(self, **kwargs):
		context = super(AccCabinaSoloListView, self).get_context_data(**kwargs)
		contexto2=buildContext(self.request)
		data= self.request.GET
		respuesta=self.buildContextoBusqueda()
		context.update(contexto2)
		context.update(respuesta)
		info(log,"LISTA CABINA ",self.request)
		return context