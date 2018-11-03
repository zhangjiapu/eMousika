from django.shortcuts import render
from .models import Advice,Announcement,Share,UserProfile,SignInCode
from .serializers import AdviceSerializer,AnnouncementSerializer,ShareSerializer,UserSerializer,SignInCodeSerializer
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth import authenticate
import datetime,random,string
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from resource.models import AreaDict

# Create your views here.

class AnnouncementView(APIView):

    def get(self, request, format=None):
        delta = datetime.timedelta(days=-7)
        timeLimit = datetime.datetime.now()+delta
        mlist = Announcement.objects.filter(pub_time__gte=timeLimit).order_by("-pub_time")
        serializer = AnnouncementSerializer(mlist,many=True)
        return Response(serializer.data)

class AdviceView(APIView):

    def get(self,request,format = None):
        advices = Advice.objects.all().order_by('-submit_time')
        serializer = AdviceSerializer(advices,many=True)
        return Response(serializer.data)


    def post(self,request,format =None):
        serializer = AdviceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)

class ShareView(APIView):

    def get(self,request,format = None):
        shares = Share.objects.filter(status=2).order_by("-pub_time")
        serializer = ShareSerializer(shares,many=True)
        return Response(serializer.data)

    def post(self,request,format = None):
        serializer = ShareSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)


# class LoginView(APIView):
#     def post(self,request,format=None):
#         userdata = UserSerializer(data=request.data)
#         if userdata.is_valid():
#             username = userdata.data["username"]
#             password = userdata.data["password"]
#             user = authenticate(username= username,password=password)
#             # 合法
#             if user is not None:
#                 return Response(userdata.data,status = status.HTTP_201_CREATED)
#             else:
#                 return Response(userdata.errors,status=status.HTTP_400_BAD_REQUEST)
#         return Response(userdata.errors,status=status.HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(['POST'])
def doLogin(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)

    userdata = UserSerializer(user)
    # 合法
    if user is not None:
        return Response(userdata.data, status=status.HTTP_200_OK)
    else:
        return Response(userdata.errors, status=status.HTTP_400_BAD_REQUEST)

def isRegister(username):
    try:
        UserProfile.objects.get(username=username)
    except UserProfile.DoesNotExist:
        return False
    return True

@csrf_exempt
@api_view(['POST'])
def doRegsiter(request):
    username = request.POST['username']
    password = request.POST['password']
    email = request.POST['email']

    if isRegister(username):
        user = UserProfile.objects.get(username=username)
        userdata = UserSerializer(user)
        return Response(userdata.data, status=status.HTTP_400_BAD_REQUEST)
    else:
        user = UserProfile.objects.create_user(username=username, password=password,email=email)
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

class GetSignCodeView(APIView):
    def makeCode(self):
        code = ''.join(random.sample(string.ascii_letters + string.digits,4))
        signInCode = SignInCode(code=code)
        signInCode.save()

    def get(self,request,format = None):
        self.makeCode()
        code = SignInCode.objects.order_by('-maketime').first()
        serializer = SignInCodeSerializer(code)
        return Response(serializer.data)

@csrf_exempt
@api_view(['POST'])
def doSignIn(request):
    pk = request.POST['userid']
    print(pk)
    user = UserProfile.objects.get(pk = pk)
    user.isSigin = True
    user.save()

    serializer = UserSerializer(user)
    return Response(serializer.data,status=status.HTTP_201_CREATED)

class GetNotSignInUser(APIView):

    def get(self,request,format = None):
        results = UserProfile.objects.filter(isSigin=False)
        serializer = UserSerializer(results,many=True)
        return Response(serializer.data)


@csrf_exempt
@api_view(['POST'])
def registerInterest(request):
    userid = request.POST['userid']
    interests = request.POST['interests']

    interestList = interests.split(',')

    user = UserProfile.objects.get(pk = userid)
    for item in interestList:
        user.interest.add(AreaDict.objects.get(areaCode=item))

    serializer = UserSerializer(user)
    return Response(serializer.data,status=status.HTTP_201_CREATED)








