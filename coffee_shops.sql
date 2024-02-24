CREATE DATABASE `SRINTEST`;
USE SRINTEST;

CREATE TABLE `POSITIONS` (
`position_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
PRIMARY KEY (`position_id`)
);

CREATE TABLE `PRODUCT_GROUPS` (
`group_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL,
PRIMARY KEY (`group_id`)
);

CREATE TABLE `GENERATIONS` (
`birth_year` INT NOT NULL,
`generation` VARCHAR(12) NOT NULL,
PRIMARY KEY (`birth_year`)
);

CREATE TABLE `GENDERS` (
`gender_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL,
PRIMARY KEY (`gender_id`)
);

CREATE TABLE `OUTLET_TYPES` (
`outlet_type_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
PRIMARY KEY (`outlet_type_id`)
);

CREATE TABLE `PRODUCT_CATEGORIES` (
`category_id` INT NOT NULL AUTO_INCREMENT,
`group_id` INT NOT NULL,
`name` VARCHAR(25) NOT NULL,
FOREIGN KEY (`group_id`) REFERENCES `PRODUCT_GROUPS`(`group_id`),
PRIMARY KEY (`category_id`)
);

CREATE TABLE `PRODUCT_TYPES` (
`type_id` INT NOT NULL AUTO_INCREMENT,
`category_id` INT NOT NULL,
`name` VARCHAR(25) NOT NULL,
FOREIGN KEY (`category_id`) REFERENCES `PRODUCT_CATEGORIES`(`category_id`),
PRIMARY KEY (`type_id`)
);

CREATE TABLE `OUTLETS` (
`outlet_id` INT NOT NULL AUTO_INCREMENT,
`outlet_type_id` INT NOT NULL,
`square_feet` DECIMAL(9, 3) DEFAULT NULL,
`address` VARCHAR(25) DEFAULT NULL,
`city` VARCHAR(20) DEFAULT NULL,
`province` VARCHAR(3) DEFAULT NULL,
`longitude` DECIMAL(9, 6) DEFAULT NULL,
`latitude` DECIMAL(9, 6) DEFAULT NULL,
`telephone` VARCHAR(20) DEFAULT NULL,
`postal_code` INT DEFAULT NULL,
`neighborhood` VARCHAR(20) DEFAULT NULL,
FOREIGN KEY (`outlet_type_id`) REFERENCES `OUTLET_TYPES`(`outlet_type_id`),
PRIMARY KEY (`outlet_id`)
);

CREATE TABLE `STAFFS` (
`staff_id` INT NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`startdate` DATE NOT NULL,
`position_id` INT NOT NULL ,
`location_id` INT NOT NULL,
FOREIGN KEY (`position_id`) REFERENCES `POSITIONS`(`position_id`),
FOREIGN KEY (`location_id`) REFERENCES `OUTLETS`(`outlet_id`),
PRIMARY KEY (`staff_id`)
);

CREATE TABLE `SALES_TARGETS` (
`outlet_id` INT NOT NULL,
`year` INT NOT NULL,
`month` INT NOT NULL,
`beans_goal` INT NOT NULL DEFAULT 0,
`beverage_goal` INT NOT NULL DEFAULT 0,
`food_goal` INT NOT NULL DEFAULT 0,
`merchandise_goal` INT NOT NULL DEFAULT 0,
PRIMARY KEY (`outlet_id`, `year`, `month`)
);

CREATE TABLE `CUSTOMERS` (
`customer_id` INT NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`email` VARCHAR(30) NOT NULL,
`customer_since` DATE NOT NULL,
`loyalty_card_number` VARCHAR(12) NOT NULL UNIQUE,
`birthdate` DATE NOT NULL ,
`gender` INT NOT NULL,
FOREIGN KEY (`gender`) REFERENCES `GENDERS`(`gender_id`),
PRIMARY KEY (`customer_id`)
);

