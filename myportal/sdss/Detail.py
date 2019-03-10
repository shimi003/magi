#from sdss.FS import FSClass
import sdss.models as db
import logging
from django.db.models import Sum
import sdss.Utility as u
from datetime import datetime

logger = logging.getLogger(__name__)

# TODO 継承する必要はないような気がする
class DetailClass():

    def __init__(self):
        pass


    def getTopMidAccList(self):
        qsTopAccList = db.AccTop.objects.all()
        tm = {}
        for acctop in qsTopAccList:
            #BS科目（UID=1〜3）、PL科目（UID=4,5）のみ処理する
            if acctop.uid <= u.AccType['Plofit']:
                qsMidAccList = db.AccMid.objects.filter(acc_top_uid=acctop.uid)
                m = {}
                for accmid in qsMidAccList:
                    m[accmid.uid] = accmid.name
                tm[acctop.name] = m
        return tm


    def getMidClassName(self, classification_uid):
        try:
            mid_name = db.AccMid.objects.get(uid = classification_uid).name
            return mid_name
        except:
            return ''

    def getClassificationDetail(self, classificaiton, year):
        try:
            # TODO 上位でもクリーニングしてるが・・・
            year = u.cleanYear(year)

            total = [0,0,0,0,0,0,0,0,0,0,0,0]

            dic = {}
            accListQs = db.AccBot.objects.filter(acc_mid_uid = classificaiton).order_by('sort_order')
            acc_top = 0
            brCrDirection = 0
            if accListQs is not None:
                acc_top = accListQs[0].acc_mid_uid.acc_top_uid.uid
                brCrDirection = accListQs[0].acc_mid_uid.acc_top_uid.is_br


            for acc in accListQs:
                #brCrDirection = acc.acc_mid_uid.acc_top_uid.is_br
                logger.info('acc.name = ' + acc.name + ' brCrDirection = ' + str(brCrDirection))
                #前年度末までの残高を算出（初期値）
                init_br = 0
                init_cr = 0
                current = 0

                #最上位の科目が”純資産”以下（＝資産、負債、純資産のBS科目）であれば前年度末の金額を計算する
                if acc_top <= u.AccType['NetAsset']:
                    init_qs = db.Journal.objects.filter(date__lt=str(year))
                    init_br = init_qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                    init_cr = init_qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                    current = u.diffBrCr(init_br, init_cr, brCrDirection)

                d = []

                for i in range(12):
                    #各月の集計
                    currentYearMonth = u.createCurrentYearMonthString(year, i + 1)
                    nextYearMonth = u.createNextYearMonthString(year, i + 1)

                    if currentYearMonth <= u.createCurrentYearMonthString(datetime.now().year, datetime.now().month):
                        qs = db.Journal.objects.filter(date__range=(currentYearMonth, nextYearMonth))
                        curr_br = qs.filter(br_acc_bot_uid=acc.uid).aggregate(Sum('br_amount'))['br_amount__sum']
                        curr_cr = qs.filter(cr_acc_bot_uid=acc.uid).aggregate(Sum('cr_amount'))['cr_amount__sum']
                        #最上位の科目が”純資産”以下（＝資産、負債、純資産のBS科目）であれば前月末の金額を足す
                        if acc_top <= u.AccType['NetAsset']:
                            current += u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        else:
                            current = u.diffBrCr(curr_br, curr_cr, brCrDirection)
                        d.append(current if current != 0 else '')
                        total[i] += current if current != 0 else 0

                    else:
                        d.append('')
                        total[i] = ''
                dic[acc.name] = d
            dic['合計'] = total
            return dic

        except Exception as e:
            logger.error('exception in DetailClass.getClassificationDetail,'
             + ' classification=' + classification +
             + ' year=' + str(year))
            return {}


    #def getClassificationList(classification = u.):

    def getMiddleYearStatement(self, year):
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
                        d.append(current if current != 0 else '')
                    else:
                        d.append('')
                dic[acc.name] = d
            return dic

        except Exception as e:
            logger.error('exception in BSClass.getMiddleYearStatement, year=' + str(year))
            return {}
