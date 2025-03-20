from recommendation.strategy.base import *


class Collaborative(BaseStrategy):
    """
    协同过滤算法
    用户的购买记录作为数据集，进行推荐
    """

    def __init__(self, current_user):
        self.current_user = current_user

    def get_similar_user(self, data):
        """
        通过数据，获得相似User
        """
        print("Data before DataFrame:", data)
        df = pd.DataFrame(data)
        print("DataFrame:", df)

        if df.empty:
            print("DataFrame is empty, returning None")
            return None

        # 构建产品矩阵
        user_item_matrix = df.pivot(index='user_id', columns='product_id', values='count').fillna(0)
        user_ids = user_item_matrix.index.tolist()
        user_id_to_index = {key_id: idx for idx, key_id in enumerate(user_ids)}

        # 确保当前用户在数据集中
        if self.current_user.id not in user_id_to_index:
            print(f"当前用户 {self.current_user.id} 不在数据集中")
            return None

        # 计算相似度
        similarity_matrix = cosine_similarity(user_item_matrix)

        # 处理只有一个用户的情况
        if len(user_ids) < 2:
            return None

        # 获取当前用户索引
        current_user_index = user_id_to_index[self.current_user.id]
        current_user_similarities = similarity_matrix[current_user_index]

        # 排除自身相似度（对角线上的1）
        current_user_similarities[current_user_index] = -1

        # 找到最大相似度对应的用户ID
        most_similar_user_index = np.argmax(current_user_similarities)
        most_similar_user_id = user_ids[most_similar_user_index]

        # 如果最相似用户就是自己，则返回 None
        if most_similar_user_id == self.current_user.id:
            return None

        # 返回找到的用户
        return User.objects.filter(id=most_similar_user_id).first()


    def get_product_data(self):
        """
        获得系统已完成订单的食品统计信息
        包括 用户id，购买的食品id，购买数量
        根据以上信息进行相似度计算。
        """
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT 
                    o.user_id,
                    od.product_id,
                    sum(od.quantity) AS count
                FROM `order` o 
                LEFT JOIN `order_detail` od ON od.order_id = o.id
                WHERE o.`status`='已完成'
                GROUP BY o.user_id, od.product_id, od.quantity;
            """)
            results = cursor.fetchall()
            return_data = {
                'user_id': [],
                'product_id': [],
                'count': []
            }
            # 数据清洗
            for result in results:
                return_data['user_id'].append(result[0])
                return_data['product_id'].append(result[1])
                return_data['count'].append(int(result[2]))
            return return_data

    def get_recommended_product_list(self, count: int):
        """
        重写父类方法，获得推荐食品
        @param count 推荐食品数量
        """
        data = Order.objects.filter(user=self.current_user)
        if len(data) == 0:
            return []
        # 获得所有系统订单数据
        product_data = self.get_product_data()
        # 计算相似用户
        print("product_data:", product_data)
        similar_user = self.get_similar_user(product_data)
        if similar_user:
            # 获得相似用户购买的所有订单
            similar_orders = Order.objects.filter(user=similar_user, status="已完成")
            # 获取这些订单中的所有订单详情
            order_details = OrderDetail.objects.filter(order__in=similar_orders)
            # 根据订单详情获得所有食品
            products = [order_detail.product for order_detail in order_details]
            # 去重
            products = list(set(products))
            # 选取两个产品进行推荐
            if len(products) < count:
                # 如果相似用户购买的食品小于两个 直接返回
                return products
            else:
                # 随机选取两个食品进行推荐
                return random.sample(products, count)

        else:
            # 如果没有相似用户则返回空
            return []
