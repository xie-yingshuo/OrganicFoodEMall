import os
import uuid


def upload_to(instance, filename):
    ext = filename.split('.')[-1]  # 获取文件扩展名
    new_filename = f"{uuid.uuid4()}.{ext}"  # 生成新的文件名
    return os.path.join('static/pictures/', new_filename)
