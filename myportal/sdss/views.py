from django.shortcuts import render, redirect
import warnings

# Create your views here.
from django.http import HttpResponse
from django.urls import reverse
import sdss.models as db
import json as simplejson
from django.db import models as django_models
from django.db.models import Sum
from django.db.models import Count
from django.db.models.functions import Left

from datetime import datetime
import logging as log
from dateutil.relativedelta import relativedelta

from sdss.BS import BSClass as b
from sdss.PL import PLClass as p
import sdss.Utility as u


AccType = {
    'Asset': 1,
    'Liabilitie': 2,
    'NetAsset': 3,
    'Cost': 4,
    'Plofit': 5,
    'CashFlowFromOperation': 6,
    'CashFlowFromInvestment': 7,
    'CashFlowFromFinancial': 8,
}

GENKIN_ACC_BOT_UID = 6

#
def index(request):
    accbot_qs = db.AccBot.objects.order_by('sort_order').all()
    accbot_dic = getUidAndName(accbot_qs)
    accbot_list = getAccountList(accbot_qs)
    accbot_listgroup = getAccountListByGroup()
    context = {
        'i_list': ['1','2','3','4','5'],
        'b_or_c': ['br', 'cr'],
        'journal_date': datetime.now().strftime('%Y-%m-%d'),
        'accbot_dic': accbot_dic,
        'account_list': accbot_list,
        'listgroup':    accbot_listgroup,
        'view_name': 'sdss 2.0 journal input',
        'message': '',
    }
    return render(request, 'sdss.html', context)


def budget(request):
    context = {
        'budget_list': getCostBudgetList(),
    }
    return render(request, 'budget.html', context)


def getCostBudgetList():
    qs_bot = db.AccBot.objects.filter(acc_mid_uid__acc_top_uid=AccType['Cost']).order_by('sort_order')
    d = {}
    total = 0
    for entry in qs_bot:
        if not entry.acc_mid_uid.name in d:
            d[entry.acc_mid_uid.name] = []

        for_field = ''
        from_field = ''
        amount = ''
        note = ''

        if len(db.Budget.objects.filter(acc_bot_uid=entry.uid)) > 0:
            for_field = db.Budget.objects.order_by('-from').filter(acc_bot_uid=entry.uid)[0].for_field
            from_field = db.Budget.objects.order_by('-from').filter(acc_bot_uid=entry.uid)[0].from_field
            amount = db.Budget.objects.order_by('-from').filter(acc_bot_uid=entry.uid)[0].amount_per_month
            note = db.Budget.objects.order_by('-from').filter(acc_bot_uid=entry.uid)[0].note

        d[entry.acc_mid_uid.name].append({
            'name':   entry.name,
            'for':    for_field,
            'from':   from_field,
            'amount': amount,
            'note':   note,
        })
        if amount != '':
            total += int(amount)
    d['費用予算(月間)合計'] = {'amount': total,}
    return d


def suii(request, year=0, month=0, accID=GENKIN_ACC_BOT_UID):

    year = u.cleanYear(year)
    month = u.cleanMonth(month)
    suiilist = getAccountSuii(year, month, accID)
    labels = list(range(1,32))
    accbot_listgroup = getAccountListByGroup()
    print('are---')
    context = {
        'listgroup': accbot_listgroup,
        'ym_list': getGatherYearMonth(),
        'suii_list': suiilist,
        'acc_name': db.AccBot.objects.get(uid=accID).name,
        'label': labels,
        'view_name': 'sdss 2.0 Account Transition view',
        'target_year_month': str(year) + '/' + str(month),
        'message': '',
    }
    return render(request, 'suii.html', context)


def getGatherYearMonth():
    qs = db.Journal.objects.annotate(ll=Left('date',6)).values('ll').annotate(Count('ll')).order_by('-ll')
    ym_list = []
    for q in qs:
        if len(q['ll']) >= 6:
            ym_list.append(q['ll'][0:4] + '/' + q['ll'][4:6])
    return ym_list


'''
TODO can use in both BS and PL.
create an account valiables only "BS", except PL.
'''
def getAccountSuii(year, month, accID):

    strDate = u.createCurrentYearMonthString(year, month)
    br_direction = db.AccBot.objects.get(uid=accID).acc_mid_uid.acc_top_uid.is_br

    # BSのみ前月末残高を計算
    if db.AccBot.objects.get(uid=accID).acc_mid_uid.acc_top_uid.uid >= 4:
        total = 0
    else:
        init_qs = db.Journal.objects.filter(date__lt=strDate)
        init_br = u.getEmptyOrValueInt(init_qs.filter(br_acc_bot_uid=accID).aggregate(Sum('br_amount'))['br_amount__sum'])
        init_cr = u.getEmptyOrValueInt(init_qs.filter(cr_acc_bot_uid=accID).aggregate(Sum('cr_amount'))['cr_amount__sum'])
        total = u.diffBrCr(init_br, init_cr, br_direction)
    print('total=' + str(total))
    # summing day by day ...
    dic = []
    nextMonth = u.createNextYearMonthString(year, month)
    qs = db.Journal.objects.filter(date__range=(strDate, nextMonth))
    curr_br_qs = qs.filter(br_acc_bot_uid=accID)
    curr_cr_qs = qs.filter(cr_acc_bot_uid=accID)
    for i in range(1,32):
        today_br_sum = u.getEmptyOrValueInt(curr_br_qs.filter(date=(strDate+'{:02}'.format(i))).aggregate(Sum('br_amount'))['br_amount__sum'])
        today_cr_sum = u.getEmptyOrValueInt(curr_cr_qs.filter(date=(strDate+'{:02}'.format(i))).aggregate(Sum('cr_amount'))['cr_amount__sum'])
        print(str(i) + ': add to ' + str(u.diffBrCr(today_br_sum, today_cr_sum, br_direction)))
        total += u.diffBrCr(today_br_sum, today_cr_sum, br_direction)
        dic.append(total)
    print(str(dic))

    return dic


