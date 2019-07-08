# coding: utf-8

from rest_framework import serializers
from .models import Meas as meas


class MeasSerializer(serializers.ModelSerializer):
    class Meta:
        model = meas
        fields = ('uid', 'date', 'time', 'temp', 'pres', 'hum')
