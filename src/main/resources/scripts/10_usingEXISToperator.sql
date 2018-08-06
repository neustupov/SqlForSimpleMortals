-- Use EXIST operator

SELECT
  cnum,
  cname,
  city
FROM customers
WHERE exists(SELECT *
             FROM customers
             WHERE city = 'San Jose');

-- Use EXIST operator with connecting subquery

SELECT DISTINCT snum
FROM customers out
WHERE exists(
    SELECT *
    FROM customers inn
    WHERE out.snum = inn.snum
          AND inn.cnum <> out.cnum
);

-- Combined EXIST and join

SELECT DISTINCT
  first.snum,
  sname,
  first.city
FROM salespeople first, customers second
WHERE exists(
          SELECT *
          FROM customers third
          WHERE second.snum = third.snum
                AND second.cnum <> third.cnum
      ) AND first.snum = second.snum;

-- Use EXIST with NOT

SELECT DISTINCT snum
FROM customers out
WHERE NOT exists(
    SELECT *
    FROM customers inn
    WHERE inn.snum = out.snum
          AND inn.cnum <> out.cnum
);

-- 1

SELECT *
FROM salespeople out
WHERE exists(
    SELECT *
    FROM customers inn
    WHERE out.snum = inn.snum
          AND rating > 300
);

-- 2

SELECT
  first.snum,
  first.sname
FROM salespeople first, customers second
WHERE first.snum = second.snum
      AND second.rating > 300;

-- 3

SELECT *
FROM salespeople first
WHERE exists(
    SELECT *
    FROM customers second
    WHERE first.city = second.city
          AND first.snum <> second.snum
);

-- 4

SELECT *
FROM customers a
WHERE exists(
    SELECT *
    FROM salespeople b
    WHERE a.snum = b.snum
          AND 1 < (SELECT count(*)
                   FROM orders
                   WHERE orders.snum = b.snum
                         AND orders.cnum <> a.cnum));