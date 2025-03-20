from models.models_factory import *


def global_context(request):
    return {
        'category_list': get_category_list()
    }


