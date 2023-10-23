from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views.generic import ListView
from django.db import connection
import django.db as db
from django.contrib.auth.models import User
from .forms import *
from django.contrib.auth.views import LoginView
from django.contrib.auth.views import LogoutView
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from .forms import SignupForm,RawSQLForm
from django.contrib import messages
import sys
from .models import Product
# Create your views here.

def dbquery(query: str):
    """
    makes query with current db connection
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()
    except db.OperationalError as e:
        print(str(e))
        return str(e);
        
    except db.Error as e:
        
        print(str(e))
        return e
    except:
        print("Unexpected Error:",sys.exc_info()[0])


class SignupView(CreateView):
    form_class = SignupForm
    template_name = 'signup.html'
    success_url = reverse_lazy('home')

class CustomLoginView(LoginView):
    form_class = LoginForm
    template_name = 'login.html'
    def get_success_url(self) -> str:
        return reverse_lazy('home')

def raw_sql_query_view(request):
    # had an error here when rawsqlform had param as request only, it required param as request.POST
    form = RawSQLForm(request.POST) 
    acknowledgement=""
    if request.method == 'POST':
        if form.is_valid():
            query = form.cleaned_data["query"]
            acknowledgement = f"Query received. Query is {query}"
            messages.success(request, "Query added successfully.")
            messages.success(request,str(dbquery(query)))
        else:
            messages.error(request, "Form not valid")
    else:
        form = RawSQLForm()
        messages.info(request,"No query added.")
    return render(request, "raw_sql_form.html",{"form": form,"ack":acknowledgement})

class ProductListView(ListView):
    model = Product
    template_name = 'products_list.html'