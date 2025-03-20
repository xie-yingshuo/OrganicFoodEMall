from recommendation.strategy.base import *


class MaxNewStrategy(BaseStrategy):
    """
    基于最新发布排行榜的推荐
    用于冷启动问题
    """
    def get_recommended_product_list(self, count: int):
        """
        获得所有最新发布的产品
        """
        with connection.cursor() as cursor:
            # 通过SQL语句获得相应数据
            cursor.execute("""
                    SELECT 
                        p.id,
                        p.`name`,
                        p.sub_category_id
                    FROM
                        `product` p
                    WHERE 
                        p.status = "销售中"
                    ORDER BY  
                        p.created_at DESC
                    LIMIT 8;
            """)
            results = cursor.fetchall()
            product_list = []
            # 循环获得的数据，获得食品对象列表
            for result in results:
                product_list.append(
                    Product.objects.get(id=int(result[0]))
                )
        return product_list
