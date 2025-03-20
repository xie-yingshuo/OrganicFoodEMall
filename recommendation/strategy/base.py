from abc import ABC, abstractmethod
from django.db import connection
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import numpy as np
from models.models import *
import random


class BaseStrategy(ABC):
    """
    抽象类
    """

    @abstractmethod
    def get_recommended_product_list(self, count: int):
        pass

    def get_base_data(self, sql):
        """
        通过SQL ，获得相应数据
        """
        with connection.cursor() as cursor:
            cursor.execute(sql)
            results = cursor.fetchall()
            return_data = {
                'key_id': [],
                'category_name': [],
                'count': []
            }
            for result in results:
                return_data['key_id'].append(result[0])
                return_data['category_name'].append(result[1])
                return_data['count'].append(int(result[2]))
            return return_data


