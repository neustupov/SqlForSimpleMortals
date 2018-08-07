-- Use connected subquery

SELECT *
FROM customers out
WHERE '03/10/1990' IN
      (SELECT odate
       FROM orders inn
       WHERE out.cnum = inn.cnum);

-- Using a connection instead of a linked subquery

SELECT *
FROM customers first, orders second
WHERE first.cnum = second.cnum
      AND second.odate = '03/10/1990';

-- Search for a seller for many buyers

SELECT
  snum,
  sname
FROM salespeople main
WHERE 1 <
      (SELECT count(*)
       FROM customers
       WHERE snum = main.snum);

-- Linking a table to its copy

SELECT *
FROM orders out
WHERE amt >
      (SELECT avg(amt)
       FROM orders inn
       WHERE inn.cnum = out.cnum);

-- Selection of orders, the value of which exceeds the average value for their customers or coincides with them

SELECT *
FROM orders out
WHERE amt >=
      (SELECT avg(amt)
       FROM orders inn
       WHERE out.cnum = inn.cnum);

-- 1

SELECT
  cname,
  cnum
FROM customers out
WHERE rating =
      (SELECT max(rating)
       FROM customers inn
       WHERE out.city = inn.city);

-- 2

SELECT
  snum,
  sname
FROM salespeople out
WHERE out.city IN
      (SELECT city
       FROM customers inn
       WHERE inn.snum <> out.snum);

SELECT DISTINCT
  sname,
  first.snum
FROM salespeople first, customers second
WHERE first.city = second.city
      AND second.snum <> first.snum;

-- List of buyers which was serviced by sellers with a commision between 0.12 and 0.13

SELECT *
FROM customers
WHERE snum IN
      (SELECT snum
       FROM salespeople
       WHERE comm BETWEEN .12 AND .13);

-- Using a subquery as the calculated field

SELECT
  cnum,
  cname,
  (SELECT count(*)
   FROM orders
   WHERE orders.cnum = customers.cnum) AS orders
FROM customers
ORDER BY cnum;
