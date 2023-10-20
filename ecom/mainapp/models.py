# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    product_id = models.IntegerField(blank=True, null=True)
    order_id = models.IntegerField(blank=True, null=True)
    custom = models.IntegerField(blank=True, null=True)
    sz = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cart'


class Category(models.Model):
    cat_id = models.IntegerField(blank=True, null=True)
    cat_name = models.CharField(max_length=200, blank=True, null=True)
    cat_description = models.CharField(max_length=2000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'


class CustomProduct(models.Model):
    title = models.CharField(max_length=512, blank=True, null=True)
    img = models.CharField(max_length=2000, db_collation='ascii_general_ci', blank=True, null=True)
    cost = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField(blank=True, null=True)
    cid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'custom_product'


class Login(models.Model):
    email = models.CharField(primary_key=True, max_length=200)
    username = models.CharField(max_length=100, blank=True, null=True)
    pass_field = models.CharField(db_column='pass', max_length=20, blank=True, null=True)  # Field renamed because it was a Python reserved word.
    contact = models.IntegerField(blank=True, null=True)
    rol = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'login'


class Ordertable(models.Model):
    order_id = models.AutoField(primary_key=True)
    contact = models.IntegerField(blank=True, null=True)
    zipcode = models.IntegerField(blank=True, null=True)
    state_name = models.CharField(max_length=200, blank=True, null=True)
    city_name = models.CharField(max_length=200, blank=True, null=True)
    address_details = models.CharField(max_length=500, blank=True, null=True)
    order_name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ordertable'


class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    cat_id = models.IntegerField(blank=True, null=True)
    product_name = models.CharField(max_length=255, blank=True, null=True)
    product_description = models.CharField(max_length=2000, blank=True, null=True)
    img1 = models.CharField(max_length=2000, db_collation='ascii_general_ci', blank=True, null=True)
    img2 = models.CharField(max_length=2000, db_collation='ascii_general_ci', blank=True, null=True)
    img3 = models.CharField(max_length=2000, db_collation='ascii_general_ci', blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    color = models.CharField(max_length=255, blank=True, null=True)
    brand = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product'


class UserUpload(models.Model):
    user_id = models.AutoField(primary_key=True)
    img = models.CharField(max_length=2000, db_collation='ascii_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_upload'
