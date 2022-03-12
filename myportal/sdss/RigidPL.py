from sdss.FS import FSClass
import sdss.models as db
import logging as log
from django.db.models import Sum
import sdss.Utility as u
from datetime import datetime
import sdss.Budget as bd

# TODO Summary common program both BS and PL to FS.

class RigidPLClass(FSClass):
    def __init__(self):
        pass


    # 営業収益リストを作成する
    def getNetRevenue(self, year):
        try:
            print('create net revenue ' + str(year))
            year = u.cleanYear(year)

            ret = []

            accListIncome = db.AccBot.objects.filter(acc_mid_uid__name='営業収益')
            incomeTotal = [0] * 12

            for acc in accListIncome:
                d = []

                # 12ヶ月いずれも出現しない勘定科目は登録しないのでその管理フラグ
                wasNotChangeInYear = True
                acc_total = 0
                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)

                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth, nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current = u.diffBrCr(curr_br, curr_cr, -1)
                        incomeTotal[i] += current

                        if current == 0:
                            d.append('')
                        else:
                            wasNotChangeInYear = False
                            d.append(current)
                            acc_total += current
                    else:
                        d.append('')
                        # 全部空欄なら追加しない

                if wasNotChangeInYear == False:
                    d.append(acc_total)
                    ret.append({
                        'acc_name': acc.name,
                        'budget': bd.getBudget(acc.uid),
                        'list': d,
                    })
                    #dic[acc.name] = d

            ret.append({'total': incomeTotal})
            # loss.append(loss_total)
            # profit.append(profit_total)
            # proloss.append(proloss_total)
            # ret.append({'acc_name': '費用計', 'budget': '', 'list': loss,})
            # ret.append({'acc_name': '利益計', 'budget': '', 'list': profit,})
            # ret.append({'acc_name': '損益',   'budget': '', 'list': proloss,})
            #dic['費用計'] = loss
            #dic['利益計'] = profit
            #dic['損益'] = proloss
            return ret

        except ValueError as value_e:
            print('RigidPLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(value_e) + 'year=' + str(year))
            return []
        except TypeError as type_e:
            print('RigidPLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(type_e) + 'year=' + str(year))
            return []


    # 売上原価リストを作成する
    def getCostOfSales(self, year):
        try:
            print('create cost of sales ' + str(year))
            year = u.cleanYear(year)

            ret = []

            accListIncome = db.AccBot.objects.filter(acc_mid_uid__name='売上原価')
            incomeTotal = [0] * 12

            for acc in accListIncome:
                d = []

                # 12ヶ月いずれも出現しない勘定科目は登録しないのでその管理フラグ
                wasNotChangeInYear = True
                acc_total = 0
                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)

                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth, nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current = u.diffBrCr(curr_br, curr_cr, 1)
                        incomeTotal[i] += current

                        if current == 0:
                            d.append('')
                        else:
                            wasNotChangeInYear = False
                            d.append(current)
                            acc_total += current
                    else:
                        d.append('')
                        # 全部空欄なら追加しない

                if wasNotChangeInYear == False:
                    d.append(acc_total)
                    ret.append({
                        'acc_name': acc.name,
                        'budget': bd.getBudget(acc.uid),
                        'list': d,
                    })
                    #dic[acc.name] = d

            ret.append({
                'acc_name': '営業収益計',
                'list': incomeTotal,
                })
            # loss.append(loss_total)
            # profit.append(profit_total)
            # proloss.append(proloss_total)
            # ret.append({'acc_name': '費用計', 'budget': '', 'list': loss,})
            # ret.append({'acc_name': '利益計', 'budget': '', 'list': profit,})
            # ret.append({'acc_name': '損益',   'budget': '', 'list': proloss,})
            #dic['費用計'] = loss
            #dic['利益計'] = profit
            #dic['損益'] = proloss
            return ret

        except ValueError as value_e:
            print('RigidPLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(value_e) + 'year=' + str(year))
            return []
        except TypeError as type_e:
            print('RigidPLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(type_e) + 'year=' + str(year))
            return []



    # 最も細かい（例： 現金、外食費など）レベルの財務諸表を作成する
    def getBottomYearStatement(self, year):
        try:
            print('sarani temae...' + str(year))
            year = u.cleanYear(year)

            print('daibu temae...')
            #dic = {}
            ret = []
            accListQs = db.AccBot.objects.filter(
                acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=u.ReportType['PL']).order_by('sort_order')

            print('sosite.//')
            profit  = [0] * 12
            loss    = [0] * 12
            proloss = [0] * 12
            current = 0

            print('kokomade ok!')

            '''
            20190401 仕様変更
            変更前
            {
                '支払家賃':  [38000, 38000, ... 38000]
            }

            ->
            変更後
            [
                'acc_name': '支払家賃',
                'budget': 50000,
                'list': [38000, 38000, 38000, ... 38000]
            ]
            '''
            loss_total = 0
            proloss_total = 0
            profit_total = 0

            for acc in accListQs:
                brCrDirection = acc.acc_mid_uid.acc_top_uid.is_br
                log.info('acc.uid = ' + str(acc.uid) + ' brCrDirection = ' + str(brCrDirection))
                d = []

                # 12ヶ月いずれも出現しない勘定科目は登録しないのでその管理フラグ
                wasNotChangeInYear = True
                acc_total = 0
                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)

                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth, nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current = u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        if brCrDirection > 0:
                            loss[i]       += current
                            loss_total    += current
                            proloss[i]    -= current
                            proloss_total -= current
                        else:
                            profit[i]     += current
                            profit_total  += current
                            proloss[i]    += current
                            proloss_total += current

                        if current == 0:
                            d.append('')
                        else:
                            wasNotChangeInYear = False
                            d.append(current)
                            #d.append(current if current != 0 else '')
                            acc_total += current
                    else:
                        d.append('')
                        # 全部空欄なら追加しない

                if wasNotChangeInYear == False:
                    d.append(acc_total)
                    ret.append({
                        'acc_name': acc.name,
                        'budget': bd.getBudget(acc.uid),
                        'list': d,
                    })
                    #dic[acc.name] = d

            loss.append(loss_total)
            profit.append(profit_total)
            proloss.append(proloss_total)
            ret.append({'acc_name': '費用計', 'budget': '', 'list': loss,})
            ret.append({'acc_name': '利益計', 'budget': '', 'list': profit,})
            ret.append({'acc_name': '損益',   'budget': '', 'list': proloss,})
            #dic['費用計'] = loss
            #dic['利益計'] = profit
            #dic['損益'] = proloss
            return ret

        except ValueError as value_e:
            print('PLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(value_e) + 'year=' + str(year))
            return []
        except TypeError as type_e:
            print('PLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(type_e) + 'year=' + str(year))
            return []


    # 2番めに細かい（例： 現金預金、生活費など）レベルの財務諸表を作成する
    def getMiddleYearStatement(self, year):
        try:
            year = u.cleanYear(year)

            dic = {}
            accListQs = db.AccMid.objects.filter(
                acc_top_uid__union_bs1_pl2_cs3=u.ReportType['PL']).order_by('sort_order')

            profit  = [0] * 12
            loss    = [0] * 12
            proloss = [0] * 12

            loss_total = 0
            proloss_total = 0
            profit_total = 0

            for acc in accListQs:
                brCrDirection = acc.acc_top_uid.is_br
                log.info('AccMid.name = ' + str(acc.name) + ' brCrDirection = ' + str(brCrDirection))

                d = []
                acc_total = 0
                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)
                    if currentYearMonth <= '{:04d}{:02d}'.format(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current = u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        acc_total += current
                        if brCrDirection > 0:
                            loss[i]       += current
                            loss_total    += current
                            proloss[i]    -= current
                            proloss_total -= current
                        else:
                            profit[i]     += current
                            profit_total  += current
                            proloss[i]    += current
                            proloss_total += current

                        d.append(current if current != 0 else '')
                    else:
                        d.append('')
                if acc_total == 0:
                    d.append('')
                else:
                    d.append(acc_total)
                dic[acc.name] = d

            loss.append(loss_total)
            profit.append(profit_total)
            proloss.append(proloss_total)

            dic['費用計'] = loss
            dic['利益計'] = profit
            dic['損益'] = proloss
            return dic

        except Exception as e:
            print('PLClass.getMiddleYearStatement 何らかの例外が発生しました year=' + str(year))
            return {}
