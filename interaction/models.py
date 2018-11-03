from django.db import models
from resource.models import AreaDict
from resource import Const
from django.contrib.auth.models import AbstractUser

class UserProfile(AbstractUser):
    interest = models.ManyToManyField(to=AreaDict,verbose_name="兴趣")
    isSigin = models.BooleanField(default=False,verbose_name='是否签到')

    class Meta:
        db_table = "user"
        verbose_name = "学生管理"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


# Create your models here.
class Announcement(models.Model):
    title = models.CharField(verbose_name="通知标题",max_length=40)
    content = models.TextField(verbose_name="通知内容")
    pub_time = models.DateTimeField(verbose_name="发布时间",auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'annoucement'
        verbose_name = "教学通知"
        verbose_name_plural = verbose_name

class Advice(models.Model):
    statusChoice = (
        (True,'已读'),
        (False,'未读'),
    )
    title = models.CharField(max_length=100,verbose_name="建议标题")
    content = models.TextField(verbose_name="建议内容")
    submit_time = models.DateTimeField(verbose_name="提交时间",auto_now=True)
    status = models.BooleanField(verbose_name="是否已读",choices=statusChoice,default=False)
    user = models.CharField(verbose_name="建议人",default="",max_length=30)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'advice'
        verbose_name = "教学建议"
        verbose_name_plural = verbose_name

class Share(models.Model):
    title = models.CharField(verbose_name="分享标题",max_length=50)
    area = models.ForeignKey(AreaDict, verbose_name="领域", on_delete=models.SET_NULL, null=True) # 分享的内容的领域
    type = models.IntegerField(verbose_name="类别", choices=Const.type_dict)
    content = models.TextField(verbose_name="分享内容")
    reason = models.TextField(verbose_name="分享理由")
    status = models.IntegerField(verbose_name="状态",choices=Const.article_status,default=0)
    student = models.ForeignKey(verbose_name="分享人",to=UserProfile,on_delete=models.CASCADE)
    share_time = models.DateTimeField(verbose_name="分享时间", auto_now=True)  # 分享时间
    pub_time = models.DateTimeField(verbose_name="发布时间",auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'share'
        verbose_name = "学生分享"
        verbose_name_plural = verbose_name

class SignInCode(models.Model):
    code = models.CharField(max_length=20,verbose_name='考勤码')
    maketime = models.DateTimeField(verbose_name='创建时间',auto_now=True)

    def __str__(self):
        return self.code

    class Meta:
        db_table = 'signInCode'
        verbose_name = '考勤码'
        verbose_name_plural = verbose_name

