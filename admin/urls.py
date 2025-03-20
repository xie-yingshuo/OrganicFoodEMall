from django.urls import path
from . import views


urlpatterns = [
    path('food_category/', views.food_category, name="food_category"),
    path('user_category/', views.user_category, name="user_category"),
    path('add_food_category/', views.add_category, name='add_food_category'),
    path('delete_food_category/<int:category_id>/', views.delete_category, name="delete_food_category"),
    path('delete_user/<int:user_id>/', views.delete_user, name="delete_user"),
    path('show_approve_product/', views.show_approval_product, name="show_approval_product"),
    path('approval_product/<int:product_id>/', views.approval_product, name="approval_product"),
    path('manage_product/', views.show_manage_product, name="show_manage_product"),
    path('remove_product/<int:product_id>/', views.remove_product, name="remove_product"),
    path('edit_product/<int:product_id>/', views.edit_product, name="edit_product"),
]
