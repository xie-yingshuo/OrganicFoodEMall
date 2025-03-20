from django import forms
from django.contrib.auth import authenticate, login
from django.contrib.auth import get_user_model


class LoginForm(forms.Form):
    username = forms.CharField(max_length=25, label='用户名', required=True,
                               error_messages={"required": "用户名不能为空",
                                               "max_length": "用户名不能超过25个字符"})
    password = forms.CharField(widget=forms.PasswordInput(), label='密码', required=True,
                               error_messages={"required": "密码不能为空"})

    def __init__(self, request, **kwargs):
        super().__init__(request.POST, **kwargs)
        self.request = request

    def clean_username(self):
        username = self.cleaned_data['username']
        exists = get_user_model().objects.filter(username=username).exists()
        if not exists:
            raise forms.ValidationError('用户名不存在，请重新输入')
        return username

    def clean_password(self):
        password = self.cleaned_data['password']
        username = self.cleaned_data.get('username', '')
        user = authenticate(username=username, password=password)
        if user is None:
            raise forms.ValidationError('用户名或密码不正确')
        else:
            login(request=self.request, user=user)
        return password

    def login(self):
        pass
