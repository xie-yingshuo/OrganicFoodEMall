from django import forms
from django.core.exceptions import ValidationError


class BaseForm(forms.Form):
    # 校验密码的一致性
    def clean_confirm_password(self):
        confirm_password = self.cleaned_data['confirm_password']
        password = self.cleaned_data.get('password', '')
        if confirm_password != password:
            raise ValidationError('两次输入的密码不一致')