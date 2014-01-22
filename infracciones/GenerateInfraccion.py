#-*- coding: utf-8 -*-import time
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
		styles.add(ParagraphStyle(name='Articulo', alignment=TA_JUSTIFY, borderWidth=1,borderColor="#efefef"))
		styles.add(ParagraphStyle(name='Centro', alignment=TA_CENTER))
		styles.add(ParagraphStyle(name='izq', alignment=TA_LEFT))
		styles.add(ParagraphStyle(name='der', alignment=TA_RIGHT))
		articulos=self.data.get('articulos',"")
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
		c= canvas.Canvas("Hola mundo")
		for art in articulos:
			num=art.get("art","")
			fracc=art.get('fracc', "")
			des=art.get('descc',"")
			TEXTO= 'Articulo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>%s</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>%s</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>%s</b>' %(num, fracc, des)
			Story.append(Paragraph(TEXTO,styles['Articulo']))
		Story.append(Spacer(1, 12))
		
		data= [['Hechos que ocurrieron en:', 'LOPEZ MATEOS','Con circulación de',"NORTE A SUR"]]
		ancho=self.por([25,40,20,15])
		t1=Table(data,colWidths=ancho)
		t1.setStyle(TableStyle(
		  [('TEXTCOLOR',(0,0),(0,0),colors.black),
		   ('BACKGROUND', (1, 0), (1, 0), colors.white),
		   ('TEXTCOLOR',(2,0),(2,0),colors.black),
		   ('LINEBELOW', (3, 0), (3, 0),1, colors.black),
		   ('LINEBELOW', (1, 0), (1, 0),1, colors.black),
		   

		   ]
		   )
		)
		t1.hAlign="LEFT"
		 

		data= [['LOS JACALES NTE', 'Referencia','LA REFERENCIA DE LA INFRACCION'],
               ["FRACCIONAMIENTO, COLONIA, COMUNIDAD","","SEÑALAR FRENTE A QUE NUMERO O ENTRE QUE CALLES U OTRO PUNTO DE REFERENCIA"]

		]
		ancho=self.por([40,10,50])
		t2=Table(data,colWidths=ancho)
		t2.setStyle(TableStyle(
		  [('LINEBELOW', (0, 0), (0, 0),1, colors.black),
		   ('LINEBELOW', (2, 0), (2, 0),1, colors.black),
		    ('FONTSIZE', (0, 1), (0, 1), 6),
		    ('FONTSIZE', (2, 1), (2, 1), 6),
		   ]
		   )
		)
		t2.hAlign="LEFT"
		data =[[t1],[t2]]
		ancho=self.por([100])

		t=Table(data,colWidths=ancho)
		t.setStyle(TableStyle(
		  [('BOX', (0, 0), (0, 1),1, colors.black),
		   ]
		   )
		)
		Story.append(t)
		t= self.def_recoje(styles)
		Story.append(t)
		Story.append(Spacer(1, 12))
		t= self.def_certificado(styles)
		Story.append(t)
		doc.build(Story,onFirstPage=self.myFirstPage)
	def def_certificado(self,styles):
		certificado=self.data.get('certificado',"")
		certificado_numero=certificado.get("certificado_numero","")
		ei= certificado.get("ebriedad_incompleta","no")
		ec= certificado.get("ebriedad_completa","no")
		idroga= certificado.get("influjo_droga","no")
		aa= certificado.get("aliento_alcoholico","no")
		normal= certificado.get("aliento_alcoholico","no")
		estado="NORMAL"
		if ei=="si":
			estado ="EBRIEDAD INCOMPLETA"
		if ec=="si":
			estado="EBRIEDAD COMPLETA"
		if idroga=="si":
			estado="INFLUJO DE DROGAS"
		if aa=="si":
			estado="ALIENTO ALCOHOLICO"
		if normal=="si":
			estado="NORMAL"
		cert1="En caso de violacion al articulo 36 del Reglamento de Transito Municipal deLeon, Guanajuato se remitio al conductor ante el Medico legista qien a traves del CERTIFICADO MEDICO"
		cert2="<b>%s</b> determino que el conductor se encontraba %s "%(certificado_numero,estado)
		cert3= "Se recoje el vehiculo infraccionado y se deposita en la pension autorizada que corresponda de conformidad a los(articulos) del reglamento de Transito Municipal de Leon Guanajuato."
		cert4="15 Ultimo parrafo( ) 18 Tercer y Cuarto Parrafo( )   36 Ultimo Parrafo( ) 44 ( )  45 ( )   "
		p1=Paragraph(cert1,styles['izq'])
		p2=Paragraph(cert2,styles['izq'])
		p3=Paragraph(cert3,styles['izq'])
		p4=Paragraph(cert4,styles['Justify'])
		ancho=self.por([100])
		data =[[p1],[p2],[p3],[p4]]
		t2=Table(data,colWidths=ancho)
		t2.setStyle(TableStyle(
		  [('BOX', (0, 0), (0, 3),1, colors.black),
		   ]
		   )
		)

		t2.hAlign="LEFT"
		return t2
		 

	def def_recoje(self,styles):
		fundamento1="Con fundamento en lo dispuesto por el articulo 44 del reglamento de Transito Municipalde Leon Guanajuato para garantizar el cumplimiento de la sancion administrativa que"
		fundamento2="en su caso se proceda, SE RETIENE AL INFRACTOR:"
		p1=Paragraph(fundamento1,styles['izq'])
		p2=Paragraph(fundamento2,styles['izq'])
		se_recoje=self.data.get('se_recoje',"")
		placas=""
		tarjeta=""
		licencia=""
		vehiculo=""
		cortesia=""
		pago_movil=""
		if se_recoje.get("tipo","") == 'PLACAS':
			placas="X"
		if se_recoje.get("tipo","") == 'TARJETA DE CIRCULACION':
			tarjeta="X"
		if se_recoje.get("tipo","") == 'LICENCIA':
			licencia="X"
		if se_recoje.get("tipo","") == 'VEHICULO':
			vehiculo="X"
		if se_recoje.get("tipo","") == 'CORTESIA':
			cortesia="X"
		if se_recoje.get("tipo","") == 'PAGO MOVIL':
			pago_movil="X"

		rr="PLACAS(%s) TARJETA DE CIRCULACIÓN(%s)     LICENCIA(%s)      VEHICULO(%s)    CORTESIA(%s)    PAGO MOVIL(%s) "%(placas,tarjeta,licencia,vehiculo,cortesia,pago_movil)

		p3=Paragraph(rr,styles['Justify'])
		ancho=self.por([100])
		data =[[p1],[p2],[p3]]
		t2=Table(data,colWidths=ancho)
		t2.setStyle(TableStyle(
		  [('BOX', (0, 0), (0, 2),1, colors.black),
		   ]
		   )
		)

		t2.hAlign="LEFT"
		return t2
		 
	def por(self,porcentajes):
		total=0
		w=PAGE_WIDTH-15
		for p in porcentajes:
			total= total+p
		anchos=[]
		for p in porcentajes:
			tmp=p*w/total
			anchos.append(tmp)
		print anchos
		return anchos
	def LabelVehiculo(self,canvas):
		canvas.drawString(470,PAGE_HEIGHT -275, "Tipo:")
		canvas.drawString(300,PAGE_HEIGHT -285, "Modelo:")
		canvas.drawString(430,PAGE_HEIGHT -285, "Color:")
		canvas.drawString(300,PAGE_HEIGHT -295, "Placas:")
		canvas.drawString(430,PAGE_HEIGHT -295, "Serie No:")
		canvas.drawString(300,PAGE_HEIGHT -305, "Empresa:")
		canvas.drawString(470,PAGE_HEIGHT -305, "Tipo:")
		canvas.drawString(12,PAGE_HEIGHT -325, "Estado:")
		canvas.drawString(300,PAGE_HEIGHT -325, "Empresa:")
		canvas.drawString(470,PAGE_HEIGHT -325, "Ruta:")
		canvas.drawString(300,PAGE_HEIGHT -335, "No Economico:")
		canvas.drawString(300,PAGE_HEIGHT -345, "Tarjeton Servicio Publico")
	def LabelConductor(self,canvas):
		canvas.drawString(12,PAGE_HEIGHT -285, "Nombre:")
		canvas.drawString(12,PAGE_HEIGHT -295, "Edad:")
		canvas.drawString(140,PAGE_HEIGHT -295, "Sexo:")
		canvas.drawString(12,PAGE_HEIGHT -305, "Domicilio:")
		canvas.drawString(12,PAGE_HEIGHT -315, "Colonia:")
		canvas.drawString(120,PAGE_HEIGHT -325, "Ciudad:")
		canvas.drawString(12,PAGE_HEIGHT -335, "Licencia de Conducir No:")

	def myFirstPage(self,canvas, doc):
		canvas.saveState()
		canvas.drawImage(STATICFILES_DIRS[0]+'escudo_transito.jpg',35, PAGE_HEIGHT-115)
		canvas.setLineWidth(1)
		canvas.line(10, 723, 600,723)
		canvas.setFont('Times-Roman',8)
		canvas.drawString(10,PAGE_HEIGHT-130, "MUNICIPIO DE LEON GUANAJUATO")
		canvas.drawString(10,PAGE_HEIGHT-142, "SECRETARIA DE SEGURIDAD PUBLICA")
		canvas.drawString(420,PAGE_HEIGHT-142, "ACTA DE INFRACCION No T.")
		
		canvas.setFillColorRGB(1,0,0)
		canvas.setFontSize(18)
		
		folio=self.data.get('folio_infraccion',"")
		
		canvas.drawString(530,PAGE_HEIGHT-142, folio)
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
		canvas.drawString(12,PAGE_HEIGHT -231, str(cobro))
		canvas.setLineWidth(1)
		canvas.line(12, 609, 40,609)
		canvas.setFont('Times-Roman',7.5)

		canvas.drawString(45,PAGE_HEIGHT -231, "expedida por el titular de la Dependencia Municipal. con la cual me identifica. Siendo las")
		canvas.setFont('Times-Bold',7.5)
		hora=self.data.get('hora_infrac',"")

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

		canvas.drawString(495,PAGE_HEIGHT -231, "Del año")
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
		

		self.LabelVehiculo(canvas)
		self.LabelConductor(canvas)
		vehiculo=self.data.get('vehiculo',"")
		if vehiculo !="":
			mar=vehiculo.get('marca',"")
			canvas.drawString(330,PAGE_HEIGHT -275,  mar)
			vehiculo=self.data.get('vehiculo',"")
			sub=vehiculo.get('submarca',"")
			canvas.drawString(500,PAGE_HEIGHT -275, sub)
			#canvas.drawString(500,PAGE_HEIGHT -275, "PICK UP")
			canvas.setFont('Times-Roman',7)
			#canvas.drawString(500,PAGE_HEIGHT -275, "Camioneta")
			canvas.setFont('Times-Bold',7)
			modelo=vehiculo.get('modelo',"")
			canvas.drawString(340,PAGE_HEIGHT -285, modelo)
			canvas.setFont('Times-Roman',7)

			canvas.setFont('Times-Bold',7)
			color=vehiculo.get('color',"")
			canvas.drawString(470,PAGE_HEIGHT -285, color)
			canvas.setFont('Times-Roman',7)

			canvas.setFont('Times-Bold',7)
			placas=vehiculo.get('placas',"")
			canvas.drawString(340,PAGE_HEIGHT -295, placas)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			serie=vehiculo.get('serie',"")
			canvas.drawString(470,PAGE_HEIGHT -295, serie)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			empresa=vehiculo.get('empresa',"")
			canvas.drawString(360,PAGE_HEIGHT -305, empresa)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			tipo_vehiculo=vehiculo.get('tipo_vehiculo',"")
			canvas.drawString(500,PAGE_HEIGHT -305, tipo_vehiculo)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			estado=vehiculo.get('estado',"")
			canvas.drawString(53,PAGE_HEIGHT -325, estado)

			
			canvas.setFont('Times-Bold',7)
			empresa=vehiculo.get('empresa',"")
			canvas.drawString(360,PAGE_HEIGHT -325, empresa)
			
			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)
			ruta=vehiculo.get('ruta','')
			canvas.drawString(500,PAGE_HEIGHT -325, ruta)

			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)
			sub=vehiculo.get('no_economico',"")
			canvas.drawString(370,PAGE_HEIGHT -335, sub)

			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)
			no_tarjeton=vehiculo.get('no_tarjeton',"")
			canvas.drawString(400,PAGE_HEIGHT -345, no_tarjeton)


		infractor=self.data.get('infractor',"")
		if infractor !="":
			
			canvas.setFont('Times-Bold',7)
			nombre=infractor.get('nombre',"")
			canvas.drawString(57,PAGE_HEIGHT -285, nombre)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			edad=infractor.get('edad',"")
			canvas.drawString(57,PAGE_HEIGHT -295, edad)

			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)
			sexo=infractor.get('sexo',"")
			canvas.drawString(170,PAGE_HEIGHT -295, sexo)

			
			canvas.setFont('Times-Bold',7)
			domicilio=infractor.get('domicilio',"")
			canvas.drawString(53,PAGE_HEIGHT -305, domicilio)
			canvas.setFont('Times-Roman',7)

			
			canvas.setFont('Times-Bold',7)
			sub=infractor.get('colonia',"")
			canvas.drawString(53,PAGE_HEIGHT -315, sub)

			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)

			ciudad=infractor.get('ciudad',"")
			canvas.drawString(170,PAGE_HEIGHT -325, ciudad)
			canvas.setFont('Times-Roman',7)
			
			canvas.setFont('Times-Bold',7)
			no_licencia=infractor.get('no_licencia',"")
			canvas.drawString(120,PAGE_HEIGHT -335, no_licencia)
		
		

		
		

		
		"""
	

		## ESTO DEBE DE ESTAR EN ALGUN LADO
		tipo_servicio=self.data.get('tipo_servicio',"")
		canvas.drawString(395,PAGE_HEIGHT -315, tipo_servicio)
		canvas.setFont('Times-Roman',7)

		canvas.setFont('Times-Roman',7)
		canvas.drawString(12,PAGE_HEIGHT -345, "Tipo de Operativo:")
		canvas.setFont('Times-Bold',7)
		sub=self.data.get('tipo_operativo',"")
		canvas.drawString(100,PAGE_HEIGHT -345, sub)

		canvas.setFont('Times-Roman',7)
		canvas.drawString(12,PAGE_HEIGHT -355, "Quien en estos Momentos")
		canvas.setFont('Times-Bold',7)
		sub=self.data.get('firmo',"")
		canvas.drawString(100,PAGE_HEIGHT -355, sub)

		canvas.setFont('Times-Roman',7)
		canvas.drawString(116,PAGE_HEIGHT -355, "se encuentra presente, cometio flagrantemente infraccion a los articulo(s) que se detalla(n) a continuacion")
		canvas.setLineWidth(2)
		##canvas.rect(10, 440, 585, 35)
		canvas.setLineWidth(1)
		
		canvas.line(180, 440, 180,476)
		canvas.drawString(12,PAGE_HEIGHT -374, "Reglamento de Transito para")
		canvas.drawString(12,PAGE_HEIGHT -380, "el municipio de Leon, Guanajuato")
		canvas.drawString(190,PAGE_HEIGHT -378, "Descripcion de los Motivos de la infraccion")
		canvas.setFont('Times-Roman',7)
		
		canvas.setFont('Times-Bold',7)
		dy=585

		canvas.rect(10, dy, 585, 45)

		canvas.drawString(12,PAGE_HEIGHT -dy, " Hechos que ocurrieron en:")
		canvas.setFont('Times-Bold',7)
		
		calle=self.data.get('calle1',"")
		canvas.drawString(200,PAGE_HEIGHT -dy, calle)
		
		canvas.line(190, dy-1, 315,dy-1)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(395,PAGE_HEIGHT -dy, "Con circulacion de:")
		canvas.setFont('Times-Bold',7)
		bar=self.data.get('circulacion',"")
		canvas.drawString(475,PAGE_HEIGHT -dy, bar)

		canvas.setFont('Times-Roman',7)

		canvas.drawString(200,PAGE_HEIGHT -(dy+9), " Calle BOULEVARD / AVENIDA")

		canvas.setFont('Times-Bold',7)
		bar=self.data.get('colonia',"")
		dy=dy+19

		canvas.drawString(73,PAGE_HEIGHT -dy, bar)
		canvas.line(29, dy-40, 150,dy-40)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(190,PAGE_HEIGHT -dy, "Referencia")
		canvas.setFont('Times-Bold',7)
		bar=self.data.get('referencia',"")

		canvas.drawString(320,PAGE_HEIGHT -dy, bar)

		canvas.line(250, dy-40, 400,dy-40)
		canvas.setFont('Times-Roman',7)

		canvas.drawString(23,PAGE_HEIGHT-450, "FRACCIONAMIENTO COLONIA COMUNIDAD")
		canvas.drawString(250,PAGE_HEIGHT-450, "SENALAR FRENTE A QUE NUMERO ENTRE QUE CALLE U OTRO PUNTO DE REFERENCIA")
		canvas.drawString(12,PAGE_HEIGHT-455, "Ubicacion de senalamiento vial (en los casos que proceda)")
		
		
		canvas.drawString(12,PAGE_HEIGHT-480, "Con fundamento en lo dispuesto por el articulo 44 del reglamento de Transito Municipalde Leon Guanajuato para garantizar el cumplimiento de la sancion administrativa que")
		
		canvas.drawString(12,PAGE_HEIGHT -490, "en su caso se proceda, SE RETIENE AL INFRACTOR:")
		se_recoje=self.data.get('se_recoje',"")
		if se_recoje.get('tipo',"") == 'PLACAS':
			canvas.drawString(45,PAGE_HEIGHT -498, "X")	
		canvas.drawString(12,PAGE_HEIGHT -498, "PLACAS  (  )")

		if se_recoje.get('tipo',"") == 'TARJETA DE CIRCULACION':
			canvas.drawString(190,PAGE_HEIGHT -498, "X")
		canvas.drawString(95,PAGE_HEIGHT -498, "TARJETA DE CIRCULACION (    )")

		if se_recoje.get('tipo',"") == 'LICENCIA':
			canvas.drawString(253,PAGE_HEIGHT -498, "X")
		canvas.drawString (215,PAGE_HEIGHT -498,"LICENCIA (     )")

		if se_recoje.get('tipo',"") == 'VEHICULO':
			canvas.drawString(360,PAGE_HEIGHT -498, "X")
		canvas.drawString(320,PAGE_HEIGHT -498, "VEHICULO (    )")

		if se_recoje.get('tipo',"") == 'CORTESIA':
			canvas.drawString(460,PAGE_HEIGHT -498, "X")
		canvas.drawString(420,PAGE_HEIGHT -498, "CORTESIA  (    )")

		
		if se_recoje.get('tipo',"") == 'PAGO MOVIL':
			canvas.drawString(570,PAGE_HEIGHT -498, "X")
		canvas.drawString(520,PAGE_HEIGHT -498, "PAGO MOVIL  (    )")


		canvas.rect(10, 266, 585, 45)
		canvas.drawString(12,PAGE_HEIGHT -538, "En caso de violacion al articulo 36 del Reglamento de Transito Municipal deLeon, Guanajuato se remitio al conductor ante el Medico legista qien a traves del CERTIFICADO MEDICO")
		canvas.drawString(12,PAGE_HEIGHT -546, "NUMERO determino que ")
		print  self.data
		## LA CERTIFICACION NO ESTA EN ESTE MOMENTO
		certificado=self.data.get('certificado',"")
		if certificado['ebriedad_incompleta'] == 'si':
		 	canvas.drawString(105,PAGE_HEIGHT -554, "X" )
		canvas.drawString(15,PAGE_HEIGHT -554, "EBRIEDAD INCOMPLETA (     )" )

		 
		if certificado['ebriedad_completa'] == 'si':
			canvas.drawString(200,PAGE_HEIGHT -554, "X" )
		canvas.drawString(120,PAGE_HEIGHT -554, "EBRIEDAD COMPLETA (     )" )

		 
		if certificado['influjo_droga'] == 'si':
			canvas.drawString(315,PAGE_HEIGHT -554, "X")
		canvas.drawString(220,PAGE_HEIGHT -554, "BAJO INFLUJO DE DROGAS (    )")

		 
		if certificado['aliento_alcoholico'] == 'si':
			canvas.drawString(423,PAGE_HEIGHT -554, "X")
		canvas.drawString(340,PAGE_HEIGHT -554, "ALIENTO ALCOHOLICO (    )")

		## certificado=self.data.get('certificado',"")
		if certificado['normal'] == 'si':
			canvas.drawString(512,PAGE_HEIGHT -554, "X")
		canvas.drawString(450,PAGE_HEIGHT -554, "ESTADO NORMAL(    )")
		
		
		canvas.drawString(12,PAGE_HEIGHT -562, "Se recoje el vehiculo infraccionado y se deposita en la pension autorizada que corresponda de conformidad a los(articulos) del reglamento de Transito Municipal de Leon Guanajuato.")
		canvas.drawString(12,PAGE_HEIGHT -570, "15 Ultimo parrafo(   )")
		canvas.drawString(120,PAGE_HEIGHT -570, "18 Tercer y Cuarto Parrafo(   )")
		canvas.drawString(300,PAGE_HEIGHT -570, "36 Ultimo Parrafo")
		canvas.drawString(395,PAGE_HEIGHT -570, "44 (   )")
		canvas.drawString(470,PAGE_HEIGHT -570, "45 (   )")
		tam= PAGE_WIDTH/3
		"""
		canvas.restoreState()
