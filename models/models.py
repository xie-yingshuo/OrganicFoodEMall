from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from common import upload_to


class Category(models.Model):
    # 分类名称
    name = models.CharField(max_length=50, default='')
    # 创建时间
    view_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'category'


class SubCategory(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, default=1)
    # 子分类名
    name = models.CharField(max_length=50, default='')
    # 创建时间
    view_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'sub_category'


class Role(models.Model):
    # 权限名称
    name = models.CharField(max_length=50)

    class Meta:
        db_table = 'role'


class UserInfo(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='Nick name')
    role = models.ForeignKey(Role, on_delete=models.CASCADE)
    phone_num = models.CharField(max_length=11, verbose_name='Phone number', help_text='Mobile number is required')
    address = models.TextField(verbose_name="Address")
    avatar_url = models.CharField(max_length=500, blank=True, verbose_name="Avatar image URL")

    class Meta:
        db_table = 'user_info'


class Product(models.Model):

    # 产品名称
    name = models.CharField(max_length=100, default='')
    # 商品简介
    short_description = models.CharField(max_length=255, default='')
    # 产品描述
    description = models.CharField(max_length=255, default='')
    # 供应商
    supplier = models.CharField(max_length=255, default='')
    # 单价
    price = models.IntegerField(default=0)
    # 图片
    image = models.ImageField(upload_to=upload_to, default='pictures/default.jpg')
    # 产地信息
    origin = models.CharField(max_length=255, default='')
    # 创建时间
    created_at = models.DateTimeField(default=timezone.now)
    # 更新时间
    added_at = models.DateTimeField(default=timezone.now)
    # 产品子分类
    sub_category = models.ForeignKey(SubCategory, on_delete=models.CASCADE)
    # 商家Id
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    # 商品状态
    status = models.CharField(max_length=255, default='Awaiting review')
    # 其他信息
    other_description = models.CharField(max_length=255, default='')

    class Meta:
        db_table = 'product'


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0)
    added_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'cart'


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total_price = models.IntegerField(default=0)
    status = models.CharField(max_length=50, default='')
    created_at = models.DateTimeField(default=timezone.now)
    added_at = models.DateTimeField(default=timezone.now)
    order_id = models.CharField(max_length=255, default='')
    completed_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'order'


class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0)
    price = models.IntegerField(default=0)
    sub_total = models.IntegerField(default=0)

    class Meta:
        db_table = 'order_detail'


class Favorite(models.Model):
    # 记录用户Id
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    # 记录产品Id
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    # 收藏时间
    view_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'favorite'


class History(models.Model):
    # 记录用户Id
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    # 记录商品Id
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    # 记录时间
    view_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'history'
