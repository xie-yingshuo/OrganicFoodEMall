from .base_form import *


class RegisterForm(BaseForm):
    username = forms.CharField(
        max_length=25,
        label='用户名',
        required=True,
        error_messages={
            "required": "用户名不能为空",
            "max_length": "用户名不能超过25个字符"
        }
    )
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

    email = forms.EmailField(
        max_length=254,
        label='邮箱',
        required=True,
        error_messages={
            "required": "邮箱不能为空",
            "invalid": "请输入有效的邮箱地址"}
    )
    phone_num = forms.CharField(max_length=15, required=False)
    role = forms.IntegerField(required=True)

    def clean_confirm_password(self):
        confirm_password = self.cleaned_data['confirm_password']
        password = self.cleaned_data.get('password', '')
        if confirm_password != password:
            raise ValidationError('两次输入的密码不一致')



