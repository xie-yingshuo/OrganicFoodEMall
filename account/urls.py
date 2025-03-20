from django.urls import path
from . import views


urlpatterns = [
    path('index/', views.index, name='index'),
    path('login/', views.login, name="login"),
    path('register/', views.register, name="register"),
    path('logout/', views.login_out, name="logout"),
    path('my_info/', views.my_info_index, name="my_info"),
    path('update_user_info/', views.update_user_info, name="update_user_info"),
    path('change_password/', views.change_password, name="change_password"),
    path('save_address/', views.save_address, name="save_address"),
    path('my_product/', views.my_product, name="my_product"),
    path('remove_product/<int:product_id>/', views.remove_product, name="remove_product"),
    path('my_order/', views.show_my_order_list, name="my_order"),
    path('my_favorite/', views.my_favorites, name="my_favorite"),
    path('delete_favorite/<int:product_id>/', views.delete_favorites, name="delete_favorate"),
    path('my_history/', views.my_history, name="my_history"),
    path('delete_history/<int:history_id>/', views.delete_history, name="delete_history"),
    path('seller_order/', views.seller_order, name="seller_order")
]