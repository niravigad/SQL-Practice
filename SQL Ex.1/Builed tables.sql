Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@niravigad 
niravigad
/
SQL-Practice
Public
1
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
SQL-Practice/Build tables
@niravigad
niravigad Create Build tables
Latest commit 021afbd 6 hours ago
 History
 1 contributor
94 lines (67 sloc)  2.12 KB
   
-- Table: public.inspector

-- DROP TABLE public.inspector;

CREATE TABLE public.inspector(
iid int,
iname varchar(20),
bdate date,
sdate date,
mobile numeric(9,0),
primary key (iid));

TABLESPACE pg_default;

ALTER TABLE public.inspector
    OWNER to postgres;
   
   
-- Table: public.manager

-- DROP TABLE public.manager;



CREATE TABLE public.manager
(
    mid integer NOT NULL,
    mname character varying(30) COLLATE pg_catalog."default",
    address character varying(20) COLLATE pg_catalog."default",
    city character varying(10) COLLATE pg_catalog."default",
    mobile numeric(9,0),
    email character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT manager_pkey PRIMARY KEY (mid)
)

TABLESPACE pg_default;

ALTER TABLE public.manager
    OWNER to postgres;
    
    -- Table: public.restaurant

-- DROP TABLE public.restaurant;



CREATE TABLE public.restaurant
(
    ino integer NOT NULL,
    rname character varying(20) COLLATE pg_catalog."default",
    address character varying(20) COLLATE pg_catalog."default",
    city character varying(10) COLLATE pg_catalog."default",
    phone numeric(9,0),
    odate date,
    mid integer,
    CONSTRAINT restaurant_pkey PRIMARY KEY (ino),
    CONSTRAINT restaurant_mid_fkey FOREIGN KEY (mid)
        REFERENCES public.manager (mid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.restaurant
    OWNER to postgres;
    
    
    -- Table: public.inspection

-- DROP TABLE public.inspection;

CREATE TABLE public.inspection
(
    ino integer NOT NULL,
    idate date NOT NULL,
    iid integer,
    stime time without time zone,
    passed integer,
    violations character varying(100) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT inspection_pkey PRIMARY KEY (ino, idate),
    CONSTRAINT inspection_iid_fkey FOREIGN KEY (iid)
        REFERENCES public.inspector (iid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inspection_passed_check CHECK (passed >= 0 AND passed <= 1)
)

TABLESPACE pg_default;

ALTER TABLE public.inspection
    OWNER to postgres;

    
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete