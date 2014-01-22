from django.db import models

class Detalle(models.Model):
    id =models.AutoField(primary_key=True) 
    folio = models.IntegerField(null=True, blank=True)
    id_articulo = models.IntegerField(null=True, blank=True)
    articulo = models.CharField(max_length=450, blank=True)
    parrafo = models.CharField(max_length=450, blank=True)
    concepto = models.CharField(max_length=900, blank=True)
    class Meta:
        db_table = u'infracciones_detalle'

class Infraccion(models.Model):
    id = models.AutoField(primary_key=True)                      
    folio =   models.IntegerField(null=True, blank=True)                 
    servicio =  models.CharField(max_length=150, blank=True)               
    hora_infrac          = models.TimeField(null=True, blank=True)      
    fecha_infrac         = models.DateField(null=True, blank=True)      
    delegacion    =  models.CharField(max_length=150, blank=True)              
    comandancia   =  models.CharField(max_length=150, blank=True)              
    turno        =  models.CharField(max_length=150, blank=True)             
    num_cobro_agente     = models.IntegerField(null=True, blank=True)             
    infractor_presente      =   models.CharField(max_length=150, blank=True)     
    Calle1         = models.CharField(max_length=255, blank=True)              
    Calle2           = models.CharField(max_length=255, blank=True)             
    frente_num       =   models.CharField(max_length=150, blank=True)            
    Colonia2         = models.CharField(max_length=255, blank=True)            
    se_recogio    = models.CharField(max_length=255, blank=True)                
    certificado_medico      =   models.CharField(max_length=150, blank=True)        
    firma_conductor       =   models.CharField(max_length=150, blank=True)  
    estado_conductor       =   models.CharField(max_length=150, blank=True)        
    fecha_captura              = models.DateTimeField(null=True, blank=True)    
    fecha_final_captura        = models.DateTimeField(null=True, blank=True)    
    usuario             =   models.CharField(max_length=150, blank=True)            
    status     = models.IntegerField(null=True, blank=True)                  
    longitud                = models.CharField(max_length=150, blank=True)    
    latitud                 = models.CharField(max_length=150, blank=True)   
    circulacion    = models.CharField(max_length=50, blank=True)  
    tipo_operativo    = models.CharField(max_length=255, blank=True)           
    activo        = models.IntegerField(null=True, blank=True)              
    nombre_colonia_infraccion   =   models.CharField(max_length=150, blank=True)   
    nombre_calle1             =   models.CharField(max_length=150, blank=True)     
    nombre_calle2            =   models.CharField(max_length=150, blank=True)      
    observaciones_infraccion    =   models.CharField(max_length=255, blank=True)   
    servicio_publico           = models.CharField(max_length=150, blank=True)
    nombreAgente           =   models.CharField(max_length=255, blank=True)  
    recoje_licencia_estado = models.CharField(max_length=50, blank=True)
    recoje_licencia_no_conducir= models.CharField(max_length=50, blank=True) 
    recoje_licencia_fecha_vencimiento =models.CharField(max_length=50, blank=True)
    recoje_licencia_tipo = models.CharField(max_length=50, blank=True)
    recoje_licencia_restricciones = models.CharField(max_length=50, blank=True)
    recoje_vehiculo_no_inventario = models.CharField(max_length=50, blank=True)
    recoje_vehiculo_pension = models.CharField(max_length=50, blank=True)
    
    detalles=   models.ManyToManyField("Detalle") 
    infractor   =models.ForeignKey('Infractor')
    vehiculo   =models.ForeignKey('Vehiculo')

    class Meta:
        db_table = 'infracciones_infraccion' 

class Infractor(models.Model):
    id = models.AutoField(primary_key=True) 
    nombre=models.CharField(max_length=250, blank=True)
    appPat=models.CharField(max_length=250, blank=True)
    appMat=models.CharField(max_length=250, blank=True)
    sexo=models.CharField(max_length=50, blank=True)
    edad=models.CharField(max_length=50, blank=True)
    domicilio=models.CharField(max_length=250, blank=True)
    numero=models.CharField(max_length=50, blank=True)
    colonia=models.CharField(max_length=250, blank=True)
    ciudad=models.CharField(max_length=50, blank=True)
    estado=models.CharField(max_length=50, blank=True)
    no_licencia=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table='infracciones_infractor'

