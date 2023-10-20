# Generated by Django 4.2.5 on 2023-10-19 07:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('cart_id', models.AutoField(primary_key=True, serialize=False)),
                ('product_id', models.IntegerField(blank=True, null=True)),
                ('order_id', models.IntegerField(blank=True, null=True)),
                ('custom', models.IntegerField(blank=True, null=True)),
                ('sz', models.IntegerField(blank=True, null=True)),
                ('quantity', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'cart',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cat_id', models.IntegerField(blank=True, null=True)),
                ('cat_name', models.CharField(blank=True, max_length=200, null=True)),
                ('cat_description', models.CharField(blank=True, max_length=2000, null=True)),
            ],
            options={
                'db_table': 'category',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='CustomProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(blank=True, max_length=512, null=True)),
                ('img', models.CharField(blank=True, db_collation='ascii_general_ci', max_length=2000, null=True)),
                ('cost', models.IntegerField(blank=True, null=True)),
                ('user_id', models.IntegerField(blank=True, null=True)),
                ('cid', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'custom_product',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Login',
            fields=[
                ('email', models.CharField(max_length=200, primary_key=True, serialize=False)),
                ('username', models.CharField(blank=True, max_length=100, null=True)),
                ('pass_field', models.CharField(blank=True, db_column='pass', max_length=20, null=True)),
                ('contact', models.IntegerField(blank=True, null=True)),
                ('rol', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'login',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Ordertable',
            fields=[
                ('order_id', models.AutoField(primary_key=True, serialize=False)),
                ('contact', models.IntegerField(blank=True, null=True)),
                ('zipcode', models.IntegerField(blank=True, null=True)),
                ('state_name', models.CharField(blank=True, max_length=200, null=True)),
                ('city_name', models.CharField(blank=True, max_length=200, null=True)),
                ('address_details', models.CharField(blank=True, max_length=500, null=True)),
                ('order_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ordertable',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('product_id', models.AutoField(primary_key=True, serialize=False)),
                ('cat_id', models.IntegerField(blank=True, null=True)),
                ('product_name', models.CharField(blank=True, max_length=255, null=True)),
                ('product_description', models.CharField(blank=True, max_length=2000, null=True)),
                ('img1', models.CharField(blank=True, db_collation='ascii_general_ci', max_length=2000, null=True)),
                ('img2', models.CharField(blank=True, db_collation='ascii_general_ci', max_length=2000, null=True)),
                ('img3', models.CharField(blank=True, db_collation='ascii_general_ci', max_length=2000, null=True)),
                ('price', models.IntegerField(blank=True, null=True)),
                ('color', models.CharField(blank=True, max_length=255, null=True)),
                ('brand', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'product',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='UserUpload',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('img', models.CharField(blank=True, db_collation='ascii_general_ci', max_length=2000, null=True)),
            ],
            options={
                'db_table': 'user_upload',
                'managed': False,
            },
        ),
    ]
