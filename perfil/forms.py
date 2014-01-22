from django import forms
from accidentes.models import  Profile

class PerfilForm(forms.ModelForm):
	def __init__(self, *args, **kwargs):
		super(PerfilForm, self).__init__(*args, **kwargs)
		#COMANDANCIAS=(('PRIMERA','PRIMERA'),("SEGUNDA","SEGUNDA"))
		#self.fields['comandancia'].choices = COMANDANCIAS
		for key, campo in self.fields.iteritems():
			campo.widget.attrs.update({'class' : 'input'})
		#self.fields['comandancia'].choices = COMANDANCIAS
		

	#COMANDANCIAS=(('PRIMERA','PRIMERA'),("SEGUNDA","SEGUNDA"))
	#widget=forms.TextInput()
	class Meta:
		model=Profile