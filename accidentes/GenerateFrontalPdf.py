import time
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
from datetime import datetime
PAGE_WIDTH=defaultPageSize[0]
PAGE_HEIGHT=defaultPageSize[1]
logo="escudo_transito.jpg"
class GenerateFrontalPdf:
	def __init__(self,data,ruta):
		self.data= data
		self.ruta= ruta
	def build_pdf(self): 
		doc = SimpleDocTemplate(self.ruta,pagesize=legal,
	                        rightMargin=10,leftMargin=10,
	                        topMargin=72,bottomMargin=18)
		Story=[]
		styles=getSampleStyleSheet()
		styles.add(ParagraphStyle(name='Justify', alignment=TA_JUSTIFY))
		styles.add(ParagraphStyle(name='Centro', alignment=TA_CENTER))
		styles.add(ParagraphStyle(name='izq', alignment=TA_LEFT))
		styles.add(ParagraphStyle(name='der', alignment=TA_RIGHT))
		styles.add(ParagraphStyle(name='cen_negro', alignment=TA_CENTER,fontSize=11))
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))
		direccion="C.DIRECTOR DE TRANSITO MUNICIPAL"
		Story.append(Paragraph(direccion,styles['Heading3']))
		direccion="P R E S E N T E:"
		Story.append(Paragraph(direccion,styles['Heading3']))
		
		fecha=self.data['fecha']
		dt = datetime.strptime(fecha, "%Y-%m-%d")
		dateformat = dt.strftime(" %d    DE   %B   DEL    %Y")  

		FECHA="LEON,GTO.A   %s   "%(dateformat)
		Story.append(Spacer(1, 12))
		Story.append(Spacer(1, 12))


		Story.append(Paragraph(FECHA,styles['der']))
		hora=self.data['hora']
		clasificacion=self.data['clasificacion']
		tipo_choque=self.data['tipo_choque']



		ANTECEDENTES='ANTECEDENTES: ME PERMITO PONER EN CONOCIMIENTO \
		DE USTED,QUE EL DIA DE HOY SIENDO APROXIMADAMENTE LAS   <b><u>%s</u></b> HRS,SE \
		REGISTRO HECHO DE TRANSITO   <b><u>%s</u></b>  CON  DINAMICA DE COLISION <b><u>%s</u></b>' %(hora,clasificacion,tipo_choque)
		Story.append(Spacer(1,12))
		Story.append(Spacer(1, 12))


		Story.append(Paragraph(ANTECEDENTES,styles['Justify']))
		calle1=self.data['calle1']
		calle2=self.data['calle2']
		#calle3=self.data['calle3']
		colonia=self.data['colonia']
		Story.append(Spacer(1,12))
		LUGAR='EN LA  (S) CALLE   (S)   <b><u>%s</u></b>       Y       <b><u>%s</u></b>     COL         <b><u>%s</u></b>'%(calle1,calle2,colonia) 


		Story.append(Paragraph(LUGAR,styles['Justify']))
		Story.append(Spacer(1,12))
		vehiculos=self.data['vehiculos']
		for vehiculo in vehiculos:
			intervino_como=vehiculo['intervino_como']
			clas_vehiculo=vehiculo['clas_vehiculo']
			marca=vehiculo['marca']
			submarca=vehiculo['submarca']
			modelo=vehiculo['modelo']
			tipo=vehiculo['tipo']
			placa=vehiculo['placa']
			serie=vehiculo['serie']
			num_economico=vehiculo['num_economico']
			capacidad=vehiculo['capacidad']
			color=vehiculo['color']
			dueno_nombre=vehiculo['dueno_nombre']
			dueno_calle=vehiculo['dueno_calle']
			dueno_colonia=vehiculo['dueno_colonia']
			conductor_nombre=vehiculo['conductor_nombre']
			conductor_edad=vehiculo['conductor_edad']
			conductor_calle=vehiculo['conductor_calle']
			conductor_colonia=vehiculo['conductor_colonia']
			conductor_num_licencia=vehiculo['conductor_num_licencia']
			conductor_edo_licencia=vehiculo['conductor_edo_licencia']
			conductor_fecha_vigencia=vehiculo['conductor_fecha_vigencia']
			clas_vehiculos=vehiculo['clas_vehiculo']
			VEHICULO='(<b><u>%s</u></b>)  <b><u>%s</u></b>  MARCA  <b><u>%s</u></b> \
			MODELO   <b><u>%s</u></b> \
			TIPO   <b><u>%s</u></b>   CAPACIDAD   <b><u>%s</u></b>  \
			SERIE   <b><u>%s</u></b>  COLOR     <b><u>%s</u></b>  \
			ECON   <b><u>%s</u></b>   PLACAS <b><u>%s</u></b>  \
			PROPIEDAD   <b><u>%s</u></b>   DOMICILIO   <b><u>%s</u></b> \
			COL   <b><u>%s</u></b>   CONDUCIDO POR   <b><u>%s</u></b> \
			EDAD    <b><u>%s</u></b>    DOMICILIO   <b><u>%s</u></b>   COL   \
			<b><u>%s</u></b>   LICENCIA N.   <b><u>%s</u></b>  EXP   <b><u>%s</u></b> \
			VIGENCIA    <b><u>%s</u></b> '%(intervino_como,clas_vehiculo,
			marca,modelo,tipo,capacidad,serie,color,
			num_economico,placa,dueno_nombre,
			dueno_calle,dueno_colonia,conductor_nombre,
			conductor_edad,conductor_calle,conductor_colonia,
			conductor_num_licencia,conductor_edo_licencia,
			conductor_fecha_vigencia)
			Story.append(Spacer(1,12))

			Story.append(Paragraph(VEHICULO,styles['Justify']))

		saldo="SALDO DE SANGRE:EN EL PRESENTE ACCIDENTE RESULTO LESIONADO (A):"
		Story.append(Paragraph(saldo,styles['Heading3']))
		saldoSangres=self.data['saldoSangres']
		for saldo in saldoSangres:
			nombre=saldo['nombre']
			edad=saldo['edad']
			nacionalidad=saldo.get('nacionalidad', "")
			domicilio=saldo.get('domicilio', "")
			levantado_por=saldo.get('levantado_por', "")
			trasladado_a=saldo.get('trasladado_a', "")
			disposicion=saldo.get('disposicion', "")
			se_encontraba=saldo.get('se_encontraba', "")	
			LESIONADO="NOMBRE  <b><u>%s</u></b>  EDAD  <b><u>%s</u></b>  NACIONALIDAD  <b><u>%s</u></b> \
			DOMICILIO  <b><u>%s</u></b>  LEVANTADO POR  <b><u>%s</u></b>\
			TRASLADADO A  <b><u>%s</u></b>  A DISPOSICION DE <b><u>%s</u></b> ESTA PERSONA SE \
			ENCONTRABA  <b><u>%s</u></b>"%(nombre,edad,nacionalidad,domicilio,levantado_por,trasladado_a,disposicion,se_encontraba)
			Story.append(Spacer(1,12))
			Story.append(Paragraph(LESIONADO,styles['Justify']))
		presentado="CONDUCTOR (ES) PRESENTADO (S) AL OFICIAL CALIFICADOR EN TURNO:"
		Story.append(Paragraph(presentado,styles['Heading3']))
		competenciaJudiciales=self.data['competenciaJudiciales']
		for dis in competenciaJudiciales:
			nombre=dis['nombre']
			disposicion=dis['disposicion']
			DISPOSICION="EL CONDUCTOR   <b><u>%s</u></b>   QUEDO A DISPOSICION DE:   <b><u>%s</u></b>"%(nombre,disposicion)
			Story.append(Spacer(1,12))
			Story.append(Paragraph(DISPOSICION,styles['Justify']))

		COMPLE=" C O M P L E M E N T A R I O S"
		Story.append(Spacer(1,12))
		Story.append(Paragraph(COMPLE,styles['cen_negro']))
		ESTADO="ESTADO FISICO DE LOS VEHICULOS DESPUES DEL ACCIDENTE:"
		Story.append(Paragraph(ESTADO,styles['cen_negro']))
		OBSER=self.data['observaciones']
		Story.append(Paragraph(OBSER,styles['Justify']))
		doc.build(Story,onFirstPage=self.myFirstPage)
	def myFirstPage(self,canvas, doc):
		canvas.saveState()
		canvas.drawImage(STATICFILES_DIRS[0]+'escudo_transito.jpg',5, PAGE_HEIGHT+90)
		canvas.setFont('Times-Bold',14)
		canvas.drawString(127,PAGE_HEIGHT+80, "DIRECCION GENERAL DE TRANSITO MUNICIPAL")
		canvas.drawString(150,PAGE_HEIGHT+65, "PARTE INFORMATIVO DE ACCIDENTE")
		canvas.setFont('Times-Bold',10)
		canvas.drawString(140,PAGE_HEIGHT-110, "")
		tam= PAGE_WIDTH/10
		delegacion=self.data['delegacion']
		DELEGACION='DELEGACION: %s' %(delegacion)
		canvas.drawString(15,PAGE_HEIGHT-5, DELEGACION)
		
		comandancia=self.data['comandancia']
		COMANDANCIA='COMANDANCIA: %s' %(comandancia)
		canvas.drawString(tam*2+100,PAGE_HEIGHT-5, COMANDANCIA)


		SIGI='POR LOS SIGUIENTES VEHICULOS:'
		canvas.drawString(tam-45,PAGE_HEIGHT-135, SIGI)

		TURNO='TURNO: %s' %(self.data['turno'])
		canvas.drawString(tam*2+300,PAGE_HEIGHT-5, TURNO)

		canvas.setFont('Times-Bold',16)
		folio=self.data['folio_accidente']
		FOLIO='FOLIO: %s' %(folio)
		canvas.drawString(tam*2+380,PAGE_HEIGHT-50, FOLIO)
		canvas.restoreState()



