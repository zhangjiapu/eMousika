# Generated by Django 2.0.4 on 2018-05-07 14:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resource', '0002_auto_20180421_2350'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='imgLink',
            field=models.CharField(blank=True, max_length=200, null=True, verbose_name='图片网络链接'),
        ),
    ]
