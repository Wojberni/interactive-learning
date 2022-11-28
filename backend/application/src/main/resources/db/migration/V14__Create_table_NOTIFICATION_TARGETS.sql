CREATE SEQUENCE notification_targets_id_seq;
CREATE TABLE NOTIFICATION_TARGETS(
    ID BIGINT PRIMARY KEY DEFAULT nextval('notification_targets_id_seq'),
    USER_ID BIGINT NOT NULL REFERENCES USERS(ID),
    TARGET_FIREBASE_TOKEN VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP NOT NULL DEFAULT NOW(),
    UPDATED_AT TIMESTAMP NOT NULL DEFAULT NOW()
);