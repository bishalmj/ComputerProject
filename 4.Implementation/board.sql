create database board_ply
use board_ply;

create table thickness
(
t_Id int IDENTITY(1,1) PRIMARY KEY,
thickness_size varchar(15),
price int not null
);

insert into thickness values ('6mm',48),('12mm',52),('18mm',78)

select*from thickness


create table Product_size
(
p_Id int IDENTITY(1,1) PRIMARY KEY,
Size varchar(30),
sq int 
 
);

insert into Product_size values ('3ft * 6ft',18),('4ft * 6ft',24),('3ft * 7ft',21),('4ft * 7ft',28),('3ft * 8ft',24),('4ft * 8ft',32)

select * from Product_size


create table users 
(
u_Id int IDENTITY(1,1) PRIMARY KEY,
Name varchar(30),
Username varchar(30),
Passwords varchar(30) 
             
);

insert into users values ('admin','admin','admin');

select * from users

create table Stocklevel
(

thickness_id int,
Product_id int,
quantities int,

constraint fk_Product_id foreign key(Product_id) references Product_size(p_Id) on delete cascade,
constraint fk_thickness_id foreign key(thickness_id) references thickness(t_id) on delete cascade,

);
--drop table Stocklevel

insert into Stocklevel values (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),
							  (2,1,0),(2,2,0),(2,3,0),(2,4,0),(2,5,0),(2,6,0),
							  (3,1,0),(3,2,0),(3,3,0),(3,4,0),(3,5,0),(3,6,0);

select * from Stocklevel

create table  transactions
( 
Tran_Id int IDENTITY(1,1) PRIMARY KEY,
users_id int not null,
customer_name varchar(30),
Product_id int ,
thickness_id int ,
quantity int,
total float,

constraint fk_users_id foreign key(users_id) references users(u_Id) on delete cascade,
constraint fk_products_id foreign key(Product_id) references Product_size(p_Id) on delete cascade,
constraint fk_thicknesss_id foreign key (thickness_id) references thickness(t_Id) on delete cascade

);

select p.size, t.thickness_size ,t.price, s.quantities from stocklevel as s ,Product_size as p,thickness as t where t.t_Id=s.thickness_id and p.p_Id=s.Product_id;

select s.Product_id,t.thickness_size,s.Product_id,p.Size,p.sq,s.quantities from stocklevel as s ,Product_size as p,thickness as t where t.t_Id=s.thickness_id and p.p_Id=s.Product_id;

select tran_Id, ta.users_id,u.Username, customer_name,ta.Product_id, p.Size,ta.thickness_id,t.thickness_size,quantity,total from transactions as ta, Product_size as p,thickness as t,users as u;