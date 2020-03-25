
drop database if exists website;
create database website;
use website;
create table suppliers(
suppliers_id int primary key,
name varchar(100) not null,
email varchar(50) not null,
phone_number varchar(20),
address varchar(500)
);
create table categories(
categories_id int primary key,
name varchar(50) not null,
description varchar(500)
);
create table products(
products_id int primary key,
name varchar(50) not null,
image_url varchar(1000) not null,
price decimal(18.2),
discount decimal(18.2),
stock decimal(18.2),
categories_id int,
supplier_id int,
description varchar(1000),
foreign key (categories_id) references categories(categories_id) on delete cascade,
foreign key (supplier_id) references suppliers(suppliers_id) on delete cascade
);
create table employees(
employees_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(20),
address varchar(500) not null,
email varchar(50) not null,
birthday datetime
);
create table customers(
customers_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(20),
address varchar(500) not null,
email varchar(50) not null,
birthday date
);
create table orders(
orders_id int primary key,
created_date datetime not null,
shipped_date datetime,
status varchar(50) not null,
description varchar(1000),
shipping_address varchar(500) not null,
shipping_Oty varchar(50) not null,
payment_type varchar(20) not null,
customers_id int,
employees_id int,
foreign key (customers_id) references customers(customers_id) on delete cascade,
foreign key (employees_id) references employees(employees_id) on delete cascade
);
create table orderdetails(
orderdetails_id int primary key,
orders_id int,
products_id int,
quantity decimal(18,2),
foreign key (orders_id) references orders(orders_id) on delete cascade,
foreign key (products_id) references products(products_id) on delete cascade
);

-- INSERT DATA

use website;
SET SQL_SAFE_UPDATES = 0;
delete from categories;
delete from customers;
delete from employees;
delete from orderdetails;
delete from orders;
delete from products;
delete from suppliers;

