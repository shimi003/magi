from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse

def index(request):
  return HttpResponse("Hello, world, It's django!")

def templateTest(request):
    dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    return render(request, 'sdss.html', dic)
