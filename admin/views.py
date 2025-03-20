from services.category import CategoryService
from services.user import UserService
from services.product import ProductService
from django.contrib import messages
from django.shortcuts import render, redirect
from models.models_factory import *


# Create your views here.
def food_category(request):
    category_list = get_category_data_list()
    # 获取所有消息
    category_list['all_messages'] = messages.get_messages(request)
    return render(request, 'admin/food_category.html', category_list)


def user_category(request):
    return render(
        request,
        'admin/user_category.html',
        {
            'user_list': get_user_list(),
            'all_messages': messages.get_messages(request)
        })


def add_category(request):
    """
    增加一个category
    """
    category_service = CategoryService(request)
    try:
        category_service.add_category()
        messages.success(request, 'Increased success')
    except Exception as e:
        messages.error(request, 'Increase failure')
    return redirect("food_category")


def delete_category(request, category_id):
    """
    删除一个category
    """
    category_service = CategoryService(request)
    try:
        category_service.delete_category(category_id)
        messages.success(request, 'Deleted successfully')
    except Exception:
        messages.error(request, 'Deletion failed')
    return redirect("food_category")


def delete_user(request, user_id):
    service = UserService(request)
    try:
        service.delete_user(user_id)
        messages.success(request, 'Deleted successfully')
    except Exception:
        messages.error(request, 'Deletion failed')
    return redirect("food_category")


def show_approval_product(request):
    service = ProductService(request)
    return render(request, 'admin/approval_product.html', {
        'product_list': service.get_approval_products()
    })


def approval_product(request, product_id):
    try:
        service = ProductService(request)
        service.approval_product(product_id)
        messages.success(request, 'Successful audit')
    except Exception:
        messages.error(request, 'Audit failed')
    return redirect('/admin/show_approve_product/')


def show_manage_product(request):
    service = ProductService(request)
    return render(request, 'admin/manage_product.html', {
        'product_list': service.get_product_list_in_sell()
    })


def remove_product(request, product_id):
    product_service = ProductService(request)
    product_service.remove_product(product_id)
    return redirect('/admin/manage_product/')


def edit_product(request, product_id):
    product_service = ProductService(request)
    product_service.edit_product(product_id)
    return redirect('/admin/manage_product/')
