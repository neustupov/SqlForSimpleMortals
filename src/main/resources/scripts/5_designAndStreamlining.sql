-- Use term in request

SELECT
  snum,
  sname,
  city,
  comm * 100
FROM salespeople;

-- Insert symbol in output data

SELECT
  snum,
  sname,
  city,
  '%',
  comm * 100
FROM salespeople;

-- Combining text, fields value and aggregates

SELECT
  'For',
  odate,
  'there are',
  count(DISTINCT onum),
  'orders.'
FROM orders
GROUP BY odate;

-- Ordering output data by 'cnum' field

SELECT *
FROM orders
ORDER BY cnum DESC;

-- Ordering output data by many fields

SELECT *
FROM orders
ORDER BY cnum DESC, amt DESC;

-- Ordering groups

SELECT
  snum,
  odate,
  max(amt)
FROM orders
GROUP BY snum, odate
ORDER BY snum;

-- Ordering with numbers of fields

SELECT
  snum,
  count(DISTINCT onum)
FROM orders
GROUP BY snum
ORDER BY 2 DESC;

-- 1

SELECT
  onum,
  snum,
  amt / 100 * 12
FROM orders
ORDER BY 3;

-- 2

SELECT
  'For the city',
  city,
  ', the highest rating is:',
  max(rating)
FROM customers
GROUP BY city;

-- 3

SELECT
  rating,
  cname,
  cnum
FROM customers
ORDER BY 1;

--4

SELECT
  odate,
  sum(amt)
FROM orders
GROUP BY odate
ORDER BY 2 DESC;