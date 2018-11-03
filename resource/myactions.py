from xadmin.plugins.actions import BaseActionView

class checkArticle(BaseActionView):
    action_name = "checkRes"
    description = "文章通过审核"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 1)

class pubArticle(BaseActionView):
    action_name = "pubRes"
    description = "发布文章"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 2)

class checkVideo(BaseActionView):
    action_name = "checkRes"
    description = "视频通过审核"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 1)

class pubVideo(BaseActionView):
    action_name = "pubRes"
    description = "发布视频"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 2)

class checkBook(BaseActionView):
    action_name = "checkRes"
    description = "书籍通过审核"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 1)

class pubBook(BaseActionView):
    action_name = "pubRes"
    description = "发布书籍"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 2)