# coding: utf-8

from rest_framework import serializers
from .models import Meas as meas


class MeasSerializer(serializers.ModelSerializer):
    class Meta:
        model = meas
        fields = ('uid', 'date', 'time', 'temp', 'pres', 'hum')

    def create(self, validated_data):
        m = meas(
            date=validated_data['date'],
            time=validated_data['time'],
            temp=validated_data['temp'],
            pres=validated_data['pres'],
            hum=validated_data['hum'],
        )
        m.save()
        return m
