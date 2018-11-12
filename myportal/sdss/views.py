from django.shortcuts import render, redirect

# Create your views here.
from django.http import HttpResponse
import sdss.models as db
import json as simplejson
from django.db import models as django_models
from datetime import datetime
import logging as log

def index(request):
    #dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    accbot_qs = db.AccBot.objects.order_by('sort_order').all()
    accbot_dic = getUidAndName(accbot_qs)
    #accbot_list = simplejson.dumps(accbot_qs, ensure_ascii=False, default=encode_accbot)
    accbot_list = getAccountList(accbot_qs)
    context = {
        'journal_date': datetime.now().strftime('%Y-%m-%d'),
        'accbot_dic': accbot_dic,
        'account_list': accbot_list,
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
    strdate = request.POST['journal_date'].replace('-','')
    log.info('regist date as: ' + strdate)
    if isIntAndNotZero(request.POST['br_1_a']) or isIntAndNotZero(request.POST['cr_1_a']):
        db.Journal.objects.create(
            date = strdate,
            group_id = groupid,
            br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['br_1_c']),
            br_amount = request.POST['br_1_a'] if request.POST['br_1_a'].isdigit() else 0,
            cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST['cr_1_c']),
            cr_amount = request.POST['cr_1_a'] if request.POST['cr_1_a'].isdigit() else 0,
            note = request.POST['note'],
        )
        log.info('register journal object')

    if isIntAndNotZero(request.POST['br_2_a']) or isIntAndNotZero(request.POST['cr_2_a']):
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

    if isIntAndNotZero(request.POST['br_3_a']) or isIntAndNotZero(request.POST['cr_3_a']):
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

    if isIntAndNotZero(request.POST['br_4_a']) or isIntAndNotZero(request.POST['cr_4_a']):
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

    if isIntAndNotZero(request.POST['br_5_a']) or isIntAndNotZero(request.POST['cr_5_a']):
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

    #accbot_qs = db.AccBot.objects.all()
    #accbot_dic = getUidAndName(accbot_qs)
    #context = {
    #    'journal_date': datetime.now().strftime('%Y-%m-%d'),
    #    'accbot_dic': accbot_dic,
    #    'view_name': 'sdss 2.0 journal input',
    #    'message': 'registered',
    #}
    return redirect("/sdss")
    #return render(request, 'sdss.html', context)


def journal(request):
    # | uid | date | group_id | br_acc_bot_name | br_amount | ... |
    #dic = {'name': 'shimi003', 'test': 'tekitoudata'}
    journal_qs = db.Journal.objects.all()
    journal_list = getJournalList(journal_qs)
    context = {
        'journal_list': journal_list,
        'view_name': 'sdss 2.0 journal view',
        'message': '',
    }
    return render(request, 'journal.html', context)


def bs(request):
    # |       | 2018/10 | 2018/11 | 2018/12 |
    # | ICOCA |   2,100 |   5,900 |   9,200 |
    # |  現金  |  13,110 |  24,670 |     ... |

    return HttpResponse("not implement!")


def pl(request):
    return HttpResponse("not implement!")


def cs(request):
    return HttpResponse("not implement!")


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

def getAccountList(qs_accbot):
    d = []
    for entry in qs_accbot:
        d.append({
            'id':     entry.uid,
            'label':  entry.name_ac,
            'value':  entry.name,
        })
    return d


def getJournalList(qs_journal):
    d = []
    for entry in qs_journal:
        d.append({
            'id':        entry.uid,
            'date':      entry.date[:4] + '/' + entry.date[4:6] + '/'+ entry.date[6:8],
            'group_id':  entry.group_id,
            'br_name':   entry.br_acc_bot_uid.name,
            'br_amount': entry.br_amount,
            'cr_name':   entry.cr_acc_bot_uid.name,
            'cr_amount': entry.cr_amount,
            'note':      entry.note,
        })
    return d


def isIntAndNotZero(str):
    try:
        a = int(str)
        if a == 0:
            return False
        else:
            return True
    except Exception as e:
        log.info('an Exception in isIntAndNotZero: ' + str)
        return False
