from accidentes.tmplPreliminar  import tmplPreliminar
from accidentes.models import AccCabina
from django.template import Context, Template
from systra.utils_session import *
from datetime import datetime
class BuildPreliminar:
	def __init__(self,request,id):
		self.request= request
		self.id= id
	def cargarPreliminar(self):
		preliminar= AccCabina.objects.get(id__iexact=self.id)
		t= Template(tmplPreliminar)
		params={}
		params['id_pre']=preliminar.id;
		params['folio_evento_pre']=preliminar.folio_evento
		params['tipo_evento_pre']=self.buscarTbTipoEventoById(preliminar.tipo_evento)
		params['delegacion_pre']=self.buscarDelegacionById(preliminar.delegacion)
		params['comandancia_pre']=self.buscarComandanciaById(preliminar.comandancia)
		params['turno_pre']=self.buscarTurnoById(preliminar.turno)
		params['hora_evento_pre']=preliminar.hora_evento.strftime('%H:%M')
		params['fecha_evento_pre']=preliminar.fecha_evento.strftime('%Y-%m-%d')
		params['localizacion_evento_pre']=preliminar.localizacion_evento
		params['observaciones_evento_pre']=preliminar.observaciones_evento
		params['reg_inicio_pre']=preliminar.reg_inicio
		params['reg_final_pre']=preliminar.reg_final
		params['cabina_completo_pre']=preliminar.cabina_completo
		params['activo_pre']=preliminar.activo
		params['id_unico_pre']=preliminar.id_unico
		params['tipo_operativo_pre']=self.buscarTbTipoOperativoById(preliminar.tipo_operativo)
		params['agente_intervino_pre']=preliminar.agente_intervino
		params['unidad_intervino_pre']=preliminar.unidad_intervino
		params['sector_intervino_pre']=preliminar.sector_intervino
		params['id_tipo_accidente_pre']=preliminar.id_tipo_accidente
		params['id_clasificacion_pre']=preliminar.id_clasificacion
		params['no_veh_participantes_pre']=preliminar.no_veh_participantes
		params['no_muertos_pre']=preliminar.no_muertos
		params['no_heridos_pre']=preliminar.no_heridos
		params['no_detenidos_pre']=preliminar.no_detenidos
		params['id_pension_pre']=preliminar.id_pension
		params['usuario_pre']=preliminar.usuario
		params['por_llenar_pre']=preliminar.por_llenar
		params['colonia_pre']=preliminar.colonia
		params['no_inventario']=preliminar.no_inventario
		c=Context(params)
		res= t.render(c)
		return res
	def buscarDelegacionById(self,id):
		delegaciones=getDelegaciones(self.request)
		for delegacion in delegaciones:
			if delegacion.id== id:
				return delegacion.delegacion
		return ''
	def buscarComandanciaById(self,id):
		comandancias=getComandancias(self.request)
		for comandancia in comandancias:
			if comandancia.id== id:
				return comandancia.comandancia
		return ''
	def buscarTurnoById(self,id):
		turnos=getTurnos(self.request)
		for turno in turnos:
			if turno.id== id:
				return turno.turno
		return ''
	def buscarTbTipoEventoById(self,id):
		turnos=listTbTipoEvento(self.request)
		for turno in turnos:
			if turno.id== id:
				return turno.tipo_evento
		return ''
	def buscarTbTipoOperativoById(self,id):
		turnos=listTbTipoOperativo(self.request)
		for turno in turnos:
			if turno.id== id:
				return turno.descripcion
		return 'NINGUNO'

