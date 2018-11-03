from .models import Article,Video,Book,AreaDict
from rest_framework import serializers

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields=['id','area','title','content','link','img','pubtime','origin']

class VideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Video
        fields=['id','area','title','pubtime','origin','link','resource','summary']

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields=['id','area','bookName','discription','img','origin','author','publisher','pubtime','imgLink']

class AreaDictSerializer(serializers.ModelSerializer):
    class Meta:
        model = AreaDict
        fields=['id','areaCode','area']
