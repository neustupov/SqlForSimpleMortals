-- CREATE VIEW command

CREATE VIEW londonstaff
AS
  SELECT *
  FROM salespeople
  WHERE city = 'London';

SELECT *
FROM londonstaff;

-- Salesown view

CREATE VIEW salesown
AS
  SELECT
    snum,
    sname,
    city
  FROM salespeople;

-- Update view - error

UPDATE salesown
SET comm = .2
WHERE snum = 1004;

-- Combining predicates of views and queries based on views

SELECT *
FROM londonstaff
WHERE comm > .12;

-- Group view

CREATE VIEW totalforday
AS
  SELECT
    odate,
    count(DISTINCT cnum) AS cnum,
    count(DISTINCT snum) AS snum,
    count(onum)          AS onum,
    avg(amt),
    sum(amt)
  FROM orders
  GROUP BY odate;

-- Views and joins

CREATE VIEW nameorders
AS
  SELECT
    onum,
    amt,
    a.snum,
    sname,
    cname
  FROM orders a, customers b, salespeople c
  WHERE a.cnum = b.cnum
        AND a.snum = c.snum;

SELECT
  a.sname,
  cname,
  amt * comm AS cash
FROM nameorders a, salespeople b
WHERE a.sname = 'Axelrod'
      AND b.snum = a.snum;

-- Views and subqueries

CREATE VIEW elitesaleforce
AS
  SELECT
    b.odate,
    a.snum,
    a.sname
  FROM salespeople a, orders b
  WHERE a.snum = b.snum
        AND b.amt =
            (
              SELECT max(amt)
              FROM orders c
              WHERE c.odate = b.odate
            );

CREATE VIEW bonuscash
AS
  SELECT DISTINCT
    snum,
    sname
  FROM elitesaleforce a
  WHERE 10 <= (
    SELECT count(*)
    FROM elitesaleforce b
    WHERE a.snum = b.snum
  );

-- Deleting views

DROP VIEW bonuscash;

-- 1

CREATE VIEW maxrate
AS
  SELECT
    cnum,
    cname
  FROM customers
  WHERE rating =
        (
          SELECT max(rating)
          FROM customers
        );

-- 2

CREATE VIEW salesontowns
AS
  SELECT
    city,
    count(snum)
  FROM salespeople
  GROUP BY city;

-- 3

CREATE VIEW orderssales
AS
  SELECT
    a.sname,
    sum(amt),
    avg(amt)
  FROM salespeople a, orders b
  WHERE a.snum = b.snum
  GROUP BY a.sname;

CREATE VIEW salerswithcustomers
AS
  SELECT
    a.sname,
    b.cname
  FROM salespeople a, customers b
  WHERE a.snum = b.snum;

CREATE VIEW multi
AS
  SELECT *
  FROM salespeople a
  WHERE 1 <
        (
          SELECT count(*)
          FROM customers b
          WHERE a.snum = b.snum
        );