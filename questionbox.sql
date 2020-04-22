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
-- Table structure for table `questionbox_answers`
--

DROP TABLE IF EXISTS `questionbox_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text,
  `views` int(11) DEFAULT NULL,
  `answered_on` datetime DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `questionbox_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questionbox_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_answers`
--

LOCK TABLES `questionbox_answers` WRITE;
/*!40000 ALTER TABLE `questionbox_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_answerupvotes`
--

DROP TABLE IF EXISTS `questionbox_answerupvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_answerupvotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  CONSTRAINT `questionbox_answerupvotes_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `questionbox_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_appusers`
--

LOCK TABLES `questionbox_appusers` WRITE;
/*!40000 ALTER TABLE `questionbox_appusers` DISABLE KEYS */;
INSERT INTO `questionbox_appusers` VALUES ('aka',10,'$2b$10$CZhiKEt.W8UzBLscMX5E4OmMM5hydJW0mZrgdgGJ5mvUfd1DYpdc2','hey'),('akash',12,'$2b$10$0i5T3kemLe2NnTxGC0XuL.Sf8wJ4OuTGOIKGMhMGjPLUfDuzDIhwy','new');
/*!40000 ALTER TABLE `questionbox_appusers` ENABLE KEYS */;
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
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asked_by_id` (`asked_by_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `questionbox_questions_ibfk_1` FOREIGN KEY (`asked_by_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_questions_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `questionbox_topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_questions`
--

LOCK TABLES `questionbox_questions` WRITE;
/*!40000 ALTER TABLE `questionbox_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_questionupvotes`
--

DROP TABLE IF EXISTS `questionbox_questionupvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_questionupvotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `questionbox_topicfollows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `questionbox_appusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionbox_topicfollows_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `questionbox_topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_topicfollows`
--

LOCK TABLES `questionbox_topicfollows` WRITE;
/*!40000 ALTER TABLE `questionbox_topicfollows` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionbox_topicfollows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbox_topics`
--

DROP TABLE IF EXISTS `questionbox_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbox_topics` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbox_topics`
--

LOCK TABLES `questionbox_topics` WRITE;
/*!40000 ALTER TABLE `questionbox_topics` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 11:44:26
