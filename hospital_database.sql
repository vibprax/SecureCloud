-- MariaDB dump 10.19  Distrib 10.5.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Hospital
-- ------------------------------------------------------
-- Server version	10.5.16-MariaDB

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

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. Smith','Cardiologist','smith@example.com'),(2,'Dr. Johnson','Orthopedic Surgeon','johnson@example.com'),(3,'Dr. Patel','Dermatologist','patel@example.com');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `report_path` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Emily Johnson','1992-03-10','Female',1,' /root/patient reports/Emily johnson/Emily johnson.pdf',' /root/patient reports/Emily johnson/Emily johnson ECG-1.jpg'),(2,'Alexander Smith','1988-09-25','Male',2,' /root/patient reports/Alexander Smith/Alexander Smith.pdf',' /root/patient reports/Alexander Smith/Alexander Smith xray.jpg'),(3,'Olivia Williams','1975-06-18','Female',1,' /root/patient reports/Olivia Williams /Olivia Williams.pdf',' /root/patient reports/Olivia Williams/Olivia Williams Holter.png '),(4,'Ethan Brown','2000-11-03','Male',3,' /root/patient reports/Ethan Brown/Ethan Brown.pdf',' /root/patient reports/Ethan Brown/Ethan Brown skin allergy.png '),(5,'Sophia Davis','1995-02-15','Female',2,' /root/patient reports/Sophia Davis/Sophia Davis.pdf',' /root/patient reports/Sophia Davis/Sophia Davis knee xray.jpg '),(6,'Liam Miller','1982-08-22','Male',1,' /root/patient reports/Liam Miller/Liam Miller.pdf',' /root/patient reports/Liam Miller/Liam Miller angiography.jpeg '),(7,'Ava Wilson','1979-04-12','Female',3,' /root/patient reports/Ava Wilson/Ava Wilson.pdf',' /root/patient reports/Ava Wilson/Ava Wilson AFP-Focus-Wood-Inflammatory.jpg '),(8,'Noah Taylor','1998-07-07','Male',2,' /root/patient reports/Noah Taylor/Noah Taylor.pdf',' /root/patient reports/Noah Taylor/Noah Taylor X-ray.jpg '),(9,'Isabella Martinez','2003-01-28','Female',1,' /root/patient reports/Isabella Martinez/Isabella Martinez.pdf',' /root/patient reports/Isabella Martinez/ Isabella Martinez echodiagram.jpg'),(10,'Lucas Anderson','1970-12-06','Male',3,' /root/patient reports/Lucas Anderson/Lucas Anderson.pdf',' /root/patient reports/Lucas Anderson/ Lucas Anderson skin biopsy.jpg');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-25 11:38:43
