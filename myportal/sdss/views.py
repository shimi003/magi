from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import sdss.models as db
import json as simplejson
from django.db import models as django_models

def index(request):
    #dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    accbot_qs = db.AccBot.objects.all()
    accbot_dic = getUidAndName(accbot_qs)
    #accbot_list = simplejson.dumps(accbot_qs, ensure_ascii=False, default=encode_accbot)
    context = {
        'accbot_dic': accbot_dic,
        'view_name': 'sdss 2.0 journal input', 
    }
    return render(request, 'sdss.html', context)
  #return HttpResponse("Hello, world, It's django!")

def templateTest(request):
    dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    return render(request, 'sdss.html', dic)

def encode_accbot(obj):
    return db.AccBot.getUidAndName(obj)
    #if isinstance(obj, django_models.Model):
    #    return obj.getUidAndName()
    #elif isinstance(obj, QuerySet):
    #    return list(obj)
    #else:
    #    raise TypeError(repr(obj) + "is not JSON serializable")

def getUidAndName(qs_accbot):
    d = {}
    for entry in qs_accbot:
        if entry.uid in d:
            raise Error('duplicate uid=' + entry.uid + ' in AccBot ')
        else:
            d[entry.uid] = entry.name
    return d
