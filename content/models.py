from django.db import models
class Resource(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=150, blank=True)
    modulo=models.CharField(max_length=150, blank=True)
    ruta = models.CharField(max_length=150, blank=True) # Field name made lowercase.
    nombre_archivo = models.CharField(max_length=250, blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'content_resource'