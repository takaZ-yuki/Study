CREATE TABLE ACCOUNT( 
  id VARCHAR (10) primary key
  , name VARCHAR (20)
  , mail VARCHAR (50)
  , address VARCHAR (200)
  , creator VARCHAR (10) not null
  , created_timestamp datetime not null
  , updater VARCHAR (10)
  , updated_timestamp datetime
) 

