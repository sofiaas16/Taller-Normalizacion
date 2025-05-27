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


CREATE TABLE tipoProducto (
    ID_tipo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_tipo)
) ;


CREATE TABLE categoria (
    ID_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_categoria)
) ;


CREATE TABLE producto (
    ID_producto INT NOT NULL AUTO_INCREMENT,
    ID_categoria INT NOT NULL,
    ID_tipoproducto INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    PRIMARY KEY (ID_producto),
    FOREIGN KEY (ID_categoria) REFERENCES categoria(ID_categoria),
    FOREIGN KEY (ID_tipoproducto) REFERENCES tipoProducto(ID_tipo)
) ;


CREATE TABLE proveedor (
    ID_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    PRIMARY KEY (ID_proveedor)
) ;


CREATE TABLE compra (
    ID_compra INT NOT NULL AUTO_INCREMENT,
    ID_proveedor INT NOT NULL,
    descripcion TEXT,
    PRIMARY KEY (ID_compra),
    FOREIGN KEY (ID_proveedor) REFERENCES proveedor(ID_proveedor)
) ;


CREATE TABLE productoCompra (
    ID_producto INT NOT NULL,
    ID_compra INT NOT NULL,
    PRIMARY KEY (ID_producto, ID_compra),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto),
    FOREIGN KEY (ID_compra) REFERENCES compra(ID_compra)
);

CREATE TABLE inventario (
    ID_inventario INT NOT NULL AUTO_INCREMENT,
    ID_producto INT NOT NULL,
    stockActual INT NOT NULL,
    stockMinimo INT NOT NULL,
    stockMaximo INT NOT NULL,
    PRIMARY KEY (ID_inventario),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE cliente (
    ID_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(100),
    PRIMARY KEY (ID_cliente)
) ;

-- Tabla: ventas
CREATE TABLE ventas (
    ID_ventas INT NOT NULL AUTO_INCREMENT,
    descripcion TEXT,
    PRIMARY KEY (ID_ventas)
) ;

CREATE TABLE productoVentas (
    ID_producto INT NOT NULL,
    ID_ventas INT NOT NULL,
    PRIMARY KEY (ID_producto, ID_ventas),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto),
    FOREIGN KEY (ID_ventas) REFERENCES ventas(ID_ventas)
) ;


CREATE TABLE cliente_ventas (
    ID_cliente INT NOT NULL,
    ID_ventas INT NOT NULL,
    PRIMARY KEY (ID_cliente, ID_ventas),
    FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
    FOREIGN KEY (ID_ventas) REFERENCES ventas(ID_ventas)
);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 21:20:42
