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
    acc_mid_uid = models.ForeignKey('AccMid', models.DO_NOTHING, db_column='acc_mid_uid')
    sort_order = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=45)
    name_ac = models.CharField(max_length=45, blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'acc_bot'

class AccMid(models.Model):
    uid = models.AutoField(primary_key=True)
    acc_top_uid = models.ForeignKey('AccTop', models.DO_NOTHING, db_column='acc_top_uid')
    sort_order = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=45)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'acc_mid'


class AccTop(models.Model):
    uid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45, blank=True, null=True)
    union_bs1_pl2_cs3 = models.IntegerField(blank=True, null=True)
    is_br = models.IntegerField(blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

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
    group_id = models.CharField(max_length=14)
    br_acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='br_acc_bot_uid', related_name='journal_acc_br_id')
    br_amount = models.IntegerField(blank=True, null=True)
    cr_acc_bot_uid = models.ForeignKey(AccBot, models.DO_NOTHING, db_column='cr_acc_bot_uid', related_name='journal_acc_cr_id')
    cr_amount = models.IntegerField(blank=True, null=True)
    note = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'journal'
