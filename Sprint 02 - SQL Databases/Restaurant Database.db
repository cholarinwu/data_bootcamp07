/* 
Homework: Create database for a restaurant

- 5 tables
- Write 3-5 queries
- 1x WITH
- 1x SUBQUERY
- 1x Aggregate function
*/

.open myRestaurant.db
.mode column
.header on
/* 5 tables */

DROP TABLE menus;
DROP TABLE customers;
DROP TABLE employees;
DROP TABLE orders;
DROP TABLE bills;


-- Table 1: Menus
CREATE TABLE menus(
  menu_id int PRIMARY KEY,
  menu_name text,
  menu_price int
);

INSERT INTO menus VALUES
  (1,'Pizza',400),
  (2,'Hamburger',150),
  (3,'French Fries',50);
  
-- Table 2: Customers
CREATE TABLE customers(
  customer_id int PRIMARY KEY,
  customer_firstname text,
  customer_lastname text,
  customer_gender text
);

INSERT INTO customers VALUES
  (1,'Ian','Somerhalder','M'),
  (2,'Will','Smith','M'),
  (3,'Taylor','Swift','F');

-- Table 3: Employee
CREATE TABLE employees(
  employee_id int PRIMARY KEY,
  employee_firstname text,
  employee_lastname text,
  employee_salary int
);

INSERT INTO employees VALUES
  (1,'George','Thasher',15000),
  (2,'Kate','Walter',12000),
  (3,'Jones','Brooke',13000);

-- Table 4: Bill
CREATE TABLE bills(
  bill_id int PRIMARY KEY,
  bill_date datetime,
  employee_id int,
  customer_id int,
  total_price int
);

INSERT INTO bills VALUES
  (1,'2023-01-01',1,1,''),
  (2,'2023-01-02',1,1,''),
  (3,'2023-01-02',1,2,''),
  (4,'2023-01-02',1,3,''),
  (5,'2023-01-03',1,1,''),
  (6,'2023-01-03',2,2,''),
  (7,'2023-01-03',1,2,'');

-- Table 5: Orders
CREATE TABLE orders(
  order_id int PRIMARY KEY,
  bill_id int,
  menu_id int,
  amount int,
  price int
);

INSERT INTO orders VALUES
  (1,1,1,1,''),
  (2,2,1,1,''),
  (3,2,2,1,''),
  (4,3,1,1,''),
  (5,4,1,1,''),
  (6,5,1,1,''),
  (7,5,2,1,''),
  (8,5,3,1,''),
  (9,6,1,1,''),
  (10,6,2,1,''),
  (11,7,1,1,''),
  (12,7,2,1,''),
  (13,7,3,2,'');

SELECT * FROM menus;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM bills;
SELECT * FROM orders;


/* 3-5 queries */

-- 1 (1x WITH)
-- Query: male customers

WITH customer_males AS (
  SELECT * FROM customers
  WHERE customer_gender = 'M'
)
SELECT * FROM customer_males;


-- 2 (1x SUBQUERY)
-- Query: update price calculation to Table: Orders

UPDATE orders
  SET price = order_calc.price1
  FROM(
    SELECT 
      order_id,
      amount*menu_price AS price1
    FROM orders 
    JOIN menus ON orders.menu_id = menus.menu_id) order_calc
  WHERE orders.order_id = order_calc.order_id;
SELECT * FROM orders;

-- 3 (1x Aggregate function)
-- Query: Total price per bill

SELECT 
  bill_id, 
  sum(price) total_price,
  avg(price) avg_price
FROM orders
GROUP BY bill_id;

-- 4
-- Query: Total spendings from each customer

UPDATE bills
  SET total_price = bill_calc.total_price
  FROM(
    SELECT 
      bill_id, 
      sum(price) total_price,
      avg(price) avg_price
    FROM orders
    GROUP BY bill_id) bill_calc
  WHERE bills.bill_id = bill_calc.bill_id;
SELECT * FROM bills;

SELECT
  c.customer_id,
  c.customer_firstname || " " || c.customer_lastname as customer_fullname,
  sum(b.total_price) as total_spending
  FROM customers c
  JOIN bills b ON c.customer_id = b.customer_id
GROUP BY c.customer_id
ORDER BY total_spending DESC;

-- 5
-- Query: No. of bills done that day and total income
SELECT 
  bill_date,
  count(*) total_bills,
  sum(total_price) daily_income
FROM bills
GROUP BY bill_date
