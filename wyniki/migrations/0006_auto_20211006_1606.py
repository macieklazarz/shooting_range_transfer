# Generated by Django 3.2.6 on 2021-10-06 14:06

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('wyniki', '0005_ustawienia'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='wyniki',
            options={'verbose_name_plural': 'Wyniki'},
        ),
        migrations.AddField(
            model_name='wyniki',
            name='slug',
            field=models.SlugField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
