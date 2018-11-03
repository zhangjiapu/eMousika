from django.conf.urls import url
from . import views
# from django.urls import

app_name = "inClass"
urlpatterns = [
    url('api/material/',views.MateriaOperation.as_view()),
    url('api/paper/',views.getPaperList.as_view()),
    url('api/question/',views.getQuestion),
    url('api/choice/',views.getChoice),
]