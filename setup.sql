-- Cleaned SQL for Railway

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS answer_votes;
DROP TABLE IF EXISTS answer_comments;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

-- USERS
CREATE TABLE `users` (
  `userid` INT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `firstname` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- QUESTIONS
CREATE TABLE `questions` (
  `questionid` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(20) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `tag` VARCHAR(50),
  `createdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `views` INT DEFAULT 0,
  PRIMARY KEY (`questionid`),
  KEY (`userid`),
  CONSTRAINT `fk_q_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ANSWERS
CREATE TABLE `answers` (
  `answerid` INT(20) NOT NULL AUTO_INCREMENT,
  `userid` INT(20) NOT NULL,
  `questionid` INT(11) NOT NULL,
  `answer` VARCHAR(200) NOT NULL,
  `createdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `views` INT DEFAULT 0,
  `edited` TINYINT DEFAULT 0,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`answerid`),
  KEY (`userid`),
  KEY (`questionid`),
  CONSTRAINT `fk_a_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk_a_questionid` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ANSWER COMMENTS
CREATE TABLE `answer_comments` (
  `commentid` INT(11) NOT NULL AUTO_INCREMENT,
  `answerid` INT(11) NOT NULL,
  `userid` INT(11),
  `comment` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`),
  KEY (`answerid`),
  KEY (`userid`),
  CONSTRAINT `fk_c_answerid` FOREIGN KEY (`answerid`) REFERENCES `answers` (`answerid`) ON DELETE CASCADE,
  CONSTRAINT `fk_c_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ANSWER VOTES
CREATE TABLE `answer_votes` (
  `voteid` INT(11) NOT NULL AUTO_INCREMENT,
  `answerid` INT(11) NOT NULL,
  `userid` INT(11),
  `vote` TINYINT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voteid`),
  UNIQUE KEY `unique_vote` (`answerid`, `userid`),
  KEY (`userid`),
  CONSTRAINT `fk_v_answerid` FOREIGN KEY (`answerid`) REFERENCES `answers` (`answerid`) ON DELETE CASCADE,
  CONSTRAINT `fk_v_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DATA INSERTS
INSERT INTO `users` (`userid`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'group1', 'Evangadi', 'forum', 'evangadiforum@email.com', '$2b$10$.PKTgBWINz1yU/Od6aVuFepBOv4jle89lVRhfQv5BykEUaXFIto26');
