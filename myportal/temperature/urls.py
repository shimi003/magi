from django.urls import path
from . import views

urlpatterns = [
    path(r'', views.index, name='temp_index'),
    path(r'regist/', views.regist, name='geo_regist'),
    path('<path:ymd>/', views.date, name='temp_index'),
]
