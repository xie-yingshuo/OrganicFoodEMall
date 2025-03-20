from django.shortcuts import render, redirect
from models.models_factory import *
from django.contrib.auth import logout
from services.product import ProductService
from services.user import UserService
from services.order import OrderService


# Create your views here.
def index(request, open_type=None, errors=''):
    """
    登录和注册页面
    """
    context = {
        'role_list': get_role_list(),
        'type': open_type,
        'errors': errors
    }
    return render(request, 'account/login_register.html', context)


def login(request):
    """
    登录功能
    """
    # 登录功能不处理GET
    user_service = UserService(request)
    result = user_service.login()
    if result['status']:
        return redirect('/')
    else:
        return index(request, 'login', result['errors'])


def register(request):
    """
    注册
    """
    user_service = UserService(request)
    result = user_service.register()
    if result['status']:
        return redirect('/')
    else:
        return index(request, 'register', result['errors'])


def login_out(request):
    """
    退出登录
    """
    logout(request)  # 调用Django的logout函数来注销用户
    return redirect('/')  # 重定向到首页或其他页面


def my_info_index(request, errors=None):
    user = request.user
    if user.is_authenticated:
        return render(
            request,
            'account/my_info.html',
            {
                'user': user,
                'errors': errors
            }
        )
    else:
        return redirect('index')  # 重定向到登录页面


def update_user_info(request):
    user_service = UserService(request)
    result = user_service.update_myinfo()
    if result['status']:
        return redirect('my_info')
    else:
        return my_info_index(request, result['errors'])


def change_password(request):
    user_service = UserService(request)
    result = user_service.change_password()
    if result['status']:
        return redirect('my_info')
    else:
        return my_info_index(request, result['errors'])


def save_address(request):
    user_service = UserService(request)
    user_service.save_address()
    return redirect('my_info')


def my_product(request):
    product_service = ProductService(request)
    context = {
        'my_product_items': product_service.get_product_list_by_user()
    }
    return render(request, 'account/my_product.html', context)


def remove_product(request, product_id):
    product_service = ProductService(request)
    product_service.remove_product(product_id)
    return redirect('my_product')


def show_my_order_list(request):
    order_service = OrderService(request)
    context = {
        "order_list": order_service.get_order_list_by_user()
    }
    return render(request, 'account/my_order.html', context)


def my_favorites(request):
    product_service = ProductService(request)
    context = {
        "favorites": product_service.get_favorites_product()
    }
    return render(request, 'account/my_favorite.html', context)


def delete_favorites(request, product_id):
    product_service = ProductService(request)
    product_service.delete_favorite(product_id)
    return redirect('my_favorite')


def my_history(request):
    user = request.user
    user_service = UserService(request)
    context = {
        "history_list": user_service.get_history_list()
    }
    return render(request, 'account/my_history.html', context)


def delete_history(request, history_id):
    user_service = UserService(request)
    user_service.delete_history(history_id)
    return redirect('my_history')


def seller_order(request):
    order_service = OrderService(request)
    context = {
        'order_list': order_service.get_seller_order_list()
    }
    return render(request, 'account/seller_order.html', context)
