from django.shortcuts import render
from .models import AreaDict,Article,Video,Book
from .serializers import ArticleSerializer,BookSerializer,AreaDictSerializer,VideoSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework import status
from interaction.models import UserProfile
from django.db.models import Q

# # Create your views here.
# class ArticleView(APIView):
#
#     def get(self, request, format=None):
#         # delta = datetime.timedelta(days=-7)
#         # timeLimit = datetime.datetime.now()+delta
#         mlist = Article.objects.filter(isNews=False).order_by("-pubtime")
#         serializer = ArticleSerializer(mlist, many=True,context={"request":request})
#         return Response(serializer.data)
#
# class VideoView(APIView):
#     def get(self, request, format=None):
#         # delta = datetime.timedelta(days=-7)
#         # timeLimit = datetime.datetime.now() + delta
#         mlist = Video.objects.order_by("-pubtime")
#         serializer = VideoSerializer(mlist, many=True,context={"request":request})
#         return Response(serializer.data)
#
# class BookView(APIView):
#
#     def get(self,request,format = None):
#         # delta = datetime.timedelta(days=-7)
#         # timeLimit = datetime.datetime.now() + delta
#         mlist = Book.objects.order_by("-pubtime")
#         serializer = BookSerializer(mlist, many=True,context={"request":request})
#         return Response(serializer.data)
#
# class NewsView(APIView):
#     def get(self, request, format=None):
#         # delta = datetime.timedelta(days=-7)
#         # timeLimit = datetime.datetime.now() + delta
#         mlist = Article.objects.filter(isNews=True).order_by("-pubtime")
#         serializer = ArticleSerializer(mlist, many=True,context={"request":request})
#         return Response(serializer.data)

@csrf_exempt
@api_view(['POST'])
def getArticle(request):
    userid = request.POST['userid']
    user = UserProfile.objects.get(pk = userid)

    result = []
    # 获取该用户的所有兴趣
    interests = user.interest.all()

    for item in interests:
        print(item.article_set)
        articles = item.article_set.filter(status=2)

        s_data = ArticleSerializer(articles,many=True,context={"request":request})
        result.append(s_data.data)

    return Response(result,status=status.HTTP_200_OK)

@csrf_exempt
@api_view(['POST'])
def getVideo(request):
    userid = request.POST['userid']
    user = UserProfile.objects.get(pk = userid)

    result = []
    # 获取该用户的所有兴趣
    interests = user.interest.all()

    for item in interests:
        videos = item.video_set.filter(status=2)
        s_data = VideoSerializer(videos,many=True,context={"request":request})
        result.append(s_data.data)

    return Response(result,status=status.HTTP_200_OK)

@csrf_exempt
@api_view(['POST'])
def getBook(request):
    userid = request.POST['userid']
    user = UserProfile.objects.get(pk = userid)

    result = []
    # 获取该用户的所有兴趣
    interests = user.interest.all()

    for item in interests:
        books = item.book_set.filter(status=2)
        s_data = BookSerializer(books,many=True,context={"request":request})
        result.append(s_data.data)

    return Response(result,status=status.HTTP_200_OK)


@csrf_exempt
@api_view(['POST'])
def getNews(request):
    userid = request.POST['userid']
    user = UserProfile.objects.get(pk = userid)

    result = []
    # 获取该用户的所有兴趣
    interests = user.interest.all()
    print(interests)

    for item in interests:
        news = item.article_set.filter(status=2,isNews=True)
        s_data = ArticleSerializer(news,many=True,context={"request":request})
        result.append(s_data.data)

    return Response(result,status=status.HTTP_200_OK)