
DROP DATABASE IF EXISTS `clubfutbol`;
CREATE DATABASE `clubfutbol`;
USE `clubfutbol`;

--
-- Table structure for table `Ubicacion`
--

DROP TABLE IF EXISTS `Ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ubicacion` (
    `id_ubicacion` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `direccion` varchar(255),
    `telefono` varchar(20),
    PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Division`
--

DROP TABLE IF EXISTS `Division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Division` (
    `id_division` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    PRIMARY KEY (`id_division`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Atleta`
--



--
-- Table structure for table `PlanEntrenamiento`
--

DROP TABLE IF EXISTS `PlanEntrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlanEntrenamiento` (
    `id_plan` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `descripcion` text,
    `id_ubicacion` int,
    PRIMARY KEY (`id_plan`),
    FOREIGN KEY (`id_ubicacion`) REFERENCES `Ubicacion` (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JornadaEntrenamiento`
--

DROP TABLE IF EXISTS `JornadaEntrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaEntrenamiento` (
    `id_jornada` int NOT NULL AUTO_INCREMENT,
    `id_plan` int,
    `fecha` date,
    `objetivos` text,
    PRIMARY KEY (`id_jornada`),
    FOREIGN KEY (`id_plan`) REFERENCES `PlanEntrenamiento` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Atleta_Plan`
--

DROP TABLE IF EXISTS `Atleta_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atleta_Plan` (
    `id_atleta` int,
    `id_plan` int,
    PRIMARY KEY (`id_atleta`, `id_plan`),
    FOREIGN KEY (`id_atleta`) REFERENCES `Atleta` (`id_atleta`),
    FOREIGN KEY (`id_plan`) REFERENCES `PlanEntrenamiento` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Actividad`
--

DROP TABLE IF EXISTS `Actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actividad` (
    `id_actividad` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `fecha` date,
    `ubicacion` varchar(255),
    `estado` varchar(50),
    PRIMARY KEY (`id_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Equipo`
--

DROP TABLE IF EXISTS `Equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipo` (
    `id_equipo` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `rol` varchar(50),
    PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Actividad_Equipo`
--

DROP TABLE IF EXISTS `Actividad_Equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actividad_Equipo` (
    `id_actividad` int,
    `id_equipo` int,
    PRIMARY KEY (`id_actividad`, `id_equipo`),
    FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id_actividad`),
    FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Auspiciador`
--

DROP TABLE IF EXISTS `Auspiciador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auspiciador` (
    `id_auspiciador` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `contacto` varchar(100),
    PRIMARY KEY (`id_auspiciador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Actividad_Auspiciador`
--

DROP TABLE IF EXISTS `Actividad_Auspiciador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actividad_Auspiciador` (
    `id_actividad` int,
    `id_auspiciador` int,
    PRIMARY KEY (`id_actividad`, `id_auspiciador`),
    FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id_actividad`),
    FOREIGN KEY (`id_auspiciador`) REFERENCES `Auspiciador` (`id_auspiciador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reporte`
--

DROP TABLE IF EXISTS `Reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reporte` (
    `id_reporte` int NOT NULL AUTO_INCREMENT,
    `id_actividad` int,
    `descripcion` text,
    `accion_tomada` text,
    `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_reporte`),
    FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 09:12:37