from django.shortcuts import render, redirect

# Create your views here.
from django.http import HttpResponse
import sdss.models as db
import json as simplejson
from django.db import models as django_models
from django.db.models import Sum

from datetime import datetime
import logging as log
from dateutil.relativedelta import relativedelta


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
    list = getBS()
    month_list = []
    for i in range(12):
        month_list.append('{:02}'.format(i+1))

    context = {
        'bs_list': list,
        'month_list': month_list,
        'view_name': 'sdss 2.0 BS view',
        'target_year_month': '2018/10',
        'message': '',
    }
    return render(request, 'bs.html', context)


def pl(request):
    list = getPL()
    month_list = []
    for i in range(12):
        month_list.append('{:02}'.format(i+1))

    context = {
        'pl_list': list,
        'month_list': month_list,
        'view_name': 'sdss 2.0 PL view',
        'target_year_month': '2018/10',
        'message': '',
    }
    return render(request, 'pl.html', context)


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
            'br_name':   entry.br_acc_bot_uid.name if entry.br_acc_bot_uid.name != '（選択してください）' else '',
            'br_amount': entry.br_amount if entry.br_amount != 0 else '',
            'cr_name':   entry.cr_acc_bot_uid.name if entry.cr_acc_bot_uid.name != '（選択してください）' else '',
            'cr_amount': entry.cr_amount if entry.cr_amount != 0 else '',
            'note':      entry.note,
        })
    return d

#TODO BSとPLの処理およびテンプレートがほぼ同じなため統一する
#TODO すでに処理が重そうな気がするので今後パフォーマンスに関する何らかの処置が必要かも
#TODO 未来のも出てるのでそのへんの調整

def getBS(year = 0):
    try:

        if int(year) == 0:
            year = datetime.now().year
        elif int(year) < 1800 or 2100 < int(year):
            raise Error("input illigal year into getBS:" + str(year))
        else:
            raise Error("unkown error in getBS input year is " + str(year))

        dic = {}
        #BS勘定科目の一覧取得
        bslist_qs = db.AccBot.objects.filter(
            acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=1).order_by('sort_order')

        #取得したBS勘定科目ごとに、さらに月ごとに集計する。前年末残高を初期値として使用する
        for acc in bslist_qs:
            #貸借係数（借方側が1、貸方側が-1）
            isBr = db.AccBot.objects.get(uid=acc.uid).acc_mid_uid.acc_top_uid.is_br
            log.info('acc.uid = ' + str(acc.uid) + ' isBr = ' + str(isBr))
            #前年度末までの残高を算出（初期値）
            init_qs = db.Journal.objects.filter(date__lt=str(year))
            init_br = init_qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
            init_cr = init_qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']

            #empty対策
            init_br = 0 if not init_br else init_br
            init_cr = 0 if not init_cr else init_cr

            initial = (init_br - init_cr) * isBr

            d = []
            for i in range(12):
                #各月の集計
                currentYearMonth = str(year) + '{:02d}'.format(i + 1)
                nextYearMonth = getNextMonth(currentYearMonth)
                qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                #empty対策
                curr_br = 0 if not curr_br else curr_br
                curr_cr = 0 if not curr_cr else curr_cr
                #前のと足す
                initial += (curr_br - curr_cr) * isBr

                d.append(initial if initial != 0 else '')
            dic[acc.name] = d

        return dic

    except Exception as e:
        print(e.args + ' 何らかの例外が発生しました')
        return {}

#TODO 未来のも出てるのでそのへんの調整

def getPL(year = 0):
    try:
        if int(year) == 0:
            year = datetime.now().year
        elif int(year) < 1800 or 2100 < int(year):
            raise Error("input illigal year into getPL:" + str(year))
        else:
            raise Error("unkown error in getBS input year is " + str(year))

        dic = {}
        #PL勘定科目の一覧取得
        pllist_qs = db.AccBot.objects.filter(
            acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=2).order_by('sort_order')

        #取得したBS勘定科目ごとに、さらに月ごとに集計する。前年末残高を初期値として使用する
        for acc in pllist_qs:
            #貸借係数（借方側が1、貸方側が-1）
            isBr = db.AccBot.objects.get(uid=acc.uid).acc_mid_uid.acc_top_uid.is_br
            log.info('acc.uid = ' + str(acc.uid) + ' isBr = ' + str(isBr))

            d = []
            for i in range(12):
                #各月の集計
                currentYearMonth = str(year) + '{:02d}'.format(i + 1)
                nextYearMonth = getNextMonth(currentYearMonth)
                qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                #empty対策
                curr_br = 0 if not curr_br else curr_br
                curr_cr = 0 if not curr_cr else curr_cr
                #前のと足す
                curr = (curr_br - curr_cr) * isBr
                d.append(curr if curr != 0 else '')
            dic[acc.name] = d

        return dic

    except Exception as e:
        print(e.args + ' 何らかの例外が発生しました')
        return {}




def getNextMonth(currentYearMonth=''):
    nextYearMonth = ''
    if currentYearMonth == '':
        nextYearMonth = datetime.strftime(datetime.now() + relativedelta(months=1), '%Y%m')

    else:
        year = int(currentYearMonth[:4])
        month = int(currentYearMonth[4:])

        if month == 12:
            year += 1
            month = 1
        else:
            month += 1
        nextYearMonth = '{:04d}{:02d}'.format(year,month)

    return nextYearMonth


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
