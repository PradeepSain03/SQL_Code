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
ALTER TABLE orders MODIFY COLUMN order_date date;
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
select cust.customer_id,cust.Full_name from order_details or_data
inner join orders ord on ord.orders_id=or_data.orders_id
inner join customer cust on ord.customer_id=cust.customer_id
group by cust.customer_id,cust.Full_name
having cust.Full_name like 'r%';

-- Query to retreive the total amount of order done on particular date, you can choose any date as per the data
select sum(ammount) from orders
where order_date='2017-02-15';

-- Query to retreive all the category names associated with a particular order
SELECT  name FROM catagories;

-- Query to retreive all the category name associated with a particular order detail
select ct.name from order_details od
inner join products ps on ps.product_id=od.product_id
inner join product_catagory pc on pc.product_id=ps.product_id
inner join catagories ct on ct.catagories_id=pc.catagories_id;


-- Query that returns the customers located in shipping cities that startes with J and also sort the data according to firstname
select *
from customer 
where default_shipping_address like "%j%" 
order by Full_name asc;

-- Get all the Customer Names who have placed order more than of Rs 2500
select cust.Full_name,os.ammount from  orders os
inner join customer cust on cust.customer_id=os.customer_id
where  os.ammount>2500;

-- Calculate the total sales of year 2017 (sales is calculated by price * quantity)
select sum(price * quantity) as total
from orders os
inner join order_details od on os.orders_id=od.orders_id
where  order_date between '2017-01-01' and '2017-12-31';

-- Get top 2 categories based on the orders placed
select ct.name,pc.catagories_id,sum(od.quantity) as total from order_details od
inner join  products ps on ps.product_id=od.product_id
inner join product_catagory pc on pc.product_id=ps.product_id
inner join catagories  ct on ct.catagories_id=pc.catagories_id
group by pc.catagories_id
order by total desc
limit 2;


-- Get the product name which is highest in sale
select pd.name,sum(od.quantity) as total from order_details od
inner join products pd on pd.product_id=od.product_id
group by pd.name
order by total desc
limit 1;

-- Get one Customer details who have placed minimum orders
select cust.customer_id ,cust.email ,cust.password ,
cust.Full_name ,cust.default_shipping_address ,
cust.country ,cust.phone ,od.quantity from order_details od
inner join orders o on o.orders_id=od.orders_id
inner join customer cust on cust.customer_id=o.customer_id
order by od.quantity asc
limit 1;

-- Show the orders of the category that starts with "c"
select cat.name from orders os 
inner join order_details od on os.orders_id= od.orders_id
inner join products pd on pd.product_id=od.product_id
inner join product_catagory pc on pd.product_id= pc.product_id
inner join catagories cat on cat.catagories_id=pc.catagories_id
where cat.name like 'c%';


-- Get 3 TOP pRODUCTS SOLD on the basis of quantity
select ps.product_id ,ps.name,sum(od.quantity) as total_quantity from products ps
inner join order_details od on ps.product_id = od.product_id
group by ps.name,ps.product_id
order by total_quantity desc
limit 3;

-- store procedure 1
DELIMITER $$
CREATE PROCEDURE getCatagoryName()
begin 
select cat.name from order_details od
inner join products pd on pd.product_id= od.product_id
inner join product_catagory pc on pd.product_id=pc.product_id
inner join catagories cat on cat.catagories_id=pc.catagories_id;
end $$
DELIMITER ;

call getCatagoryName();

-- store procedure 2 enter year 2017


DELIMITER $$
CREATE PROCEDURE getTotalSales(in year int)
begin 

DECLARE total_sales int;

select sum(price * quantity) into total_sales
from orders os
inner join order_details od on os.orders_id=od.orders_id
where year(order_date)=year;
 if total_sales > 20000 then
   select 'Higher sales data',total_sales;
 else
   select total_sales;
 end if;
 
end $$
DELIMITER ;


call getTotalSales(2017)

-- store procedure 3

DELIMITER $$
CREATE PROCEDURE getTotalAmmount(in order_id int, out ammount int)
begin
    SELECT SUM(od.price * od.quantity) into ammount
    FROM orders os
    JOIN order_details od ON os.orders_id = od.orders_id
    where os.orders_id = order_id;
  
end $$
DELIMITER ;
DROP PROCEDURE getTotalAmmount;
call getTotalAmmount(2,@ammount);
select @ammount;


                                      -- trigger 1
create table customer_copy(
customer_id int primary key,
email varchar(255),
password varchar(255),
Full_name varchar(255),
default_shipping_address varchar(255),
country varchar(255),
phone INT
);
drop table customer_copy;

DELIMITER $$
create trigger customer_delete
after delete
on customer for each row

