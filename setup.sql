-- Disable foreign key checks before dropping tables
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS answer_votes;
DROP TABLE IF EXISTS answer_comments;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- USERS TABLE
CREATE TABLE users (
  userid INT(20) NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  firstname VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL,
  email VARCHAR(40) NOT NULL,
  password VARCHAR(100) NOT NULL,
  PRIMARY KEY (userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users (userid, username, firstname, lastname, email, password) VALUES
(1, 'group1', 'Evangadi', 'forum', 'evangadiforum@email.com', '$2b$10$.PKTgBWINz1yU/Od6aVuFepBOv4jle89lVRhfQv5BykEUaXFIto26'),
(2, 'admin', 'Gemechis', 'mulisa', 'gemechisdaba27@gmail.com', '$2b$10$5kJOqkfpCzw2aCON7Xilg.w604HS0exKe63Tooju0QvRMBYHrohBC'),
(3, 'gmy', 'Gemechis', 'mulisa', 'gemechisdaba@gmail.com', '$2b$10$OhcQO/M7nd1pu8mIFr6MDetEhA3Hj4rbvajrz3K6feMzuL.aRFWgy'),
(4, 'gemy', 'Gemechis', 'mulisa', 'gemechisdaba00@gmail.com', '$2b$10$.uQTrDc1RPBk48OWhmUcOOtWXZj2BjqLvLuSXA/nmztxoSw8UTt4S'),
(5, 'Abebe', 'abebe', 'kebede', 'abebe@gmail.com', '$2b$10$cPLSrz2FcLWOysfNgqr5FeDM56YjP7RKxVgCU4QTef/Gr4ulTRIPa'),
(6, 'abduy', 'abdi', 'M', 'Abdi@gmail.com', '$2b$10$Ura6A6R1.7m3xuNFNidVMOomFShRdaDDJO64Gtcb4YdJUzlHzZIM.'),
(7, 'Abbee', 'Abbe', 'M', 'Abbe@gmail.com', '$2b$10$Qy9uthyhgnOgeYGw1Dmp7uDXwZTzfN4azMzE.X/hVq316DSrwrssG'),
(8, 'rody', 'rodas', 'wondwesen', 'rodaswondwesen@gmail.com', '$2b$10$2L5Rc5K94oyph/9MXXiOxuzioutaxQ5kkZlhKSUQZKy05b7xMHoeC'),
(9, 'bbboy', 'baby', 'boy', 'babyboy@gmail.com', '$2b$10$l42.NPIhqhdeGzm/CKf9/utO7mQI6Mmx6mVkfrjyKBLzr92dtXi2y');

-- QUESTIONS TABLE
CREATE TABLE questions (
  questionid INT(11) NOT NULL AUTO_INCREMENT,
  userid INT(20) NOT NULL,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  tag VARCHAR(50) DEFAULT NULL,
  createdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  views INT(11) DEFAULT 0,
  PRIMARY KEY (questionid),
  KEY (userid),
  CONSTRAINT questions_ibfk_1 FOREIGN KEY (userid) REFERENCES users(userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO questions (questionid, userid, title, description, tag, createdate, views) VALUES
(1, 1, 'first Question', 'This is first Question', 'testing-1', '2025-06-11 12:02:22', 0),
(2, 1, 'Second Question', 'This is second Question', 'testing-2', '2025-06-11 12:05:00', 0),
(3, 6, 'what is React?', 'Give me discription about react', '', '2025-06-14 19:53:47', 0),
(4, 7, 'what is x', 'x statejknjkjn kj;k;lkm;', '', '2025-06-15 18:46:38', 0),
(5, 8, 'about self', 'what is your name', '', '2025-06-16 15:59:40', 0),
(6, 9, 'react', 'what is react', 'React', '2025-06-26 08:04:34', 2);

-- ANSWERS TABLE
CREATE TABLE answers (
  answerid INT(20) NOT NULL AUTO_INCREMENT,
  userid INT(20) NOT NULL,
  questionid INT(11) NOT NULL,
  answer VARCHAR(200) NOT NULL,
  createdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  views INT(11) DEFAULT 0,
  edited TINYINT(1) DEFAULT 0,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (answerid),
  KEY (userid),
  KEY (questionid),
  CONSTRAINT answers_ibfk_1 FOREIGN KEY (userid) REFERENCES users(userid),
  CONSTRAINT answers_ibfk_2 FOREIGN KEY (questionid) REFERENCES questions(questionid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO answers (answerid, userid, questionid, answer, createdate, views, edited, updated_at) VALUES
(1, 1, 2, 'second Question is get an answer', '2025-06-11 12:28:25', 0, 0, NULL),
(2, 6, 3, 'React is a JavaScript library for building user interfaces (UIs), especially for SPAs.', '2025-06-14 19:54:56', 0, 0, NULL),
(3, 6, 3, 'UI is broken into reusable, self-contained components.', '2025-06-14 19:56:37', 0, 0, NULL),
(4, 7, 4, 'x is hkhkljknjbkln;lj', '2025-06-15 18:47:00', 0, 0, NULL),
(5, 7, 4, 'second answer', '2025-06-15 18:50:06', 0, 0, NULL),
(6, 7, 4, 'third answer', '2025-06-15 18:52:07', 0, 0, NULL),
(7, 8, 1, 'yeah this fist question', '2025-06-16 16:00:44', 0, 0, NULL),
(8, 8, 1, 'first question', '2025-06-16 16:01:20', 0, 0, NULL),
(9, 8, 1, 'hellow there', '2025-06-16 17:19:55', 0, 0, NULL);

-- ANSWER COMMENTS TABLE
CREATE TABLE answer_comments (
  commentid INT(11) NOT NULL AUTO_INCREMENT,
  answerid INT(11) NOT NULL,
  userid INT(11) DEFAULT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (commentid),
  KEY (answerid),
  KEY (userid),
  CONSTRAINT answer_comments_ibfk_1 FOREIGN KEY (answerid) REFERENCES answers(answerid) ON DELETE CASCADE,
  CONSTRAINT answer_comments_ibfk_2 FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ANSWER VOTES TABLE
CREATE TABLE answer_votes (
  voteid INT(11) NOT NULL AUTO_INCREMENT,
  answerid INT(11) NOT NULL,
  userid INT(11) DEFAULT NULL,
  vote TINYINT(4) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (voteid),
  UNIQUE KEY unique_vote (answerid, userid),
  KEY (userid),
  CONSTRAINT answer_votes_ibfk_1 FOREIGN KEY (answerid) REFERENCES answers(answerid) ON DELETE CASCADE,
  CONSTRAINT answer_votes_ibfk_2 FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
