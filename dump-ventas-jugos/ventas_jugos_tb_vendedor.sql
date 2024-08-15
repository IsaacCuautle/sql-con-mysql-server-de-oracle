-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ventas_jugos
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `tb_vendedor`
--

DROP TABLE IF EXISTS `tb_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vendedor` (
  `MATRICULA` varchar(5) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `BARRIO` varchar(50) DEFAULT NULL,
  `COMISION` float DEFAULT NULL,
  `FECHA_ADMISION` date DEFAULT NULL,
  `DE_VACACIONES` bit(1) DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vendedor`
--

LOCK TABLES `tb_vendedor` WRITE;
/*!40000 ALTER TABLE `tb_vendedor` DISABLE KEYS */;
INSERT INTO `tb_vendedor` VALUES ('235','Miguel Pavón Silva','Condesa',0.084,'2014-08-15',_binary '\0'),('236','Claudia Morales','Del Valle',0.084,'2013-09-17',_binary ''),('237','Concepción Martinez','Contadero',0.1155,'2017-03-18',_binary ''),('238','Patricia Sánchez','Oblatos',0,'2016-08-21',_binary '\0'),('256','FERNANDO ROUIZ','OBLATOS',0.105,'2015-06-14',_binary '\0'),('257','FERNANDO ROJAS','OBLATOS',0.105,'2015-06-14',_binary '\0');
/*!40000 ALTER TABLE `tb_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 10:14:59
