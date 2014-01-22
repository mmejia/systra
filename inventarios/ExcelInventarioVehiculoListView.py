from django.views.generic import View
from django.http import HttpResponse
from inventarios.models import Inventario
from systra.utils_session import  buildContext
from  systra.utils_session import  info
from json import dumps, loads, JSONEncoder
from django.db.models import Q
import operator
import datetime
import logging
import xlwt
log = logging.getLogger(__name__)
class ExcelInventarioVehiculoListView(View):

	def buildContextoBusqueda(self):
		data= self.request.GET
		inv= Inventario()
		dic=inv.__dict__
		llaves=dic.keys()
		usados={}
		disponibles=[]
		for i in range(len(llaves)):
			llave= llaves[i]
			if llave== '_state' or llave =='id' or llave=='fecha_incid'or llave=='status' or llave=='page' or llave=='order_by' or llave=='order_tipo':
				continue
			if data.has_key(llave):
				usados[llave]= data.get(llave,"")
			else:
				disponibles.append(llave)
		usados['fecha_inicial']= data.get('fecha_inicial',"")
		usados['fecha_final']= data.get('fecha_final',"")
		usados['status']= data.get('status',1)
		usados['page']=data.get('page',0)
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
		fecha_inicial= usados.get("fecha_inicial","")
		fecha_final= usados.get("fecha_final","")
		status=usados.get("status",1)
		page=usados.get("page","")
		order_by=usados.get("order_by","")
		order_tipo=usados.get("order_tipo","")
		queries=[]
		if fecha_inicial!="" and fecha_final == "":
			date= self.str2date(fecha_inicial)
			queries.append(Q(fecha_incid=date))
		elif fecha_inicial=="" and fecha_final != "":
			date= self.str2date(fecha_final)
			queries.append(Q(fecha_incid=date))
		elif fecha_inicial!="" and fecha_final != "":
			date_i= self.str2date(fecha_inicial)
			date_f= self.str2date(fecha_final)
			queries.append(Q(fecha_incid__range=(date_i,date_f)))
		if status != -1:
			queries.append(Q(activo__exact=status))
		llaves=usados.keys()
		for llave in llaves:
			if llave == 'fecha_inicial' or llave == 'fecha_final' or llave =="status" or llave =="page" or llave =="order_by" or llave =="order_tipo":
				continue
			valor= usados.get(llave,"")
			if valor!="":
				camp= llave + '__contains'
				queries.append(Q(**{camp: valor}))
		if len(queries)>0:
			query= queries.pop()
			for  q in queries:
				query &=q
			if order_by == "":
				activos= Inventario.objects.filter(query).order_by('folio_inventario')
			else:
				if order_tipo!= "" or order_tipo=="asc":
					activos= Inventario.objects.filter(query).order_by(order_by)
				elif order_tipo=="desc":
					order_by="-"+order_by
					activos= Inventario.objects.filter(query).order_by(order_by)
				else:
					activos= Inventario.objects.filter(query).order_by(order_by)
		else:
			activos=[]
		return activos
	def get_context_data(self, **kwargs):
		context = super(ExcelInventarioListView, self).get_context_data(**kwargs)
		contexto2= buildContext(self.request)
		respuesta=self.buildContextoBusqueda()
		contexto2.update(context)
		contexto2.update(respuesta)
		contexto2['codigo']='<script>window.usuados_json=' +respuesta['usados_json']+ ';window.disponibles_json=' +respuesta['disponibles_json']+';</script>'
		return contexto2 
	def get (self,request,*args,**kwargs):
		self.request=request
	 	normal_style = xlwt.easyxf("""
	     font:
	         name Verdana
	     """) 
		response = HttpResponse(mimetype='application/ms-excel')
		wb = xlwt.Workbook()
		activos=self.get_queryset()
		ws0 = wb.add_sheet('Inventarios')
		i=0
		for activo in activos:
			print i
			ws0.write(i, 0, activo.fecha_incid, normal_style)
			ws0.write(i, 1, activo.liberacion_fecha, normal_style)
			ws0.write(i, 2, activo.motivo_de_recojimiento, normal_style)
			ws0.write(i, 3, activo.comandancia, normal_style)
			ws0.write(i, 4, activo.turno, normal_style)
			i=i+1
			if i>500:
				break
		wb.save(response)
		return response