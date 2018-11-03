import xadmin
from xadmin import views as xviews
from . import myactions
from .models import AreaDict,Article,Book,Video

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "eMousika教育系统"
    site_footer = "eMousika在线教育网"
    menu_style = "accordion"

class ArticleAdmin(object):
    list_display = ['title','area','link','origin','status','isNews','savetime','pubtime']
    search_fields = ['title','area','origin']
    list_filter = ['area__area','origin','status','savetime','pubtime']
    actions = [myactions.checkArticle,myactions.pubArticle]
    list_editable = ['isNews','status']

class BookAdmin(object):
    list_display = ['bookName','area','origin','author','publisher','status','savetime','pubtime']
    search_fields = ['bookName','area','origin','author','publisher','status']
    list_filter = ['area','origin','author','publisher','status','savetime','pubtime']
    actions = [myactions.checkBook, myactions.pubBook]
    list_editable = ['status']

class VideoAdmin(object):
    list_display = ['title','area','origin','status','savetime','pubtime']
    search_fields = ['title','area','origin','status']
    list_filter = ['area','origin','status','savetime','pubtime']
    actions = [myactions.checkVideo, myactions.pubVideo]
    list_editable = ['status']

class AreaDictAdmin(object):
    list_display = ['area','areaCode']
    search_fields = ['area','areaCode']

xadmin.site.register(xviews.BaseAdminView,BaseSetting)
xadmin.site.register(xviews.CommAdminView,GlobalSettings)
xadmin.site.register(Article,ArticleAdmin)
xadmin.site.register(Book,BookAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(AreaDict,AreaDictAdmin)
