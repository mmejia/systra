from django.db import IntegrityError, transaction
from json import dumps, loads, JSONEncoder
from infracciones.models import *
import logging
log = logging.getLogger(__name__)
class SaveInfraccion:
	def __init__(self,request):
		infraccion_str=request.POST.get('data')
		self.inf= loads(infraccion_str)
	def do(self):
		infraccion= self.inf
		ff=infraccion.get('folio_infraccion',"")
		l =Infraccion.objects.filter(folio_infraccion__exact =ff)
		if len(lista)>0:
			res='{"ERROR":' + '"SE INTENTA AGREGAR UNA INFRACCION QUE SU FOLIO YA EXISTE"}'
			return res
		tbinf= Infraccion()
		tbinf.folio=infraccion.get('folio_infraccion',"")            
		tbinf.servicio =infraccion.get('tipo_servicio',"")
		tbinf.hora_infrac=infraccion.get('hora',"")  
		tbinf.fecha_infrac =self.convertirFecha(infraccion.get('fecha',""))    
		tbinf.delegacion=infraccion.get('delegacion',"")               
		tbinf.comandancia =infraccion.get('comandancia',"")             
		tbinf.turno =infraccion.get('turno',"")               
		tbinf.num_cobro_agente =infraccion.get('noCobro',"") 
		tbinf.Calle1 =infraccion.get('calle1',"")
		tbinf.Calle2 =infraccion.get('calle2',"")
		tbinf.frente_num =infraccion.get('referencia',"")
		tbinf.Colonia2 =infraccion.get('colonia2',"")
		infractor= infraccion.get('infractor',None)
		persona= Infractor()

		if infractor != None:
			persona.nombre=infractor.get("nombre","") 
			persona.appPat= infractor.get("appPat","") 
			persona.appMat= infractor.get("appMat","") 
			persona.sexo= infractor.get("sexo","") 
			persona.edad= infractor.get("edad","") 
			persona.domicilio= infractor.get("domicilio","") 
			persona.numero= infractor.get("numero","") 
			persona.colonia=infractor.get("colonia","")  
			persona.ciudad= infractor.get("ciudad","") 
			persona.estado= infractor.get("estado","") 
			persona.no_licencia=infractor.get("no_licencia","")
			 
		vehiculo= infraccion.get('vehiculo',None)
		carro= Vehiculo()
		if vehiculo!=None:
			carro.clas_vehiculo=vehiculo.get('clas_vehiculo',"") 
			carro.marca= vehiculo.get('marca',"")
			carro.submarca= vehiculo.get('submarca',"")
			carro.modelo= vehiculo.get('modelo',"")
			carro.color= vehiculo.get('color',"")
			carro.detalle_color= vehiculo.get('detalle_color',"")
			carro.tipo_placa= vehiculo.get('tipo_placa',"")
			carro.placas= vehiculo.get('placas',"")
			carro.estado_placa= vehiculo.get('estado_placa',"")
			carro.serie= vehiculo.get('serie',"")
			carro.tipo= vehiculo.get('tipo',"")
			carro.empresa= vehiculo.get('empresa',"")
			carro.ruta= vehiculo.get('ruta',"")
			carro.no_economico=vehiculo.get('no_economico',"") 
			carro.no_tarjeton=vehiculo.get('no_tarjeton',"") 
			 
		se_recoje= infraccion.get('se_recoje',None)
		if se_recoje!=None:
			if "LICENCIA"== se_recoje.get('tipo',""):
				tbinf.se_recogio ="LICENCIA"
				datos=se_recoje.get("datos",None)
				if datos != None:
					tbinf.recoje_licencia_estado=datos.get("recoje_licencia_estado","")
					tbinf.recoje_licencia_no_conducir= datos.get("recoje_licencia_no_conducir","")
					tbinf.recoje_licencia_fecha_vencimiento=datos.get("recoje_licencia_fecha_vencimiento","")
					tbinf.recoje_licencia_tipo=datos.get("recoje_licencia_tipo","")
					tbinf.recoje_licencia_restricciones=datos.get("recoje_licencia_restricciones","")
					tbinf.recoje_vehiculo_no_inventario=""
					tbinf.recoje_vehiculo_pension=""
				else:
					tbinf.recoje_licencia_estado=""
					tbinf.recoje_licencia_no_conducir= ""
					tbinf.recoje_licencia_fecha_vencimiento=""
					tbinf.recoje_licencia_tipo=""
					tbinf.recoje_licencia_restricciones=""
					tbinf.recoje_vehiculo_no_inventario=""
					tbinf.recoje_vehiculo_pension=""

			elif "VEHICULO" == se_recoje.get('tipo',""):
				tbinf.se_recogio ="VEHICULO"
				datos=se_recoje.get("datos",None)
				if datos != None:
					tbinf.recoje_licencia_estado=""
					tbinf.recoje_licencia_no_conducir= ""
					tbinf.recoje_licencia_fecha_vencimiento= ""
					tbinf.recoje_licencia_tipo= ""
					tbinf.recoje_licencia_restricciones= ""
					tbinf.recoje_vehiculo_no_inventario=datos.get("recoje_vehiculo_no_inventario","")
					tbinf.recoje_vehiculo_pension=datos.get("recoje_vehiculo_pension","")
				else:
					tbinf.recoje_licencia_estado=""
					tbinf.recoje_licencia_no_conducir= ""
					tbinf.recoje_licencia_fecha_vencimiento=""
					tbinf.recoje_licencia_tipo=""
					tbinf.recoje_licencia_restricciones=""
					tbinf.recoje_vehiculo_no_inventario=""
					tbinf.recoje_vehiculo_pension=""
			else:
				tbinf.se_recogio =se_recoje.get('tipo',"")
				tbinf.recoje_licencia_estado=""
				tbinf.recoje_licencia_no_conducir= ""
				tbinf.recoje_licencia_fecha_vencimiento= ""
				tbinf.recoje_licencia_tipo= ""
				tbinf.recoje_licencia_restricciones= ""
				tbinf.recoje_vehiculo_no_inventario=""
				tbinf.recoje_vehiculo_pension=""

		certificado= infraccion.get('certificado',None)
		tbinf.certificado_medico=certificado.get("certificado_numero",0)
		if certificado !=None:
			if certificado.get("aliento_alcoholico","no") == "si":
				 tbinf.estado_conductor="Aliento Alcoholico"
			elif certificado.get("ebriedad_completa","no") == "si":
				tbinf.estado_conductor="Ebriedad Completa"
			elif certificado.get("ebriedad_incompleta","no") == "si":
				tbinf.estado_conductor="Ebriedad Incompleta"
			elif certificado.get("influjo_droga","no") == "si":
				tbinf.estado_conductor="Influjo Droga"
			else:
				tbinf.estado_conductor="Normal"
		else:
			tbinf.conductor_estado="Normal"
		tbinf.firma_conductor =infraccion.get('firmo',"")
		tbinf.fecha_captura =infraccion.get('fecha_captura') 
		tbinf.fecha_final_captura =infraccion.get('fecha_final_captura')
		tbinf.usuario =infraccion.get('usuario',"")  
		tbinf.status =1  
		tbinf.longitud =infraccion.get('longitud',"") 
		tbinf.latitud =infraccion.get('latitud',"")
		tbinf.circulacion=infraccion.get("circulacion","")
		tbinf.tipo_operativo =infraccion.get('tipo_operativo',"")
		tbinf.activo  =1
		tbinf.nombre_colonia_infraccion =infraccion.get('turno',"") 
		tbinf.observaciones_infraccion =infraccion.get('observaciones',"") 
		tbinf.servicio_publico =infraccion.get('tipo_servicio') 
		tbinf.nombreAgente =infraccion.get('nombreAgente')

		articulos=infraccion.get('articulos', None)
		detalles=[]
		if articulos !=None:
			for item in articulos:
				try:
					detalle= Detalle()
					detalle.folio= tbinf.folio
					id_tabulador=item.get("id_tabulador",0)
					if id_tabulador != "None" and id_tabulador != None:
					 	detalle.id_articulo=id_tabulador
					else:
						detalle.id_articulo=0
					detalle.articulo=item.get("art","")
					detalle.parrafo= item.get('fracc',"")
					detalle.concepto= item.get('descc',"")
					detalles.append(detalle)
				except:
					print "Error al obtener los articulos"
		print "Vamos a imprimir cuantod detalles esta guardando"
		print detalles
		try:
			with transaction.atomic():
				carro.save()
				persona.save()
				tbinf.infractor= persona
				tbinf.vehiculo= carro
				tbinf.save()
				for det in detalles:
					print "Agregando"
					det.save()
					print det.id
					tbinf.detalles.add(det)
					tbinf.save()
				print "termino de Guardar la infraccion"
				print tbinf.id
				print "termino de Guardar la infraccion"

		except IntegrityError:
			return -1
		return tbinf.pk
	def convertirFecha(self, fecha):
		if fecha != "":
			her= fecha.split('-')
			dia = her[0]
			mes=her[1]
			anio= her[2]
			return "%s-%s-%s" %(anio,mes,dia)
		else:
			return ""


