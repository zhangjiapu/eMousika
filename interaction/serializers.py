from rest_framework import serializers
from .models import Announcement,Advice,Share,UserProfile,SignInCode

class AnnouncementSerializer(serializers.ModelSerializer):
    class Meta:
        model =Announcement
        fields = ['id','title','content','pub_time']

class AdviceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Advice
        fields = ['id','title','content','submit_time','user']

class ShareSerializer(serializers.ModelSerializer):
    class Meta:
        model = Share
        fields = ['id','title','area','type','content','reason','student','share_time']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields=['id','username','password','isSigin']

class SignInCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SignInCode
        fields = ['id','code']