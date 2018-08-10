-- Combining two queries

SELECT
  snum,
  sname
FROM salespeople
WHERE city = 'London'
UNION
SELECT
  cnum,
  cname
FROM customers
WHERE city = 'London';

-- Combining eliminates duplicate output

SELECT
  snum,
  city
FROM customers
UNION
SELECT
  snum,
  city
FROM salespeople;

-- Selected highest and lowest orders with explaining lines and ORDER BY

SELECT
  a.snum,
  sname,
  onum,
  'Highest on',
  odate
FROM salespeople a, orders b
WHERE a.snum = b.snum
      AND b.amt = (
  SELECT max(amt)
  FROM orders c
  WHERE c.odate = b.odate
)
UNION
SELECT
  a.snum,
  sname,
  onum,
  'Lowest on',
  odate
FROM salespeople a, orders b
WHERE a.snum = b.snum
      AND b.amt = (
  SELECT min(amt)
  FROM orders c
  WHERE c.odate = b.odate
)
ORDER BY 3;

-- Outer join

SELECT
  salespeople.snum,
  sname,
  cname,
  comm
FROM salespeople, customers
WHERE salespeople.city = customers.city
UNION
SELECT
  snum,
  sname,
  'no match',
  comm
FROM salespeople
WHERE NOT city = ANY
          (SELECT city
           FROM customers)
ORDER BY 2 DESC;

-- Outer join with comment field

SELECT
  a.snum,
  sname,
  a.city,
  'matched'
FROM salespeople a, customers b
WHERE a.city = b.city
UNION
SELECT
  snum,
  sname,
  city,
  'no match'
FROM salespeople
WHERE NOT city = ANY (
  SELECT city
  FROM customers
)
ORDER BY 2 DESC;

-- Difficult outer join

(SELECT
   snum,
   city,
   'salesperson - matched'
 FROM salespeople
 WHERE city = ANY (
   SELECT city
   FROM customers
 )
 UNION
 SELECT
   snum,
   city,
   'salesperson - no matched'
 FROM salespeople
 WHERE NOT city = ANY (
   SELECT city
   FROM customers
 ))
UNION
(SELECT
   cnum,
   city,
   'customer - matched'
 FROM customers
 WHERE city = ANY (
   SELECT city
   FROM salespeople
 ))
UNION
SELECT
  cnum,
  city,
  'customer - no match'
FROM customers
WHERE NOT city = ANY (
  SELECT city
  FROM salespeople
)
ORDER BY 2 DESC;

-- 1

SELECT
  cname,
  city,
  rating,
  'high rating'
FROM customers
WHERE rating >= 200
UNION
SELECT
  cname,
  city,
  rating,
  'low rating'
FROM customers
WHERE rating < 200;

-- 2

SELECT
  snum,
  sname
FROM salespeople
WHERE 1 < (SELECT count(*)
           FROM orders
           WHERE salespeople.snum = orders.snum)
UNION
SELECT
  cnum,
  cname
FROM customers
WHERE 1 < (SELECT count(*)
           FROM orders
           WHERE customers.cnum = orders.cnum)
ORDER BY 2;

-- 3

SELECT snum
FROM salespeople
WHERE city = 'San Jose'
UNION
(SELECT cnum
 FROM customers
 WHERE city = 'San Jose'
 UNION ALL
 SELECT onum
 FROM orders
 WHERE odate = '03/10/1990');