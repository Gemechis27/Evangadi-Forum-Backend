-- Disable foreign key checks to drop tables safely
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS answer_votes;
DROP TABLE IF EXISTS answer_comments;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

-- USERS
CREATE TABLE users (
  userid INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(20) NOT NULL,
  firstname VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL,
  email VARCHAR(40) NOT NULL,
  password VARCHAR(100) NOT NULL
);

-- QUESTIONS
CREATE TABLE questions (
  questionid INT AUTO_INCREMENT PRIMARY KEY,
  userid INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  tag VARCHAR(50),
  createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  views INT DEFAULT 0,
  FOREIGN KEY (userid) REFERENCES users(userid)
);

-- ANSWERS
CREATE TABLE answers (
  answerid INT AUTO_INCREMENT PRIMARY KEY,
  userid INT NOT NULL,
  questionid INT NOT NULL,
  answer VARCHAR(200) NOT NULL,
  createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  views INT DEFAULT 0,
  edited TINYINT DEFAULT 0,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (userid) REFERENCES users(userid),
  FOREIGN KEY (questionid) REFERENCES questions(questionid)
);

-- ANSWER COMMENTS
CREATE TABLE answer_comments (
  commentid INT AUTO_INCREMENT PRIMARY KEY,
  answerid INT NOT NULL,
  userid INT,
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (answerid) REFERENCES answers(answerid) ON DELETE CASCADE,
  FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE SET NULL
);

-- ANSWER VOTES
CREATE TABLE answer_votes (
  voteid INT AUTO_INCREMENT PRIMARY KEY,
  answerid INT NOT NULL,
  userid INT,
  vote TINYINT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_vote (answerid, userid),
  FOREIGN KEY (answerid) REFERENCES answers(answerid) ON DELETE CASCADE,
  FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE SET NULL
);
