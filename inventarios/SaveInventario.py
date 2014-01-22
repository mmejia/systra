from django.db import IntegrityError, transaction
from json import dumps, loads, JSONEncoder
from inventarios.models import *
import logging
from datetime import date
log = logging.getLogger(__name__)
class SaveInventario:
	def __init__(self,request):
		inventario_str=request.POST.get('data')
		self.inv= loads(inventario_str) 
	def do(self):
		inve= Inventario()
		inventario= self.inv
		fi=inventario.get('folio_del_inventario',0)
		if fi== 0 or fi =='':
			fi=0
		inve.folio_inventario=fi
		f_inf=inventario.get('folio_infraccion',0)
		if f_inf == 0 or f_inf == '':
			f_inf=0
		inve.folio_infraccion=f_inf
		fa= inventario.get('folio_accidente',0)
		if fa == 0 or fa== '':
			fa=0
		inve.folio_accidente=fa
		inve.delegacion=inventario.get('delegacion',"")
		inve.comandancia=inventario.get('comandancia',"")
		inve.turno=inventario.get('turno',"")
		inve.motivo_de_recojimiento=inventario.get('motivo_de_recojimiento',"")
		inve.tipo_servicio=inventario.get('tipo_servicio',"")
		inve.folio_agente=inventario.get('folio_agente',"")
		inve.nombre_agente=inventario.get('nombre_agente',"")
		inve.fecha_incid=inventario.get('fecha_incidente')
		inve.fecha_captura=date.today()
		inve.pension_hora=inventario.get('hora_entrada')
		inve.pension_fecha=inventario.get('fecha_entrada')
		inve.calle1=inventario.get('calle1',"")
		inve.calle2=inventario.get('calle2',"")
		inve.colonia=inventario.get('colonia',"")
		inve.interior=inventario.get('num_interior',"")
		inve.exterior=inventario.get('exterior',"")
		inve.depositado_en=inventario.get('depositado_en',"")
		inve.autoridad_competente=inventario.get('autoridad_competente',"")
		inve.clas_vehiculo=inventario.get('clas_vehiculo',"")
		inve.tipo=inventario.get('tipoveh',"")
		inve.marca=inventario.get('marca',"")
		inve.submarca=inventario.get('submarca',"")
		inve.veh_modelo=inventario.get('modelo',"")
		inve.veh_color=inventario.get('color',"")
		inve.veh_color_detalle=inventario.get('detalle',"")
		inve.veh_placas=inventario.get('placas',"")
		inve.veh_serie=inventario.get('serie',"")
		inve.numero_economico=inventario.get('numero_economico',"")
		inve.infractor_nombre=inventario.get('conductor_nombre',"")
		inve.infractor_apepaterno=inventario.get('apellido_paterno',"")
		inve.infractor_apematerno=inventario.get('apellido_materno',"")
		inve.pension_lugar=inventario.get('lugar',"")
		inve.pension_recibido_por=inventario.get('recibido_por',"")
		inve.pension_transportado_por=inventario.get('vehiculo_transportado_por',"")
		inve.pension_transportado_pension=inventario.get('vehiculo_transportado_pension',"")
		inve.pension_transportado_unidad_transito=inventario.get('vehiculo_transportado_unidad_transito',"")
		inve.usuario=inventario.get('usuario',"")
		inve.agencia_mp=inventario.get('mp',0)
		inve.activo=1
		inve.corporacion=inventario.get('corporacion',"")
		l =Inventario.objects.filter(folio_inventario__exact=inve.folio_inventario)
		lista= list(l)
		if len(lista)>0:
			res='{"ERROR":' + '"SE INTENTA AGREGAR UN INVENTARIO QUE SU FOLIO YA EXISTE"}'
			return res
		frente= inventario.get('frente',None)
		if frente !=None:
			id= frente.get('id',0)
			nombre=frente.get('nombre','')
			inve.frente=id
		else:
			inve.frente=0
		posterior=inventario.get('posterior',None)
		if posterior !=None:
			id= posterior.get('id',0)
			nombre=posterior.get('nombre','')
			inve.posterior=id
		else:
			inve.posterior=0

		inve.save()
		res= "{\"id\":\"" + str(inve.id) + "\"}" 
		return res


