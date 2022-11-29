CREATE SEQUENCE daily_challenge_id_seq;
CREATE TABLE DAILY_CHALLENGE (
    ID BIGINT PRIMARY KEY DEFAULT nextval('daily_challenge_id_seq'),
    QUIZ_ID BIGINT NOT NULL REFERENCES quizzes(id),
    UPDATED_AT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);