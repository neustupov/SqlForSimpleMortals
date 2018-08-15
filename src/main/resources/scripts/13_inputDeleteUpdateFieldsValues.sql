-- Insert values

INSERT INTO salespeople
VALUES (1010, 'Ivan', 'London', .5);

-- Naming columns for INSERT

INSERT INTO customers (city, cname, cnum, rating, snum)
VALUES ('London', 'Ingman', 2010, 500, 1010);

-- Inserting query results

INSERT INTO daytotals (date, total)
  SELECT
    odate,
    sum(amt)
  FROM orders
  GROUP BY odate
  ORDER BY 1;

-- Deleting lines from table

DELETE FROM salespeople
WHERE snum = 1003;

-- Update lines

UPDATE salespeople
SET sname = 'Gibson', city = 'Boston', comm = .1
WHERE snum = 1004;

-- Using expression in UPDATE

UPDATE salespeople
SET comm = comm * 2
WHERE city = 'London';

-- 1

INSERT INTO salespeople (city, sname, comm, snum)
VALUES ('San Jose', 'Blanco', .01, 1100);

-- 2

DELETE FROM orders
WHERE cnum = (
  SELECT cnum
  FROM customers
  WHERE cname = 'Clemens'
);

-- 3

UPDATE customers
SET rating = rating + 100
WHERE city = 'Rome';

-- 4

UPDATE customers
SET snum = (
  SELECT snum
  FROM salespeople
  WHERE sname = 'Motika'
)
WHERE snum = (
  SELECT snum
  FROM salespeople
  WHERE sname = 'Serres'
);

-- Copy tables

SELECT *
INTO copytable
FROM salespeople;

CREATE TABLE othercopy
AS SELECT *
   FROM customers;

-- Delete all lines in table(fast speed)

TRUNCATE TABLE othercopy;