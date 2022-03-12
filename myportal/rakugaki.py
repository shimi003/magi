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

