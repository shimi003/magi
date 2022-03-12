from sdss.FS import FSClass
import sdss.models as db
import logging
from django.db.models import Sum
import sdss.Utility as u
from datetime import datetime

logger = logging.getLogger(__name__)

# TODO Summary common program both BS and PL to FS.

class BSClass(FSClass):

    def __init__(self):
        pass

    def getBottomYearStatement(self, year):
        try:
            year = u.cleanYear(year)

            dic = {}
            accListQs = db.AccBot.objects.filter(
                acc_mid_uid__acc_top_uid__union_bs1_pl2_cs3=u.ReportType['BS']).order_by('sort_order')

            current = 0

            for acc in accListQs:
                brCrDirection = acc.acc_mid_uid.acc_top_uid.is_br
                logger.info('acc.name = ' + acc.name + ' brCrDirection = ' + str(brCrDirection))
                #前年度末までの残高を算出（初期値）
                init_qs = db.Journal.objects.filter(date__lt=str(year))
                init_br = init_qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                init_cr = init_qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                current = u.diffBrCr(init_br, init_cr, brCrDirection)

                d = []

                # 12ヶ月いずれも出現しない勘定科目は登録しないのでその管理フラグ
                wasNotChangeInYear = True

                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)

                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth, nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current += u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        #d.append(current if current != 0 else '')

                        if current == 0:
                            d.append('')
                        else:
                            wasNotChangeInYear = False
                            d.append(current)

                    else:
                        d.append('')

                # 全部空欄なら追加しない
                if wasNotChangeInYear == False:
                    dic[acc.name] = d

            return dic

        except Exception as e:
            logger.error('exception in BSClass.getBottomYearStatement, year=' + str(year))
            return {}



    def getMiddleYearStatement(self, year, fill=''):
        try:
            year = u.cleanYear(year)
            dic = {}
            accListQs = db.AccMid.objects.filter(
                acc_top_uid__union_bs1_pl2_cs3=u.ReportType['BS']).order_by('sort_order')

            current = 0

            for acc in accListQs:
                brCrDirection = acc.acc_top_uid.is_br
                logger.info('AccMid.name = ' + acc.name + ' brCrDirection = ' + str(brCrDirection))
                #前年度末までの残高を算出（初期値）
                init_qs = db.Journal.objects.filter(date__lt=str(year))
                init_br = init_qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                init_cr = init_qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                current = u.diffBrCr(init_br, init_cr, brCrDirection)

                d = []

                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)
                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth,nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid__acc_mid_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        current += u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        d.append(current if current != 0 else fill)
                    else:
                        d.append(fill)
                dic[acc.name] = d
            return dic

        except Exception as e:
            logger.error('exception in BSClass.getMiddleYearStatement, year=' + str(year))
            return {}
