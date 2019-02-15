from sdss.FS import FSClass
import sdss.models as db
import logging as log
from django.db.models import Sum
import sdss.Utility as u
from datetime import datetime

# TODO Summary common program both BS and PL to FS.

class PLClass(FSClass):
    def __init__(self):
        pass

    # 最も細かい（例： 現金、外食費など）レベルの財務諸表を作成する
    def getBottomYearStatement(self, year):
        try:
            print('sarani temae...' + str(year))
            year = u.cleanYear(year)

            print('daibu temae...')
            dic = {}
            accListQs = db.AccBot.objects.filter(
                acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=u.ReportType['PL']).order_by('sort_order')

            print('sosite.//')
            profit  = [0] * 12
            loss    = [0] * 12
            proloss = [0] * 12
            current = 0

            print('kokomade ok!')

            for acc in accListQs:
                brCrDirection = acc.acc_mid_uid.acc_top_uid.is_br
                log.info('acc.uid = ' + str(acc.uid) + ' brCrDirection = ' + str(brCrDirection))
                d = []

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
                            loss[i]    += current
                            proloss[i] -= current
                        else:
                            profit[i]  += current
                            proloss[i] += current

                        d.append(current if current != 0 else '')
                    else:
                        d.append('')
                dic[acc.name] = d
            dic['費用計'] = loss
            dic['利益計'] = profit
            dic['損益'] = proloss
            return dic

        except ValueError as value_e:
            print('PLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(value_e) + 'year=' + str(year))
            return {}
        except TypeError as type_e:
            print('PLClass.getBottomYearStatement 何らかの例外が発生しました errorType:' + type(type_e) + 'year=' + str(year))
            return {}


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

            for acc in accListQs:
                brCrDirection = acc.acc_top_uid.is_br
                log.info('AccMid.name = ' + str(acc.name) + ' brCrDirection = ' + str(brCrDirection))

                d = []

                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)
                    if currentYearMonth <= '{:04d}{:02d}'.format(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current = u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        if brCrDirection > 0:
                            loss[i]    += current
                            proloss[i] -= current
                        else:
                            profit[i]  += current
                            proloss[i] += current

                        d.append(current if current != 0 else '')
                    else:
                        d.append('')

                dic[acc.name] = d
            dic['費用計'] = loss
            dic['利益計'] = profit
            dic['損益'] = proloss
            return dic

        except Exception as e:
            print('PLClass.getMiddleYearStatement 何らかの例外が発生しました year=' + str(year))
            return {}

        