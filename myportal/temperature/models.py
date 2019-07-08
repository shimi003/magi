from django.db import models

# Create your models here.
class Meas(models.Model):
    uid = models.IntegerField(primary_key=True)
    date = models.TextField()
    time = models.TextField()
    temp = models.FloatField()
    pres = models.FloatField()
    hum = models.FloatField()

    class Meta:
        managed = True
        db_table = 'geo_meas'