begin
    insert into customer_copy (
    customer_id, email, password, Full_name, 
    default_shipping_address, country, phone)
    values(
    old.customer_id, old.email, old.password, old.Full_name, 
    old.default_shipping_address, old.country, old.phone);


end $$
DELIMITER ;

DROP TRIGGER customer_delete;

insert into customer values (9,"g@gmail.com","67@12","kk","jaipur","u.k",777777);


delete from customer
where customer_id=7;

select * from customer_copy;




                                    -- trigger 2

 create table customer1(
customer_id int primary key,
email varchar(255),
password varchar(255),
Full_name varchar(255),
default_shipping_address varchar(255),
country varchar(255),
phone INT
);

delimiter $$

create trigger copy_data after insert 
on customer for each row 
begin

insert into  customer1 (
customer_id ,email ,password ,Full_name ,
default_shipping_address ,country ,phone ) 
values(
        NEW.customer_id,NEW.email,NEW.password,NEW.Full_name,
        NEW.default_shipping_address,NEW.country,NEW.phone
    );

end $$
delimiter;

select * from customer1;


                                       -- trigger 3
CREATE TABLE events
    (
     id int primary key , 
     msg varchar(20) , 
     ago varchar(30) 
    );
   insert into events values (1,"hello","hii ago"); 
   select * from events;
DELIMITER $$

create trigger not_insert
before insert
ON events FOR EACH ROW
BEGIN
DECLARE errorMessage VARCHAR(255);
    SET errorMessage = "data will be no insert in this table";

         SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;

END$$

DELIMITER ;

                                       -- trigger 4 

create table Maintain_List_Of_Delete(
customer_id int primary key,
email varchar(255),
password varchar(255),
Full_name varchar(255),
default_shipping_address varchar(255),
country varchar(255),
phone INT
);

delete from customer
where customer_id=9;

DELIMITER $$
create trigger Maintain_List_Of_Delete
after delete
on customer for each row

begin
    insert into Maintain_List_Of_Delete (
    customer_id, email, password, Full_name, 
    default_shipping_address, country, phone)
    values(
    old.customer_id, old.email, old.password, old.Full_name, 
    old.default_shipping_address, old.country, old.phone);


end $$
DELIMITER ;

select * from Maintain_List_Of_Delete;

                                       -- trigger 5
CREATE TABLE Sales1 (
    id INT ,
    product VARCHAR(100) ,
    quantity INT 
);
select * from Sales1;
insert into Sales1 values (1,"viva",50),
(2,"viva1",80);

UPDATE Sales1
SET quantity=400
WHERE id=2;

DELIMITER $$

create trigger table_update
AFTER UPDATE
ON Sales1 FOR EACH ROW
BEGIN
DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new quantity ',
                        NEW.quantity,
                        ' old quantity ',
                        OLD.quantity);


 IF OLD.quantity <> new.quantity THEN
         SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END$$

DELIMITER ;
drop trigger table_update;
SHOW ERRORS;
select * from SalesChanges;
SET SQL_SAFE_UPDATES = 0;

-- view 1 Create a view that shows the orders taken by particular customer name(Here customer name is the input paramter)

create view orderCustomer as
select os.orders_id ,os.customer_id,os.ammount,os.shipping_address,os.order_adderess,
os.order_email,os.order_date,os.order_status from orders os
inner join customer cust on cust.customer_id=os.customer_id
where cust.Full_name="ram";

select * from orderCustomer;


-- view 2 

create view BestSell as
select SUM(od.quantity) as total_quantity,os.orders_id,
    os.order_date from orders os
inner join
    order_details od on os.orders_id = od.orders_id
inner join
    products pd on pd.product_id = od.product_id
group by os.orders_id
order by os.order_date desc
limit 3;
drop view BestSell;
select * from BestSell;



-- view 3 

create view totalBilling as
select sum(price * quantity) as total
from orders os
inner join order_details od on os.orders_id=od.orders_id
where  MONTH(order_date)="02";

drop view totalBilling;
select * from totalBilling;

-- view 4

 create view customerInfo as
 select cust.customer_id,cust.email,cust.password,cust.Full_name,cust.default_shipping_address,
 cust.country,cust.phone from orders os
 inner join customer cust on cust.customer_id=os.customer_id
 where os.order_date="2017-03-07";

select * from customerInfo;

-- view 5

create view listProducts as
select cust.Full_name,os.orders_id,pd.name from customer cust
inner join orders os on cust.customer_id=os.customer_id
inner join order_details od on os.orders_id=od.orders_id
inner join products pd on pd.product_id=od.product_id
where cust.Full_name like "s%" and os.order_status="success";

drop view listProducts;
select * from listProducts;

