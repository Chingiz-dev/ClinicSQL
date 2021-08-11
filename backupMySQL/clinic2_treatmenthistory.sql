-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinic2
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `treatmenthistory`
--

DROP TABLE IF EXISTS `treatmenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatmenthistory` (
  `TreatmentHistoryId` bigint NOT NULL,
  `ClientApplyId` bigint NOT NULL,
  `EmployeeId` bigint NOT NULL,
  `ServiceId` int NOT NULL,
  `StatusId` int NOT NULL,
  `DischargeDate` date DEFAULT NULL,
  `CommentId` int NOT NULL,
  PRIMARY KEY (`TreatmentHistoryId`),
  KEY `FK_TreatmentHistory_ClientApply` (`ClientApplyId`),
  KEY `FK_TreatmentHistory_Statuses` (`StatusId`),
  KEY `FK_TreatmentHistory_Employees` (`EmployeeId`),
  KEY `FK_TreatmentHistory_Services` (`ServiceId`),
  KEY `FK_TreatmentHistory_Comments` (`CommentId`),
  CONSTRAINT `FK_TreatmentHistory_ClientApply` FOREIGN KEY (`ClientApplyId`) REFERENCES `clientapply` (`ClientApplyId`),
  CONSTRAINT `FK_TreatmentHistory_Comments` FOREIGN KEY (`CommentId`) REFERENCES `comments` (`CommentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TreatmentHistory_Employees` FOREIGN KEY (`EmployeeId`) REFERENCES `employees` (`EmployeeId`),
  CONSTRAINT `FK_TreatmentHistory_Services` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`),
  CONSTRAINT `FK_TreatmentHistory_Statuses` FOREIGN KEY (`StatusId`) REFERENCES `statuses` (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmenthistory`
--

LOCK TABLES `treatmenthistory` WRITE;
/*!40000 ALTER TABLE `treatmenthistory` DISABLE KEYS */;
INSERT INTO `treatmenthistory` VALUES (1,1,2,9,3,NULL,1),(2,1,1,5,2,'2013-12-11',2),(3,2,8,1,1,NULL,3),(5,3,6,7,2,'2017-08-20',4);
/*!40000 ALTER TABLE `treatmenthistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-11 14:23:02
