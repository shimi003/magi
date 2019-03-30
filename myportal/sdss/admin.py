from django.contrib import admin
from .models import AccBot, AccMid, AccTop, Journal, Budget

# Register your models here.
class AccBotAdmin(admin.ModelAdmin):
    list_display = ('uid', 'name', 'note')

class AccMidAdmin(admin.ModelAdmin):
    list_display = ('uid', 'name', 'note')

class AccTopAdmin(admin.ModelAdmin):
    list_display = ('uid', 'name', 'note')

class JournalAdmin(admin.ModelAdmin):
    list_display = ('uid', 'date_alias', 'br_acc_bot_uid_name', 'br_amount_alias', 'cr_acc_bot_uid_name', 'cr_amount_alias', 'note_alias')
    def br_acc_bot_uid_name(self, obj):
        if obj.br_acc_bot_uid.name == '（選択してください）':
            return ''
        else:
            return obj.br_acc_bot_uid.name
    br_acc_bot_uid_name.short_description = '借方勘定科目名'

    def cr_acc_bot_uid_name(self, obj):
        if obj.cr_acc_bot_uid.name == '（選択してください）':
            return ''
        else:
            return obj.cr_acc_bot_uid.name
    cr_acc_bot_uid_name.short_description = '貸方勘定科目名'

    def br_amount_alias(self, obj):
        return obj.br_amount
    br_amount_alias.short_description = '借方金額'

    def cr_amount_alias(self, obj):
        return obj.cr_amount
    cr_amount_alias.short_description = '貸方金額'

    def date_alias(self, obj):
        return obj.date
        #return obj.date[0:4] + '/' + obj.date[4:6] + '/' + obj.date[6:8]
    date_alias.short_description = '日付'

    def note_alias(self, obj):
        return obj.note
    note_alias.short_description = '特記事項'


class BudgetAdmin(admin.ModelAdmin):
    list_display = ('uid_alias', 'acc_bot_name', 'from_field_alias', 'for_field_alias', 'amount_per_month_alias', 'note')

    def uid_alias(self, obj):
        return obj.uid
    uid_alias.short_description = 'UID'

    def from_field_alias(self, obj):
        return obj.from_field
    from_field_alias.short_description = '有効期間（開始）'

    def for_field_alias(self, obj):
        return obj.for_field
    for_field_alias.short_description = '有効期間（終了）'

    def acc_bot_name(self, obj):
        return obj.acc_bot_uid.name
    acc_bot_name.short_description = '勘定科目名'

    def amount_per_month_alias(self, obj):
        return '{:,}'.format(obj.amount_per_month) + '円'
    amount_per_month_alias.short_description = '月間予算'



admin.site.register(AccBot, AccBotAdmin)
admin.site.register(AccMid, AccMidAdmin)
admin.site.register(AccTop, AccTopAdmin)
admin.site.register(Journal, JournalAdmin)
admin.site.register(Budget, BudgetAdmin)
