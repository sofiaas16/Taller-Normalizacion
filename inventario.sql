-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Base de datos: inventario
--
DROP DATABASE IF EXISTS inventario;
CREATE DATABASE inventario;
USE inventario;

--
-- Tabla: Clasificacion
--
DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE `clasificacion` (
    `id_clasificacion` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: ModalidadProducto
--
DROP TABLE IF EXISTS `modalidad_producto`;
CREATE TABLE `modalidad_producto` (
    `id_modalidad_producto` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_modalidad_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Articulo
--
DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
    `id_articulo` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `detalle` TEXT,
    `id_modalidad_producto` INT NOT NULL,
    PRIMARY KEY (`id_articulo`),
    FOREIGN KEY (`id_modalidad_producto`) REFERENCES `modalidad_producto`(`id_modalidad_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla intermedia: Articulo_Clasificacion (muchos a muchos)
--
DROP TABLE IF EXISTS `articulo_clasificacion`;
CREATE TABLE `articulo_clasificacion` (
    `id_articulo` INT NOT NULL,
    `id_clasificacion` INT NOT NULL,
    PRIMARY KEY (`id_articulo`, `id_clasificacion`),
    FOREIGN KEY (`id_articulo`) REFERENCES `articulo`(`id_articulo`),
    FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion`(`id_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Entidad (cliente o proveedor)
--
DROP TABLE IF EXISTS `entidad`;
CREATE TABLE `entidad` (
    `id_entidad` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `rol` ENUM('cliente', 'proveedor') NOT NULL,
    PRIMARY KEY (`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Registro (cabecera)
--
DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
    `id_registro` INT NOT NULL AUTO_INCREMENT,
    `fecha` DATETIME NOT NULL,
    `accion` ENUM('entrada', 'salida') NOT NULL,
    `razon` VARCHAR(255),
    `id_entidad` INT,
    PRIMARY KEY (`id_registro`),
    FOREIGN KEY (`id_entidad`) REFERENCES `entidad`(`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: DetalleRegistro (detalle)
--
DROP TABLE IF EXISTS `detalle_registro`;
CREATE TABLE `detalle_registro` (
    `id_detalle` INT NOT NULL AUTO_INCREMENT,
    `id_registro` INT NOT NULL,
    `id_articulo` INT NOT NULL,
    `cantidad` DECIMAL(10,2) NOT NULL,
    `precio_unitario` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`id_detalle`),
    FOREIGN KEY (`id_registro`) REFERENCES `registro`(`id_registro`),
    FOREIGN KEY (`id_articulo`) REFERENCES `articulo`(`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 21:20:42
