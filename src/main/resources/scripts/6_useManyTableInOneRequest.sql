-- Compound two tables

SELECT
  customers.cname,
  salespeople.sname,
  salespeople.city
FROM salespeople, customers
WHERE salespeople.city = customers.city;

-- Compound sellers and customers

SELECT
  customers.cname,
  salespeople.sname
FROM customers, salespeople
WHERE
  salespeople.snum = customers.snum;

-- Compound with inequality

SELECT
  sname,
  cname
FROM salespeople, customers
WHERE sname < cname AND rating < 200;

-- Compound three tables

SELECT
  onum,
  cname,
  orders.cnum,
  orders.snum
FROM salespeople, customers, orders
WHERE customers.city <> salespeople.city
      AND orders.cnum = customers.cnum
      AND orders.snum = salespeople.snum;

-- 1

SELECT
  onum,
  cname
FROM orders, customers
WHERE customers.cnum = orders.cnum;

-- 2

SELECT
  onum,
  sname,
  cname
FROM orders, salespeople, customers
WHERE orders.snum = salespeople.snum
      AND orders.cnum = customers.cnum;

-- 3

SELECT
  cname,
  sname,
  comm
FROM customers, salespeople
WHERE customers.snum = salespeople.snum
AND salespeople.comm > 0.12;

-- 4

SELECT
  onum,
  amt * comm
FROM orders, salespeople, customers
WHERE orders.cnum = customers.cnum
  AND orders.snum = salespeople.snum
  AND customers.rating > 100;