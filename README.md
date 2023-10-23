now the form for adding raw sql queries is added for testing purposes
*******************THIS IS EXTREMELY DANGEROUS**************++++++++++++++++++++++++++++++++
**BE EXTREMELY CAREFUL**


### cmd for starting db
` sudo mariadb --user root `


- can pass raw sql queries to database that is connected to django.
- connect mariadb database to django. databse name is ecom_db.
- make user named ecom and set password to 12345. django uses this user to access the db.
- use `python3 manage.py runserver` in the ecom directory (main project directory) to start the backend
- after starting the backend, go to http://127.0.0.1:8000/mainapp/home to pass in raw sql queries to db.

###### TODO
- we will add the custom product in the cart section after an action
- delete the login table (becoz auth_users has the user auth data)
- make the connections between rest of the tables thro foreign keys
- replace deleted login table bu user in aut_user table
- add some fking data to tables