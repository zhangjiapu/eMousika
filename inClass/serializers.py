from rest_framework import serializers
from .models import Material,TestPaper,Choice,Question

class MaterialSerializer(serializers.ModelSerializer):
    class Meta:
        model = Material
        fields = ['topic','slice','upload_date']

class TestPaperSerializer(serializers.ModelSerializer):
    class Meta:
        model = TestPaper
        fields = ['id','name','number','create_time','questions']

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id','questionText','answer']


class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = ['id','choiceText','question']