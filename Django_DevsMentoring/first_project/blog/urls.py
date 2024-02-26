"""
URL configuration for first_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from .views import ArticleListView, ArticleDetailView, ArticleCreateView, ArticleUpdateView, ArticleDeleteView

app_name = 'blog'

urlpatterns = [
    path("", ArticleListView.as_view(), name='blog_home'),
    path("about/", views.about, name='blog_about'),
    path("article/<int:pk>", ArticleDetailView.as_view(), name='article-detail'),
    path("article/new/", ArticleCreateView.as_view(), name='article-create'),
    path("article/update/<int:pk>", ArticleUpdateView.as_view(), name='article-update'),
    path("article/delete/<int:pk>", ArticleDeleteView.as_view(), name='article-delete'),
]