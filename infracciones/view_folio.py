from django.shortcuts import render
from infracciones.models import  Block
from infracciones.models import  Infraccion
from infracciones.models import FolioInfraccion
from infracciones.ManagerFolio import ManagerFolio
from infracciones.BuildTree import BuildTree
from accidentes.models  import Profile
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.http import HttpResponse
from json import dumps, loads, JSONEncoder
from django.core import serializers
from django.forms.models import model_to_dict
import logging
from  systra.utils_session import  info
from systra.utils_session import  buildContext
from datetime import date
from django.db.models import Q
log = logging.getLogger(__name__)
def convertir(obj):
	dic= obj.__dict__
	json_serializer=serializers.get_serializer('json')()
	llaves= dic.keys()
	cadena="{"
	for i  in range(len(llaves)):
		llave= llaves[i]
		if llave== "_state":
			continue
		valor= dic[llave]
		newval=''
		if type(valor)== unicode:
			newval=dumps(valor)
			if i==0:
				cadena = cadena +'"'  +llave + '":' +newval+ ''
			else:
				cadena= cadena +',"' +llave + '":' +newval +''
		else:
			newval=str(valor)
			if i==0:
				cadena = cadena +'"'  +llave + '":"' +newval+ '"'
			else:
				cadena= cadena +',"' +llave + '":"' +newval +'"'
	cadena=cadena+"}"
	return cadena
def tojson(objetos):
	arr="["
	for i in range(len(objetos)):
		obj= objetos[i]
		if i==0:
			arr=arr+ convertir(obj)
		else:
			arr=arr+ "," +convertir(obj)
	arr=arr+"]"
	return arr
def list_folios(request):
	contexto= buildContext(request)
	info(log,"INGRESA A  CAPTURAR FOLIOS ",request)
	return render(request,'infracciones/ControlFolio.jade',contexto)
def actualizarFolioByNum_Cobro(num_cobro_agente, folio_infraccion):
	bloques=Block.objects.filter(num_cobro_agente__exact= num_cobro_agente)
	for blo in bloques:
		i= blo.folio_inicial
		f= blo.folio_final
		rango1= range(i,f+1)
		for item in rango1:
			#print "Hablame fuerte"
			if str(item)== folio_infraccion:
				blo= actualizarEntregados(blo,item)
				blo.save()
				return
	return
def json_elem_folios(request):
	bloques= Block.objects.filter(num_cobro_agente__iexact=folio)
	json= tojson(bloques)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200)
def list_comandancia(request, comandancia):
	profiles= Profile.objects.all()
	bt=BuildTree(profiles)
	usuarios=bt.getElementoXComandancia(comandancia)
	for us in usuarios:
		bloques=Block.objects.filter(num_cobro_agente__iexact=us.cobro )
		us.bloques=bloques
	contexto={}
	contexto['comandancia']= comandancia
	contexto['usuarios']= usuarios
	return render(request,'infracciones/folios/list-comandancia.jade',contexto)
def view_elem_folios(request):
	contexto= buildContext(request)
	profiles= Profile.objects.all()
	bt=BuildTree(profiles)
	ctx=bt.buildArbol()
	ctx['todos']= profiles
	ctx.update(contexto)
	return render(request,'infracciones/folios/elem_folios.jade',ctx)

def profile_historial_folios(request,folio):
	profile= Profile.objects.get(cobro__iexact =folio)
	contexto={}
	contexto['profile']=model_to_dict(profile)
	bloques=Block.objects.filter(num_cobro_agente__iexact =folio)
	contexto['bloques']=bloques
	contexto['tam_bloques']=len(bloques)
	return render(request,'infracciones/folios/view-profile-historial-folios.jade',contexto)
def actualizarEntregados(blo,item):
	entregados= blo.entregados
	if entregados== None:
		entregados=''
	r_entregados=entregados.split(",")
	for entr in r_entregados:
		if entr ==item:
			#Lon encontro
			return blo
	r_entregados.append(item)
	cad=','.join(map(str, r_entregados))
	blo.entregados= cad
	return blo
@login_required
def  folios_capturados(request):
	infracciones= Infraccion.objects.all().order_by('folio')
	folios= []
	for inf in infracciones:
		folios.append(str(inf.folio))
	return HttpResponse(dumps(folios),content_type='application/json;charset=utf-8', status=200)	

@login_required
def folios_disponibles(request):
	profile=request.session.get('profile',None)
	if profile== None:
		return
	print profile
	comandancia= profile["comandancia"]
	issuper=profile["superusuario"]
	queries=[]
	if issuper == 0:
		queries.append(Q(comandancia=comandancia))
		queries.append(Q(status="INICIADO"))
	else:
		queries.append(Q(status="INICIADO"))
	query=queries.pop()
	for item in queries:
		query  &= item
	folios = FolioInfraccion.objects.filter(query).order_by('folio')
	
	return HttpResponse(tojson(folios),content_type='application/json;charset=utf-8', status=200)	

def loContiene(r_entregados, elemento):
	for item in r_entregados:
		if item==int(elemento):
			return True
	return False
def remove_block(request, id):
	b= Block.objects.get(id__iexact =id)
	mf= ManagerFolio(b)
	folios= mf.buildFolioSinSave()
	for i in folios:
		try:
			f= FolioInfraccion.objects.get(folio__iexact = i)
			f.delete()
		except:
			print "Error al intentar cargar un folio que no existe"
	res='{"EXITO":"OK"}'
	b.delete()
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)	
@csrf_exempt  
@login_required
def  add_folio(request):
	block_str= request.POST.get('data')
	block= loads(block_str)
	b=Block()
	b.num_cobro_agente=block['folio']
	b.folio_inicial=int(block['desde'])
	b.folio_final=int(block['hasta'])
	b.fecha_recibido=date.today()
	b.activo=1
	mf= ManagerFolio(b)
	repetidos= mf.checkExistentes()
	cad=','
	if len(repetidos)>0:
		rep=cad.join(repetidos)
	 	res='{"status":"ERROR","msg":"Ya existe cargado los siguientes folio %s "}' %rep
		return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
	b.save()
	mf.buildFolios()
	cad= convertir(b)
	res='{"status":"OK","data": ' + cad + ',"msg":""}' 
	return HttpResponse(res,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def  get_blocks_by_folio(request,folio):
	bloques= Block.objects.filter(num_cobro_agente__iexact=folio)
	json= tojson(bloques)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200)
@csrf_exempt
def remove_folio(request,id_block):
	bloque= Block.objects.get(id__iexact=id_block)
	bloque.remove()
	json= tojson(bloques)
	return HttpResponse(json,content_type='application/json;charset=utf-8', status=200) 
def get_history_from_folio(request, folio):
	bloques= Block.objects.filter(num_cobro_agente__iexact=folio)
	contexto['tam_bloques']=len(bloques)
	return render(request,'infracciones/folios/historia-bloques.jade',contexto)
def get_detail_from_folio(request, ident):
	bloque= Block.objects.get(id__exact=ident)
	mf= ManagerFolio(bloque)
	repetidos= mf.getTableFolios()
	contexto={}
	print repetidos
	contexto['tabla']=repetidos
	return render(request,'infracciones/folios/detail-block.jade',contexto)
