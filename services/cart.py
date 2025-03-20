from services.base import *
from services.order import OrderService
from models.models import *


class CartService(BaseServices):
    def get_cart_product(self):
        """
        获得所有购物车产品
        """
        carts = Cart.objects.filter(
            user=self.request.user
        ).prefetch_related('product')
        item_list = []
        counter = 0
        total_price = 0
        for item in carts:
            sub_price = int(item.product.price)*int(item.quantity)
            item_list.append({
                'sub_price': sub_price,
                'product': item.product,
                'counter': counter,
                'quantity': item.quantity
            })
            counter += 1
            total_price += sub_price
        return item_list, total_price

    def clean_cart(self):
        """
        清空购物车
        """
        try:
            cart_item_list = Cart.objects.filter(
                user=self.request.user
            )
            for cart_item in cart_item_list:
                cart_item.delete()
            messages.success(self.request, 'Cleared successfully')
        except Exception:
            messages.success(self.request, 'Clear failed')

    def remove_product(self, product_id):
        """
        将商品从购物车中删除
        """
        try:
            cart_item_list = Cart.objects.filter(
                user=self.request.user,
                product_id=product_id
            )
            for cart_item in cart_item_list:
                cart_item.delete()
            messages.success(self.request, '删除成功')
        except Exception:
            messages.error(self.request, '删除失败')

    def settle(self):
        """
        购物车结算
        """
        cart_item_list = Cart.objects.filter(
            user=self.request.user
        ).prefetch_related('product')
        if len(cart_item_list) == 0:
            messages.error(self.request, 'The shopping cart is empty, please add items')
            return None
        try:
            user_id_list = set(cart_item.product.created_by for cart_item in cart_item_list)
            order_service = OrderService(self.request)
            for user_id in user_id_list:
                # 创建订单
                order = order_service.create_order()
                # 获得当前userid的所有产品
                cart_item_user_list = []
                for cart_item in cart_item_list:
                    if cart_item.product.created_by == user_id:
                        cart_item_user_list.append(cart_item)

                # 插入 order_detail
                total_price = 0
                for cart_item_user in cart_item_user_list:
                    order_detail = order_service.create_order_detail(order, cart_item_user.product)
                    total_price += order_detail.sub_total
                order.total_price = total_price
                order.save()
            self.clean_cart()
            messages.error(self.request, '支付成功')
        except Exception:
            messages.error(self.request, 'There were some problems during payment and the payment failed.')
