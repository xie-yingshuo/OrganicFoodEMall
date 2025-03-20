from recommendation.strategy.base import *


class HistoryStrategy(BaseStrategy):
    """
    基于浏览记录进行推荐
    按照浏览最多的食品类别进行推荐
    """
    def __init__(self, current_user):
        self.current_user = current_user

    def get_product_data(self):
        """
        获得当前用户的浏览记录食品列表
        """
        with connection.cursor() as cursor:
            cursor.execute(f"""
                            SELECT 
                                sc.id,
                                COUNT(sc.id) AS category_count
                            FROM
                                `history` f
                            LEFT JOIN `product` p ON f.product_id = p.id
                            LEFT JOIN `sub_category` sc ON p.sub_category_id = sc.id
                            WHERE 
                                f.user_id="{self.current_user.id}"
                            GROUP BY sc.id
                            ORDER BY category_count DESC LIMIT 1
                            """)
            results = cursor.fetchall()
            product_list = []
            for result in results:
                product_list += Product.objects.filter(sub_category_id=int(result[0]), status="销售中")
            return product_list

    def get_recommended_product_list(self, count: int):
        """
        获得浏览记录的推荐食品
        """
        product_list = self.get_product_data()
        if len(product_list) < count:
            # 如果相似用户购买的食品小于两个 直接返回
            return product_list
        else:
            # 随机选取两个食品进行推荐
            return random.sample(product_list, count)
