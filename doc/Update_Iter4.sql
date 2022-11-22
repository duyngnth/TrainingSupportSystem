-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `ass_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ass_body` text,
  `eval_weight` int DEFAULT NULL,
  `is_team_work` bit(1) DEFAULT NULL,
  `is_ongoing` bit(1) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ass_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,4,'Progress Test 1','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(2,5,'Progress Test 1','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(3,1,'Assignment','',15,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(4,2,'Lab','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `trainee_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`class_id`,`trainee_id`,`schedule_id`),
  KEY `class_id` (`class_id`),
  KEY `trainee_id` (`trainee_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`trainee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (2,12,19,_binary '','',8,'2022-11-01 09:26:49',NULL,NULL),(2,12,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,12,23,_binary '','',8,'2022-11-03 11:47:55',NULL,NULL),(2,13,19,_binary '','',8,'2022-11-01 09:26:49',NULL,NULL),(2,13,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,13,23,_binary '','',8,'2022-11-03 11:47:55',NULL,NULL),(2,14,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,14,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,14,23,_binary '','',8,'2022-11-03 11:47:55',NULL,NULL),(2,15,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,15,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,15,23,_binary '\0','Test',8,'2022-11-03 11:47:55',NULL,NULL),(2,16,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,16,22,_binary '\0','',8,'2022-11-02 20:59:15',NULL,NULL),(2,16,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,17,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,17,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,17,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,18,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,18,22,_binary '\0','',8,'2022-11-02 20:59:15',NULL,NULL),(2,18,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,19,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,19,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,19,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,20,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,20,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,20,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,21,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,21,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,21,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,22,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,22,22,_binary '\0','',8,'2022-11-02 20:59:15',NULL,NULL),(2,22,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,23,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,23,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,23,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,24,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,24,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,24,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,25,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,25,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,25,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL),(2,26,19,_binary '\0','',8,'2022-11-01 09:26:49',NULL,NULL),(2,26,22,_binary '','',8,'2022-11-02 20:59:15',NULL,NULL),(2,26,23,_binary '\0','',8,'2022-11-03 11:47:55',NULL,NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_code` varchar(20) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  `term_id` int DEFAULT NULL,
  `supporter_id` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`class_id`),
  KEY `subject_id` (`subject_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `term_id` (`term_id`),
  KEY `supporter_id` (`supporter_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_ibfk_3` FOREIGN KEY (`supporter_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_ibfk_4` FOREIGN KEY (`term_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SE1627-NET',5,7,NULL,NULL,_binary '',''),(2,'SE1627-NET',1,3,NULL,8,_binary '',''),(3,'SE1624',2,1,NULL,8,_binary '',''),(4,'SE1628',3,9,NULL,NULL,_binary '',''),(5,'SE1623-JS',6,1,NULL,NULL,_binary '','');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_setting`
--

DROP TABLE IF EXISTS `class_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `class_id` (`class_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `class_setting_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_setting_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_setting`
--

LOCK TABLES `class_setting` WRITE;
/*!40000 ALTER TABLE `class_setting` DISABLE KEYS */;
INSERT INTO `class_setting` VALUES (1,34,'Class Setting 1.1','AAAA','',_binary '\0','',1),(2,34,'Class Setting 1.2','help','',_binary '','',1),(3,34,'Class Setting 1.3','','',_binary '','',2),(4,35,'Class Setting 2.1','','',_binary '','',2),(5,35,'Class Setting 2.2','','',_binary '','',3),(6,35,'Class Setting 2.3','','',_binary '','',3),(7,36,'Class Setting 3.1','','',_binary '','',4),(8,36,'Class Setting 3.2','','',_binary '','',4),(9,36,'Class Setting 3.3','','',_binary '','',5),(10,37,'Class Setting 4.1','','',_binary '','',5);
/*!40000 ALTER TABLE `class_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_user` (
  `user_id` int NOT NULL,
  `class_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `note` text,
  `dropout_date` date DEFAULT NULL,
  `ongoing_eval` int DEFAULT NULL,
  `final_eval` int DEFAULT NULL,
  `topic_eval` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_user_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
INSERT INTO `class_user` VALUES (12,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,2,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,3,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval_criteria`
--

DROP TABLE IF EXISTS `eval_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eval_criteria` (
  `criteria_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `criteria_name` varchar(50) DEFAULT NULL,
  `is_team_eval` bit(1) DEFAULT NULL,
  `eval_weight` int DEFAULT NULL,
  `max_loc` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`criteria_id`),
  KEY `ass_id` (`ass_id`),
  KEY `milestone_id` (`milestone_id`),
  CONSTRAINT `eval_criteria_ibfk_1` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`),
  CONSTRAINT `eval_criteria_ibfk_2` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval_criteria`
--

LOCK TABLES `eval_criteria` WRITE;
/*!40000 ALTER TABLE `eval_criteria` DISABLE KEYS */;
INSERT INTO `eval_criteria` VALUES (1,2,1,'Hi',_binary '\0',2,0,_binary '\0',NULL,NULL,NULL,4,'2022-10-17 10:37:09'),(2,3,2,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(3,3,3,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(4,3,4,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(5,3,5,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(6,4,6,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(7,1,1,'test',_binary '',2,200,_binary '',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `eval_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `author_id` int NOT NULL,
  `assignee_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type_id` int NOT NULL,
  `status_id` int NOT NULL,
  `extra_labels` varchar(50) DEFAULT NULL,
  `description` text,
  `linked_ids` text,
  `gitlab_url` text,
  `is_close` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `team_id` (`team_id`),
  KEY `author_id` (`author_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `issue_ibfk_3` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `issue_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `class_setting` (`setting_id`),
  CONSTRAINT `issue_ibfk_5` FOREIGN KEY (`status_id`) REFERENCES `class_setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_eval`
--

DROP TABLE IF EXISTS `loc_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loc_eval` (
  `loc_eval_id` int NOT NULL AUTO_INCREMENT,
  `complexity_id` int NOT NULL,
  `quality_id` int NOT NULL,
  `converted_loc` int DEFAULT NULL,
  `is_late_submit` bit(1) DEFAULT NULL,
  `comment` text,
  `new_milestone_id` int NOT NULL,
  `new_complexity_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`loc_eval_id`),
  KEY `complexity_id` (`complexity_id`),
  KEY `quality_id` (`quality_id`),
  KEY `new_milestone_id` (`new_milestone_id`),
  KEY `new_complexity_id` (`new_complexity_id`),
  CONSTRAINT `loc_eval_ibfk_1` FOREIGN KEY (`complexity_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `loc_eval_ibfk_2` FOREIGN KEY (`quality_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `loc_eval_ibfk_3` FOREIGN KEY (`new_milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `loc_eval_ibfk_4` FOREIGN KEY (`new_complexity_id`) REFERENCES `tracking` (`tracking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_eval`
--

LOCK TABLES `loc_eval` WRITE;
/*!40000 ALTER TABLE `loc_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `loc_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_eval`
--

DROP TABLE IF EXISTS `member_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_eval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evaluation_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `total_loc` int DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluation_id` (`evaluation_id`),
  KEY `criteria_id` (`criteria_id`),
  CONSTRAINT `member_eval_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `milestone_eval` (`evaluation_id`),
  CONSTRAINT `member_eval_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `eval_criteria` (`criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_eval`
--

LOCK TABLES `member_eval` WRITE;
/*!40000 ALTER TABLE `member_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NOT NULL,
  `class_id` int NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ass_body` text,
  `description` text,
  `status` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  KEY `ass_id` (`ass_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `milestone_ibfk_1` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`),
  CONSTRAINT `milestone_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
INSERT INTO `milestone` VALUES (1,1,1,'2022-10-05','2022-10-07','','','',_binary '',NULL,NULL,NULL,NULL),(2,3,2,'2022-09-12','2022-09-25','Iter 1','','',_binary '',NULL,NULL,NULL,NULL),(3,3,2,'2022-09-26','2022-10-09','Iter 2','','',_binary '',NULL,NULL,NULL,NULL),(4,3,2,'2022-10-10','2022-10-23','Iter 3','','',_binary '',NULL,NULL,NULL,NULL),(5,3,2,'2022-10-24','2022-11-06','Iter 4','','',_binary '',NULL,NULL,NULL,NULL),(6,4,3,'2022-10-13','2022-10-16','','','',_binary '',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone_eval`
--

DROP TABLE IF EXISTS `milestone_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone_eval` (
  `evaluation_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `class_id` int NOT NULL,
  `bonus` double DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `submit_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `class_id` (`class_id`),
  KEY `submit_id` (`submit_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `milestone_eval_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `milestone_eval_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `milestone_eval_ibfk_3` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`),
  CONSTRAINT `milestone_eval_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone_eval`
--

LOCK TABLES `milestone_eval` WRITE;
/*!40000 ALTER TABLE `milestone_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `screen_id` int NOT NULL,
  `role_id` int NOT NULL,
  `get_all_data` bit(1) DEFAULT NULL,
  `can_delete` bit(1) DEFAULT NULL,
  `can_add` bit(1) DEFAULT NULL,
  `can_edit` bit(1) DEFAULT NULL,
  PRIMARY KEY (`screen_id`,`role_id`),
  KEY `screen_id` (`screen_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (25,11,_binary '',_binary '',_binary '',_binary ''),(25,12,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(25,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,11,_binary '',_binary '',_binary '',_binary ''),(26,12,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(26,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,11,_binary '',_binary '',_binary '',_binary ''),(27,12,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,11,_binary '',_binary '',_binary '',_binary ''),(28,12,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(28,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,11,_binary '',_binary '',_binary '',_binary ''),(29,12,_binary '',_binary '',_binary '',_binary ''),(29,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,11,_binary '',_binary '',_binary '',_binary ''),(30,12,_binary '',_binary '',_binary '',_binary ''),(30,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,11,_binary '',_binary '',_binary '',_binary ''),(31,12,_binary '',_binary '\0',_binary '\0',_binary '\0'),(31,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,14,_binary '',_binary '',_binary '',_binary ''),(31,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(32,11,_binary '',_binary '',_binary '',_binary ''),(32,12,_binary '',_binary '\0',_binary '\0',_binary '\0'),(32,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(32,14,_binary '',_binary '',_binary '',_binary ''),(32,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(32,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(32,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(32,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,11,_binary '',_binary '',_binary '',_binary ''),(33,12,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(33,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(41,11,_binary '',_binary '',_binary '',_binary ''),(41,12,_binary '',_binary '\0',_binary '\0',_binary '\0'),(41,13,_binary '',_binary '',_binary '',_binary ''),(41,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(41,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(41,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(41,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(41,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,11,_binary '',_binary '',_binary '',_binary ''),(42,12,_binary '',_binary '',_binary '',_binary ''),(42,13,_binary '',_binary '',_binary '',_binary ''),(42,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,11,_binary '',_binary '',_binary '',_binary ''),(43,12,_binary '',_binary '',_binary '',_binary ''),(43,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(43,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,11,_binary '',_binary '',_binary '',_binary ''),(44,12,_binary '',_binary '',_binary '',_binary ''),(44,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(44,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,11,_binary '',_binary '',_binary '',_binary ''),(45,12,_binary '',_binary '',_binary '',_binary ''),(45,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(45,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,11,_binary '',_binary '',_binary '',_binary ''),(46,12,_binary '',_binary '',_binary '',_binary ''),(46,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(46,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,11,_binary '',_binary '',_binary '',_binary ''),(47,12,_binary '',_binary '',_binary '',_binary ''),(47,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(47,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,11,_binary '',_binary '',_binary '',_binary ''),(48,12,_binary '',_binary '',_binary '',_binary ''),(48,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(48,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,11,_binary '',_binary '',_binary '',_binary ''),(49,12,_binary '',_binary '',_binary '',_binary ''),(49,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(49,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,11,_binary '',_binary '',_binary '',_binary ''),(50,12,_binary '',_binary '',_binary '',_binary ''),(50,13,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(51,11,_binary '',_binary '',_binary '',_binary ''),(51,12,_binary '',_binary '',_binary '',_binary ''),(51,13,_binary '',_binary '',_binary '',_binary ''),(51,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(51,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(51,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(51,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(51,69,_binary '',_binary '\0',_binary '\0',_binary '\0'),(61,11,_binary '',_binary '',_binary '',_binary ''),(61,12,_binary '',_binary '',_binary '',_binary ''),(61,13,_binary '',_binary '',_binary '',_binary ''),(61,14,_binary '',_binary '',_binary '',_binary ''),(61,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(61,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(61,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(61,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(62,11,_binary '',_binary '',_binary '',_binary ''),(62,12,_binary '',_binary '',_binary '',_binary ''),(62,13,_binary '',_binary '',_binary '',_binary ''),(62,14,_binary '',_binary '',_binary '',_binary ''),(62,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(62,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(62,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(62,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(63,11,_binary '',_binary '',_binary '',_binary ''),(63,12,_binary '',_binary '',_binary '',_binary ''),(63,13,_binary '',_binary '',_binary '',_binary ''),(63,14,_binary '',_binary '',_binary '',_binary ''),(63,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(63,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(63,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(63,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(64,11,_binary '',_binary '',_binary '',_binary ''),(64,12,_binary '',_binary '',_binary '',_binary ''),(64,13,_binary '',_binary '',_binary '',_binary ''),(64,14,_binary '',_binary '',_binary '',_binary ''),(64,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(64,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(64,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(64,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(65,11,_binary '',_binary '',_binary '',_binary ''),(65,12,_binary '',_binary '',_binary '',_binary ''),(65,13,_binary '',_binary '',_binary '',_binary ''),(65,14,_binary '',_binary '',_binary '',_binary ''),(65,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(65,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(65,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(65,69,_binary '',_binary '',_binary '',_binary ''),(66,11,_binary '',_binary '',_binary '',_binary ''),(66,12,_binary '',_binary '',_binary '',_binary ''),(66,13,_binary '',_binary '',_binary '',_binary ''),(66,14,_binary '',_binary '',_binary '',_binary ''),(66,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(66,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(66,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(66,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(67,11,_binary '',_binary '',_binary '',_binary ''),(67,12,_binary '',_binary '',_binary '',_binary ''),(67,13,_binary '',_binary '',_binary '',_binary ''),(67,14,_binary '',_binary '',_binary '',_binary ''),(67,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(67,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(67,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(67,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(68,11,_binary '',_binary '',_binary '',_binary ''),(68,12,_binary '',_binary '',_binary '',_binary ''),(68,13,_binary '',_binary '',_binary '',_binary ''),(68,14,_binary '',_binary '',_binary '',_binary ''),(68,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(68,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(68,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(68,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,11,_binary '',_binary '',_binary '',_binary ''),(70,12,_binary '',_binary '',_binary '',_binary ''),(70,13,_binary '',_binary '',_binary '',_binary ''),(70,14,_binary '',_binary '',_binary '',_binary ''),(70,15,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,16,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,17,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,69,_binary '\0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'DE-C303'),(2,'DE-C304'),(3,'DE-C305');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `slot_id` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `from_time` date DEFAULT NULL,
  `to_time` date DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `uq_schedule` (`slot_id`,`training_date`),
  KEY `class_id` (`class_id`),
  KEY `schedule_ibfk_2_idx` (`slot_id`),
  KEY `schedule_ibfk_3_idx` (`room_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slot` (`slot_id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (19,2,1,'Review project','2022-11-01',NULL,NULL,1),(20,3,2,'Cookie and session','2022-11-01',NULL,NULL,1),(22,2,2,'Review project','2022-11-02',NULL,NULL,1),(23,2,1,'Review iter 3','2022-11-03',NULL,NULL,2),(25,3,3,'Test','2022-11-03',NULL,NULL,1),(26,2,5,'Test 1','2022-11-04',NULL,NULL,2);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,NULL,'User Role','dad','1',_binary '\0','hi :D',NULL,NULL,4,'2022-11-07 23:18:03'),(2,NULL,'Web Contact Category','','',_binary '','',NULL,NULL,4,'2022-10-13 10:09:12'),(3,NULL,'Class Setting Type','','',_binary '','',NULL,NULL,NULL,NULL),(4,NULL,'Subject Setting Type','','',_binary '','',NULL,NULL,NULL,NULL),(5,NULL,'System Screens','','',_binary '','',NULL,NULL,NULL,NULL),(11,1,'Administrator','','',_binary '','',NULL,NULL,6,'2022-10-06 11:49:23'),(12,1,'Manager','','',_binary '','',NULL,NULL,NULL,NULL),(13,1,'Trainer','','',_binary '','',NULL,NULL,NULL,NULL),(14,1,'Supporter','','',_binary '','',NULL,NULL,NULL,NULL),(15,1,'Expert','','',_binary '','',NULL,NULL,NULL,NULL),(16,1,'Client','','',_binary '','',NULL,NULL,4,'2022-10-08 20:54:05'),(17,1,'Guest','','',_binary '','',NULL,NULL,NULL,NULL),(18,5,'Home Page','/home','',_binary '','',NULL,NULL,NULL,NULL),(19,5,'Dashboard','manage/dashboard/view','',_binary '','',NULL,NULL,NULL,NULL),(20,5,'User Login','/Login','',_binary '','',NULL,NULL,NULL,NULL),(21,5,'Password Reset','/PasswordReset','',_binary '','',NULL,NULL,NULL,NULL),(22,5,'User Register','/Register','',_binary '','',NULL,NULL,NULL,NULL),(23,5,'User Profile','/profile','',_binary '','',NULL,NULL,NULL,NULL),(24,5,'Password Change','/changepassword','',_binary '','',NULL,NULL,NULL,NULL),(25,5,'Setting List','/manage/setting/list','',_binary '','',NULL,NULL,NULL,NULL),(26,5,'Setting Details','/manage/setting/detail','',_binary '','',NULL,NULL,NULL,NULL),(27,5,'User List','/manage/user/list','',_binary '','',NULL,NULL,NULL,NULL),(28,5,'User Details','/manage/user/detail','',_binary '','',NULL,NULL,NULL,NULL),(29,5,'Subject List','/manage/subject/list','',_binary '','',NULL,NULL,NULL,NULL),(30,5,'Subject Details','/manage/subject/detail','',_binary '','',NULL,NULL,NULL,NULL),(31,5,'Web Contact List','/contact/list','',_binary '','',NULL,NULL,NULL,NULL),(32,5,'Web Contact Details','/contact/detail','',_binary '','',NULL,NULL,NULL,NULL),(33,5,'System Permission','/manage/system/permission','',_binary '','',NULL,NULL,NULL,NULL),(34,3,'Class Setting Type1','','',_binary '','',NULL,NULL,NULL,NULL),(35,3,'Class Setting Type2','','',_binary '','',NULL,NULL,NULL,NULL),(36,3,'Class Setting Type3','','',_binary '','',NULL,NULL,NULL,NULL),(37,3,'Class Setting Type4','','',_binary '','',NULL,NULL,NULL,NULL),(41,5,'Milestone List','/manage/milestone/list','',_binary '','',NULL,NULL,NULL,NULL),(42,5,'Milestone Detail','/manage/milestone/detail','',_binary '','',NULL,NULL,NULL,NULL),(43,5,'Assignment List','/manage/assignment/list','',_binary '','',NULL,NULL,NULL,NULL),(44,5,'Assignment Details','/manage/assignment/detail','',_binary '','',NULL,NULL,NULL,NULL),(45,5,'Subject Setting List','/subjectsettinglist','',_binary '','',NULL,NULL,NULL,NULL),(46,5,'Subject Setting Detail','/subjectsettingdetail','',_binary '','',NULL,NULL,NULL,NULL),(47,5,'Eval Criteria List','/manage/evalcriteria/list','',_binary '','',NULL,NULL,NULL,NULL),(48,5,'Eval Criteria Detail','/manage/evalcriteria/detail','',_binary '','',NULL,NULL,NULL,NULL),(49,5,'Class List','/class/list','',_binary '','',NULL,NULL,NULL,NULL),(50,5,'Class Detail','/class/detail','',_binary '','',NULL,NULL,NULL,NULL),(51,5,'Class Setting List','/manage/classsetting/list','',_binary '','',NULL,NULL,NULL,NULL),(52,4,'Complexity level',NULL,NULL,_binary '',NULL,1,'2022-10-18 10:07:30',NULL,NULL),(53,4,'Quality level',NULL,NULL,_binary '',NULL,1,'2022-10-18 10:07:30',NULL,NULL),(54,52,'Complex','400',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(55,52,'Medium','280',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(56,52,'Simple','150',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(57,53,'High','1',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(58,53,'Average','0.75',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(59,53,'Low','400',NULL,_binary '',NULL,1,'2022-10-18 10:10:45',NULL,NULL),(61,5,'Schedule List','/schedulelist',NULL,_binary '',NULL,1,NULL,NULL,NULL),(62,5,'Schedule Detail','/scheduledetail',NULL,_binary '',NULL,1,NULL,NULL,NULL),(63,5,'Attendance Tracking','/attendancetracking',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(64,5,'Attendance Details','/attendancedetails',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(65,5,'Schedule Attendance','/scheduleattendance',NULL,_binary '',NULL,1,NULL,NULL,NULL),(66,5,'Trainee List','/manage/trainee/list',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(67,5,'Trainee Detail','/manage/trainee/detail',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(68,5,'Trainee Import','/manage/trainee/import',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(69,1,'Trainee',NULL,NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(70,5,'Class Eva Criteria Lis','/manage/classevalcriteria/list',NULL,_binary '',NULL,NULL,NULL,NULL,NULL),(71,5,'Add Milestone ','/manage/milestone/add',NULL,_binary '',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot` (
  `slot_id` int NOT NULL AUTO_INCREMENT,
  `slot_name` varchar(10) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
INSERT INTO `slot` VALUES (1,'Slot 1','07:30:00','09:30:00'),(2,'Slot 2','09:10:00','10:40:00'),(3,'Slot 3','10:50:00','12:20:00'),(4,'Slot 4','12:50:00','14:20:00'),(5,'Slot 5','14:30:00','16:00:00'),(6,'Slot 6','16:10:00','17:40:00'),(7,'Slot 7','17:50:00','19:20:00'),(8,'Slot 8','19:30:00','21:00:00');
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(20) DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `expert_id` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `body` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `manager_id` (`manager_id`),
  KEY `expert_id` (`expert_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`expert_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'SWP391','Application development project',3,3,_binary '','',NULL,NULL,NULL,NULL),(2,'PRJ301','Java Web Application Development',5,1,_binary '','',NULL,NULL,NULL,NULL),(3,'LAB211','OOP with Java Lab',6,9,_binary '','',NULL,NULL,NULL,NULL),(4,'SWR302','Software Requirement',4,1,_binary '','',NULL,NULL,NULL,NULL),(5,'SWT301','Software Testing',5,7,_binary '','',NULL,NULL,NULL,NULL),(6,'JPD133','Elementary Japanese1-A1/A2',4,1,_binary '','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_setting`
--

DROP TABLE IF EXISTS `subject_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `subject_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `subject_id` (`subject_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `subject_setting_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `subject_setting_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_setting`
--

LOCK TABLES `subject_setting` WRITE;
/*!40000 ALTER TABLE `subject_setting` DISABLE KEYS */;
INSERT INTO `subject_setting` VALUES (1,54,NULL,NULL,NULL,_binary '',NULL,1,1,'2022-10-18 10:18:41',NULL,NULL),(2,57,NULL,NULL,NULL,_binary '',NULL,1,1,'2022-10-18 10:18:41',NULL,NULL),(3,55,NULL,NULL,NULL,_binary '','                                        \r\n                                    ',2,1,'2022-10-18 10:18:41',NULL,NULL),(4,58,NULL,NULL,NULL,_binary '','                                        \r\n                                    ',2,1,'2022-10-18 10:18:41',NULL,NULL),(5,55,NULL,NULL,NULL,_binary '','                                        \r\n                                    ',3,1,'2022-10-18 10:18:41',NULL,NULL),(6,57,NULL,NULL,NULL,_binary '',NULL,3,1,'2022-10-18 10:18:41',NULL,NULL),(7,56,NULL,NULL,NULL,_binary '','                                        \r\n                                    ',4,1,'2022-10-18 10:18:41',NULL,NULL),(8,57,NULL,NULL,NULL,_binary '',NULL,4,1,'2022-10-18 10:18:41',NULL,NULL),(9,56,NULL,NULL,NULL,_binary '','                                        \r\n                                    ',5,1,'2022-10-18 10:18:41',NULL,NULL),(10,57,NULL,NULL,NULL,_binary '',NULL,5,1,'2022-10-18 10:18:41',NULL,NULL),(11,54,NULL,NULL,NULL,_binary '',NULL,6,1,'2022-10-18 10:18:41',NULL,NULL),(12,57,NULL,NULL,NULL,_binary '',NULL,6,1,'2022-10-18 10:18:41',NULL,NULL);
/*!40000 ALTER TABLE `subject_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submit`
--

DROP TABLE IF EXISTS `submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submit` (
  `submit_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `class_id` int NOT NULL,
  `team_id` int NOT NULL,
  `submit_file_url` text,
  `submit_time` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`submit_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `class_id` (`class_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `submit_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `submit_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `submit_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `submit_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submit`
--

LOCK TABLES `submit` WRITE;
/*!40000 ALTER TABLE `submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `team_code` varchar(50) DEFAULT NULL,
  `topic_name` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`team_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_eval`
--

DROP TABLE IF EXISTS `team_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_eval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `criteria_id` int NOT NULL,
  `submit_id` int NOT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_id` (`criteria_id`),
  KEY `submit_id` (`submit_id`),
  CONSTRAINT `team_eval_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `eval_criteria` (`criteria_id`),
  CONSTRAINT `team_eval_ibfk_2` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_eval`
--

LOCK TABLES `team_eval` WRITE;
/*!40000 ALTER TABLE `team_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_leader` bit(1) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `team_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `team_member_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `tracking_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `issue_id` int NOT NULL,
  `author_id` int NOT NULL,
  `assignee_id` int NOT NULL,
  `submit_id` int NOT NULL,
  `change_log` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tracking_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `issue_id` (`issue_id`),
  KEY `author_id` (`author_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `submit_id` (`submit_id`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`),
  CONSTRAINT `tracking_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tracking_ibfk_4` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tracking_ibfk_5` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_schedule`
--

DROP TABLE IF EXISTS `unique_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unique_schedule` (
  `trainer_id` int NOT NULL,
  `training_date` date NOT NULL,
  `slot_id` int NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`,`training_date`,`slot_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_schedule`
--

LOCK TABLES `unique_schedule` WRITE;
/*!40000 ALTER TABLE `unique_schedule` DISABLE KEYS */;
INSERT INTO `unique_schedule` VALUES (1,'2022-11-01',1,1),(1,'2022-11-01',2,1),(1,'2022-11-03',1,1),(1,'2022-11-03',3,1),(3,'2022-11-01',1,1),(3,'2022-11-02',2,1),(3,'2022-11-03',1,2),(3,'2022-11-04',5,2);
/*!40000 ALTER TABLE `unique_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_history`
--

DROP TABLE IF EXISTS `update_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `update_history` (
  `update_history_id` int NOT NULL AUTO_INCREMENT,
  `tracking_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_title` varchar(50) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`update_history_id`),
  KEY `tracking_id` (`tracking_id`),
  KEY `milestone_id` (`milestone_id`),
  CONSTRAINT `update_history_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `update_history_ibfk_2` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_history`
--

LOCK TABLES `update_history` WRITE;
/*!40000 ALTER TABLE `update_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar_url` text,
  `address` text,
  `position` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `status` int DEFAULT '0',
  `note` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyen The Duy','duynthe164001@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(2,'Nguyen Trung Vu','vunthe163585@fpt.edu.vn','','12345','',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL),(3,'Nguyen Thanh Nam','namnthe141488@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(4,'Pham Danh Trung Nguyen','nguyenpdt164016@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(5,'Duong Phuong Tuan','tuandphe153689@fpt.edu.vn','','12345','',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL),(6,'Nguyen Van A','abc@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(7,'Nguyen Van B','bcd@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(8,'Nguyen Van C','cde@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(9,'Nguyen Van D','def@gmail.com','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(10,'Nguyen Van E','efg@gmail.com','','12345','',NULL,NULL,NULL,1,' ',NULL,NULL,NULL,NULL),(11,'Nguyen Van F','fgh@gmail.com','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(12,'Student 1','student1@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(13,'Student 2','student2@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(14,'Student 3','student3@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(15,'Student 4','student4@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(16,'Student 5','student5@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(17,'Student 6','student6@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(18,'Student 7','student7@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(19,'Student 8','student8@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(20,'Student 9','student9@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(21,'Student 10','student10@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(22,'Student 11','student11@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(23,'Student 12','student12@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(24,'Student 13','student13@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(25,'Student 14','student14@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(26,'Student 15','student15@fpt.edu.vn',NULL,'12345',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `is_leader` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,11,NULL,NULL,NULL,NULL,NULL),(1,15,NULL,NULL,NULL,NULL,NULL),(2,11,NULL,NULL,NULL,NULL,NULL),(3,11,NULL,NULL,NULL,NULL,NULL),(4,11,NULL,NULL,NULL,NULL,NULL),(4,12,NULL,NULL,NULL,NULL,NULL),(5,11,NULL,NULL,NULL,NULL,NULL),(5,12,NULL,NULL,NULL,NULL,NULL),(6,12,NULL,NULL,NULL,NULL,NULL),(7,13,NULL,NULL,NULL,NULL,NULL),(8,14,NULL,NULL,NULL,NULL,NULL),(9,15,NULL,NULL,NULL,NULL,NULL),(10,16,NULL,NULL,NULL,NULL,NULL),(11,17,NULL,NULL,NULL,NULL,NULL),(12,69,NULL,NULL,NULL,NULL,NULL),(13,69,NULL,NULL,NULL,NULL,NULL),(14,69,NULL,NULL,NULL,NULL,NULL),(15,69,NULL,NULL,NULL,NULL,NULL),(16,69,NULL,NULL,NULL,NULL,NULL),(17,69,NULL,NULL,NULL,NULL,NULL),(18,69,NULL,NULL,NULL,NULL,NULL),(19,69,NULL,NULL,NULL,NULL,NULL),(20,69,NULL,NULL,NULL,NULL,NULL),(21,69,NULL,NULL,NULL,NULL,NULL),(22,69,NULL,NULL,NULL,NULL,NULL),(23,69,NULL,NULL,NULL,NULL,NULL),(24,69,NULL,NULL,NULL,NULL,NULL),(25,69,NULL,NULL,NULL,NULL,NULL),(26,69,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_contact`
--

DROP TABLE IF EXISTS `web_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_contact` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `message` text,
  `response` text,
  `status` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `web_contact_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_contact`
--

LOCK TABLES `web_contact` WRITE;
/*!40000 ALTER TABLE `web_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 23:58:54
