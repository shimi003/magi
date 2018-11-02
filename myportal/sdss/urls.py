from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.index, name='index'),
    path(r'regist/', views.regist, name='regist'),
    path(r'template/', views.templateTest, name='templateTest'),
]
