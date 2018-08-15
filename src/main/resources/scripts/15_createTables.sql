-- Create table

CREATE TABLE salespeople
(
  snum  INTEGER PRIMARY KEY,
  sname VARCHAR NOT NULL,
  city  VARCHAR NOT NULL,
  comm  DECIMAL NOT NULL
);

-- Create indexes

CREATE INDEX Clientgroup
  ON customers (snum);

CREATE UNIQUE INDEX Custid
  ON customers (snum);

-- Delete indexes

DROP INDEX Clientgroup;

-- Change created table

ALTER TABLE salespeople
  ADD lastname VARCHAR;

-- Rename tables

ALTER TABLE daytotals RENAME daytotalsnew;

-- Delete tables

DROP TABLE salespeople;

-- 1

CREATE TABLE customers
(
  cnum   INTEGER PRIMARY KEY,
  cname  VARCHAR NOT NULL,
  city   VARCHAR NOT NULL,
  rating INTEGER NOT NULL,
  snum   INTEGER NOT NULL,
  FOREIGN KEY (snum) REFERENCES salespeople (snum) ON DELETE CASCADE
);

-- 2

CREATE INDEX dateindex
  ON orders (odate);

-- 3

CREATE UNIQUE INDEX
  ON orders (onum);

-- 4

CREATE INDEX cnumdateindex
  ON orders (snum, odate);

-- 5

CREATE UNIQUE INDEX uniqueindex
  ON customers (snum, rating);