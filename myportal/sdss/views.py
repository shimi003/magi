from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import sdss.models as db
import json as simplejson
from django.db import models as django_models
from datetime import datetime
import logging as log

def index(request):
    #dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    accbot_qs = db.AccBot.objects.all()
    accbot_dic = getUidAndName(accbot_qs)
    #accbot_list = simplejson.dumps(accbot_qs, ensure_ascii=False, default=encode_accbot)
    context = {
        'journal_date': datetime.now().strftime('%Y-%m-%d'),
        'accbot_dic': accbot_dic,
        'view_name': 'sdss 2.0 journal input',
        'message': '',
    }
    return render(request, 'sdss.html', context)
  #return HttpResponse("Hello, world, It's django!")

def regist(request):
    #入力チェックと登録用データ作成
    #TODO 入力チェックとUI側の入力チェックもこっちへ移す
    #TODO 処理が冗長なのでリスト化するなりしてスッキリさせる
    groupid = datetime.now().strftime('%Y%m%d%H%M%S%f')
    strdate = datetime.now().strftime('%Y%m%d')
    if request.POST['br_1_a'] != 0 or request.POST['cr_1_a'] != 0:
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_1_c']),
            br_amount = request.POST['br_1_a'] if request.POST['br_1_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_1_c']),
            cr_amount = request.POST['cr_1_a'] if request.POST['cr_1_a'].isdigit() else 0,
            note = '',
        )
        log.info('register journal object')

    if request.POST['br_2_a'] != 0 or request.POST['cr_2_a'] != 0:
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_2_c']),
            br_amount = request.POST['br_2_a'] if request.POST['br_2_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_2_c']),
            cr_amount = request.POST['cr_2_a'] if request.POST['cr_2_a'].isdigit() else 0,
            note = '',
        )
        log.info('register journal object')

    if request.POST['br_3_a'] != 0 or request.POST['cr_3_a'] != 0:
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_3_c']),
            br_amount = request.POST['br_3_a'] if request.POST['br_3_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_3_c']),
            cr_amount = request.POST['cr_3_a'] if request.POST['cr_3_a'].isdigit() else 0,
            note = '',
        )
        log.info('register journal object')

    if request.POST['br_4_a'] != 0 or request.POST['cr_4_a'] != 0:
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_4_c']),
            br_amount = request.POST['br_4_a'] if request.POST['br_4_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_4_c']),
            cr_amount = request.POST['cr_4_a'] if request.POST['cr_4_a'].isdigit() else 0,
            note = '',
        )
        log.info('register journal object')

    if request.POST['br_5_a'] != 0 or request.POST['cr_5_a'] != 0:
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_5_c']),
            br_amount = request.POST['br_5_a'] if request.POST['br_5_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_5_c']),
            cr_amount = request.POST['cr_5_a'] if request.POST['cr_5_a'].isdigit() else 0,
            note = '',
        )
        log.info('register journal object')

    accbot_qs = db.AccBot.objects.all()
    accbot_dic = getUidAndName(accbot_qs)
    context = {
        'journal_date': datetime.now().strftime('%Y-%m-%d'),
        'accbot_dic': accbot_dic,
        'view_name': 'sdss 2.0 journal input',
        'message': 'registered',
    }

    return render(request, 'sdss.html', context)





def templateTest(request):
    dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    return render(request, 'sdss.html', dic)

def getUidAndName(qs_accbot):
    d = {}
    for entry in qs_accbot:
        if entry.uid in d:
            raise Error('duplicate uid=' + entry.uid + ' in AccBot ')
        else:
            d[entry.uid] = entry.name
    return d
