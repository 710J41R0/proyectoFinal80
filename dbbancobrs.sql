CREATE DATABASE  IF NOT EXISTS `dbbancobrs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbbancobrs`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbbancobrs
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correoElectronico` varchar(80) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `clave` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'actu','asup','asum','3874439843','sdcnd@dnkd.com','M','CONVFDNLVFD','asu'),(12,'assa','saas','asas','1234567890','as@q.com','M','dskc','asq'),(123,'sdfsfsf','sdfdsfds','Mgañla','3465456756','aas@fvdf.com','F','OJNSDKV76ASNDA','aaa'),(1837,'usewr','cre','ww','1234567890','q@q.q','F','qwcec45ds','userw'),(7357,'test123','for','test','1234567890','test@test.com','F','TEST6183DSLKSD','test4'),(9834,'other','user','again','1234567890','a@q.com','F','another7s35','another'),(12341,'Ento','Asu','Ser','1234567890','q@a.com','F','cas4ascx','user'),(12345,'Ahora','Simon','Ya','1234567890','q@q.com','F','sdlcnsdk8oas','user'),(1234567,'usert','ast','tes','1234567890','q@q.q','F','cslnsdc4','test'),(3196140,'ElPrimo','Coc','Cas','1234567890','el@primo.com','M','ELR35034ISDLC','elprimo'),(123456789,'Cualquiera','ksdhkjvsd','lknsdlkcns','1234567890','q@q.com','F','nlsdcisdc876caskjn','user');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `noCuenta` varchar(10) NOT NULL,
  `fechaAfiliacion` date NOT NULL,
  `saldo` float NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`noCuenta`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `folio` varchar(10) NOT NULL,
  `nombreBeneficiario` varchar(50) DEFAULT NULL,
  `cuentaBeneficiario` varchar(10) NOT NULL,
  `monto` float NOT NULL,
  `noCuenta` varchar(10) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `noCuenta` (`noCuenta`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cuenta` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocuenta` (
  `idTipoCuenta` int NOT NULL,
  `nombreCuenta` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `noCuenta` varchar(10) NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`idTipoCuenta`),
  KEY `noCuenta` (`noCuenta`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tipocuenta_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cuenta` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tipocuenta_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocuenta`
--

LOCK TABLES `tipocuenta` WRITE;
/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimiento`
--

DROP TABLE IF EXISTS `tipomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomovimiento` (
  `idTipoMovimiento` int NOT NULL,
  `nombreMovimiento` varchar(50) NOT NULL,
  `folio` varchar(10) NOT NULL,
  PRIMARY KEY (`idTipoMovimiento`),
  KEY `folio` (`folio`),
  CONSTRAINT `tipomovimiento_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `movimiento` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimiento`
--

LOCK TABLES `tipomovimiento` WRITE;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-19  2:57:06
