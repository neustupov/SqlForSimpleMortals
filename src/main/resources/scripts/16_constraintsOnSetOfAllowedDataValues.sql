-- Constraints for primary key

CREATE TABLE salespeople
(
  snum         INTEGER                 PRIMARY KEY ,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);

-- Primary keys consisting of more than one field

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL,
  PRIMARY KEY (snum, sname)
);

-- Uniqueness as a constraint on the column

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL UNIQUE ,
  sname        VARCHAR                 NOT NULL UNIQUE ,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL
);

-- Uniqueness as a constraint on the table

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL,
  sname        VARCHAR                 NOT NULL,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL,
  UNIQUE (snum, sname)
);

-- Selection of field values

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL UNIQUE ,
  sname        VARCHAR                 NOT NULL UNIQUE ,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 CHECK (comm < 1)
);

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL UNIQUE ,
  sname        VARCHAR                 NOT NULL UNIQUE ,
  city         VARCHAR                 NOT NULL
  CHECK (city IN ('London', 'San Jose')),
  comm         DECIMAL                 CHECK (comm < 1)
);

-- Choice of constraints based on a set of fields

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL UNIQUE ,
  sname        VARCHAR                 NOT NULL UNIQUE ,
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 CHECK (comm < .15 OR city = 'Barcelona')
);

-- Assignment of default values

CREATE TABLE salespeople
(
  snum         INTEGER                 NOT NULL UNIQUE ,
  sname        VARCHAR                 NOT NULL UNIQUE ,
  city         VARCHAR                 DEFAULT 'London',
  comm         DECIMAL                 CHECK (comm < .15)
);

-- 1

CREATE TABLE orders
(
  onum         INTEGER                 PRIMARY KEY ,
  amt          DECIMAL                 NOT NULL,
  odate        DATE                    NOT NULL,
  cnum         INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum) ON DELETE CASCADE ,
  FOREIGN KEY (cnum) REFERENCES CUSTOMERS (cnum) ON DELETE CASCADE,
  UNIQUE (cnum, snum)
);

-- 2

CREATE TABLE salespeople
(
  snum         INTEGER                 PRIMARY KEY ,
  sname        VARCHAR                 NOT NULL CHECK (sname BETWEEN 'AA' AND 'MZ'),
  city         VARCHAR                 NOT NULL,
  comm         DECIMAL                 NOT NULL      DEFAULT .1
);

-- 3

CREATE TABLE orders
(
  onum         INTEGER                 NOT NULL PRIMARY KEY ,
  amt          DECIMAL                 NOT NULL,
  odate        DATE                    NOT NULL,
  cnum         INTEGER                 NOT NULL,
  snum         INTEGER                 NOT NULL,
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum) ON DELETE CASCADE ,
  FOREIGN KEY (cnum) REFERENCES CUSTOMERS (cnum) ON DELETE CASCADE,
  CHECK ((cnum > snum) AND (onum > cnum))
);
