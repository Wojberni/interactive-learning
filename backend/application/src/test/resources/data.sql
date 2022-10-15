insert into users(id, username, password) values (next value for users_id_seq,'test_user', '$2a$12$aM6aqvT1BWv0gkojKuxVMOhdqyQsn69GImWX2kYYQqw7AxdJj.0IO');

insert into roles(id, name) values (1, 'ROLE_USER');

insert into user_roles(user_id, role_id) values (1, 1);
