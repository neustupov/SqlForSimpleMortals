-- Use INNER JOIN and ON operators (JOIN)

SELECT
  salespeople.snum,
  sname,
  onum
FROM salespeople
  INNER JOIN orders
    ON salespeople.snum = orders.snum;

-- Example of LEFT/RIGHT OUTER JOIN (LEFT/RIGHT JOIN)

SELECT
  customers.cnum,
  cname,
  onum
FROM customers
  LEFT OUTER JOIN orders
    ON customers.cnum = orders.cnum