/*--------------------------------------------*/
CREATE TABLE Department 
(
did			numeric(3,0),
dname			varchar(30),
dfloor			integer,
head 			numeric(5,0), 

PRIMARY KEY(did)
);

/*--------------------------------------------*/
CREATE TABLE Employee 
(
eid 			numeric(5,0),
ename			varchar(30),
salary			integer		NOT NULL,
did			numeric(3,0)	REFERENCES Department,
classification		integer,

check (classification >= 1 and classification<=10),
check (salary>=0),

PRIMARY KEY (eid)
);

/*--------------------------------------------*/
CREATE TABLE Budget 
(
did			numeric(3,0)	REFERENCES Department,
byear			numeric(4,0),
budget			integer, 

check (budget>=0),
PRIMARY KEY (did,byear)
);

/*--------------------------------------------*/
CREATE TABLE Project 
(
pid			numeric(3,0),
pname			varchar(30),
did			numeric(3,0)	REFERENCES Department,
budget			integer,
duedate			date, 

check (budget>=0),
 PRIMARY KEY (pid)
);

/*--------------------------------------------*/
CREATE TABLE Onproject 
(
pid			numeric(3,0)	REFERENCES Project,
eid			numeric(5,0)	REFERENCES Employee,
fdate			date, 

PRIMARY KEY (pid,eid)
)
/*--------------------------------------------*/