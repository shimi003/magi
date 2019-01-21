from django.shortcuts import render, redirect
import warnings

# Create your views here.
from django.http import HttpResponse
import sdss.models as db
import json as simplejson
from django.db import models as django_models
from django.db.models import Sum

from datetime import datetime
import logging as log
from dateutil.relativedelta import relativedelta

ReportType = {
    'BS': 1,
    'PL': 2,
    'CS': 3,
}

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

#
def index(request):
    accbot_qs = db.AccBot.objects.order_by('sort_order').all()
    accbot_dic = getUidAndName(accbot_qs)
    accbot_list = getAccountList(accbot_qs)
    accbot_listgroup = getAccountListByGroup()
    context = {
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
    d['費用予算(月間)合計'] = []
    d['費用予算(月間)合計'].append({
        'amount': total,
    })
    return d


def getEmptyOrValue(str):
    if str is None:
        return '';
    else:
        return str;


def test(request):

    list = getAccountMidAggregateInYear(ReportType['PL'])

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

    return redirect("/sdss")


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


def journal(request):
    # | uid | date | group_id | br_acc_bot_name | br_amount | ... |
    # TODO extract year, month ...etc
    journal_qs = db.Journal.objects.order_by('date')
    journal_list = getJournalList(journal_qs)
    context = {
        'journal_list': journal_list,
        'view_name': 'sdss 2.0 journal view',
        'message': '',
    }
    return render(request, 'journal.html', context)


def summary(request):
    bslist = getAccountMidAggregateInYear(ReportType['BS'], datetime.now().year)
    pllist = getAccountMidAggregateInYear(ReportType['PL'], datetime.now().year)
    context = {
        'bs_list': bslist,
        'pl_list': pllist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 BS PL summary view',
        'target_year': '2018',
        'message': '',
    }
    return render(request, 'summary.html', context)

def summary_year(request, year):
    year = checkYear(year)
    bslist = getAccountMidAggregateInYear(ReportType['BS'], year)
    pllist = getAccountMidAggregateInYear(ReportType['PL'], year)
    context = {
        'bs_list': bslist,
        'pl_list': pllist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 BS PL summary view',
        'target_year': str(year),
        'message': '',
    }
    return render(request, 'summary.html', context)


def bs(request):
    # |       |   10    |    11   |    12   |
    # | ICOCA |   2,100 |   5,900 |   9,200 |
    # |  現金  |  13,110 |  24,670 |     ... |
    bslist = getAccountAggregateInYear(ReportType['BS'], datetime.now().year)
    yearList = ['2018','2019']
    context = {
        'bs_list': list,
        'year_list': yearList,
        'bs_mid_list': bslist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 BS view',
        'target_year': str(datetime.now().year),
        'message': '',
    }
    return render(request, 'bs.html', context)

def bs_year(request, year):
    # |       |   10    |    11   |    12   |
    # | ICOCA |   2,100 |   5,900 |   9,200 |
    # |  現金  |  13,110 |  24,670 |     ... |
    year = checkYear(year)
    bslist = getAccountAggregateInYear(ReportType['BS'], year)
    yearList = ['2018','2019']
    context = {
        'bs_list': list,
        'year': year,
        'year_list': yearList,
        'bs_mid_list': bslist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 BS view',
        'target_year': str(year),
        'message': '',
    }
    return render(request, 'bs.html', context)


def pl(request):
    pllist = getAccountAggregateInYear(ReportType['PL'], datetime.now().year)
    yearList = ['2018','2019']
    context = {
        'year_list': yearList,
        'pl_list': pllist,
        'month_list': getMonthList(),
        'view_name': 'sdss 2.0 PL view',
        'target_year': str(datetime.now().year),
        'message': '',
    }
    return render(request, 'pl.html', context)


def pl_year(request, year):
    year = checkYear(year)
    pllist = getAccountAggregateInYear(ReportType['PL'], year)
    yearList = ['2018','2019']
    context = {
        'year_list': yearList,
        'pl_list': pllist,
        'year': year,
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
#TODO 未来のも出てるのでそのへんの調整
#TODO 貸借差額=当期損益の計算および表示

def checkYear(strYear):
    try:
        if 1800 < int(strYear) and int(strYear) < 2100:
            return int(strYear)
        elif 0 == int(strYear):
            return datetime.now().year
        else:
            raise ValueError
    except ValueError:
            warnings.warn("input illigal year into checkYear:" + str(strYear))
            return datetime.now().year


def getAccountMidAggregateInYear(ReportType_BS1PL2CS3, year = 0):
    try:
        year = checkYear(year)

        dic = {}
        accListQs = db.AccMid.objects.filter(
            acc_top_uid__union_bs1_pl2_cs3=ReportType_BS1PL2CS3).order_by('sort_order')

        profit  = [0] * 12
        loss    = [0] * 12
        proloss = [0] * 12

        for acc in accListQs:
            brCrDirection = acc.acc_top_uid.is_br
            log.info('AccMid.name = ' + str(acc.name) + ' brCrDirection = ' + str(brCrDirection))
            #前年度末までの残高を算出（初期値） BS only
            init_qs = db.Journal.objects.filter(date__lt=str(year))
            init_br = init_qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
            init_cr = init_qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']

            #empty対策
            init_br = 0 if not init_br else init_br
            init_cr = 0 if not init_cr else init_cr

            current = (init_br - init_cr) * brCrDirection

            d = []

            for i in range(12):
                #各月の集計
                currentYearMonth = str(year) + '{:02d}'.format(i + 1)
                nextYearMonth = getNextMonth(currentYearMonth)
                if currentYearMonth <= '{:04d}{:02d}'.format(datetime.now().year, datetime.now().month):
                    qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                    curr_br = qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                    curr_cr = qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                    #empty対策
                    curr_br = 0 if not curr_br else curr_br
                    curr_cr = 0 if not curr_cr else curr_cr
                    #BS+=init, PL=curr
                    if   ReportType_BS1PL2CS3 == ReportType['BS']:
                        current += (curr_br - curr_cr) * brCrDirection
                    elif ReportType_BS1PL2CS3 == ReportType['PL']:
                        current = (curr_br - curr_cr) * brCrDirection
                        if brCrDirection > 0:
                            loss[i]    += current
                            proloss[i] -= current
                        else:
                            profit[i]  += current
                            proloss[i] += current
                    else:
                        raise NotImplementedError()
                    
                    d.append(current if current != 0 else '')
                else:
                    d.append('')
                    
            dic[acc.name] = d

        # if Acc = PL, add loss, profit, sum.
        if ReportType_BS1PL2CS3 == ReportType['PL']:
            dic['費用計'] = loss
            dic['利益計'] = profit
            dic['損益'] = proloss
        
        return dic

    except Exception as e:
        print(e.args + ' 何らかの例外が発生しました')
        return {}


'''
'''
def getAccountAggregateInYear(ReportType_BS1PL2CS3, year = 0):
    try:
        year = checkYear(year)

        dic = {}
        accListQs = db.AccBot.objects.filter(
            acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=ReportType_BS1PL2CS3).order_by('sort_order')

        profit  = [0] * 12
        loss    = [0] * 12
        proloss = [0] * 12
        current = 0

        for acc in accListQs:
            brCrDirection = acc.acc_mid_uid.acc_top_uid.is_br
            log.info('acc.uid = ' + str(acc.uid) + ' brCrDirection = ' + str(brCrDirection))
            #前年度末までの残高を算出（初期値） BS only
            if   ReportType_BS1PL2CS3 == ReportType['BS']:
                init_qs = db.Journal.objects.filter(date__lt=str(year))
                init_br = init_qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                init_cr = init_qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']

                #empty対策
                init_br = 0 if not init_br else init_br
                init_cr = 0 if not init_cr else init_cr

                current = (init_br - init_cr) * brCrDirection

            d = []

            for i in range(12):
                #各月の集計
                currentYearMonth = str(year) + '{:02d}'.format(i + 1)
                nextYearMonth = getNextMonth(currentYearMonth)

                if currentYearMonth <= '{:04d}{:02d}'.format(datetime.now().year, datetime.now().month):
                    qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                    curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                    curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                    #empty対策
                    curr_br = 0 if not curr_br else curr_br
                    curr_cr = 0 if not curr_cr else curr_cr
                    #BS+=init, PL=curr
                    if   ReportType_BS1PL2CS3 == ReportType['BS']:
                        current += (curr_br - curr_cr) * brCrDirection
                    elif ReportType_BS1PL2CS3 == ReportType['PL']:
                        current = (curr_br - curr_cr) * brCrDirection
                        if brCrDirection > 0:
                            loss[i]    += current
                            proloss[i] -= current
                        else:
                            profit[i]  += current
                            proloss[i] += current
                    else:
                        raise NotImplementedError()
                    
                    d.append(current if current != 0 else '')
                else:
                    d.append('')
            dic[acc.name] = d

        # if Acc = PL, add loss, profit, sum.
        if ReportType_BS1PL2CS3 == ReportType['PL']:
            dic['費用計'] = loss
            dic['利益計'] = profit
            dic['損益'] = proloss
        
        return dic

    except Exception as e:
        print(e.args + ' 何らかの例外が発生しました')
        return {}


'''
'''
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

