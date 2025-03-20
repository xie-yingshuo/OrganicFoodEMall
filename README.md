# 有机食品电商平台 (OrganicFood)

这是一个基于Django的有机食品电商平台，提供商品浏览、购物车、推荐系统等功能。

## 项目技术栈

- Python 3.x
- Django 4.x
- SQLite数据库（开发环境）
- 前端：HTML, CSS, JavaScript

## 依赖安装

项目依赖包括：

```
Django>=4.2,<5.0
pillow==9.5.0
pandas==2.0.3
scipy==1.10.1
scikit-learn==1.2.2
```

使用以下命令安装依赖：

```bash
pip install -r required_package.txt
```

## 数据库配置

项目使用SQLite数据库，不需要额外配置。初始化数据库：

```bash
python manage.py migrate
```

## 运行项目

1. 确保已完成上述依赖安装和数据库配置
2. 执行以下命令运行开发服务器：

```bash
python3.9 manage.py runserver
```

3. 在浏览器中访问 http://127.0.0.1:8000

## 项目功能

- 用户账户管理
- 商品浏览和搜索
- 购物车功能
- 个性化推荐系统
- 后台管理系统

## 项目目录结构

- `account/` - 用户账户相关功能
- `admin/` - 管理后台功能
- `models/` - 数据模型
- `recommendation/` - 推荐系统
- `shopping/` - 购物相关功能
- `static/` - 静态文件
- `templates/` - 模板文件 
