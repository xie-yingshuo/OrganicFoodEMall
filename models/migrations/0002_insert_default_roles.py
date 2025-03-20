# Generated by Django 5.1.2 on 2024-11-29 06:49

from django.db import migrations


def insert_default_roles(apps, schema_editor):
    role = apps.get_model('models', 'Role')

    # 定义默认角色
    default_roles = ['商家', '用户', '管理员']

    # 插入默认角色
    for role_name in default_roles:
        if not role.objects.filter(name=role_name).exists():
            role.objects.create(name=role_name)


class Migration(migrations.Migration):

    dependencies = [
        ('models', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(insert_default_roles),
    ]