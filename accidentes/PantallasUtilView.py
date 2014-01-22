from django.http import HttpResponse
from django.shortcuts import render

def pantalla_cancelar_preliminar(request):
	return render(request,'accidentes/accidentes/pantallas/cancelar_preliminar.jade')