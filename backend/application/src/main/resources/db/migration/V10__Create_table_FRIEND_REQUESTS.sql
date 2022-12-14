CREATE SEQUENCE friend_request_id_seq;
CREATE TABLE FRIEND_REQUEST
(
    ID BIGINT PRIMARY KEY DEFAULT nextval('friend_request_id_seq'),
    SENDER_ID BIGINT NOT NULL REFERENCES USERS(ID),
    RECEIVER_ID BIGINT NOT NULL REFERENCES USERS(ID),
    STATUS VARCHAR(100) NOT NULL,
    CREATED_AT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)