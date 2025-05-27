
-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: clubfutbol
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
-- Creación de la base de datosCREATE DATABASE IF NOT EXISTS bd_signos;
DROP DATABASE IF EXISTS clubfutbol;
CREATE DATABASE clubfutbol;
USE clubfutbol;


CREATE TABLE IF NOT EXISTS sedes (
    ID_sede INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150)
);


CREATE TABLE IF NOT EXISTS torneos (
    ID_torneos INT PRIMARY KEY,
    numEquipos INT,
    fecha DATE
);


CREATE TABLE IF NOT EXISTS calendarioTorneo (
    ID_calendario INT PRIMARY KEY,
    fechaInicio DATE,
    horaInicio DATETIME,
    horaFin DATETIME
);


CREATE TABLE IF NOT EXISTS equipo (
    ID_equipo INT PRIMARY KEY,
    nombre VARCHAR(100),
    disponibilidad BOOLEAN
);


CREATE TABLE IF NOT EXISTS patrocinadorColaborador (
    ID_patrocinador INT PRIMARY KEY,
    nombre VARCHAR(100),
    monto INT
);

CREATE TABLE IF NOT EXISTS equipoPatrocinador (
    ID_equipo INT,
    ID_patrocinador INT,
    PRIMARY KEY (ID_equipo, ID_patrocinador),
    FOREIGN KEY (ID_equipo) REFERENCES equipo(ID_equipo),
    FOREIGN KEY (ID_patrocinador) REFERENCES patrocinadorColaborador(ID_patrocinador)
);


CREATE TABLE IF NOT EXISTS jugadores (
    ID_jugador INT PRIMARY KEY,
    ID_equipo INT,
    nombre VARCHAR(100),
    fechaNac DATE,
    categoria VARCHAR(100),
    FOREIGN KEY (ID_equipo) REFERENCES equipo(ID_equipo)
);


CREATE TABLE IF NOT EXISTS sesiones (
    ID_sesiones INT PRIMARY KEY,
    tipoEntrenamiento INT,
    objetivoEspecifico TEXT
);


CREATE TABLE IF NOT EXISTS sedeSesiones (
    ID_sede INT,
    ID_sesiones INT,
    PRIMARY KEY (ID_sede, ID_sesiones),
    FOREIGN KEY (ID_sede) REFERENCES sedes(ID_sede),
    FOREIGN KEY (ID_sesiones) REFERENCES sesiones(ID_sesiones)
);


CREATE TABLE IF NOT EXISTS calendarioSesiones (
    ID_calendarioSesiones INT PRIMARY KEY,
    fechaInicio DATE,
    fechaFin DATE,
    horaInicio DATETIME,
    horaFin DATETIME
);

CREATE TABLE IF NOT EXISTS SesionesCal (
    ID_calendarioSesiones INT,
    ID_sesiones INT,
    PRIMARY KEY (ID_calendarioSesiones, ID_sesiones),
    FOREIGN KEY (ID_calendarioSesiones) REFERENCES calendarioSesiones(ID_calendarioSesiones),
    FOREIGN KEY (ID_sesiones) REFERENCES sesiones(ID_sesiones)
);

CREATE TABLE IF NOT EXISTS seguimiento (
    ID_jugador INT,
    ID_sesiones INT,
    metrica VARCHAR(100),
    estado BOOLEAN,
    PRIMARY KEY (ID_jugador, ID_sesiones),
    FOREIGN KEY (ID_jugador) REFERENCES jugadores(ID_jugador),
    FOREIGN KEY (ID_sesiones) REFERENCES sesiones(ID_sesiones)
);


CREATE TABLE IF NOT EXISTS PartidoTorneo (
    ID_partidoTorneo INT PRIMARY KEY,
    ID_equipo INT,
    ID_torneos INT,
    ID_calendario INT,
    FOREIGN KEY (ID_equipo) REFERENCES equipo(ID_equipo),
    FOREIGN KEY (ID_torneos) REFERENCES torneos(ID_torneos),
    FOREIGN KEY (ID_calendario) REFERENCES calendarioTorneo(ID_calendario)
);


CREATE TABLE IF NOT EXISTS sedePartido (
    ID_sede INT,
    ID_partidoTorneo INT,
    PRIMARY KEY (ID_sede, ID_partidoTorneo),
    FOREIGN KEY (ID_sede) REFERENCES sedes(ID_sede),
    FOREIGN KEY (ID_partidoTorneo) REFERENCES PartidoTorneo(ID_partidoTorneo)
);


CREATE TABLE IF NOT EXISTS partidosAmistosos (
    ID_amistosos INT PRIMARY KEY,
    fecha DATE,
    horaInicio DATETIME,
    horaFin DATETIME
);


CREATE TABLE IF NOT EXISTS sedesPartido (
    ID_sede INT,
    ID_amistosos INT,
    PRIMARY KEY (ID_sede, ID_amistosos),
    FOREIGN KEY (ID_sede) REFERENCES sedes(ID_sede),
    FOREIGN KEY (ID_amistosos) REFERENCES partidosAmistosos(ID_amistosos)
);

-- Tabla: comisarios
CREATE TABLE IF NOT EXISTS comisarios (
    ID_comisario INT PRIMARY KEY,
    nombre VARCHAR(100),
    disponibilidad BOOLEAN
);


CREATE TABLE IF NOT EXISTS arbitros (
    ID_arbitro INT PRIMARY KEY,
    nombre VARCHAR(100),
    disponibilidad BOOLEAN
);


CREATE TABLE IF NOT EXISTS pTorneoComisarios (
    ID_comisario INT,
    ID_partidoTorneo INT,
    PRIMARY KEY (ID_comisario, ID_partidoTorneo),
    FOREIGN KEY (ID_comisario) REFERENCES comisarios(ID_comisario),
    FOREIGN KEY (ID_partidoTorneo) REFERENCES PartidoTorneo(ID_partidoTorneo)
);

CREATE TABLE IF NOT EXISTS pTorneoArbitros (
    ID_arbitro INT,
    ID_partidoTorneo INT,
    PRIMARY KEY (ID_arbitro, ID_partidoTorneo),
    FOREIGN KEY (ID_arbitro) REFERENCES arbitros(ID_arbitro),
    FOREIGN KEY (ID_partidoTorneo) REFERENCES PartidoTorneo(ID_partidoTorneo)
);


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 09:12:37