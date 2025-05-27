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


CREATE TABLE lugarProcedencia (
    ID_lugar INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL
);


CREATE TABLE genero (
    ID_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE formatos (
    ID_formato INT AUTO_INCREMENT PRIMARY KEY,
    nombre ENUM('DVD', 'BluRay', 'Digital', 'VHS') NOT NULL
);

CREATE TABLE peliculas (
    ID_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    ID_lugar INT,
    nombre VARCHAR(100) NOT NULL,
    fechaLanzamiento DATE,
    duracion INT,
    sinopsis VARCHAR(200),
    FOREIGN KEY (ID_lugar) REFERENCES lugarProcedencia(ID_lugar)
);


CREATE TABLE pelGenero (
    ID_pelicula INT,
    ID_genero INT,
    PRIMARY KEY (ID_pelicula, ID_genero),
    FOREIGN KEY (ID_pelicula) REFERENCES peliculas(ID_pelicula),
    FOREIGN KEY (ID_genero) REFERENCES genero(ID_genero)
);


CREATE TABLE pelFormatos (
    ID_pelicula INT,
    ID_formato INT,
    PRIMARY KEY (ID_pelicula, ID_formato),
    FOREIGN KEY (ID_pelicula) REFERENCES peliculas(ID_pelicula),
    FOREIGN KEY (ID_formato) REFERENCES formatos(ID_formato)
);


CREATE TABLE interpretes (
    ID_interprete INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero ENUM('M', 'F', 'Otro'),
    rol VARCHAR(100) NOT NULL
);


CREATE TABLE pelInterprete (
    ID_pelicula INT,
    ID_interprete INT,
    PRIMARY KEY (ID_pelicula, ID_interprete),
    FOREIGN KEY (ID_pelicula) REFERENCES peliculas(ID_pelicula),
    FOREIGN KEY (ID_interprete) REFERENCES interpretes(ID_interprete)
);
