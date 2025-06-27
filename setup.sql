-- 🚀 Cleaned SQL Dump for Railway MySQL

-- TABLE: users
CREATE TABLE `users` (
  `userid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`userid`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'group1', 'Evangadi', 'forum', 'evangadiforum@email.com', '$2b$10$.PKTgBWINz1yU/Od6aVuFepBOv4jle89lVRhfQv5BykEUaXFIto26'),
(2, 'admin', 'Gemechis', 'mulisa', 'gemechisdaba27@gmail.com', '$2b$10$5kJOqkfpCzw2aCON7Xilg.w604HS0exKe63Tooju0QvRMBYHrohBC'),
(3, 'gmy', 'Gemechis', 'mulisa', 'gemechisdaba@gmail.com', '$2b$10$OhcQO/M7nd1pu8mIFr6MDetEhA3Hj4rbvajrz3K6feMzuL.aRFWgy'),
(4, 'gemy', 'Gemechis', 'mulisa', 'gemechisdaba00@gmail.com', '$2b$10$.uQTrDc1RPBk48OWhmUcOOtWXZj2BjqLvLuSXA/nmztxoSw8UTt4S'),
(5, 'Abebe', 'abebe', 'kebede', 'abebe@gmail.com', '$2b$10$cPLSrz2FcLWOysfNgqr5FeDM56YjP7RKxVgCU4QTef/Gr4ulTRIPa'),
(6, 'abduy', 'abdi', 'M', 'Abdi@gmail.com', '$2b$10$Ura6A6R1.7m3xuNFNidVMOomFShRdaDDJO64Gtcb4YdJUzlHzZIM.'),
(7, 'Abbee', 'Abbe', 'M', 'Abbe@gmail.com', '$2b$10$Qy9uthyhgnOgeYGw1Dmp7uDXwZTzfN4azMzE.X/hVq316DSrwrssG'),
(8, 'rody', 'rodas', 'wondwesen', 'rodaswondwesen@gmail.com', '$2b$10$2L5Rc5K94oyph/9MXXiOxuzioutaxQ5kkZlhKSUQZKy05b7xMHoeC'),
(9, 'bbboy', 'baby', 'boy', 'babyboy@gmail.com', '$2b$10$l42.NPIhqhdeGzm/CKf9/utO7mQI6Mmx6mVkfrjyKBLzr92dtXi2y');

-- TABLE: questions
CREATE TABLE `questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`questionid`),
  KEY `userid` (`userid`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `questions` (`questionid`, `userid`, `title`, `description`, `tag`, `createdate`, `views`) VALUES
(1, 1, 'first Question', 'This is first Question', 'testing-1', '2025-06-11 12:02:22', 0),
(2, 1, 'Second Question', 'This is second Question', 'testing-2', '2025-06-11 12:05:00', 0),
(3, 6, 'what is React?', 'Give me discription about react', '', '2025-06-14 19:53:47', 0),
(4, 7, 'what is x', 'x statejknjkjn kj;k;lkm;', '', '2025-06-15 18:46:38', 0),
(5, 8, 'about self', 'what is your name', '', '2025-06-16 15:59:40', 0),
(6, 9, 'react', 'what is react', 'React', '2025-06-26 08:04:34', 2);

-- TABLE: answers
CREATE TABLE `answers` (
  `answerid` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `questionid` int(11) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) DEFAULT '0',
  `edited` tinyint(1) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answerid`),
  KEY `userid` (`userid`),
  KEY `questionid` (`questionid`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `answers` (`answerid`, `userid`, `questionid`, `answer`, `createdate`, `views`, `edited`, `updated_at`) VALUES
(1, 1, 2, 'second Question is get an answer', '2025-06-11 12:28:25', 0, 0, NULL),
(2, 6, 3, 'React is a JavaScript library for building user interfaces (UIs), especially for SPAs.', '2025-06-14 19:54:56', 0, 0, NULL),
(3, 6, 3, 'UI is broken into reusable, self-contained components.', '2025-06-14 19:56:37', 0, 0, NULL),
(4, 7, 4, 'x is hkhkljknjbkln;lj', '2025-06-15 18:47:00', 0, 0, NULL),
(5, 7, 4, 'second answer', '2025-06-15 18:50:06', 0, 0, NULL),
(6, 7, 4, 'third answer', '2025-06-15 18:52:07', 0, 0, NULL),
(7, 8, 1, 'yeah this fist question', '2025-06-16 16:00:44', 0, 0, NULL),
(8, 8, 1, 'first question', '2025-06-16 16:01:20', 0, 0, NULL),
(9, 8, 1, 'hellow there', '2025-06-16 17:19:55', 0, 0, NULL);

-- TABLE: answer_comments
CREATE TABLE `answer_comments` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `answerid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`),
  KEY `answerid` (`answerid`),
  KEY `userid` (`userid`),
  CONSTRAINT `answer_comments_ibfk_1` FOREIGN KEY (`answerid`) REFERENCES `answers` (`answerid`) ON DELETE CASCADE,
  CONSTRAINT `answer_comments_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TABLE: answer_votes
CREATE TABLE `answer_votes` (
  `voteid` int(11) NOT NULL AUTO_INCREMENT,
  `answerid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `vote` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voteid`),
  UNIQUE KEY `unique_vote` (`answerid`, `userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `answer_votes_ibfk_1` FOREIGN KEY (`answerid`) REFERENCES `answers` (`answerid`) ON DELETE CASCADE,
  CONSTRAINT `answer_votes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