def test(request):

    list = getAccountMidAggregateInYear(u.ReportType['PL'])

    context = {
        'pl_list': list,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 PL view',
        'target_year_month': '2018/10',
        'message': '',
    }
    return render(request, 'pl.html', context)

def getMonthList():
    month_list = []
    for i in range(12):
        month_list.append('{:02}'.format(i+1))
    return month_list


def regist(request):
    #入力チェックと登録用データ作成
    #TODO 入力チェックとUI側の入力チェックもこっちへ移す
    groupid = datetime.now().strftime('%Y%m%d%H%M%S%f')
    strdate = request.POST['journal_date'].replace('-','')
    log.info('regist date as: ' + strdate)

    register_corresp = []
    register_corresp.append({'br_a': 'br_1_a', 'cr_a': 'cr_1_a', 'br_c': 'br_1_c', 'cr_c': 'cr_1_c'})
    register_corresp.append({'br_a': 'br_2_a', 'cr_a': 'cr_2_a', 'br_c': 'br_2_c', 'cr_c': 'cr_2_c'})
    register_corresp.append({'br_a': 'br_3_a', 'cr_a': 'cr_3_a', 'br_c': 'br_3_c', 'cr_c': 'cr_3_c'})
    register_corresp.append({'br_a': 'br_4_a', 'cr_a': 'cr_4_a', 'br_c': 'br_4_c', 'cr_c': 'cr_4_c'})
    register_corresp.append({'br_a': 'br_5_a', 'cr_a': 'cr_5_a', 'br_c': 'br_5_c', 'cr_c': 'cr_5_c'})
    registerd = False
    note_temp = ''
    for cor in register_corresp:
        if u.isIntAndNotZero(request.POST[cor['br_a']]) or u.isIntAndNotZero(request.POST[cor['cr_a']]):
            if registerd == True:
                note_temp = ''
            else:
                note_temp = request.POST['note']
            db.Journal.objects.create(
                date = strdate,
                group_id = groupid,
                br_acc_bot_uid = db.AccBot.objects.get(uid=request.POST[cor['br_c']]),
                br_amount = u.getEmptyOrValueInt(request.POST[cor['br_a']]),
                cr_acc_bot_uid = db.AccBot.objects.get(uid=request.POST[cor['cr_c']]),
                cr_amount = u.getEmptyOrValueInt(request.POST[cor['cr_a']]),
                note = note_temp,
            )
            registerd = True
            log.info('register journal object')
    # TODO ハードコーディングなのでショートカットにするとか
    return redirect('/magi/sdss')



def journal(request):
    # | uid | date | group_id | br_acc_bot_name | br_amount | ... |
    # TODO extract year, month ...etc
    journal_qs = db.Journal.objects.order_by('-date')
    journal_list = getJournalList(journal_qs)
    context = {
        'journal_list': journal_list,
        'view_name': 'sdss 2.0 journal view',
        'message': '',
    }
    return render(request, 'journal.html', context)


def summary(request, year=0):
    year = u.cleanYear(year)
    bs = b()
    pl = p()
    bslist = bs.getMiddleYearStatement(year)
    pllist = pl.getMiddleYearStatement(year)
    yearList = ['2018','2019']
    context = {
        'bs_list': bslist,
        'pl_list': pllist,
        'month_list': getMonthList(),
        'year_list': yearList,
        'view_name': 'sdss 2.0 BS PL summary view',
        'target_year': str(year),
        'message': '',
    }
    return render(request, 'summary.html', context)


def bs(request, year=0):
    # |       |   10    |    11   |    12   |
    # | ICOCA |   2,100 |   5,900 |   9,200 |
    # |  現金  |  13,110 |  24,670 |     ... |
    year = u.cleanYear(year)
    bs_class = b()
    bslist = bs_class.getBottomYearStatement(year)
    yearList = ['2018','2019']
    context = {
        'bs_list': list,
        'year_list': yearList,
        'bs_mid_list': bslist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 BS view',
        'target_year': str(year),
        'message': '',
    }
    return render(request, 'bs.html', context)


def pl(request, year=0):
    year = u.cleanYear(year)
    pl = p()
    pllist = pl.getBottomYearStatement(year)
    yearList = ['2018','2019']
    context = {
        'year_list': yearList,
        'pl_list': pllist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 PL view',
        'target_year': str(year),
        'message': '',
    }
    return render(request, 'pl.html', context)


def cs(request):
    raise NotImplementedError()


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
            'uid':    entry.uid,
            'label':  entry.name_ac,
            'value':  entry.name,
        })
    return d


def getAccountListByGroup():
    qs_bot = db.AccBot.objects.order_by('sort_order').all()
    d = {}
    for entry in qs_bot:
        if not entry.acc_mid_uid.name in d:
            d[entry.acc_mid_uid.name] = []

        d[entry.acc_mid_uid.name].append({
            'uid':    entry.uid,
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

#TODO すでに処理が重そうな気がするので今後パフォーマンスに関する何らかの処置が必要かも
#TODO 貸借差額=当期損益の計算および表示
