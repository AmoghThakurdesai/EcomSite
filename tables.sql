use ecom_db;

create table user_upload
(
    user_id int primary key auto_increment,
    img varchar(2000) character set 'ascii'  collate 'ascii_general_ci'
);

create table custom_product
(
    title varchar(512),
    img varchar(2000) character set 'ascii'  collate 'ascii_general_ci',
    cost int, 
    user_id int,
    cid int
);

create table product
(
    product_id int primary key auto_increment,
    cat_id int,
    product_name varchar(255),
    product_description varchar(2000),
    img1 varchar(2000) character set 'ascii' collate 'ascii_general_ci',
    img2 varchar(2000) character set 'ascii' collate 'ascii_general_ci',
    img3 varchar(2000) character set 'ascii' collate 'ascii_general_ci',
    price int,
    color varchar(255),
    brand varchar(255)
);

create table cart
(
    cart_id int primary key auto_increment,
    product_id int,
    order_id int,
    custom tinyint,
    sz int, /*size*/
    quantity int
);

create table ordertable
(
    order_id int primary key auto_increment,
    contact int,
    zipcode int,
    state_name varchar(200),
    city_name varchar(200),
    address_details varchar(500),
    order_name varchar(100)
);

create table login
(
    email varchar(200) primary key,
    username varchar(100),
    pass varchar(20),/*password*/
    contact int,
    rol int /*roll*/
);

create table category
(
    cat_id int,
    cat_name varchar(200),
    cat_description varchar(2000)
);