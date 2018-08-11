DROP TABLE IF EXISTS multicust;
DROP TABLE IF EXISTS bonus;
DROP TABLE IF EXISTS samecity;
DROP TABLE IF EXISTS sjpeople;
DROP TABLE IF EXISTS daytotals;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS salespeople;

CREATE TABLE salespeople
(
  snum         INTEGER                 PRIMARY KEY ,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);

CREATE TABLE customers
(
  cnum         INTEGER                 PRIMARY KEY ,
  cname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  rating       INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  FOREIGN KEY (snum) REFERENCES salespeople (snum) ON DELETE CASCADE
);

CREATE TABLE orders
(
  onum         INTEGER                 PRIMARY KEY ,
  amt          DECIMAL                 NOT NULL,
  odate        DATE                    NOT NULL,
  cnum         INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum) ON DELETE CASCADE ,
  FOREIGN KEY (cnum) REFERENCES CUSTOMERS (cnum) ON DELETE CASCADE
);

CREATE TABLE daytotals
(
  date         DATE                    PRIMARY KEY ,
  total        INTEGER                 NOT NULL
);

CREATE TABLE sjpeople
(
  snum         INTEGER                 PRIMARY KEY ,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);

CREATE TABLE samecity
(
  snum         INTEGER                 PRIMARY KEY ,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);

CREATE TABLE bonus
(
  snum         INTEGER                 NOT NULL,
  odate        DATE                    NOT NULL,
  amt          INTEGER                 NOT NULL
);

CREATE TABLE multicust
(
  snum         INTEGER                 NOT NULL,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);
