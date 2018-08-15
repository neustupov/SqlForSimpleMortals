--  Updated and not updated views

-- read only view (with GROUP BY)

CREATE VIEW dateorders(odate, ocount)
AS
  SELECT
    odate,
    count(*)
  FROM orders
  GROUP BY odate;

-- updated view

CREATE VIEW londoncust
AS
  SELECT *
  FROM customers
  WHERE city = 'London';

-- read only view (with comm * 100)

CREATE VIEW sjsales(name, number, percentage)
AS
  SELECT
    sname,
    snum,
    comm * 100
  FROM salespeople
  WHERE city = 'San Jose';

-- read only view(with subquery)

CREATE VIEW salesonthird
AS
  SELECT *
  FROM salespeople
  WHERE snum IN
        (SELECT snum
         FROM orders
         WHERE odate = '03/10/1990');

-- updated view

CREATE VIEW someorders
AS
  SELECT
    snum,
    onum,
    cnum
  FROM orders
  WHERE odate IN ('03/10/1990', '05/10/1990');

-- WITH CHECK OPTION command - why its not work in my version postgres i dont know

CREATE VIEW highratings
AS
  SELECT
    cnum,
    rating
  FROM customers
  WHERE rating = 300
WITH CHECK OPTION;

-- 1

--read
--read
--read
--upd

-- 2

CREATE VIEW commissions
AS
  SELECT
    snum,
    comm
  FROM salespeople
  WHERE comm BETWEEN .1 AND .2;

-- 3

CREATE VIEW entryorders
  AS SELECT *
  FROM orders;