# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-09-01 06:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='title',
            field=models.CharField(max_length=64, null=True),
        ),
    ]
