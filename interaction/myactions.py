from xadmin.plugins.actions import BaseActionView

class pubAction(BaseActionView):
    action_name = "pubShare"
    description = "发布分享"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 2)

class checkShare(BaseActionView):
    action_name = "checkShare"
    description = "通过审核"
    model_perm = 'change'

    def do_action(self, queryset):
        return queryset.update(status = 1)