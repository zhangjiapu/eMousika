from django.db import models
from . import Const
from django.contrib.auth.models import AbstractUser


# Create your models here.
class AreaDict(models.Model):
    area = models.CharField(max_length=20, verbose_name="领域")
    areaCode = models.IntegerField(verbose_name="领域编号",null=True,blank=True)

    def __str__(self):
        return self.area

    class Meta:
        db_table = "areaDict"
        verbose_name = "领域"
        verbose_name_plural = verbose_name

class Article(models.Model):
    newsChoice = (
        (True,"是新闻"),
        (False,"不是新闻"),
    )
    area = models.ManyToManyField(AreaDict, verbose_name="领域")
    title = models.CharField(verbose_name="标题",max_length=100)
    content = models.TextField(verbose_name="内容") #文章内容
    link = models.URLField(verbose_name="链接",blank= True,max_length=1000) #文章链接
    img = models.ImageField(verbose_name="配图",blank=True,null=True,max_length=20000) # 文章配图
    # viewNumber = models.IntegerField(verbose_name="浏览量",default=0) # 浏览量
    savetime = models.DateTimeField(verbose_name="保存时间",auto_now=True) #保存时间
    origin = models.CharField(verbose_name="来源",max_length=20) # 文章来源出处
    status = models.IntegerField(verbose_name="文章状态",choices=Const.article_status,default=0) # 0代表未审核，1代表通过审核，2代表已经发布
    pubtime = models.DateField(verbose_name="发布时间",auto_now=True)
    isNews = models.BooleanField(default=True,choices=newsChoice,verbose_name="新闻/文章")

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'article'
        verbose_name = "文章"
        verbose_name_plural = verbose_name

class Video(models.Model):
    area = models.ManyToManyField(AreaDict, verbose_name="领域")
    title = models.CharField(verbose_name="标题",max_length=500)
    savetime = models.DateTimeField(verbose_name="保存时间",auto_now=True) # 保存时间
    origin = models.CharField(verbose_name="来源",max_length=50)
    link = models.URLField(verbose_name="链接",blank=True,max_length=200)
    # viewNumber = models.IntegerField(verbose_name="浏览量",default=0)
    # week = models.IntegerField(verbose_name="发布周次",default=0)
    status = models.IntegerField(verbose_name="视频状态",choices=Const.article_status,default=0)
    pubtime = models.DateField(verbose_name="发布时间", auto_now=True)
    resource = models.FileField(verbose_name="资源上传",null=True,blank=True)
    summary =models.TextField(null=True,verbose_name="简介",blank=True)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'video'
        verbose_name = "视频"
        verbose_name_plural = verbose_name

class Book(models.Model):
    area = models.ManyToManyField(AreaDict, verbose_name="领域")
    bookName = models.CharField(verbose_name="书名",max_length=300)
    discription = models.TextField(verbose_name="书籍描述")
    img = models.ImageField(verbose_name="书籍配图",blank=True,max_length=200)
    imgLink = models.URLField(verbose_name="图片网络链接",blank=True,max_length=500,null=True)
    origin = models.CharField(verbose_name="来源",max_length=20)
    author = models.CharField(verbose_name="作者",max_length=300)
    publisher = models.CharField(verbose_name="出版社",max_length=100)
    status = models.IntegerField(verbose_name="书籍状态",choices=Const.article_status,default=0) # 0代表未审核，1代表通过审核，2代表已经发布，-1代表删除
    # week = models.IntegerField(verbose_name="发布周次",default=0)
    savetime = models.DateTimeField(verbose_name="保存时间",auto_now=True)
    pubtime = models.DateField(verbose_name="发布时间", auto_now_add=True)

    def __str__(self):
        return self.bookName

    class Meta:
        db_table = 'book'
        verbose_name = "书籍"
        verbose_name_plural = verbose_name
