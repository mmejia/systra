from django.db import models
from accidentes.models import TbPensiones
class BlockInventario(models.Model):
    id = models.AutoField(primary_key=True)
    nombre_recibido = models.CharField(max_length=250, blank=True)
    folio_inicial = models.IntegerField(null=True, blank=True)
    folio_final = models.IntegerField(null=True, blank=True)
    fecha_recibido = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    pension=models.ForeignKey(TbPensiones)
    class Meta:
        db_table = u'inventarios_blockinventario'

class FolioInventario(models.Model):
    id = models.AutoField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    fecha_liberacion=models.DateTimeField(null=True, blank=True) # Field name made lowercase.
    status=models.CharField(max_length=50, blank=True)
    usuario =models.CharField(max_length=150, blank=True)
    pension=models.ForeignKey(TbPensiones)
    class Meta:
        db_table = u'inventarios_folioinventario'

class Resource(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=150, blank=True)
    modulo=models.CharField(max_length=150, blank=True)
    ruta = models.CharField(max_length=150, blank=True) # Field name made lowercase.
    nombre_archivo = models.CharField(max_length=250, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'inventario_resource'
class Inventario(models.Model):
    id = models.AutoField(primary_key=True)
    folio_inventario=  models.IntegerField(null=True) 
    folio_infraccion = models.IntegerField(null=True) 
    folio_accidente = models.IntegerField(null=True)
    delegacion =models.CharField(max_length=50)
    comandancia = models.CharField(max_length=50)
    turno = models.CharField(max_length=50)
    motivo_de_recojimiento=models.CharField(max_length=50)
    tipo_servicio = models.CharField(max_length=50)
    fecha_incid = models.DateField(null=True) 
    fecha_captura = models.DateField(null=True) 
    fecha_modifica = models.DateField(null=True) 
    pension_hora = models.TimeField(null=True) 
    pension_fecha= models.CharField(max_length=150)
    calle1 =  models.CharField(max_length=250) 
    calle2 = models.CharField(max_length=250)  
    colonia = models.CharField(max_length=250)
    interior = models.CharField(max_length=250) 
    exterior = models.CharField(max_length=250) 
    depositado_en = models.CharField(max_length=250) 
    clas_vehiculo =models.CharField(max_length=50) 
    tipo =models.CharField(max_length=50) 
    marca = models.CharField(max_length=300) 
    submarca = models.CharField(max_length=300) 
    veh_modelo = models.CharField(max_length=300)
    veh_color = models.CharField(max_length=50)
    veh_color_detalle = models.CharField(max_length=750)
    veh_placas = models.CharField(max_length=300)
    veh_serie = models.CharField(max_length=750)
    infractor_nombre = models.CharField(max_length=750)
    infractor_apepaterno = models.CharField(max_length=750)
    infractor_apematerno = models.CharField(max_length=750)
    pension_lugar = models.CharField(max_length=50) 
    pension_recibido_por = models.CharField(max_length=250) 
    pension_transportado_por = models.CharField(max_length=250)
    pension_transportado_pension = models.CharField(max_length=50) 
    pension_transportado_unidad_transito=models.CharField(max_length=50) 
    usuario = models.CharField(max_length=150) 
    salida_nombre = models.CharField(max_length=250)
    salida_apepaterno = models.CharField(max_length=150)
    salida_apematerno = models.CharField(max_length=150)
    liberacion_fecha = models.DateField(null=True)
    liberacion_hora = models.TimeField(max_length=250)  
    liberacion_entrega = models.CharField(max_length=250) 
    liberacion_recibe = models.CharField(max_length=250) 
    liberacion_lugar = models.CharField(max_length=250)
    agencia_mp = models.IntegerField(null=True)
    folio_consignacion = models.CharField(max_length=150) 
    activo = models.IntegerField(null=True) 
    corporacion = models.CharField(max_length=50) 
    folio_agente = models.CharField(max_length=250)
    nombre_agente= models.CharField(max_length=250)
    persona_fisica= models.CharField(max_length=50)
    persona_moral= models.CharField(max_length=50)
    recibo_pago= models.CharField(max_length=50)
    autoridad_competente=models.CharField(max_length=50)
    numero_economico=models.CharField(max_length=50)

    frente=  models.IntegerField(null=True) 
    posterior= models.IntegerField(null=True) 
    fotos=models.ManyToManyField("Resource") 

    class Meta:
        db_table = u'inventarios_inventario'