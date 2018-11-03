from django.conf.urls import url
from . import views

app_name = "interaction"
urlpatterns = [
    url(r'api/announcement/',views.AnnouncementView.as_view()),
    url(r'api/advice/',views.AdviceView.as_view()),
    url(r'api/share/',views.ShareView.as_view()),
    url(r'api/login/',views.doLogin),
    url(r'api/register/',views.doRegsiter),
    # url(r'api/makeSignInCode/',views.MakeSignInCodeView.as_view()),
    url(r'api/getSignCode/',views.GetSignCodeView.as_view()),
    url(r'api/getNotSignUser/',views.GetNotSignInUser.as_view()),

    url(r'api/doSignIn/',views.doSignIn),
    url(r'api/registerInterest/',views.registerInterest),

]
