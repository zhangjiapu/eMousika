import xadmin
from .models import Announcement,Advice,Share,UserProfile
from . import myactions

class AnnouncementAdmin(object):
    list_display = ['title','content','pub_time']
    search_fields = ['title','content']
    list_filter = ['pub_time']

class AdviceAdmin(object):
    list_display = ['title','user','content','status','submit_time']
    search_fields = ['title','user','content']
    list_filter = ['status','submit_time']
    list_editable = ['status']


class ShareAdmin(object):
    list_display = ['title','student','type','area','status','share_time','pub_time']
    search_fields = ['title','student','content']
    list_filter = ['area','type','status','share_time','pub_time']
    actions = [myactions.checkShare,myactions.pubAction]

# class UserAdmin(object):
#     list_display = ['username','email','isSigin','date_joined','last_login']
#     search_fields=list_display
#     list_filter=list_display


xadmin.site.register(Announcement,AnnouncementAdmin)
xadmin.site.register(Advice,AdviceAdmin)
xadmin.site.register(Share,ShareAdmin)
# xadmin.site.register(UserProfile,UserAdmin)