CREATE TABLE `CUSTOMER_STORES` (
`customer_id` INT NOT NULL,
`outlet_id` INT NOT NULL,
FOREIGN KEY (`customer_id`) REFERENCES `CUSTOMERS`(`customer_id`),
FOREIGN KEY (`outlet_id`) REFERENCES `OUTLETS`(`outlet_id`),
PRIMARY KEY (`customer_id`, `outlet_id`)
);

CREATE TABLE `PRODUCTS` (
`product_id` INT NOT NULL AUTO_INCREMENT,
`type_id` INT NOT NULL,
`name` VARCHAR(30) NOT NULL,
`description` VARCHAR(120) NOT NULL,
`measure` INT NOT NULL,
`unit` VARCHAR(3) NOT NULL,
`current_wholesale_price` DECIMAL(9, 2) NOT NULL DEFAULT 0,
`current_retail_price` DECIMAL(9, 2) NOT NULL DEFAULT 0,
`tax_exempt_yn` BOOLEAN NOT NULL DEFAULT FALSE,
`promo_yn` BOOLEAN NOT NULL DEFAULT FALSE,
`new_product_yn` BOOLEAN NOT NULL DEFAULT TRUE,
FOREIGN KEY (`type_id`) REFERENCES `PRODUCT_TYPES`(`type_id`),
PRIMARY KEY (`product_id`)
);

CREATE TABLE `PASTRY_INVENTORIES` (
`product_id` INT NOT NULL,
`outlet_id` INT NOT NULL,
`start_of_day` INT NOT NULL,
`quantity_sold` INT NOT NULL ,
`transaction_date` DATE NOT NULL,
FOREIGN KEY (`product_id`) REFERENCES `PRODUCTS`(`product_id`),
FOREIGN KEY (`outlet_id`) REFERENCES `OUTLETS`(`outlet_id`),
PRIMARY KEY (`product_id`, `outlet_id`, `transaction_date`),
CHECK ( `quantity_sold` <= `start_of_day`)
);

CREATE TABLE `SALES_RECEIPTS` (
`transaction_id` INT NOT NULL AUTO_INCREMENT,
`transaction_date` DATETIME NOT NULL,
`outlet_id` INT NOT NULL,
`product_id` INT NOT NULL,
`staff_id` INT NOT NULL,
`customer_id` INT DEFAULT NULL,
`instore_yn` BOOLEAN NOT NULL DEFAULT TRUE,
`quantity` INT NOT NULL DEFAULT 1,
`unit_price` DECIMAL(9, 2) NOT NULL,
`order` INT NOT NULL DEFAULT 1,
`line_item_id` INT NOT NULL DEFAULT 1,
`promo_item_yn` BOOLEAN NOT NULL DEFAULT FALSE,
FOREIGN KEY (`product_id`) REFERENCES `PRODUCTS`(`product_id`),
FOREIGN KEY (`outlet_id`) REFERENCES `OUTLETS`(`outlet_id`),
FOREIGN KEY (`staff_id`) REFERENCES `STAFFS`(`staff_id`),
FOREIGN KEY (`customer_id`) REFERENCES `CUSTOMERS`(`customer_id`) ON DELETE SET NULL,
PRIMARY KEY (`transaction_id`, `transaction_date`, `order`, `line_item_id`, `outlet_id`, `product_id`)
);

select * from POSITIONS;
select * from PRODUCT_GROUPS;
select * from PRODUCT_CATEGORIES;
select * from product_types;
select * from generations;
select * from genders;
select * from outlet_types;
select * from outlets;
select * from staffs;
select * from sales_targets;
select * from products;
select * from pastry_inventories;
select * from customers;
select * from customer_stores;
select * from sales_receipts;

# No 1
select c.customer_id, c.first_name, c.email, sr.transaction_date, sr.unit_price * sr.quantity AS line_item_amount
from SALES_RECEIPTS sr
join customers c on sr.customer_id = c.customer_id
where email = 'Charissa@Integer.us' and DATE(sr.transaction_date) = '2019-04-20'
order by sr.transaction_date desc;

#No. 2
select pt.name product_type, sum(sr.quantity) total_quantity_sold,
case
    when sum(sr.quantity) >= 2000 then 'High Sold'
    when sum(sr.quantity) >= 1000 and sum(sr.quantity) < 2000 then 'Medium Sold'
    else 'Low Sold'
