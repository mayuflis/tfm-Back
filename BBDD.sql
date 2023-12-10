CREATE DATABASE  IF NOT EXISTS `appteacher3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appteacher3`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: appteacher3
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `teachers_id_teachers` int NOT NULL,
  `users_idusers` int NOT NULL,
  `subjects_idsubject` int NOT NULL,
  `class date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `start_end` time DEFAULT NULL,
  `validate` tinyint DEFAULT '0',
  `level` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_contact` datetime DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_class`),
  KEY `fk_teachers_has_users_users1_idx` (`users_idusers`),
  KEY `fk_teachers_has_users_teachers1_idx` (`teachers_id_teachers`),
  KEY `fk_teachers_has_user_subjects1_idx` (`subjects_idsubject`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_teachers_has_users_subjects1` FOREIGN KEY (`subjects_idsubject`) REFERENCES `subjects` (`idsubjects`),
  CONSTRAINT `fk_teachers_has_users_teachers1` FOREIGN KEY (`teachers_id_teachers`) REFERENCES `teachers` (`id_teachers`),
  CONSTRAINT `fk_teachers_has_users_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `idcontacts` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landline` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcontacts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `idGender` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idGender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'masculino'),(2,'femenino');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `idprovince` int NOT NULL AUTO_INCREMENT,
  `name_province` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idprovince`),
  UNIQUE KEY `name_province_UNIQUE` (`name_province`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (39,'A coruña'),(46,'Álava'),(25,'Albacete'),(34,'Alicante'),(1,'Almería'),(12,'Asturias'),(17,'Ávila'),(37,'Badajoz'),(30,'Barcelona'),(47,'Bizkaia'),(18,'Burgos'),(38,'Cáceres'),(2,'Cádiz'),(16,'Cantabria'),(36,'Castellón'),(26,'Ciudad Real'),(3,'Córdoba'),(27,'Cuenca'),(31,'Girona'),(4,'Granada'),(28,'Guadalajara'),(48,'Guipúzcoa'),(5,'Huelva'),(9,'Huesca'),(13,'Illes Balears'),(6,'Jaen'),(49,'La Rioja'),(14,'Las Palmas'),(19,'León'),(32,'Lleida'),(40,'Lugo'),(43,'Madrid'),(7,'Málaga'),(44,'Murcia'),(45,'Navarra'),(41,'Ourense'),(20,'Palencia'),(42,'Pontevedra'),(21,'Salamanca'),(15,'Santa Cruz de Tenerife'),(22,'Segovia'),(8,'Sevilla'),(33,'Tarragona'),(10,'Terual'),(29,'Toledo'),(35,'Valencia'),(23,'Valladolid'),(24,'Zamora'),(11,'Zaragoza');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_reviews` int NOT NULL AUTO_INCREMENT,
  `title_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `opinions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recommendations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `teachers_id_teachers` int NOT NULL,
  `rate` float DEFAULT NULL,
  `users_idusers` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reviews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `idsubjects` int NOT NULL AUTO_INCREMENT,
  `name` enum('Matemáticas','Lenguaje','Inglés','Programación','Física','Biología','Química') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idsubjects`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Matemáticas'),(2,'Lenguaje'),(3,'Inglés'),(4,'Programación'),(5,'Física'),(6,'Biología'),(7,'Química');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id_teachers` int NOT NULL AUTO_INCREMENT,
  `validate` tinyint(1) DEFAULT '0',
  `users_idusers` int NOT NULL,
  `description_prof` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_prof` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_class` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `experience` tinyint DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_teachers`),
  KEY `fk_teachers_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_teachers_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_has_subjects`
--

DROP TABLE IF EXISTS `teachers_has_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers_has_subjects` (
  `teachers_id_teachers` int NOT NULL,
  `subjects_idsubjects` int NOT NULL,
  `hourly_rate` tinyint DEFAULT NULL,
  `free_classl` tinyint DEFAULT NULL,
  `level` enum('Primaria','Secundaria','Bachillerato','Universidad') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `fk_teachers_has_subjects_subjects1_idx` (`subjects_idsubjects`),
  KEY `fk_teachers_has_subjects_teachers1_idx` (`teachers_id_teachers`),
  CONSTRAINT `fk_teachers_has_subjects_subjects1` FOREIGN KEY (`subjects_idsubjects`) REFERENCES `subjects` (`idsubjects`),
  CONSTRAINT `fk_teachers_has_subjects_teachers1` FOREIGN KEY (`teachers_id_teachers`) REFERENCES `teachers` (`id_teachers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_has_subjects`
--

LOCK TABLES `teachers_has_subjects` WRITE;
/*!40000 ALTER TABLE `teachers_has_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers_has_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `birthday` date NOT NULL,
  `province_idprovince` int DEFAULT NULL,
  `delete_users` tinyint DEFAULT '0',
  `Gender_idGender` int DEFAULT NULL,
  `contacts_idcontacts` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `date_request _withdrawal` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_province1_idx` (`province_idprovince`),
  KEY `fk_users_Gender1_idx` (`Gender_idGender`),
  KEY `fk_users_contacts1_idx` (`contacts_idcontacts`),
  CONSTRAINT `fk_users_contacts1` FOREIGN KEY (`contacts_idcontacts`) REFERENCES `contacts` (`idcontacts`),
  CONSTRAINT `fk_users_Gender1` FOREIGN KEY (`Gender_idGender`) REFERENCES `gender` (`idGender`),
  CONSTRAINT `fk_users_province1` FOREIGN KEY (`province_idprovince`) REFERENCES `province` (`idprovince`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertUsersToRole` AFTER INSERT ON `users` FOR EACH ROW begin
if new.role='Profesor' then
	 insert into teachers(users_idusers)values(new.idusers);
 
end if;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'appteacher3'
--

--
-- Dumping routines for database 'appteacher3'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertPhone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPhone`( in phone varchar(12))
begin
		insert into contacts (mobile) values (phone);
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validacionAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validacionAdmin`()
begin
		select u.idusers,u.name,u.last_name,u.email,u.role,u.birthday from users as u
        join  teachers as t on u.idusers=t.id_teachers
        where validate=1;
    end ;;
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

-- Dump completed on 2023-12-04 22:38:34
