-- Using subqueries in INSERT

INSERT INTO sjpeople
  SELECT *
  FROM salespeople
  WHERE snum = ANY (
    SELECT snum
    FROM customers
    WHERE city = 'San Jose'
  );

-- Using subqueries based on external query tables

INSERT INTO samecity
  SELECT *
  FROM salespeople out
  WHERE city IN
        (SELECT city
         FROM customers inn
         WHERE inn.snum = out.snum);

INSERT INTO bonus
  SELECT
    snum,
    odate,
    amt
  FROM orders a
  WHERE amt = (
    SELECT max(amt)
    FROM orders b
    WHERE a.odate = b.odate
  );

DELETE
FROM customers
WHERE snum = ANY (
  SELECT snum
  FROM salespeople
  WHERE city = 'London');

DELETE
FROM salespeople
WHERE exists(
    SELECT *
    FROM customers
    WHERE rating = 100
          AND salespeople.snum = customers.snum
);

-- analog --

DELETE
FROM salespeople
WHERE 100 IN (
  SELECT rating
  FROM customers
  WHERE salespeople.snum = customers.snum
);

DELETE
FROM salespeople
WHERE snum IN
      (SELECT snum
       FROM orders a
       WHERE amt =
             (SELECT min(amt)
              FROM orders b
              WHERE a.odate = b.odate)
             AND (SELECT count(onum)
                  FROM orders b
                  WHERE a.odate = b.odate) > 1);

-- Using subqueries with UPDATE

UPDATE salespeople
SET comm = comm + .01
WHERE (SELECT count(cnum)
       FROM customers
       WHERE customers.snum = salespeople.snum) >= 2;

UPDATE salespeople
SET comm = comm - .01
WHERE snum IN (
  SELECT snum
  FROM orders a
  WHERE amt = (
    SELECT min(amt)
    FROM orders b
    WHERE a.odate = b.odate)
);

-- 1

INSERT INTO multicust
  SELECT *
  FROM salespeople a
  WHERE 1 < (
    SELECT count(*)
    FROM customers b
    WHERE a.snum = b.snum
  );

-- 2

DELETE FROM customers
WHERE NOT exists(
    SELECT *
    FROM orders
    WHERE customers.cnum = orders.cnum
);

-- 3

UPDATE salespeople
SET comm = comm * 1.2
WHERE 3000 < (
  SELECT sum(amt)
  FROM orders
  WHERE salespeople.snum = orders.snum
);