-- Field declaration with a foreign key

CREATE TABLE customers
(
  cnum         INTEGER                 PRIMARY KEY ,
  cname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  rating       INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  FOREIGN KEY (snum) REFERENCES salespeople (snum) ON DELETE CASCADE
);

-- FOREIGN KEY as constraint of column

CREATE TABLE customers
(
  cnum         INTEGER                 PRIMARY KEY ,
  cname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  rating       INTEGER                 NOT NULL,
  snum         INTEGER                 REFERENCES salespeople(snum) ON DELETE CASCADE
);

-- Skipping the lists of primary key columns

CREATE TABLE customers
(
  cnum         INTEGER                 PRIMARY KEY ,
  cname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  rating       INTEGER                 NOT NULL,
  snum         INTEGER                 REFERENCES salespeople ON DELETE CASCADE
);

-- Constraint action

CREATE TABLE orders
(
  onum         INTEGER                 PRIMARY KEY ,
  amt          DECIMAL                 NOT NULL,
  odate        DATE                    NOT NULL,
  cnum         INTEGER                 NOT NULL REFERENCES customers
  ON DELETE CASCADE ON UPDATE CASCADE,
  snum         INTEGER                 NOT NULL REFERENCES salespeople
  ON DELETE SET NULL ON UPDATE CASCADE
);

-- Foreign keys that reference the tables in which they are defined

CREATE TABLE employees
(
  empno        INTEGER NOT NULL PRIMARY KEY,
  name         VARCHAR NOT NULL UNIQUE,
  manager      INTEGER REFERENCES employees
);

-- 1

CREATE TABLE cityorders
(
  onum INTEGER PRIMARY KEY ,
  amt DECIMAL,
  snum INTEGER,
  cnum INTEGER,
  city VARCHAR,
  FOREIGN KEY (onum, amt, snum) REFERENCES orders(onum, amt, snum),
  FOREIGN KEY (cnum, city) REFERENCES customers(cnum, city)
);

-- 2

CREATE TABLE orders
(
  onum         INTEGER                 PRIMARY KEY ,
  amt          DECIMAL                 NOT NULL,
  odate        DATE                    NOT NULL,
  cnum         INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  prev         INTEGER,
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum) ON DELETE CASCADE ,
  FOREIGN KEY (cnum) REFERENCES CUSTOMERS (cnum) ON DELETE CASCADE,
  FOREIGN KEY (cnum, prev) REFERENCES orders(cnum, onum)
);