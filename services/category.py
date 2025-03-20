from services.base import *


class CategoryService(BaseServices):
    def add_category(self):
        """
        增加一个category
        """
        try:
            # 获得前端数据
            category_name = self.request.POST.get('category_name')
            subcategory_name = self.request.POST.get('sub_category_name')
            # 尝试获取或创建 Category
            category, created = Category.objects.get_or_create(name=category_name)
            # 创建 SubCategory
            SubCategory.objects.create(category_id=category.id, name=subcategory_name)
            messages.error(self.request, 'Added successfully')
        except Exception:
            messages.error(self.request, 'Add failed')

    def delete_category(self, category_id):
        """
        删除一个category
        """
        # 检查是否存在
        try:
            sub_category = get_object_or_404(SubCategory, id=category_id)
            # 删除操作
            sub_category.delete()
            messages.error(self.request, 'Deleted successfully')
        except Exception:
            messages.error(self.request, 'Deletion failed')