insert into categories(categories_id,name,description)value(1,"XSMAX","Phone"),(2,"SAMSUNGS10","Phone"),(3,"VSMART","Phone"),(4,"ROGG456","Laptop"),(5,"MSIGL72","Laptop");
insert into customers(customers_id,first_name,last_name,phone_number,address,email,birthday)value
(01,"Bryan","Leo","10888022587","New York","Bryan@hotmail.com",'1990/10/11'),
(02,"Leona","Zax","99999022587","London","Leona@hotmail.com",'1999/03/25'),
(03,"Mike","Ceo","77778022587","New York","Mike@hotmail.com",'1991/10/13'),
(04,"Jack","Kai","6666022587","Paris","Jack@hotmail.com",'1997/10/14'),
(05,"Mice","Jerry","22228022587","Tokyo","Mice@hotmail.com",'1999/08/15');
insert into employees(employees_id,first_name,last_name,phone_number,address,email,birthday) value
(001,"Yasuo","Banana","10888022587","New York","Yasuo@hotmail.com",'1991/12/22'),
(002,"Xinzao","Bryan","99999022587","Ha Noi","Xinzao@hotmail.com",'1992/05/23'),
(003,"Zag","Tam","77778022587","New York","Zag@hotmail.com",'1993/12/24'),
(004,"Zig","Kali","6666022587","Paris","JZigack@hotmail.com",'1994/11/26'),
(005,"Mike","Jerry","22228022587","Tokyo","Mike@hotmail.com",'1995/02/27');
insert into suppliers(suppliers_id,name,email,phone_number,address)value
(1,"SONY","tanvlog@gmail.com","09999444444","PenthHouse Duy Tân"),
(2,"SAMSUNG","Hung@gmail.com","09999555555","PenthHouse Duy Hung"),
(3,"Cuong","Cuong@gmail.com","099996666","PenthHouse Cuong Cuong"),
(4,"Hoa","Hoa@gmail.com","0999977777","PenthHouse Hoa Hoa"),
(5,"Quoc","Quoc@gmail.com","09999888888","PenthHouse Quoc Quoc");
insert into orders(orders_id,created_date,shipped_date,status,description,shipping_address,shipping_Oty,payment_type,customers_id,employees_id)value
(202,'2020/03/25','2020/03/25','COMPLETED','null','Hà Nội','ok','CASH',01,002),
(201,'2019/10/12','2019/10/23','COMPLETED','null','Hà Nội','ok','CASH',02,005),
(203,'2019/10/12','2019/10/23','COMPLETED','null','Tân Phú','ok','CREADIT CARD',03,004),
(205,'2019/10/13','2019/10/24','CANCELED','null','Tân Phú','ok','CREADIT CARD',04,003),
(204,'2019/10/14','2019/10/25','CANCELED','null','Tân Phú','ok','Bankking',05,001),
(206,'2020/03/25','2020/03/25','COMPLETED','null','Hà Nội','ok','CASH',01,002),
(207,'2019/08/22','2019/10/23','CANCELED','null','Hà Nội','ok','CASH',02,005),
(208,'2019/10/23','2019/10/23','COMPLETED','null','Tân Phú','ok','CREADIT CARD',03,004),
(209,'2020/03/25','2020/03/23','COMPLETED','null','Hà Nội','ok','CREADIT CARD',04,004),
(210,'2020/03/25','2020/03/25','CANCELED','null','Hà Nội','ok','Bankking',05,005);
insert into products(products_id,name,image_url,price,discount,stock,categories_id,supplier_id,description)value
(301,"XSmax","null","1000000","5","10",1,1,"Phone"),
(302,"SAMSUNGS10","null","1200000","15","15",2,2,"Phone"),
(303,"VSMART","null","12000","25","11",3,3,"Phone"),
(304,"ROGG456","null","15000","35","12",4,4,"Phone"),
(305,"MSIGL72","null","18000","45","15",5,5,"Phone");
insert into orderdetails(orderdetails_id,orders_id,products_id,quantity)value
(101,201,301,2),(102,202,302,3),(103,203,303,2),(104,204,304,1),(105,205,305,2),
(106,206,301,2),(107,207,302,1),(108,208,303,3),(109,209,303,4),(110,201,305,5);
-- BTAP SELECT
-- Câu 1 : Viết câu lệnh UPDATE để cập nhật Price với điều kiện: Các mặt hàng có Price <= 100000 thì tăng thêm 10%
UPDATE products 
SET price = price*1.1
WHERE price <100000;
-- Câu 2:Viết câu lệnh UPDATE để cập nhật DISCOUNT với điều kiện: Các mặt hàng có Discount <= 10% thì tăng thêm 5%
UPDATE products 
SET discount = discount+5
WHERE discount <=10;
-- Task3: Hiển thị tất cả các mặt hàng có giảm giá <= 10%
SELECT * 
FROM products
WHERE discount <=10; 
-- Câu 4: Hiển thị tất cả các mặt hàng có tồn kho <= 5
SELECT * 
FROM products
WHERE stock <=5; 
-- câu 5 : Hiển thị tất cả các khách hàng có địa chỉ ở Quận Hải Châu
SELECT * 
FROM customers
WHERE address LIKE "%Hai Chau%"; 
-- câu 6: Hiển thị tất cả các khách hàng có năm sinh 1990
SELECT * 
FROM customers
WHERE YEAR(birthday)=1990  ; 
-- câu 7: Hiển thị tất cả các khách hàng có sinh nhật là hôm nay
SELECT * 
FROM customers
WHERE DAY(birthday)=DAY(CURDATE()) AND MONTH(birthday)=MONTH(CURDATE());
-- câu 8: Hiển thị tất cả các đơn hàng có trạng thái là COMPLETED
SELECT * 
FROM orders
WHERE status LIKE "COMPLETED"; 
-- câu 9: Hiển thị tất cả các đơn hàng có trạng thái là COMPLETED trong ngày hôm nay
SELECT * 
FROM orders
WHERE status LIKE "COMPLETED" AND DAY(shipped_date)=DAY(CURDATE())AND MONTH(shipped_date)=MONTH(CURDATE()); 
-- câu 10: Hiển thị tất cả các đơn hàng có trạng thái là CANCELED
SELECT * 
FROM orders
WHERE status LIKE "CANCELED"; 
-- câu 11: Hiển thị tất cả các đơn hàng có hình thức thanh toán là CASH
SELECT * 
FROM orders
WHERE payment_type LIKE "CASH"; 

-- câu 12: Hiển thị tất cả các đơn hàng có hình thức thanh toán là CREADIT CARD
SELECT * 
FROM orders
WHERE payment_type LIKE "CREADIT CARD"; 

-- câu 13: Hiển thị tất cả các đơn hàng có địa chỉ giao hàng là Hà Nội
SELECT * 
FROM orders
WHERE shipping_address LIKE "%Hà Nội%"; 

-- câu 14: Hiển thị tất cả các nhân viên có sinh nhật là hôm nay
SELECT * 
FROM employees
WHERE DAY(birthday)=DAY(CURDATE()) AND MONTH(birthday)=MONTH(CURDATE());
-- câu 15: Hiển thị tất cả các nhà cung cấp có tên là: (SONY, SAMSUNG, TOSHIBA, APPLE)
SELECT * 
FROM suppliers
WHERE name IN ("SONY", "SAMSUNG", "TOSHIBA", "APPLE");

