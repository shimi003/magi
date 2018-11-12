from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.index, name='index'),
    path(r'regist/', views.regist, name='regist'),
    path(r'journal/', views.journal, name='journal'),
    path(r'bs/', views.bs, name='bs'),
    path(r'pl/', views.pl, name='pl'),
    path(r'cs/', views.pl, name='cs'),
    path(r'template/', views.templateTest, name='templateTest'),
]
