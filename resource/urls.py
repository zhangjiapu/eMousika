from django.conf.urls import url
from . import views

app_name = "resource"
urlpatterns = [
    url('api/article/',views.getArticle),
    url('api/video/',views.getVideo),
    url('api/book/',views.getBook),
    url('api/news/',views.getNews),

]