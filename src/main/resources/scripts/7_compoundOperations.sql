-- Compound table by itself with itself

SELECT
  first.cname,
  second.cname,
  first.rating
FROM customers first, customers second
WHERE first.rating = second.rating;

-- Elimination of redundant output data

SELECT
  first.cname,
  second.cname,
  first.rating
FROM customers first, customers second
WHERE first.rating = second.rating
      AND first.cname < second.cname;

-- Combining customers with different ratings

SELECT
  a.cnum,
  b.cnum,
  c.cnum
FROM customers a, customers b, customers c
WHERE a.rating = 100
      AND b.rating = 200
      AND c.rating = 300;

-- Searching buyers from cities where seller works

SELECT
  b.cnum,
  b.cname
FROM customers a, customers b
WHERE a.snum = 1002
      AND b.city = a.city;

-- Compound table with its copy ond another table

SELECT
  sname,
  salespeople.snum,
  first.cname,
  second.cname
FROM customers first, customers second, salespeople
WHERE first.snum = second.snum
      AND salespeople.snum = first.snum
      AND first.cnum < second.cnum;

-- 1

SELECT
  a.snum,
  b.snum
FROM salespeople a, salespeople b
WHERE a.city = b.city
      AND a.sname < b.sname;

-- 2

SELECT
  cname,
  a.onum,
  b.onum
FROM customers, orders a, orders b
WHERE a.cnum = b.cnum
  AND a.cnum = customers.cnum
  AND a.onum < b.onum;

-- 3

SELECT
  a.cname,
  a.city
FROM customers a, customers b
WHERE a.rating = b.rating
  AND b.cnum = 2001;
