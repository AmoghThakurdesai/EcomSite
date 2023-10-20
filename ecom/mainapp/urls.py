from django.urls import path
from . import views
from .views import *
from django.views.generic import TemplateView

urlpatterns = [
    path('login/',LoginView.as_view(),name="login"),
    path('signup/',SignupView.as_view(),name="signup"),
    path('home/',TemplateView.as_view(template_name = "home.html"),name="home")
]