-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: questionbox
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `answer_downvotes`
--

DROP TABLE IF EXISTS `answer_downvotes`;
/*!50001 DROP VIEW IF EXISTS `answer_downvotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `answer_downvotes` AS SELECT 
 1 AS `id`,
 1 AS `answer`,
 1 AS `views`,
 1 AS `answered_on`,
 1 AS `question_id`,
 1 AS `user_id`,
 1 AS `downvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `answer_upvotes`
--

DROP TABLE IF EXISTS `answer_upvotes`;
/*!50001 DROP VIEW IF EXISTS `answer_upvotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `answer_upvotes` AS SELECT 
 1 AS `id`,
 1 AS `answer`,
 1 AS `views`,
 1 AS `answered_on`,
 1 AS `question_id`,
 1 AS `user_id`,
 1 AS `upvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `answers_public`
--

DROP TABLE IF EXISTS `answers_public`;
/*!50001 DROP VIEW IF EXISTS `answers_public`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `answers_public` AS SELECT 
 1 AS `answer`,
 1 AS `question_id`,
 1 AS `user_name`,
 1 AS `upvotes`,
 1 AS `downvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `question_downvotes`
--

DROP TABLE IF EXISTS `question_downvotes`;
/*!50001 DROP VIEW IF EXISTS `question_downvotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `question_downvotes` AS SELECT 
 1 AS `id`,
 1 AS `question`,
 1 AS `views`,
 1 AS `asked_by_id`,
 1 AS `downvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `question_upvotes`
--

DROP TABLE IF EXISTS `question_upvotes`;
/*!50001 DROP VIEW IF EXISTS `question_upvotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `question_upvotes` AS SELECT 
 1 AS `id`,
 1 AS `question`,
 1 AS `views`,
 1 AS `asked_by_id`,
 1 AS `upvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `questionbox_answercomments`
--

DROP TABLE IF EXISTS `questionbox_answercomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answercomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `commented_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionbox_answercomments_ibfk_1` (`answer_id`),
  KEY `questionbox_answercomments_ibfk_2` (`user_id`),
  CONSTRAINT `questionbox_answercomments_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `questionbox_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answercomments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answercomments`
--

LOCK TABLES `questionbox_answercomments` WRITE;
/*!40000 ALTER TABLE `questionbox_answercomments` DISABLE KEYS */;
INSERT INTO `questionbox_answercomments` VALUES (1,'nicee','2020-04-24 12:30:52',1,13);
/*!40000 ALTER TABLE `questionbox_answercomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_answerdownvotes`
--

DROP TABLE IF EXISTS `questionbox_answerdownvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answerdownvotes` (
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`answer_id`),
  KEY `questionbox_answerdownvotes_ibfk_2` (`answer_id`),
  CONSTRAINT `questionbox_answerdownvotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answerdownvotes_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `questionbox_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answerdownvotes`
--

LOCK TABLES `questionbox_answerdownvotes` WRITE;
/*!40000 ALTER TABLE `questionbox_answerdownvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_answerdownvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_answers`
--

DROP TABLE IF EXISTS `questionbox_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `answered_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `questionbox_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answers`
--

LOCK TABLES `questionbox_answers` WRITE;
/*!40000 ALTER TABLE `questionbox_answers` DISABLE KEYS */;
INSERT INTO `questionbox_answers` VALUES (1,'good ques',0,'2020-04-23 19:52:06',6,13),(6,'this is rom',0,'2020-06-05 15:26:44',8,15),(7,'this is rom',0,'2020-06-05 15:26:54',6,15),(8,'good or bad ques',0,'2020-06-11 16:06:57',3,15),(9,'normaliztion is a good thing',0,'2020-06-12 10:46:16',19,15);
/*!40000 ALTER TABLE `questionbox_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_answerupvotes`
--

DROP TABLE IF EXISTS `questionbox_answerupvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answerupvotes` (
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`answer_id`),
  KEY `questionbox_answerupvotes_ibfk_2` (`answer_id`),
  CONSTRAINT `questionbox_answerupvotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answerupvotes_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `questionbox_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answerupvotes`
--

LOCK TABLES `questionbox_answerupvotes` WRITE;
/*!40000 ALTER TABLE `questionbox_answerupvotes` DISABLE KEYS */;
INSERT INTO `questionbox_answerupvotes` VALUES (15,1),(16,1),(16,6),(15,8);
/*!40000 ALTER TABLE `questionbox_answerupvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_appusers`
--

DROP TABLE IF EXISTS `questionbox_appusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_appusers` (
  `user_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_password` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_appusers`
--

LOCK TABLES `questionbox_appusers` WRITE;
/*!40000 ALTER TABLE `questionbox_appusers` DISABLE KEYS */;
INSERT INTO `questionbox_appusers` VALUES ('ak','akas','h','as@g.com',15,'$2b$10$9pDEXeVOdcjNBiFYNLbMR.Z7YFO/NKQ.MZ/MwMvqWNQrCKr.K59b6','nicee'),('ak23','aka','sh','aksh@g.com',16,'$2b$10$knmJfagONJQxysgJ3v9OJe0D6d4XZnDTHu801ZP0hqPV4G2WnFKzC','good guy'),('gg','g','g','ggsh@g.com',17,'$2b$10$nWnw3K47xGIkoHoLD5isBeD8trVenhCTxqCiw3d9AOyCoTIHua0k.','good guy');
/*!40000 ALTER TABLE `questionbox_appusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questioncomments`
--

DROP TABLE IF EXISTS `questionbox_questioncomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questioncomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `commented_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionbox_questioncomments_ibfk_1` (`question_id`),
  KEY `questionbox_questioncomments_ibfk_2` (`user_id`),
  CONSTRAINT `questionbox_questioncomments_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questioncomments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questioncomments`
--

LOCK TABLES `questionbox_questioncomments` WRITE;
/*!40000 ALTER TABLE `questionbox_questioncomments` DISABLE KEYS */;
INSERT INTO `questionbox_questioncomments` VALUES (1,'gr8','2020-04-24 12:44:36',3,13);
/*!40000 ALTER TABLE `questionbox_questioncomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questiondownvotes`
--

DROP TABLE IF EXISTS `questionbox_questiondownvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questiondownvotes` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `questionbox_questiondownvotes_ibfk_2` (`question_id`),
  CONSTRAINT `questionbox_questiondownvotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questiondownvotes_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questiondownvotes`
--

LOCK TABLES `questionbox_questiondownvotes` WRITE;
/*!40000 ALTER TABLE `questionbox_questiondownvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_questiondownvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questionfollows`
--

DROP TABLE IF EXISTS `questionbox_questionfollows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questionfollows` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `questionbox_questionfollows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questionfollows_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questionfollows`
--

LOCK TABLES `questionbox_questionfollows` WRITE;
/*!40000 ALTER TABLE `questionbox_questionfollows` DISABLE KEYS */;
INSERT INTO `questionbox_questionfollows` VALUES (14,3);
/*!40000 ALTER TABLE `questionbox_questionfollows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questions`
--

DROP TABLE IF EXISTS `questionbox_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `views` int(11) DEFAULT '0',
  `asked_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asked_by_id` (`asked_by_id`),
  CONSTRAINT `questionbox_questions_ibfk_3` FOREIGN KEY (`asked_by_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questions`
--

LOCK TABLES `questionbox_questions` WRITE;
/*!40000 ALTER TABLE `questionbox_questions` DISABLE KEYS */;
INSERT INTO `questionbox_questions` VALUES (3,'what is good?',12,13),(4,'what is c?',0,13),(5,'where is ram?',1,10),(6,'where is physics?',4,10),(7,'what is this',3,15),(8,'what is this thing',0,15),(9,'what is this thing',0,15),(10,'what is this thing',0,15),(11,'what is this thing',0,15),(12,'what is rom',0,15),(13,'what is rom',0,15),(14,'what is rom',0,15),(15,'what is rom',0,15),(16,'',0,15),(17,'what is db',0,15),(18,'',0,15),(19,'what is normalization',0,15);
/*!40000 ALTER TABLE `questionbox_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questiontopics`
--

DROP TABLE IF EXISTS `questionbox_questiontopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questiontopics` (
  `topic_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`question_id`),
  KEY `questionbox_questiontopics_ibfk_2` (`question_id`),
  CONSTRAINT `questionbox_questiontopics_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `questionbox_topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questiontopics_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questiontopics`
--

LOCK TABLES `questionbox_questiontopics` WRITE;
/*!40000 ALTER TABLE `questionbox_questiontopics` DISABLE KEYS */;
INSERT INTO `questionbox_questiontopics` VALUES (1,3),(1,7),(2,7),(1,8),(2,8),(1,9),(2,9),(1,10),(2,10),(1,11),(2,11),(1,12),(1,13),(1,14),(1,15),(1,16),(2,16),(1,17),(2,17),(1,18),(2,18),(1,19),(2,19);
/*!40000 ALTER TABLE `questionbox_questiontopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questionupvotes`
--

DROP TABLE IF EXISTS `questionbox_questionupvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questionupvotes` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `questionbox_questionupvotes_ibfk_2` (`question_id`),
  CONSTRAINT `questionbox_questionupvotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questionupvotes_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questionupvotes`
--

LOCK TABLES `questionbox_questionupvotes` WRITE;
/*!40000 ALTER TABLE `questionbox_questionupvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_questionupvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_topicfollows`
--

DROP TABLE IF EXISTS `questionbox_topicfollows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_topicfollows` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `fk_questionbox_topicfollows_2_idx` (`user_id`),
  CONSTRAINT `fk_questionbox_topicfollows_1` FOREIGN KEY (`topic_id`) REFERENCES `questionbox_topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_questionbox_topicfollows_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_topicfollows`
--

LOCK TABLES `questionbox_topicfollows` WRITE;
/*!40000 ALTER TABLE `questionbox_topicfollows` DISABLE KEYS */;
INSERT INTO `questionbox_topicfollows` VALUES (1,14);
/*!40000 ALTER TABLE `questionbox_topicfollows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_topics`
--

DROP TABLE IF EXISTS `questionbox_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_topics` (
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_topics`
--

LOCK TABLES `questionbox_topics` WRITE;
/*!40000 ALTER TABLE `questionbox_topics` DISABLE KEYS */;
INSERT INTO `questionbox_topics` VALUES ('computer',1),('science',2);
/*!40000 ALTER TABLE `questionbox_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_userfollows`
--

DROP TABLE IF EXISTS `questionbox_userfollows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_userfollows` (
  `follower_id` int(11) NOT NULL,
  `follows_id` int(11) NOT NULL,
  PRIMARY KEY (`follower_id`,`follows_id`),
  KEY `follower_id` (`follower_id`),
  KEY `follows_id` (`follows_id`),
  CONSTRAINT `questionbox_userfollows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_userfollows_ibfk_2` FOREIGN KEY (`follows_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_userfollows`
--

LOCK TABLES `questionbox_userfollows` WRITE;
/*!40000 ALTER TABLE `questionbox_userfollows` DISABLE KEYS */;
INSERT INTO `questionbox_userfollows` VALUES (14,10),(15,16),(15,17),(17,16);
/*!40000 ALTER TABLE `questionbox_userfollows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `questions_public`
--

DROP TABLE IF EXISTS `questions_public`;
/*!50001 DROP VIEW IF EXISTS `questions_public`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `questions_public` AS SELECT 
 1 AS `question`,
 1 AS `user_name`,
 1 AS `upvotes`,
 1 AS `downvotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_followers`
--

DROP TABLE IF EXISTS `user_followers`;
/*!50001 DROP VIEW IF EXISTS `user_followers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_followers` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `id`,
 1 AS `user_password`,
 1 AS `bio`,
 1 AS `followers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_following`
--

DROP TABLE IF EXISTS `user_following`;
/*!50001 DROP VIEW IF EXISTS `user_following`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_following` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `id`,
 1 AS `user_password`,
 1 AS `bio`,
 1 AS `following`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `users_public`
--

DROP TABLE IF EXISTS `users_public`;
/*!50001 DROP VIEW IF EXISTS `users_public`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_public` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `bio`,
 1 AS `following`,
 1 AS `followers`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'questionbox'
--
/*!50003 DROP PROCEDURE IF EXISTS `answer_downvote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_downvote`(id_ int(11))
begin select downvotes into @u from questionbox_answers where id = id_; update questionbox_answers set downvotes = @u + 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `answer_downvote_cancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_downvote_cancel`(id_ int(11))
begin select downvotes into @u from questionbox_answers where id = id_; update questionbox_answers set downvotes = @u - 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `answer_upvote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_upvote`(id_ int(11))
begin select upvotes into @u from questionbox_answers where id = id_; update questionbox_answers set upvotes = @u + 1 where id = id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `answer_upvote_cancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_upvote_cancel`(id_ int(11))
begin select upvotes into @u from questionbox_answers where id = id_; update questionbox_answers set upvotes = @u - 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_following_questions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_questions`(u_id int(11))
begin
select qq.* from questionbox_questionfollows qqf, questionbox_questions qq
where qqf.user_id = u_id and qqf.question_id = qq.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_following_topics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_topics`(u_id int(11))
begin
select qt.* from questionbox_topicfollows qtf, questionbox_topics qt
where qtf.user_id = u_id and qtf.topic_id = qt.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_question` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_question`(id_ int(11), inc boolean)
begin
SELECT views into @vw from questionbox_questions where id = id_;
set @vw = if(inc,@vw+1,@vw); update questionbox_questions set views = @vw where id = id_;
select * from questionbox_questions where id = id_;
select qt.name from questionbox_topics qt, questionbox_questiontopics qqt
where qqt.question_id = id_ and qqt.topic_id = qt.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_question_followers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_question_followers`(q_id int(11))
begin
select qu.* from questionbox_questionfollows qqf, questionbox_appusers qu
where qqf.question_id = q_id and qqf.user_id = qu.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_topic_followers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_topic_followers`(t_id int(11))
begin
select qu.* from questionbox_topicfollows qtf, questionbox_appusers qu
where qtf.topic_id = t_id and qtf.user_id = qu.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(name varchar(255))
begin select * from questionbox_appusers where user_name like name;end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_followers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_followers`(u_id int(11))
begin
select a.* from questionbox_userfollows qu, questionbox_appusers a
where qu.follows_id = u_id and a.id = qu.follower_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_following` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_following`(u_id int(11))
begin
select a.* from questionbox_userfollows qu, questionbox_appusers a
where qu.follower_id = u_id and a.id = qu.follows_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `question_downvote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_downvote`(id_ int(11))
begin select downvotes into @u from questionbox_questions where id = id_; update questionbox_questions set downvotes = @u + 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `question_downvote_cancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_downvote_cancel`(id_ int(11))
begin select downvotes into @u from questionbox_questions where id = id_; update questionbox_questions set downvotes = @u - 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `question_upvote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_upvote`(id_ int(11))
begin select upvotes into @u from questionbox_questions where id = id_; update questionbox_questions set upvotes = @u + 1 where id = id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `question_upvote_cancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_upvote_cancel`(id_ int(11))
begin select upvotes into @u from questionbox_questions where id = id_; update questionbox_questions set upvotes = @u - 1 where id= id_; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upvote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upvote`(q_id int(11), u_id int(11), table_ varchar(255), upvotes_table varchar(255))
begin select upvotes into @u from table_ where id = q_id; set @u = @u + 1; insert into upvotes_table values(u_id, q_id); update table_ set upvotes = @u where id = q_id; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `answer_downvotes`
--

/*!50001 DROP VIEW IF EXISTS `answer_downvotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `answer_downvotes` AS select `qa`.`id` AS `id`,`qa`.`answer` AS `answer`,`qa`.`views` AS `views`,`qa`.`answered_on` AS `answered_on`,`qa`.`question_id` AS `question_id`,`qa`.`user_id` AS `user_id`,count(`qad`.`answer_id`) AS `downvotes` from (`questionbox_answers` `qa` left join `questionbox_answerdownvotes` `qad` on((`qa`.`id` = `qad`.`answer_id`))) group by `qa`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `answer_upvotes`
--

/*!50001 DROP VIEW IF EXISTS `answer_upvotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `answer_upvotes` AS select `qa`.`id` AS `id`,`qa`.`answer` AS `answer`,`qa`.`views` AS `views`,`qa`.`answered_on` AS `answered_on`,`qa`.`question_id` AS `question_id`,`qa`.`user_id` AS `user_id`,count(`qau`.`answer_id`) AS `upvotes` from (`questionbox_answers` `qa` left join `questionbox_answerupvotes` `qau` on((`qa`.`id` = `qau`.`answer_id`))) group by `qa`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `answers_public`
--

/*!50001 DROP VIEW IF EXISTS `answers_public`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `answers_public` AS select `qa`.`answer` AS `answer`,`qa`.`question_id` AS `question_id`,`qu`.`user_name` AS `user_name`,`au`.`upvotes` AS `upvotes`,`ad`.`downvotes` AS `downvotes` from (((`questionbox_answers` `qa` join `questionbox_appusers` `qu`) join `answer_upvotes` `au`) join `answer_downvotes` `ad`) where ((`qa`.`id` = `au`.`id`) and (`qa`.`id` = `ad`.`id`) and (`qu`.`id` = `qa`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `question_downvotes`
--

/*!50001 DROP VIEW IF EXISTS `question_downvotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `question_downvotes` AS select `qq`.`id` AS `id`,`qq`.`question` AS `question`,`qq`.`views` AS `views`,`qq`.`asked_by_id` AS `asked_by_id`,count(`qqd`.`question_id`) AS `downvotes` from (`questionbox_questions` `qq` left join `questionbox_questiondownvotes` `qqd` on((`qq`.`id` = `qqd`.`question_id`))) group by `qq`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `question_upvotes`
--

/*!50001 DROP VIEW IF EXISTS `question_upvotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `question_upvotes` AS select `qq`.`id` AS `id`,`qq`.`question` AS `question`,`qq`.`views` AS `views`,`qq`.`asked_by_id` AS `asked_by_id`,count(`qqu`.`question_id`) AS `upvotes` from (`questionbox_questions` `qq` left join `questionbox_questionupvotes` `qqu` on((`qq`.`id` = `qqu`.`question_id`))) group by `qq`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `questions_public`
--

/*!50001 DROP VIEW IF EXISTS `questions_public`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `questions_public` AS select `qq`.`question` AS `question`,`qu`.`user_name` AS `user_name`,`u`.`upvotes` AS `upvotes`,`qd`.`downvotes` AS `downvotes` from (((`questionbox_questions` `qq` join `questionbox_appusers` `qu`) join `question_upvotes` `u`) join `question_downvotes` `qd`) where ((`qq`.`id` = `u`.`id`) and (`qq`.`id` = `qd`.`id`) and (`qu`.`id` = `qq`.`asked_by_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_followers`
--

/*!50001 DROP VIEW IF EXISTS `user_followers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_followers` AS select `qu`.`user_name` AS `user_name`,`qu`.`first_name` AS `first_name`,`qu`.`last_name` AS `last_name`,`qu`.`email` AS `email`,`qu`.`id` AS `id`,`qu`.`user_password` AS `user_password`,`qu`.`bio` AS `bio`,count(`quf`.`follower_id`) AS `followers` from (`questionbox_appusers` `qu` left join `questionbox_userfollows` `quf` on((`quf`.`follows_id` = `qu`.`id`))) group by `qu`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_following`
--

/*!50001 DROP VIEW IF EXISTS `user_following`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_following` AS select `qu`.`user_name` AS `user_name`,`qu`.`first_name` AS `first_name`,`qu`.`last_name` AS `last_name`,`qu`.`email` AS `email`,`qu`.`id` AS `id`,`qu`.`user_password` AS `user_password`,`qu`.`bio` AS `bio`,count(`quf`.`follows_id`) AS `following` from (`questionbox_appusers` `qu` left join `questionbox_userfollows` `quf` on((`quf`.`follower_id` = `qu`.`id`))) group by `qu`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_public`
--

/*!50001 DROP VIEW IF EXISTS `users_public`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_public` AS select `ufg`.`user_name` AS `user_name`,`ufg`.`first_name` AS `first_name`,`ufg`.`last_name` AS `last_name`,`ufg`.`bio` AS `bio`,`ufg`.`following` AS `following`,`ufr`.`followers` AS `followers` from (`user_following` `ufg` join `user_followers` `ufr`) where (`ufg`.`id` = `ufr`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 11:27:07
