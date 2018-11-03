from django.db import models

# Create your models here.
class Material(models.Model):
    topic = models.CharField(verbose_name="主题",max_length=50)
    slice = models.FileField(verbose_name="课件")
    upload_date = models.DateField(verbose_name="上传日期",auto_now=True)

    def __str__(self):
        return self.topic

    class Meta:
        db_table = 'meterial'
        verbose_name = "课件"
        verbose_name_plural = verbose_name

class Question(models.Model):
    questionText = models.CharField(verbose_name="题干",max_length=100)
    answer = models.CharField(verbose_name="正解",max_length=100)

    def __str__(self):
        return self.questionText

    class Meta:
        db_table = 'question'
        verbose_name = "题库试题"
        verbose_name_plural = verbose_name

class Choice(models.Model):
    question = models.ForeignKey(Question,on_delete=models.CASCADE,null=True,verbose_name="题干")
    choiceText = models.CharField(max_length=100,verbose_name="选项")

    # def delete(self, using=None, keep_parents=False):
    #     self.question = None
    #     super().delete(using=None, keep_parents=False)

    class Meta:
        db_table = 'Choice'
        verbose_name = "选项"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "选项"

class TestPaper(models.Model):
    choiceDict = (
        (False,"未发布"),
        (True,"已发布"),
    )
    name = models.CharField(verbose_name="试卷名称",max_length=30)
    number = models.IntegerField(verbose_name="试题数量",default=0)
    create_time = models.DateField(verbose_name="创建日期",auto_now=True)
    status = models.BooleanField(verbose_name="是否发布",choices=choiceDict,default=False)
    questions = models.ManyToManyField(Question,verbose_name="添加试题")

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'testpaper'
        verbose_name = "课堂测验"
        verbose_name_plural = verbose_name


