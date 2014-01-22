# encoding: UTF-8
from inventarios.models import *
from accidentes.models import TbPensiones
import sys
from datetime import date
from datetime import datetime
reload(sys)
sys.setdefaultencoding("utf-8")
def hacer():
	fname="./bloques.csv"
	lineas=[]
	resultado=[]
	with open(fname) as f:
		lineas = f.readlines()
	for linea in lineas:
		her= linea.split(',')
		res={}
		res['fecha']=her[0]
		res['pension']=her[1]
		res['numero']=her[2]
		res['folio_inicial']= her[3]
		res['folio_final']= her[4]
		res['nombre']=her[5]
		resultado.append(res)
	pensiones= TbPensiones.objects.all()
	for res in resultado:
		bi= BlockInventario()
		bi.nombre_recibido=res['nombre']
		bi.folio_inicial=int(res['folio_inicial'])
		bi.folio_final=int(res['folio_final'])
		ff=getFecha(res['fecha'])
		print "%s = %s"%(res['fecha'],ff)
		bi.fecha_recibido=ff
		bi.usuario="mmejia"
		bi.activo=1
		bi.pension=getPension(res['pension'])
		bi.nombre_recibido=res['nombre']
		bi.save()
def getFecha(fecha):
	return datetime.strptime(fecha,'%d/%m/%Y')
def getPension(nombre):
	pensiones= TbPensiones.objects.filter(nombre_pension=nombre)
	if len(pensiones)==0:
		pension= TbPensiones()
		pension.nombre_pension= nombre
		pension.save()
		return pension
	else:
		return list(pensiones)[0]


	
