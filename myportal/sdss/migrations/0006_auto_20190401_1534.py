# Generated by Django 2.1.2 on 2019-04-01 15:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sdss', '0005_auto_20190318_0114'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='accbot',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='acctop',
            options={'managed': True},
        ),
    ]