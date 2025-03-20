from django.shortcuts import render, redirect
from services.product import ProductService
from services.cart import CartService
from services.order import OrderService
from recommendation.strategy_context import StrategyContext


# Create your views here.
def add_product(request):
    return render(request, 'shopping/release_product.html')


def release_product(request):
    service = ProductService(request)
    result = service.release()
    if result['status']:
        return redirect('/account/my_product/')
    else:
        return render(request, 'shopping/release_product.html')


def show_product_list_by_sub_category(request, sub_category_id):
    service = ProductService(request)
    context = StrategyContext(request.user).get_top_data()
    context['product_list'] = service.get_product_list_by_subcategory(sub_category_id)
    return render(request, 'shopping/product_list.html', context)


def search_product(request):
    service = ProductService(request)
    context = StrategyContext(request.user).get_top_data()
    context['product_list'] = service.search_product_by_name()
    return render(request, 'shopping/product_list.html', context)


def show_product_detail(request, product_id):
    item_list = ProductService(request).access_product(product_id)
    context = {
        'product': item_list[0]['product'],
        'item_list': item_list,
        'total_price': item_list[0]['sub_price']
    }

    return render(request, 'shopping/product_detail.html', context)


def add_to_cart(request, product_id):
    if request.user.is_authenticated:
        service = ProductService(request)
        service.add_to_cart(product_id)
        return redirect(f'/shopping/cart/')
    else:
        return redirect('/account/index/')


def add_to_favorites(request, product_id):
    if request.user.is_authenticated:
        service = ProductService(request)
        service.add_to_favorites(product_id)
        return redirect('/account/my_favorite/')
    else:
        return redirect('/account/index/')


def buy_product(request):
    if request.user.is_authenticated:
        product_id = request.POST.get('product_id')
        service = ProductService(request)
        service.buy(product_id)
        return redirect('/account/my_order/')
    else:
        return redirect('/account/index/')


def cart(request):
    if request.user.is_authenticated:
        cart_service = CartService(request)
        item_list, total_price = cart_service.get_cart_product()
        context = {
            'item_list': item_list,
            'total_price': total_price
        }
        return render(request, 'shopping/cart.html', context)
    else:
        return redirect('/account/index/')


def clean_cart(request):
    cart_service = CartService(request)
    cart_service.clean_cart()
    return redirect('cart')


def remove_product(request, product_id):
    cart_service = CartService(request)
    cart_service.remove_product(product_id)
    return redirect('cart')


def settle_cart(request):
    cart_service = CartService(request)
    cart_service.settle()
    return redirect('cart')


def deliver_order(request, order_id):
    order_service = OrderService(request)
    order_service.update_status(order_id, 'Shipped')
    return redirect('/account/seller_order/')


def agree_refund_order(request, order_id):
    order_service = OrderService(request)
    order_service.agree_refund_order(order_id)
    return redirect('/account/seller_order/')


def confirm_order(request, order_id):
    order_service = OrderService(request)
    order_service.confirm_order(order_id)
    return redirect('/account/my_order/')


def refund_order(request, order_id):
    order_service = OrderService(request)
    order_service.refund_order(order_id)
    return redirect('/account/my_order/')


def show_product_info(request, product_id):
    product_info = ProductService(request).access_product(product_id)
    return render(request, 'shopping/edit_product.html', {'product': product_info[0]['product']})


def edit_product(request, product_id):
    product_service = ProductService(request)
    product_service.edit_product(product_id)
    return redirect('/account/my_product/')
