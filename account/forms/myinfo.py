from .base_form import *


class MyInfoForm(BaseForm):
    name = forms.CharField(
        max_length=25,
        label='昵称'
    )
    email = forms.EmailField(
        max_length=254,
        label='邮箱',
        required=True,
        error_messages={
            "required": "邮箱不能为空",
            "invalid": "请输入有效的邮箱地址"}
    )
    phone_num = forms.CharField(max_length=15, required=False)


