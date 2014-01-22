from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.contrib.auth  import authenticate,login
from django.contrib.auth.decorators import login_required
from utils_session import  buildContext
from django.core import serializers
from accidentes.models  import Profile
from json import dumps, loads, JSONEncoder
from django.forms.models import model_to_dict
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
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":' +newval+ ''
			else:
				cadena= cadena +',"' +llave + '":' +newval +''
		else:
			newval=str(valor)
			if i==0 or cadena=="{":
				cadena = cadena +'"'  +llave + '":"' +newval+ '"'
			else:
				cadena= cadena +',"' +llave + '":"' +newval +'"'
	cadena=cadena+"}"
	return cadena


def getProfile(request):
	if not request.session.get['profile']:
		profiles= Profile.objects.filter(cobro__iexact =user.username)
		lista= list(profiles)
		if len(lista) > 0:
			pp=lista[0]

			request.session.set['profile']= model_to_dict(pp)
		else:
			request.session.set['profile']=None
	profile= request.session.set['profile']
	serialized = serializers.serialize("json")
	return HttpResponse(serialized, mimetype='application/json')
def signin(request):
	 return render(request,'signin.jade')
@login_required
def main(request):
	"""print "Licenciada"
	print request
	profiles= Profile.objects.filter(cobro__iexact =user.username)
	lista= list(profiles)
	json_profile=''
	cad=''
	if len(lista) >0:
		profile= profiles[0]
		json_profile=convertir(profile)
		cad= "<script>window.profile=" + json_profile +";</script>"
	"""
	contexto= buildContext(request)
	return render(request,'main.jade',contexto)
def user_disbled(request):
	return render(request,'user_disabled.jade')
def definirView(username):
	permiso={}
	permiso['main']=True
	permiso['cabina']=True

	permiso['accidente']=True
	permiso['list_cabina']=True
	permiso['captura_parte']=True
	permiso['lista_accidente']=True
	permiso['estadistica_mapa']=True

	permiso['infraccion']=True
	permiso['infracciones_captura']=True
	permiso['infracciones_lista']=True
	permiso['infracciones_folios']=True

	permiso['devoluciones']=True
	permiso['devoluciones_devolucion']=True
	permiso['devoluciones_devoluciones']=True
	permiso['devoluciones_liberar']=True
	permiso['admin']=False
	return permiso
@csrf_exempt
def validate_login(request):
	username = request.POST['username']
	password = request.POST['password']
	user = authenticate(username=username, password=password)
	if user is not None:
		if user.is_active:
			login(request,user)
			pps= Profile.objects.filter(cobro__iexact=user.username)
			lista= list(pps)
			permiso=definirView(user.username)
			request.session['permiso-view']=permiso
			if len(lista) > 0:
				pp=lista[0]
				request.session['profile']= model_to_dict(pp)
				#request.session['profile']= lista[0]
			else:
				request.session['profile']= None
			return main(request)
			# Redirect to a success page.
		else:
			# Return a 'disabled account' error message
			return signin(request)
	else:
		# Return an 'invalid login' error message.
		return signin(request)
