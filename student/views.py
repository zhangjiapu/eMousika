from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from resource.models import Video,Book,Article
from inClass.models import Material,Question,TestPaper,Choice
from interaction.models import Advice,Announcement,Share
import datetime

global srcLink
srcLink = "http://127.0.0.1:8000/media/"

# Create your views here.
def isRegister(username):
    try:
        User.objects.get(username=username)
    except User.DoesNotExist:
        return False
    return True

def doLogin(request):
    if request.method == 'POST':
        username = request.POST["username"]
        password = request.POST['password']
        user = authenticate(username = username,password = password)
        # 用户合法，保存session信息，进入index页面
        if user is not None:
            request.session["username"] = username
            request.session["password"] = password
            request.session.set_expiry(0)
            return HttpResponseRedirect(reverse('student:index'))
        # 不合法，返回原页面,提示用户不合法
        else:
            return render(request,'student/studentLogin.html',{"msg":True})
    else:
        return render(request,'student/studentLogin.html',{"msg":False})

def doRegister(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        email = request.POST["email"]
        # 已注册，提示已存在
        if isRegister(username):
            return render(request,'student/register.html',{"flag":True})
        # 未注册，创建用户后，跳转到登录界面
        else:
            User.objects.create_user(username=username,password=password,email=email)
            return render(request,'student/studentLogin.html',{"msg":False})
    else:
        return render(request,'student/register.html',{"flag":False})

def index(request):
    if "username" in request.session.keys() and "password"  in request.session.keys():
        username = request.session["username"]
        password = request.session["password"]
        user = authenticate(username = username,password = password)
        print(username)
        print(password)
        # 用户合法，跳转到index页面
        if user is not None:
            return render(request,'student/index.html',{"username":username})
        # 用户不合法，跳转到error页面
        else:
            return render(request,'student/error.html',{"errorMsg":"请先登录"})
    else:
        return render(request,'student/error.html',{"errorMsg":"请先登录"})

def advice(request):
    pass

def announcement(request):
    pass

def article(request):
    pass

def book(request):
    pass

def interest(request):
    pass

def news(request):
    pass

def slice(request):
    pass

def textPaper(request):
    pass

def userInfor(request):
    pass

def video(request):
    now = datetime.datetime.now()
    delta = datetime.timedelta(days=-7)
    datelimt = now+delta
    # 筛选近7天内发布的视频资料
    videolist = Video.objects.filter(status=2,pubtime__gte=datelimt).order_by("-pubtime")
    print(list(videolist)[0].area)
    return render(request,'student/video.html',{"videos":list(videolist),"srcLink":srcLink})

def viewShare(request):
    pass

def writeShare(request):
    pass