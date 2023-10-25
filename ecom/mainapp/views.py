from django.shortcuts import render,redirect,get_object_or_404
from django.http import HttpResponse
from django.views.generic import ListView,DetailView
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
from .models import *
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

class ProductDetailView(DetailView):
    model = Product
    template_name = 'product_detail.html'

class CustomProductListView(ListView):
    model = CustomProduct
    template_name = 'custom_products_list.html'

class CustomProductDetailView(DetailView):
    model = CustomProduct
    template_name = 'custom_products_detail.html'

    def get_object(self, queryset=None):
        # Replace 'your_field' with the field you want to use for object retrieval
        field_name = 'id'
        value = self.kwargs.get(field_name)  # Get the value from URL parameters

        # Use get_object_or_404 to retrieve the object based on the specified field
        obj = get_object_or_404(self.model, **{field_name: value})

        return obj