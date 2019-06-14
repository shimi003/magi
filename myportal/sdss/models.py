# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class AccBot(models.Model):
    uid = models.AutoField(primary_key=True)
    acc_mid_uid = models.ForeignKey('AccMid', models.DO_NOTHING, db_column='acc_mid_uid', related_name='acc_mid_uid_bspl')
    sort_order = models.IntegerField(blank=True, null=True)
    acc_cs_uid = models.ForeignKey('AccMid', models.DO_NOTHING, db_column='acc_cs_uid', related_name='acc_mid_id_cs')
    name = models.CharField(max_length=45)
    name_ac = models.CharField(max_length=45, blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'acc_bot'


class AccMid(models.Model):
    uid = models.AutoField(primary_key=True)
    acc_top_uid = models.ForeignKey('AccTop', models.DO_NOTHING, db_column='acc_top_uid')
    sort_order = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=45)
    note = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'acc_mid'


class AccTop(models.Model):
    uid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45, blank=True, null=True)
    union_bs1_pl2_cs3 = models.IntegerField(blank=True, null=True)
    sort_order = models.IntegerField(blank=True, null=True)
    is_br = models.IntegerField(blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'acc_top'


class Budget(models.Model):
    uid = models.AutoField(primary_key=True)
    acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='acc_bot_uid')
    from_field = models.CharField(db_column='from', max_length=10)  # Field renamed because it was a Python reserved word.
    for_field = models.CharField(db_column='for', max_length=10)  # Field renamed because it was a Python reserved word.
    amount_per_month = models.IntegerField()
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'budget'


class Journal(models.Model):
    uid = models.AutoField(primary_key=True)
    date = models.CharField(max_length=10)
    was_regist_by_system = models.BooleanField(null=True)
    group_id = models.CharField(max_length=20)
    br_acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='br_acc_bot_uid', related_name='journal_acc_br_id')
    br_amount = models.IntegerField(blank=True, null=True)
    cr_acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='cr_acc_bot_uid', related_name='journal_acc_cr_id')
    cr_amount = models.IntegerField(blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'journal'


class RegularlyPayment(models.Model):
    uid = models.AutoField(primary_key=True)
    is_regist_automaticaly = models.BooleanField()
    acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='acc_bot_uid', related_name='rp_acc_bot_uid')
    acc_bot_uid_from = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='acc_bot_uid_from', related_name='acc_bot_uid_from')
    amount_per_month = models.IntegerField()
    payment_day = models.CharField(max_length=20, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'regularly'


class FixedAsset(models.Model):
    uid = models.AutoField(primary_key=True)
    acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='acc_bot_uid', related_name='fa_acc_bot_uid')
    asset_no = models.CharField(max_length=20, null=True, default='shixxxx')
    asset_name = models.CharField(max_length=45)
    get_date = models.CharField(max_length=10)
    acquisition_cost = models.IntegerField()
    carrying_value = models.IntegerField()
    amortization_way = models.CharField(max_length=10, default='定額法')
    amortization_term_in_month = models.IntegerField()
    passed_months = models.IntegerField()
    amortization_cost_per_month = models.IntegerField()
    amortizated_total_cost = models.IntegerField()
    sales_income = models.IntegerField()
    is_using = models.BooleanField(null=False, default=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'fixed_asset'


class AccountGroup(models.Model):
    uid = models.AutoField(primary_key=True)
    group_name = models.CharField(max_length=45)
    sort_order = models.IntegerField(blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'account_group'


class AccountGroupList(models.Model):
    uid = models.AutoField(primary_key=True)
    account_group_uid = models.ForeignKey(AccountGroup, models.DO_NOTHING, db_column='account_group_uid', related_name='account_group_uid')
    acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='acc_bot_uid', related_name='ag_acc_bot_uid')
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'account_group_list'
