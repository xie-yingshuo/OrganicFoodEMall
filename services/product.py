from services.base import *
from shopping.forms.product import ProductForm
from services.order import OrderService


class ProductService(BaseServices):
    """
    处理商品相关业务
    """
    def get_product_list_by_user(self):
        """
        获得当前user的发布的所有商品
        """
        product_list = Product.objects.filter(created_by=self.request.user).prefetch_related('sub_category__category')
        counter = 1
        return_list = []
        for product in product_list:
            return_list.append({
                "counter": counter,
                "product": product
            })
            counter += 1
        return return_list

    def remove_product(self, product_id):
        """
        删除商品，软删除
        @params product_id: 商品id
        """
        product = Product.objects.get(id=product_id)
        if product:
            product.status = "Removed"
            product.save()
            messages.error(self.request, 'Product removed successfully')
        else:
            messages.error(self.request, 'Product does not exist')

    def get_product_list_by_subcategory(self, sub_category_id):
        """
        获得指定类别的所有商品
        @params: sub_category_id: 商品分类id
        """
        return Product.objects.filter(
            sub_category_id=sub_category_id,
            status="OnSale"
        ).prefetch_related('sub_category__category')

    def get_product_list_in_sell(self):
        """
        获得所有销售中的商品
        """
        return Product.objects.filter(
            status="OnSale"
        ).prefetch_related('sub_category__category')

    def release(self):
        """
        商家发布商品
        """
        product_form = ProductForm(self.request.POST, self.request.FILES)
        if product_form.is_valid():
            sub_category = SubCategory.objects.get(id=product_form.cleaned_data['sub_category'])
            Product.objects.create(
                name=product_form.cleaned_data['product_name'],
                short_description=product_form.cleaned_data['short_description'],
                description=product_form.cleaned_data['description'],
                supplier=product_form.cleaned_data['suppler'],
                price=product_form.cleaned_data['price'],
                origin=product_form.cleaned_data['origin'],
                sub_category=sub_category,
                created_by=self.request.user,
                image=product_form.cleaned_data['image']
            )
            return {'status': True}
        else:
            return {'status': False, 'errors': product_form.errors}

    def search_product_by_name(self):
        """
        搜索商品
        """
        query = self.request.POST.get('search_product')
        products = Product.objects.all()
        products = products.filter(name__icontains=query, status="OnSale")
        return products

    def access_product(self, product_id):
        """
        进入商品详细页面
        """
        product = Product.objects.get(id=product_id)
        if self.request.user.is_authenticated:
            History.objects.create(
                product=product,
                user=self.request.user
            )
        return [{
            'sub_price': product.price,
            'product': product,
            'counter': 1,
            'quantity': 2
        }]

    def add_to_cart(self, product_id):
        """
        将商品添加到购物车中
        @params product_id: 商品id
        """
        try:
            product_list = Cart.objects.filter(
                user=self.request.user,
                product_id=product_id
            )
            if len(product_list)>0:
                messages.success(self.request, 'The item already exists in the shopping cart. Please do not add it again.')
                return None
            quantity = self.request.POST.get(f'product_quantity_{product_id}')
            if quantity:
                int(quantity)
            else:
                quantity = 1

            Cart.objects.create(
                user=self.request.user,
                product_id=product_id,
                quantity=quantity
            )
            messages.success(self.request, 'Added successfully')
        except Exception:
            messages.error(self.request, 'Failed to add to cart')

    def add_to_favorites(self, product_id):
        """
        收藏商品
        @params product_id: 商品id
        """
        try:
            favorite_list = Favorite.objects.filter(
                product_id=product_id,
                user=self.request.user
            )
            if len(favorite_list) > 0:
                messages.success(self.request, 'This product has been collected. Please do not collect it again.')
                return None

            Favorite.objects.create(
                product_id=product_id,
                user=self.request.user
            )
            messages.error(self.request, 'Successfully collected')
        except Exception:
            messages.error(self.request, 'Collection failed')

    def buy(self, product_id):
        """
        购买商品
        @params product_id: 商品id
        """
        try:
            order_service = OrderService(self.request)
            order = order_service.create_order()
            product = Product.objects.get(id=product_id)
            order_detail = order_service.create_order_detail(order, product)
            order.total_price = order_detail.sub_total
            order.save()
            messages.error(self.request, 'Purchase Success')
        except Exception:
            messages.error(self.request, 'Purchase failed')

    def get_favorites_product(self):
        """
        获得所有收藏商品
        """
        return Favorite.objects.filter(
            user=self.request.user
        ).prefetch_related('product')

    def delete_favorite(self, product_id):
        """
        从收藏列表里删除商品
        @params product_id: 商品id
        """
        favorite = Favorite.objects.get(product_id=product_id, user=self.request.user)
        favorite.delete()

    def edit_product(self, product_id):
        """
        更新商品
        """
        product_form = ProductForm(self.request.POST, self.request.FILES)
        if product_form.is_valid():
            product = Product.objects.get(id=product_id)
            product.name = product_form.cleaned_data['product_name']
            product.short_description = product_form.cleaned_data['short_description']
            product.description = product_form.cleaned_data['description']
            product.supplier = product_form.cleaned_data['suppler']
            product.price = product_form.cleaned_data['price']
            product.origin = product_form.cleaned_data['origin']
            product.sub_category_id = product_form.cleaned_data['sub_category']
            product.created_by_id = self.request.user.id
            product.image = product_form.cleaned_data['image']
            product.save()
            return {'status': True}
        else:
            print(product_form.errors)
            return {'status': False, 'errors': product_form.errors}

    def get_approval_products(self):
        """
        获得所有待审核商品
        """
        products = Product.objects.filter(
            status="Awaiting review"
        )
        return products

    def approval_product(self, product_id):
        """
        审核通过商品
        """
        product = Product.objects.get(id=product_id)
        product.status = 'OnSale'
        product.save()
