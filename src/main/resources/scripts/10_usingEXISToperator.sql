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

