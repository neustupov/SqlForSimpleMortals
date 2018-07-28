SELECT * FROM salespeople WHERE city IN ('Barcelona', 'London');

SELECT * FROM salespeople WHERE snum IN (1001, 1007, 1004);

SELECT * FROM salespeople WHERE comm BETWEEN .1 AND .12;

SELECT * FROM salespeople WHERE (comm BETWEEN .1 AND .12) AND NOT comm IN (.1, .12);

SELECT * FROM customers WHERE cname BETWEEN 'A' AND 'G';

SELECT * FROM customers WHERE cname LIKE 'G%';

SELECT * FROM salespeople WHERE sname LIKE 'P__l%';

SELECT * FROM salespeople WHERE sname LIKE '%/_%'ESCAPE '/';

SELECT * FROM salespeople WHERE sname LIKE '%/_//%' ESCAPE '/';

SELECT * FROM customers WHERE city IS NULL;

SELECT * FROM customers WHERE city is NOT NULL;

SELECT * FROM salespeople WHERE city NOT IN ('London', 'San Jose');

-- 1

SELECT * FROM orders WHERE odate IN ('03/10/1990', '04/10/1990');

-- 2

SELECT * FROM customers WHERE snum IN (1001, 1004);

-- 3

SELECT * FROM customers WHERE cname BETWEEN 'A' AND 'H';

-- 4

SELECT * FROM customers WHERE cname LIKE  'C%';

-- 5

SELECT * FROM orders WHERE amt = 0 OR amt ISNULL;