end as status_sold
from sales_receipts sr
left join products p on sr.product_id = p.product_id
left join product_types pt on p.type_id = pt.type_id
where DATE(sr.transaction_date) between '2019-04-06' and '2019-04-14'
group by pt.type_id
order by sum(sr.quantity) desc;

#No. 3
select pt.name product_type, coalesce(sum(q.quantity), 0) as total_quantity_sold
from product_types pt left join products p on p.type_id = pt.type_id
left join (select * from sales_receipts where DATE(transaction_date) = '2019-04-02') as q on p.product_id = q.product_id
group by pt.type_id order by total_quantity_sold desc;

#No. 4
select DATE(q.transaction_date) as transaction_date, q.customer_id,c.first_name customer_first_name, c.email , q.total_quantity
from (select sr.transaction_date, sr.customer_id, sum(sr.quantity) as total_quantity,
row_number() over(partition by DATE(sr.transaction_date) order by sum(sr.quantity) desc) as rn
from sales_receipts sr
where DATE(sr.transaction_date) between '2019-04-12' and '2019-04-20' and sr.customer_id is not null
group by sr.customer_id, DATE(sr.transaction_date)) as q
left join CUSTOMERS c on q.customer_id = c.customer_id
where q.rn = 1
order by transaction_date desc;

#No. 4 with different approach
select s.transaction_date, s.customer_id, c.first_name customer_first_name, c.email customer_email, s.total_quantity from (select q.*, r.customer_id from (select DATE(q.transaction_date) transaction_date, max(q.total_quantity) total_quantity from (select DATE(sr.transaction_date) transaction_date, sr.customer_id, sum(sr.quantity) as total_quantity
from sales_receipts sr
where DATE(sr.transaction_date) between '2019-04-12' and '2019-04-20' and sr.customer_id is not null
group by sr.customer_id, DATE(sr.transaction_date)) as q
group by q.transaction_date) as q inner join
(select DATE(sr.transaction_date) transaction_date, sr.customer_id, sum(sr.quantity) as total_quantity
from sales_receipts sr
where DATE(sr.transaction_date) between '2019-04-12' and '2019-04-20' and sr.customer_id is not null
group by sr.customer_id, DATE(sr.transaction_date)) as r
on q.total_quantity = r.total_quantity and r.transaction_date = q.transaction_date
group by q.transaction_date, q.total_quantity) as s
left join customers c on c.customer_id = s.customer_id
order by transaction_date desc;

#No. 4 (include all customer_ids from 15 April)
select s.transaction_date, s.customer_id, c.first_name customer_first_name, c.email customer_email, s.total_quantity from (select q.*, r.customer_id from (select DATE(q.transaction_date) transaction_date, max(q.total_quantity) total_quantity from (select DATE(sr.transaction_date) transaction_date, sr.customer_id, sum(sr.quantity) as total_quantity
from sales_receipts sr
where DATE(sr.transaction_date) between '2019-04-12' and '2019-04-20' and sr.customer_id is not null
group by sr.customer_id, DATE(sr.transaction_date)) as q
group by q.transaction_date) as q inner join
(select DATE(sr.transaction_date) transaction_date, sr.customer_id, sum(sr.quantity) as total_quantity
from sales_receipts sr
where DATE(sr.transaction_date) between '2019-04-12' and '2019-04-20' and sr.customer_id is not null
group by sr.customer_id, DATE(sr.transaction_date)) as r
on q.total_quantity = r.total_quantity and r.transaction_date = q.transaction_date) as s
left join customers c on c.customer_id = s.customer_id
order by transaction_date desc;

#No. 5
select sr.product_id as product_id, p.name as product, sum(quantity) total_quantity from sales_receipts sr
left join products p on sr.product_id = p.product_id
where DATE(sr.transaction_date) between '2019-04-11' and '2019-04-13'
group by p.product_id
order by sum(quantity) desc
limit 10;

