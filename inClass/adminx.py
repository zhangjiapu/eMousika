import xadmin
from .models import Material,TestPaper,Question,Choice

class MaterialAdmin(object):
    list_display = ['topic','slice','upload_date']
    list_filter = ['topic','upload_date']
    search_fields = ['topic']

class TestPaperAdmin(object):
    list_display = ['name','number','status','questions','create_time']
    list_filter = ['name','number','status']
    search_fields = ['name']
    show_detail_fields = ['questions']
    list_editable = ['status']

class ChoiceInline(object):
    model = Choice
    extra = 4

class QuestionAdmin(object):
    list_display = ['questionText','answer']
    inlines = [ChoiceInline,]


xadmin.site.register(Material,MaterialAdmin)
xadmin.site.register(TestPaper,TestPaperAdmin)
xadmin.site.register(Question,QuestionAdmin)