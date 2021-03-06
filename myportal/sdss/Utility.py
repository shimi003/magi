from datetime import datetime, timedelta, timezone
import logging as log

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


def getSelectableYearList():
    ret = []
    ret.append('2021')
    ret.append('2020')
    ret.append('2019')
    ret.append('2018')
    return ret



def cleanYear(year):
    year = getEmptyOrValueInt(year)
    try:
        if int(year) < 1900 or 2100 < int(year):
            return datetime.now().year
        else:
            return int(year)
    except ValueError:
        print('ValueError')
        return  datetime.now().year
    except TypeError:
        print('TypeError')
        return  datetime.now().year


def getStrTimeStamp():
    '''create timestamp string from now date and time. ex. 2019092712836724 '''
    nowdt = datetime.now()
    strTimeStamp =  '{:04d}'.format(nowdt.year)
    strTimeStamp += '{:02d}'.format(nowdt.month)
    strTimeStamp += '{:02d}'.format(nowdt.day)
    strTimeStamp += '{:02d}'.format(nowdt.second)
    strTimeStamp += '{:05d}'.format(nowdt.microsecond)
    return strTimeStamp


def cleanMonth(month):
    try:
        ret = 0;
        if int(month) == 0 or int(month) < 1 or 12 < int(month):
            ret = datetime.now().month
        else:
            ret = int(month)
        return ret
    except ValueError:
        return  datetime.now().month
    except TypeError:
        return  datetime.now().month


def get_nowdt():
    '''日本時間の現在日時のdatetimeオブジェクトを返す'''
    JST = timezone(timedelta(hours=+9), 'JST')
    return datetime.now(JST)


def createCurrentDateString():
    '''今日の年月日を返す（例：20190901）'''
    today = get_nowdt()
    year = today.year
    month = today.month
    day = today.day
    return '{:04}'.format(year) + '{:02}'.format(month) + '{:02}'.format(day)


def createYesterdayDateString():
    '''前日の年月日を返す（例：20190831）'''
    yeaterday = get_nowdt() - timedelta(days=1)
    year = yeaterday.year
    month = yeaterday.month
    day = yeaterday.day
    return '{:04}'.format(year) + '{:02}'.format(month) + '{:02}'.format(day)


def createCurrentYearMonthString(year, month):
    year = cleanYear(year)
    month = cleanMonth(month)
    return '{:04}'.format(year) + '{:02}'.format(month)


def createNextYearMonthString(year, month):
    year = cleanYear(year)
    month = cleanMonth(month)
    if month == 12:
        year += 1
        month = 1
    else:
        month +=1
    return '{:04}'.format(year) + '{:02}'.format(month)


def getEmptyOrValue(input):
    try:
        if input is None:
            return ''
        else:
            return str(input)
    except:
        return ''


def getEmptyOrValueInt(input):
    try:
        if input is None:
            return 0
        else:
            return int(input)
    except:
        return 0


# TODO write out log in iligal input
def diffBrCr(br, cr, direction):
    br = getEmptyOrValueInt(br)
    cr = getEmptyOrValueInt(cr)
    direction = getEmptyOrValueInt(direction)
    if direction == 0:
        return 0
    elif direction > 0:
        return br - cr
    else:
        return cr - br


def isIntAndNotZero(str):
    try:
        if str == '' or int(str) == 0:
            return False
        else:
            return True
    except Exception as e:
        log.info('an Exception in isIntAndNotZero: ' + str)
        return False
