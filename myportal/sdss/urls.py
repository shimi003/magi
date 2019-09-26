from django.urls import path
from . import views

urlpatterns = [
    path(r'', views.index, name='sdss_index'),
    path(r'regist/', views.regist, name='regist'),
    #path(r'test/', views.test, name='test'),
    path(r'journal/', views.journal, name='journal'),
    path(r'journal_export/', views.journal_export, name='journal_export'),
    path(r'journal_export/<year>/', views.journal_export, name='journal_export'),
    path(r'budget/', views.budget, name='budget'),
    path(r'budget_edit/<id>/', views.budget_edit_id, name='budget_edit_id'),
    path(r'budget_change', views.budget_change, name='budget_change'),
    path(r'bs/', views.bs, name='bs'),
    path(r'pl/', views.pl, name='pl'),
    path(r'detail/', views.detail, name='detail'),
    path(r'bs/<year>/', views.bs, name='bs'),
    path(r'pl/<year>/', views.pl, name='pl'),
    path(r'detail/', views.detail, name='detail'),
    path(r'detail/<mid_class_uid>/', views.detail, name='detail'),
    path(r'detail/<mid_class_uid>/<year>/', views.detail, name='detail'),
    path(r'cs/', views.cs, name='cs'),
    path(r'summary/', views.summary, name='summary'),
    path(r'summary/<year>/', views.summary, name='summary_year'),
    path(r'suii/', views.suii, name='suii'),
    path(r'suii/<year>/<month>/<accID1>/', views.suii, name='suii'),
    path(r'suii/<year>/<month>/<accID1>/<accID2>/', views.suii, name='suii'),
    path(r'suii/<year>/<month>/<accID1>/<accID2>/<accID3>/', views.suii, name='suii'),
    path(r'regularly-payment/', views.regularly_view, name='regularly_view'),
    path(r'regularly-payment/add/', views.regularly_add, name='regularly_add'),
    path(r'regularly-payment/regist/', views.regularly_regist, name='regularly_regist'),
    path(r'acc_list/', views.acc_list, name='acc_list'),
    path(r'fixed_asset/', views.fixed_asset, name='fixed_asset'),
    path(r'fixed_asset/addform/', views.fixed_asset_addform, name='fixed_asset_addform'),
    path(r'fixed_asset/regist/', views.fixed_asset_regist, name='fixed_asset_regist'),
    path(r'asset_suii/', views.asset_suii, name='asset_suii'),
    path(r'asset_suii/<year>/', views.asset_suii, name='asset_suii'),

    #path(r'account_group/', views.account_group, name='account_group'),
    #path(r'account_group/add/', views.account_group_add, name='account_group_add'),
    #path(r'account_group_list/', views.account_group_list, name='account_group_list'),
    #path(r'account_group_list/add/', views.account_group_list_add, name='account_group_list_add'),
]
