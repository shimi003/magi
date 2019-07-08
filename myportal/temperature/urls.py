from django.urls import path
from . import views

urlpatterns = [
    path(r'', views.index, name='temp_index'),
    path('<path:ymd>', views.date, name='temp_index'),
    path(r'regist/', views.regist, name='temp_regist'),
]
