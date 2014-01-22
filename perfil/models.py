from django.db import models

# Create your models here.
class Perfil(models.Model):
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
        db_table = u'perfiles_perfil'
