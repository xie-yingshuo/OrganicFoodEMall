from .base_form import *


class ChangePassword(BaseForm):

    password = forms.CharField(
        widget=forms.PasswordInput(),
        label='密码',
        required=True,
        error_messages={"required": "密码不能为空"}
    )

    confirm_password = forms.CharField(
        widget=forms.PasswordInput(),
        label='重复密码',
        required=True,
        error_messages={"required": "确认密码不能为空"},
    )

