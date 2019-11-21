from datetime import datetime
import logging as log
import sdss.models as db
from django.db.models import Sum
import sdss.Utility as u


def getNote(i_acc_bot_uid):
    if u.isIntAndNotZero(i_acc_bot_uid) == False:
        return ''
    else:
        if db.Budget.objects.filter(acc_bot_uid=i_acc_bot_uid).exists():
            qs_acc_list = db.Budget.objects.filter(acc_bot_uid=i_acc_bot_uid)
            for qs_acc in qs_acc_list:
                strFrom = qs_acc.from_field
                strFor = qs_acc.for_field
                if isTermInNow(strFrom, strFor):
                    return qs_acc.note
        return ''


def getBudget(i_acc_bot_uid):

    if u.isIntAndNotZero(i_acc_bot_uid) == False:
        return 0
    else:
        if db.Budget.objects.filter(acc_bot_uid=i_acc_bot_uid).exists():
            qs_acc_list = db.Budget.objects.filter(acc_bot_uid=i_acc_bot_uid)
            for qs_acc in qs_acc_list:
                strFrom = qs_acc.from_field
                strFor = qs_acc.for_field
                if isTermInNow(strFrom, strFor):
                    return qs_acc.amount_per_month
        return 0


def isTermInNow(strFrom, strFor):
    strNow = u.get_nowdt().strftime('%Y%m%d')
    # Nothing from
    if strFrom is None or strFrom == '':
        return False
    else:
        if strFrom > strNow:
            return False
        else:
            if strFor is None or strFor == '':
                return True
            else:
                if strFor < strNow:
                    return False
                else:
                    return True
