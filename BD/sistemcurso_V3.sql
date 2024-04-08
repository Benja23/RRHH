-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemacurso2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idroles` int NOT NULL AUTO_INCREMENT,
  `namerole` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idroles`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMINISTRADOR','2023-10-28 22:57:47','2023-10-28 22:57:47',1),(7,'TRABJADOR','2023-11-23 23:29:21','2023-11-26 15:49:07',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `photo` TEXT DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `people_id` int DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  KEY `role_user_idx` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`idroles`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Daniel','Cavez TORRIEL','DANIEL',1,'../../images/user/DANIEL_20231216025227.png','',NULL,
  '$argon2i$v=19$m=65536,t=4,p=1$YzNXQVpHY3lsbGdRMjdKbA$FOpdBjTsGUYjWlT3VE4Vpg7u27I9+KKmdbHuYY3M0Zk','1','123','',
  '2023-10-29 08:58:47','2023-12-09 22:39:07',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`; 
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `idpersona` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL,
  `Dni` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Moneda` varchar(255) DEFAULT NULL,
  `Sexo` enum('Hombre','Mujer') DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL,
  `EstadoCuenta` enum('Pagado','Deuda','Procesando...') NOT NULL,
  `fechaRegisto` datetime DEFAULT NULL,
  `Fotopersona` text,
  `observacion` text,
  `cvpersona` text,
  `entrevista` varchar(255) DEFAULT NULL,
  `resulentrevista` varchar(255) DEFAULT NULL,
  `typePeople` varchar(255) DEFAULT NULL,
  `permission` tinyint(1) DEFAULT '0',
  `statedinicio` enum('Off','On') NOT NULL,
  PRIMARY KEY (`idpersona`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;

/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `adelantos`
--

DROP TABLE IF EXISTS `adelantos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adelantos` (
  `iddelantos` int NOT NULL AUTO_INCREMENT,
  `idpersona` int NOT NULL,
  `Moneda` varchar(45) DEFAULT NULL,
  `Monto` int DEFAULT NULL,
  `Fecharegisto` date DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL,
  `yearactual` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddelantos`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adelantos`
--

LOCK TABLES `adelantos` WRITE;
/*!40000 ALTER TABLE `adelantos` DISABLE KEYS */;

/*!40000 ALTER TABLE `adelantos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idasisten` int unsigned NOT NULL AUTO_INCREMENT,
  `personaid` int NOT NULL,
  `Fechas` date NOT NULL,
  `stated` tinyint(1) NOT NULL,
  `yearid` int DEFAULT NULL,
  PRIMARY KEY (`idasisten`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;

/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` text,
  `flag` text,
  `ruc` varchar(20) DEFAULT NULL,
  `branch` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'SISTEMA DE GESTION DE RECURSOS HUMANOS HR365','Desarrollo de software a medida','Lima','+51 964706345','Dolares','danielchaveztorriel@gmail.com','../../images//logo.PNG','../../images//banner.jpg','1022548056','Huanua-los angeles','2023-12-03 06:24:19','2023-12-03 23:12:26',1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_entry` time DEFAULT NULL,
  `time_exit` time DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `day_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `day_number` int DEFAULT NULL,
  `name_shift` varchar(255) DEFAULT NULL,
  `observation` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`iduser`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `idfiles` int NOT NULL AUTO_INCREMENT,
  `idrole` int DEFAULT NULL,
  `filename` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idfiles`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaextra`
--

DROP TABLE IF EXISTS `horaextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horaextra` (
  `idhextra` int NOT NULL AUTO_INCREMENT,
  `idepersona` int DEFAULT NULL,
  `hextra` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecharegistro` date DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `stadohoral` enum('Pagado','Pendiente','Procesando...') DEFAULT NULL,
  PRIMARY KEY (`idhextra`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaextra`
--

LOCK TABLES `horaextra` WRITE;
/*!40000 ALTER TABLE `horaextra` DISABLE KEYS */;
/*!40000 ALTER TABLE `horaextra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada` (
  `idinicio` int NOT NULL AUTO_INCREMENT,
  `personaid` int NOT NULL,
  `fechaRegisto` datetime DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `diasvacacionale` int DEFAULT NULL,
  `typeShift` varchar(255) DEFAULT NULL,
  `stadovaciones` enum('Vacaciones','Presente') DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idinicio`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoshextra`
--

DROP TABLE IF EXISTS `pagoshextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagoshextra` (
  `idpagoshextra` int NOT NULL AUTO_INCREMENT,
  `idhextra` int DEFAULT NULL,
  `fechas` date DEFAULT NULL,
  `horas` int DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `idpersona` int DEFAULT NULL,
  `datecreated` date DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `stated` enum('Pagado','Anulado') DEFAULT NULL,
  PRIMARY KEY (`idpagoshextra`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoshextra`
--

LOCK TABLES `pagoshextra` WRITE;
/*!40000 ALTER TABLE `pagoshextra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagoshextra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagosjornada`
--

DROP TABLE IF EXISTS `pagosjornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagosjornada` (
  `idpago` int unsigned NOT NULL AUTO_INCREMENT,
  `idpersona` int NOT NULL,
  `montoP` double DEFAULT NULL,
  `extrahours` varchar(45) DEFAULT NULL,
  `Description` text,
  `fechasPagados` date DEFAULT NULL,
  `fechaoperacion` date DEFAULT NULL,
  `stado` enum('PAGADO','DEUDA') NOT NULL,
  `type` enum('DAY','ADL','EXT') NOT NULL,
  PRIMARY KEY (`idpago`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagosjornada`
--

LOCK TABLES `pagosjornada` WRITE;
/*!40000 ALTER TABLE `pagosjornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagosjornada` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_number` int DEFAULT NULL,
  `day_name` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `morning_entry_time` time DEFAULT NULL,
  `morning_exit_time` time DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `afternoon_entry_time` time DEFAULT NULL,
  `afternoon_exit_time` time DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `shifts_chk_1` CHECK (((`day_number` >= 1) and (`day_number` <= 7)))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,1,'Monday','08:00:00','13:00:00','normal','15:00:00','17:00:00',1,'2023-12-07 21:33:38','2023-12-08 17:29:42'),(2,2,'Tuesday','08:00:00','13:00:00','normal','15:00:00','17:00:00',1,'2023-12-07 21:33:38','2023-12-08 19:23:17'),(3,3,'Wednesday','08:00:00','12:00:00','normal','15:00:00','17:00:00',1,'2023-12-07 21:33:38','2023-12-08 19:23:17'),(4,4,'Thursday','08:00:00','11:00:00','normal','22:00:00','22:29:00',1,'2023-12-07 21:33:38','2023-12-08 19:23:17'),(5,5,'Friday','08:00:00','13:00:00','normal','15:00:00','17:00:00',1,'2023-12-07 21:33:38','2023-12-08 19:09:19'),(6,6,'Saturday','20:00:00','20:47:00','normal','20:50:00','20:52:00',1,'2023-12-07 21:33:38','2023-12-10 01:46:12'),(7,7,'Sunday','00:00:00','00:25:00','normal','00:26:00','01:35:00',1,'2023-12-07 21:33:38','2023-12-10 06:30:16');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `siderbar`
--

DROP TABLE IF EXISTS `siderbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siderbar` (
  `idsiderbar` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`idsiderbar`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siderbar`
--

LOCK TABLES `siderbar` WRITE;
/*!40000 ALTER TABLE `siderbar` DISABLE KEYS */;
INSERT INTO `siderbar` VALUES
 (1,'Dashboard',1),
(2,'Usuarios',2),
(3,'Roles',3),
(4,'Personal',4),
(5,'Jornadas',5),
(6,'Pagos',6),
(7,'Adelantos',7),
(8,'Horas Extras',8),
(9,'Vacaciones',9),
(10,'Asistencia',10),
(11,'Reportes',11),
(12,'Turnos',12),
(13,'Panel',13),
(14,'Resumen G.',14),
(15,'Empresa',15),
(16,'Permisos',16);
/*!40000 ALTER TABLE `siderbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sidebaracces`
--

DROP TABLE IF EXISTS `sidebaracces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sidebaracces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int DEFAULT NULL,
  `id_sidebar` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `side_acc_idx` (`id_sidebar`),
  KEY `fk_sider_role_idx` (`id_role`),
  CONSTRAINT `fk_sider_access` FOREIGN KEY (`id_sidebar`) REFERENCES `siderbar` (`idsiderbar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sider_role` FOREIGN KEY (`id_role`) REFERENCES `roles` (`idroles`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sidebaracces`
--

LOCK TABLES `sidebaracces` WRITE;
/*!40000 ALTER TABLE `sidebaracces` DISABLE KEYS */;
INSERT INTO `sidebaracces` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16);
/*!40000 ALTER TABLE `sidebaracces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacaciones`
--

DROP TABLE IF EXISTS `vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacaciones` (
  `idvacaciones` int NOT NULL AUTO_INCREMENT,
  `idempleado` int DEFAULT NULL,
  `fechinicio` date DEFAULT NULL,
  `fechafinal` date DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `diasvacaciones` int DEFAULT NULL,
  `descripcion` text,
  `datecreate` date DEFAULT NULL,
  PRIMARY KEY (`idvacaciones`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacaciones`
--

LOCK TABLES `vacaciones` WRITE;
/*!40000 ALTER TABLE `vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

DROP TABLE IF EXISTS `type_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text,
  `number_day` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `photo` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOCK TABLES `type_permission` WRITE;
/*!40000 ALTER TABLE `type_permission` DISABLE KEYS */;
INSERT INTO type_permission (name, description, number_day)
VALUES 
  ('ENFERMEDAD SIN CERTIFICADO MÉDICO', 'Permiso por enfermedad sin certificado médico', 15),
  ('ENFERMEDAD CON CERTIFICADO MÉDICO', 'Permiso por enfermedad con certificado médico', 90),
  ('ENFERMEDAD PARIENTES', 'Permiso por enfermedad de parientes', 20),
  ('PERSONAL CON GOCE DE SUELDO', 'Permiso personal con goce de sueldo', 5),
  ('PERSONAL SIN GOCE DE SUELDO', 'Permiso personal sin goce de sueldo', 60),
  ('MATERNIDAD', 'Permiso por maternidad', 90),
  ('OFICIAL', 'Permiso oficial', 0);
/*!40000 ALTER TABLE `type_permission` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_people` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `quantity_day` varchar(255) DEFAULT NULL,
  `quantity_hours` time DEFAULT NULL,
  `available_days` varchar(255) DEFAULT NULL,
  `available_times` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `day_number` text,
  `time_number` text,
  `description` text,
  `photo` text,
  `current_year` year DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_people` (`id_people`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `fk_type_per` FOREIGN KEY (`type_id`) REFERENCES `type_permission` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_user_` FOREIGN KEY (`id_people`) REFERENCES `personas` (`idpersona`)
);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10  2:15:11
