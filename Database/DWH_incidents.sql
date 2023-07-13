-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 10.211.55.15    Database: dwh
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `d_assigned_group`
--

DROP TABLE IF EXISTS `d_assigned_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_assigned_group` (
  `id_assigned_group` int unsigned NOT NULL AUTO_INCREMENT,
  `assigned_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id_assigned_group`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_company`
--

DROP TABLE IF EXISTS `d_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_company` (
  `id_company` int unsigned NOT NULL AUTO_INCREMENT,
  `Company` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Company_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_date`
--

DROP TABLE IF EXISTS `d_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_date` (
  `Date` date NOT NULL,
  `Year` int unsigned DEFAULT NULL,
  `Month` int unsigned DEFAULT NULL,
  `DayOfYear` int unsigned DEFAULT NULL,
  `DayOfMonth` int unsigned DEFAULT NULL,
  `DayOfWeek` int unsigned DEFAULT NULL,
  `WeekOfYear` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_hour`
--

DROP TABLE IF EXISTS `d_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_hour` (
  `Hour` int unsigned NOT NULL,
  `turn` tinytext,
  PRIMARY KEY (`Hour`),
  KEY `idx_d_hour_lookup` (`Hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_login`
--

DROP TABLE IF EXISTS `d_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_login` (
  `id_login` int unsigned NOT NULL AUTO_INCREMENT,
  `login` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `assignee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_priority`
--

DROP TABLE IF EXISTS `d_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_priority` (
  `id_priority` int unsigned NOT NULL,
  `Priority_Desc` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `response_desc` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resolution_desc` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `h_incident`
--

DROP TABLE IF EXISTS `h_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `h_incident` (
  `id_incident` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_priority` int unsigned NOT NULL,
  `priority_changed` tinyint unsigned NOT NULL,
  `id_company` int unsigned DEFAULT NULL,
  `response_time` int unsigned DEFAULT NULL,
  `sla_response_meet` int unsigned DEFAULT NULL,
  `id_response_group` int unsigned DEFAULT NULL,
  `id_response_login` int unsigned DEFAULT NULL,
  `sla_resolution_meet` int unsigned DEFAULT NULL,
  `id_resolution_group` int unsigned DEFAULT NULL,
  `id_resolution_login` int unsigned DEFAULT NULL,
  `sla_reopen_meet` int unsigned DEFAULT NULL,
  `id_reopen_group` int unsigned DEFAULT NULL,
  `id_reopen_login` int unsigned DEFAULT NULL,
  `num_groups` int unsigned DEFAULT NULL,
  `num_assignments` int unsigned DEFAULT NULL,
  `num_login` int unsigned DEFAULT NULL,
  `num_resolutions` int unsigned DEFAULT NULL,
  `d_open_date` date DEFAULT NULL,
  `d_resolved_date` date DEFAULT NULL,
  `sla_response_date` datetime DEFAULT NULL,
  `sla_resolution_date` datetime DEFAULT NULL,
  `sla_reopen_date` datetime DEFAULT NULL,
  `d_open_hour` int unsigned DEFAULT NULL,
  `d_resolved_hour` int unsigned DEFAULT NULL,
  `resolution_first_time` int DEFAULT NULL,
  `resolution_total_time` int DEFAULT NULL,
  `pending_time` int DEFAULT NULL,
  `id_assigned_group` int unsigned DEFAULT NULL,
  `id_assigned_login` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_incident`),
  UNIQUE KEY `id_incidencia_UNIQUE` (`id_incident`),
  KEY `id_resolution_group` (`id_resolution_group`),
  KEY `id_priority` (`id_priority`),
  KEY `id_reopen_group` (`id_reopen_group`),
  KEY `id_response_login` (`id_response_login`),
  KEY `d_resolution_login` (`id_resolution_login`),
  KEY `id_reopen_login` (`id_reopen_login`),
  KEY `id_company` (`id_company`),
  KEY `d_open_date` (`d_open_date`),
  KEY `d_resolved_date` (`d_resolved_date`),
  KEY `d_open_hour` (`d_open_hour`),
  KEY `d_resolved_hour` (`d_resolved_hour`),
  KEY `id_response_group` (`id_response_group`),
  KEY `id_assigned_login` (`id_assigned_login`),
  KEY `id_assigned_group` (`id_assigned_group`),
  CONSTRAINT `h_incident_ibfk_10` FOREIGN KEY (`id_company`) REFERENCES `d_company` (`id_company`),
  CONSTRAINT `h_incident_ibfk_11` FOREIGN KEY (`d_open_date`) REFERENCES `d_date` (`Date`),
  CONSTRAINT `h_incident_ibfk_12` FOREIGN KEY (`d_resolved_date`) REFERENCES `d_date` (`Date`),
  CONSTRAINT `h_incident_ibfk_16` FOREIGN KEY (`d_open_hour`) REFERENCES `d_hour` (`Hour`),
  CONSTRAINT `h_incident_ibfk_17` FOREIGN KEY (`d_resolved_hour`) REFERENCES `d_hour` (`Hour`),
  CONSTRAINT `h_incident_ibfk_2` FOREIGN KEY (`id_resolution_group`) REFERENCES `d_assigned_group` (`id_assigned_group`),
  CONSTRAINT `h_incident_ibfk_21` FOREIGN KEY (`id_response_group`) REFERENCES `d_assigned_group` (`id_assigned_group`) ON DELETE CASCADE,
  CONSTRAINT `h_incident_ibfk_22` FOREIGN KEY (`id_assigned_group`) REFERENCES `d_assigned_group` (`id_assigned_group`),
  CONSTRAINT `h_incident_ibfk_23` FOREIGN KEY (`id_assigned_login`) REFERENCES `d_login` (`id_login`),
  CONSTRAINT `h_incident_ibfk_5` FOREIGN KEY (`id_priority`) REFERENCES `d_priority` (`id_priority`),
  CONSTRAINT `h_incident_ibfk_6` FOREIGN KEY (`id_reopen_group`) REFERENCES `d_assigned_group` (`id_assigned_group`),
  CONSTRAINT `h_incident_ibfk_7` FOREIGN KEY (`id_response_login`) REFERENCES `d_login` (`id_login`),
  CONSTRAINT `h_incident_ibfk_8` FOREIGN KEY (`id_resolution_login`) REFERENCES `d_login` (`id_login`),
  CONSTRAINT `h_incident_ibfk_9` FOREIGN KEY (`id_reopen_login`) REFERENCES `d_login` (`id_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-13 11:31:39
