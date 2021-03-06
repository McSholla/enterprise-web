-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: magazinedb
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS magazinedb;
CREATE DATABASE magazinedb;
USE magazinedb;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Faculty1'),(2,'Faculty2');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Path` text NOT NULL,
  `Author_Id` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Year_Id` int(10) NOT NULL,
  `Has_Sent_Notice` tinyint(1) NOT NULL,
  `Comment` mediumtext DEFAULT NULL,
  `Is_Selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKSubmission108191` (`Author_Id`),
  KEY `FKSubmission463040` (`Year_Id`),
  CONSTRAINT `FKSubmission108191` FOREIGN KEY (`Author_Id`) REFERENCES `user` (`Id`),
  CONSTRAINT `FKSubmission463040` FOREIGN KEY (`Year_Id`) REFERENCES `year` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (43,'1.jtqztnfh.atla-elements.png',1,'2019-03-20',1,1,'aaa',1),(44,'C:\\Users\\vzttz\\magazineApp\\upload-root\\1.jtqzu214.Tai Icon.png',1,'2018-03-27',2,1,'',1),(45,'C:\\Users\\vzttz\\magazineApp\\upload-root\\4.jtv7ix54.Tai Icon.png',5,'2019-03-30',1,1,'',1),(53,'C:\\Users\\vzttz\\magazineApp\\upload-root\\f1Faculty1_u1_20190421.12.35.28.45328334_693456.png',1,'2019-04-21',1,0,'',0);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Role` tinytext NOT NULL,
  `Faculty_Id` int(10) DEFAULT NULL,
  `Has_Accepted_TOC` tinyint(1) NOT NULL,
  `Email` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKUser34225` (`Faculty_Id`),
  CONSTRAINT `FKUser34225` FOREIGN KEY (`Faculty_Id`) REFERENCES `faculty` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Student',1,1,'a@gmail.com'),(2,'Coordinator',1,1,'ewd.coordinator@sharklasers.com'),(3,'Manager',NULL,1,'none'),(4,'Coordinator',2,1,'ewd.coordinator2@sharklasers.com'),(5,'Student',2,1,'student2@gmail.com'),(6,'Student',1,0,'lazy@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Entry_ClosureDate` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,'2019-01-01','2019-12-31','2019-08-28'),(2,'2018-01-01','2018-12-31','2018-08-28');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-21 20:14:13
