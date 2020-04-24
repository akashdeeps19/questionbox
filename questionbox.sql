-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: questionbox
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
  `upvotes` int(11) DEFAULT '0',
  `downvotes` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `questionbox_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answers`
--

LOCK TABLES `questionbox_answers` WRITE;
/*!40000 ALTER TABLE `questionbox_answers` DISABLE KEYS */;
INSERT INTO `questionbox_answers` VALUES (1,'good ques',0,'2020-04-23 19:52:06',6,13,0,0);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_password` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_appusers`
--

LOCK TABLES `questionbox_appusers` WRITE;
/*!40000 ALTER TABLE `questionbox_appusers` DISABLE KEYS */;
INSERT INTO `questionbox_appusers` VALUES ('aka',10,'$2b$10$CZhiKEt.W8UzBLscMX5E4OmMM5hydJW0mZrgdgGJ5mvUfd1DYpdc2','hey'),('akash',13,'$2b$10$0J.Wm9UhcOOtwJ2c1dH7ju50bmvBISPuZV2t8nE9jUM.rAAM5yhJK',NULL);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
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
  `upvotes` int(11) DEFAULT '0',
  `asked_by_id` int(11) DEFAULT NULL,
  `downvotes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `asked_by_id` (`asked_by_id`),
  CONSTRAINT `questionbox_questions_ibfk_3` FOREIGN KEY (`asked_by_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questions`
--

LOCK TABLES `questionbox_questions` WRITE;
/*!40000 ALTER TABLE `questionbox_questions` DISABLE KEYS */;
INSERT INTO `questionbox_questions` VALUES (3,'what is good?',8,0,13,0),(4,'what is c?',0,0,13,0),(5,'where is ram?',1,0,10,0),(6,'where is physics?',3,0,10,0);
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
INSERT INTO `questionbox_questiontopics` VALUES (1,3);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) DEFAULT NULL,
  `follows_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
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
/*!40000 ALTER TABLE `questionbox_userfollows` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50003 DROP PROCEDURE IF EXISTS `get_question` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_question`(id_ int(11), inc boolean)
begin
SELECT views into @vw from questionbox_questions where id = id_;
set @vw = if(inc,@vw+1,@vw); update questionbox_questions set views = @vw where id = id_;
select * from questionbox_questions where id = id_;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 21:00:47
