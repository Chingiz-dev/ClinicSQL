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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeId` bigint NOT NULL,
  `Name` longtext NOT NULL,
  `Surname` longtext NOT NULL,
  `Lastname` longtext,
  `Fin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Birthday` date NOT NULL,
  `GenderId` int NOT NULL,
  `Email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DepartmentId` int NOT NULL,
  `Number` bigint NOT NULL,
  `SpecializationId` int NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `FK_Employees_Genders` (`GenderId`),
  KEY `FK_Employees_Departments` (`DepartmentId`),
  KEY `FK_Employees_Specializations` (`SpecializationId`),
  CONSTRAINT `FK_Employees_Departments` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`DepartmentId`),
  CONSTRAINT `FK_Employees_Genders` FOREIGN KEY (`GenderId`) REFERENCES `genders` (`GenderId`),
  CONSTRAINT `FK_Employees_Specializations` FOREIGN KEY (`SpecializationId`) REFERENCES `specializations` (`SpecializationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Elmar\r\n','Huseynov\r\n','Null\r\n','21KET876\r\n','1972-01-02',1,'elmar@gmail.com\r\n',1,994501234567,1),(2,'Ali','Jafarov\r\n','Fuad\r\n','113OT33\r\n','1982-12-13',1,'alij@gmail.com\r\n',4,994551234567,1),(3,'Firat\r\n','Huseynov\r\n','Farman\r\n','87TR232\r\n','1998-09-30',1,'f@gmail.com\r\n',3,994557654321,1),(4,'Ali\r\n','Dovrusov\r\n','NULL\r\n','762RY98\r\n','1997-02-21',1,'a@gmail.com\r\n',2,994701234567,2),(5,'Nigar\r\n','Ismayilova\r\n','Huseyn\r\n','123AZ32\r\n','2021-09-12',2,'s@gmail.com\r\n',3,994502343568,2),(6,'Samir\r\n','Mammadli\r\n','Rasim\r\n','98OP765\r\n','1985-05-17',1,'samir@gmail.com\r\n',4,994709876542,1),(7,'Gulbadam\r\n','Mamedova\r\n','Xezer\r\n','763YT87\r\n','1976-02-12',2,'g@gmail.com\r\n',2,994511234567,1),(8,'Jessica\r\n','Alba\r\n','John\r\n','56OPE876\r\n','1996-12-23',2,'j@gmail.com\r\n',1,994555906090,2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-11 14:23:01
