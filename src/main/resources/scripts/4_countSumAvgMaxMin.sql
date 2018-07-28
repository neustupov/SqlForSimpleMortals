-- Select with sum()

SELECT sum(amt) FROM orders;

-- Select with avg()

SELECT avg(amt) FROM orders;

-- Counting the number of field values

SELECT count(DISTINCT snum) FROM orders;

-- Counting the number of lines

SELECT count(*) FROM customers;

SELECT count(ALL rating) FROM customers;

-- Counting max amount for each seller

SELECT snum, max(amt) FROM orders GROUP BY snum;

-- Search max orders for each seller and each day

SELECT snum, odate, max(amt) FROM orders GROUP BY snum, odate;

-- Absorption of groups by aggregate values

SELECT snum, odate, max(amt) FROM orders GROUP BY snum, odate HAVING max(amt) > 3000;

-- Max for each seller for 03/10/1990

SELECT snum, max(amt) FROM orders WHERE odate = '03/10/1990' GROUP BY snum;

-- Use HAVING with GROUP BY

SELECT snum, max(amt) FROM orders GROUP BY snum HAVING snum IN (1002, 1007);

-- 1

SELECT count(*) FROM orders WHERE odate = '03/10/1990';

-- 2

SELECT count(DISTINCT city) FROM customers;

-- 3

SELECT cnum, min(amt) FROM orders GROUP BY cnum;

-- 4

SELECT min(cname) FROM customers WHERE cname LIKE 'G%';

-- 5

SELECT city, max(rating) FROM customers GROUP BY city;

-- 6

SELECT odate, count(DISTINCT snum) FROM orders GROUP BY odate;