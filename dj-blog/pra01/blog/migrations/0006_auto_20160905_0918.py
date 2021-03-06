# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-09-05 09:18
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_auto_20160901_0809'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='author',
            name='articles',
        ),
        migrations.RemoveField(
            model_name='article',
            name='identifier',
        ),
        migrations.AddField(
            model_name='article',
            name='content',
            field=models.TextField(default=datetime.datetime(2016, 9, 5, 9, 17, 37, 561445, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='article',
            name='publish_time',
            field=models.DateField(auto_now_add=True, default=datetime.datetime(2016, 9, 5, 9, 17, 54, 34266, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='article',
            name='subtitle',
            field=models.CharField(max_length=64, null=True),
        ),
        migrations.AddField(
            model_name='article',
            name='update_time',
            field=models.DateField(auto_now=True, default=datetime.datetime(2016, 9, 5, 9, 18, 4, 778648, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.DeleteModel(
            name='Author',
        ),
    ]
