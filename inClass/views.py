from django.shortcuts import render
from .models import Material,TestPaper,Choice,Question
from .serializers import MaterialSerializer,TestPaperSerializer,ChoiceSerializer,QuestionSerializer
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.http import Http404
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view

# Create your views here.

class MateriaOperation(APIView):

    def get(self, request, format=None):
        mlist = Material.objects.all().order_by("-upload_date")
        serializer = MaterialSerializer(mlist, many=True,context={'request':request})
        return Response(serializer.data)

class getPaperList(APIView):

    def get(self,request,format =None):
        paperlist = TestPaper.objects.filter(status=True).order_by("-create_time")
        serializer = TestPaperSerializer(paperlist,many=True)
        return Response(serializer.data)

def get_questions(pk):
    try:
        return TestPaper.objects.get(pk = pk).questions
    except TestPaper.DoesNotExist:
        raise Http404

@csrf_exempt
@api_view(['POST'])
def getQuestion(request):
    pk = request.POST['paperid']
    print(pk)
    questions = get_questions(pk)
    serializer = QuestionSerializer(questions, many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)

def get_choices(pk):
    try:
        return Choice.objects.filter(question_id=pk)
    except Choice.DoesNotExist:
        raise Http404

@csrf_exempt
@api_view(['POST'])
def getChoice(request):
    question_pk = request.POST['questionid']
    choices = get_choices(question_pk)
    serializer = ChoiceSerializer(choices, many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)






