-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `idDiagnosis` int(11) NOT NULL,
  `nameDiag` varchar(255) NOT NULL,
  `symptomps` varchar(255) NOT NULL,
  `medicines` varchar(255) NOT NULL,
  PRIMARY KEY (`idDiagnosis`),
  UNIQUE KEY `idDiagnosis_UNIQUE` (`idDiagnosis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'Angina','Severe sore throat, fever','Antiangin tablets, lugol spray'),(2,'Hypertension','High pressure constantly','Koncor tables'),(3,'Gastritis','Pain in the stomach, heartburn','Phosphalugel, rennie tablets'),(4,'Osteochondrosis','headache, vetrigo, joint pain','manual therapy, massage, BAD\'s ');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `idDoctors` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `cabinet` int(11) NOT NULL,
  `site` int(11) NOT NULL,
  `time_of_receipt` varchar(255) NOT NULL,
  PRIMARY KEY (`idDoctors`),
  UNIQUE KEY `idDoctors_UNIQUE` (`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Ekaterina Puhova',1,2,'Mon - Wed: 9:00 - 18:00'),(2,'Natalia Ivanova',2,1,'Mon - Thu: 14:00 - 18:00'),(3,'Oksana Lapina',1,2,'Thur - Sat: 9:00 - 14:00'),(4,'Aleksey Romanov',2,1,'Wed - Fr: 9:00 - 18:00');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `idSick` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `data_of_illness` varchar(30) NOT NULL,
  `Diagnosis_idDiagnosis` int(11) DEFAULT NULL,
  `Doctors_idDoctors` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSick`),
  UNIQUE KEY `idtable1_UNIQUE` (`idSick`),
  KEY `fk_Sick_Diagnosis_idx` (`Diagnosis_idDiagnosis`),
  KEY `fk_Sick_Doctors1_idx` (`Doctors_idDoctors`),
  CONSTRAINT `fk_Sick_Diagnosis` FOREIGN KEY (`Diagnosis_idDiagnosis`) REFERENCES `diagnosis` (`idDiagnosis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Ivan Komarov','Lesnoy prospekt 140, 48','29.11.2019',4,4),(2,'Nikolay Bistrov','Komarova 3, 5','25.11.2019',1,1),(3,'Tatiana Surina','Tarskaya 8A, 24','03.12.2019',2,3),(4,'Olga Kauts','Malaya 20, 27','11.11.2019',4,1),(5,'Maria Trostnikova','Bolshoy Prospekt 21, 11','08.12.2019',3,2),(6,'Zahar Bulatov','Gerzena 3, 120','09.12.2019',NULL,3);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE KEY `idUsers_UNIQUE` (`idUsers`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'employee','0000'),(2,'admin','1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16 18:39:58
