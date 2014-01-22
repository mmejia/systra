class BuildTree:
	def __init__(self,profiles):
		self.profiles=profiles
		self.comandancia4= []
		self.comandancia10= []
		self.feria= []
		self.comandancia5= []
		self.comandancia7= []
		self.comandancia6= []
		self.comandancia3= []
		self.comandancia9= []
		self.comandancia8= []
		self.comandancia1= []
		self.comandancia2= []
	def getElementoXComandancia(self,comandancia):
		lista=[]
		for p in self.profiles:
			if p.comandancia== comandancia:
				lista.append(p)
		return lista
	def buildArbol(self):
		for p in self.profiles:
			if p.comandancia== '4TA':
				self.comandancia4.append(p)
			if p.comandancia== '10MA':
				self.comandancia10.append(p)
			if p.comandancia== 'FERIA':
				self.feria.append(p)
			if p.comandancia== '5TA':
				self.comandancia5.append(p)
			if p.comandancia== '7MA':
				self.comandancia7.append(p)
			if p.comandancia== '6TA':
				self.comandancia6.append(p)
			if p.comandancia== '3RA':
				self.comandancia3.append(p)
			if p.comandancia== '9NA':
				self.comandancia9.append(p)
			if p.comandancia== '8VA':
				self.comandancia8.append(p)
			if p.comandancia== '1RA':
				self.comandancia1.append(p)
			if p.comandancia== '2DA':
				self.comandancia2.append(p)
		contexto={}
		contexto['C4TA']=self.comandancia4
		contexto['C10MA']=self.comandancia10
		contexto['CFERIA']=self.feria
		contexto['C5TA']=self.comandancia5 
		contexto['C7MA']=self.comandancia7 
		contexto['C6TA']=self.comandancia6 
		contexto['C3RA']=self.comandancia3 
		contexto['C9NA']=self.comandancia9 
		contexto['C8VA']=self.comandancia8 
		contexto['C1RA']=self.comandancia1 
		contexto['C2DA']=self.comandancia2 
		return contexto
