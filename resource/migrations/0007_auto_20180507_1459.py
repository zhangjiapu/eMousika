# Generated by Django 2.0.4 on 2018-05-07 14:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resource', '0006_auto_20180507_1457'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='title',
            field=models.CharField(max_length=50, verbose_name='标题'),
        ),
        migrations.AlterField(
            model_name='video',
            name='origin',
            field=models.CharField(max_length=20, verbose_name='来源'),
        ),
        migrations.AlterField(
            model_name='video',
            name='title',
            field=models.CharField(max_length=50, verbose_name='标题'),
        ),
    ]