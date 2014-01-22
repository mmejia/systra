# encoding: UTF-8
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.
from django.db import models
class AccId(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, db_column='Folio', blank=True) # Field name made lowercase.
    usuario =models.CharField(max_length=150, blank=True)
    id_unico =models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'ACC_ID'

class Resource(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=150, blank=True)
    modulo=models.CharField(max_length=150, blank=True)
    ruta = models.CharField(max_length=150, blank=True) # Field name made lowercase.
    nombre_archivo = models.CharField(max_length=250, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'accidente_resource'

class Profile(models.Model):
    id = models.AutoField(primary_key=True)
    cobro = models.IntegerField(null=True,  blank=True)
    nombre =models.CharField(max_length=255, blank=True)
    comandancia =models.CharField(max_length=50, blank=True)
    turno =models.CharField(max_length=5, blank=True)
    delegacion =models.CharField(max_length=30, blank=True)
    comision =models.CharField(max_length=150, blank=True)
    color =models.CharField(max_length=150, blank=True)
    tam_tabla =models.CharField(max_length=150, blank=True)
    superusuario =models.IntegerField(null=True,  blank=True)
    def __unicode__(self):
        return str(self.cobro) + " -- "  + self.comandancia + '--' + self.nombre
    class Meta:
        db_table = u'profile'


class AccAliCamino(models.Model):
    id = models.IntegerField(primary_key=True)
    alicamino = models.CharField(max_length=150, db_column='AliCamino', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Ali_Camino'

class AutCompInv(models.Model):
    id = models.AutoField(primary_key=True)
    autoridad = models.CharField(max_length=150,  blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.autoridad
    class Meta:
        db_table = u'AutCompInv'

class AccCabina(models.Model):
    id = models.AutoField(primary_key=True)
    folio_evento = models.IntegerField(null=True, blank=True)
    tipo_evento = models.CharField(max_length=150, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    comandancia = models.CharField(max_length=150, blank=True)
    turno = models.CharField(max_length=150, blank=True)
    hora_evento = models.TimeField(null=True, blank=True)
    fecha_evento = models.DateField(null=True, blank=True)
    calle1 = models.CharField(max_length=300, blank=True)
    calle2 = models.CharField(max_length=300, blank=True)
    ref = models.CharField(max_length=300, blank=True)
    observaciones_evento = models.CharField(max_length=600, blank=True)
    reg_inicio = models.DateTimeField(null=True, blank=True)
    reg_final = models.DateTimeField(null=True, blank=True)
    cabina_completo = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    id_unico = models.CharField(max_length=150, blank=True)
    nombre_agente_intervino = models.CharField(max_length=255, blank=True)
    gafete_agente_intervino = models.CharField(max_length=255, blank=True)
    unidad_intervino = models.CharField(max_length=255, blank=True)
    sector_intervino = models.CharField(max_length=150, blank=True)
    id_tipo_accidente = models.CharField(max_length=150, blank=True)
    id_clasificacion = models.CharField(max_length=150, blank=True)
    no_veh_participantes = models.IntegerField(null=True, blank=True)
    no_muertos = models.IntegerField(null=True, blank=True)
    no_heridos = models.IntegerField(null=True, blank=True)
    no_detenidos = models.IntegerField(null=True, blank=True)
    id_pension = models.IntegerField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    por_llenar = models.IntegerField()
    colonia = models.CharField(max_length=255, blank=True)
    class Meta:
        db_table = u'Acc_Cabina2'

class AccCabinaHistorial(models.Model):
    id = models.IntegerField(primary_key=True)
    folio_evento = models.IntegerField(null=True, blank=True)
    tipo_evento = models.IntegerField(null=True, blank=True)
    delegacion = models.IntegerField(null=True, blank=True)
    comandancia = models.IntegerField(null=True, blank=True)
    turno = models.IntegerField(null=True, blank=True)
    hora_evento = models.TimeField()
    fecha_evento =  models.DateField()
    localizacion_evento = models.CharField(max_length=300, blank=True)
    observaciones_evento = models.CharField(max_length=600, blank=True)
    reg_inicio = models.DateTimeField(null=True, blank=True)
    reg_final = models.DateTimeField(null=True, blank=True)
    cabina_completo = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    id_unico = models.CharField(max_length=150, blank=True)
    tipo_operativo = models.IntegerField(null=True, blank=True)
    agente_intervino = models.CharField(max_length=150, blank=True)
    unidad_intervino = models.CharField(max_length=150, blank=True)
    sector_intervino = models.CharField(max_length=150, blank=True)
    id_tipo_accidente = models.IntegerField(null=True, blank=True)
    id_clasificacion = models.IntegerField(null=True, blank=True)
    no_veh_participantes = models.IntegerField(null=True, blank=True)
    no_detenidos = models.IntegerField(null=True, blank=True)
    no_heridos = models.IntegerField(null=True, blank=True)
    no_muertos = models.IntegerField(null=True, blank=True)
    id_pension = models.IntegerField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Cabina_Historial'

class AccClasVehiculo(models.Model):
    id = models.IntegerField(primary_key=True)
    clasvehic = models.CharField(max_length=150, db_column='ClasVehic', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Clas_vehiculo'

class AccClima(models.Model):
    id = models.IntegerField(primary_key=True)
    clima = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Clima'

class AccConvenio(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    clasificacion = models.IntegerField(null=True, blank=True)
    tipo_choque = models.IntegerField(null=True, blank=True)
    intervino = models.CharField(max_length=150, blank=True)
    unidad_intervino = models.CharField(max_length=150, db_column='Unidad_Intervino', blank=True) # Field name made lowercase.
    sector_intervino = models.CharField(max_length=300, db_column='Sector_Intervino', blank=True) # Field name made lowercase.
    delegacion_intervino = models.IntegerField(null=True, db_column='Delegacion_Intervino', blank=True) # Field name made lowercase.
    superviso = models.CharField(max_length=150, blank=True)
    unidad_superviso = models.CharField(max_length=150, db_column='Unidad_Superviso', blank=True) # Field name made lowercase.
    sector_superviso = models.CharField(max_length=300, db_column='Sector_Superviso', blank=True) # Field name made lowercase.
    delegacion_superviso = models.IntegerField(null=True, db_column='Delegacion_Superviso', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    calle3 = models.CharField(max_length=900, blank=True)
    frentenumero = models.CharField(max_length=150, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    ciudad = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True)
    convenio_delegacion = models.IntegerField(null=True, blank=True)
    convenio_comandancia = models.IntegerField(null=True, blank=True)
    convenio_turno = models.IntegerField(null=True, blank=True)
    convenio_fecha = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    nacionalidadc = models.CharField(max_length=150, db_column='NacionalidadC', blank=True) # Field name made lowercase.
    pre_parte = models.IntegerField(null=True, blank=True)
    tipo_evento = models.IntegerField()
    activo = models.IntegerField()
    id_agente_intervino = models.IntegerField()
    id_agente_superviso = models.IntegerField()
    especificar_nose_tipifica = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'Acc_Convenio'

class AccConvenioHistorial(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    clasificacion = models.IntegerField(null=True, blank=True)
    tipo_choque = models.IntegerField(null=True, blank=True)
    intervino = models.CharField(max_length=150, blank=True)
    unidad_intervino = models.CharField(max_length=150, db_column='Unidad_Intervino', blank=True) # Field name made lowercase.
    sector_intervino = models.CharField(max_length=300, db_column='Sector_Intervino', blank=True) # Field name made lowercase.
    delegacion_intervino = models.IntegerField(null=True, db_column='Delegacion_Intervino', blank=True) # Field name made lowercase.
    superviso = models.CharField(max_length=150, blank=True)
    unidad_superviso = models.CharField(max_length=150, db_column='Unidad_Superviso', blank=True) # Field name made lowercase.
    sector_superviso = models.CharField(max_length=300, db_column='Sector_Superviso', blank=True) # Field name made lowercase.
    delegacion_superviso = models.IntegerField(null=True, db_column='Delegacion_Superviso', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    calle3 = models.CharField(max_length=900, blank=True)
    frentenumero = models.CharField(max_length=150, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    ciudad = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True)
    convenio_delegacion = models.IntegerField(null=True, blank=True)
    convenio_comandancia = models.IntegerField(null=True, blank=True)
    convenio_turno = models.IntegerField(null=True, blank=True)
    convenio_fecha = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    nacionalidadc = models.CharField(max_length=150, db_column='NacionalidadC', blank=True) # Field name made lowercase.
    pre_parte = models.IntegerField(null=True, blank=True)
    tipo_evento = models.IntegerField()
    activo = models.IntegerField()
    id_agente_intervino = models.IntegerField()
    id_agente_superviso = models.IntegerField()
    especificar_nose_tipifica = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'Acc_Convenio_Historial'

class AccCustodia(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Acc_Custodia'

class AccDanos(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Danos'

class AccDiaNoche(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Dia_Noche'
class Circulaciones(models.Model):
    id = models.AutoField(primary_key=True)
    circulacion = models.CharField(max_length=150, db_column='circulacion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.circulacion
    class Meta:
        db_table = u'Circulaciones'

class NoCarriles(models.Model):
    id = models.IntegerField(primary_key=True)
    carriles = models.CharField(max_length=150, db_column='carriles', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'NoCarriles'

class Sentidos(models.Model):
    id = models.IntegerField(primary_key=True)
    sentido = models.CharField(max_length=150, db_column='sentido', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Sentidos'

class AccEdoConductor(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Acc_Edo_Conductor'

class AccEdoPavimento(models.Model):
    id = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=150, db_column='Estado', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Edo_Pavimento'

class AccEdoEbriedad(models.Model):
    id = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Edo_ebriedad'

class AccEdoFisico(models.Model):
    id = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.estado
    class Meta:
        db_table = u'Acc_Edo_fisico'

class AccInveDetalles(models.Model):
    id = models.AutoField(primary_key=True)
    id_infraccion = models.IntegerField(null=True, blank=True)
    folio = models.IntegerField(null=True, blank=True)
    id_articulo = models.IntegerField(null=True, blank=True)
    articulo = models.CharField(max_length=750, blank=True)
    parrafo = models.CharField(max_length=750, blank=True)
    concepto = models.CharField(max_length=765, blank=True)
    id_unico = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Inve_detalles1'

class CapVeh(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=255, blank=True)
    class Meta:
        db_table = u'CapVeh'

class EnCustodia(models.Model):
    id = models.AutoField(primary_key=True)
    custodia = models.CharField(max_length=255, blank=True)
    class Meta:
        db_table = u'EnCustodia'

class AccInventario(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=150, blank=True)
    id_inventario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Acc_Inventario'

class AccObjetos(models.Model):
    id = models.AutoField(primary_key=True)
    id_unico = models.CharField(max_length=150, blank=True)
    id_objeto = models.CharField(max_length=50, blank=True)
    tipo_objeto = models.CharField(max_length=900, blank=True)
    dueno_objeto = models.CharField(max_length=900, blank=True)
    monto_dano = models.CharField(max_length=900, blank=True)
    tipo_evento = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = u'Acc_Objetos1'

class AccRegulacionCrucero(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Regulacion_crucero'

class AccResponsabilidad(models.Model):
    id = models.IntegerField(primary_key=True)
    responsabilidad = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Responsabilidad'

class AccRestriccionesLicencia(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Acc_Restricciones_licencia'

class AccSimbologia(models.Model):
    id = models.IntegerField(primary_key=True)
    class Meta:
        db_table = u'Acc_Simbologia'

class AccTipoAccidente(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    def __unicode__(self):
        return self.tipo
    class Meta:
        db_table = u'Acc_Tipo_Accidente'

class AccClasAccidente(models.Model):
    id = models.IntegerField(primary_key=True)
    clas = models.CharField(max_length=150, db_column='clas', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    def __unicode__(self):
        return self.clas
    class Meta:
        db_table = u'Acc_Clas_Accidente'

class AccVehiculoTipo(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    status = models.CharField(max_length=3, blank=True)
    orden = models.IntegerField(null=True, db_column='Orden', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.tipo
    class Meta:
        db_table = u'Acc_Vehiculo_Tipo'

class PuntosAccidentes(models.Model):
    id = models.IntegerField(primary_key=True)
    dia = models.CharField(max_length=150,  blank=True) # Field name made lowercase.
    anio = models.CharField(max_length=3, blank=True)
    fecha= models.CharField(max_length=150,  blank=True)
    accidentes = models.IntegerField(null=True,  blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'puntos_accidentes'

class AccVehiculoUso(models.Model):
    id = models.IntegerField(primary_key=True, db_column='Id') # Field name made lowercase.
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Acc_Vehiculo_Uso'

class AccVisibilidad(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Acc_Visibilidad'

class AccCroquisHistorial(models.Model):
    id = models.IntegerField(primary_key=True)
    id_preliminar = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=250, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    parte_o_convenio = models.CharField(max_length=15, blank=True)
    croquis = models.CharField(max_length=150, blank=True)
    simbologia = models.TextField(blank=True)
    class Meta:
        db_table = u'Acc_croquis_historial'

class AccInvolucrados(models.Model):
    id =models.AutoField(primary_key=True)
    id_accidente = models.IntegerField(null=True, blank=True)
    id_preliminar = models.IntegerField(null=True, blank=True)
    id_vehiculo = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=300, blank=True)
    participa_como = models.IntegerField(null=True, blank=True)
    nombre = models.CharField(max_length=600, blank=True)
    conductor_apepaterno = models.CharField(max_length=600, db_column='Conductor_ApePaterno', blank=True)
    conductor_apematerno = models.CharField(max_length=600, db_column='Conductor_ApeMaterno', blank=True)
    edad = models.IntegerField(null=True, blank=True)
    calle = models.CharField(max_length=600, blank=True)
    colonia = models.CharField(max_length=150, blank=True)
    ciudad =models.CharField(max_length=150, blank=True)
    estado = models.CharField(max_length=150, blank=True)
    nacionalidad = models.CharField(max_length=150, blank=True)
    sexo = models.CharField(max_length=50, blank=True)
    edo_ebriedad = models.IntegerField()
    edo_fisico = models.IntegerField(null=True, blank=True)
    edo_trasladado_por = models.CharField(max_length=600, blank=True)
    edo_levantado_por = models.CharField(max_length=600, blank=True)
    estado_herido = models.CharField(max_length=300, db_column='Estado_herido', blank=True) # Field name made lowercase.
    fecha_registro = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    nacionalidad4 = models.CharField(max_length=150, db_column='Nacionalidad4', blank=True) # Field name made lowercase.
    conductor_detenido_en =models.CharField(max_length=50, blank=True)
    conductor_disposicion = models.CharField(max_length=600, db_column='Conductor_disposicion', blank=True) # Field name made lowercase.
    custodia_de = models.CharField(max_length=300, db_column='Custodia_de', blank=True) # Field name made lowercase.
    intervino_como = models.CharField(max_length=150, blank=True)
    tipo_edad = models.IntegerField()
    class Meta:
        db_table = u'Acc_involucrados1'

class AccPreliminar(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    clasificacion = models.IntegerField(null=True, blank=True)
    tipo_choque = models.IntegerField(null=True, blank=True)
    intervino = models.CharField(max_length=150, blank=True)
    unidad_intervino = models.CharField(max_length=150, db_column='Unidad_Intervino', blank=True) # Field name made lowercase.
    sector_intervino = models.CharField(max_length=300, db_column='Sector_Intervino', blank=True) # Field name made lowercase.
    delegacion_intervino = models.IntegerField(null=True, db_column='Delegacion_Intervino', blank=True) # Field name made lowercase.
    superviso = models.CharField(max_length=150, blank=True)
    unidad_superviso = models.CharField(max_length=150, db_column='Unidad_Superviso', blank=True) # Field name made lowercase.
    sector_superviso = models.CharField(max_length=300, db_column='Sector_Superviso', blank=True) # Field name made lowercase.
    delegacion_superviso = models.IntegerField(null=True, db_column='Delegacion_Superviso', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    calle3 = models.CharField(max_length=900, blank=True)
    frentenumero = models.CharField(max_length=150, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    ciudad = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True)
    convenio_delegacion = models.IntegerField(null=True, blank=True)
    convenio_comandancia = models.IntegerField(null=True, blank=True)
    convenio_turno = models.IntegerField(null=True, blank=True)
    convenio_fecha = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    nacionalidadp = models.CharField(max_length=150, db_column='NacionalidadP', blank=True) # Field name made lowercase.
    pre_parte = models.IntegerField()
    tipo_evento = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    id_agente_intervino = models.IntegerField()
    id_agente_superviso = models.IntegerField()
    especificar_nose_tipifica = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'Acc_preliminar'

class AccPreliminarHistorico(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    clasificacion = models.IntegerField(null=True, blank=True)
    tipo_choque = models.IntegerField(null=True, blank=True)
    intervino = models.CharField(max_length=150, blank=True)
    unidad_intervino = models.CharField(max_length=150, db_column='Unidad_Intervino', blank=True) # Field name made lowercase.
    sector_intervino = models.CharField(max_length=300, db_column='Sector_Intervino', blank=True) # Field name made lowercase.
    delegacion_intervino = models.IntegerField(null=True, db_column='Delegacion_Intervino', blank=True) # Field name made lowercase.
    superviso = models.CharField(max_length=150, blank=True)
    unidad_superviso = models.CharField(max_length=150, db_column='Unidad_Superviso', blank=True) # Field name made lowercase.
    sector_superviso = models.CharField(max_length=300, db_column='Sector_Superviso', blank=True) # Field name made lowercase.
    delegacion_superviso = models.IntegerField(null=True, db_column='Delegacion_Superviso', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    calle3 = models.CharField(max_length=900, blank=True)
    frentenumero = models.CharField(max_length=150, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    ciudad = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True)
    convenio_delegacion = models.IntegerField(null=True, blank=True)
    convenio_comandancia = models.IntegerField(null=True, blank=True)
    convenio_turno = models.IntegerField(null=True, blank=True)
    convenio_fecha = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    nacionalidadp = models.CharField(max_length=150, db_column='NacionalidadP', blank=True) # Field name made lowercase.
    id_agente_intervino = models.IntegerField()
    id_agente_superviso = models.IntegerField()
    especificar_nose_tipifica = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'Acc_preliminar_historico'

class AccTipoEventoHistorial(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    fecha_modifica = models.DateTimeField(null=True, blank=True)
    tipo_evento = models.IntegerField(null=True, blank=True)
    tipo_evento_nvo = models.IntegerField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    usuario_nvo = models.CharField(max_length=150, blank=True)
    motivo = models.TextField(blank=True)
    class Meta:
        db_table = u'Acc_tipo_evento_historial'

class AccVehiculos(models.Model):
    id = models.AutoField(primary_key=True)
    id_accidente = models.IntegerField(null=True, blank=True)
    id_preliminar = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=300, blank=True)
    intervino_como = models.CharField(max_length=50, blank=True)
    clas_vehiculo =models.CharField(max_length=150, blank=True,db_column='Clas_vehiculo')  
    color = models.CharField(max_length=50, blank=True)
    color_detalle = models.CharField(max_length=50, blank=True)
    placa =  models.CharField(max_length=50, blank=True)
    modelo = models.CharField(max_length=150, blank=True)
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    submarca =  models.CharField(max_length=50, blank=True,db_column='SubMarca')
    capacidad = models.CharField(max_length=50, blank=True)
    estadov =  models.CharField(max_length=50, blank=True)
    ciudadv =  models.CharField(max_length=50, blank=True)
    serie = models.CharField(max_length=150, blank=True)
    tipo = models.CharField(max_length=150, blank=True)
    serviciopp = models.CharField(max_length=50, blank=True)
    num_economico = models.CharField(max_length=150, blank=True)
    num_grua = models.CharField(max_length=150, blank=True)
    pension =  models.CharField(max_length=50, blank=True)
    conductor_nombre = models.CharField(max_length=250, blank=True)
    conductor_apepaterno = models.CharField(max_length=250, blank=True)
    conductor_apematerno = models.CharField(max_length=250, blank=True)
    conductor_calle = models.CharField(max_length=250, blank=True)
    conductor_colonia =  models.CharField(max_length=250, blank=True)
    ciudad =  models.CharField(max_length=50, blank=True)
    estado =  models.CharField(max_length=50, blank=True)
    conductor_edad = models.CharField(max_length=20, blank=True)
    conductor_edo_licencia =  models.CharField(max_length=50, blank=True)
    conductor_pais_licencia = models.CharField(max_length=150, blank=True)
    conductor_num_licencia = models.CharField(max_length=150, blank=True)
    conductor_tipo_licencia =  models.CharField(max_length=50, blank=True)
    conductor_rest_licencia =  models.CharField(max_length=50, blank=True)
    conductor_fecha_expedida = models.DateTimeField(null=True, blank=True)
    conductor_fecha_vigencia = models.DateTimeField(null=True, blank=True)
    conductor_sexo =  models.CharField(max_length=50, blank=True)
    conductor_detenido_en =  models.CharField(max_length=50, blank=True)
    conductor_disposicion =  models.CharField(max_length=50, blank=True)
    tipo_dueno =  models.CharField(max_length=50, blank=True)
    dueno_nombre =  models.CharField(max_length=50, blank=True)
    dueno_calle =  models.CharField(max_length=250, blank=True)
    dueno_colonia = models.CharField(max_length=250, blank=True)
    dueno_tel = models.CharField(max_length=150, blank=True)
    dueno_estadop = models.CharField(max_length=50, blank=True)
    dueno_ciudadp =models.CharField(max_length=150, blank=True)
    dueno_cp = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    especificaciones = models.CharField(max_length=300, db_column='Especificaciones', blank=True) # Field name made lowercase.
    nacionalidad3 = models.CharField(max_length=150, db_column='Nacionalidad3', blank=True) # Field name made lowercase.
    nacionalidad2 = models.CharField(max_length=150, db_column='Nacionalidad2', blank=True) # Field name made lowercase.
    estado_herido = models.CharField(max_length=150, db_column='Estado_herido', blank=True) # Field name made lowercase.
    especificar_vehiculo = models.CharField(max_length=150, db_column='Especificar_Vehiculo', blank=True) # Field name made lowercase.
    uso_vehiculo = models.CharField(max_length=150, blank=True,db_column='Uso_Vehiculo')
    dv_num_inventario = models.CharField(max_length=150, blank=True)
    dueno_apepaterno = models.CharField(max_length=150, blank=True)
    dueno_apematerno = models.CharField(max_length=150, blank=True)
    folio_infraccion = models.IntegerField(null=True, blank=True)
    folio_certificado_medico = models.IntegerField(null=True, blank=True)
    servicio_publico =models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Acc_Vehiculos1'
class Noticias(models.Model):
    id= models.AutoField(primary_key=True)
    titulo=  models.CharField(max_length=300, blank=True)
    noticia = models.CharField(max_length=300, blank=True)
    capturado_por = models.CharField(max_length=300, blank=True)
    tags = models.CharField(max_length=300, blank=True)
    fecha =  models.DateTimeField(null=True, blank=True)
    archivos = models.CharField(max_length=300, blank=True)
    class Meta:
        db_table = u'Noticias'
class Accidentes(models.Model):
    id =models.AutoField(primary_key=True)
    id_tipo = models.IntegerField(null=True, blank=True) #checar
    id_preliminar = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=300, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)  
    clasificacion = models.CharField(max_length=50, blank=True)
    causa_primaria = models.IntegerField(null=True, blank=True) #checar
    causa_secundaria = models.IntegerField(null=True, blank=True) #checar
    tipo_choque = models.CharField(max_length=255, blank=True)
    #unidad = models.CharField(max_length=150, blank=True)
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    frente_num = models.CharField(max_length=900, blank=True)
    colonia =models.CharField(max_length=50, blank=True)
    estado = models.CharField(max_length=50, blank=True)
    ciudad =  models.CharField(max_length=50, blank=True)
    edo_alineacion = models.CharField(max_length=50, blank=True)
    edo_piso =models.CharField(max_length=50, blank=True)
    edo_clima = models.CharField(max_length=50, blank=True)
    edo_regularizacion = models.CharField(max_length=50, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True) #checar
    convenio_numero = models.IntegerField(null=True, blank=True) #convenio
    convenio_delegacion = models.CharField(max_length=50, blank=True)
    convenio_comandancia = models.CharField(max_length=50, blank=True)
    convenio_turno =models.CharField(max_length=50, blank=True)
    convenio_fecha = models.DateField(null=True, blank=True)
    convenio_hora =models.CharField(max_length=50, blank=True)
    observaciones = models.TextField(db_column='Observaciones') # Field name made lowercase.
    usuario = models.CharField(max_length=150, blank=True)
    latitud = models.CharField(max_length=50, blank=True)
    longitud = models.CharField(max_length=50, blank=True)
    parte_o_convenio = models.CharField(max_length=15, blank=True) #checar
    croquis = models.CharField(max_length=150, blank=True)
    simbologia = models.TextField(blank=True)
    investigacion = models.TextField(blank=True)
    tipo_calle =models.CharField(max_length=50, blank=True)
    num_carriles = models.CharField(max_length=50, blank=True)
    sentido_calles = models.CharField(max_length=60, blank=True)
    dv_num_inventario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    no_infracciones = models.IntegerField(null=True, db_column='No_Infracciones', blank=True) # Field name made lowercase.
    folios_infracciones = models.CharField(max_length=450, db_column='Folios_Infracciones', blank=True) # Field name made lowercase.
    nombre_intervino= models.CharField(max_length=150, blank=True)
    gafete_intervino= models.CharField(max_length=150, blank=True)
    unidad_intervino= models.CharField(max_length=150, blank=True)
    sector_intervino= models.CharField(max_length=150, blank=True)
    nombre_superviso= models.CharField(max_length=150, blank=True)
    gafete_superviso= models.CharField(max_length=150, blank=True)
    unidad_superviso= models.CharField(max_length=150, blank=True)
    sector_superviso= models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'dbo_Accidentes1'
        permissions=(
            ("add-preliminar", "El usuario puede agregar preliminar"),
            ("save-preliminar", "El usuario guardar preliminar"),
            ("update-preliminar", "El podra actualizar el preliminar"),
            ("down-preliminar", "El usuario podra dar de baja preliminar"),
            ("add-parte", "El usuario podra agregar partes"),
            ("save-parte", "El usuario podra guardar partes"),
            ("save-local", "El usuario podra guardar  borradores de partes"),
            ("update-parte", "El usuario actualizar partes"),
            ("print-parte", "El usuario podrá imprimir partes"),
            ("print-posterior", "El usuario podra imprimir posteriores del parte"),
            ("delete-parte", "El usuario podra borrar partes"),
            ("list-parte", "El usuario podra buscar partes"),
        )
        
#pariba
class AccidentesHistorico(models.Model):
    id = models.IntegerField(primary_key=True)
    id_tipo = models.IntegerField(null=True, blank=True)
    id_preliminar = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=300, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    clasificacion = models.IntegerField(null=True, blank=True)
    causa_primaria = models.IntegerField(null=True, blank=True)
    causa_secundaria = models.IntegerField(null=True, blank=True)
    tipo_choque = models.IntegerField(null=True, blank=True)
    intervino = models.IntegerField(null=True, blank=True)
    superviso = models.IntegerField(null=True, blank=True)
    unidad = models.CharField(max_length=150, blank=True)
    calle1 = models.CharField(max_length=900, blank=True)
    calle2 = models.CharField(max_length=900, blank=True)
    calle3 = models.CharField(max_length=900, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, blank=True)
    ciudad = models.IntegerField(null=True, blank=True)
    edo_alineacion = models.IntegerField(null=True, blank=True)
    edo_piso = models.IntegerField(null=True, blank=True)
    edo_clima = models.IntegerField(null=True, blank=True)
    edo_regularizacion = models.IntegerField(null=True, blank=True)
    danos_objetos = models.IntegerField(null=True, blank=True)
    danos_tipo = models.CharField(max_length=150, blank=True)
    danos_dueno = models.CharField(max_length=150, blank=True)
    danos_monto = models.CharField(max_length=150, blank=True)
    convenio_tipo = models.IntegerField(null=True, blank=True)
    convenio_numero = models.IntegerField(null=True, blank=True)
    convenio_delegacion = models.IntegerField(null=True, blank=True)
    convenio_comandancia = models.IntegerField(null=True, blank=True)
    convenio_turno = models.IntegerField(null=True, blank=True)
    convenio_fecha = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    usuario = models.CharField(max_length=150, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    longitud = models.FloatField(null=True, blank=True)
    parte_o_convenio = models.CharField(max_length=15, blank=True)
    croquis = models.CharField(max_length=150, blank=True)
    simbologia = models.TextField(blank=True)
    investigacion = models.TextField(blank=True)
    id_agente_intervino = models.IntegerField()
    id_agente_superviso = models.IntegerField()
    class Meta:
        db_table = u'Accidentes_historico'

class AsignaFolios(models.Model):
    folio = models.IntegerField(null=True, blank=True)
    tipo_evento = models.IntegerField(null=True, blank=True)
    id_unico = models.CharField(max_length=150, blank=True)
    year_actual = models.IntegerField()
    id = models.IntegerField(primary_key=True)
    maximo = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Asigna_Folios'

class CatAgentesNew(models.Model):
    id = models.AutoField(primary_key=True)
    num_cobro = models.CharField(max_length=255,  blank=True)
    nombre = models.CharField(max_length=255,  blank=True)
    puesto = models.CharField(max_length=255,  blank=True)
    def __unicode__(self):
        return self.num_cobro + " -- "  + self.nombre
    class Meta:
        db_table = u'CAT_AGENTES_NEW'

class CatAgentesBorrar(models.Model):
    id = models.IntegerField(primary_key=True)
    no_gafete = models.IntegerField(null=True, blank=True)
    nombre = models.CharField(max_length=300, db_column='Nombre', blank=True) # Field name made lowercase.
    apepaterno = models.CharField(max_length=300, db_column='ApePaterno', blank=True) # Field name made lowercase.
    apematerno = models.CharField(max_length=300, db_column='ApeMaterno', blank=True) # Field name made lowercase.
    descripcion = models.CharField(max_length=150, blank=True)
    num_cobro = models.IntegerField(null=True, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=3, blank=True)
    fecha_elim = models.DateTimeField(null=True, blank=True)
    id_delegacion = models.IntegerField(null=True, blank=True)
    id_comandancia = models.IntegerField(null=True, blank=True)
    id_turno = models.IntegerField(null=True, blank=True)
    id_usuario = models.CharField(max_length=60, blank=True)
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    class Meta:
        db_table = u'CAT_Agentes_BORRAR'

class CatGps(models.Model):
    id = models.IntegerField(primary_key=True)
    alias = models.CharField(max_length=765, db_column='ALIAS', blank=True) # Field name made lowercase.
    sim = models.CharField(max_length=765, db_column='SIM', blank=True) # Field name made lowercase.
    id_gps = models.CharField(max_length=765, db_column='ID_GPS', blank=True) # Field name made lowercase.
    telefono = models.CharField(max_length=150, db_column='TELEFONO', blank=True) # Field name made lowercase.
    no_unidad = models.CharField(max_length=150, db_column='NO_UNIDAD', blank=True) # Field name made lowercase.
    placas = models.CharField(max_length=765, db_column='PLACAS', blank=True) # Field name made lowercase.
    control = models.CharField(max_length=765, db_column='CONTROL', blank=True) # Field name made lowercase.
    id_delegacion = models.IntegerField(null=True, db_column='ID_DELEGACION', blank=True) # Field name made lowercase.
    delegacion = models.CharField(max_length=150, db_column='DELEGACION', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='MARCA', blank=True) # Field name made lowercase.
    vehiculo_tipo = models.CharField(max_length=30, db_column='VEHICULO_TIPO', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='ACTIVO', blank=True) # Field name made lowercase.
    estatus = models.CharField(max_length=30, db_column='ESTATUS', blank=True) # Field name made lowercase.
    dependencia = models.CharField(max_length=150, db_column='DEPENDENCIA', blank=True) # Field name made lowercase.
    serial = models.CharField(max_length=765, db_column='SERIAL', blank=True) # Field name made lowercase.
    imei = models.CharField(max_length=765, db_column='IMEI', blank=True) # Field name made lowercase.
    fecha_movi = models.DateTimeField(null=True, db_column='FECHA_MOVI', blank=True) # Field name made lowercase.
    observaciones = models.CharField(max_length=765, db_column='OBSERVACIONES', blank=True) # Field name made lowercase.
    revision = models.CharField(max_length=765, db_column='REVISION', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'CAT_GPS'

class CatGps2008(models.Model):
    id = models.IntegerField(primary_key=True)
    alias = models.CharField(max_length=450, db_column='ALIAS', blank=True) # Field name made lowercase.
    sim = models.CharField(max_length=765, db_column='SIM', blank=True) # Field name made lowercase.
    id_gps = models.CharField(max_length=765, db_column='Id_GPS', blank=True) # Field name made lowercase.
    telefono = models.CharField(max_length=150, db_column='Telefono', blank=True) # Field name made lowercase.
    no_unidad = models.CharField(max_length=159, db_column='No_Unidad', blank=True) # Field name made lowercase.
    placas = models.CharField(max_length=159, db_column='Placas', blank=True) # Field name made lowercase.
    control = models.CharField(max_length=150, db_column='Control', blank=True) # Field name made lowercase.
    id_delegacion = models.IntegerField(null=True, db_column='Id_Delegacion', blank=True) # Field name made lowercase.
    delegacion = models.CharField(max_length=765, db_column='Delegacion', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    vehiculo_tipo = models.CharField(max_length=765, db_column='Vehiculo_Tipo', blank=True) # Field name made lowercase.
    activo = models.IntegerField()
    estatus = models.IntegerField(null=True, db_column='Estatus', blank=True) # Field name made lowercase.
    dependencia = models.CharField(max_length=150, db_column='Dependencia') # Field name made lowercase.
    class Meta:
        db_table = u'CAT_GPS_2008'

class CatGpsOld(models.Model):
    id = models.IntegerField(primary_key=True)
    alias = models.CharField(max_length=450, db_column='ALIAS', blank=True) # Field name made lowercase.
    sim = models.CharField(max_length=765, db_column='SIM', blank=True) # Field name made lowercase.
    id_gps = models.CharField(max_length=765, db_column='Id_GPS', blank=True) # Field name made lowercase.
    telefono = models.CharField(max_length=150, db_column='Telefono', blank=True) # Field name made lowercase.
    no_unidad = models.CharField(max_length=159, db_column='No_Unidad', blank=True) # Field name made lowercase.
    placas = models.CharField(max_length=159, db_column='Placas', blank=True) # Field name made lowercase.
    control = models.CharField(max_length=150, db_column='Control', blank=True) # Field name made lowercase.
    id_delegacion = models.IntegerField(null=True, db_column='Id_Delegacion', blank=True) # Field name made lowercase.
    delegacion = models.CharField(max_length=765, db_column='Delegacion', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    vehiculo_tipo = models.CharField(max_length=765, db_column='Vehiculo_Tipo', blank=True) # Field name made lowercase.
    activo = models.IntegerField()
    estatus = models.IntegerField(null=True, db_column='Estatus', blank=True) # Field name made lowercase.
    dependencia = models.CharField(max_length=150, db_column='Dependencia', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'CAT_GPS_OLD'

class CatTabuladorPresidencia(models.Model):
    id = models.IntegerField(primary_key=True)
    id_tabulador = models.IntegerField(null=True, db_column='ID_TABULADOR', blank=True) # Field name made lowercase.
    tipcon = models.CharField(max_length=15, db_column='TIPCON', blank=True) # Field name made lowercase.
    numcon = models.IntegerField(null=True, db_column='NUMCON', blank=True) # Field name made lowercase.
    artfra = models.CharField(max_length=765, db_column='ARTFRA', blank=True) # Field name made lowercase.
    feccon = models.IntegerField(null=True, db_column='FECCON', blank=True) # Field name made lowercase.
    descon = models.CharField(max_length=765, db_column='DESCON', blank=True) # Field name made lowercase.
    salmin = models.IntegerField(null=True, db_column='SALMIN', blank=True) # Field name made lowercase.
    dias = models.IntegerField(null=True, db_column='DIAS', blank=True) # Field name made lowercase.
    import_field = models.FloatField(null=True, db_column='IMPORT', blank=True) # Field name made lowercase. Field renamed because it was a Python reserved word.
    dcto = models.IntegerField(null=True, db_column='DCTO', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'CAT_TABULADOR_PRESIDENCIA'

class CatTabuladorPresidenciaOld(models.Model):
    id = models.IntegerField(primary_key=True)
    id_tabulador = models.IntegerField(null=True, db_column='ID_TABULADOR', blank=True) # Field name made lowercase.
    tipcon = models.CharField(max_length=15, db_column='TIPCON', blank=True) # Field name made lowercase.
    numcon = models.IntegerField(null=True, db_column='NUMCON', blank=True) # Field name made lowercase.
    artfra = models.CharField(max_length=765, db_column='ARTFRA', blank=True) # Field name made lowercase.
    feccon = models.IntegerField(null=True, db_column='FECCON', blank=True) # Field name made lowercase.
    descon = models.CharField(max_length=765, db_column='DESCON', blank=True) # Field name made lowercase.
    salmin = models.IntegerField(null=True, db_column='SALMIN', blank=True) # Field name made lowercase.
    dias = models.IntegerField(null=True, db_column='DIAS', blank=True) # Field name made lowercase.
    import_field = models.FloatField(null=True, db_column='IMPORT', blank=True) # Field name made lowercase. Field renamed because it was a Python reserved word.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'CAT_TABULADOR_PRESIDENCIA_OLD'

class ControlLlamadas(models.Model):
    id = models.IntegerField(primary_key=True)
    status = models.IntegerField(db_column='STATUS') # Field name made lowercase.
    quien_llama = models.CharField(max_length=300, db_column='QUIEN_LLAMA', blank=True) # Field name made lowercase.
    usuario = models.CharField(max_length=150, db_column='USUARIO', blank=True) # Field name made lowercase.
    fecha_ini = models.DateTimeField(null=True, db_column='FECHA_INI', blank=True) # Field name made lowercase.
    fecha_fin = models.DateTimeField(null=True, db_column='FECHA_FIN', blank=True) # Field name made lowercase.
    asunto = models.CharField(max_length=600, db_column='ASUNTO', blank=True) # Field name made lowercase.
    comentarios = models.TextField(db_column='COMENTARIOS', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='ACTIVO', blank=True) # Field name made lowercase.
    prioridad = models.IntegerField(null=True, db_column='PRIORIDAD', blank=True) # Field name made lowercase.
    resultado_obs = models.TextField(db_column='RESULTADO_OBS', blank=True) # Field name made lowercase.
    con_copia = models.IntegerField(null=True, db_column='CON_COPIA', blank=True) # Field name made lowercase.
    id_asunto = models.IntegerField(null=True, db_column='ID_ASUNTO', blank=True) # Field name made lowercase.
    destino = models.IntegerField(null=True, db_column='DESTINO', blank=True) # Field name made lowercase.
    id_origen = models.IntegerField(db_column='ID_ORIGEN') # Field name made lowercase.
    class Meta:
        db_table = u'CONTROL_LLAMADAS'

class CComandancias(models.Model):
    id = models.IntegerField(primary_key=True)
    comandancia = models.CharField(max_length=150, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.delegacion + " -- "  + self.comandancia
    class Meta:
        db_table = u'C_Comandancias'

class CCalles(models.Model):
    id = models.IntegerField(primary_key=True)
    calle = models.CharField(max_length=150, blank=True)
    id_colonia = models.IntegerField(null=True, blank=True)
    abreviado = models.CharField(max_length=30, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.calle
    class Meta:
        db_table = u'C_Calles'

class CDelegaciones(models.Model):
    id = models.IntegerField(primary_key=True)
    delegacion = models.CharField(max_length=150, blank=True)
    del_corto = models.CharField(max_length=60, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.delegacion 
    class Meta:
        db_table = u'C_Delegaciones'

class CDelegados(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=150, db_column='Nombre', blank=True) # Field name made lowercase.
    apepaterno = models.CharField(max_length=150, db_column='ApePaterno', blank=True) # Field name made lowercase.
    apematerno = models.CharField(max_length=150, db_column='ApeMaterno', blank=True) # Field name made lowercase.
    delegacion = models.IntegerField(null=True, db_column='Delegacion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'C_Delegados'

class CTipoVehiculo(models.Model):
    id = models.IntegerField(primary_key=True, db_column='ID') # Field name made lowercase.
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    def __unicode__(self):
        return self.tipo 
    class Meta:
        db_table = u'C_Tipo_Vehiculo'

class CTurnos(models.Model):
    id = models.AutoField(primary_key=True)
    turno = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.marca + " -- "  + self.submarca
    class Meta:
        db_table = u'C_Turnos'

class Corporaciones(models.Model):
    id = models.IntegerField(primary_key=True)
    corporacion = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.corporacion
    class Meta:
        db_table = u'Corporaciones'

class Competentes(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.nombre
    class Meta:
        db_table = u'Competentes'

class Mps(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Mps'

class CatHora(models.Model):
    id = models.IntegerField(primary_key=True)
    hora_text = models.CharField(max_length=150, blank=True)
    hora = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'Cat_Hora'

class ClasificacionIncidentes(models.Model):
    id = models.IntegerField(primary_key=True)
    clas_orga = models.CharField(max_length=765, db_column='Clas_orga', blank=True) # Field name made lowercase.
    clas_predecesor = models.IntegerField(null=True, db_column='Clas_predecesor', blank=True) # Field name made lowercase.
    clas_titulo = models.CharField(max_length=765, db_column='Clas_titulo', blank=True) # Field name made lowercase.
    clas_desc = models.CharField(max_length=3000, db_column='Clas_desc', blank=True) # Field name made lowercase.
    clas_fecha = models.DateTimeField(null=True, db_column='Clas_fecha', blank=True) # Field name made lowercase.
    clas_ruta = models.CharField(max_length=765, db_column='Clas_Ruta', blank=True) # Field name made lowercase.
    otro_id = models.IntegerField(null=True, db_column='Otro_ID', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Clasificacion_Incidentes'

class CuboAccidentes2010(models.Model):
    id = models.IntegerField(primary_key=True)
    fecha_registro_real = models.DateTimeField(null=True, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    horas = models.IntegerField(null=True, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    comandancia = models.CharField(max_length=150, blank=True)
    turno = models.CharField(max_length=150, blank=True)
    clasificacion = models.CharField(max_length=150, blank=True)
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    visibilidad = models.CharField(max_length=150, blank=True)
    dia_noche = models.CharField(max_length=150, blank=True)
    colonia = models.CharField(max_length=765, blank=True)
    id_calle1 = models.CharField(max_length=900, db_column='Id_calle1', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=765, blank=True)
    id_calle2 = models.CharField(max_length=900, db_column='Id_calle2', blank=True) # Field name made lowercase.
    calle2 = models.CharField(max_length=765, blank=True)
    parte_o_convenio = models.CharField(max_length=15, blank=True)
    alicamino = models.CharField(max_length=150, db_column='AliCamino', blank=True) # Field name made lowercase.
    edo_pavimento = models.CharField(max_length=150, blank=True)
    clima = models.CharField(max_length=150, blank=True)
    regulacion = models.CharField(max_length=150, blank=True)
    tipo_calle = models.CharField(max_length=150, blank=True)
    num_carriles = models.IntegerField(null=True, blank=True)
    sentido_calles = models.CharField(max_length=60, blank=True)
    tipo_regla = models.CharField(max_length=45, blank=True)
    articulo = models.CharField(max_length=750, blank=True)
    parrafo = models.CharField(max_length=750, blank=True)
    concepto = models.CharField(max_length=765, blank=True)
    id_unico = models.CharField(max_length=300, blank=True)
    id_preliminar = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Cubo_Accidentes2010'

class CuboAccidentessinfalta2010(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    servicio = models.IntegerField(null=True, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    horas = models.IntegerField(null=True, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    comandancia = models.CharField(max_length=150, blank=True)
    turno = models.CharField(max_length=150, blank=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    infractor_edad = models.IntegerField(null=True, blank=True)
    infractor_sexo = models.IntegerField(null=True, blank=True)
    estado = models.CharField(max_length=150, blank=True)
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=765, blank=True)
    calle2 = models.CharField(max_length=765, blank=True)
    colonia = models.CharField(max_length=765, blank=True)
    sp_tipo = models.CharField(max_length=150, blank=True)
    infractor_presente = models.CharField(max_length=3, blank=True)
    se_recogio = models.CharField(max_length=90, blank=True)
    conductor_estado = models.CharField(max_length=150, blank=True)
    tipo_operativo = models.CharField(max_length=150, blank=True)
    tipo_regla = models.CharField(max_length=45, blank=True)
    articulo = models.CharField(max_length=450, blank=True)
    parrafo = models.CharField(max_length=450, blank=True)
    concepto = models.CharField(max_length=900, blank=True)
    class Meta:
        db_table = u'Cubo_AccidentesSinFalta2010'

class CuboInfracciones2010(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    servicio = models.IntegerField(null=True, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    horas = models.IntegerField(null=True, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    comandancia = models.CharField(max_length=150, blank=True)
    turno = models.CharField(max_length=150, blank=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    infractor_edad = models.IntegerField(null=True, blank=True)
    infractor_sexo = models.IntegerField(null=True, blank=True)
    estado = models.CharField(max_length=150, blank=True)
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    calle1 = models.CharField(max_length=765, blank=True)
    calle2 = models.CharField(max_length=765, blank=True)
    colonia = models.CharField(max_length=765, blank=True)
    sp_tipo = models.CharField(max_length=150, blank=True)
    infractor_presente = models.CharField(max_length=3, blank=True)
    se_recogio = models.CharField(max_length=90, blank=True)
    conductor_estado = models.CharField(max_length=150, blank=True)
    tipo_operativo = models.CharField(max_length=150, blank=True)
    tipo_regla = models.CharField(max_length=45, blank=True)
    articulo = models.CharField(max_length=450, blank=True)
    parrafo = models.CharField(max_length=450, blank=True)
    concepto = models.CharField(max_length=900, blank=True)
    class Meta:
        db_table = u'Cubo_Infracciones2010'

class CuboInvolucrados2010(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=300, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    fecha_registro_real = models.DateTimeField(null=True, blank=True)
    convenio_hora = models.DateTimeField(null=True, blank=True)
    horas = models.IntegerField(null=True, blank=True)
    minutos = models.IntegerField(null=True, blank=True)
    delegacion = models.CharField(max_length=150, blank=True)
    comandancia = models.CharField(max_length=150, blank=True)
    turno = models.CharField(max_length=150, blank=True)
    clasificacion = models.CharField(max_length=150, blank=True)
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    colonia = models.CharField(max_length=765, blank=True)
    calle1 = models.CharField(max_length=765, blank=True)
    calle2 = models.CharField(max_length=765, blank=True)
    participa = models.CharField(max_length=150, blank=True)
    estado_herido = models.CharField(max_length=300, db_column='Estado_herido', blank=True) # Field name made lowercase.
    parte_o_convenio = models.CharField(max_length=15, blank=True)
    edad = models.IntegerField(null=True, blank=True)
    estado = models.CharField(max_length=150, blank=True)
    nacionalidad = models.CharField(max_length=150, blank=True)
    sexo = models.IntegerField(null=True, blank=True)
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    serviciopp = models.IntegerField(null=True, blank=True)
    edo_ebriedad = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'Cubo_Involucrados2010'

class InvBicicleta(models.Model):
    id = models.IntegerField(primary_key=True)
    id_inventario = models.IntegerField(db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    espejo = models.IntegerField(null=True, db_column='Espejo', blank=True) # Field name made lowercase.
    freno_tras = models.IntegerField(null=True, db_column='Freno_Tras', blank=True) # Field name made lowercase.
    parrilla = models.IntegerField(null=True, db_column='Parrilla', blank=True) # Field name made lowercase.
    frenos_del = models.IntegerField(null=True, db_column='Frenos_Del', blank=True) # Field name made lowercase.
    salpicadera = models.IntegerField(null=True, db_column='Salpicadera', blank=True) # Field name made lowercase.
    cables = models.IntegerField(null=True, db_column='Cables', blank=True) # Field name made lowercase.
    rin_del = models.IntegerField(null=True, db_column='Rin_Del', blank=True) # Field name made lowercase.
    tapones = models.IntegerField(null=True, db_column='Tapones', blank=True) # Field name made lowercase.
    llanta_del = models.IntegerField(null=True, db_column='Llanta_Del', blank=True) # Field name made lowercase.
    gomas = models.IntegerField(null=True, db_column='Gomas', blank=True) # Field name made lowercase.
    suspencion = models.IntegerField(null=True, db_column='Suspencion', blank=True) # Field name made lowercase.
    rayos = models.IntegerField(null=True, db_column='Rayos', blank=True) # Field name made lowercase.
    amortiguadores = models.IntegerField(null=True, db_column='Amortiguadores', blank=True) # Field name made lowercase.
    rueda = models.IntegerField(null=True, db_column='Rueda', blank=True) # Field name made lowercase.
    manubrios = models.IntegerField(null=True, db_column='Manubrios', blank=True) # Field name made lowercase.
    t_asiento = models.IntegerField(null=True, db_column='T_Asiento', blank=True) # Field name made lowercase.
    punios = models.IntegerField(null=True, db_column='Punios', blank=True) # Field name made lowercase.
    asiento = models.IntegerField(null=True, db_column='Asiento', blank=True) # Field name made lowercase.
    salpicadera_tras = models.IntegerField(null=True, db_column='Salpicadera_Tras', blank=True) # Field name made lowercase.
    claxon = models.IntegerField(null=True, db_column='Claxon', blank=True) # Field name made lowercase.
    llanta_tras = models.IntegerField(null=True, db_column='Llanta_Tras', blank=True) # Field name made lowercase.
    dinamo = models.IntegerField(null=True, db_column='Dinamo', blank=True) # Field name made lowercase.
    rin_tras = models.IntegerField(null=True, db_column='Rin_Tras', blank=True) # Field name made lowercase.
    cuernos = models.IntegerField(null=True, db_column='Cuernos', blank=True) # Field name made lowercase.
    cambio_tras = models.IntegerField(null=True, db_column='Cambio_Tras', blank=True) # Field name made lowercase.
    rotor = models.IntegerField(null=True, db_column='Rotor', blank=True) # Field name made lowercase.
    ejes = models.IntegerField(null=True, db_column='Ejes', blank=True) # Field name made lowercase.
    candado = models.IntegerField(null=True, db_column='Candado', blank=True) # Field name made lowercase.
    masas = models.IntegerField(null=True, db_column='Masas', blank=True) # Field name made lowercase.
    estrella = models.IntegerField(null=True, db_column='Estrella', blank=True) # Field name made lowercase.
    diablos_del = models.IntegerField(null=True, db_column='Diablos_Del', blank=True) # Field name made lowercase.
    cambio_cent = models.IntegerField(null=True, db_column='Cambio_Cent', blank=True) # Field name made lowercase.
    diablos_tras = models.IntegerField(null=True, db_column='Diablos_Tras', blank=True) # Field name made lowercase.
    palancas = models.IntegerField(null=True, db_column='Palancas', blank=True) # Field name made lowercase.
    pedales = models.IntegerField(null=True, db_column='Pedales', blank=True) # Field name made lowercase.
    poste = models.IntegerField(null=True, db_column='Poste', blank=True) # Field name made lowercase.
    cuadro = models.IntegerField(null=True, db_column='Cuadro', blank=True) # Field name made lowercase.
    zeta = models.IntegerField(null=True, db_column='Zeta', blank=True) # Field name made lowercase.
    orquilla = models.IntegerField(null=True, db_column='Orquilla', blank=True) # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Bicicleta'

class InvCajuela(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    cajuela = models.TextField(db_column='Cajuela', blank=True) # Field name made lowercase.
    gato = models.IntegerField(null=True, db_column='Gato', blank=True) # Field name made lowercase.
    llaves = models.IntegerField(null=True, db_column='Llaves', blank=True) # Field name made lowercase.
    desarmadores = models.IntegerField(null=True, db_column='Desarmadores', blank=True) # Field name made lowercase.
    pinzas = models.IntegerField(null=True, db_column='Pinzas', blank=True) # Field name made lowercase.
    cruzeta = models.IntegerField(null=True, db_column='Cruzeta', blank=True) # Field name made lowercase.
    banderas = models.IntegerField(null=True, db_column='Banderas', blank=True) # Field name made lowercase.
    palancas = models.IntegerField(null=True, db_column='Palancas', blank=True) # Field name made lowercase.
    extintor = models.IntegerField(null=True, db_column='Extintor', blank=True) # Field name made lowercase.
    llantas_ref = models.IntegerField(null=True, db_column='Llantas_Ref', blank=True) # Field name made lowercase.
    otros = models.TextField(db_column='Otros', blank=True) # Field name made lowercase.
    gasolina = models.TextField(db_column='Gasolina', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cajuela'

class InvCatAgenciasMp(models.Model):
    id = models.IntegerField(primary_key=True)
    id_ubicacion = models.IntegerField(null=True, db_column='ID_UBICACION', blank=True) # Field name made lowercase.
    agencia = models.CharField(max_length=150, db_column='AGENCIA', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    def __unicode__(self):
        return self.agencia
    class Meta:
        db_table = u'Inv_Cat_Agencias_MP'

class InvCatAgenciasUbicacion(models.Model):
    id = models.IntegerField(primary_key=True)
    ubicacion = models.CharField(max_length=150, db_column='Ubicacion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Agencias_Ubicacion'

class InvCatDependencias(models.Model):
    id = models.IntegerField(primary_key=True, db_column='Id') # Field name made lowercase.
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Dependencias'

class InvCatDeposito(models.Model):
    id = models.IntegerField(primary_key=True, db_column='Id') # Field name made lowercase.
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Deposito'

class InvCatDocumentos(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=300, db_column='Nombre', blank=True) # Field name made lowercase.
    descripcion = models.CharField(max_length=300, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Documentos'

class InvCatEstatus(models.Model):
    id = models.IntegerField(primary_key=True, db_column='Id') # Field name made lowercase.
    descripcion = models.CharField(max_length=30, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Estatus'

class InvCatLiberacionCajas(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Inv_Cat_Liberacion_Cajas'

class InvCatLiberacionVehiculo(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo_persona = models.CharField(max_length=150, blank=True)
    tipo_vehiculo = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Inv_Cat_Liberacion_Vehiculo'

class InvCatLiberacionVehiculoDoctos(models.Model):
    id = models.IntegerField(primary_key=True)
    id_tipo_vehiculo = models.IntegerField(null=True, blank=True)
    inciso = models.CharField(max_length=3, blank=True)
    descripcion = models.CharField(max_length=750, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Inv_Cat_Liberacion_Vehiculo_Doctos'

class InvCatLugar(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Lugar'

class InvCatLugarPago(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=300, db_column='Nombre', blank=True) # Field name made lowercase.
    descripcion = models.CharField(max_length=300, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Lugar_Pago'

class InvCatResguardo(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    id_dependencia = models.IntegerField(null=True, db_column='Id_Dependencia', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Resguardo'

class InvCatTipoVehiculo(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo = models.CharField(max_length=150, db_column='Tipo', blank=True) # Field name made lowercase.
    orden = models.IntegerField(null=True, db_column='Orden', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Cat_Tipo_Vehiculo'

class InvCostadoDerecho(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    costado_derecho = models.TextField(db_column='Costado_Derecho', blank=True) # Field name made lowercase.
    salpicadera_del_d = models.IntegerField(null=True, db_column='Salpicadera_Del_D', blank=True) # Field name made lowercase.
    puerta_del_d = models.IntegerField(null=True, db_column='Puerta_Del_D', blank=True) # Field name made lowercase.
    puerta_tras_d = models.IntegerField(null=True, db_column='Puerta_Tras_D', blank=True) # Field name made lowercase.
    espejo_lateral_d = models.IntegerField(null=True, db_column='Espejo_Lateral_D', blank=True) # Field name made lowercase.
    cristales_puertas_d = models.IntegerField(null=True, db_column='Cristales_Puertas_D', blank=True) # Field name made lowercase.
    aletas_d = models.IntegerField(null=True, db_column='Aletas_D', blank=True) # Field name made lowercase.
    salpicadera_tras_d = models.IntegerField(null=True, db_column='Salpicadera_Tras_D', blank=True) # Field name made lowercase.
    manijas_d = models.IntegerField(null=True, db_column='Manijas_D', blank=True) # Field name made lowercase.
    llantas_d = models.IntegerField(null=True, db_column='Llantas_D', blank=True) # Field name made lowercase.
    rines_d = models.IntegerField(null=True, db_column='Rines_D', blank=True) # Field name made lowercase.
    polveras_d = models.IntegerField(null=True, db_column='Polveras_D', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Costado_Derecho'

class InvCostadoIzquierdo(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    costado_izquierdo = models.TextField(db_column='Costado_Izquierdo', blank=True) # Field name made lowercase.
    salpicadera_del_i = models.IntegerField(null=True, db_column='Salpicadera_Del_I', blank=True) # Field name made lowercase.
    puerta_del_i = models.IntegerField(null=True, db_column='Puerta_Del_I', blank=True) # Field name made lowercase.
    puerta_tras_i = models.IntegerField(null=True, db_column='Puerta_Tras_I', blank=True) # Field name made lowercase.
    espejo_lateral_i = models.IntegerField(null=True, db_column='Espejo_Lateral_I', blank=True) # Field name made lowercase.
    cristales_puertas_i = models.IntegerField(null=True, db_column='Cristales_Puertas_I', blank=True) # Field name made lowercase.
    aletas_i = models.IntegerField(null=True, db_column='Aletas_I', blank=True) # Field name made lowercase.
    salpicadera_tras_i = models.IntegerField(null=True, db_column='Salpicadera_Tras_I', blank=True) # Field name made lowercase.
    manijas_i = models.IntegerField(null=True, db_column='Manijas_I', blank=True) # Field name made lowercase.
    llantas_i = models.IntegerField(null=True, db_column='Llantas_I', blank=True) # Field name made lowercase.
    rines_i = models.IntegerField(null=True, db_column='Rines_I', blank=True) # Field name made lowercase.
    polveras_i = models.IntegerField(null=True, db_column='Polveras_I', blank=True) # Field name made lowercase.
    molduras_i = models.IntegerField(null=True, db_column='Molduras_I', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Costado_Izquierdo'

class InvInterior(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    interior = models.TextField(db_column='Interior', blank=True) # Field name made lowercase.
    guantera = models.IntegerField(null=True, db_column='Guantera', blank=True) # Field name made lowercase.
    chapa = models.IntegerField(null=True, db_column='Chapa', blank=True) # Field name made lowercase.
    perilla_vel = models.IntegerField(null=True, db_column='Perilla_Vel', blank=True) # Field name made lowercase.
    direccion = models.IntegerField(null=True, db_column='Direccion', blank=True) # Field name made lowercase.
    freno_mano = models.IntegerField(null=True, db_column='Freno_Mano', blank=True) # Field name made lowercase.
    encendedor = models.IntegerField(null=True, db_column='Encendedor', blank=True) # Field name made lowercase.
    tapiceria = models.IntegerField(null=True, db_column='Tapiceria', blank=True) # Field name made lowercase.
    cabeceras = models.IntegerField(null=True, db_column='Cabeceras', blank=True) # Field name made lowercase.
    coderas = models.IntegerField(null=True, db_column='Coderas', blank=True) # Field name made lowercase.
    direccionales = models.IntegerField(null=True, db_column='Direccionales', blank=True) # Field name made lowercase.
    tablero = models.IntegerField(null=True, db_column='Tablero', blank=True) # Field name made lowercase.
    retrovisor = models.IntegerField(null=True, db_column='Retrovisor', blank=True) # Field name made lowercase.
    tapetes = models.IntegerField(null=True, db_column='Tapetes', blank=True) # Field name made lowercase.
    perilla_luces = models.IntegerField(null=True, db_column='Perilla_Luces', blank=True) # Field name made lowercase.
    cenicero = models.IntegerField(null=True, db_column='Cenicero', blank=True) # Field name made lowercase.
    manijas_manivelas = models.IntegerField(null=True, db_column='Manijas_Manivelas', blank=True) # Field name made lowercase.
    radio_int = models.IntegerField(null=True, db_column='Radio_Int', blank=True) # Field name made lowercase.
    estereo = models.IntegerField(null=True, db_column='Estereo', blank=True) # Field name made lowercase.
    ecualizador = models.IntegerField(null=True, db_column='Ecualizador', blank=True) # Field name made lowercase.
    fuente_poder = models.IntegerField(null=True, db_column='Fuente_Poder', blank=True) # Field name made lowercase.
    biceras = models.IntegerField(null=True, db_column='Biceras', blank=True) # Field name made lowercase.
    bocinas = models.IntegerField(null=True, db_column='Bocinas', blank=True) # Field name made lowercase.
    bafles = models.IntegerField(null=True, db_column='Bafles', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Interior'

class InvMotocicleta(models.Model):
    id = models.IntegerField(primary_key=True)
    id_inventario = models.IntegerField(db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    tanque = models.IntegerField(null=True, db_column='Tanque', blank=True) # Field name made lowercase.
    rin_tras = models.IntegerField(null=True, db_column='Rin_Tras', blank=True) # Field name made lowercase.
    tapon_gas = models.IntegerField(null=True, db_column='Tapon_gas', blank=True) # Field name made lowercase.
    llanta_tras = models.IntegerField(null=True, db_column='Llanta_Tras', blank=True) # Field name made lowercase.
    parabrisas = models.IntegerField(null=True, db_column='Parabrisas', blank=True) # Field name made lowercase.
    freno_tras = models.IntegerField(null=True, db_column='Freno_Tras', blank=True) # Field name made lowercase.
    espejo = models.IntegerField(null=True, db_column='Espejo', blank=True) # Field name made lowercase.
    luces_tras = models.IntegerField(null=True, db_column='Luces_Tras', blank=True) # Field name made lowercase.
    faro_del = models.IntegerField(null=True, db_column='Faro_Del', blank=True) # Field name made lowercase.
    calavera = models.IntegerField(null=True, db_column='Calavera', blank=True) # Field name made lowercase.
    parrilla = models.IntegerField(null=True, db_column='Parrilla', blank=True) # Field name made lowercase.
    motor = models.IntegerField(null=True, db_column='Motor', blank=True) # Field name made lowercase.
    salpicadera = models.IntegerField(null=True, db_column='Salpicadera', blank=True) # Field name made lowercase.
    cabezas = models.IntegerField(null=True, db_column='Cabezas', blank=True) # Field name made lowercase.
    rin_del = models.IntegerField(null=True, db_column='Rin_Del', blank=True) # Field name made lowercase.
    tapas = models.IntegerField(null=True, db_column='Tapas', blank=True) # Field name made lowercase.
    llanta_del = models.IntegerField(null=True, db_column='Llanta_Del', blank=True) # Field name made lowercase.
    pastillas = models.IntegerField(null=True, db_column='Pastillas', blank=True) # Field name made lowercase.
    frenos_del = models.IntegerField(null=True, db_column='Frenos_Del', blank=True) # Field name made lowercase.
    encendido = models.IntegerField(null=True, db_column='Encendido', blank=True) # Field name made lowercase.
    luces_del = models.IntegerField(null=True, db_column='Luces_Del', blank=True) # Field name made lowercase.
    carburador = models.IntegerField(null=True, db_column='Carburador', blank=True) # Field name made lowercase.
    suspencion = models.IntegerField(null=True, db_column='Suspencion', blank=True) # Field name made lowercase.
    cables = models.IntegerField(null=True, db_column='Cables', blank=True) # Field name made lowercase.
    amortiguadores = models.IntegerField(null=True, db_column='Amortiguadores', blank=True) # Field name made lowercase.
    marcha = models.IntegerField(null=True, db_column='Marcha', blank=True) # Field name made lowercase.
    manubrios = models.IntegerField(null=True, db_column='Manubrios', blank=True) # Field name made lowercase.
    palanca = models.IntegerField(null=True, db_column='Palanca', blank=True) # Field name made lowercase.
    punios = models.IntegerField(null=True, db_column='Punios', blank=True) # Field name made lowercase.
    bobina = models.IntegerField(null=True, db_column='Bobina', blank=True) # Field name made lowercase.
    radiador = models.IntegerField(null=True, db_column='Radiador', blank=True) # Field name made lowercase.
    bateria = models.IntegerField(null=True, db_column='Bateria', blank=True) # Field name made lowercase.
    filtro = models.IntegerField(null=True, db_column='Filtro', blank=True) # Field name made lowercase.
    t_aceite = models.IntegerField(null=True, db_column='T_Aceite', blank=True) # Field name made lowercase.
    asiento = models.IntegerField(null=True, db_column='Asiento', blank=True) # Field name made lowercase.
    salpicadera_tras = models.IntegerField(null=True, db_column='Salpicadera_Tras', blank=True) # Field name made lowercase.
    tapas_costado = models.IntegerField(null=True, db_column='Tapas_costado', blank=True) # Field name made lowercase.
    periquete = models.IntegerField(null=True, db_column='Periquete', blank=True) # Field name made lowercase.
    spoiler = models.IntegerField(null=True, db_column='Spoiler', blank=True) # Field name made lowercase.
    colilla = models.IntegerField(null=True, db_column='Colilla', blank=True) # Field name made lowercase.
    tablillas = models.IntegerField(null=True, db_column='Tablillas', blank=True) # Field name made lowercase.
    claxon = models.TextField(db_column='Claxon', blank=True) # Field name made lowercase.
    tapiceria = models.TextField(db_column='Tapiceria', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Motocicleta'

class InvMotor(models.Model):
    id_inventario = models.IntegerField(primary_key=True, db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    acc_motor = models.CharField(max_length=150, db_column='Acc_Motor', blank=True) # Field name made lowercase.
    carburador = models.CharField(max_length=150, db_column='Carburador', blank=True) # Field name made lowercase.
    claxon = models.CharField(max_length=150, db_column='Claxon', blank=True) # Field name made lowercase.
    bujias = models.CharField(max_length=150, db_column='Bujias', blank=True) # Field name made lowercase.
    tapa_dist = models.CharField(max_length=150, db_column='Tapa_dist', blank=True) # Field name made lowercase.
    compresora = models.CharField(max_length=150, db_column='Compresora', blank=True) # Field name made lowercase.
    tapon_aceite = models.CharField(max_length=150, db_column='Tapon_aceite', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    bobina = models.CharField(max_length=150, db_column='Bobina', blank=True) # Field name made lowercase.
    radiador = models.CharField(max_length=150, db_column='Radiador', blank=True) # Field name made lowercase.
    adicionales = models.CharField(max_length=150, db_column='Adicionales', blank=True) # Field name made lowercase.
    filtro_aire = models.CharField(max_length=150, db_column='Filtro_aire', blank=True) # Field name made lowercase.
    bayoneta = models.CharField(max_length=150, db_column='Bayoneta', blank=True) # Field name made lowercase.
    alternador = models.CharField(max_length=150, db_column='Alternador', blank=True) # Field name made lowercase.
    marcha = models.CharField(max_length=150, db_column='Marcha', blank=True) # Field name made lowercase.
    bateria = models.CharField(max_length=150, db_column='Bateria', blank=True) # Field name made lowercase.
    bandas = models.CharField(max_length=150, db_column='Bandas', blank=True) # Field name made lowercase.
    calefaccion = models.CharField(max_length=150, db_column='Calefaccion', blank=True) # Field name made lowercase.
    mangueras = models.CharField(max_length=150, db_column='Mangueras', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Motor'

class InvParteFrente(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    parte_frente = models.TextField(db_column='Parte_Frente', blank=True) # Field name made lowercase.
    cofre = models.IntegerField(null=True, db_column='Cofre', blank=True) # Field name made lowercase.
    toldo = models.IntegerField(null=True, db_column='Toldo', blank=True) # Field name made lowercase.
    parabrisas = models.IntegerField(null=True, db_column='Parabrisas', blank=True) # Field name made lowercase.
    luz_izq = models.IntegerField(null=True, db_column='Luz_Izq', blank=True) # Field name made lowercase.
    luz_der = models.IntegerField(null=True, db_column='Luz_Der', blank=True) # Field name made lowercase.
    parrilla = models.IntegerField(null=True, db_column='Parrilla', blank=True) # Field name made lowercase.
    defensa_del = models.IntegerField(null=True, db_column='Defensa_Del', blank=True) # Field name made lowercase.
    facia_del = models.IntegerField(null=True, db_column='Facia_Del', blank=True) # Field name made lowercase.
    tablillas_del = models.IntegerField(null=True, db_column='Tablillas_Del', blank=True) # Field name made lowercase.
    cuarto_izq_del = models.IntegerField(null=True, db_column='Cuarto_Izq_Del', blank=True) # Field name made lowercase.
    cuarto_der_del = models.IntegerField(null=True, db_column='Cuarto_Der_Del', blank=True) # Field name made lowercase.
    limpiadores_del = models.IntegerField(null=True, db_column='Limpiadores_Del', blank=True) # Field name made lowercase.
    emblemas = models.IntegerField(null=True, db_column='Emblemas', blank=True) # Field name made lowercase.
    spoilers = models.IntegerField(null=True, db_column='Spoilers', blank=True) # Field name made lowercase.
    faros_niebla = models.IntegerField(null=True, db_column='Faros_Niebla', blank=True) # Field name made lowercase.
    burrera = models.IntegerField(null=True, db_column='Burrera', blank=True) # Field name made lowercase.
    accesorios_del = models.IntegerField(null=True, db_column='Accesorios_Del', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Parte_Frente'
#parriba
class InvPartePosterior(models.Model):
    id_inventario = models.IntegerField(primary_key=True,db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    parte_posterior = models.TextField(db_column='Parte_Posterior', blank=True) # Field name made lowercase.
    cajuela_tras = models.IntegerField(null=True, db_column='Cajuela_Tras', blank=True) # Field name made lowercase.
    medallon = models.IntegerField(null=True, db_column='Medallon', blank=True) # Field name made lowercase.
    calavera_der = models.IntegerField(null=True, db_column='Calavera_Der', blank=True) # Field name made lowercase.
    calavera_izq = models.IntegerField(null=True, db_column='Calavera_Izq', blank=True) # Field name made lowercase.
    cuarto_der = models.IntegerField(null=True, db_column='Cuarto_Der', blank=True) # Field name made lowercase.
    cuarto_izq = models.IntegerField(null=True, db_column='Cuarto_Izq', blank=True) # Field name made lowercase.
    defensa_tras = models.IntegerField(null=True, db_column='Defensa_Tras', blank=True) # Field name made lowercase.
    facia_tras = models.IntegerField(null=True, db_column='Facia_Tras', blank=True) # Field name made lowercase.
    tablillas_tras = models.IntegerField(null=True, db_column='Tablillas_Tras', blank=True) # Field name made lowercase.
    limpiadores_tras = models.IntegerField(null=True, db_column='Limpiadores_Tras', blank=True) # Field name made lowercase.
    emblema = models.IntegerField(null=True, db_column='Emblema', blank=True) # Field name made lowercase.
    spoiler = models.IntegerField(null=True, db_column='Spoiler', blank=True) # Field name made lowercase.
    colilla_escape = models.IntegerField(null=True, db_column='Colilla_Escape', blank=True) # Field name made lowercase.
    accesorios_tras = models.IntegerField(null=True, db_column='Accesorios_Tras', blank=True) # Field name made lowercase.
    stop_tras = models.IntegerField(null=True, db_column='Stop_Tras', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Parte_Posterior'

class InvSalidaVehiculo(models.Model):
    id = models.IntegerField(primary_key=True)
    id_temp = models.CharField(max_length=150, db_column='Id_temp', blank=True) # Field name made lowercase.
    id_inventario = models.IntegerField(null=True, db_column='Id_Inventario', blank=True) # Field name made lowercase.
    id_tipo_vehiculo = models.IntegerField(null=True, db_column='Id_tipo_vehiculo', blank=True) # Field name made lowercase.
    id_documento = models.IntegerField(null=True, db_column='Id_documento', blank=True) # Field name made lowercase.
    docto_nombre = models.CharField(max_length=240, db_column='Docto_nombre', blank=True) # Field name made lowercase.
    docto_apepaterno = models.CharField(max_length=150, db_column='Docto_apepaterno', blank=True) # Field name made lowercase.
    docto_apematerno = models.CharField(max_length=150, db_column='Docto_apematerno', blank=True) # Field name made lowercase.
    docto_escaneado = models.CharField(max_length=600, db_column='Docto_escaneado', blank=True) # Field name made lowercase.
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inv_Salida_Vehiculo'
class DocumentosInv(models.Model):
    id = models.AutoField(primary_key=True)
    id_inventario=  models.IntegerField( blank=True)
    nombre=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'DocumentosInv'
class ReciboInv(models.Model):
    id = models.AutoField(primary_key=True)
    id_inventario=  models.IntegerField( blank=True)
    recibo=models.CharField(max_length=50, blank=True)
    nombre=models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'ReciboInv'




class InventarioVehiculoCancelado(models.Model):
    id = models.IntegerField(primary_key=True)
    id_temp = models.CharField(max_length=300, db_column='Id_temp', blank=True) # Field name made lowercase.
    id_inventario = models.IntegerField(db_column='Id_Inventario') # Field name made lowercase.
    folio_inf_acc = models.IntegerField(null=True, db_column='Folio_inf_acc', blank=True) # Field name made lowercase.
    folio_accidente = models.IntegerField(null=True, db_column='Folio_accidente', blank=True) # Field name made lowercase.
    delegacion = models.IntegerField(null=True, blank=True)
    comandancia = models.IntegerField(null=True, blank=True)
    turno = models.IntegerField(null=True, blank=True)
    #servicio = models.IntegerField(null=True, db_column='Servicio', blank=True) # Field name made lowercase.
    tipo_servicio = models.IntegerField(null=True, db_column='tipo_servicio', blank=True) # Field name made lowercase.
    tipo_agentes = models.IntegerField(null=True, db_column='Tipo_Agentes', blank=True) # Field name made lowercase.
    folio_agentes = models.CharField(max_length=750, db_column='Folio_Agentes', blank=True) # Field name made lowercase.
    infrac_accid = models.CharField(max_length=750, db_column='Infrac_Accid', blank=True) # Field name made lowercase.
    id_resguardo = models.IntegerField(null=True, db_column='Id_Resguardo', blank=True) # Field name made lowercase.
    fecha_incid = models.DateTimeField(null=True, db_column='Fecha_Incid', blank=True) # Field name made lowercase.
    fecha_captura = models.DateTimeField(null=True, db_column='Fecha_captura', blank=True) # Field name made lowercase.
    fecha_modifica = models.DateTimeField(null=True, db_column='Fecha_modifica', blank=True) # Field name made lowercase.
    fecha_salida = models.DateTimeField(null=True, db_column='Fecha_salida', blank=True) # Field name made lowercase.
    pension_hora = models.CharField(max_length=150, db_column='Pension_Hora', blank=True) # Field name made lowercase.
    id_calle = models.IntegerField(null=True, db_column='ID_CALLE', blank=True) # Field name made lowercase.
    id_calle2 = models.IntegerField(null=True, db_column='ID_CALLE2', blank=True) # Field name made lowercase.
    id_colonia = models.IntegerField(null=True, db_column='ID_COLONIA', blank=True) # Field name made lowercase.
    interior = models.CharField(max_length=750, db_column='Interior', blank=True) # Field name made lowercase.
    exterior = models.CharField(max_length=750, db_column='Exterior', blank=True) # Field name made lowercase.
    depositado_en = models.IntegerField(null=True, db_column='Depositado_en', blank=True) # Field name made lowercase.
    observaciones = models.TextField(db_column='Observaciones', blank=True) # Field name made lowercase.
    vehiculo_llaves = models.IntegerField(null=True, db_column='Vehiculo_Llaves', blank=True) # Field name made lowercase.
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=300, db_column='Marca', blank=True) # Field name made lowercase.
    submarca = models.CharField(max_length=300, db_column='Submarca', blank=True) # Field name made lowercase.
    veh_modelo = models.CharField(max_length=300, blank=True)
    veh_color = models.IntegerField(null=True, blank=True)
    veh_color_detalle = models.CharField(max_length=750, blank=True)
    vehiculo_motor = models.CharField(max_length=750, db_column='Vehiculo_Motor', blank=True) # Field name made lowercase.
    veh_placas = models.CharField(max_length=300, blank=True)
    sin_placa = models.IntegerField(null=True, blank=True)
    sp_num_tarjeton = models.CharField(max_length=750, blank=True)
    veh_serie = models.CharField(max_length=750, blank=True)
    no_visible = models.IntegerField(null=True, blank=True)
    sp_tipo = models.CharField(max_length=750, blank=True)
    infractor_nombre = models.CharField(max_length=750, blank=True)
    infractor_apepaterno = models.CharField(max_length=750, blank=True)
    infractor_apematerno = models.CharField(max_length=750, blank=True)
    pension_lugar = models.IntegerField(null=True, db_column='Pension_Lugar', blank=True) # Field name made lowercase.
    pension_recibido_por = models.CharField(max_length=750, db_column='Pension_Recibido_por', blank=True) # Field name made lowercase.
    pension_llevado_por = models.CharField(max_length=750, db_column='Pension_Llevado_por', blank=True) # Field name made lowercase.
    pension_grua = models.IntegerField(null=True, db_column='Pension_grua', blank=True) # Field name made lowercase.
    pension_transito = models.IntegerField(null=True, db_column='Pension_transito', blank=True) # Field name made lowercase.
    pension_particular = models.IntegerField(null=True, db_column='Pension_Particular', blank=True) # Field name made lowercase.
    pension_propiosm = models.IntegerField(null=True, db_column='Pension_PropiosM', blank=True) # Field name made lowercase.
    usuario = models.CharField(max_length=150, db_column='Usuario', blank=True) # Field name made lowercase.
    pago = models.FloatField(null=True, db_column='Pago', blank=True) # Field name made lowercase.
    pago_numero = models.CharField(max_length=150, db_column='Pago_numero', blank=True) # Field name made lowercase.
    pago_caja = models.IntegerField(null=True, db_column='Pago_caja', blank=True) # Field name made lowercase.
    pago_fecha = models.DateTimeField(null=True, db_column='Pago_fecha', blank=True) # Field name made lowercase.
    pago_lugar = models.IntegerField(null=True, db_column='Pago_Lugar', blank=True) # Field name made lowercase.
    pension_pago = models.FloatField(null=True, db_column='Pension_Pago', blank=True) # Field name made lowercase.
    pension_pago_maniobra = models.FloatField(null=True, db_column='Pension_Pago_maniobra', blank=True) # Field name made lowercase.
    pension_pago_numero = models.CharField(max_length=150, db_column='Pension_Pago_numero', blank=True) # Field name made lowercase.
    pension_pago_caja = models.IntegerField(null=True, db_column='Pension_Pago_caja', blank=True) # Field name made lowercase.
    pension_pago_fecha = models.DateTimeField(null=True, db_column='Pension_Pago_fecha', blank=True) # Field name made lowercase.
    pension_pago_lugar = models.IntegerField(null=True, db_column='Pension_Pago_Lugar', blank=True) # Field name made lowercase.
    salida_nombre = models.CharField(max_length=750, blank=True)
    salida_apepaterno = models.CharField(max_length=150, blank=True)
    salida_apematerno = models.CharField(max_length=150, blank=True)
    salida_direccion = models.CharField(max_length=750, blank=True)
    tipo_docto = models.IntegerField(null=True, db_column='Tipo_docto', blank=True) # Field name made lowercase.
    tipo_docto_detalle = models.CharField(max_length=150, db_column='Tipo_docto_detalle', blank=True) # Field name made lowercase.
    tipo_docto_vigencia = models.DateTimeField(null=True, db_column='Tipo_docto_vigencia', blank=True) # Field name made lowercase.
    liberacion_fecha = models.DateTimeField(null=True, db_column='Liberacion_fecha', blank=True) # Field name made lowercase.
    liberacion_entrega = models.CharField(max_length=750, db_column='Liberacion_entrega', blank=True) # Field name made lowercase.
    liberacion_recibe = models.CharField(max_length=750, db_column='Liberacion_recibe', blank=True) # Field name made lowercase.
    agencia_mp = models.IntegerField(null=True, db_column='Agencia_MP', blank=True) # Field name made lowercase.
    folio_consignacion = models.CharField(max_length=150, db_column='Folio_Consignacion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    fecha_cancelado = models.DateTimeField(null=True, db_column='Fecha_Cancelado', blank=True) # Field name made lowercase.
    motivo_cancelado = models.TextField(db_column='Motivo_Cancelado', blank=True) # Field name made lowercase.
    usuario_cancelado = models.CharField(max_length=150, db_column='Usuario_Cancelado', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inventario_Vehiculo_Cancelado'

class InventarioVehiculoExtemporaneo(models.Model):
    id = models.IntegerField(primary_key=True)
    id_temp = models.CharField(max_length=300, db_column='Id_temp', blank=True) # Field name made lowercase.
    id_inventario = models.IntegerField(null=True, db_column='Id_Inventario', blank=True) # Field name made lowercase.
    fecha_extemporanea = models.DateTimeField(null=True, db_column='Fecha_extemporanea', blank=True) # Field name made lowercase.
    usuario = models.CharField(max_length=150, db_column='Usuario', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Inventario_Vehiculo_Extemporaneo'

class PlacasPresidencia(models.Model):
    tippplaca = models.CharField(max_length=30, db_column='TIPPPLACA', blank=True) # Field name made lowercase.
    placa = models.CharField(max_length=30, db_column='PLACA', blank=True) # Field name made lowercase.
    nombre = models.CharField(max_length=150, db_column='NOMBRE', blank=True) # Field name made lowercase.
    domici = models.CharField(max_length=120, db_column='DOMICI', blank=True) # Field name made lowercase.
    colonia = models.CharField(max_length=90, db_column='COLONIA', blank=True) # Field name made lowercase.
    submar = models.CharField(max_length=90, db_column='SUBMAR', blank=True) # Field name made lowercase.
    modelo = models.CharField(max_length=30, db_column='MODELO', blank=True) # Field name made lowercase.
    numser = models.CharField(max_length=60, db_column='NUMSER', blank=True) # Field name made lowercase.
    numcil = models.CharField(max_length=30, db_column='NUMCIL', blank=True) # Field name made lowercase.
    numcal = models.CharField(max_length=30, db_column='NUMCAL', blank=True) # Field name made lowercase.
    fecver = models.IntegerField(null=True, db_column='FECVER', blank=True) # Field name made lowercase.
    statu = models.IntegerField(null=True, db_column='STATU', blank=True) # Field name made lowercase.
    id = models.IntegerField(primary_key=True)
    class Meta:
        db_table = u'PLACAS_PRESIDENCIA'

class RemisionEventos(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico = models.CharField(max_length=150, db_column='ID_UNICO', blank=True) # Field name made lowercase.
    id_tipo_incidente = models.IntegerField(null=True, db_column='ID_TIPO_INCIDENTE', blank=True) # Field name made lowercase.
    folio_cabina = models.IntegerField(null=True, db_column='FOLIO_CABINA', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, db_column='LONGITUD', blank=True) # Field name made lowercase.
    latitud = models.FloatField(null=True, db_column='LATITUD', blank=True) # Field name made lowercase.
    id_estado = models.IntegerField(null=True, db_column='ID_ESTADO', blank=True) # Field name made lowercase.
    id_municipio = models.IntegerField(null=True, db_column='ID_MUNICIPIO', blank=True) # Field name made lowercase.
    id_colonia = models.IntegerField(null=True, db_column='ID_COLONIA', blank=True) # Field name made lowercase.
    colonia = models.CharField(max_length=450, db_column='COLONIA', blank=True) # Field name made lowercase.
    id_calle = models.IntegerField(null=True, db_column='ID_CALLE', blank=True) # Field name made lowercase.
    calle = models.CharField(max_length=450, db_column='CALLE', blank=True) # Field name made lowercase.
    id_calle2 = models.IntegerField(null=True, db_column='ID_CALLE2', blank=True) # Field name made lowercase.
    calle2 = models.CharField(max_length=450, db_column='CALLE2', blank=True) # Field name made lowercase.
    descripcion = models.TextField(db_column='DESCRIPCION', blank=True) # Field name made lowercase.
    id_clasificacion = models.IntegerField(null=True, db_column='ID_CLASIFICACION', blank=True) # Field name made lowercase.
    unidad = models.CharField(max_length=150, db_column='UNIDAD', blank=True) # Field name made lowercase.
    fecha_hora = models.DateTimeField(null=True, db_column='FECHA_HORA', blank=True) # Field name made lowercase.
    ids = models.CharField(max_length=750, db_column='IDS', blank=True) # Field name made lowercase.
    total = models.FloatField(null=True, db_column='TOTAL', blank=True) # Field name made lowercase.
    tarjeta = models.CharField(max_length=750, db_column='TARJETA', blank=True) # Field name made lowercase.
    placas = models.CharField(max_length=150, db_column='PLACAS', blank=True) # Field name made lowercase.
    placas_estatales = models.IntegerField(null=True, db_column='PLACAS_ESTATALES', blank=True) # Field name made lowercase.
    no_licencia = models.CharField(max_length=150, db_column='NO_LICENCIA', blank=True) # Field name made lowercase.
    fecha_reg = models.DateTimeField(db_column='FECHA_REG') # Field name made lowercase.
    usuario = models.CharField(max_length=150, db_column='USUARIO', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'REMISION_EVENTOS'

class RemisionPersonas(models.Model):
    id = models.IntegerField(primary_key=True)
    id_unico_persona = models.CharField(max_length=150, db_column='ID_UNICO_PERSONA', blank=True) # Field name made lowercase.
    id_unico = models.CharField(max_length=150, db_column='ID_UNICO', blank=True) # Field name made lowercase.
    id_mm = models.IntegerField(db_column='ID_MM') # Field name made lowercase.
    folio_cabina = models.IntegerField(null=True, db_column='FOLIO_CABINA', blank=True) # Field name made lowercase.
    apepaterno = models.CharField(max_length=450, db_column='APEPATERNO', blank=True) # Field name made lowercase.
    apematerno = models.CharField(max_length=450, db_column='APEMATERNO', blank=True) # Field name made lowercase.
    nombre = models.CharField(max_length=450, db_column='NOMBRE', blank=True) # Field name made lowercase.
    estatura = models.FloatField(null=True, db_column='ESTATURA', blank=True) # Field name made lowercase.
    id_nacionalidad = models.IntegerField(null=True, db_column='ID_NACIONALIDAD', blank=True) # Field name made lowercase.
    nacionalidad = models.CharField(max_length=150, db_column='NACIONALIDAD', blank=True) # Field name made lowercase.
    id_estado = models.IntegerField(null=True, db_column='ID_ESTADO', blank=True) # Field name made lowercase.
    estado = models.CharField(max_length=450, db_column='ESTADO', blank=True) # Field name made lowercase.
    id_ciudad = models.IntegerField(null=True, db_column='ID_CIUDAD', blank=True) # Field name made lowercase.
    ciudad = models.CharField(max_length=450, db_column='CIUDAD', blank=True) # Field name made lowercase.
    id_colonia = models.IntegerField(null=True, db_column='ID_COLONIA', blank=True) # Field name made lowercase.
    colonia = models.CharField(max_length=600, db_column='COLONIA', blank=True) # Field name made lowercase.
    id_calle = models.IntegerField(null=True, db_column='ID_CALLE', blank=True) # Field name made lowercase.
    calle = models.CharField(max_length=600, db_column='CALLE', blank=True) # Field name made lowercase.
    id_calle2 = models.IntegerField(null=True, db_column='ID_CALLE2', blank=True) # Field name made lowercase.
    calle2 = models.CharField(max_length=600, db_column='CALLE2', blank=True) # Field name made lowercase.
    exterior = models.CharField(max_length=150, db_column='EXTERIOR', blank=True) # Field name made lowercase.
    interior = models.CharField(max_length=150, db_column='INTERIOR', blank=True) # Field name made lowercase.
    referencia = models.CharField(max_length=750, db_column='REFERENCIA', blank=True) # Field name made lowercase.
    sexo = models.CharField(max_length=30, db_column='SEXO', blank=True) # Field name made lowercase.
    id_escolaridad = models.IntegerField(null=True, db_column='ID_ESCOLARIDAD', blank=True) # Field name made lowercase.
    escolaridad = models.CharField(max_length=300, db_column='ESCOLARIDAD', blank=True) # Field name made lowercase.
    tel1 = models.CharField(max_length=150, db_column='TEL1', blank=True) # Field name made lowercase.
    tel2 = models.CharField(max_length=150, db_column='TEL2', blank=True) # Field name made lowercase.
    id_ocupacion = models.IntegerField(null=True, db_column='ID_OCUPACION', blank=True) # Field name made lowercase.
    ocupacion = models.CharField(max_length=150, db_column='OCUPACION', blank=True) # Field name made lowercase.
    edad = models.IntegerField(null=True, db_column='EDAD', blank=True) # Field name made lowercase.
    id_identificacion = models.IntegerField(null=True, db_column='ID_IDENTIFICACION', blank=True) # Field name made lowercase.
    identificacion = models.CharField(max_length=150, db_column='IDENTIFICACION', blank=True) # Field name made lowercase.
    alias = models.CharField(max_length=300, db_column='ALIAS', blank=True) # Field name made lowercase.
    fecha_nacimiento = models.DateTimeField(null=True, db_column='FECHA_NACIMIENTO', blank=True) # Field name made lowercase.
    id_edo_civil = models.IntegerField(null=True, db_column='ID_EDO_CIVIL', blank=True) # Field name made lowercase.
    sueldo = models.FloatField(null=True, db_column='SUELDO', blank=True) # Field name made lowercase.
    nombre_padre = models.CharField(max_length=900, db_column='NOMBRE_PADRE', blank=True) # Field name made lowercase.
    nombre_madre = models.CharField(max_length=900, db_column='NOMBRE_MADRE', blank=True) # Field name made lowercase.
    s_particulares = models.TextField(db_column='S_PARTICULARES', blank=True) # Field name made lowercase.
    vestimenta = models.TextField(db_column='VESTIMENTA', blank=True) # Field name made lowercase.
    foto = models.CharField(max_length=150, db_column='FOTO', blank=True) # Field name made lowercase.
    fecha_reg = models.DateTimeField(db_column='FECHA_REG') # Field name made lowercase.
    usuario = models.CharField(max_length=150, db_column='USUARIO', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'REMISION_PERSONAS'

class RespaldoTemporal(models.Model):
    id = models.IntegerField(primary_key=True)
    id_accidente = models.IntegerField(null=True, blank=True)
    id_unico_accidente = models.CharField(max_length=150, blank=True)
    parte_o_convenio = models.CharField(max_length=9, blank=True)
    colonia_calle = models.IntegerField()
    class Meta:
        db_table = u'RESPALDO_TEMPORAL'

class ReporteVehiculos(models.Model):
    id = models.IntegerField(primary_key=True)
    fecha_captura = models.DateTimeField(null=True, blank=True)
    falta_placa = models.IntegerField(null=True, blank=True)
    ser_publico = models.IntegerField(null=True, blank=True)
    motocicleta = models.IntegerField(null=True, db_column='Motocicleta', blank=True) # Field name made lowercase.
    bicicletas = models.IntegerField(null=True, db_column='Bicicletas', blank=True) # Field name made lowercase.
    resguardo = models.IntegerField(null=True, db_column='Resguardo', blank=True) # Field name made lowercase.
    salidas = models.IntegerField(null=True, db_column='Salidas', blank=True) # Field name made lowercase.
    reporte_robo = models.IntegerField(null=True, blank=True)
    veh_recuperados = models.IntegerField(null=True, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    relevancias_operativo = models.TextField(blank=True)
    direccion_ingenieria = models.TextField(blank=True)
    class Meta:
        db_table = u'Reporte_Vehiculos'

class Resultados(models.Model):
    id = models.IntegerField(primary_key=True)
    articulo = models.CharField(max_length=765, db_column='Articulo', blank=True) # Field name made lowercase.
    concepto_de_la_infraccion = models.CharField(max_length=765, db_column='Concepto_de_la_Infraccion', blank=True) # Field name made lowercase.
    conversion_maximo = models.CharField(max_length=765, db_column='CONVERSION_maximo', blank=True) # Field name made lowercase.
    conversion_minimo = models.CharField(max_length=765, db_column='CONVERSION_minimo', blank=True) # Field name made lowercase.
    max = models.FloatField(null=True, blank=True)
    min = models.FloatField(null=True, blank=True)
    monto_de_la_sancion_en_salarios_minimos = models.CharField(max_length=765, db_column='Monto_de_la_sancion_en_salarios_minimos', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Resultados'

class Solicitudes(models.Model):
    folio = models.IntegerField(null=True, db_column='FOLIO', blank=True) # Field name made lowercase.
    asunto = models.CharField(max_length=600, db_column='ASUNTO', blank=True) # Field name made lowercase.
    comentarios = models.TextField(db_column='COMENTARIOS', blank=True) # Field name made lowercase.
    destino_id = models.IntegerField(null=True, db_column='DESTINO_ID', blank=True) # Field name made lowercase.
    origen_id = models.IntegerField(null=True, db_column='ORIGEN_ID', blank=True) # Field name made lowercase.
    id = models.IntegerField(primary_key=True)
    fecha_ini = models.DateTimeField(null=True, db_column='FECHA_INI', blank=True) # Field name made lowercase.
    fecha_lectura = models.DateTimeField(null=True, db_column='FECHA_LECTURA', blank=True) # Field name made lowercase.
    usuario_lectura = models.CharField(max_length=150, db_column='USUARIO_LECTURA', blank=True) # Field name made lowercase.
    con_copia = models.IntegerField(null=True, db_column='CON_COPIA', blank=True) # Field name made lowercase.
    departamento = models.CharField(max_length=600, db_column='DEPARTAMENTO', blank=True) # Field name made lowercase.
    quien_llama = models.CharField(max_length=600, db_column='QUIEN_LLAMA', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'SOLICITUDES'

class Tabulador(models.Model):
    id = models.IntegerField(primary_key=True)
    id_predecesor = models.IntegerField(null=True, db_column='Id_Predecesor', blank=True) # Field name made lowercase.
    clave = models.CharField(max_length=30, db_column='CLAVE', blank=True) # Field name made lowercase.
    articulo = models.CharField(max_length=150, db_column='ARTICULO', blank=True) # Field name made lowercase.
    fracc = models.CharField(max_length=150, db_column='FRACC', blank=True) # Field name made lowercase.
    descripcion = models.CharField(max_length=750, db_column='DESCRIPCION', blank=True) # Field name made lowercase.
    dias = models.IntegerField(null=True, db_column='DIAS', blank=True) # Field name made lowercase.
    dias_max = models.IntegerField(null=True, db_column='DIAS_MAX', blank=True) # Field name made lowercase.
    sal_min = models.IntegerField(null=True, db_column='SAL_MIN', blank=True) # Field name made lowercase.
    importe = models.FloatField(null=True, db_column='IMPORTE', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=45, db_column='TIPO', blank=True) # Field name made lowercase.
    tabulado = models.IntegerField(null=True, db_column='TABULADO', blank=True) # Field name made lowercase.
    reglamento = models.IntegerField(null=True, db_column='REGLAMENTO', blank=True) # Field name made lowercase.
    tipo_reglamento = models.CharField(max_length=150, db_column='TIPO_REGLAMENTO', blank=True) # Field name made lowercase.
    mostrar = models.IntegerField(null=True, db_column='MOSTRAR', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TABULADOR'

class TabuladorDesc(models.Model):
    id = models.IntegerField(primary_key=True)
    art = models.IntegerField(null=True, db_column='ART', blank=True) # Field name made lowercase.
    fracc = models.CharField(max_length=150, db_column='FRACC', blank=True) # Field name made lowercase.
    descc = models.CharField(max_length=6000, db_column='DESCC', blank=True) # Field name made lowercase.
    reglamento = models.IntegerField(null=True, db_column='reglamento', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.art + " -- "  + self.fracc
    class Meta:
        db_table = u'TABULADOR_DESC'

class DescVeh(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion =  models.CharField(max_length=255, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'DescVeh'

class LugarLiberacion(models.Model):
    id = models.AutoField(primary_key=True)
    nombre =  models.CharField(max_length=255, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'LugarLiberacion'

class DocumentosLiberacion(models.Model):
    id = models.AutoField(primary_key=True)
    nombre =  models.CharField(max_length=255, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'DocumentosLiberacion'

class TabuladorNewBackup(models.Model):
    id = models.IntegerField(primary_key=True)
    id_predecesor = models.IntegerField(null=True, db_column='Id_Predecesor', blank=True) # Field name made lowercase.
    clave = models.CharField(max_length=30, db_column='CLAVE', blank=True) # Field name made lowercase.
    articulo = models.CharField(max_length=150, db_column='ARTICULO', blank=True) # Field name made lowercase.
    fracc = models.CharField(max_length=150, db_column='FRACC', blank=True) # Field name made lowercase.
    descripcion = models.TextField(db_column='DESCRIPCION', blank=True) # Field name made lowercase.
    dias = models.IntegerField(null=True, db_column='DIAS', blank=True) # Field name made lowercase.
    dias_max = models.IntegerField(null=True, db_column='DIAS_MAX', blank=True) # Field name made lowercase.
    sal_min = models.IntegerField(null=True, db_column='SAL_MIN', blank=True) # Field name made lowercase.
    importe = models.FloatField(null=True, db_column='IMPORTE', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=45, db_column='TIPO', blank=True) # Field name made lowercase.
    tabulado = models.IntegerField(null=True, db_column='TABULADO', blank=True) # Field name made lowercase.
    reglamento = models.IntegerField(null=True, db_column='REGLAMENTO', blank=True) # Field name made lowercase.
    tipo_reglamento = models.CharField(max_length=150, db_column='TIPO_REGLAMENTO', blank=True) # Field name made lowercase.
    mostrar = models.IntegerField(null=True, db_column='MOSTRAR', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TABULADOR_NEW_BACKUP'

class TabuladorOld(models.Model):
    id = models.IntegerField(primary_key=True)
    id_predecesor = models.IntegerField(null=True, db_column='Id_Predecesor', blank=True) # Field name made lowercase.
    clave = models.CharField(max_length=30, db_column='CLAVE', blank=True) # Field name made lowercase.
    articulo = models.CharField(max_length=150, db_column='ARTICULO', blank=True) # Field name made lowercase.
    fracc = models.CharField(max_length=150, db_column='FRACC', blank=True) # Field name made lowercase.
    descripcion = models.CharField(max_length=600, db_column='DESCRIPCION', blank=True) # Field name made lowercase.
    dias = models.IntegerField(null=True, db_column='DIAS', blank=True) # Field name made lowercase.
    sal_min = models.IntegerField(null=True, db_column='SAL_MIN', blank=True) # Field name made lowercase.
    importe = models.FloatField(null=True, db_column='IMPORTE', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=45, db_column='TIPO', blank=True) # Field name made lowercase.
    tabulado = models.IntegerField(null=True, db_column='TABULADO', blank=True) # Field name made lowercase.
    reglamento = models.IntegerField(null=True, db_column='REGLAMENTO', blank=True) # Field name made lowercase.
    tipo_reglamento = models.CharField(max_length=150, db_column='TIPO_REGLAMENTO', blank=True) # Field name made lowercase.
    mostrar = models.IntegerField(null=True, db_column='MOSTRAR', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TABULADOR_OLD'

class TbColores(models.Model):
    id = models.IntegerField(primary_key=True)
    color = models.CharField(max_length=150, db_column='Color', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.color
    class Meta:
        db_table = u'TB_COLORES'

class TbColoniasOld(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=765, db_column='NOMBRE', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.nombre
    class Meta:
        db_table = u'TB_Colonias_OLD'

class TbCortesias(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    servicio = models.IntegerField(null=True, blank=True)
    hora_infrac = models.DateTimeField(null=True, blank=True)
    fecha_infrac = models.DateTimeField(null=True, blank=True)
    delegacion = models.IntegerField(null=True, blank=True)
    comandancia = models.IntegerField(null=True, blank=True)
    turno = models.IntegerField(null=True, blank=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    infractor_nombre = models.CharField(max_length=150, blank=True)
    infractor_apepaterno = models.CharField(max_length=150, blank=True)
    infractor_apematerno = models.CharField(max_length=150, blank=True)
    infractor_domicilio = models.CharField(max_length=600, blank=True)
    infractor_sexo = models.IntegerField(null=True, blank=True)
    infractor_edad = models.IntegerField(null=True, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, db_column='Estado', blank=True) # Field name made lowercase.
    ciudad = models.IntegerField(null=True, db_column='Ciudad', blank=True) # Field name made lowercase.
    infractor_num_licencia = models.CharField(max_length=150, blank=True)
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    submarca = models.IntegerField(null=True, db_column='Submarca', blank=True) # Field name made lowercase.
    veh_modelo = models.CharField(max_length=150, blank=True)
    veh_color = models.CharField(max_length=150, blank=True)
    veh_color_detalle = models.CharField(max_length=150, blank=True)
    veh_empresa = models.CharField(max_length=150, blank=True)
    veh_placas = models.CharField(max_length=150, blank=True)
    sp_num_economico = models.CharField(max_length=150, blank=True)
    veh_serie = models.CharField(max_length=150, blank=True)
    no_visible = models.IntegerField(null=True, blank=True)
    sp_num_ruta = models.CharField(max_length=150, blank=True)
    sp_tipo = models.CharField(max_length=150, blank=True)
    sp_num_tarjeton = models.CharField(max_length=150, blank=True)
    infractor_presente = models.CharField(max_length=3, blank=True)
    articulos = models.CharField(max_length=150, blank=True)
    calle1 = models.IntegerField(null=True, db_column='Calle1', blank=True) # Field name made lowercase.
    calle2 = models.IntegerField(null=True, db_column='Calle2', blank=True) # Field name made lowercase.
    frente_num = models.CharField(max_length=150, blank=True)
    colonia2 = models.IntegerField(null=True, db_column='Colonia2', blank=True) # Field name made lowercase.
    se_recogio = models.IntegerField(null=True, blank=True)
    certificado_medico = models.CharField(max_length=60, blank=True)
    conductor_estado = models.CharField(max_length=150, blank=True)
    firma_conductor = models.CharField(max_length=9, blank=True)
    fecha_captura = models.DateTimeField(null=True, blank=True)
    fecha_final_captura = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    status = models.IntegerField(null=True, blank=True)
    motivo = models.CharField(max_length=300, db_column='Motivo', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    tipo_operativo = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    id_agente = models.IntegerField(null=True, db_column='id_Agente', blank=True) # Field name made lowercase.
    infractor_numero = models.CharField(max_length=150, blank=True)
    nombre_colonia_infraccion = models.CharField(max_length=150, blank=True)
    nombre_calle1 = models.CharField(max_length=150, blank=True)
    nombre_calle2 = models.CharField(max_length=150, blank=True)
    propietario_nombre = models.CharField(max_length=150, blank=True)
    propietario_domicilio = models.CharField(max_length=300, blank=True)
    propietario_colonia = models.CharField(max_length=150, blank=True)
    observaciones_infraccion = models.TextField(blank=True)
    tipo_placa = models.CharField(max_length=30, blank=True)
    estado_placa = models.IntegerField(null=True, blank=True)
    estatus_presidencia = models.IntegerField()
    vigencia_licencia = models.DateTimeField(null=True, blank=True)
    servicio_publico = models.IntegerField()

    


    class Meta:
        db_table = u'TB_Cortesias'

class TbDetenido(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    edo_conductor = models.CharField(max_length=150, db_column='Edo_Conductor', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'TB_Detenido'

class TbEmpresasPresidencia(models.Model):
    id = models.IntegerField(primary_key=True)
    clave = models.FloatField(null=True, db_column='CLAVE', blank=True) # Field name made lowercase.
    linea = models.CharField(max_length=765, db_column='LINEA', blank=True) # Field name made lowercase.
    usumod = models.CharField(max_length=765, db_column='USUMOD', blank=True) # Field name made lowercase.
    fecmod = models.FloatField(null=True, db_column='FECMOD', blank=True) # Field name made lowercase.
    stsreg = models.FloatField(null=True, db_column='STSREG', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TB_EMPRESAS_PRESIDENCIA'

class TbEmpresasPresidenciaNew(models.Model):
    id = models.IntegerField(primary_key=True)
    clave = models.FloatField(null=True, db_column='CLAVE', blank=True) # Field name made lowercase.
    linea = models.CharField(max_length=765, db_column='LINEA', blank=True) # Field name made lowercase.
    usumod = models.CharField(max_length=765, db_column='USUMOD', blank=True) # Field name made lowercase.
    fecmod = models.FloatField(null=True, db_column='FECMOD', blank=True) # Field name made lowercase.
    stsreg = models.FloatField(null=True, db_column='STSREG', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TB_EMPRESAS_PRESIDENCIA_NEW'

class TbEmpresasRutasPresidencia(models.Model):
    id = models.IntegerField(primary_key=True)
    id_empresa = models.IntegerField(db_column='ID_EMPRESA') # Field name made lowercase.
    ruta = models.CharField(max_length=150, db_column='RUTA') # Field name made lowercase.
    descripcion = models.CharField(max_length=150, db_column='DESCRIPCION', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='ACTIVO', blank=True) # Field name made lowercase.
    no_economico = models.CharField(max_length=150, db_column='NO_ECONOMICO', blank=True) # Field name made lowercase.
    no_tarjeton = models.CharField(max_length=150, db_column='NO_TARJETON', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TB_EMPRESAS_RUTAS_PRESIDENCIA'

class TbEstadoTipolicencia(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo_licencia = models.CharField(max_length=60, blank=True)
    idtipolicencia = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'TB_Estado_TipoLicencia'

class TbLicencias(models.Model):
    id = models.IntegerField(primary_key=True)
    no_licencia = models.CharField(max_length=765, db_column='NO_LICENCIA', blank=True) # Field name made lowercase.
    nombre = models.CharField(max_length=765, db_column='NOMBRE', blank=True) # Field name made lowercase.
    apellido_p = models.CharField(max_length=765, db_column='APELLIDO_P', blank=True) # Field name made lowercase.
    apellido_m = models.CharField(max_length=765, db_column='APELLIDO_M', blank=True) # Field name made lowercase.
    id_tipo_licencia = models.IntegerField(null=True, db_column='ID_TIPO_LICENCIA', blank=True) # Field name made lowercase.
    tipo_licencia = models.CharField(max_length=765, db_column='TIPO_LICENCIA', blank=True) # Field name made lowercase.
    id_estado = models.IntegerField(null=True, db_column='ID_ESTADO', blank=True) # Field name made lowercase.
    estado = models.CharField(max_length=765, db_column='ESTADO', blank=True) # Field name made lowercase.
    id_ciudad = models.IntegerField(null=True, db_column='ID_CIUDAD', blank=True) # Field name made lowercase.
    ciudad = models.CharField(max_length=765, db_column='CIUDAD', blank=True) # Field name made lowercase.
    id_colonia = models.IntegerField(null=True, db_column='ID_COLONIA', blank=True) # Field name made lowercase.
    colonia = models.CharField(max_length=765, db_column='COLONIA', blank=True) # Field name made lowercase.
    id_calle = models.IntegerField(null=True, db_column='ID_CALLE', blank=True) # Field name made lowercase.
    calle = models.CharField(max_length=765, db_column='CALLE', blank=True) # Field name made lowercase.
    numero = models.CharField(max_length=765, db_column='NUMERO', blank=True) # Field name made lowercase.
    domicilio = models.CharField(max_length=765, db_column='DOMICILIO', blank=True) # Field name made lowercase.
    fecha_expira = models.DateTimeField(null=True, db_column='FECHA_EXPIRA', blank=True) # Field name made lowercase.
    restricciones_licencia = models.IntegerField(null=True, db_column='RESTRICCIONES_LICENCIA', blank=True) # Field name made lowercase.
    tipo_sangre = models.CharField(max_length=765, db_column='TIPO_SANGRE', blank=True) # Field name made lowercase.
    donador = models.CharField(max_length=765, db_column='DONADOR', blank=True) # Field name made lowercase.
    fecha_registro = models.DateTimeField(null=True, db_column='FECHA_REGISTRO', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'TB_LICENCIAS'

class TbMarcas(models.Model):
    id = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=765, db_column='MARCA', blank=True) # Field name made lowercase.
    submarca = models.CharField(max_length=765, db_column='SUBMARCA', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    def __unicode__(self):
        return self.marca + " -- "  + self.submarca
    class Meta:
        db_table = u'TB_MARCAS'

class TbMotos(models.Model):
    id = models.IntegerField(primary_key=True)
    marca = models.CharField(max_length=765, db_column='MARCA', blank=True) # Field name made lowercase.
    submarca = models.CharField(max_length=765, db_column='SUBMARCA', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    tipo = models.CharField(max_length=15)
    class Meta:
        db_table = u'TB_MOTOS'

class TbMunicipios(models.Model):
    id = models.AutoField(primary_key=True)
    municipio = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.municipio
    class Meta:
        db_table = u'TBMunicipios'

class TbPlacas(models.Model):
    id = models.IntegerField(primary_key=True)
    placa = models.CharField(max_length=90, db_column='PLACA', blank=True) # Field name made lowercase.
    estado = models.CharField(max_length=150, db_column='ESTADO', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='MARCA', blank=True) # Field name made lowercase.
    sub_marca = models.CharField(max_length=150, db_column='SUB_MARCA', blank=True) # Field name made lowercase.
    tipo = models.CharField(max_length=150, db_column='TIPO', blank=True) # Field name made lowercase.
    modelo = models.CharField(max_length=150, db_column='MODELO', blank=True) # Field name made lowercase.
    color = models.CharField(max_length=150, db_column='COLOR', blank=True) # Field name made lowercase.
    reporte_robo = models.DateTimeField(null=True, db_column='REPORTE_ROBO', blank=True) # Field name made lowercase.
    propietario_nombre = models.CharField(max_length=150, db_column='PROPIETARIO_NOMBRE', blank=True) # Field name made lowercase.
    propietario_apellido_p = models.CharField(max_length=150, db_column='PROPIETARIO_APELLIDO_p', blank=True) # Field name made lowercase.
    propietario_apellido_m = models.CharField(max_length=150, db_column='PROPIETARIO_APELLIDO_M', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TB_Placas'

class TbTipoLicencia(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo_licencia = models.CharField(max_length=60, blank=True)
    activo = models.IntegerField()
    def __unicode__(self):
        return self.tipo_licencia
    class Meta:
        db_table = u'Tb_Tipo_licencia'

class TbVerificaciones(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    servicio = models.IntegerField(null=True, blank=True)
    hora_infrac = models.DateTimeField(null=True, blank=True)
    fecha_infrac = models.DateTimeField(null=True, blank=True)
    delegacion = models.IntegerField(null=True, blank=True)
    comandancia = models.IntegerField(null=True, blank=True)
    turno = models.IntegerField(null=True, blank=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    infractor_nombre = models.CharField(max_length=150, blank=True)
    infractor_apepaterno = models.CharField(max_length=150, blank=True)
    infractor_apematerno = models.CharField(max_length=150, blank=True)
    infractor_domicilio = models.CharField(max_length=600, blank=True)
    infractor_sexo = models.IntegerField(null=True, blank=True)
    infractor_edad = models.IntegerField(null=True, blank=True)
    colonia = models.IntegerField(null=True, blank=True)
    estado = models.IntegerField(null=True, db_column='Estado', blank=True) # Field name made lowercase.
    ciudad = models.IntegerField(null=True, db_column='Ciudad', blank=True) # Field name made lowercase.
    infractor_num_licencia = models.CharField(max_length=150, blank=True)
    clas_vehiculo = models.IntegerField(null=True, db_column='Clas_vehiculo', blank=True) # Field name made lowercase.
    marca = models.CharField(max_length=150, db_column='Marca', blank=True) # Field name made lowercase.
    submarca = models.IntegerField(null=True, db_column='Submarca', blank=True) # Field name made lowercase.
    veh_modelo = models.CharField(max_length=150, blank=True)
    veh_color = models.CharField(max_length=150, blank=True)
    veh_color_detalle = models.CharField(max_length=150, blank=True)
    veh_empresa = models.CharField(max_length=150, blank=True)
    veh_placas = models.CharField(max_length=150, blank=True)
    sp_num_economico = models.CharField(max_length=150, blank=True)
    veh_serie = models.CharField(max_length=150, blank=True)
    no_visible = models.IntegerField(null=True, blank=True)
    sp_num_ruta = models.CharField(max_length=150, blank=True)
    sp_tipo = models.CharField(max_length=150, blank=True)
    sp_num_tarjeton = models.CharField(max_length=150, blank=True)
    infractor_presente = models.CharField(max_length=3, blank=True)
    articulos = models.CharField(max_length=150, blank=True)
    calle1 = models.IntegerField(null=True, db_column='Calle1', blank=True) # Field name made lowercase.
    calle2 = models.IntegerField(null=True, db_column='Calle2', blank=True) # Field name made lowercase.
    frente_num = models.CharField(max_length=150, blank=True)
    colonia2 = models.IntegerField(null=True, db_column='Colonia2', blank=True) # Field name made lowercase.
    se_recogio = models.IntegerField(null=True, blank=True)
    dv_pension = models.IntegerField(null=True, blank=True)
    dv_num_inventario = models.CharField(max_length=150, blank=True)
    certificado_medico = models.CharField(max_length=60, blank=True)
    conductor_estado = models.CharField(max_length=150, blank=True)
    firma_conductor = models.CharField(max_length=9, blank=True)
    fecha_captura = models.DateTimeField(null=True, blank=True)
    fecha_final_captura = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    status = models.IntegerField(null=True, blank=True)
    motivo = models.CharField(max_length=300, db_column='Motivo', blank=True) # Field name made lowercase.
    longitud = models.FloatField(null=True, blank=True)
    latitud = models.FloatField(null=True, blank=True)
    tipo_operativo = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    id_agente = models.IntegerField(null=True, db_column='id_Agente', blank=True) # Field name made lowercase.
    infractor_numero = models.CharField(max_length=150, blank=True)
    nombre_colonia_infraccion = models.CharField(max_length=150, blank=True)
    nombre_calle1 = models.CharField(max_length=150, blank=True)
    nombre_calle2 = models.CharField(max_length=150, blank=True)
    propietario_nombre = models.CharField(max_length=150, blank=True)
    propietario_domicilio = models.CharField(max_length=300, blank=True)
    propietario_colonia = models.CharField(max_length=150, blank=True)
    observaciones_infraccion = models.TextField(blank=True)
    tipo_placa = models.CharField(max_length=30, blank=True)
    estado_placa = models.IntegerField(null=True, blank=True)
    estatus_presidencia = models.IntegerField()
    vigencia_licencia = models.DateTimeField(null=True, blank=True)
    servicio_publico = models.IntegerField()
    class Meta:
        db_table = u'TB_Verificaciones'

class TbAgentes(models.Model):
    ID = models.IntegerField(primary_key=True)
    No_Anterior = models.IntegerField(null=True, blank=True)
    Num_Cobro = models.IntegerField(null=True, blank=True) 
    No_Gafete  = models.IntegerField(null=True, blank=True)
    NOMBRE= models.CharField(max_length=150, blank=True)
    DESCRIPCION =models.CharField(max_length=150, blank=True)
    DEPARTAMENTO= models.CharField(max_length=150, blank=True)
    RFC= models.CharField(max_length=150, blank=True)
    ID_DELEGACION =  models.IntegerField(null=True, blank=True)
    FECHA_REG = models.DateTimeField(null=True, blank=True)
    FECHA_INGRESO = models.DateTimeField(null=True, blank=True)
    FECHA_ELIM  = models.DateTimeField(null=True, blank=True)
    STATUS =models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Agentes'

class TbAgentes2008(models.Model):
    id = models.IntegerField(primary_key=True)
    no_gafete = models.IntegerField(null=True, blank=True)
    nombre = models.CharField(max_length=180, blank=True)
    descripcion = models.CharField(max_length=150, blank=True)
    num_cobro = models.IntegerField(null=True, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=3, blank=True)
    fecha_elim = models.DateTimeField(null=True, blank=True)
    id_delegacion = models.IntegerField(null=True, blank=True)
    id_comandancia = models.IntegerField(null=True, blank=True)
    id_turno = models.IntegerField(null=True, blank=True)
    id_usuario = models.CharField(max_length=60, blank=True)
    class Meta:
        db_table = u'Tb_Agentes_2008'

class TbAgentesBackup(models.Model):
    id = models.IntegerField(primary_key=True)
    no_gafete = models.IntegerField(null=True, blank=True)
    nombre = models.CharField(max_length=180, blank=True)
    descripcion = models.CharField(max_length=150, blank=True)
    num_cobro = models.IntegerField(null=True, blank=True)
    fecha_reg = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=3, blank=True)
    fecha_elim = models.DateTimeField(null=True, blank=True)
    id_delegacion = models.IntegerField(null=True, blank=True)
    id_comandancia = models.IntegerField(null=True, blank=True)
    id_turno = models.IntegerField(null=True, blank=True)
    id_usuario = models.CharField(max_length=60, blank=True)
    class Meta:
        db_table = u'Tb_Agentes_BACKUP'

class TbAsuntos(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Asuntos'

class TbColoniasNuevas(models.Model):
    id = models.IntegerField(primary_key=True)
    id_folio = models.IntegerField(null=True, blank=True)
    colonia_infraccion = models.IntegerField()
    nombre_colonia = models.CharField(max_length=150, blank=True)
    colonia_conductor = models.IntegerField()
    nombre_colonia2 = models.CharField(max_length=150, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Colonias_Nuevas'
#p2ariba
class TbConstancias(models.Model):
    id = models.IntegerField(primary_key=True)
    folio_constancia = models.IntegerField(null=True, blank=True)
    id_temp = models.CharField(max_length=150, blank=True)
    descripcion_vehiculo = models.CharField(max_length=150, blank=True)
    tipo_documento = models.IntegerField(null=True, blank=True)
    tipo_licencia = models.CharField(max_length=150, blank=True)
    no_licencia = models.CharField(max_length=150, blank=True)
    no_tarjeta_circulacion = models.CharField(max_length=150, blank=True)
    no_placas = models.CharField(max_length=150, blank=True)
    marca = models.CharField(max_length=150, blank=True)
    tipo_transporte = models.IntegerField(null=True, blank=True)
    submarca = models.IntegerField(null=True, blank=True)
    modelo = models.IntegerField(null=True, blank=True)
    rfv = models.CharField(max_length=150, blank=True)
    no_motor = models.CharField(max_length=150, blank=True)
    no_serie = models.CharField(max_length=150, blank=True)
    nombre_propietario = models.CharField(max_length=150, blank=True)
    apepaterno_propietario = models.CharField(max_length=150, blank=True)
    apematerno_propietario = models.CharField(max_length=150, blank=True)
    domicilio_propietario = models.CharField(max_length=150, blank=True)
    localidad = models.CharField(max_length=150, blank=True)
    fecha_expedicion = models.DateTimeField(null=True, blank=True)
    usuario_captura = models.CharField(max_length=150, blank=True)
    tipo_identificacion = models.IntegerField(null=True, blank=True)
    no_identificacion = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Constancias'
#p3
class TbControlBlocks(models.Model):
    id = models.AutoField(primary_key=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    folio_inicial = models.IntegerField(null=True, blank=True)
    folio_final = models.IntegerField(null=True, blank=True)
    fecha_recibido = models.DateTimeField(null=True, blank=True)
    usuario = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Control_Blocks'
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
        db_table = u'FolioInfraccion'

class TbControlDeBlockDeInfracciones(models.Model):
    id = models.IntegerField(primary_key=True)
    num_cobro_agente = models.IntegerField(null=True, blank=True)
    folio_inicial = models.IntegerField(null=True, blank=True)
    folio_final = models.IntegerField(null=True, blank=True)
    fecha_recibido = models.DateTimeField(null=True, blank=True)
    hora_recibido = models.DateTimeField(null=True, blank=True)
    folios_faltantes = models.IntegerField()
    folios_entregados = models.IntegerField()
    fecha_entregado = models.DateTimeField(null=True, blank=True)
    hora_entregado = models.DateTimeField(null=True, blank=True)
    status = models.IntegerField(null=True, blank=True)
    id_usuario = models.CharField(max_length=150, blank=True)
    no_blocks = models.IntegerField(db_column='No_blocks') # Field name made lowercase.
    activo = models.IntegerField(db_column='Activo') # Field name made lowercase.
    id_agente = models.IntegerField(null=True, blank=True)
    tipo_block = models.IntegerField()
    class Meta:
        db_table = u'Tb_Control_de_block_de_Infracciones'

#p4
class TbCortesiasDetalles(models.Model):
    id = models.IntegerField(primary_key=True)
    folio = models.IntegerField(null=True, blank=True)
    id_articulo = models.IntegerField(null=True, blank=True)
    articulo = models.CharField(max_length=450, blank=True)
    parrafo = models.CharField(max_length=450, blank=True)
    concepto = models.CharField(max_length=90, blank=True)
    class Meta:
        db_table = u'Tb_Cortesias_detalles'

class TbDoctoRecogio(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=90, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Docto_Recogio'

class TbEstatusPresidencia(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Estatus_Presidencia'

class TbIdentificaciones(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre_documento = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Identificaciones'
class TbLevantadopor(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Tb_LevantadoPor'

class TbPensiones(models.Model):
    id = models.AutoField(primary_key=True)
    nombre_pension = models.CharField(max_length=150, blank=True)
    domicilio_pension = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.nombre_pension
    class Meta:
        db_table = u'Tb_Pensiones'

class TbOtrosVeh(models.Model):
    id = models.IntegerField(primary_key=True)
    marca = models.CharField(max_length=150, blank=True)
    submarca = models.CharField(max_length=150, blank=True)
    tipo = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Otros_Veh'

class TbPlacasTemp(models.Model):
    id = models.IntegerField(primary_key=True)
    no_placas = models.CharField(max_length=30, blank=True)
    no_serie = models.CharField(max_length=60, blank=True)
    tipo_placa = models.CharField(max_length=3, blank=True)
    modelo = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Placas_Temp'

class TbRecibos(models.Model):
    id = models.IntegerField(primary_key=True)
    folio_infraccion = models.IntegerField(null=True, blank=True)
    folio_pago = models.CharField(max_length=150, blank=True)
    fecha_pago = models.DateTimeField(null=True, blank=True)
    usuario_pago = models.CharField(max_length=150, blank=True)
    fecha_registro_entrega = models.DateTimeField(null=True, blank=True)
    usuario_entregado = models.CharField(max_length=150, blank=True)
    entregado = models.IntegerField()
    tipo_documento = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Recibos'

class TbTabuladorTransito(models.Model):
    id = models.IntegerField(primary_key=True, db_column='ID') # Field name made lowercase.
    articulo = models.IntegerField(null=True, db_column='ARTICULO', blank=True) # Field name made lowercase.
    parrafo = models.CharField(max_length=300, db_column='PARRAFO', blank=True) # Field name made lowercase.
    concepto_infraccion = models.CharField(max_length=90, db_column='CONCEPTO_INFRACCION', blank=True) # Field name made lowercase.
    dias_maximo = models.IntegerField(null=True, db_column='DIAS_MAXIMO', blank=True) # Field name made lowercase.
    dias_minimo = models.IntegerField(null=True, db_column='DIAS_MINIMO', blank=True) # Field name made lowercase.
    status = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Tabulador_transito'

class TbTarjetasCirculacion(models.Model):
    id = models.IntegerField(primary_key=True)
    folio_tarjeta = models.CharField(max_length=150, blank=True)
    id_estado = models.IntegerField(null=True, blank=True)
    propietario_nombre = models.CharField(max_length=150, blank=True)
    propietario_apepaterno = models.CharField(max_length=150, blank=True)
    propietario_apematerno = models.CharField(max_length=150, blank=True)
    id_marca = models.IntegerField(null=True, blank=True)
    marca = models.CharField(max_length=150, blank=True)
    id_submarca = models.IntegerField(null=True, blank=True)
    submarca = models.CharField(max_length=150, blank=True)
    clas_vehiculo = models.IntegerField(null=True, blank=True)
    clase = models.CharField(max_length=150, blank=True)
    descripcion_tipo = models.CharField(max_length=150, blank=True)
    modelo = models.CharField(max_length=150, blank=True)
    no_serie = models.CharField(max_length=150, blank=True)
    no_motor = models.CharField(max_length=150, blank=True)
    no_placas = models.CharField(max_length=150, blank=True)
    fecha_expedicion = models.DateTimeField(null=True, blank=True)
    fecha_vencimiento = models.DateTimeField(null=True, blank=True)
    tipo_combustible = models.CharField(max_length=150, blank=True)
    uso = models.CharField(max_length=150, blank=True)
    capacidad = models.CharField(max_length=150, blank=True)
    fecha_registro = models.DateTimeField(null=True, blank=True)
    activo = models.IntegerField()
    tipo_placa = models.CharField(max_length=30, blank=True)
    edo_placa = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'Tb_Tarjetas_Circulacion'

class TbTipoAccidentes(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, db_column='Activo', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'Tb_Tipo_Accidentes'

class TbTipoCalle(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion_tipo = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Tipo_Calle'

class TbTipoEvento(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo_evento = models.CharField(max_length=150, blank=True)
    activo = models.IntegerField()
    def __unicode__(self):
        return self.tipo_evento
    class Meta:
        db_table = u'Tb_Tipo_Evento'

class TbTipoOperativo(models.Model):
    id = models.IntegerField(primary_key=True)
    descripcion = models.CharField(max_length=150, blank=True)
    clasificacion = models.CharField(max_length=150, db_column='Clasificacion', blank=True) # Field name made lowercase.
    activo = models.IntegerField()
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Tb_Tipo_Operativo'

class TbTipoPlacas(models.Model):
    id = models.IntegerField(primary_key=True)
    tipo_placa = models.CharField(max_length=30, blank=True)
    vigencia_inicial = models.IntegerField(null=True, blank=True)
    vigencia_final = models.IntegerField(null=True, blank=True)
    activo = models.IntegerField()
    class Meta:
        db_table = u'Tb_Tipo_Placas'

class TbTrasladadoa(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=150, db_column='Descripcion', blank=True) # Field name made lowercase.
    def __unicode__(self):
        return self.descripcion
    class Meta:
        db_table = u'Tb_TrasladadoA'

class TbUnidades2008(models.Model):
    id = models.IntegerField(primary_key=True, db_column='Id') # Field name made lowercase.
    no_unidad = models.CharField(max_length=300, db_column='No_Unidad', blank=True) # Field name made lowercase.
    sector = models.CharField(max_length=300, db_column='Sector', blank=True) # Field name made lowercase.
    id_sector = models.IntegerField(null=True, db_column='id_Sector', blank=True) # Field name made lowercase.
    activo = models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.no_unidad + " -- "  + self.sector
    class Meta:
        db_table = u'Tb_Unidades_2008'




class Usuariosad(models.Model):
    id = models.IntegerField(primary_key=True)
    login = models.CharField(max_length=765, db_column='Login', blank=True) # Field name made lowercase.
    password = models.CharField(max_length=765, db_column='Password', blank=True) # Field name made lowercase.
    nombre = models.CharField(max_length=765, db_column='Nombre', blank=True) # Field name made lowercase.
    apepaterno = models.CharField(max_length=765, db_column='ApePaterno', blank=True) # Field name made lowercase.
    apematerno = models.CharField(max_length=765, db_column='ApeMaterno', blank=True) # Field name made lowercase.
    grupo_id = models.IntegerField(null=True, db_column='GRUPO_ID', blank=True) # Field name made lowercase.
    template_id = models.IntegerField(null=True, db_column='TEMPLATE_ID', blank=True) # Field name made lowercase.
    perfil_id = models.IntegerField(null=True, db_column='PERFIL_ID', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    procesado = models.IntegerField(db_column='PROCESADO') # Field name made lowercase.
    agregado = models.IntegerField(db_column='AGREGADO') # Field name made lowercase.
    class Meta:
        db_table = u'UsuariosAD'

class Usuariosagregar(models.Model):
    id = models.IntegerField(primary_key=True)
    login = models.CharField(max_length=765, db_column='LOGIN', blank=True) # Field name made lowercase.
    password = models.CharField(max_length=765, db_column='PASSWORD', blank=True) # Field name made lowercase.
    nombre = models.CharField(max_length=765, db_column='NOMBRE', blank=True) # Field name made lowercase.
    apepaterno = models.CharField(max_length=765, db_column='APEPATERNO', blank=True) # Field name made lowercase.
    apematerno = models.CharField(max_length=765, db_column='APEMATERNO', blank=True) # Field name made lowercase.
    nombre_completo = models.CharField(max_length=765, db_column='NOMBRE_COMPLETO', blank=True) # Field name made lowercase.
    pruesto = models.CharField(max_length=765, db_column='PRUESTO', blank=True) # Field name made lowercase.
    delegacion = models.CharField(max_length=765, db_column='DELEGACION', blank=True) # Field name made lowercase.
    grupo_id = models.IntegerField(null=True, db_column='GRUPO_ID', blank=True) # Field name made lowercase.
    template_id = models.IntegerField(null=True, db_column='TEMPLATE_ID', blank=True) # Field name made lowercase.
    perfil_id = models.IntegerField(null=True, db_column='PERFIL_ID', blank=True) # Field name made lowercase.
    activo = models.IntegerField(db_column='ACTIVO') # Field name made lowercase.
    class Meta:
        db_table = u'UsuariosAgregar'

class TbEstados(models.Model):
    id = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=150, blank=True)
    def __unicode__(self):
        return self.estado
    class Meta:
        db_table = u'tb_estados'