# Generated by Django 3.2.9 on 2022-02-23 11:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('zawody', '0008_alter_turniej_rejestracja'),
    ]

    operations = [
        migrations.AddField(
            model_name='turniej',
            name='klasyfikacja_generalna',
            field=models.BooleanField(default=True, verbose_name='Klasyfikacja generalna'),
        ),
        migrations.AlterField(
            model_name='turniej',
            name='rejestracja',
            field=models.BooleanField(default=True, verbose_name='Rejestracja'),
        ),
    ]
