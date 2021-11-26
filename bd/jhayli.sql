-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para jhayli
CREATE DATABASE IF NOT EXISTS `jhayli` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `jhayli`;

-- Volcando estructura para tabla jhayli.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.detalle_ingreso
CREATE TABLE IF NOT EXISTS `detalle_ingreso` (
  `detalleingreso_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `detalleingreso_cantidad` decimal(10,2) DEFAULT NULL,
  `detalleingreso_precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detalleingreso_id`),
  KEY `ingreso_id` (`ingreso_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso` (`ingreso_id`),
  CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `detalleventa_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `detalleventa_cantidad` decimal(10,2) DEFAULT NULL,
  `detalleventa_precio` decimal(10,2) DEFAULT NULL,
  `detalleventa_descuento` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detalleventa_id`),
  KEY `venta_id` (`venta_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.ingreso
CREATE TABLE IF NOT EXISTS `ingreso` (
  `ingreso_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `ingreso_tipcomprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_seriecomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_numcomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_fecha` date DEFAULT NULL,
  `ingreso_total` decimal(10,2) DEFAULT NULL,
  `ingreso_impuesto` decimal(10,2) DEFAULT NULL,
  `ingreso_estatus` enum('INGRESADO','PENDIENTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`),
  CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_apepat` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_apemat` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_nrodocumento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_tipodocumento` enum('DNI','RUC','PASAPORTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_telefono` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_fregistro` date DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_presentacion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_stock` decimal(10,2) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `producto_foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `unidad_id` (`unidad_id`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`unidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_contacto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci NOT NULL,
  `rol_feregistro` date DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento jhayli.SP_ACTUALIZAR_CONTRA_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_ACTUALIZAR_CONTRA_USUARIO`(IN ID INT, IN CONTRA VARCHAR
(250))
UPDATE usuario set
usuario_password=CONTRA
where usuario_id=ID//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_ACTUALIZAR_DATOS_PERSONA_PROFILE
DELIMITER //
CREATE PROCEDURE `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`(IN ID INT, 
IN NOMBRE VARCHAR(100), IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), 
IN NUMERODOCUMENTO VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), 
IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(12))
BEGIN
DECLARE CANTIDAD INT;
DECLARE IDPERSONA INT;
DECLARE DOCUMENTOACTUAL INT;
SET @IDPERSONA:=(SELECT persona_id from usuario where usuario_id=ID);
SET @DOCUMENTOACTUAL:=(SELECT persona_nrodocumento from persona where persona_id=@IDPERSONA);
IF @DOCUMENTOACTUAL=NUMERODOCUMENTO THEN
  UPDATE persona set
   persona_nombre=NOMBRE, 
   persona_apepat=APEPAT, 
   persona_apemat=APEMAT, 
   persona_tipodocumento=TIPODOCUMENTO, 
   persona_sexo=SEXO, 
   persona_telefono=TELEFONO
  where persona_id=@IDPERSONA;
  SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM persona where persona_nrodocumento=NUMERODOCUMENTO);
IF @CANTIDAD = 0 THEN
  UPDATE persona set
   persona_nombre=NOMBRE, 
   persona_apepat=APEPAT, 
   persona_apemat=APEMAT, 
   persona_nrodocumento=NUMERODOCUMENTO,
   persona_tipodocumento=TIPODOCUMENTO, 
   persona_sexo=SEXO, 
   persona_telefono=TELEFONO
   where persona_id=@IDPERSONA;
   SELECT 1;
ELSE
SELECT 2;
END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_EDITAR_CATEGORIA
DELIMITER //
CREATE PROCEDURE `SP_EDITAR_CATEGORIA`(IN ID INT, IN CATEGORIAACTUAL VARCHAR(150),IN CATEGORIANUEVO VARCHAR(150),IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF CATEGORIAACTUAL=CATEGORIANUEVO THEN
	UPDATE categoria set
	categoria_estatus=ESTATUS
	where categoria_id=ID;
	SELECT 1;
ELSE
	set CANTIDAD:=(SELECT COUNT(*) FROM categoria where categoria_nombre=CATEGORIANUEVO);
	IF CANTIDAD = 0 THEN
	UPDATE categoria SET
	categoria_nombre=CATEGORIANUEVO,
	categoria_estatus=ESTATUS
	where categoria_id=ID;
	select 1;
ELSE
select 2;
END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_EDITAR_PERSONA
DELIMITER //
CREATE PROCEDURE `SP_EDITAR_PERSONA`(IN IDPERSONA INT, IN NOMBRE VARCHAR(100),
IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), IN NUMERODOCUMENTOA VARCHAR(11),
IN NUMERODOCUMENTON VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), IN SEXO VARCHAR(10),
IN TELEFONO VARCHAR(12), IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF NUMERODOCUMENTOA = NUMERODOCUMENTON THEN 
	UPDATE persona set
	persona_nombre=NOMBRE,
	persona_apepat=APEPAT,
	persona_apemat=APEMAT,
	persona_tipodocumento=TIPODOCUMENTO,
	persona_sexo=SEXO,
	persona_telefono=TELEFONO,
	persona_estatus=ESTATUS
	where persona_id=IDPERSONA;
	SELECT 1;
ELSE
	SET @CANTIDAD:= (SELECT COUNT(*) FROM persona where persona_nrodocumento=
	NUMERODOCUMENTON);
	IF @CANTIDAD = 0 THEN 
	UPDATE persona set
	persona_nombre=NOMBRE,
	persona_apepat=APEPAT,
	persona_apemat=APEMAT,
persona_nrodocumento=NUMERODOCUMENTON,
	persona_tipodocumento=TIPODOCUMENTO,
	persona_sexo=SEXO,
	persona_telefono=TELEFONO,
	persona_estatus=ESTATUS
	where persona_id=IDPERSONA;
	SELECT 1;
	ELSE
	SELECT 2;
END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_EDITAR_ROL
DELIMITER //
CREATE PROCEDURE `SP_EDITAR_ROL`(IN ID INT, IN ROLACTUAL VARCHAR(15),IN ROLNUEVO VARCHAR(15),IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF ROLACTUAL=ROLNUEVO THEN
	UPDATE rol set
	rol_estatus=ESTATUS
	where rol_id=ID;
	SELECT 1;
ELSE
	set CANTIDAD:=(SELECT COUNT(*) FROM rol where rol_nombre=ROLNUEVO);
	IF CANTIDAD = 0 THEN
	UPDATE rol SET
	rol_nombre=ROLNUEVO,
	rol_estatus=ESTATUS
	where rol_id=ID;
	select 1;
ELSE
select 2;
END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_CATEGORIA
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre, 
	categoria.categoria_fregistro, 
	categoria.categoria_estatus
FROM
	categoria//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_PERSONA
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT
	persona.persona_id, 
	CONCAT_WS(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apemat)
FROM
	persona
	WHERE persona_estatus = 'ACTIVO'//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_ROL
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT rol_id, rol_nombre from rol where rol_estatus= 'ACTIVO'//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_PERSONA
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_PERSONA`()
SELECT
	CONCAT_WS(' ',persona_nombre,persona_apepat,persona_apemat) as persona,
	persona.persona_id, 
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apemat, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	persona.persona_estatus
FROM
	persona//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_ROL
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_ROL`()
SELECT
	rol.rol_id, 
	rol.rol_nombre, 
	rol.rol_estatus, 
	rol.rol_feregistro
FROM
	rol//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
SELECT
	usuario.usuario_id, 
	usuario.usuario_nombre, 
	usuario.usuario_email, 
	usuario.usuario_estatus, 
	usuario.usuario_imagen, 
	usuario.rol_id, 
	usuario.persona_id, 
	rol.rol_nombre, 
	CONCAT_WS(' ',persona.persona_nombre, persona.persona_apepat, persona.persona_apemat) as persona
FROM
	usuario
	INNER JOIN
	rol
	ON 
		usuario.rol_id = rol.rol_id
	LEFT JOIN 
	persona
	ON 
		usuario.persona_id = persona.persona_id//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_USUARIO`(IN ID INT,
IN IDPERSONA INT, IN EMAILNUEVO VARCHAR(255), IN IDROL INT, IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
DECLARE EMAILACTUAL VARCHAR(50);
SET @EMAILACTUAL:=(SELECT usuario_email from usuario where usuario_id=ID);
IF @EMAILACTUAL=EMAILNUEVO THEN
	UPDATE usuario set
	persona_id=IDPERSONA,
	rol_id=IDROL,
	usuario_estatus=ESTATUS
	where usuario_id=ID;
	SELECT 1;
	
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario where usuario_email=EMAILNUEVO);
	IF @CANTIDAD = 0 THEN 
	UPDATE usuario set
	persona_id=IDPERSONA,
	rol_id=IDROL,
	usuario_estatus=ESTATUS,
	usuario_email=EMAILNUEVO
	where usuario_id=ID;
	SELECT 1;
ELSE
SELECT 2;
END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_USUARIO_FOTO
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
UPDATE usuario set
usuario_imagen=FOTO
where usuario_id=ID;
SELECT 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_CATEGORIA
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_CATEGORIA`(IN CATEGORIA VARCHAR(150))
BEGIN
DECLARE CANTIDAD INT; 

SET @CANTIDAD:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA);

IF @CANTIDAD = 0 THEN 
INSERT INTO categoria (categoria_nombre, categoria_fregistro, categoria_estatus) VALUES (CATEGORIA, CURDATE(), 'ACTIVO');
SELECT 1;

ELSE

SELECT 2;

END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_PERSONA
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_PERSONA`(IN NOMBRE VARCHAR(100), IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(12))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM persona where persona_nrodocumento=NUMERODOCUMENTO);
IF @CANTIDAD = 0 THEN
INSERT INTO persona(persona_nombre, persona_apepat, persona_apemat, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono, persona_fregistro,persona_estatus)values (NOMBRE, APEPAT, APEMAT, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_ROL
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_ROL`(IN NROL VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT; 

SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE rol_nombre = NROL);

IF @CANTIDAD = 0 THEN 
INSERT INTO ROL (rol_nombre, rol_feregistro, rol_estatus) VALUES (NROL, CURDATE(), 'ACTIVO');
SELECT 1;

ELSE

SELECT 2;

END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(15), IN CONTRA VARCHAR(250), IN IDPERSONA INT, IN EMAIL VARCHAR(250), IN IDROL INT, IN RUTA VARCHAR(250))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario where usuario_nombre=USUARIO OR usuario_email=EMAIL);
IF @CANTIDAD = 0 THEN
	INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, usuario_email, rol_id, usuario_imagen, usuario_intento, usuario_estatus) VALUES (USUARIO, CONTRA, IDPERSONA, EMAIL, IDROL, RUTA, 1, 'ACTIVO');
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_TRAER_DATOS_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN ID INT)
SELECT 
usuario.usuario_id,
usuario.usuario_nombre,
usuario.usuario_password,
usuario.usuario_email,
usuario.usuario_intento,
usuario.usuario_estatus,
usuario.rol_id,
rol.rol_nombre,
persona.persona_nombre,
persona.persona_apepat,
persona.persona_apemat,
persona.persona_nrodocumento,
persona.persona_tipodocumento,
persona.persona_sexo,
persona.persona_telefono,
persona.persona_fregistro,
usuario.usuario_imagen
FROM
	usuario
	INNER JOIN 
	rol
	ON
	usuario.rol_id = rol.rol_id
	LEFT JOIN
	persona
	ON
	usuario.persona_id = persona.persona_id
	where usuario_id=ID//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_VERIFICAR_USUARIO
DELIMITER //
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO VARCHAR(15))
SELECT * FROM usuario WHERE usuario_nombre=USUARIO//
DELIMITER ;

-- Volcando estructura para tabla jhayli.unidad_medida
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `unidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`unidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_password` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_email` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_intento` int(11) NOT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT '0',
  `usuario_imagen` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `FK_usuario_rol` (`rol_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla jhayli.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `venta_tipocomprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_seriecomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_numcomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_fecha` date DEFAULT NULL,
  `venta_impuesto` decimal(10,2) DEFAULT NULL,
  `venta_total` decimal(10,2) DEFAULT NULL,
  `venta_estatus` enum('PAGADA','ANULADA','PENDIENTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;