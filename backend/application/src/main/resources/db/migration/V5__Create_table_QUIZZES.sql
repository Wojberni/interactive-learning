CREATE SEQUENCE quizzes_id_seq;
CREATE TABLE QUIZZES
(
    ID          BIGINT PRIMARY KEY DEFAULT nextval('quizzes_id_seq'),
    NAME        VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100) NOT NULL,
    CREATED_BY  BIGINT       NOT NULL REFERENCES USERS (ID)
);