# Generated by Django 3.2.9 on 2022-01-04 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('zawody', '0006_auto_20220104_1227'),
    ]

    operations = [
        migrations.AddField(
            model_name='turniej',
            name='rejestracja',
            field=models.BooleanField(default=1, verbose_name='On/Off'),
            preserve_default=False,
        ),
    ]
