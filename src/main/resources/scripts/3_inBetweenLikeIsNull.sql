-- Select with IN

SELECT *
FROM salespeople
WHERE city IN ('Barcelona', 'London');

-- Select with IN and numerical value

SELECT *
FROM salespeople
WHERE snum IN (1001, 1007, 1004);

-- Select with BETWEEN

SELECT *
FROM salespeople
WHERE comm BETWEEN .1 AND .12;

-- Select with excluding BETWEEN

SELECT *
FROM salespeople
WHERE (comm BETWEEN .1 AND .12) AND NOT comm IN (.1, .12);

-- Select with BETWEEN and alphabet order

SELECT *
FROM customers
WHERE cname BETWEEN 'A' AND 'G';

-- Select with LIKE and %

SELECT *
FROM customers
WHERE cname LIKE 'G%';

-- Select with LIKE and _

SELECT *
FROM salespeople
WHERE sname LIKE 'P__l%';

SELECT *
FROM salespeople
WHERE sname LIKE '%/_%' ESCAPE '/';

SELECT *
FROM salespeople
WHERE sname LIKE '%/_//%' ESCAPE '/';

SELECT *
FROM customers
WHERE city IS NULL;

SELECT *
FROM customers
WHERE city IS NOT NULL;

-- Select with NOT and IN

SELECT *
FROM salespeople
WHERE city NOT IN ('London', 'San Jose');

-- 1

SELECT *
FROM orders
WHERE odate IN ('03/10/1990', '04/10/1990');

-- 2

SELECT *
FROM customers
WHERE snum IN (1001, 1004);

-- 3

SELECT *
FROM customers
WHERE cname BETWEEN 'A' AND 'H';

-- 4

SELECT *
FROM customers
WHERE cname LIKE 'C%';

-- 5

SELECT *
FROM orders
WHERE amt = 0 OR amt ISNULL;

