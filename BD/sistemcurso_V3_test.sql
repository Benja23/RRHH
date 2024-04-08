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
 INSERT INTO roles (namerole, created_at, updated_at, status) VALUES 
  ('SUPER', NOW(), NOW(), 1),
  ('TRABAJADOR', NOW(), NOW(), 1),
  ('VENDEDOR', NOW(), NOW(), 1),
  ('RECEPCIONISTA', NOW(), NOW(), 1),
  ('CHOFER', NOW(), NOW(), 1),
  ('PROGRAMADOR', NOW(), NOW(), 1);
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
  INSERT INTO users (name, lastname, username, role_id, photo, email, email_verified_at, password, status, code, phone, created_at, updated_at, company_id, people_id) VALUES
  ('John', 'Doe', 'daniel', 1, '../images/user/DANIEL_20240306025623.png', 'john.doe@example.com', NOW(), '$argon2i$v=19$m=65536,t=4,p=1$YzNXQVpHY3lsbGdRMjdKbA$FOpdBjTsGUYjWlT3VE4Vpg7u27I9+KKmdbHuYY3M0Zk', 1, '123ABC', '1234567890', NOW(), NOW(), 1, 1),
  ('Jane', 'Smith', 'jane_smith', 2, NULL, 'jane.smith@example.com', NOW(), 'hashed_password', 1, '456DEF', '9876543210', NOW(), NOW(), 1, 2),
  ('Alice', 'Johnson', 'alice_j', 3, NULL, 'alice.johnson@example.com', NOW(), 'hashed_password', 1, '789GHI', '5551234567', NOW(), NOW(), 2, 3),
  ('Bob', 'Williams', 'bob_w', 4, NULL, 'bob.williams@example.com', NOW(), 'hashed_password', 1, '101JKL', '9871122334', NOW(), NOW(), 2, 4),
  ('Eva', 'Taylor', 'eva_taylor', 5, NULL, 'eva.taylor@example.com', NOW(), 'hashed_password', 1, '202MNO', '1235556789', NOW(), NOW(), 3, 5),
  ('Sam', 'Miller', 'sam_m', 6, NULL, 'sam.miller@example.com', NOW(), 'hashed_password', 1, '303PQR', '4569876543', NOW(), NOW(), 3, 6),
  ('Olivia', 'Brown', 'olivia_b', 1, NULL, 'olivia.brown@example.com', NOW(), 'hashed_password', 1, '404STU', '7893332222', NOW(), NOW(), 1, 7),
  ('Daniel', 'Jones', 'daniel_j', 2, NULL, 'daniel.jones@example.com', NOW(), 'hashed_password', 1, '505VWX', '1114445555', NOW(), NOW(), 1, 8),
  ('Sophia', 'Moore', 'sophia_m', 3, NULL, 'sophia.moore@example.com', NOW(), 'hashed_password', 1, '606YZA', '2227778888', NOW(), NOW(), 2, 9),
  ('Max', 'Davis', 'max_d', 4, NULL, 'max.davis@example.com', NOW(), 'hashed_password', 1, '707BCD', '3339990000', NOW(), NOW(), 2, 10);

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
  `statedinicio` enum('Off','On') NOT NULL,
  PRIMARY KEY (`idpersona`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO personas (Nombre, Apellidos, Dni, Telefono, Salario, Correo, Moneda, Sexo, Direccion, Estado, EstadoCuenta, fechaRegisto, Fotopersona, observacion, cvpersona, entrevista, resulentrevista, typePeople, statedinicio) VALUES
  ('Juan', 'Pérez Gómez', '12345678A', '987654321', 50000.50, 'juan.perez@example.com', 'USD', 'Hombre', 'Calle Principal 123', 'Activo', 'Pagado', NOW(), NULL, 'Sin observaciones', NULL, 'Entrevista 1', 'Aprobado', 'Empleado', 'Off'),
  ('María', 'Martínez López', '87654321B', '123456789', 60000.75, 'maria.martinez@example.com', 'EUR', 'Mujer', 'Avenida Central 456', 'Activo', 'Deuda', NOW(), NULL, 'Buen desempeño', NULL, 'Entrevista 2', 'Aprobado', 'Empleado', 'Off'),
  ('Carlos', 'García Rodríguez', '56789012C', '987654321', 55000.25, 'carlos.garcia@example.com', 'USD', 'Hombre', 'Plaza Principal 789', 'Inactivo', 'Procesando...', NOW(), NULL, 'Experiencia previa', NULL, 'Entrevista 3', 'Rechazado', 'Contratista', 'Off'),
  ('Ana', 'Fernández Pérez', '34567890D', '123456789', 70000.00, 'ana.fernandez@example.com', 'EUR', 'Mujer', 'Calle Secundaria 234', 'Activo', 'Pagado', NOW(), NULL, 'Alta motivación', NULL, 'Entrevista 4', 'Aprobado', 'Empleado', 'Off'),
  ('Pedro', 'López Martínez', '09876543E', '987654321', 48000.75, 'pedro.lopez@example.com', 'USD', 'Hombre', 'Avenida Principal 567', 'Activo', 'Deuda', NOW(), NULL, 'Habilidades técnicas', NULL, 'Entrevista 5', 'Aprobado', 'Contratista', 'Off'),
  ('Laura', 'Gómez Sánchez', '56789012F', '123456789', 60000.50, 'laura.gomez@example.com', 'EUR', 'Mujer', 'Plaza Secundaria 890', 'Inactivo', 'Procesando...', NOW(), NULL, 'Comunicación efectiva', NULL, 'Entrevista 6', 'Rechazado', 'Empleado', 'Off'),
  ('José', 'Rodríguez García', '23456789G', '987654321', 55000.25, 'jose.rodriguez@example.com', 'USD', 'Hombre', 'Calle Principal 123', 'Activo', 'Pagado', NOW(), NULL, 'Trabajo en equipo', NULL, 'Entrevista 7', 'Aprobado', 'Contratista', 'Off'),
  ('Sofía', 'Pérez Martínez', '78901234H', '123456789', 48000.75, 'sofia.perez@example.com', 'EUR', 'Mujer', 'Avenida Central 456', 'Activo', 'Deuda', NOW(), NULL, 'Creatividad', NULL, 'Entrevista 8', 'Aprobado', 'Empleado', 'Off'),
  ('Alejandro', 'García López', '45678901I', '987654321', 65000.50, 'alejandro.garcia@example.com', 'USD', 'Hombre', 'Plaza Principal 789', 'Inactivo', 'Procesando...', NOW(), NULL, 'Experiencia internacional', NULL, 'Entrevista 9', 'Rechazado', 'Contratista', 'Off'),
  ('Valeria', 'Fernández Sánchez', '12345678J', '123456789', 70000.00, 'valeria.fernandez@example.com', 'EUR', 'Mujer', 'Calle Secundaria 234', 'Activo', 'Pagado', NOW(), NULL, 'Habilidades gerenciales', NULL, 'Entrevista 10', 'Aprobado', 'Empleado', 'Off'),
  ('Martín', 'López Martínez', '87654321K', '987654321', 55000.25, 'martin.lopez@example.com', 'USD', 'Hombre', 'Avenida Principal 567', 'Activo', 'Deuda', NOW(), NULL, 'Proactivo', NULL, 'Entrevista 11', 'Aprobado', 'Contratista', 'Off'),
  ('Isabella', 'Gómez Sánchez', '23456789L', '123456789', 60000.50, 'isabella.gomez@example.com', 'EUR', 'Mujer', 'Plaza Secundaria 890', 'Inactivo', 'Procesando...', NOW(), NULL, 'Innovación', NULL, 'Entrevista 12', 'Rechazado', 'Empleado', 'Off');

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
INSERT INTO `siderbar` VALUES (1,'Dashboard',1),(2,'Usuarios',2),(3,'Roles',3),(4,'Personal',4),(5,'Jornadas',5),(6,'Pagos',6),(7,'Adelantos',7),(8,'Horas Extras',8),(9,'Vacaciones',9),(10,'Asistencia',10),(11,'Reportes',11),(12,'Turnos',12),(13,'Panel',13),(14,'Resumen G.',14),(15,'Empresa',15);
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
INSERT INTO `sidebaracces` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15);
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10  2:15:11
