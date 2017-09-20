-- DROP TABLE users;
-- DROP TABLE questions;
-- DROP TABLE question_follows;
-- DROP TABLE replies;
-- DROP TABLE questions_likes;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lastname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  reply_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE questions_likes (
  id INTEGER PRIMARY KEY,
  like_value INTEGER,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname,lastname)
VALUES
  ('Osman', 'Medhzytov'),
  ('Noe', 'Jimenez');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('I did not pass','What to do?', (SELECT id FROM users WHERE fname = 'Osman')),
  ('I did pass','What to do?',(SELECT id FROM users WHERE fname = 'Noe')),
  ('Dessert','What is your favorite Dessert?', (SELECT id FROM users WHERE fname = 'Noe'));


INSERT INTO
  question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'I did not pass'),
  (SELECT id FROM users WHERE fname = 'Osman'));

INSERT INTO
  question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'I did pass'),
  (SELECT id FROM users WHERE fname = 'Noe'));

INSERT INTO
  question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Dessert'),
  (SELECT id FROM users WHERE fname = 'Noe'));

INSERT INTO
  replies(question_id,body,reply_id,user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Dessert'),
  ('My favorite dessert is ICE CREAM!'),
  (SELECT id FROM replies WHERE id = 1),
  (SELECT id FROM users WHERE fname = 'Osman')
);

INSERT INTO
  replies(question_id,body,reply_id,user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Dessert'),
  ('I like ICE CREAM ALSO'),
  (SELECT id FROM replies WHERE id = 1),
  (SELECT id FROM users WHERE fname = 'Noe')
);

INSERT INTO
  questions_likes(like_value, question_id)
VALUES
  ((54),(SELECT id FROM questions WHERE title = 'Dessert'));
