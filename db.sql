-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: personalskinhaircare
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `habit_logs`
--

DROP TABLE IF EXISTS `habit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habit_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `habit_id` int NOT NULL,
  `log_date` date NOT NULL,
  `status` enum('Completed','Skipped') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `habit_id` (`habit_id`),
  CONSTRAINT `habit_logs_ibfk_1` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habit_logs`
--

LOCK TABLES `habit_logs` WRITE;
/*!40000 ALTER TABLE `habit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `habit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habit_streaks`
--

DROP TABLE IF EXISTS `habit_streaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habit_streaks` (
  `streak_id` int NOT NULL AUTO_INCREMENT,
  `habit_id` int NOT NULL,
  `current_streak` int DEFAULT '0',
  `longest_streak` int DEFAULT '0',
  `last_completed` date DEFAULT NULL,
  PRIMARY KEY (`streak_id`),
  KEY `habit_id` (`habit_id`),
  CONSTRAINT `habit_streaks_ibfk_1` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habit_streaks`
--

LOCK TABLES `habit_streaks` WRITE;
/*!40000 ALTER TABLE `habit_streaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `habit_streaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habits`
--

DROP TABLE IF EXISTS `habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habits` (
  `habit_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `habit_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `habit_description` text COLLATE utf8mb4_general_ci,
  `frequency` enum('Daily','Weekly','Custom') COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`habit_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `habits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habits`
--

LOCK TABLES `habits` WRITE;
/*!40000 ALTER TABLE `habits` DISABLE KEYS */;
/*!40000 ALTER TABLE `habits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair`
--

DROP TABLE IF EXISTS `hair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hair` (
  `hair_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `hair_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `hair_concerns` text COLLATE utf8mb4_general_ci,
  `scalp_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `current_haircare_routine` text COLLATE utf8mb4_general_ci,
  `styling_habits` text COLLATE utf8mb4_general_ci,
  `lifestyle_factors` text COLLATE utf8mb4_general_ci,
  `goals` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`hair_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `hair_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair`
--

LOCK TABLES `hair` WRITE;
/*!40000 ALTER TABLE `hair` DISABLE KEYS */;
/*!40000 ALTER TABLE `hair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_streaks`
--

DROP TABLE IF EXISTS `routine_streaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine_streaks` (
  `streak_id` int NOT NULL AUTO_INCREMENT,
  `routine_id` int NOT NULL,
  `current_streak` int DEFAULT '0',
  `longest_streak` int DEFAULT '0',
  `last_completed` date DEFAULT NULL,
  PRIMARY KEY (`streak_id`),
  KEY `routine_id` (`routine_id`),
  CONSTRAINT `routine_streaks_ibfk_1` FOREIGN KEY (`routine_id`) REFERENCES `routines` (`routine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_streaks`
--

LOCK TABLES `routine_streaks` WRITE;
/*!40000 ALTER TABLE `routine_streaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `routine_streaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routines`
--

DROP TABLE IF EXISTS `routines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routines` (
  `routine_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `routine_type` enum('Skincare','Haircare') COLLATE utf8mb4_general_ci NOT NULL,
  `details` text COLLATE utf8mb4_general_ci NOT NULL,
  `frequency` enum('Daily','Weekly','Custom') COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`routine_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `routines_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routines`
--

LOCK TABLES `routines` WRITE;
/*!40000 ALTER TABLE `routines` DISABLE KEYS */;
/*!40000 ALTER TABLE `routines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin`
--

DROP TABLE IF EXISTS `skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin` (
  `skin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `skin_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `skin_concerns` text COLLATE utf8mb4_general_ci,
  `allergies` text COLLATE utf8mb4_general_ci,
  `current_routine` text COLLATE utf8mb4_general_ci,
  `dietary_habits` text COLLATE utf8mb4_general_ci,
  `goals` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`skin_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `skin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin`
--

LOCK TABLES `skin` WRITE;
/*!40000 ALTER TABLE `skin` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_list`
--

DROP TABLE IF EXISTS `todo_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todo_list` (
  `todo_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `task_description` text COLLATE utf8mb4_general_ci,
  `due_date` date DEFAULT NULL,
  `status` enum('Pending','Completed','Overdue') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`todo_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `todo_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_list`
--

LOCK TABLES `todo_list` WRITE;
/*!40000 ALTER TABLE `todo_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `usermail` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phonenumber` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-14 12:21:41
