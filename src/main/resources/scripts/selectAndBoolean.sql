-- Select all customers who live in San Jose and has rating > 200

SELECT * FROM customers WHERE city = 'San Jose' AND rating > 200;

-- Select all customers who live in San Jose or has rating > 200

SELECT * FROM customers WHERE city = 'San Jose' OR rating > 200;

-- Select all customers who live in San Jose or has rating <= 200

SELECT * FROM customers WHERE city = 'San Jose' OR NOT rating > 200;

-- Select all customers who not live in San Jose or has rating  > 200

SELECT * FROM customers WHERE NOT (city = 'San Jose' OR rating > 200);

SELECT * FROM orders WHERE NOT ((odate = '03/10/1990' AND snum > 1002) OR amt > 2000);

-- Request for output all orders which amount > 1000
SELECT * FROM orders WHERE amt > 1000;

-- Request for names of sellers and cities in London which comm > .1

SELECT sname, city FROM salespeople WHERE city = 'London' AND comm > 0.1;

-- Request for customers which rating <= 100 or city = Rome

SELECT * FROM customers WHERE rating > 100 OR city = 'Rome';

SELECT * FROM orders WHERE (amt < 1000 OR NOT (odate = '03/10/1990' AND cnum > 2003));

SELECT * FROM orders WHERE NOT ((odate = '03/10/1990' OR snum > 1006) AND amt >= 1500);

SELECT * FROM salespeople;