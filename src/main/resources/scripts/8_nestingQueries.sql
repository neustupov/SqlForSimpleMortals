-- Using subquery

SELECT *
FROM orders
WHERE snum =
      (SELECT snum
       FROM salespeople
       WHERE sname = 'Motika');

-- Use DISTINCT to obtain a single value as a result of a subquery

SELECT *
FROM orders
WHERE snum =
      (SELECT DISTINCT snum
       FROM orders
       WHERE cnum = 2001);

-- Selection of applications, in which the number is indicated, which exceeds the average value
-- for applications received 4/10/1990

SELECT *
FROM orders
WHERE amt >
      (SELECT avg(amt)
       FROM orders
       WHERE odate = '04/10/1990');

-- Use subquery with IN

SELECT *
FROM orders
WHERE snum IN
      (SELECT snum
       FROM salespeople
       WHERE city = 'London');

-- Use IN in subquery? the result of which is the only value

SELECT comm
FROM salespeople
WHERE snum IN
      (SELECT snum
       FROM customers
       WHERE city = 'London');

-- Use subquery with expression

SELECT *
FROM customers
WHERE cnum =
      (SELECT snum + 1000
       FROM salespeople
       WHERE sname = 'Serres');

-- Search buyers with rating  > average rating in San Jose

SELECT
  rating,
  count(DISTINCT cnum)
FROM customers
GROUP BY rating
HAVING rating >
       (SELECT avg(rating)
        FROM customers
        WHERE city = 'San Jose');

-- 1

SELECT
  *
FROM orders
WHERE cnum =
      (SELECT cnum
      FROM customers
      WHERE cname = 'Cisneros');

-- 2

SELECT DISTINCT
  cname,
  rating
FROM customers, orders
WHERE amt >
      (SELECT avg(amt)
      FROM orders)
AND orders.cnum = customers.cnum;

-- 3

SELECT
  snum,
  sum(amt)
FROM orders
GROUP BY snum
HAVING sum(amt) >
       (SELECT max(amt)
       FROM orders)
