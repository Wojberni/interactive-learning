insert into users(id, username, email, password, daily_streak) values (next value for users_id_seq,'test_user', 'test@test.com', '$2a$12$aM6aqvT1BWv0gkojKuxVMOhdqyQsn69GImWX2kYYQqw7AxdJj.0IO', 0);

insert into roles(id, name) values (1, 'ROLE_USER');

insert into user_roles(user_id, role_id) values (1, 1);

insert into quizzes(id, name, description, created_by) values 
    (next value for quizzes_id_seq, 'Polish monarchs', 'Check your knowledge on historical Polish monarchs', select id from users where username = 'test_user'),
    (next value for quizzes_id_seq, 'Inventions', 'Check your knowledge on historical inventions and their creators', select id from users where username = 'test_user');

insert into questions(id, content, quiz_id, created_by) values
    (next value for questions_id_seq, 'Who was the first Polish monarch?', select id from quizzes where name = 'Polish monarchs', 1),
    (next value for questions_id_seq, 'Who invented the telephone?', select id from quizzes where name = 'Inventions', 1);

insert into answers(id, content, is_correct, question_id, created_by) values
    (next value for answers_id_seq, 'Bolesław I Chrobry', true, select id from questions where content = 'Who was the first Polish monarch?', 1),
    (next value for answers_id_seq, 'Mieszko I', false, select id from questions where content = 'Who was the first Polish monarch?', 1),
    (next value for answers_id_seq, 'Mieszko II Lambert', false, select id from questions where content = 'Who was the first Polish monarch?', 1),
    (next value for answers_id_seq, 'Alexander Graham Bell', true, select id from questions where content = 'Who invented the telephone?', 1),
    (next value for answers_id_seq, 'Thomas Edison', false, select id from questions where content = 'Who invented the telephone?', 1),
    (next value for answers_id_seq, 'Nikola Tesla', false, select id from questions where content = 'Who invented the telephone?', 1);

insert into flashcards(id, content, answer, created_by) values
    (next value for flashcards_id_seq, 'What is the capital of Poland?', 'Warsaw', 1),
    (next value for flashcards_id_seq, 'aha Polish Monarchs oho', 'Test', 1);