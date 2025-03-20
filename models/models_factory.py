from .models import *


def get_user_list():
    user_list = []
    counter = 1
    users = UserInfo.objects.all()
    for user_info in users:
        if user_info.user.is_staff == 0:
            user_list.append({
                "counter": counter,
                "user_info": user_info
            })
            counter += 1
    return user_list


def get_category_list():
    return Category.objects.all()


def get_category_data_list():
    """
    获得所有category
    """
    # 获得所有数据
    categories = Category.objects.all()
    category_data = []
    # 重新构建数据结构
    counter = 1
    for category in categories:
        # 根据外键 获得所有关联数据
        subcategories = category.subcategory_set.all()
        # 重新构建
        for sub_category in subcategories:
            category_data.append({
                'counter': counter,
                'category': category,
                'sub_category': sub_category
            })
            # 计数器
            counter += 1

    # 但会一个字典
    return {
        'categories': category_data,
    }


def get_role_list():
    roles = Role.objects.all()
    role_list = []
    for role in roles:
        if role.name != 'Administrator':
            role_list.append(role)
    return role_list
