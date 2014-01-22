from systra.utils_session import *
from systra.util import getUrlImagenesDeAccidenteUtil
from systra.util import getArrImagenesDeAccidenteUtil
from accidentes.tmplAccidente  import tmplAccidente
from json import dumps, loads, JSONEncoder
from accidentes.models import Accidentes
from accidentes.models import AccObjetos
from accidentes.models import AccAliCamino
from accidentes.models import AccEdoPavimento
from accidentes.models import AccClima
from accidentes.models import AccRegulacionCrucero
from accidentes.models import AccInveDetalles
from accidentes.models import AccInvolucrados
from accidentes.models import AccVehiculos
from django.template import Context, Template
from datetime import datetime
from django.forms.models import model_to_dict

from django.core.exceptions import ObjectDoesNotExist
class BuildAccidente:
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
	def buscarClasificacionById(self,id):
		clasificaciones=getClasAccidente(self.request)
		for clasi in clasificaciones:
			if clasi.id== id:
				return clasi.clas
		return ''
	def buscarTipoChoqueById(self,id):
		tipoAccidentes=getTipoAccidente(self.request)
		for tipo in tipoAccidentes:
			if str(tipo.id)== str(id):
				return tipo.clasvehic
		return id
	def buscarCalleById(self,id):
		calles=getCalles(self.request)
		for calle in calles:
			if str(calle.id)== str(id):
				return calle.calle
		return id
	def buscarColoniaById(self,id):
		colonias=getColonias(self.request)
		for colonia in colonias:
			if str(colonia.id)== str(id):
				return colonia.nombre
		return id

	def buscarEstadoById(self,id):
		estados=getEstados(self.request)
		for estado in estados:
			if estado.id== id:
				return estado.estado
		return ''
	def findTipoCalleById(self,id):
		tipos=getTipoCalles(self.request)
		for tipo in tipos:
			if tipo.id== id:
				return tipo.descripcion_tipo
		return ''
	def findNoCarrilesById(self,id):
		nocarriles=getNoCarriles(self.request)
		for nocarril in nocarriles:
			if nocarril.id== id:
				return nocarril.carriles
		return ''
	def findSentidoById(self,id):
		sentidos=getSentidos(self.request)
		for sentido in sentidos:
			if sentido.id== id:
				return sentido.sentido
		return ''
	def buscarMunicipioById(self,id):
		municipios=getMunicipios(self.request)
		for municipio in municipios:
			if municipio.id == id:
				return municipio.municipio
		return ''
	def findAlineacionById(self,id):
		if  id!=None:
			objeto=AccAliCamino.objects.get(id=id)
			if objeto != None:
				return objeto.alicamino
			else:
				return ''
		else:
			return ''
	def findEdoPavimentoById(self,id):
		if id!=None:
			objeto=AccEdoPavimento.objects.get(id=id)
			if objeto != None:
				return objeto.estado
			else:
				return ''
		else:
			return ''
	def findAccClimaById(self,id):
		if id!=None:
			objeto=AccClima.objects.get(id=id)
			if objeto != None:
				return objeto.clima
			else:
				return ''
		else:
			return ''

	def findRegulacionById(self,id):
		try:
			objeto=AccRegulacionCrucero.objects.get(id=id)
			if objeto != None:
				return objeto.descripcion
			else:
				return ''
		except ObjectDoesNotExist:
			return ''
	def findAgenteById(self,id):
		agentes=getAgentes(self.request)
		for agente in agentes:
			if agente.ID == id:
				return agente
		return None
 
	
	def buildDanos(self,id_unico):
		objetos=AccObjetos.objects.filter(id_unico__iexact=id_unico)
		return objetos;
	def buildArticulos(self,id_unico):
		objetos=AccInveDetalles.objects.filter(id_unico__iexact=id_unico)
		return objetos;
	def findCompetenciaJudicial(self,id_unico):
		involucrados=AccInvolucrados.objects.filter(id_unico__iexact=id_unico)
		res=[]
		for invo in involucrados:
			if invo.estado_herido == 'Detenido' or invo.estado_herido == 'Lesionado y Detenido':
				invo.nombre_detenido_en=self.findDetenidoById(invo.conductor_detenido_en)
				res.append(invo)
		return res

	def findVehiculos(self,id_unico):
		vehiculos=AccVehiculos.objects.filter(id_unico__iexact=id_unico)
		return vehiculos
	def findSaldoSangres(self,id_unico):
		involucrados=AccInvolucrados.objects.filter(id_unico__iexact=id_unico)
		res=[]
		for invo in involucrados:
			if invo.estado_herido == 'Lesionado' or invo.estado_herido == 'Lesionado y Detenido' or invo.estado_herido == 'Finado':
				invo.nombre_levantado_por=invo.edo_levantado_por
				invo.nombre_trasladado_por=invo.edo_trasladado_por
				res.append(invo)
		return res
	def findLevantadoPorById(self,id):
		detenidos=getLevantadosPor(self.request)
		for detenido in detenidos:
			if str(detenido.id)==str(id):
				return detenido.descripcion
		return 'str(id)'
	def findDetenidoById(self,id):
		detenidos=getDetenidos(self.request)
		print detenidos
		for detenido in detenidos:
			campo
			if detenido.id == id:
				return detenido.descripcion
		return str(id)

	def findAccClasVehiculoById(self,id):
		modelos=listAccClasVehiculo(self.request)
		for modelo in modelos:
			if modelo.id == id:
				return modelo.tipo
		return id
	def findAccVehiculoTipoById(self,id):
		modelos=listAccVehiculoTipo(self.request)
		for modelo in modelos:
			if str(modelo.id) == str(id):
				return modelo.tipo
		return id
	def findTbPensionesById(self,id):
		modelos=listTbPensiones(self.request)
		for modelo in modelos:
			if modelo.id == id:
				return modelo.nombre_pension
		return id
	def findTbColoresById(self,id):
		modelos=listTbColores(self.request)
		for modelo in modelos:
			if modelo.id == id:
				return modelo.color
		return id
	def findAccRestriccionesLicenciaById(self,id):
		modelos=listAccRestriccionesLicencia(self.request)
		for modelo in modelos:
			if modelo.id == id:
				return modelo.descripcion
		return id
	def findServicioPublico(self,id):
		if id == '0':
			return "Servicio Publico"
		else:
			return "Servicio Particular"
	def findSexo(self,id):
		if id == '0':
			return "HOMBRE"
		elif id== "1":
			return "MUJER"
		else:
			return "SE DESCONOCE"
	def buildVehiculos(self,id_unico):
		modelos= self.findVehiculos(id_unico)
		class Vehiculo:
			pass
		vehiculos=[]
		for mod in modelos:
			veh= Vehiculo()
			#veh.clas_vehiculo=self.findAccClasVehiculoById(mod.clas_vehiculo)
			veh.clas_vehiculo=mod.clas_vehiculo
			veh.intervino_como =mod.intervino_como
			veh.marca =mod.marca
			veh.submarca =mod.submarca
			veh.modelo = mod.modelo
			veh.tipo =self.findAccVehiculoTipoById(mod.tipo)
			veh.datos_adicionales =""
			veh.placa = mod.placa
			veh.serie =mod.serie
			veh.num_economico =mod.num_economico
			veh.capacidad =mod.capacidad
			veh.nom_grua =mod.num_grua
			veh.pension= self.findTbPensionesById(mod.pension)
			veh.vehiculo_servicio =self.findServicioPublico(mod.serviciopp)
			veh.color =self.findTbColoresById(mod.color)
			veh.color_detalle =mod.color_detalle
			veh.estadov =self.buscarEstadoById(mod.estadov)
			veh.tipo_dueno =mod.tipo_dueno
			veh.dueno_nombre =mod.dueno_nombre
			veh.dueno_apepaterno =''
			veh.dueno_apematerno =''
			veh.dueno_calle = mod.dueno_calle
			veh.dueno_tel =mod.dueno_tel
			veh.dueno_cp =mod.dueno_cp
			veh.dueno_colonia =self.buscarColoniaById(mod.dueno_colonia)
			veh.dueno_ciudad =self.buscarMunicipioById(mod.dueno_ciudadp)
			veh.dueno_estado =self.buscarEstadoById(mod.dueno_estadop)
			veh.conductor_nombre =mod.conductor_nombre
			veh.conductor_apepaterno =mod.conductor_apepaterno
			veh.conductor_apematerno =mod.conductor_apematerno
			veh.conductor_calle =mod.conductor_calle
			veh.conductor_edad =mod.conductor_edad
			veh.conductor_tipo_edad = ''
			veh.conductor_sexo =mod.conductor_sexo
			veh.conductor_colonia =self.buscarColoniaById(mod.conductor_colonia)
			veh.folio_infraccion =mod.folio_infraccion
			veh.folio_certificado_medico =mod.folio_certificado_medico
			veh.conductor_estado =self.buscarEstadoById(mod.estado)
			veh.conductor_municipio =self.buscarMunicipioById(mod.ciudad)
			veh.estado_herido =mod.estado_herido
			veh.conductor_detenido_en =self.findDetenidoById(mod.conductor_detenido_en)
			veh.conductor_custodia =self.findDetenidoById(mod.conductor_detenido_en)
			veh.conductor_disposicion =self.findDetenidoById(mod.conductor_disposicion)
			veh.conductor_se_encontraba =''
			veh.conductor_estado_droga ='ESTADO NORMAL'
			veh.conductor_levantado_por =''
			veh.conductor_trasladado_a =''
			veh.conductor_num_licencia =mod.conductor_num_licencia
			veh.conductor_rest_licencia =self.findAccRestriccionesLicenciaById(mod.conductor_rest_licencia)
			veh.conductor_fecha_vigencia =mod.conductor_fecha_expedida
			veh.conductor_edo_licencia=self.buscarEstadoById(mod.conductor_edo_licencia)
			vehiculos.append(veh)
		return vehiculos
	def cargarAccidente(self):
		accidente=Accidentes.objects.get(id_unico__iexact=self.id_unico)
		t= Template(tmplAccidente)
		params={}
		params['id']=accidente.id
		params['id_unico']= accidente.id_unico
		params['acc_croquis']=accidente.croquis
		params['acc_observaciones']= dumps(accidente.observaciones)
		params['acc_investigaciones']= dumps(accidente.investigacion)
		params['acc_folio_infraccion']=accidente.folios_infracciones
		params['acc_folio_accidente']=accidente.id_preliminar
		params['acc_delegacion']=accidente.convenio_delegacion
		params['acc_comandancia']=accidente.convenio_comandancia
		params['acc_turno']=accidente.convenio_turno
		#fecha= datetime.strptime(accidente.convenio_fecha, '%b %d %Y %I:%M%p')
		params['acc_fecha']=accidente.convenio_fecha.strftime('%Y-%m-%d')
		params['acc_hora']=accidente.convenio_hora
		params['acc_clasificacion']=self.buscarClasificacionById(accidente.clasificacion)
		params['acc_tipo_choque']=self.buscarTipoChoqueById(accidente.tipo_choque)
		params['acc_latitud']=accidente.latitud
		params['acc_longitud']=accidente.longitud
		params['acc_calle1']=accidente.calle1
		params['acc_calle2']=accidente.calle2
		params['acc_frentea']=""
		params['acc_colonia']=accidente.colonia
		params['acc_estado']=accidente.estado
		params['acc_municipio']=accidente.ciudad
		params['acc_simbologia_croquis']=dumps(accidente.simbologia)
		params['acc_danos']=self.buildDanos(accidente.id_unico)
		params['estado_calles_alineacion']=accidente.edo_alineacion
		params['estado_calles_estado_pavimento']=accidente.edo_piso
		params['estado_calles_clima']=accidente.edo_clima
		params['estado_calles_regulacion']=accidente.edo_regularizacion
		params['otros_parte_dia}']=""
		params['otros_tipo_calle']=accidente.tipo_calle 
		params['otros_no_carriles']=accidente.num_carriles
		params['otros_sentido_calle']=accidente.sentido_calles
		params['acc_articulos']= self.buildArticulos(accidente.id_unico)
		params['acc_fotos']=  getArrImagenesDeAccidenteUtil(self.request,self.id_unico)
		params['nombre_superviso']=accidente.nombre_superviso
		params['gafete_superviso']=accidente.gafete_superviso
		params['unidad_superviso']=accidente.unidad_superviso
		params['sector_superviso']=accidente.sector_superviso
		params['nombre_intervino']=accidente.nombre_intervino
		params['gafete_intervino']=accidente.gafete_intervino
		params['unidad_intervino']=accidente.unidad_intervino
		params['sector_intervino']=accidente.sector_intervino
 		params['acc_competenciaJudiciales']= self.findCompetenciaJudicial(accidente.id_unico)
		params['acc_saldoSangres']= self.findSaldoSangres(accidente.id_unico)
		params['acc_vehiculos']= self.buildVehiculos(accidente.id_unico)
		c=Context(params)
		res=t.render(c)
		return res
	def getDiccionario(self):
		accidente=Accidentes.objects.get(id_unico__iexact=self.id_unico)
		params={}
		params['id']=accidente.id
		params['id_unico']= accidente.id_unico
		params['acc_croquis']=accidente.croquis
		params['acc_observaciones']= dumps(accidente.observaciones)
		params['acc_investigaciones']= dumps(accidente.investigacion)
		params['acc_folio_infraccion']=accidente.folios_infracciones
		params['acc_folio_accidente']=accidente.id_preliminar
		params['acc_delegacion']=accidente.convenio_delegacion
		params['acc_comandancia']=accidente.convenio_comandancia
		params['acc_turno']=accidente.convenio_turno
		#fecha= datetime.strptime(accidente.convenio_fecha, '%b %d %Y %I:%M%p')
		params['acc_fecha']=accidente.convenio_fecha.strftime('%Y-%m-%d')
		params['acc_hora']=accidente.convenio_hora
		params['acc_clasificacion']=self.buscarClasificacionById(accidente.clasificacion)
		params['acc_tipo_choque']=self.buscarTipoChoqueById(accidente.tipo_choque)
		params['acc_latitud']=accidente.latitud
		params['acc_longitud']=accidente.longitud
		params['acc_calle1']=accidente.calle1
		params['acc_calle2']=accidente.calle2
		params['acc_frentea']=""
		params['acc_colonia']=accidente.colonia
		params['acc_estado']=accidente.estado
		params['acc_municipio']=accidente.ciudad
		params['acc_simbologia_croquis']=dumps(accidente.simbologia)
		params['acc_danos']=self.buildDanos(accidente.id_unico)
		params['estado_calles_alineacion']=accidente.edo_alineacion
		params['estado_calles_estado_pavimento']=accidente.edo_piso
		params['estado_calles_clima']=accidente.edo_clima
		params['estado_calles_regulacion']=accidente.edo_regularizacion
		params['otros_parte_dia}']=""
		params['otros_tipo_calle']=accidente.tipo_calle 
		params['otros_no_carriles']=accidente.num_carriles
		params['otros_sentido_calle']=accidente.sentido_calles
		params['acc_articulos']= self.buildArticulos(accidente.id_unico)
		params['acc_fotos']=  getArrImagenesDeAccidenteUtil(self.request,self.id_unico)
		params['nombre_superviso']=accidente.nombre_superviso
		params['gafete_superviso']= accidente.gafete_superviso
		params['unidad_superviso']=accidente.unidad_superviso
		params['sector_superviso']= accidente.sector_superviso
		params['nombre_intervino']=accidente.nombre_intervino
		params['gafete_intervino']= accidente.gafete_intervino
		params['unidad_intervino']=accidente.unidad_intervino
		params['sector_intervino']= accidente.sector_intervino
 		params['acc_competenciaJudiciales']= self.findCompetenciaJudicial(accidente.id_unico)
		params['acc_saldoSangres']= self.findSaldoSangres(accidente.id_unico)
		params['acc_vehiculos']= self.buildVehiculos(accidente.id_unico)
		return params

	def __init__(self,request,id_unico):
		self.request= request
		self.id_unico= id_unico