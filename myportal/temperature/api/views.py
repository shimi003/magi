from rest_framework.viewsets import ModelViewSet
from .serializers import MeasSerializer
from temperature.models import Meas as meas

class MeasViewSet(ModelViewSet):
    queryset = meas.objects.all()
    serializer_class = MeasSerializer
