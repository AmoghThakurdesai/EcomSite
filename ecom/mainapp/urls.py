from django.urls import path
from . import views
from .views import *
from django.views.generic import TemplateView

urlpatterns = [
    path('login/',LoginView.as_view(),name="login"),
    path('signup/',SignupView.as_view(),name="signup"),
    path('home/',views.raw_sql_query_view, name="home"),
    path('productlist/',ProductListView.as_view(), name = 'product-list'),
    path('product/<int:pk>/', ProductDetailView.as_view(), name='product-detail'),
    path('customproductlist/',CustomProductListView.as_view(), name = 'custom-product-list'),
    path('customproduct/<int:id>/', CustomProductDetailView.as_view(), name='custom-product-detail'),
]