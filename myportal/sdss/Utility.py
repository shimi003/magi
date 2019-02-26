from datetime import datetime
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
    pass


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
