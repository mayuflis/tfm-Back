CREATE DATABASE  IF NOT EXISTS `appteacher3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appteacher3`;
-- MySQL dump 10.13  D  istrib 8.0.34, for Win64 (x86_64)
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
  `class_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `start_end` time DEFAULT NULL,
  `validate` tinyint DEFAULT '0',
  `level` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_contact` datetime DEFAULT CURRENT_TIMESTAMP,
  `acceptance_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_class`),
  KEY `fk_teachers_has_users_users1_idx` (`users_idusers`),
  KEY `fk_teachers_has_users_teachers1_idx` (`teachers_id_teachers`),
  KEY `fk_teachers_has_user_subjects1_idx` (`subjects_idsubject`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_teachers_has_users_subjects1` FOREIGN KEY (`subjects_idsubject`) REFERENCES `subjects` (`idsubjects`),
  CONSTRAINT `fk_teachers_has_users_teachers1` FOREIGN KEY (`teachers_id_teachers`) REFERENCES `teachers` (`id_teachers`),
  CONSTRAINT `fk_teachers_has_users_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,27,25,3,'2023-12-05','01:25:40','06:51:04',0,'Bachillerato','2023-11-23 20:15:31','2023-12-21 20:15:31'),(2,3,101,3,'2023-12-12','04:24:52','01:21:11',0,'Primaria','2023-11-21 20:15:31','2023-12-11 20:15:31'),(3,29,1,5,'2023-12-05','03:51:51','07:25:28',1,'Bachillerato','2023-11-19 20:15:31','2023-12-12 20:15:31'),(4,13,17,6,'2023-12-17','10:03:21','12:04:34',0,'Secundaria','2023-11-25 20:15:31','2023-12-26 20:15:31'),(5,19,36,4,'2024-01-03','03:14:29','05:05:11',0,'Secundaria','2023-11-21 20:15:31','2023-12-15 20:15:31'),(6,13,96,5,'2024-01-02','09:19:03','01:04:50',1,'Secundaria','2023-11-25 20:15:31','2023-12-19 20:15:31'),(7,14,83,5,'2023-12-05','01:27:49','06:45:21',0,'Secundaria','2023-11-21 20:15:31','2023-12-18 20:15:31'),(8,23,33,1,'2023-12-10','07:22:51','07:22:31',0,'Secundaria','2023-11-10 20:15:31','2023-12-06 20:15:31'),(9,9,44,5,'2023-12-23','00:40:14','05:27:48',1,'Primaria','2023-11-17 20:15:31','2023-12-12 20:15:31'),(10,14,30,5,'2023-12-27','10:09:26','00:30:48',0,'Primaria','2023-11-28 20:15:31','2023-12-11 20:15:31'),(11,5,38,1,'2023-12-31','03:24:23','09:08:00',1,'Secundaria','2023-11-17 20:15:31','2023-12-15 20:15:31'),(12,21,89,5,'2023-12-10','11:44:52','04:47:59',1,'Primaria','2023-11-23 20:15:31','2023-12-21 20:15:31'),(13,8,14,4,'2023-12-29','06:10:03','01:57:45',0,'Bachillerato','2023-11-16 20:15:31','2023-12-16 20:15:31'),(14,25,9,2,'2023-12-27','11:40:27','08:13:55',0,'Secundaria','2023-12-05 20:15:31','2023-12-13 20:15:31'),(15,11,49,6,'2023-12-25','02:07:34','10:22:42',1,'Secundaria','2023-11-20 20:15:31','2023-12-10 20:15:31'),(16,28,11,5,'2023-12-12','04:36:33','02:52:20',1,'Secundaria','2023-11-23 20:15:31','2023-12-16 20:15:31'),(17,28,61,4,'2023-12-18','11:50:26','07:13:38',1,'Secundaria','2023-12-01 20:15:31','2023-12-07 20:15:31'),(18,25,58,7,'2023-12-19','05:23:54','09:56:28',1,'Secundaria','2023-12-04 20:15:31','2023-12-22 20:15:31'),(19,9,32,2,'2023-12-14','09:49:46','02:50:01',1,'Bachillerato','2023-11-23 20:15:31','2023-12-07 20:15:31'),(20,8,46,1,'2023-12-20','04:22:15','04:17:34',0,'Secundaria','2023-11-06 20:15:31','2023-12-18 20:15:31'),(21,13,91,6,'2024-01-03','05:04:59','02:12:25',0,'Bachillerato','2023-11-19 20:15:31','2023-12-18 20:15:31'),(22,11,78,4,'2023-12-21','02:32:48','05:09:28',0,'Secundaria','2023-11-09 20:15:31','2023-12-13 20:15:31'),(23,17,94,4,'2023-12-22','06:44:10','01:24:47',1,'Primaria','2023-11-30 20:15:31','2023-12-09 20:15:31'),(24,20,98,7,'2024-01-03','11:59:17','00:36:51',0,'Primaria','2023-11-06 20:15:31','2023-12-10 20:15:31'),(25,27,73,1,'2023-12-17','01:40:11','05:15:20',1,'Secundaria','2023-11-22 20:15:31','2023-12-17 20:15:31'),(26,20,51,7,'2023-12-30','03:50:12','01:17:22',0,'Secundaria','2023-12-01 20:15:31','2023-12-28 20:15:31'),(27,30,53,4,'2023-12-17','09:00:48','06:01:25',0,'Bachillerato','2023-12-01 20:15:31','2023-12-10 20:15:31'),(28,10,7,1,'2023-12-26','02:07:34','09:31:06',0,'Bachillerato','2023-11-14 20:15:31','2023-12-31 20:15:31'),(29,22,2,1,'2023-12-12','01:02:11','08:14:05',1,'Bachillerato','2023-11-19 20:15:31','2023-12-05 20:15:31'),(30,17,28,2,'2023-12-21','00:31:38','07:23:14',1,'Bachillerato','2023-11-17 20:15:31','2023-12-11 20:15:31'),(31,28,27,1,'2023-12-24','11:45:51','11:56:36',1,'Primaria','2023-11-09 20:15:31','2023-12-23 20:15:31'),(32,2,54,5,'2023-12-05','02:09:43','10:50:54',1,'Primaria','2023-12-04 20:15:31','2023-12-15 20:15:31'),(33,4,21,7,'2023-12-22','10:28:30','08:26:13',1,'Secundaria','2023-11-29 20:15:31','2023-12-27 20:15:31'),(34,28,81,7,'2023-12-28','02:50:30','09:59:46',0,'Bachillerato','2023-11-19 20:15:31','2023-12-09 20:15:31'),(35,18,93,2,'2023-12-11','05:34:16','08:43:48',0,'Primaria','2023-11-20 20:15:31','2023-12-10 20:15:31'),(36,29,12,7,'2023-12-30','04:31:35','04:47:21',1,'Primaria','2023-12-04 20:15:31','2023-12-25 20:15:31'),(37,13,71,1,'2023-12-18','10:09:14','11:10:06',1,'Bachillerato','2023-11-17 20:15:31','2023-12-18 20:15:31'),(38,20,66,3,'2023-12-25','06:04:03','05:48:46',1,'Primaria','2023-11-15 20:15:31','2024-01-03 20:15:31'),(39,1,19,1,'2023-12-25','11:06:34','07:54:53',0,'Bachillerato','2023-11-18 20:15:31','2023-12-31 20:15:31'),(40,13,56,7,'2023-12-17','03:05:49','01:24:26',1,'Bachillerato','2023-12-01 20:15:31','2023-12-15 20:15:31'),(41,25,86,1,'2023-12-27','06:43:35','07:31:47',0,'Secundaria','2023-11-16 20:15:31','2023-12-30 20:15:31'),(42,25,59,1,'2023-12-22','11:16:15','11:19:33',1,'Bachillerato','2023-11-14 20:15:31','2023-12-14 20:15:31'),(43,13,34,7,'2023-12-25','05:46:07','04:24:49',0,'Bachillerato','2023-11-28 20:15:31','2023-12-16 20:15:31'),(44,25,41,6,'2023-12-22','06:39:43','00:32:31',0,'Bachillerato','2023-11-15 20:15:31','2023-12-11 20:15:31'),(45,27,79,2,'2023-12-22','01:24:02','10:50:06',1,'Primaria','2023-12-02 20:15:31','2024-01-03 20:15:31'),(46,16,74,2,'2023-12-25','08:12:24','05:04:33',1,'Primaria','2023-12-03 20:15:31','2023-12-06 20:15:31'),(47,4,69,2,'2023-12-16','05:30:19','02:25:35',0,'Secundaria','2023-11-06 20:15:31','2024-01-01 20:15:31'),(48,8,16,4,'2023-12-09','00:32:52','09:46:25',1,'Primaria','2023-11-23 20:15:31','2023-12-07 20:15:31'),(49,30,84,3,'2023-12-25','05:26:56','02:53:07',1,'Secundaria','2023-11-08 20:15:31','2023-12-31 20:15:31'),(50,18,39,2,'2023-12-09','01:31:16','03:12:06',1,'Primaria','2023-12-05 20:15:31','2024-01-02 20:15:31'),(51,38,102,4,'2023-12-09','01:31:16','03:12:06',1,'Bachillerato','2023-12-05 20:15:31','2024-01-02 20:15:31'),(52,38,9,4,'2023-12-09','01:31:16','03:12:06',1,'Bachillerato','2023-12-05 20:15:31','2024-01-02 20:15:31'),(53,38,9,1,'2023-12-09','01:31:16','03:12:06',1,'Bachillerato','2023-12-05 20:15:31','2024-01-02 20:15:31'),(55,13,102,3,'2023-12-05','01:25:40','06:51:04',1,'Bachillerato','2023-11-23 20:15:31','2023-11-23 20:15:31'),(72,38,102,4,'2023-12-09','20:00:00','21:00:00',0,'Bachillerato','2023-12-11 20:00:09',NULL);
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
  PRIMARY KEY (`idcontacts`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'643707959','38'),(2,'654240463','39'),(3,'640078439','33'),(4,'637670812','38'),(5,'668118747','31'),(6,'627581302','32'),(7,'633550271','39'),(8,'685007455','38'),(9,'624386463','34'),(10,'666909955','38'),(11,'661390390','36'),(12,'606222087','38'),(13,'646939269','30'),(14,'616030086','30'),(15,'639332629','37'),(16,'648572888','37'),(17,'624866558','34'),(18,'678614131','39'),(19,'618470984','35'),(20,'656512532','37'),(21,'627149710','32'),(22,'666210958','30'),(23,'649605664','33'),(24,'649395447','35'),(25,'698160248','38'),(26,'642614904','37'),(27,'618593778','38'),(28,'665124184','32'),(29,'669839588','34'),(30,'653825391','37'),(31,'659608195','32'),(32,'636564806','31'),(33,'603999448','38'),(34,'610302827','36'),(35,'639515795','39'),(36,'666670497','38'),(37,'614805102','33'),(38,'674014024','31'),(39,'625654816','36'),(40,'606232013','38'),(41,'654195619','34'),(42,'652282060','33'),(43,'698823445','37'),(44,'637271052','34'),(45,'689884926','32'),(46,'637611479','38'),(47,'618402618','34'),(48,'679178659','38'),(49,'640685444','36'),(50,'665891248','37'),(51,'607399910','39'),(52,'639325811','34'),(53,'674429327','31'),(54,'654169206','37'),(55,'647558052','30'),(56,'675282645','39'),(57,'633739073','38'),(58,'642847433','31'),(59,'613019950','30'),(60,'636557456','31'),(61,'643727432','35'),(62,'608964797','30'),(63,'613641693','38'),(64,'641314077','39'),(65,'665645309','33'),(66,'604284320','37'),(67,'624485675','38'),(68,'609575417','37'),(69,'674420066','33'),(70,'643374081','33'),(71,'693610209','36'),(72,'637928808','34'),(73,'608813417','31'),(74,'630280663','34'),(75,'624963067','37'),(76,'633973350','35'),(77,'694977551','33'),(78,'672967709','39'),(79,'679905896','30'),(80,'680626359','31'),(81,'663414108','34'),(82,'675191467','30'),(83,'685715016','37'),(84,'603000683','38'),(85,'657858371','37'),(86,'680289810','33'),(87,'627873941','36'),(88,'698500277','30'),(89,'608879566','33'),(90,'648897002','35'),(91,'617846316','36'),(92,'642540579','36'),(93,'659163950','31'),(94,'668198016','30'),(95,'663498236','36'),(96,'612897132','30'),(97,'673990957','32'),(98,'631263391','33'),(99,'634344090','39'),(100,'677930281','35'),(101,'606057277',NULL),(102,'123456789',NULL),(103,'123245678',NULL),(104,'12345556689',NULL);
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
INSERT INTO `province` VALUES (39,'A coruña'),(46,'Álava'),(25,'Albacete'),(34,'Alicante'),(1,'Almería'),(12,'Asturias'),(17,'Ávila'),(37,'Badajoz'),(30,'Barcelona'),(47,'Bizkaia'),(18,'Burgos'),(38,'Cáceres'),(2,'Cádiz'),(16,'Cantabria'),(36,'Castellón'),(26,'Ciudad Real'),(3,'Córdoba'),(27,'Cuenca'),(31,'Girona'),(4,'Granada'),(28,'Guadalajara'),(48,'Guipúzcoa'),(5,'Huelva'),(9,'Huesca'),(13,'Illes Balears'),(6,'Jaen'),(49,'La Rioja'),(14,'Las Palmas'),(19,'León'),(32,'Lleida'),(40,'Lugo'),(43,'Madrid'),(7,'Málaga'),(44,'Murcia'),(45,'Navarra'),(41,'Ourense'),(20,'Palencia'),(42,'Pontevedra'),(21,'Salamanca'),(15,'Santa Cruz de Tenerife'),(22,'Segovia'),(8,'Sevilla'),(33,'Tarragona'),(10,'Teruel'),(29,'Toledo'),(35,'Valencia'),(23,'Valladolid'),(24,'Zamora'),(11,'Zaragoza');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (16,'Estafa','Mal profesor','',13,3,102,'2023-12-10 19:53:30','2023-12-10 20:53:30'),(17,'Grande','Buenísimo','',103,5,102,'2023-12-10 19:54:58','2023-12-10 20:54:58'),(18,'Grande','bueno','',38,4,102,'2023-12-11 19:15:56','2023-12-11 20:15:56');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsdecriptions`
--

DROP TABLE IF EXISTS `studentsdecriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentsdecriptions` (
  `idStudentsDecriptions` int NOT NULL AUTO_INCREMENT,
  `aboutMe` text COLLATE utf8mb4_unicode_ci,
  `myInterests` text COLLATE utf8mb4_unicode_ci,
  `users_idusers` int NOT NULL,
  PRIMARY KEY (`idStudentsDecriptions`),
  UNIQUE KEY `users_idusers_UNIQUE` (`users_idusers`),
  KEY `fk_StudentsDecriptions_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_StudentsDecriptions_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsdecriptions`
--

LOCK TABLES `studentsdecriptions` WRITE;
/*!40000 ALTER TABLE `studentsdecriptions` DISABLE KEYS */;
INSERT INTO `studentsdecriptions` VALUES (1,'Estudiante de segundo de bachillerato  ','Interesado en clases de Matemáticas y Programación , para mejor mi nivel de cara a la EBAU',102);
/*!40000 ALTER TABLE `studentsdecriptions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,1,3,'Emma Johnson - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',1,NULL),(2,1,8,'Olivia Brown - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',2,NULL),(3,1,10,'Ava Martinez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',3,NULL),(4,1,13,'Isabella Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',5,NULL),(5,1,15,'Charlotte Perez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',2,NULL),(6,1,18,'Evelyn Washington - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',4,NULL),(7,1,20,'Harper Russell - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',2,NULL),(8,1,24,'Emma Johnson - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',4,NULL),(9,1,26,'Olivia Brown - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',1,NULL),(10,1,29,'Mia Flores - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',3,NULL),(11,1,31,'Charlotte Gomez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-06 11:48:34',4,NULL),(12,1,35,'Liam Rodriguez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:44:15',3,NULL),(13,1,37,'Mason Martinez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:48:27',1,NULL),(14,1,40,'Olivia Perez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:47:43',5,NULL),(15,1,42,'Lucas Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:46:23',2,NULL),(16,1,45,'Noah Martinez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:47:33',3,NULL),(17,1,47,'Elijah Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:50:20',1,NULL),(18,1,50,'Olivia Perez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:48:47',1,NULL),(19,1,52,'Amelia Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-11 21:50:24',4,NULL),(20,0,55,'William Rodriguez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',3,NULL),(21,0,57,'Ethan Torres - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',2,NULL),(22,0,60,'Amelia Garcia - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(23,0,62,'Mia Gonzalez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',3,NULL),(24,0,65,'William Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',1,NULL),(25,0,67,'Ethan Martinez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(26,0,70,'Oliver Garcia - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(27,0,72,'Lucas Gomez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(28,0,75,'William Gonzalez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(29,0,77,'Ethan Garcia - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',3,NULL),(30,0,80,'Sophia Gomez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',1,NULL),(31,0,82,'Lucas Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(32,0,87,'Sophia Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',2,NULL),(33,0,90,'Sophia Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',3,NULL),(34,0,92,'Ethan Gomez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(35,0,95,'Sophia Gomez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',3,NULL),(36,0,97,'Ethan Rodriguez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:52:54',2,NULL),(37,0,100,'Noah Hernandez - Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-05 18:51:57','2023-12-05 19:51:57',5,NULL),(38,1,103,'Sergio  Passion for Invented Subject','Teacher','Teaching Invented Subject','2023-12-07 09:43:10','2023-12-07 11:19:44',3,NULL);
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
  `level` enum('Primaria','Secundaria','Bachillerato','Universidad') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `teachers_has_subjects` VALUES (1,5,32,1,'Primaria'),(1,4,47,0,'Bachillerato'),(2,3,31,0,'Bachillerato'),(3,3,37,0,'Primaria'),(4,3,26,1,'Secundaria'),(5,4,46,0,'Secundaria'),(6,2,15,0,'Bachillerato'),(8,1,39,0,'Primaria'),(10,6,21,0,'Secundaria'),(13,3,36,0,'Primaria'),(15,7,32,0,'Bachillerato'),(16,2,18,0,'Bachillerato'),(18,5,21,0,'Primaria'),(19,2,45,1,'Primaria'),(21,3,25,1,'Primaria'),(22,3,12,0,'Secundaria'),(23,7,13,1,'Secundaria'),(24,4,13,1,'Secundaria'),(25,4,13,1,'Secundaria'),(26,3,19,0,'Secundaria'),(27,1,16,1,'Secundaria'),(28,4,21,0,'Primaria'),(31,5,11,0,'Secundaria'),(32,2,20,1,'Secundaria'),(33,5,10,0,'Primaria'),(35,3,34,0,'Secundaria'),(36,4,14,1,'Primaria'),(37,5,22,1,'Primaria'),(2,7,19,0,'Secundaria'),(3,4,41,0,'Bachillerato'),(3,6,33,1,'Bachillerato'),(4,6,22,0,'Primaria'),(5,3,20,0,'Secundaria'),(5,5,12,0,'Secundaria'),(6,3,14,1,'Primaria'),(7,3,24,1,'Bachillerato'),(7,2,23,0,'Secundaria'),(8,7,22,1,'Primaria'),(9,7,23,1,'Bachillerato'),(9,4,18,1,'Secundaria'),(10,1,17,1,'Primaria'),(10,7,45,0,'Secundaria'),(11,3,34,0,'Primaria'),(11,4,22,1,'Secundaria'),(12,6,21,0,'Bachillerato'),(12,3,15,0,'Bachillerato'),(13,6,19,1,'Bachillerato'),(14,7,25,1,'Bachillerato'),(14,2,34,0,'Primaria'),(15,2,48,0,'Secundaria'),(16,7,35,1,'Primaria'),(16,5,11,0,'Primaria'),(17,4,15,0,'Bachillerato'),(18,2,37,1,'Primaria'),(18,4,16,0,'Secundaria'),(19,3,49,0,'Primaria'),(19,7,10,0,'Secundaria'),(20,7,13,0,'Primaria'),(20,2,46,1,'Bachillerato'),(21,4,33,0,'Primaria'),(22,5,22,1,'Bachillerato'),(22,1,27,0,'Bachillerato'),(23,4,17,1,'Secundaria'),(24,2,25,0,'Secundaria'),(24,6,42,1,'Bachillerato'),(25,7,29,1,'Primaria'),(25,5,28,1,'Secundaria'),(26,4,13,0,'Bachillerato'),(26,6,34,1,'Secundaria'),(27,7,15,1,'Primaria'),(27,4,25,0,'Primaria'),(28,1,32,1,'Secundaria'),(28,5,15,1,'Bachillerato'),(29,2,41,0,'Primaria'),(29,6,22,0,'Bachillerato'),(30,6,23,0,'Secundaria'),(30,7,37,1,'Primaria'),(31,1,44,0,'Primaria'),(32,7,23,0,'Primaria'),(32,5,12,0,'Bachillerato'),(33,3,34,1,'Primaria'),(34,5,12,0,'Primaria'),(35,4,17,0,'Bachillerato'),(35,5,28,0,'Bachillerato'),(36,5,15,1,'Secundaria'),(36,1,31,0,'Bachillerato'),(37,6,19,1,'Bachillerato'),(37,2,28,1,'Primaria'),(2,5,20,0,'Bachillerato'),(4,5,26,1,'Secundaria'),(6,7,19,1,'Bachillerato'),(7,6,27,1,'Secundaria'),(38,4,50,0,'Bachillerato'),(38,1,50,0,'Bachillerato');
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
  `image` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan','Pérez','juan@example.com','contraseña123','student',40.4168,-3.7038,'1990-05-15',43,0,1,1,'2023-12-05 18:16:17','2023-12-06 10:58:24','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:16:17','2023-12-05 19:16:17'),(2,'John','Smith','johnsmith@example.com','password123','student',40.344,-1.1063,'1990-07-15',10,0,1,2,'2023-12-05 18:24:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:24:20','2023-12-05 19:24:20'),(3,'Emma','Johnson','emmaj@example.com','password456','teacher',37.2614,-6.9447,'1988-05-20',5,0,2,3,'2023-12-05 18:24:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:24:20','2023-12-05 19:24:20'),(7,'Liam','Johnson','liamjohnson@example.com','password123','student',43.3614,-5.8593,'1993-08-15',12,0,1,4,'2023-12-05 18:28:01','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:28:01','2023-12-05 19:28:01'),(8,'Olivia','Brown','oliviabrown@example.com','password456','teacher',37.3886,-5.9826,'1990-04-20',8,0,2,5,'2023-12-05 18:28:01','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:28:01','2023-12-05 19:28:01'),(9,'Noah','Garcia','noahgarcia@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,1,6,'2023-12-05 18:28:01','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:28:01','2023-12-05 19:28:01'),(10,'Ava','Martinez','avamartinez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,2,7,'2023-12-05 18:28:01','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:28:01','2023-12-05 19:28:01'),(11,'Mia','Rodriguez','miarodriguez@example.com','passwordxyz','student',40.344,-1.1063,'1992-03-18',10,0,1,8,'2023-12-05 18:28:01','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:28:01','2023-12-05 19:28:01'),(12,'Ethan','Lopez','ethanlopez@example.com','password456','student',37.2614,-6.9447,'1994-06-22',5,0,1,9,'2023-12-05 18:29:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:29:11','2023-12-05 19:29:11'),(13,'Isabella','Hernandez','isabellah@example.com','password789','teacher',40.344,-1.1063,'1987-09-30',10,0,2,10,'2023-12-05 18:29:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:29:11','2023-12-05 19:29:11'),(14,'James','Gonzalez','jamesg@example.com','passwordabc','student',28.4698,-16.2549,'1996-01-12',15,0,1,11,'2023-12-05 18:29:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:29:11','2023-12-05 19:29:11'),(15,'Charlotte','Perez','charlotteperez@example.com','passwordxyz','teacher',42.0095,-4.5266,'1989-11-05',20,0,2,12,'2023-12-05 18:29:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:29:11','2023-12-05 19:29:11'),(16,'Amelia','Torres','ameliat@example.com','password123','student',37.7707,-3.7886,'1991-07-18',6,0,1,13,'2023-12-05 18:29:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:29:11','2023-12-05 19:29:11'),(17,'Henry','Flores','henryflores@example.com','password456','student',43.3614,-5.8593,'1990-03-15',12,0,1,14,'2023-12-05 18:30:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:30:21','2023-12-05 19:30:21'),(18,'Evelyn','Washington','evelynw@example.com','password789','teacher',37.3886,-5.9826,'1993-10-20',8,0,2,15,'2023-12-05 18:30:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:30:21','2023-12-05 19:30:21'),(19,'Mason','Simmons','masonsimmons@example.com','passwordabc','student',42.0095,-4.5266,'1992-12-10',20,0,1,16,'2023-12-05 18:30:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:30:21','2023-12-05 19:30:21'),(20,'Harper','Russell','harperr@example.com','passwordxyz','teacher',28.4698,-16.2549,'1988-07-25',15,0,2,17,'2023-12-05 18:30:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:30:21','2023-12-05 19:30:21'),(21,'Avery','Diaz','averyd@example.com','password123','student',37.7707,-3.7886,'1991-03-18',6,0,1,18,'2023-12-05 18:30:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:30:21','2023-12-05 19:30:21'),(24,'Emma','Johnson','emma_johnson@example.com','password456','teacher',37.2614,-6.9447,'1988-05-20',5,0,2,19,'2023-12-05 18:32:38','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:32:38','2023-12-05 19:32:38'),(25,'Noah','Garcia','noah_garcia@example.com','password789','student',39.5342,2.8577,'1993-11-18',13,0,1,20,'2023-12-05 18:32:38','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:32:38','2023-12-05 19:32:38'),(26,'Olivia','Brown','olivia.brown@example.com','passwordabc','teacher',37.7707,-3.7886,'1992-03-10',6,0,2,21,'2023-12-05 18:32:38','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:32:38','2023-12-05 19:32:38'),(27,'William','Martinez','william.martinez@example.com','passwordxyz','student',37.3886,-5.9826,'1990-02-25',8,0,1,22,'2023-12-05 18:32:38','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:32:38','2023-12-05 19:32:38'),(28,'Ava','Rodriguez','ava.rodriguez@example.com','password123','student',40.344,-1.1063,'1991-07-18',10,0,2,23,'2023-12-05 18:32:38','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:32:38','2023-12-05 19:32:38'),(29,'Mia','Flores','mia_flores@example.com','password123','teacher',37.2614,-6.9447,'1993-08-22',5,0,2,24,'2023-12-05 18:33:24','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:33:24','2023-12-05 19:33:24'),(30,'James','Nguyen','james_nguyen@example.com','password456','student',37.3886,-5.9826,'1990-04-15',8,0,1,25,'2023-12-05 18:33:24','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:33:24','2023-12-05 19:33:24'),(31,'Charlotte','Gomez','charlotte_gomez@example.com','password789','teacher',42.0095,-4.5266,'1995-12-10',20,0,2,26,'2023-12-05 18:33:24','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:33:24','2023-12-05 19:33:24'),(32,'Lucas','Torres','lucas_torres@example.com','passwordabc','student',28.4698,-16.2549,'1988-07-25',15,0,1,27,'2023-12-05 18:33:24','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:33:24','2023-12-05 19:33:24'),(33,'Harper','Ramos','harper_ramos@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,2,28,'2023-12-05 18:33:24','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:33:24','2023-12-05 19:33:24'),(34,'Evelyn','Hernandez','evelyn.hernandez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,1,29,'2023-12-05 18:34:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:34:11','2023-12-05 19:34:11'),(35,'Liam','Rodriguez','liam.rodriguez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,2,30,'2023-12-05 18:34:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:34:11','2023-12-05 19:34:11'),(36,'Avery','Gonzalez','avery.gonzalez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,1,31,'2023-12-05 18:34:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:34:11','2023-12-05 19:34:11'),(37,'Mason','Martinez','mason.martinez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,2,32,'2023-12-05 18:34:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:34:11','2023-12-05 19:34:11'),(38,'Sofia','Moreno','sofia.moreno@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,33,'2023-12-05 18:34:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:34:11','2023-12-05 19:34:11'),(39,'Liam','Sanchez','liamsanchez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,34,'2023-12-05 18:34:58','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:34:58','2023-12-05 19:34:58'),(40,'Olivia','Perez','oliviaperez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,35,'2023-12-05 18:34:58','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:34:58','2023-12-05 19:34:58'),(41,'Mia','Gomez','miagomez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,36,'2023-12-05 18:34:58','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:34:58','2023-12-05 19:34:58'),(42,'Lucas','Hernandez','lucashernandez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,37,'2023-12-05 18:34:58','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:34:58','2023-12-05 19:34:58'),(43,'Emma','Torres','emmatorres@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,2,38,'2023-12-05 18:34:58','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:34:58','2023-12-05 19:34:58'),(44,'Sophia','Lopez','sophialopez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,1,39,'2023-12-05 18:35:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:35:49','2023-12-05 19:35:49'),(45,'Noah','Martinez','noahmartinez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,2,40,'2023-12-05 18:35:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:35:49','2023-12-05 19:35:49'),(46,'Ava','Gonzalez','ava.gonzalez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,1,41,'2023-12-05 18:35:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:35:49','2023-12-05 19:35:49'),(47,'Elijah','Hernandez','elijahhernandez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,2,42,'2023-12-05 18:35:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:35:49','2023-12-05 19:35:49'),(49,'William','Garcia','william.garcia@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,43,'2023-12-05 18:37:12','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:37:12','2023-12-05 19:37:12'),(50,'Olivia','Perez','olivia.perez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,44,'2023-12-05 18:37:12','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:37:12','2023-12-05 19:37:12'),(51,'Ethan','Gomez','ethan.gomez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,45,'2023-12-05 18:37:12','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:37:12','2023-12-05 19:37:12'),(52,'Amelia','Hernandez','amelia.hernandez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,46,'2023-12-05 18:37:12','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:37:12','2023-12-05 19:37:12'),(53,'Liam','Torres','liam.torres@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,47,'2023-12-05 18:37:12','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:37:12','2023-12-05 19:37:12'),(54,'Olivia','Gonzalez','olivia.gonzalez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,1,48,'2023-12-05 18:38:25','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:38:25','2023-12-05 19:38:25'),(55,'William','Rodriguez','william.rodriguez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,2,49,'2023-12-05 18:38:25','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:38:25','2023-12-05 19:38:25'),(56,'James','Hernandez','james.hernandez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,1,50,'2023-12-05 18:38:25','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:38:25','2023-12-05 19:38:25'),(57,'Ethan','Torres','ethan.torres@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,2,51,'2023-12-05 18:38:25','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:38:25','2023-12-05 19:38:25'),(58,'Ava','Hernandez','ava.hernandez@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,52,'2023-12-05 18:38:25','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:38:25','2023-12-05 19:38:25'),(59,'Elijah','Martinez','elijah.martinez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,53,'2023-12-05 18:39:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:39:11','2023-12-05 19:39:11'),(60,'Amelia','Garcia','amelia.garcia@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,54,'2023-12-05 18:39:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:39:11','2023-12-05 19:39:11'),(61,'Avery','Hernandez','avery.hernandez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,55,'2023-12-05 18:39:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:39:11','2023-12-05 19:39:11'),(62,'Mia','Gonzalez','mia.gonzalez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,56,'2023-12-05 18:39:11','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:39:11','2023-12-05 19:39:11'),(64,'Olivia','Rodriguez','olivia.rodriguez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,57,'2023-12-05 18:39:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:39:49','2023-12-05 19:39:49'),(65,'William','Hernandez','william.hernandez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,58,'2023-12-05 18:39:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:39:49','2023-12-05 19:39:49'),(66,'James','Gomez','james.gomez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,59,'2023-12-05 18:39:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:39:49','2023-12-05 19:39:49'),(67,'Ethan','Martinez','ethan.martinez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,60,'2023-12-05 18:39:49','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:39:49','2023-12-05 19:39:49'),(69,'Ethan','Rodriguez','ethan.rodriguez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,61,'2023-12-05 18:40:34','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:40:34','2023-12-05 19:40:34'),(70,'Oliver','Garcia','oliver.garcia@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,62,'2023-12-05 18:40:34','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:40:34','2023-12-05 19:40:34'),(71,'Mia','Hernandez','mia.hernandez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,63,'2023-12-05 18:40:34','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:40:34','2023-12-05 19:40:34'),(72,'Lucas','Gomez','lucas.gomez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,64,'2023-12-05 18:40:34','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:40:34','2023-12-05 19:40:34'),(73,'Emma','Rodriguez','emma.rodriguez@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,65,'2023-12-05 18:40:34','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:40:34','2023-12-05 19:40:34'),(74,'Olivia','Hernandez','olivia.hernandez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,66,'2023-12-05 18:41:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:41:21','2023-12-05 19:41:21'),(75,'William','Gonzalez','william.gonzalez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,67,'2023-12-05 18:41:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:41:21','2023-12-05 19:41:21'),(76,'James','Martinez','james.martinez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,68,'2023-12-05 18:41:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:41:21','2023-12-05 19:41:21'),(77,'Ethan','Garcia','ethan.garcia@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,69,'2023-12-05 18:41:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:41:21','2023-12-05 19:41:21'),(78,'Ava','Martinez','ava.martinez@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,70,'2023-12-05 18:41:21','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:41:21','2023-12-05 19:41:21'),(79,'Oliver','Rodriguez','oliver.rodriguez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,71,'2023-12-05 18:42:10','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:42:10','2023-12-05 19:42:10'),(80,'Sophia','Gomez','sophia.gomez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,72,'2023-12-05 18:42:10','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:42:10','2023-12-05 19:42:10'),(81,'Mia','Martinez','mia.martinez@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,73,'2023-12-05 18:42:10','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:42:10','2023-12-05 19:42:10'),(82,'Lucas','Hernandez','lucas.hernandez@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,74,'2023-12-05 18:42:10','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:42:10','2023-12-05 19:42:10'),(83,'Emma','Garcia','emma.garcia@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,75,'2023-12-05 18:42:10','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:42:10','2023-12-05 19:42:10'),(84,'Olivia','Garcia','olivia.garcia@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,76,'2023-12-05 18:42:52','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:42:52','2023-12-05 19:42:52'),(86,'Olivia','Martinez','olivia.martinez@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,77,'2023-12-05 18:43:36','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:43:36','2023-12-05 19:43:36'),(87,'Sophia','Hernandez','sophia.hernandez@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,78,'2023-12-05 18:43:36','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:43:36','2023-12-05 19:43:36'),(89,'Olivia','Martinez','olivia.martinez91@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,79,'2023-12-05 18:44:29','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:44:29','2023-12-05 19:44:29'),(90,'Sophia','Hernandez','sophia.hernandez92@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,80,'2023-12-05 18:44:29','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:44:29','2023-12-05 19:44:29'),(91,'James','Hernandez','james.hernandez93@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,81,'2023-12-05 18:44:29','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:44:29','2023-12-05 19:44:29'),(92,'Ethan','Gomez','ethan.gomez94@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,82,'2023-12-05 18:44:29','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:44:29','2023-12-05 19:44:29'),(93,'Ava','Hernandez','ava.hernandez95@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,83,'2023-12-05 18:44:29','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:44:29','2023-12-05 19:44:29'),(94,'Oliver','Martinez','oliver.martinez96@example.com','password123','student',37.2614,-6.9447,'1993-08-22',5,0,2,84,'2023-12-05 18:45:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:45:20','2023-12-05 19:45:20'),(95,'Sophia','Gomez','sophia.gomez97@example.com','password456','teacher',37.3886,-5.9826,'1990-04-15',8,0,1,85,'2023-12-05 18:45:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:45:20','2023-12-05 19:45:20'),(96,'James','Gomez','james.gomez98@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,86,'2023-12-05 18:45:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:45:20','2023-12-05 19:45:20'),(97,'Ethan','Rodriguez','ethan.rodriguez99@example.com','passwordabc','teacher',28.4698,-16.2549,'1988-07-25',15,0,1,87,'2023-12-05 18:45:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:45:20','2023-12-05 19:45:20'),(98,'Ava','Hernandez','ava.hernandez100@example.com','passwordxyz','student',37.7707,-3.7886,'1991-03-18',6,0,1,88,'2023-12-05 18:45:20','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:45:20','2023-12-05 19:45:20'),(99,'Emma','Garcia','emma.garcia4@example.com','password123','student',37.3886,-5.9826,'1993-08-22',8,0,2,89,'2023-12-05 18:46:42','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:46:42','2023-12-05 19:46:42'),(100,'Noah','Hernandez','noah.hernandez5@example.com','password456','teacher',43.3614,-5.8593,'1990-04-15',12,0,1,90,'2023-12-05 18:46:42','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252329_1200.jpg','2023-12-05 19:46:42','2023-12-05 19:46:42'),(101,'Liam','Rodriguez','liam.rodriguez6@example.com','password789','student',42.0095,-4.5266,'1995-12-10',20,0,2,91,'2023-12-05 18:46:42','2023-12-06 11:56:52','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:46:42','2023-12-05 19:46:42'),(102,'Sergio','Vélez Díaz','sergio@students.com','$2a$08$OHcdEkK2c3UKB2MsNOTcOeJI03GGamXYfT9fF7tcOWbbNBt3fZa9G','student',37.9781,-0.789709,'2023-12-03',37,0,1,101,'2023-12-07 09:41:30','2023-12-07 11:25:24','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:46:42','2023-12-07 10:41:30'),(103,'Sergio','Vélez Díaz','sergio@teachers.com','$2a$08$qbXGS11KNcJM2uNqM2Eibuv9KpwgICFqu/MoVOifHnuOZUDwro2yu','teacher',37.9781,-0.789709,'2023-12-01',18,0,1,102,'2023-12-07 09:43:10','2023-12-07 11:25:24','https://img.europapress.es/fotoweb/fotonoticia_20150331134913-15031252319_1200.jpg','2023-12-05 19:46:42','2023-12-07 10:43:10'),(104,'fdgfdg','fgdgfdgds','fsdfa@gma.com','$2a$08$bXs7fF11QnKvhMSuJ5vVXu.LL3Y3LYLJDjfiyMTBsaLcLCbsDPSwC','student',37.9781,-0.786432,'2023-12-05',25,0,NULL,103,'2023-12-11 19:45:02','2023-12-11 20:45:02',NULL,NULL,'2023-12-11 20:45:02'),(105,'Cristhian','Pérez Mateos','cristhian@admin.com','$2a$08$0CkvPqFwEmZY7HcC4TJcm.bzB81nKwzJr6eylZSAffUUZqFOBgdOS','admin',37.9781,-0.786432,'2023-12-02',46,0,NULL,104,'2023-12-11 19:46:02','2023-12-11 20:46:49',NULL,NULL,'2023-12-11 20:46:02');
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
if new.role='teacher' then
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

-- Dump completed on 2023-12-11 21:55:53
