from django.shortcuts import render

# Create your views here.

def cat_color_captura(request):
	return render(request,'/catalogos/color/captura.jade',contexto)
