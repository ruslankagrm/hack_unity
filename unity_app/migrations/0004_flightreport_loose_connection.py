# Generated by Django 3.2.6 on 2021-12-03 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('unity_app', '0003_auto_20211203_1806'),
    ]

    operations = [
        migrations.AddField(
            model_name='flightreport',
            name='loose_connection',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
