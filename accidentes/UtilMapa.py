from accidentes.models import PuntosAccidentes
from json import *
def getPuntos(fechai,fechaf):
	queryset=PuntosAccidentes.objects.filter(fecha__range=[fechai,fechaf])
	lista= list(queryset)
	todos=[]
	print fechai
	print fechaf
	if len(lista)>0:
		for item in lista:
			accidentes=loads(item.accidentes)
			#print accidentes
			todos.extend(accidentes)
		#print  todos
		return dumps(todos)
	else:
		return []



