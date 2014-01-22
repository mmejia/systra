from django.db import models

# Create your models here.
class Color(models.Model):
    id =models.AutoField(primary_key=True)
    color = models.CharField(max_length=150, db_column='Color', blank=True) 
    def __unicode__(self):
        return self.color
    class Meta:
        db_table = u'cat_color'