class Vehiculo(models.Model):
    id = models.AutoField(primary_key=True) 
    clas_vehiculo=models.CharField(max_length=50, blank=True)
    marca=models.CharField(max_length=50, blank=True)
    submarca=models.CharField(max_length=50, blank=True)
    modelo=models.CharField(max_length=50, blank=True)
    color=models.CharField(max_length=50, blank=True)
    detalle_color=models.CharField(max_length=50, blank=True)
    tipo_placa=models.CharField(max_length=50, blank=True)
    placas=models.CharField(max_length=50, blank=True)
    estado_placa=models.CharField(max_length=50, blank=True)
    serie=models.CharField(max_length=250, blank=True)
    tipo=models.CharField(max_length=50, blank=True)
    empresa=models.CharField(max_length=50, blank=True)
    ruta=models.CharField(max_length=50, blank=True)
    no_economico=models.CharField(max_length=50, blank=True)
    no_tarjeton=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table='infracciones_vehiculo'

class Block(models.Model):
    id = models.AutoField(primary_key=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    folio_inicial = models.IntegerField(null=True, blank=True)
    folio_final = models.IntegerField(null=True, blank=True)
    fecha_recibido = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'infracciones_block'

class FolioInfraccion(models.Model):
    id = models.AutoField(primary_key=True)
    block = models.IntegerField(null=True, blank=True)
    folio = models.IntegerField(null=True, blank=True)
    comandancia=models.CharField(max_length=50, blank=True)
    delegacion=models.CharField(max_length=50, blank=True)
    turno=models.CharField(max_length=50, blank=True)
    fecha_liberacion=models.DateTimeField(null=True, blank=True) # Field name made lowercase.
    status=models.CharField(max_length=50, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'infracciones_folioinfraccion'
class HistorialVehiculo(models.Model):
    id = models.AutoField(primary_key=True)
    folio =   models.IntegerField(null=True, blank=True) 
    clas_vehiculo=models.CharField(max_length=50, blank=True)
    marca=models.CharField(max_length=50, blank=True)
    submarca=models.CharField(max_length=50, blank=True)
    veh_modelo=models.CharField(max_length=50, blank=True)
    veh_color=models.CharField(max_length=50, blank=True)
    veh_color_detalle=models.CharField(max_length=50, blank=True)
    veh_empresa=models.CharField(max_length=50, blank=True)
    veh_placas=models.CharField(max_length=50, blank=True)
    sp_num_economico=models.CharField(max_length=50, blank=True)
    veh_serie=models.CharField(max_length=250, blank=True)
    no_visible=models.CharField(max_length=50, blank=True)
    sp_num_ruta=models.CharField(max_length=50, blank=True)
    sp_tipo=models.CharField(max_length=50, blank=True)
    sp_num_tarjeton=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table='infracciones_histvehiculo'
class HistorialInfractor(models.Model):
    id = models.AutoField(primary_key=True)
    fecha_infrac = models.DateField(null=True, blank=True)
    folio= models.IntegerField(null=True, blank=True) 
    infractor_nombre=models.CharField(max_length=250, blank=True)
    infractor_apepaterno=models.CharField(max_length=250, blank=True)
    infractor_apematerno=models.CharField(max_length=250, blank=True)
    infractor_domicilio=models.CharField(max_length=250, blank=True)
    infractor_sexo=models.CharField(max_length=50, blank=True)
    infractor_edad=models.CharField(max_length=50, blank=True)
    colonia=models.CharField(max_length=250, blank=True)
    estado=models.CharField(max_length=50, blank=True)
    ciudad=models.CharField(max_length=50, blank=True)
    infractor_num_licencia=models.CharField(max_length=50, blank=True)
    conductor_estado=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table='infracciones_histinfractor'