-- câu 16: Hiển thị tất cả các mặt hàng cùng với CategoryName
SELECT * 
FROM products pr
INNER JOIN categories ca ON pr.categories_id=ca.categories_id;
-- câu 17: Hiển thị tất cả các đơn hàng cùng với thông tin chi tiết khách hàng (Customer)
SELECT * 
FROM orders od
INNER JOIN customers cu ON od.customers_id=cu.customers_id;
-- câu 18: Hiển thị tất cả các mặt hàng cùng với thông tin chi tiết của Category và Supplier
SELECT * 
FROM products pr
INNER JOIN categories ca ON pr.categories_id=ca.categories_id 
INNER JOIN suppliers su ON pr.supplier_id=su.suppliers_id;

-- câu 19: Hiển thị tất cả danh mục (Categories) với số lượng hàng hóa trong mỗi danh mục(Viết 2 cách) (edited) 
SELECT ca.* ,SUM(ordd.quantity)+stock AS SL
FROM categories ca
INNER JOIN products pr ON pr.categories_id=ca.categories_id
INNER JOIN orderdetails ordd ON pr.products_id=ordd.products_id
GROUP BY ca.categories_id ;
-- Cách 2: 

-- câu 20: Hiển thị tất cả nhà cung cấp (Suppliers) với số lượng hàng hóa mỗi nhà cung cấp(Viết 2 cách)
SELECT su.suppliers_id,su.name,su.email,su.phone_number,su.address,pr.stock
FROM suppliers su
CROSS JOIN products pr ON su.suppliers_id=pr.supplier_id; 
-- Cách 2: 
SELECT su.suppliers_id,su.name,su.email,su.phone_number,su.address,pr.stock
FROM products pr
INNER JOIN suppliers su ON pr.supplier_id=su.suppliers_id;

-- câu 21: Hiển thị tất cả các mặt hàng được bán trong khoảng từ ngày, đến ngày
SELECT pr.name,ord.created_date
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN products pr ON pr.products_id=ordd.products_id
WHERE DAY(created_date)=DAY(CURDATE()) AND MONTH(created_date)=MONTH(CURDATE());

-- câu 22: Hiển thị tất cả các khách hàng mua hàng trong khoảng từ ngày, đến ngày
SELECT cu.first_name,cu.last_name,ord.created_date
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN customers cu ON ord.customers_id=cu.customers_id
WHERE DAY(created_date)=DAY(CURDATE()) AND MONTH(created_date)=MONTH(CURDATE());

-- câu 22: Hiển thị tất cả các khách hàng mua hàng trong khoảng từ ngày, đến ngày((Khoảng cách ngày các bạn tuỳ chọn theo data phù hợp với mỗi người)) (edited) 
SELECT cu.first_name,cu.last_name,ord.created_date
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN customers cu ON ord.customers_id=cu.customers_id
WHERE DAY(created_date)=DAY(CURDATE()) AND MONTH(created_date)=MONTH(CURDATE()) AND ord.shipping_address LIKE "%Ha Nội%" 
GROUP BY cu.customers_id;

-- Câu 23: Hiển thị tất cả các khách hàng mua hàng (với tổng số tiền) trong khoảng từ ngày, đến ngày(viêt bằng 2 cách, ngày tuỳ chọn )
SELECT cu.*, SUM((pr.price-(pr.price*pr.discount/100))*ordd.quantity) AS "Tổng Tiền"
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN products pr ON pr.products_id=ordd.products_id
INNER JOIN customers cu ON ord.customers_id=cu.customers_id
WHERE DAY(created_date)=DAY(CURDATE()) AND MONTH(created_date)=MONTH(CURDATE())
GROUP BY cu.customers_id;

-- câu 24: Hiển thị tất cả đơn hàng với tổng số tiền
SELECT ord.*, SUM((pr.price-(pr.price*pr.discount/100))*ordd.quantity) AS "Tổng Tiền"
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN products pr ON pr.products_id=ordd.products_id
GROUP BY ord.orders_id;

-- câu 25: Hiển thị tất cả các nhân viên bán hàng với tổng số tiền bán được
SELECT em.*,SUM((pr.price-(pr.price*pr.discount/100))*ordd.quantity) AS "Tổng Tiền"
FROM orders ord
INNER JOIN orderdetails ordd ON ord.orders_id=ordd.orders_id
INNER JOIN products pr ON pr.products_id=ordd.products_id
INNER JOIN employees em ON ord.employees_id=em.employees_id
GROUP BY  em.employees_id;