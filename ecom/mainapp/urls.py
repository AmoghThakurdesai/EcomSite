from django.urls import path
from . import views
from .views import *
from django.views.generic import TemplateView

urlpatterns = [
    path('login/',views.login,name="login"),
    path('signup/',views.signup,name="signup"),
    path('home/',views.raw_sql_query_view, name="home"),
    path('productlist/',views.productlist, name = 'product-list'),
    path('product/<int:pk>/', views.productdetail, name='product-detail'),
    path('customproductlist/',views.customproductlist, name = 'custom-product-list'),
    path('customproduct/<int:id>/', views.customproductdetail, name='custom-product-detail'),
]