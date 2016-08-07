CREATE TABLE IF NOT EXISTS RESERVATION( 
  RESERVATION_ID MEDIUMINT PRIMARY KEY AUTO_INCREMENT
  , USER_ID MEDIUMINT NOT NULL
  , RESERVED_TS TIMESTAMP NOT NULL
  , NAME VARCHAR (255) NOT NULL
  , FOREIGN KEY (RESERVATION_ID) REFERENCES TICKET(TICKET_ID)
  , FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
); 



