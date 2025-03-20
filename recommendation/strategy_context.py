import random
from recommendation.strategy.base import BaseStrategy
from models.models import *
from recommendation.strategy.collaborative import Collaborative
from recommendation.strategy.top import Top
from recommendation.strategy.favorite import FavoriteStrategy
from recommendation.strategy.history import HistoryStrategy
from recommendation.strategy.new import MaxNewStrategy
import random
from sklearn.utils.validation import check_array


class StrategyContext(BaseStrategy):
    """
    推荐策略入口
    """
    def __init__(self, user):
        self.user = user

    def get_recommended_product_list(self):
        """
        获得所有推荐商品
        """
        # 如果系统已经进行登录
        products = []
        if self.user.is_authenticated:
            # 协同过滤算法 查找购买记录
            strategy = Collaborative(self.user)
            products += strategy.get_recommended_product_list(2)
            # 获得收藏食品推荐
            strategy = FavoriteStrategy(self.user)
            products += strategy.get_recommended_product_list(2)
            # 获得浏览记录的推荐食品
            strategy = HistoryStrategy(self.user)
            products += strategy.get_recommended_product_list(2)
            products = list(set(products))

        # 如果推荐产品小于8 将会使用销售排行榜进行补充
        if len(products) < 8:
            strategy = Top()
            products += strategy.get_recommended_product_list((8 - len(products)))
            # 去重
            products = list(set(products))
        if len(products) < 8:
            strategy = MaxNewStrategy()
            products += strategy.get_recommended_product_list(8)
            products = list(set(products))
        first_8 = products[:8]
        random.shuffle(first_8)
        return first_8

    def get_top_data(self):
        return {
            'top_category_list': Top().get_recommended_category_list(),
            'new_product_list': MaxNewStrategy().get_recommended_product_list(8)
        }
