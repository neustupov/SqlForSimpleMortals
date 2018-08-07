-- Use INNER JOIN and ON operators (JOIN)

SELECT
  salespeople.snum,
  sname,
  onum
FROM salespeople
  JOIN orders
    ON salespeople.snum = orders.snum;

-- Example of LEFT/RIGHT OUTER JOIN (LEFT/RIGHT JOIN)

SELECT
  customers.cnum,
  cname,
  onum
FROM customers
  LEFT JOIN orders
    ON customers.cnum = orders.cnum;

-- Example of FULL OUTER JOIN

SELECT *
FROM customers
  FULL JOIN orders
    ON customers.cnum = orders.cnum;

-- Using joins together with the final functions

SELECT
  customers.cnum,
  cname,
  count(orders.onum) AS numbers_of_orders
FROM customers
  JOIN orders
    ON customers.cnum = orders.cnum
GROUP BY customers.cnum;