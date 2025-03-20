from recommendation.strategy.base import *


class Top(BaseStrategy):

    def get_recommended_category_list(self):
        with connection.cursor() as cursor:
            # 通过SQL语句获得相应数据
            cursor.execute("""
                SELECT
                    sc.id,
                    sc.`name`,
                    SUM(od.quantity) AS total_sold
                FROM
                    `order` o
                JOIN
                    `order_detail` od ON o.id = od.order_id
                JOIN
                    `product` p ON od.product_id = p.id
                JOIN
                    `sub_category` sc ON p.sub_category_id = sc.id
                WHERE
                    o.`status` = '已完成'
                GROUP BY sc.id
                ORDER BY total_sold DESC;
            """)
            results = cursor.fetchall()
            category_list = []
            # 循环获得的数据，获得食品对象列表
            for result in results:
                category_list.append(
                    {
                        'id': result[0],
                        'category_name': result[1],
                        'count': result[2]
                    }
                )
        return category_list

    def get_product_data(self):
        category_list = self.get_recommended_category_list()
        product_list = []
        count = 0
        for category_info in category_list:
            # 只取销售前3的产品类别
            if count > 3:
                break
            product_list += Product.objects.filter(sub_category_id=int(category_info['id']), status="销售中")
            count += 1
        return product_list

    def get_recommended_product_list(self, count: int):
        """
        获得浏览记录的推荐食品
        """
        product_list = self.get_product_data()
        if len(product_list) < count:
            # 如果推荐的食品小于两个 直接返回
            return product_list
        else:
            # 随机选取两个食品进行推荐
            return random.sample(product_list, count)

