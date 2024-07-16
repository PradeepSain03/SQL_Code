create database ecommerce;
use ecommerce;
drop database ecommerce;
create database ecommerce;
use ecommerce;
create table products(
product_id int primary key,
sku varchar(255),
name varchar(255),
price int,
weight int,
description varchar(255),
thumbanil varchar(255),
image varchar(255),
catagory varchar(255) ,
create_date date,
stock int
);
drop table products;



create table options(
options_id int primary key,
option_name varchar(255)
);


create table product_option(
product_options_id int primary key ,
options_id int,
product_id int,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (options_id) REFERENCES options(options_id)
);
ALTER TABLE product_option
ADD price int ;

create table catagories(
catagories_id int primary key,
name varchar(255),
description varchar(255),
thumbanial varchar(255)
);

create table product_catagory(
product_catagory_id int primary key,
catagories_id int,
FOREIGN KEY (catagories_id) REFERENCES catagories(catagories_id)
);

ALTER TABLE product_catagory
ADD product_id int ;

ALTER TABLE product_catagory ADD FOREIGN KEY (product_id) REFERENCES products(product_id);


create table customer(
customer_id int primary key,
email varchar(255),
password varchar(255),
Full_name varchar(255),
default_shipping_address varchar(255),
country varchar(255),
phone INT
);

create table orders(
orders_id int primary key,
customer_id int,
ammount int,
shipping_address varchar(255),
order_adderess varchar(255),
order_email varchar(255),
order_date varchar(255),
order_status varchar(255),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table order_details(
order_id int primary key,
orders_id int ,
product_id int,
price int,
quantity varchar(255),
product_options_id int,
FOREIGN KEY (orders_id) REFERENCES orders(orders_id)
,FOREIGN KEY (product_id) REFERENCES products(product_id)
,FOREIGN KEY (product_options_id) REFERENCES product_option(product_options_id)
);
drop table order_details;


insert into products values 
(1,1,"laptop",2500,1.5,"hello from my laptop","/thumb/laptop.png","/image/laptop.png","laptop",'2017/08/25',80),
(2,2,"headphones",3500,2.5,"hello from my headphones","/thumb/headphones.png","/image/headphones.png","headphones",'2017/09/16',100),
(3,3,"smartwatch",1500,3.5,"hello from my smartwatch","/thumb/smartwatch.png","/image/smartwatch.png","smartwatch",'2017/08/01',80),
(4,4,"computer accessories",6500,2.5,"hello from my computer accessories","/thumb/computer_accessories.png","/image/computer_accessories.png","computer accessories",'2017/06/03',100),
(5,5,"cameras",2500,1.5,"hello from my eBook","/thumb/eBook.png","/image/eBook.png","eBook",'2017/11/06',80);

insert into options values 
(1,"14 inches"),
(2,"15 inches"),
(3,"black"),
(4,"green"),
(5,"30 hour"),
(6,"8 hour"),
(7,"square"),
(8,"Phoenix 1.3"),
(9,"wireless");

insert into product_option values
(1,1,1,2500),
(2,2,1,3500),
(3,3,1,1500),
(4,4,1,5000),
(5,5,2,18000),
(6,6,2,3000),
(7,7,3,1500),
(8,8,3,2500),
(9,9,4,15000),
(10,5,5,2500),
(11,6,5,3500);

insert into catagories values 
(1,"watch","hello from my smartwatch","/thumb/smartwatch.png"),
(2,"computer accessories","hello from my computer accessories","/thumb/computer_accessories.png"),
(3,"cameras","hello from my eBook","/thumb/eBook.png");

insert into product_catagory  values
(1,2,1),(2,2,2),(3,1,3),(4,2,4),(5,3,5);

insert into customer values
(1,"a@gmail.com","a123","ram","jaipur","india",111111),
(2,"b@gmail.com","b123","server","dehli","u.k",222222),
(3,"c@gmail.com","c123","laxman","jaipur","india",333333),
(4,"d@gmail.com","d123","rajesh","dehli","canada",444444),
(5,"e@gmail.com","e123","navin","jaipur","india",555555);

insert into orders values 
(1,1,2500,"jln marg","mansarover","a@gmail.com","2017-02-26","pending"),
(2,2,3500,"lal kothi ","jln marg","b@gmail.com","2017-02-15","success"),
(3,3,4500,"heerpura","lal kothi","c@gmail.com","2017-02-11","pending"),
(4,4,1400,"jln marg","mansarover" ,"d@gmail.com","2017-03-01","succss"),
(5,5,2200,"ramnager","mansarover","e@gmail.com","2017-03-07","pending");

insert into orders values (6,5,2500,"jln marg","mansarover","a@gmail.com","2017-02-15","pending");
insert into order_details values 
(1,1,1,5000,2,1),
(2,2,1,1500,1,3),
(3,2, 3,3000,2,7),
(4,4,4,6500,1,4),
(5,5,5,2500,1,4),
(6,3,2,36000,2,5),	
(7,4,1,2500	,1,1);

/*Query to find the products whose list prices are not in the range of 2000 and 3000.*/
select * from products
where price<2000 or price > 3000;

select * from products
where price between 2000 and 3000;

/*Query finds the orders that customers placed between 01-03-2017 and 10-03-2017*/
select *
from orders
where order_date >= '2017-03-01' and order_date <= '2017-03-10';

/*Query finds the customers whose default shipping address is jaipur */
select * from customer
where default_shipping_address like "%jaipur%";

/*Query that find products whose name contains the string "phones" */
select * from products 
where name like '%phones%';

/*Query to retreive all the order details of the customer whose name is "r" */
select * from order_details 
inner join customer on order_id=customer_id
where Full_name like "%r%";

-- Query to retreive the total amount of order done on particular date, you can choose any date as per the data
select sum(ammount) from orders
where order_date='2017-02-15';

-- Query to retreive all the category names associated with a particular order
SELECT  name FROM catagories;

-- Query to retreive all the category name associated with a particular order detail
select name from catagories
inner join order_details on 
order_id=catagories_id;

-- Query that returns the customers located in shipping cities that startes with J and also sort the data according to firstname
select *
from customer 
where default_shipping_address like "%j%" 
order by Full_name asc;

-- Get all the Customer Names who have placed order more than of Rs 1000
select Full_name from customer
inner join orders on customer.customer_id=orders.orders_id
where ammount>2500;

-- Calculate the total sales of year 2017 (sales is calculated by price * quantity)
select sum(price * quantity) as total
from order_details
inner join orders on orders.orders_id=order_details.order_id
where  order_date= '2017-02-15';


