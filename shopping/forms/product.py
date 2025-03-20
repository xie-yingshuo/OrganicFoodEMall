from django import forms


class ProductForm(forms.Form):
    product_name = forms.CharField(
        max_length=25,
        label='名称',
        required=True,
        error_messages={"required": "产品名称不能为空"}
    )
    short_description = forms.CharField(
        max_length=255,
        label='商品简介',
        required=True,
        error_messages={"required": "产品简介不能为空"}
    )
    description = forms.CharField(
        max_length=255,
        label='商品简介',
        required=True,
        error_messages={"required": "产品详情不能为空"}
    )
    category = forms.CharField(
        max_length=255,
        label='产品分类',
        required=True,
        error_messages={"required": "产品分类不能为空"}
    )
    sub_category = forms.CharField(
        max_length=255,
        label='产品子分类',
        required=True,
        error_messages={"required": "产品子分类不能为空"}
    )
    image = forms.ImageField(
        label='产品图片',
        required=False,  # 如果图片是可选的，可以设置为 False
        error_messages={
            "invalid_image": "请上传有效的图片文件",
        }
    )
    suppler = forms.CharField(
        max_length=255,
        label='供应商',
        required=True,
        error_messages={"required": "供应商不能为空"}
    )
    origin = forms.CharField(
        max_length=255,
        label='产地信息',
        required=True,
        error_messages={"required": "产地信息不能为空"}
    )
    price = forms.IntegerField(
        label='价格',
        required=True,
        error_messages={"required": "价格不能为空"}
    )

