-- Text functions

-- UPPER/LOWER

SELECT upper(sname)
FROM salespeople;

SELECT lower(sname)
FROM salespeople;

-- LEFT/RIGHT

SELECT left(sname, 2)
FROM salespeople;

SELECT right(sname, 2)
FROM salespeople;

-- LENGTH

SELECT length(sname)
FROM salespeople;

-- LTRIM/RTRIM

SELECT ltrim(sname)
FROM salespeople;

SELECT rtrim(sname)
FROM salespeople;

-- Date functions

-- DATE_PART

SELECT onum
FROM orders
WHERE date_part('day', odate) = 04;


