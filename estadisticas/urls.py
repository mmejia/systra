#-*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls.defaults import *

from views import calles_conflictivas 
urlpatterns = patterns("",
	url(r'^estadisticas/accidentes/calles_conflictivas.json$',calles_conflictivas,name='listMps'),
)