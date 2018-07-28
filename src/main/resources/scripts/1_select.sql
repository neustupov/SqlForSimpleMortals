-- Select snum, sname, city, comm fields from salespeople table

SELECT snum, sname, city, comm FROM salespeople;

-- Select all fields from salespeople table

SELECT * FROM salespeople;

-- Select odate, snum, onum, amt fields from orders table

SELECT odate, snum, onum, amt FROM orders;

-- Select snum field from orders table without duplicate values

SELECT DISTINCT snum FROM orders;

-- Select sname and city fields from salespeople where 'city' field equal 'London'

SELECT sname, city FROM salespeople WHERE city = 'London';

-- 1

SELECT onum, amt, odate FROM orders;

-- 2

SELECT * FROM customers WHERE snum = 1001;

-- 3

SELECT city, sname, snum, comm FROM salespeople;

-- 4

SELECT rating, cname FROM customers WHERE city = 'San Jose';

-- 5

SELECT DISTINCT snum FROM orders;