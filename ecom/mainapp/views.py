from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.db import connection
from django.contrib.auth.models import User
from .forms import *
from django.contrib.auth.views import LoginView
from django.contrib.auth.views import LogoutView
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from .forms import SignupForm
# Create your views here.

def dbquery(query: str):
    """
    makes query with current db connection
    """
    with connection.cursor() as cursor:
        cursor.execute(query)



class SignupView(CreateView):
    form_class = SignupForm
    template_name = 'signup.html'
    success_url = reverse_lazy('home')

class CustomLoginView(LoginView):
    form_class = LoginForm
    template_name = 'login.html'
    def get_success_url(self) -> str:
        return reverse_lazy('home')
