#-*- coding: utf-8 -*-import time
from reportlab.lib.enums import TA_JUSTIFY
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.enums import *
from reportlab.lib.pagesizes import *
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.rl_config import defaultPageSize
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.contrib.auth.decorators import login_required
from systra.settings import STATICFILES_DIRS
PAGE_WIDTH=defaultPageSize[0]
PAGE_HEIGHT=defaultPageSize[1]
logo="escudo_transito.jpg"
class GenerateInfraccionPdf:
	def __init__(self,data,ruta):
		self.data= data
		self.ruta= ruta
	def build_pdf(self): 
		doc = SimpleDocTemplate(self.ruta,pagesize=letter,
                        rightMargin=10,leftMargin=10,
                        topMargin=72,bottomMargin=18)
		Story=[]
 		styles=getSampleStyleSheet()
		styles.add(ParagraphStyle(name='Justify', alignment=TA_JUSTIFY))
		styles.add(ParagraphStyle(name='Centro', alignment=TA_CENTER))
		styles.add(ParagraphStyle(name='izq', alignment=TA_LEFT))
		styles.add(ParagraphStyle(name='der', alignment=TA_RIGHT))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		doc.build(Story,onFirstPage=self.myFirstPage)
	def myFirstPage(self,canvas, doc):
		canvas.saveState()
		canvas.drawImage(STATICFILES_DIRS[0]+'escudo_transito.jpg',35, PAGE_HEIGHT-100)
		canvas.setLineWidth(1)
		canvas.line(10, 723, 600,723)
		canvas.setFont('Times-Roman',8)
		canvas.drawString(10,PAGE_HEIGHT-130, "MUNICIPIO DE LEON GUANAJUATO")
		canvas.drawString(10,PAGE_HEIGHT-142, "SECRETARIA DE SEGURIDAD PUBLICA")
		canvas.drawString(420,PAGE_HEIGHT-142, "ACTA DE INFRACCION No T.")
		#canvas.setFontColorRGB(1,0,0
		canvas.setFillColorRGB(1,0,0)
		#canvas.setFontColor(1,0,0,)
		canvas.setFontSize(18)
		folio=self.data.get('folio_infraccion',"")
		canvas.drawString(550,PAGE_HEIGHT-142, folio)
		canvas.setFontSize(10)
		canvas.setFillColorRGB(0,0,0)
		

		canvas.drawString(10,PAGE_HEIGHT-154, "DIRECCION GENERAL DE TRANSITO MUNICIPAL")
		canvas.setFont('Times-Roman',7.5)
		fundamento='Con fundamento en los artículos 16 de la  Constitución Política de los Estados Unidos '
		fundamento=fundamento + '  Mexicanos 4 de la Ley Orgánica Municipal para el Estado de Guanajuato1,2,3,4,fracción 1X 42,44 y 47 del'
		canvas.drawString(10,PAGE_HEIGHT-178, fundamento)
		canvas.drawString(10,PAGE_HEIGHT-190, "reglamento de Tránsito Municipal de Léon,  Guanajuato se procede a levantar la presente.")
		canvas.drawString(330,PAGE_HEIGHT-190, "ACTA DE INFRACCION")
		#canvas.setFillColorRGB(0,0,0)
		#canvas.setFillColorCMYK(1,1,0,0)
		canvas.rect(10, 600, 583, 35)
		canvas.drawString(12,PAGE_HEIGHT -213, "EN LEON. Guanajuato, el suscrito")
		canvas.setFont('Times-Bold',7)

		canvas.drawString(170,PAGE_HEIGHT -213, "AGENTE")
		canvas.setFont('Times-Roman',7.5)																																																																																																																																																																																																																																																										
		canvas.drawString(250,PAGE_HEIGHT -213, "de nombre")
		canvas.setStrokeColorRGB(0,0,0)
		canvas.setLineWidth(1)
		canvas.line(300, 627, 430,627)
		canvas.setFont('Times-Bold',7)
		nombre=self.data.get('nombreAgente',"")
		canvas.drawString(300,PAGE_HEIGHT -213, nombre)
		canvas.setFont('Times-Roman',7.5)
		canvas.drawString(525,PAGE_HEIGHT -213, "adscrito a la")
		canvas.setFont('Times-Bold',7.5)

		canvas.drawString(12,PAGE_HEIGHT -222, "PRIMERA COMANDANCIA")
		canvas.drawString(130,PAGE_HEIGHT -222, "TURNO A")
		canvas.drawString(180,PAGE_HEIGHT -222, "DELEGACION PONIENTE")
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(280,PAGE_HEIGHT -222, " de la Direccion de Transito municipal de Leon  Guanajuato como consta en la ")
		canvas.setFont('Times-Bold',7.5)
		
		canvas.drawString(525,PAGE_HEIGHT -222, "CREDENCIAL")
		cobro=self.data.get('noCobro',"")
		canvas.drawString(12,PAGE_HEIGHT -231, cobro)
		canvas.setLineWidth(1)
		canvas.line(12, 609, 40,609)
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(45,PAGE_HEIGHT -231, "expedida por el titular de la Dependencia Municipal. con la cual me identificasiendo las")
		canvas.setFont('Times-Bold',7.5)
		hora=self.data.get('hora',"")

		canvas.drawString(318,PAGE_HEIGHT -231, hora)
		canvas.setLineWidth(1)
		canvas.line(318, 609, 337,609)
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(350,PAGE_HEIGHT -231, "Horas del dia")
		canvas.setFont('Times-Bold',7.5)
		canvas.drawString(398,PAGE_HEIGHT -231, "24")
		canvas.setLineWidth(1)
		canvas.line(395, 609, 407,609)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(413,PAGE_HEIGHT -231, "del mes de")
		canvas.setFont('Times-Bold',7)

		canvas.drawString(453,PAGE_HEIGHT -231, "OCTUBRE")
		canvas.setLineWidth(1)
		canvas.line(450, 609, 493,609)
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(495,PAGE_HEIGHT -231, "Del ano")
		canvas.setFont('Times-Bold',7.5)

		canvas.drawString(525,PAGE_HEIGHT -231, "2013")
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(12,PAGE_HEIGHT -240, "Hago constar que el conductor de vehiculo cuyos  datos se especifican a continuacion:")
		canvas.rect(10, 575, 585, 10)
		canvas.rect(10, 495, 585, 80)
		canvas.setLineWidth(1)
		canvas.line(10, 565, 595,565)
		canvas.line(10, 555, 595,555)
		canvas.line(10, 545, 595,545)
		canvas.line(10, 535, 595,535)
		canvas.line(10, 525, 595,525)
		canvas.line(10, 515, 595,515)
		canvas.line(10, 505, 595,505)
		canvas.line(295, 495, 295,585)
		canvas.drawString(135,PAGE_HEIGHT -265, "Datos Personales")
		canvas.drawString(395,PAGE_HEIGHT -265, "Caracteristicas de Vehiculo")
		canvas.drawString(300,PAGE_HEIGHT -275, "Marca:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		mar=vehiculo['marca']
		canvas.drawString(330,PAGE_HEIGHT -275,  mar)

		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo['submarca']
		canvas.drawString(500,PAGE_HEIGHT -275, sub)
		#canvas.drawString(500,PAGE_HEIGHT -275, "PICK UP")
		canvas.setFont('Times-Roman',7)
		canvas.drawString(470,PAGE_HEIGHT -275, "Tipo:")
		#canvas.drawString(500,PAGE_HEIGHT -275, "Camioneta")


		canvas.drawString(12,PAGE_HEIGHT -285, "Nombre:")
		canvas.setFont('Times-Bold',7)

		infractor=self.data.get('infractor',"")
		sub=infractor['nombre']
		canvas.drawString(57,PAGE_HEIGHT -285, sub)
		canvas.setFont('Times-Roman',7)
		
		canvas.drawString(300,PAGE_HEIGHT -285, "Modelo:")

		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo['modelo']
		canvas.drawString(340,PAGE_HEIGHT -285, sub)
		canvas.setFont('Times-Roman',7)
		canvas.drawString(430,PAGE_HEIGHT -285, "Color:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo['color']
		canvas.drawString(470,PAGE_HEIGHT -285, sub)
		canvas.setFont('Times-Roman',7)
		canvas.drawString(12,PAGE_HEIGHT -295, "Edad:")
		canvas.setFont('Times-Bold',7)
		infractor=self.data.get('infractor',"")
		sub=infractor['edad']
		canvas.drawString(57,PAGE_HEIGHT -295, sub)
		canvas.setFont('Times-Roman',7)
		canvas.drawString(140,PAGE_HEIGHT -295, "Sexo:")
		canvas.setFont('Times-Bold',7)
		infractor=self.data.get('infractor',"")
		sub=infractor.get('sexo',"")
		canvas.drawString(170,PAGE_HEIGHT -295, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(300,PAGE_HEIGHT -295, "Placas:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo.get('placas',"")
		canvas.drawString(340,PAGE_HEIGHT -295, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(430,PAGE_HEIGHT -295, "Serie No:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo['serie']
		canvas.drawString(470,PAGE_HEIGHT -295, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(12,PAGE_HEIGHT -305, "Domicilio:")
		canvas.setFont('Times-Bold',7)
		infractor=self.data.get('infractor',"")
		sub=infractor.get('domicilio',"")
		canvas.drawString(53,PAGE_HEIGHT -305, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(300,PAGE_HEIGHT -305, "Empresa:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo.get('empresa',"")
		canvas.drawString(360,PAGE_HEIGHT -305, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(470,PAGE_HEIGHT -305, "Tipo:")
		canvas.setFont('Times-Bold',7)
		vehiculo=self.data.get('vehiculo',"")
		sub=vehiculo.get('tipo_vehiculo',"")
		canvas.drawString(500,PAGE_HEIGHT -305, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(12,PAGE_HEIGHT -315, "Colonia:")
		canvas.setFont('Times-Bold',7)
		infractor=self.data.get('infractor',"")
		sub=infractor.get('colonia',"")
		canvas.drawString(53,PAGE_HEIGHT -315, sub)
		sub=self.data.get('tipo_servicio',"")
		canvas.drawString(395,PAGE_HEIGHT -315, sub)
		
		canvas.drawString(12,PAGE_HEIGHT -325, "Estado:")
		canvas.setFont('Times-Bold',7)
		sub=vehiculo['estado']

		canvas.drawString(53,PAGE_HEIGHT -325, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(120,PAGE_HEIGHT -325, "Ciudad:")
		canvas.setFont('Times-Bold',7)
		sub=infractor['ciudad']

		canvas.drawString(170,PAGE_HEIGHT -325, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(300,PAGE_HEIGHT -325, "Empresa:")
		canvas.setFont('Times-Bold',7)
		sub=vehiculo['empresa']

		canvas.drawString(360,PAGE_HEIGHT -325, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(470,PAGE_HEIGHT -325, "Ruta:")
		canvas.setFont('Times-Bold',7)
		sub=vehiculo['ruta']

		canvas.drawString(500,PAGE_HEIGHT -325, sub)
		canvas.setFont('Times-Roman',7)
		canvas.drawString(12,PAGE_HEIGHT -335, "Licencia de Conducir No:")
		canvas.setFont('Times-Bold',7)
		sub=infractor.get('no_licencia',"")

		canvas.drawString(120,PAGE_HEIGHT -335, sub)
		canvas.setFont('Times-Roman',7)
		
		canvas.drawString(300,PAGE_HEIGHT -335, "No Economico:")
		canvas.setFont('Times-Bold',7)
		sub=vehiculo.get('no_economico',"")

		canvas.drawString(370,PAGE_HEIGHT -335, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(12,PAGE_HEIGHT -345, "Tipo de Operativo:")
		canvas.setFont('Times-Bold',7)
		sub=self.data.get('tipo_operativo',"")

		canvas.drawString(100,PAGE_HEIGHT -345, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(300,PAGE_HEIGHT -345, "Tarjeton Servicio Publico")
		canvas.setFont('Times-Bold',7)
		sub=vehiculo.get('no_tarjeton',"")
		
		canvas.drawString(400,PAGE_HEIGHT -345, sub)
		canvas.setFont('Times-Roman',7)
		
		canvas.drawString(12,PAGE_HEIGHT -355, "Quien en estos Momentos")
		canvas.setFont('Times-Bold',7)
		sub=self.data.get('firmo',"")
		canvas.drawString(100,PAGE_HEIGHT -355, sub)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(116,PAGE_HEIGHT -355, "se encuentra presente, cometio flagrantemente infraccion a los articulo(s) que se detalla(n) a continuacion")
		canvas.setLineWidth(2)
		canvas.rect(10, 440, 585, 35)
		canvas.setLineWidth(1)
		canvas.line(10, 458, 590,458)
		canvas.line(180, 440, 180,476)
		canvas.drawString(12,PAGE_HEIGHT -374, "Reglamento de Transito para")
		canvas.drawString(12,PAGE_HEIGHT -380, "el municipio de Leon, Guanajuato")
		canvas.drawString(190,PAGE_HEIGHT -378, "Descripcion de los Motivos de la infraccion")
		canvas.setFont('Times-Roman',7)
		canvas.drawString(12,PAGE_HEIGHT -394, "articulo")
		canvas.setFont('Times-Bold',7)

		articulos=self.data.get('articulos',"")
		for art in articulos:
			num=art['art']
			canvas.drawString(50,PAGE_HEIGHT -394, num)
			canvas.drawString(190,PAGE_HEIGHT -392, "Respetar los limites de velocidad establecidos en los senalamientos oficiales y a falta de estas, se deberan sujetar a las normas siguientes")
			canvas.drawString(190,PAGE_HEIGHT -399, " siguientes")
		
		canvas.rect(10, 385, 585, 45)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(12,PAGE_HEIGHT -421, " Hecos que ocurrieron en:")
		canvas.setFont('Times-Bold',7)
		
		calle=self.data.get('calle1',"")
		canvas.drawString(200,PAGE_HEIGHT -421, calle)
		
		canvas.line(190, 420, 315,420)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(395,PAGE_HEIGHT -421, "Con circulacion de:")
		canvas.setFont('Times-Bold',7)
		bar=self.data.get('circulacion',"")
		canvas.drawString(475,PAGE_HEIGHT -421, bar)

		canvas.setFont('Times-Roman',7)

		canvas.drawString(200,PAGE_HEIGHT -430, " Calle BOULEVARD / AVENIDA")
		canvas.drawString(12,PAGE_HEIGHT -440, "de la")
		canvas.setFont('Times-Bold',7)
		bar=self.data.get('colonia',"")

		canvas.drawString(73,PAGE_HEIGHT -440, bar)
		canvas.line(29, 400, 150,400)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(190,PAGE_HEIGHT -440, "Referencia")
		canvas.setFont('Times-Bold',7)
		bar=self.data.get('referencia',"")

		canvas.drawString(320,PAGE_HEIGHT -440, bar)

		canvas.line(250, 400, 400,400)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(23,PAGE_HEIGHT -450, "FRACCIONAMIENTO COLONIA COMUNIDAD")
		canvas.drawString(250,PAGE_HEIGHT -450, "SENALAR FRENTE A QUE NUMEROENTRE QUE CALLE U OTRO PUNTO DE REFERENCIA")
		canvas.drawString(12,PAGE_HEIGHT -455, "Ubicacion de senalamiento vial (en los casos que proceda)")
		canvas.rect(10, 323, 585, 45)
		canvas.drawString(12,PAGE_HEIGHT -480, "Con fundamento en lo dispuesto por el articulo 44 del reglamento de Transito Municipalde Leon Guanajuato para garantizar el cumplimiento de la sancion administrativa que")
		
		canvas.drawString(12,PAGE_HEIGHT -490, "en su caso se proceda, SE RETIENE AL INFRACTOR:")
		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'LICENCIA':
			canvas.drawString(50,PAGE_HEIGHT -498, "X")	
		canvas.drawString(12,PAGE_HEIGHT -498, "LICENCIA  (  )")

		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'TARGETA DE CIRCULACION':
			canvas.drawString(256,PAGE_HEIGHT -498, "X")
		canvas.drawString(160,PAGE_HEIGHT -498, "TARGETA DE CIRCULACION (  )")

		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'PLACAS':
			canvas.drawString(371,PAGE_HEIGHT -498, "X")
		canvas.drawString (340,PAGE_HEIGHT -498,"PLACAS (   )")

		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'VEHICULO':
			canvas.drawString(509,PAGE_HEIGHT -498, "X")
		canvas.drawString(470,PAGE_HEIGHT -498, "VEHICULO (  )")

		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'CORTESIA':
			canvas.drawString(51,PAGE_HEIGHT -506, "X")
		canvas.drawString(12,PAGE_HEIGHT -506, "CORTESIA  (  )")

		se_recoje=self.data.get('se_recoje',"")
		if se_recoje['tipo'] == 'PAGO MOVIL':
			canvas.drawString(61,PAGE_HEIGHT -514, "X")
		canvas.drawString(12,PAGE_HEIGHT -514, "PAGO MOVIL  (  )")


		canvas.rect(10, 266, 585, 45)
		canvas.drawString(12,PAGE_HEIGHT -538, "En caso de violacional articulo 36 del Reglamento de Transito Municipal deLeon, Guanajuato se remitio al conductor ante el Medico legista qien a traves del CERTIFICADO MEDICO")
		canvas.drawString(12,PAGE_HEIGHT -546, "NUMERO determino que conducia el vehiculo")

		certificado=self.data.get('certificado',"")
		if certificado['ebriedad_incompleta'] == 'si':
			canvas.drawString(149,PAGE_HEIGHT -554, "X")
		canvas.drawString(12,PAGE_HEIGHT -554, "EN ESTADO DE EBRIEDAD INCOMPLETA (  )")


		certificado=self.data.get('certificado',"")
		if certificado['ebriedad_completa'] == 'no':
			canvas.drawString(290,PAGE_HEIGHT -554, "X" )
		canvas.drawString(160,PAGE_HEIGHT -554, "EN ESTADO DE EBRIEDAD COMPLETA (  )" )

		certificado=self.data.get('certificado',"")
		if certificado['influjo_droga'] == 'no':
			canvas.drawString(572,PAGE_HEIGHT -554, "X")
		canvas.drawString(301,PAGE_HEIGHT -554, "BAJO EL INFLUJO DE SUSTANCIAS PSICOTROPICAS, ESTUPEFACIENTES U OTRAS (  )")
		
		
		canvas.drawString(12,PAGE_HEIGHT -562, "Se recoje el vehiculo infraccionado y se deposita en la pension autorizada que corresponda de conformidad a los(articulos) del reglamento de Transito Municipal de Leon Guanajuato.")
		canvas.drawString(12,PAGE_HEIGHT -570, "15 Ultimo parrafo(   )")
		canvas.drawString(120,PAGE_HEIGHT -570, "18 Tercer y Cuarto Parrafo(   )")
		canvas.drawString(300,PAGE_HEIGHT -570, "36 Ultimo Parrafo")
		canvas.drawString(395,PAGE_HEIGHT -570, "44 (   )")
		canvas.drawString(470,PAGE_HEIGHT -570, "45 (   )")
		tam= PAGE_WIDTH/3
		canvas.restoreState()
