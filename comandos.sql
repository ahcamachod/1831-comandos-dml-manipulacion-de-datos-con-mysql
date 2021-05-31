/*En este archivo .sql encontrarás todos los comandos que ejecutaremos durante el desarrollo de nuestro entrenamiento. 

Por el momento, te invitamos a preparar el ambiente para que puedas desarrollar todos los ejercicios. 

¡Te deseo muchos éxitos en tus estudios!*/

/*COMANDOS AULA 1

A partir de este punto, estás listo para trabajar directamente en Workbench.

Debes ver todos los videos referentes al Aula 2 y colocar en práctica lo que estarás aprendiendo.

¡Mucho ánimo! Nuestro curso ha comenzado.*/

/*COMANDOS AULA 2*/

CREATE DATABASE ventas_jugos;

CREATE SCHEMA IF NOT EXISTS ventas_jugos2;

DROP DATABASE ventas_jugos2;

CREATE SCHEMA IF NOT EXISTS ventas_jugos2 DEFAULT
CHARSET utf32;

USE ventas_jugos;

CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);

CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

USE ventas_jugos;

CREATE TABLE tb_venta(
NUMERO VARCHAR(5) NOT NULL,
FECHA DATE NULL,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY(NUMERO)
);

ALTER TABLE tb_venta ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_venta ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);

USE ventas_jugos;

ALTER TABLE tb_venta RENAME tb_factura;

USE ventas_jugos;

CREATE TABLE tb_items_facturas(
NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO,CODIGO)
);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_FACTURA
FOREIGN KEY (NUMERO) REFERENCES tb_factura(NUMERO);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);

-- MySQL Script generated by MySQL Workbench
-- Thu May 27 06:29:18 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ventas_jugos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ventas_jugos` ;

-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_cliente` (
  `DNI` VARCHAR(11) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `DIRECCION` VARCHAR(150) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `CIUDAD` VARCHAR(50) NULL DEFAULT NULL,
  `ESTADO` VARCHAR(10) NULL DEFAULT NULL,
  `CP` VARCHAR(10) NULL DEFAULT NULL,
  `FECHA_NACIMIENTO` DATE NULL DEFAULT NULL,
  `EDAD` SMALLINT NULL DEFAULT NULL,
  `SEXO` VARCHAR(1) NULL DEFAULT NULL,
  `LIMITE_CREDITO` FLOAT NULL DEFAULT NULL,
  `VOLUMEN_COMPRA` FLOAT NULL DEFAULT NULL,
  `PRIMERA_COMPRA` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_vendedor` (
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `COMISION` FLOAT NULL DEFAULT NULL,
  `FECHA_ADMISION` DATE NULL DEFAULT NULL,
  `DE_VACACIONES` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_factura` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `FECHA` DATE NULL DEFAULT NULL,
  `DNI` VARCHAR(11) NOT NULL,
  `MATRICULA` VARCHAR(5) NOT NULL,
  `IMPUESTO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  INDEX `FK_CLIENTE` (`DNI` ASC) VISIBLE,
  INDEX `FK_VENDEDOR` (`MATRICULA` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE`
    FOREIGN KEY (`DNI`)
    REFERENCES `ventas_jugos`.`tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR`
    FOREIGN KEY (`MATRICULA`)
    REFERENCES `ventas_jugos`.`tb_vendedor` (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_producto` (
  `CODIGO` VARCHAR(10) NOT NULL,
  `DESCRIPCION` VARCHAR(100) NULL DEFAULT NULL,
  `SABOR` VARCHAR(50) NULL DEFAULT NULL,
  `TAMANO` VARCHAR(50) NULL DEFAULT NULL,
  `ENVASE` VARCHAR(50) NULL DEFAULT NULL,
  `PRECIO_LISTA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_items_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_items_facturas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NOT NULL,
  `CANTIDAD` INT NULL DEFAULT NULL,
  `PRECIO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`, `CODIGO`),
  INDEX `FK_PRODUCTO` (`CODIGO` ASC) VISIBLE,
  CONSTRAINT `FK_FACTURA`
    FOREIGN KEY (`NUMERO`)
    REFERENCES `ventas_jugos`.`tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO`
    FOREIGN KEY (`CODIGO`)
    REFERENCES `ventas_jugos`.`tb_producto` (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*COMANDOS AULA 3*/

USE ventas_jugos;

INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE,
PRECIO_LISTA) VALUES (
'1040107', 'Light', 'Sandía', '350 ml', 'Lata', 4.56
);

SELECT * FROM tb_producto;

INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE,
PRECIO_LISTA) VALUES (
'1040108', 'Guanábana', 'Light', '350 ml', 'Lata', 4.00
);

INSERT INTO tb_producto VALUES 
('1040109', 'Light', 'Asaí', '350 ml', 'Lata', 5.60), 
('1040110', 'Light', 'Manzana', '350 ml', 'Lata', 6.00),
('1040111', 'Light', 'Mango', '350 ml', 'Lata', 3.50);

USE ventas_jugos;

SELECT * FROM jugos_ventas.tabla_de_productos;

SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

INSERT INTO tb_producto
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM tb_producto;

USE ventas_jugos;

SELECT * FROM tb_cliente;

SELECT * FROM jugos_ventas.tabla_de_clientes;

SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);

INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);
