from datetime import datetime
import logging as log
import sdss.models as db
from django.db.models import Sum
import sdss.Utility as u

def getBudget(acc_bot_uid):

    if u.isIntAndNotZero(acc_bot_uid):
        return 0
    else:
        qs_acc_list = db.Budget.objects.get(uid=acc_bot_uid)
        for qs_acc in qs_acc_list:
            strFrom = qs_acc.from_field
            strFor = qs_acc.for_field
            if isTermInNow(strFrom_, strFor):
                return qs_acc.amount_per_month
        return 0

def isTermInNow(strFrom, strFor):
    strNow = datetime.now().strftime('%Y%m%d')
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
