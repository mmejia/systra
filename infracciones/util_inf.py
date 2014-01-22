from systra.utils_session import *
from infracciones.models import Detalle
def findArticulosByFolio(folio):
		objetos=Detalle.objects.filter(folio=folio)
		return objetos;
def findDelegacion(request,delegacion):
	delegaciones=getDelegaciones(request)
	for delegacion in delegaciones:
		if delegacion.id== id:
			return delegacion.delegacion
	return ''

def findComandancia(request,comandancia):
	comandancias=getComandancias(request)
	for comandancia in comandancias:
		if comandancia.id== id:
			return comandancia.comandancia
	return ''
def findServicioPublico(servicio):
	if str(id) == "1":
		return "Servicio Particular"
	else: 
		return "Servicio Publico"
