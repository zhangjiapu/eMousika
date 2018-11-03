# Generated by Django 2.0.4 on 2018-05-07 15:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resource', '0008_auto_20180507_1506'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='title',
            field=models.CharField(max_length=100, verbose_name='标题'),
        ),
        migrations.AlterField(
            model_name='book',
            name='imgLink',
            field=models.URLField(blank=True, max_length=500, null=True, verbose_name='图片网络链接'),
        ),
        migrations.AlterField(
            model_name='video',
            name='origin',
            field=models.CharField(max_length=50, verbose_name='来源'),
        ),
        migrations.AlterField(
            model_name='video',
            name='title',
            field=models.CharField(max_length=200, verbose_name='标题'),
        ),
    ]
