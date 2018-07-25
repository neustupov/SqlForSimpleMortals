DELETE FROM orders;
DELETE FROM customers;
DELETE FROM salespeople;

INSERT INTO salespeople (snum, sname, city, comm) VALUES
  (1001, 'Peel', 'London', 0.12),
  (1002, 'Serres', 'San Jose', 0.13),
  (1004, 'Motika', 'London', 0.11),
  (1007, 'Rifkin', 'Barcelona', 0.15),
  (1003, 'Axelrod', 'New York', 0.1);

INSERT INTO customers (cnum, cname, city, rating, snum) VALUES
  (2001, 'Hoffman', 'London', 100, 1001),
  (2002, 'Giovanni', 'Rome', 200, 1003),
  (2003, 'Lui', 'San Jose', 200, 1002),
  (2004, 'Grass', 'Berlin', 300, 1002),
  (2006, 'Clemens', 'London', 100, 1001),
  (2008, 'Cisneros', 'San Jose', 300, 1007),
  (2007, 'Pereira', 'Rome', 100, 1004);

INSERT INTO orders (onum, amt, odate, cnum, snum) VALUES
  (3001, 19.69, '03/10/1990', 2008, 1007),
  (3003, 767.19, '03/10/1990', 2001, 1001),
  (3002, 1900.10, '03/10/1990', 2007, 1004),
  (3005, 5160.45, '03/10/1990', 2003, 1002),
  (3006, 1098.16, '03/10/1990', 2008, 1007),
  (3009, 1713.23, '04/10/1990', 2002, 1003),
  (3007, 75.75, '04/10/1990', 2004, 1002),
  (3008, 4723, '05/10/1990', 2006, 1001),
  (3010, 1309.95, '06/10/1990', 2004, 1002),
  (3011, 9891.88, '06/10/1990', 2006, 1001);