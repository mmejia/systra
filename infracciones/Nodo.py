class Nodo:
	def __init__self(tipo,nombre, data):
		self.nombre= nombre
		self.tipo= tipo
		self.data= data
		self.hijos=[]
		self.padre=None
	def addChild(self, nodo):
		sel.hijos.append(nodo)
