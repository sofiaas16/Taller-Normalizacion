-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: cinecampus
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

DROP DATABASE IF EXISTS cinecampus;
CREATE DATABASE cinecampus;
USE cinecampus;

-- Tabla de naciones
CREATE TABLE naciones (
    id_nacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de presentaciones
CREATE TABLE presentaciones (
    id_presentacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE -- Ej: Digital, Fisico, 35mm, Blu-ray
);

-- Tabla de cintas
CREATE TABLE cintas (
    id_cinta INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    duracion INT NOT NULL, -- minutos
    resumen TEXT,
    anio_publicacion YEAR,
    id_nacion INT,
    id_categoria INT,
    FOREIGN KEY (id_nacion) REFERENCES naciones(id_nacion),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla intermedia cinta_presentacion (muchos a muchos)
CREATE TABLE cinta_presentacion (
    id_cinta INT,
    id_presentacion INT,
    PRIMARY KEY (id_cinta, id_presentacion),
    FOREIGN KEY (id_cinta) REFERENCES cintas(id_cinta),
    FOREIGN KEY (id_presentacion) REFERENCES presentaciones(id_presentacion)
);

-- Tabla de artistas
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE
);

-- Tabla intermedia cinta_artista (muchos a muchos con tipo de rol)
CREATE TABLE cinta_artista (
    id_cinta INT,
    id_artista INT,
    tipo_rol VARCHAR(50), -- Ej: Protagonista, Secundario, Extra
    PRIMARY KEY (id_cinta, id_artista),
    FOREIGN KEY (id_cinta) REFERENCES cintas(id_cinta),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
);
