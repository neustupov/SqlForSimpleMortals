-- Using ANY operator

SELECT *
FROM salespeople
WHERE city = ANY (
  SELECT city
  FROM customers
);

-- Using ANY with inequality

SELECT *
FROM salespeople
WHERE sname < ANY (
  SELECT cname
  FROM customers
);

-- Using EXIST as an alternative ANY

SELECT *
FROM salespeople out
WHERE exists(
    SELECT *
    FROM customers inn
    WHERE out.sname < inn.cname
);

-- Greater than ANY in the interpretation of SQL

SELECT *
FROM customers
WHERE rating > ANY (
  SELECT rating
  FROM customers
  WHERE city = 'Rome'
);

-- Selection of records, the value amt field which exceeds ANY on October 6

SELECT *
FROM orders
WHERE amt > ANY (
  SELECT amt
  FROM orders
  WHERE odate = '06/10/1990'
);

-- Using ANY with JOIN

SELECT *
FROM orders
WHERE amt < ANY (
  SELECT amt
  FROM orders a, customers b
  WHERE a.cnum = b.cnum
        AND b.city = 'San Jose'
);

-- Using assembly function instead ANY

SELECT *
FROM orders
WHERE amt <
      (SELECT max(amt)
       FROM orders a, customers b
       WHERE a.cnum = b.cnum
             AND b.city = 'San Jose');

-- Using ALL operator

SELECT *
FROM customers
WHERE rating > ALL
      (SELECT rating
       FROM customers
       WHERE city = 'Rome');

-- Using EXIST as alternative of ALL

SELECT *
FROM customers out
WHERE NOT exists(
    SELECT *
    FROM customers inn
    WHERE out.rating <= inn.rating
          AND inn.city = 'Rome'
);

-- Using ALL with <>

SELECT *
FROM customers
WHERE rating <> ALL
      (SELECT rating
       FROM customers
       WHERE city = 'San Jose');

-- Using EXIST with connected subqueries

SELECT *
FROM customers out
WHERE NOT exists(
    SELECT *
    FROM customers inn
    WHERE out.rating <= inn.rating
          AND inn.city = 'Rome'
);

-- Using COUNT instead EXIST

SELECT *
FROM customers out
WHERE 1 > (
  SELECT count(*)
  FROM customers inn
  WHERE out.rating <= inn.rating
        AND inn.city = 'Rome'
);

-- 1

SELECT *
FROM customers
WHERE rating >= ANY (
  SELECT rating
  FROM customers
  WHERE snum = (
    SELECT snum
    FROM salespeople
    WHERE sname = 'Serres'
  )
);

-- 3

SELECT *
FROM salespeople out
WHERE city <> ALL (
  SELECT inn.city
  FROM customers inn
  WHERE inn.snum = out.snum
);

-- 4

SELECT *
FROM orders
WHERE amt > ALL (
  SELECT amt
  FROM orders o, customers c
  WHERE o.cnum = c.cnum
        AND c.city = 'Lodon'
);

-- 5

SELECT *
FROM orders
WHERE amt > (
  SELECT max(amt)
  FROM orders o, customers c
  WHERE o.cnum = c.cnum
        AND c.city = 'Lodon'
);
