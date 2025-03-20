from django.urls import path
from . import views

urlpatterns = [
    path('add_product/', views.add_product, name="add_product"),
    path('release_product/', views.release_product, name="release_product"),
    path('product_list/<int:sub_category_id>/', views.show_product_list_by_sub_category, name="product_list"),
    path('search/', views.search_product, name="search"),
    path('product_detail/<int:product_id>/', views.show_product_detail, name="product_detail"),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name="add_to_cart"),
    path('add_to_favorites/<int:product_id>/', views.add_to_favorites, name="add_to_favorites"),
    path('buy_product/', views.buy_product, name="buy_product"),
    path('cart/', views.cart, name="cart"),
    path('clean_cart/', views.clean_cart, name="clean_cart"),
    path('settle_cart/', views.settle_cart, name="settle_cart"),
    path('deliver/<int:order_id>/', views.deliver_order, name="deliver_order"),
    path('confirm_order/<int:order_id>/', views.confirm_order, name="confirm_order"),
    path('remove_product/<int:product_id>/', views.remove_product, name="confirm_order"),
    path('refund/<int:order_id>/', views.refund_order, name="refund_order"),
    path('agree_refund/<int:order_id>/', views.agree_refund_order, name="refund_order"),
    path('show_edit_product/<int:product_id>/', views.show_product_info, name="show_edit_product"),
    path('edit_product/<int:product_id>/', views.edit_product, name="edit_product"),
]