from services.base import *
from account.forms.login import LoginForm
from account.forms.register import RegisterForm
from account.forms.myinfo import MyInfoForm
from account.forms.change_password import ChangePassword
from django.contrib.auth import get_user_model


class UserService(BaseServices):
    def __init__(self, request):
        super().__init__(request)
        self.user = request.user

    def login(self):
        """
        登录
        """
        login_form = LoginForm(self.request)
        if login_form.is_valid():
            return {'status': True}
        else:
            return {'status': False, 'errors': login_form.errors}

    def register(self):
        """
        注册
        """
        register_form = RegisterForm(self.request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data["username"]
            password = register_form.cleaned_data["password"]
            email = register_form.cleaned_data['email']
            User = get_user_model()
            user = User.objects.create_user(username=username, password=password, email=email)
            phone_num = register_form.cleaned_data['phone_num']
            role_id = register_form.cleaned_data['role']
            UserInfo.objects.create(user_id=user.id, phone_num=phone_num, role_id=role_id)
            return self.login()
        else:
            return {'status': False, 'errors': register_form.errors}

    def update_myinfo(self):
        """
        更新用户信息
        """
        myinfo_form = MyInfoForm(self.request.POST)
        if myinfo_form.is_valid():
            name = myinfo_form.cleaned_data['name']
            phone = myinfo_form.cleaned_data['phone_num']
            email = myinfo_form.cleaned_data['email']
            self.user.email = email
            self.user.save()

            user_info = self.user.userinfo_set.first()
            if user_info:
                user_info.name = name
                user_info.phone_num = phone
                user_info.save()
            else:
                if self.user.is_staff:
                    role = Role.objects.get(name="管理员")
                    UserInfo.objects.create(user=self.user, name=name, phone_num=phone, role=role)
            return {'status': True}
        else:
            return {'status': False, 'errors': myinfo_form.errors}

    def change_password(self):
        """
        更改密码
        """
        password_form = ChangePassword(self.request.POST)
        if password_form.is_valid():
            user = self.request.user
            user.set_password(password_form.cleaned_data['password'])
            user.save()
            return {'status': True}
        else:
            return {'status': False, 'errors': password_form.errors}

    def save_address(self):
        """
        保存收货地址
        """
        user_info = UserInfo.objects.get(user=self.request.user)
        user_info.address = self.request.POST.get("address")
        user_info.save()

    def delete_user(self, user_id):
        """
        删除用户
        """
        try:
            user = get_object_or_404(User, id=user_id)
            user.delete()
            messages.success(self.request, '删除用户成功')
        except Exception:
            messages.error(self.request, '删除用户失败')

    def get_history_list(self):
        """
        获得用户所有浏览记录
        """
        return History.objects.filter(
            user=self.request.user
        ).prefetch_related('product')

    def delete_history(self, history_id):
        """
        删除用户指定记录
        """
        try:
            history = History.objects.get(id=history_id)
            history.delete()
            messages.success(self.request, 'Delete record successfully')
        except Exception:
            messages.error(self.request, 'Failed to delete record')