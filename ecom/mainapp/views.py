from django.shortcuts import render,redirect,get_object_or_404
from django.http import HttpResponse
from django.views.generic import ListView,DetailView
from django.db import connection
import django.db as db
from .forms import *
from django.urls import reverse_lazy
from .forms import RawSQLForm
from django.contrib import messages
import sys
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

def login(request):
    try:
        username = request.POST['username']
        password = request.POST['password']
        result = dbquery(f"select * from users where username =  {};")
    except:
        print("Error")
    return render(request, "login.html")

def signup(request):
    username = request.POST['username']
    password = request.POST['password']
    return render(request, "signup.html")

def productdetail(request):
    return render(request, "product_detail.html")

def productlist(request):
    query = dbquery("select * from product;")
    return render(request, "product_list.html",context = {"query":query})

def customproductdetail(request):
    return render(request, "custom_product_detail.html")

def customproductlist(request):
    query = dbquery("select * from custom_product;")
    
    return render(request, "custom_products_list.html")