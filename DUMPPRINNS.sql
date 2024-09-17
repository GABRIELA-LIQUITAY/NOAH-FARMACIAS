CREATE DATABASE  IF NOT EXISTS `prinns` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prinns`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prinns
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `auditoria_facturacionab`
--

DROP TABLE IF EXISTS `auditoria_facturacionab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_facturacionab` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `campo_modificado` varchar(50) NOT NULL,
  `valor_anterior` decimal(14,4) DEFAULT NULL,
  `valor_nuevo` decimal(14,4) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_facturacionab`
--

LOCK TABLES `auditoria_facturacionab` WRITE;
/*!40000 ALTER TABLE `auditoria_facturacionab` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_facturacionab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CUIL` varchar(20) NOT NULL,
  `APENOM` varchar(60) NOT NULL,
  `LEGAJOREAL` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_EMPLEADO_SUCURSAL` FOREIGN KEY (`ID`) REFERENCES `empleado_sucursal` (`LEGAJO`)
) ENGINE=InnoDB AUTO_INCREMENT=293471990 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (174528302,'174528302','Alsina, Osvaldo Andres',17215),(192637484,'192637484','Morales, Emilio Manuel',23633),(192730283,'192730283','Ramirez, Ruben Horacio',20182),(202156241,'202156241','Alvarez, Mariana Mabel',20768),(202912372,'202912372','Soria, Rocio Agustina',21462),(203929192,'203929192','Ramos, Jorge Luis',19272),(213232526,'213232526','Calapeña, Yanina Mabel',21938),(213354678,'213354678','Alonso, David Joel',21345),(213638495,'213638495','Mendez, Carolina Delfina',21587),(214560986,'214560986','Mamani, Miriam Edith',19874),(223646373,'223646373','Perez, Rodolfo Ezequiel',20319),(233121906,'233121906','Mendez, Fernanda Analia',18361),(233452309,'233452309','Alarcon, Emilia Judith',23421),(233452436,'233452436','Montenegro, Celeste',22310),(234142537,'234142537','Miranda, Franco ismael',21836),(239384749,'239384749','Juarez, Franco Ismael',20134),(243209351,'243209351','Duarte, Edgardo Exequiel',19234),(271109845,'271109845','Burgos, Andres Gerardo',21765),(293012386,'293012386','Aguirre, Juan Gabriel',20390),(293471989,'293471989','Mena, Antonela Agustina',21384);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_sucursal`
--

DROP TABLE IF EXISTS `empleado_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_sucursal` (
  `ID` int DEFAULT NULL,
  `LEGAJO` int NOT NULL,
  `IDSUCURSAL` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`LEGAJO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_sucursal`
--

LOCK TABLES `empleado_sucursal` WRITE;
/*!40000 ALTER TABLE `empleado_sucursal` DISABLE KEYS */;
INSERT INTO `empleado_sucursal` VALUES (9,174528302,'B005'),(19,192637484,'B010'),(11,192730283,'B006'),(5,202156241,'B003'),(13,202912372,'B007'),(12,203929192,'B006'),(14,213232526,'B007'),(7,213354678,'B004'),(18,213638495,'B010'),(8,214560986,'B004'),(16,223646373,'B008'),(6,233121906,'B003'),(1,233452309,'B001'),(10,233452436,'B005'),(20,234142537,'B012'),(15,239384749,'B008'),(4,243209351,'B002'),(3,271109845,'B002'),(2,293012386,'B001'),(17,293471989,'B009');
/*!40000 ALTER TABLE `empleado_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `factura_completa`
--

DROP TABLE IF EXISTS `factura_completa`;
/*!50001 DROP VIEW IF EXISTS `factura_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `factura_completa` AS SELECT 
 1 AS `ID`,
 1 AS `FHVENTA`,
 1 AS `TIPOCOMPROBANTE`,
 1 AS `DESCRIPCION`,
 1 AS `IMPORTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `facturacionab`
--

DROP TABLE IF EXISTS `facturacionab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacionab` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDSUCURSAL` varchar(4) DEFAULT NULL,
  `FHVENTA` date DEFAULT NULL,
  `TIPOCOMPROBANTE` varchar(3) DEFAULT NULL,
  `CAJA` int DEFAULT NULL,
  `LEGAJO` int NOT NULL,
  `NROCOMPROBANTE` varchar(20) DEFAULT NULL,
  `IMPORTE` decimal(14,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SUCURSAL_FACTURACIONAB` (`IDSUCURSAL`),
  KEY `FK__TIPOCOMPROBANTE_FACTURACIONAB` (`TIPOCOMPROBANTE`),
  KEY `FK__EMP_FACTURACIONAB` (`LEGAJO`),
  CONSTRAINT `FK__EMP_FACTURACIONAB` FOREIGN KEY (`LEGAJO`) REFERENCES `empleado_sucursal` (`LEGAJO`),
  CONSTRAINT `FK__TIPOCOMPROBANTE_FACTURACIONAB` FOREIGN KEY (`TIPOCOMPROBANTE`) REFERENCES `tipocomprobante` (`ID`),
  CONSTRAINT `FK_FACTURACIONDET_FACTURACIONAB` FOREIGN KEY (`ID`) REFERENCES `facturaciondet` (`IDFACTURA`),
  CONSTRAINT `FK_SUCURSAL_FACTURACIONAB` FOREIGN KEY (`IDSUCURSAL`) REFERENCES `sucursal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacionab`
--

LOCK TABLES `facturacionab` WRITE;
/*!40000 ALTER TABLE `facturacionab` DISABLE KEYS */;
INSERT INTO `facturacionab` VALUES (1,'0001','2024-08-11','FAC',1,233452309,'FAC001',2930.0000),(2,'0002','2024-08-24','NC',2,293012386,'NC002',2083.0000),(3,'0003','2024-08-25','REC',1,271109845,'REC003',9180.0000),(4,'0004','2024-08-26','FAC',3,243209351,'FAC004',3849.0000),(5,'0005','2024-08-27','FAC',2,202156241,'FACM005',4315.0000),(6,'0006','2024-08-28','FAC',1,233121906,'FAC006',3728.0000),(7,'0001','2024-08-29','NC',2,213354678,'NC007',3462.0000),(8,'0006','2024-09-30','FAC',3,214560986,'FAC008',4531.0000),(9,'0006','2024-09-01','FAC',1,174528302,'FAC009',1356.0000),(10,'0006','2024-09-02','FAC',2,233452436,'FAC010',4532.0000),(11,'0012','2024-09-03','FAC',3,192730283,'FAC011',5225.0000),(12,'0012','2024-09-04','NC',1,203929192,'NC012',2341.0000),(13,'0007','2024-09-05','FAC',2,202912372,'FAC013',2343.0000),(14,'0007','2024-09-06','FAC',3,213232526,'FAC014',10853.0000),(15,'0007','2024-09-07','FAC',1,239384749,'FAC015',2442.0000);
/*!40000 ALTER TABLE `facturacionab` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_facturacionab` AFTER UPDATE ON `facturacionab` FOR EACH ROW BEGIN
  INSERT INTO auditoria_facturacionab (
    id_factura, campo_modificado, valor_anterior, valor_nuevo, fecha_modificacion, usuario
  )
  VALUES (
    OLD.ID,
    'IMPORTE',
    OLD.IMPORTE,
    NEW.IMPORTE,
    NOW(),
    CURRENT_USER()
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturaciondet`
--

DROP TABLE IF EXISTS `facturaciondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaciondet` (
  `IDFACTURA` int NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `IMPORTE` decimal(14,4) DEFAULT NULL,
  PRIMARY KEY (`IDFACTURA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaciondet`
--

LOCK TABLES `facturaciondet` WRITE;
/*!40000 ALTER TABLE `facturaciondet` DISABLE KEYS */;
INSERT INTO `facturaciondet` VALUES (1,'IBUPROFENO',981.0000),(2,'ARTRAI',26353.0000),(3,'PAÑALES HUGGIES',3748.0000),(4,'SPRAY FRIO',8482.0000),(5,'TOALLAS FEMENINAS',3832.0000),(6,'CAFEASPIRINA',2374.0000),(7,'TEST DE EMBARAZO',2832.0000),(8,'ALGODON ESTRELLA',3822.0000),(9,'ACEPUC',2843.0000),(10,'LECHE EN TARRO NUTRILON',8362.0000),(11,'PRODUCTOS SELECCIONADOS',9892.0000),(12,'DICLOFENAC',3846.0000),(13,'SERTAL',498.0000),(14,'BUSCAMINA',6732.0000),(15,'MERTIOLATE',2785.0000);
/*!40000 ALTER TABLE `facturaciondet` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_verificar_importe_total` BEFORE INSERT ON `facturaciondet` FOR EACH ROW BEGIN
  DECLARE total_detalle DECIMAL(14,4);
  SELECT SUM(IMPORTE) INTO total_detalle
  FROM FACTURACIONDET
  WHERE IDFACTURA = NEW.IDFACTURA;
  IF total_detalle + NEW.IMPORTE > (SELECT IMPORTE FROM FACTURACIONAB WHERE ID = NEW.IDFACTURA) THEN
    SIGNAL SQLSTATE '20000' SET MESSAGE_TEXT = 'El importe total del detalle excede el importe de la cabecera';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mediodepago`
--

DROP TABLE IF EXISTS `mediodepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediodepago` (
  `IDMEDIODEPAGO` int NOT NULL AUTO_INCREMENT,
  `IDSUCURSAL` varchar(4) DEFAULT NULL,
  `FHVENTA` date DEFAULT NULL,
  `TIPOCOMPROBANTE` varchar(3) DEFAULT NULL,
  `NROCOMPROBATE` varchar(50) DEFAULT NULL,
  `LEGAJO` int NOT NULL,
  `VARIEDAD` int DEFAULT NULL,
  `IMPORTE` decimal(14,4) DEFAULT NULL,
  PRIMARY KEY (`IDMEDIODEPAGO`),
  KEY `FK__EMP_MEDIODEPAGO` (`LEGAJO`),
  KEY `FK__TIPOCOMPROBANTE_MEDIODEPAGO` (`TIPOCOMPROBANTE`),
  KEY `FK_SUCURSAL_MEDIODEPAGO` (`IDSUCURSAL`),
  CONSTRAINT `FK__EMP_MEDIODEPAGO` FOREIGN KEY (`LEGAJO`) REFERENCES `empleado_sucursal` (`LEGAJO`),
  CONSTRAINT `FK__TIPOCOMPROBANTE_MEDIODEPAGO` FOREIGN KEY (`TIPOCOMPROBANTE`) REFERENCES `tipocomprobante` (`ID`),
  CONSTRAINT `FK_SUCURSAL_MEDIODEPAGO` FOREIGN KEY (`IDSUCURSAL`) REFERENCES `sucursal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediodepago`
--

LOCK TABLES `mediodepago` WRITE;
/*!40000 ALTER TABLE `mediodepago` DISABLE KEYS */;
INSERT INTO `mediodepago` VALUES (1,'0001','2024-08-11','FAC','FAC001',233452309,NULL,2930.0000),(2,'0002','2024-08-24','NC','NC002',293012386,NULL,2083.0000),(3,'0003','2024-08-25','REC','REC003',271109845,NULL,9180.0000),(4,'0004','2024-08-26','FAC','FAC004',243209351,NULL,3849.0000),(5,'0005','2024-08-27','FAC','FACM005',202156241,NULL,4315.0000),(6,'0006','2024-08-28','FAC','FAC006',233121906,NULL,3728.0000),(7,'0001','2024-08-29','NC','NC007',213354678,NULL,3462.0000),(8,'0006','2024-09-30','FAC','FAC008',214560986,NULL,4531.0000),(9,'0006','2024-09-01','FAC','FAC009',174528302,NULL,1356.0000),(10,'0006','2024-09-02','FAC','FAC010',233452436,NULL,4532.0000),(11,'0012','2024-09-03','FAC','FAC011',192730283,NULL,5225.0000),(12,'0012','2024-09-04','NC','NC012',203929192,NULL,2341.0000),(13,'0007','2024-09-05','FAC','FAC013',202912372,NULL,2343.0000),(14,'0007','2024-09-06','FAC','FAC014',213232526,NULL,10853.0000),(15,'0007','2024-09-07','FAC','FAC015',239384749,NULL,2442.0000);
/*!40000 ALTER TABLE `mediodepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_empleados_tiendas`
--

DROP TABLE IF EXISTS `mostrar_empleados_tiendas`;
/*!50001 DROP VIEW IF EXISTS `mostrar_empleados_tiendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_empleados_tiendas` AS SELECT 
 1 AS `Nombre y Apellido`,
 1 AS `LEGAJOREAL`,
 1 AS `Sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `ID` varchar(4) NOT NULL,
  `IDSUCURSAL` varchar(4) DEFAULT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `CIUDAD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES ('0001','B001','NOAH-FARM - San Salvador','Jujuy'),('0002','B002','NOAH-FARM - Palpala','Jujuy'),('0003','B003','NOAH-FARM - Ledesma','Jujuy'),('0004','B004','NOAH-FARM - San Pedro','Jujuy'),('0005','B005','NOAH-FARM - Metan','Salta'),('0006','B006','NOAH-FARM - Güemes','Salta'),('0007','B007','NOAH-FARM - Salta','Salta'),('0008','B008','NOAH-FARM - Oran','Salta'),('0009','B009','NOAH-FARM - Tafi Viejo','Tucuman'),('0010','B010','NOAH-FARM - San Miguel','Tucuman'),('0011','B011','NOAH-FARM - Tafi del Valle','Tucuman'),('0012','B012','NOAH-FARM - Concepcion','Tucuman');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sucursal_por_ciudad`
--

DROP TABLE IF EXISTS `sucursal_por_ciudad`;
/*!50001 DROP VIEW IF EXISTS `sucursal_por_ciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sucursal_por_ciudad` AS SELECT 
 1 AS `CIUDAD`,
 1 AS `NUMERO_sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipocomprobante`
--

DROP TABLE IF EXISTS `tipocomprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocomprobante` (
  `ID` varchar(3) NOT NULL,
  `NOMBRE` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocomprobante`
--

LOCK TABLES `tipocomprobante` WRITE;
/*!40000 ALTER TABLE `tipocomprobante` DISABLE KEYS */;
INSERT INTO `tipocomprobante` VALUES ('DEV','Devolución'),('FAC','Factura'),('LIQ','Liquidación'),('NC','Nota de Crédito'),('ND','Nota de Débito'),('PED','Pedido'),('PRE','Presupuesto'),('REC','Recibo'),('REM','Remito'),('TKX','Ticket');
/*!40000 ALTER TABLE `tipocomprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'prinns'
--

--
-- Dumping routines for database 'prinns'
--
/*!50003 DROP FUNCTION IF EXISTS `cliente_compro_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cliente_compro_mes`(legajo INT, mes INT, anio INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE compro BOOLEAN;
  SELECT COUNT(*) INTO compro
  FROM FACTURACIONAB
  WHERE LEGAJO = legajo
    AND MONTH(FHVENTA) = mes
    AND YEAR(FHVENTA) = anio;
  RETURN compro > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_diario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_diario`(fecha_consulta DATE) RETURNS decimal(14,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE total_diario DECIMAL(14,2);
  SELECT SUM(IMPORTE) INTO total_diario
  FROM FACTURACIONAB
  WHERE FHVENTA = fecha_consulta;
  RETURN total_diario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_factura`(
    IN p_idsucursal VARCHAR(4),
    IN p_fhventa DATE,
    IN p_tipocomprobante VARCHAR(3),
    IN p_caja INT,
    IN p_legajo INT,
    IN p_nrocomprobante VARCHAR(20),
    IN p_importe_cabecera DECIMAL(14,4),
    IN p_descripcion VARCHAR(200),
    IN p_importe_detalle DECIMAL(14,4)
)
BEGIN
    START TRANSACTION;

    -- Insertar en la tabla cabecera
    INSERT INTO FACTURACIONAB (IDSUCURSAL, FHVENTA, TIPOCOMPROBANTE, CAJA, LEGAJO, NROCOMPROBANTE, IMPORTE)
    VALUES (p_idsucursal, p_fhventa, p_tipocomprobante, p_caja, p_legajo, p_nrocomprobante, p_importe_cabecera);

    -- Obtener el ID de la factura recién insertada
    SET @id_factura = LAST_INSERT_ID();

    -- Insertar en la tabla detalle
    INSERT INTO FACTURACIONDET (IDFACTURA, DESCRIPCION, IMPORTE)
    VALUES (@id_factura, p_descripcion, p_importe_detalle);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_factura`(
    IN p_id_sucursal VARCHAR(4),
    IN p_fecha_venta DATE,
    IN p_tipo_comprobante VARCHAR(3),
    IN p_caja INT,
    IN p_legajo INT,
    IN p_nro_comprobante VARCHAR(20),
    IN p_importe_total DECIMAL(14,4),
    IN p_detalles JSON
)
BEGIN
    DECLARE v_id_factura INT;

    -- Insertamos la cabecera de la factura
    INSERT INTO FACTURACIONAB (IDSUCURSAL, FHVENTA, TIPOCOMPROBANTE, CAJA, LEGAJO, NROCOMPROBANTE, IMPORTE)
    VALUES (p_id_tienda, p_fecha_venta, p_tipo_comprobante, p_caja, p_legajo, p_nro_comprobante, p_importe_total);

    -- Obtenemos el ID de la factura recién insertada
    SET v_id_factura = LAST_INSERT_ID();

    -- Insertamos los detalles de la factura
    INSERT INTO FACTURACIONDET (IDFACTURA, DESCRIPCION, IMPORTE)
    SELECT JSON_EXTRACT(p_detalles, CONCAT('$[', idx, '].descripcion')),
           JSON_EXTRACT(p_detalles, CONCAT('$[', idx, '].importe'))
    FROM (SELECT @i := @i + 1 AS idx FROM (SELECT 1 UNION ALL SELECT 1) x, (SELECT 1 UNION ALL SELECT 1) y, (SELECT 1 UNION ALL SELECT 1) z) a
    WHERE @i <= JSON_LENGTH(p_detalles);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_medio_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_medio_pago`(
    IN p_id_sucursal VARCHAR(4),
    IN p_fecha_venta DATE,
    IN p_tipo_comprobante VARCHAR(3),
    IN p_nro_comprobante VARCHAR(50),
    IN p_legajo INT,
    IN p_variedad INT,
    IN p_importe DECIMAL(14,4)
)
INSERT INTO MEDIODEPAGO (IDSUCURSAL, FHVENTA, TIPOCOMPROBANTE, NROCOMPROBATE, LEGAJO, IMPORTE)
    VALUES (p_id_sucursal, p_fecha_venta, p_tipo_comprobante, p_nro_comprobante, p_legajo, p_importe); ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `factura_completa`
--

/*!50001 DROP VIEW IF EXISTS `factura_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `factura_completa` AS select `fc`.`ID` AS `ID`,`fc`.`FHVENTA` AS `FHVENTA`,`fc`.`TIPOCOMPROBANTE` AS `TIPOCOMPROBANTE`,`fd`.`DESCRIPCION` AS `DESCRIPCION`,`fd`.`IMPORTE` AS `IMPORTE` from (`facturacionab` `fc` join `facturaciondet` `fd` on((`fc`.`ID` = `fd`.`IDFACTURA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_empleados_tiendas`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_empleados_tiendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_empleados_tiendas` AS select `e`.`APENOM` AS `Nombre y Apellido`,`e`.`LEGAJOREAL` AS `LEGAJOREAL`,`et`.`IDSUCURSAL` AS `Sucursal` from (`empleado` `e` join `empleado_sucursal` `et` on((`e`.`ID` = `et`.`ID`))) where ((`e`.`ID` = 'A') and (`et`.`ID` = 'A')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sucursal_por_ciudad`
--

/*!50001 DROP VIEW IF EXISTS `sucursal_por_ciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sucursal_por_ciudad` AS select `sucursal`.`CIUDAD` AS `CIUDAD`,count(0) AS `NUMERO_sucursal` from `sucursal` group by `sucursal`.`CIUDAD` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-17 17:49:08
