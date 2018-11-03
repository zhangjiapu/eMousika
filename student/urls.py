from django.urls import path
from . import views

app_name = "student"
urlpatterns = [
    path('',views.doLogin,name = "login"),
    path('register/',views.doRegister,name = "register"),
    path('index/',views.index,name = "index"),

    path('advice/',views.advice,name = "advice"),
    path('announcement/',views.announcement,name = "announcement"),
    path('article/',views.article,name = "article"),
    path('book/',views.book,name = "book"),
    path('interest/', views.interest, name="interest"),
    path('news/', views.news, name="news"),
    path('slice/', views.slice, name="slice"),
    path('textPaper/', views.textPaper, name="textPaper"),
    path('userInfor/', views.userInfor, name="userInfor"),
    path('video/', views.video, name="video"),
    path('viewShare/', views.viewShare, name="viewShare"),
    path('writeShare/', views.writeShare, name="writeShare"),


]