from services.base import *
from models.models import *
import time
from django.utils import timezone


class OrderService(BaseServices):
    def get_order_list_by_user(self):
        """
        获得所有订单数据
        """
        return Order.objects.filter(
            user=self.request.user
        )

    def create_order(self):
        """
        创建一个订单
        """
        return Order.objects.create(
            status='Waiting for delivery',
            user=self.request.user,
            order_id=f'OF{int(time.time() * 1000)}'
        )

    def create_order_detail(self, order, product):
        """
        创建订单详情
        """
        quantity = self.request.POST.get(f'product_quantity_{product.id}')
        if int(quantity) <= 0:
            messages.error(self.request, 'The quantity must be greater than 0')
            raise Exception
        sub_price = product.price * int(quantity)
        return OrderDetail.objects.create(
            order=order,
            product=product,
            sub_total=sub_price,
            price=product.price,
            quantity=quantity

        )

    def get_seller_order_list(self):
        """
        获得所有销售记录
        """
        order_details = OrderDetail.objects.all().prefetch_related('product', 'order')
        order_list = []
        for order_detail in order_details:
            if order_detail.product.created_by_id == self.request.user.id:
                if order_detail.order not in order_list:
                    order_list.append(order_detail.order)
        return order_list

    def update_status(self, order_id, status):
        """
        更新订单状态
        """
        order = Order.objects.get(id=order_id)
        order.status = status
        order.save()
        return order

    def confirm_order(self, order_id):
        """
        确认收货
        """
        try:
            order = self.update_status(order_id, 'Completed')
            order.completed_at = timezone.now()
            order.save()
            messages.error(self.request, 'Confirm receipt successfully')
        except Exception:
            messages.error(self.request, 'Confirmation of receipt failed')

    def refund_order(self, order_id):
        """
        申请退款
        """
        try:
            order = self.update_status(order_id, 'Refunding')
            order.save()
            messages.error(self.request, 'The refund application is successful, waiting for the upgrade merchant to agree')
        except Exception:
            messages.error(self.request, 'Refund request failed')

    def agree_refund_order(self, order_id):
        """
        同意退款
        """
        try:
            order = self.update_status(order_id, 'Refunded')
            order.completed_at = timezone.now()
            order.save()
            messages.error(self.request, '退款成功，已成功返回用户帐户')
        except Exception:
            messages.error(self.request, 'Refund failed')