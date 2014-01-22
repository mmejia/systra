from accidentes.models import FolioInfraccion
from accidentes.models import Profile
from datetime import date
class ManagerFolio:
	def __init__(self,block):
		self.block= block
	def checkExistentes(self):
		all_folios=FolioInfraccion.objects.all().order_by('folio')
		inicial= self.block.folio_inicial
		final= self.block.folio_final
		repetidos=[]
		rango1= range(inicial,final+1)
		for folio in all_folios:
			for item in rango1:
				if item == folio.folio:
					repetidos.append(str(item))
		return repetidos
	def buildFolioSinSave(self):
		inicial= self.block.folio_inicial
		final= self.block.folio_final
		rango1= range(inicial,final+1)
		return rango1
	def buildFolios(self):
		inicial= self.block.folio_inicial
		final= self.block.folio_final
		rango1= range(inicial,final+1)
		folios=[]
		num_cobro_agente= self.block.num_cobro_agente
		pps= Profile.objects.filter(cobro__iexact=num_cobro_agente)
		lista= list(pps)
		profile=None
		if len(lista) > 0:
			profile=lista[0]
		else:
			return
		for item in rango1:
			folio= FolioInfraccion()
			folio.folio= item
			folio.block= self.block.id
			folio.comandancia=profile.comandancia
			folio.delegacion= profile.delegacion
			folio.turno= profile.turno
			folio.fecha_liberacion=date.today()
			folio.status="INICIADO"
			folio.save()
	def getTableFolios(self):
		folios=FolioInfraccion.objects.filter(block__iexact= self.block.id)
		tam=10
		matriz= self.chunks(folios,tam)
		return matriz
	def chunks(self,l,n):
		return [l[i:i+n] for i in range(0, len(l), n)]
