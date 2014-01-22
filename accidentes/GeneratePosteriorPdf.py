import time
from reportlab.lib.enums import TA_JUSTIFY
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.enums import *
from reportlab.lib.pagesizes import *
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib.utils import ImageReader
from reportlab.rl_config import defaultPageSize
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.contrib.auth.decorators import login_required
from systra.settings import STATICFILES_DIRS
from accidentes.models import Resource
PAGE_WIDTH=defaultPageSize[0]
PAGE_HEIGHT=defaultPageSize[1]
logo="escudo_transito.jpg"
class GeneratePosteriorPdf:
	def __init__(self,data,ruta):
		self.data= data
		self.ruta= ruta
	def build_pdf(self): 
		doc= SimpleDocTemplate(self.ruta,pagesize=legal,
		                        rightMargin =10,leftMargin=10,
		                        topMargin=72,bottomMargin=18)
		Story=[]
		styles=getSampleStyleSheet()
		styles.add(ParagraphStyle(name='Justify', alignment=TA_JUSTIFY,fontSize=10))
		styles.add(ParagraphStyle(name='Centro', alignment=TA_CENTER))
		styles.add(ParagraphStyle(name='izq', alignment=TA_LEFT))
		styles.add(ParagraphStyle(name='der', alignment=TA_RIGHT))
		styles.add(ParagraphStyle(name='cen_negro', alignment=TA_CENTER,fontSize=14))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		SIMB="SIMBOLOGIA:"
		Story.append(Paragraph(SIMB,styles['izq']))

		SIMBOLOGIA=self.data['simbologia_croquis']
		Story.append(Paragraph(SIMBOLOGIA,styles['Justify']))

		INVESTIGACION="INVESTIGACIONES Y CAUSAS DEL ACCIDENTE"
		Story.append(Spacer(1,12))
		Story.append(Paragraph(INVESTIGACION,styles['cen_negro']))

		INVESTIT="POR LAS INVESTIGACIONES PRACTICADAS Y LLEVADAS A CABO EN EL LUGAR DE LOS HECHOS,LA INSPECCION OCULAR DE LOS VEHICULOS,DEL CAMINO Y SU COMPLEMENTARIAS,EL SUSCRITO DEDUCE QUE EN ESTE ACCIDENTE INTERVINIERON LOS SIGUIENTES FACTORES:"
		Story.append(Paragraph(INVESTIT,styles['Heading5']))

		INVESTIGACION=self.data['investigaciones']
		Story.append(Paragraph(INVESTIGACION,styles['Justify']))
		articulos=self.data['articulos']
		for articulo in articulos:
			art=articulo.get('art',"")
			fracc=articulo.get('fracc',"")
			descc=articulo.get('descc',"")
			Arti='Articulo  <b>%s</b>  Fraccion %s  Descc %s'%(art,fracc,descc)
			Story.append(Spacer(1, 12))
			Story.append(Paragraph(Arti,styles['Justify']))
		doc.build(Story,onFirstPage=self.myFirstPage)
	def myFirstPage(self,canvas, doc):
		canvas.saveState()
		print self.data
		croquis=self.data.get('croquis',None)
		if croquis==None:
			canvas.drawImage(STATICFILES_DIRS[0]+'croquis.jpg',60, PAGE_HEIGHT-220)
		else:
			try:
				numero= croquis.get('id',0)
				recurso=Resource.objects.get(id=numero)
				ruta= recurso.ruta
				img = ImageReader(ruta) 
				canvas.drawImage(img,60, PAGE_HEIGHT-220,width=485,height=340)
			except:
				canvas.drawImage(STATICFILES_DIRS[0]+'croquis.jpg',60, PAGE_HEIGHT-220)
		canvas.drawImage(STATICFILES_DIRS[0]+'rosa_viento.jpg',550, PAGE_HEIGHT+70,width=40,height=40)
		canvas.setFont('Times-Bold',10)
		canvas.drawString(140,PAGE_HEIGHT-110, "")
		canvas.drawString(220,PAGE_HEIGHT+130, "C R O Q U I S")
		canvas.drawString(80,PAGE_HEIGHT-780, "I N T E R V I E N E")
		canvas.drawString(440,PAGE_HEIGHT-780, "S U P E R V I S A")
		tam= PAGE_WIDTH/10
		intervino=self.data.get('intervino',"")
		gafete=intervino.get('gafete',"")
		nombre=intervino.get('nombre',"")
		AGENTE='AGTE: %s . %s'%(gafete,nombre)
		canvas.drawString(tam-30,PAGE_HEIGHT-745, AGENTE)
		superviso=self.data.get('superviso',"")
		gafete=superviso.get('gafete',"")
		nombre=superviso.get('nombre',"")
		SUPERVICION='%s.%s'%(gafete,nombre)
		canvas.drawString(tam+300,PAGE_HEIGHT-745, SUPERVICION)
		unidad=intervino.get('unidad',"")
		UNIDAD='UNIDAD- %s .'%(unidad)
		canvas.drawString(tam+30,PAGE_HEIGHT-765, UNIDAD)
		
		unidad=superviso.get('unidad',"")
		UNIDAD2='UNIDAD- %s  .'%(unidad)
		canvas.drawString(tam+380,PAGE_HEIGHT-765, UNIDAD2)
		

		canvas.setFont('Times-Bold',20)
		folio=self.data.get('folio_accidente',"")
		FOLIO='FOLIO # %s' %(folio)
		canvas.drawString(tam+370,PAGE_HEIGHT+140, FOLIO)
		canvas.line(20,110,240,110)
		canvas.line(350,110,590,110)
		canvas.restoreState()
