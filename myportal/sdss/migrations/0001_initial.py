# Generated by Django 2.1.2 on 2018-10-29 06:13

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AccBot',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('sort_order', models.IntegerField(blank=True, null=True)),
                ('name', models.CharField(max_length=45)),
                ('name_ac', models.CharField(blank=True, max_length=45, null=True)),
                ('note', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'acc_bot',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AccMid',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('sort_order', models.IntegerField(blank=True, null=True)),
                ('name', models.CharField(max_length=45)),
                ('note', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'acc_mid',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AccTop',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=45, null=True)),
                ('union_bs1_pl2_cs3', models.IntegerField(blank=True, null=True)),
                ('is_br', models.IntegerField(blank=True, null=True)),
                ('note', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'acc_top',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Budget',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('from_field', models.CharField(db_column='from', max_length=10)),
                ('for_field', models.CharField(db_column='for', max_length=10)),
                ('amount_per_month', models.IntegerField()),
                ('note', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'budget',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Journal',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('date', models.CharField(max_length=10)),
                ('br_amount', models.IntegerField(blank=True, null=True)),
                ('cr_amount', models.IntegerField(blank=True, null=True)),
                ('note', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'journal',
                'managed': False,
            },
        ),
    ]
