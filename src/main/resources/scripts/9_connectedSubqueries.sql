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