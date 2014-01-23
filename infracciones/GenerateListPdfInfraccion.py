from reportlab.lib.enums import TA_JUSTIFY
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.enums import *
from reportlab.lib.pagesizes import *
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image,Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib import colors
from reportlab.rl_config import defaultPageSize
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.contrib.auth.decorators import login_required
from systra.settings import STATICFILES_DIRS
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
PAGE_WIDTH=defaultPageSize[0]
PAGE_HEIGHT=defaultPageSize[1]
logo="escudo_transito.jpg"
class GenerateListPdfInfraccion:
	def __init__(self,data,ruta,profile):
		self.data= data
		self.ruta= ruta
		self.profile=profile
	def por(self,porcentajes):
		total=0
		w=PAGE_WIDTH-15
		for p in porcentajes:
			total= total+p
		anchos=[]
		for p in porcentajes:
			tmp=p*w/total
			anchos.append(tmp)
		return anchos
	def getTextDetalles(self,infraccion):
		detalles= infraccion.detalles.all()
		txt=""
		for det in detalles:
			if txt=="":
				txt=det.articulo
			else:
				txt= txt + "," + det.articulo 
		return txt
	def build_pdf(self):
		doc = SimpleDocTemplate(self.ruta,pagesize=letter,
                        rightMargin=10,leftMargin=10,
                        topMargin=72,bottomMargin=18)
		Story=[]
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		styles=getSampleStyleSheet()
		ancho=self.por([15,15,20,15 ,15,15,15])
		data= [['FOLIO:', 'AGENTE','PLACAS',"ESTADO","ARTICULO","DOC.","SERVICIO"]]
		i=0
		for d in self.data:
			item= []
			item.append(d.folio)
			item.append(d.num_cobro_agente)
			item.append(d.vehiculo.placas)
			item.append(d.vehiculo.estado)
			det= self.getTextDetalles(item)
			item.append(det)
			item.append(d.se_recogio)
			if d.servicio =="Servicio Particular":
				item.append("PART.")
			else:
				item.append("PUB.")
			data.append(item)
			i=i+1
			if i>500:
				break
		t1=Table(data,colWidths=ancho)
		t1.setStyle(TableStyle([('GRID', (0,0), (-1,-1), 0.25, colors.black),
			]))
		t1.hAlign="LEFT"
		Story.append(t1)
		profile
		elaboro="AGENTE %s  %s  "%(profile.cobro,profile.nombre)
		encargado="PUESTO ENCARGARDO DE  LA %s  TURNO (%s)" %(profile.comandancia,profile.turno)
		Story.append(Paragraph(elaboro,styles['Heading4']))
		Story.append(Paragraph(encargado,styles['Heading6']))
		doc.build(Story,onFirstPage=self.myFirstPage)
	def myFirstPage(self,canvas, doc):
		canvas.saveState()
		canvas.drawImage(STATICFILES_DIRS[0]+'escudo_transito.jpg',35, PAGE_HEIGHT-115)
		canvas.setLineWidth(1)
		canvas.line(10, 723, 600,723)
		canvas.setFont('Times-Roman',8)
		canvas.drawString(10,PAGE_HEIGHT-130, "MUNICIPIO DE LEON GUANAJUATO")
		canvas.drawString(10,PAGE_HEIGHT-142, "SECRETARIA DE SEGURIDAD PUBLICA")
		canvas.drawString(420,PAGE_HEIGHT-142, "INFORME DE CAPTURA DE INFRACCIONES")
		canvas.setFillColorRGB(1,0,0)
		canvas.setFontSize(18)
		canvas.setFontSize(10)
		canvas.setFillColorRGB(0,0,0)
		canvas.drawString(10,PAGE_HEIGHT-154, "DIRECCION GENERAL DE TRANSITO MUNICIPAL")
		