from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.index, name='sdss_index'),
    path(r'regist/', views.regist, name='regist'),
    #path(r'test/', views.test, name='test'),
    path(r'journal/', views.journal, name='journal'),
    path(r'budget/', views.budget, name='budget'),
    path(r'bs/', views.bs, name='bs'),
    path(r'pl/', views.pl, name='pl'),
    path(r'bs/<year>', views.bs, name='bs'),
    path(r'pl/<year>', views.pl, name='pl'),
    path(r'cs/', views.cs, name='cs'),
    path(r'summary/', views.summary, name='summary'),
    path(r'summary/<year>', views.summary, name='summary_year'),
    path(r'suii/', views.suii, name='suii'),
    path(r'suii/<year>/<month>/<accID>', views.suii, name='suii'),
]
