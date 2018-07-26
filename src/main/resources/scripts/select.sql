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

-- Select onum, amt and odate fields for all lines from orders table

SELECT onum, amt, odate FROM orders;

-- Select all lines from customers table where snum field equal 1001

SELECT * FROM customers WHERE snum = 1001;

-- Select city, sname, snum, comm fields from salespeople table

SELECT city, sname, snum, comm FROM salespeople;

-- Select rating and name for all customers who live in San Jose

SELECT rating, cname FROM customers WHERE city = 'San Jose';

-- Select snum field from orders table without duplicate values

SELECT DISTINCT snum FROM orders;