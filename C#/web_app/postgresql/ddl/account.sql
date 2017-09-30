create table account(
  id varchar(10)
  , password varchar(40) not null
  , name varchar(40) not null
  , CONSTRAINT account_pk PRIMARY KEY(id)
);
