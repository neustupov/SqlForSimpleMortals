-- Select snum, sname, city, comm fields from salespeople table

SELECT
  snum,
  sname,
  city,
  comm
FROM salespeople;

-- Select all fields from salespeople table

SELECT *
FROM salespeople;

-- Select odate, snum, onum, amt fields from orders table

SELECT
  odate,
  snum,
  onum,
  amt
FROM orders;

-- Select snum field from orders table without duplicate values

SELECT DISTINCT snum
FROM orders;

-- Select sname and city fields from salespeople where 'city' field equal 'London'

SELECT
  sname,
  city
FROM salespeople
WHERE city = 'London';

-- Select first 5 lines from table

SELECT *
FROM orders
LIMIT 5;

-- Select 2 lines from table starting with 5

SELECT *
FROM orders
LIMIT 2
OFFSET 5;

-- 1

SELECT
  onum,
  amt,
  odate
FROM orders;

-- 2

SELECT *
FROM customers
WHERE snum = 1001;

-- 3

SELECT
  city,
  sname,
  snum,
  comm
FROM salespeople;

-- 4

SELECT
  rating,
  cname
FROM customers
WHERE city = 'San Jose';

-- 5

SELECT DISTINCT snum
FROM orders;