from django.views.generic.list import ListView
from perfil.models import Perfil
class PerfilListView(ListView):
	model = Perfil
	template_name='perfil/list.jade'
	paginate_by = 20
	allow_empty = True
	
