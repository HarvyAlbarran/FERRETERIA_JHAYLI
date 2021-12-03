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

-- Volcando datos para la tabla jhayli.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_fregistro`, `categoria_estatus`) VALUES
	(1, 'CONSTRUCCIÓN', '2021-11-25', 'ACTIVO'),
	(2, 'ELÉCTRICOS', '2021-11-25', 'ACTIVO');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla jhayli.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cliente_id`, `cliente_fregistro`, `cliente_estatus`, `persona_id`) VALUES
	(1, '2021-12-01', 'ACTIVO', 2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

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

-- Volcando datos para la tabla jhayli.detalle_ingreso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;

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

-- Volcando datos para la tabla jhayli.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

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
  `ingreso_porcentaje` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`),
  CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.ingreso: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` (`ingreso_id`, `proveedor_id`, `usuario_id`, `ingreso_tipcomprobante`, `ingreso_seriecomprobante`, `ingreso_numcomprobante`, `ingreso_fecha`, `ingreso_total`, `ingreso_impuesto`, `ingreso_estatus`, `ingreso_porcentaje`) VALUES
	(1, 2, 1, 'Factura', 'FAC', '001', '2021-12-01', 100.00, 15.00, 'INGRESADO', NULL);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.persona: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`persona_id`, `persona_nombre`, `persona_apepat`, `persona_apemat`, `persona_nrodocumento`, `persona_tipodocumento`, `persona_sexo`, `persona_telefono`, `persona_fregistro`, `persona_estatus`) VALUES
	(1, 'HARVY', 'ALBARRAN', 'SALAZAR', '48251369', 'DNI', 'MASCULINO', '984198324', '2021-11-23', 'ACTIVO'),
	(2, 'JENNIFFER GERALDINE', 'DIAZ', 'CORONADO', '46894656', 'DNI', 'FEMENINO', '986413872', '2021-11-24', 'ACTIVO'),
	(3, 'PERLA', 'PAICO', 'SANTOS', '5648315821', 'PASAPORTE', 'FEMENINO', '982572310', '2021-11-24', 'ACTIVO'),
	(4, 'SEGUNDO', 'ASENJO', 'SAAVEDRA', '78456632', 'DNI', 'MASCULINO', '982158232', '2021-11-24', 'ACTIVO'),
	(5, 'ERNESTO', 'HUAMAN', 'MIO', '43564125', 'DNI', 'MASCULINO', '985482135', '2021-11-26', 'ACTIVO'),
	(6, 'WILMER', 'CUNYARACHE', 'ROñA', '64543561', 'DNI', 'MASCULINO', '974356432', '2021-11-26', 'ACTIVO'),
	(7, 'LUCILA', 'CRUZ', 'LLAGUENTO', '68742348', 'DNI', 'FEMENINO', '987542345', '2021-11-26', 'ACTIVO'),
	(8, 'FERRETERIA DIAZ', 'PEREZ', 'VASQUEZ', '78943215825', 'RUC', 'FEMENINO', '984214511', '2021-12-02', 'ACTIVO');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.producto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`producto_id`, `producto_nombre`, `producto_presentacion`, `producto_stock`, `categoria_id`, `unidad_id`, `producto_foto`, `producto_precioventa`, `producto_estatus`) VALUES
	(1, 'Martillo', 'Andino', 10.00, 1, 5, 'controller/producto/img/producto_default.png', 10.00, 'ACTIVO'),
	(2, 'CEMENTO', 'PACASMAYO ROJO', 0.00, 1, 5, 'controller/producto/img/producto_default.png', 31.50, 'ACTIVO'),
	(3, 'CEMENTO AZUL', 'PACASMAYO ', 0.00, 1, 1, 'controller/producto/img/PRO112202112943.png', 32.50, 'ACTIVO');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla jhayli.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_contacto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `proveedor_razonsocial` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.proveedor: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` (`proveedor_id`, `proveedor_numcontacto`, `proveedor_contacto`, `proveedor_estatus`, `persona_id`, `proveedor_razonsocial`) VALUES
	(2, '958514332', 'FERRETERIA DIAZ', 'ACTIVO', 8, 'AV. CHICLAYO Y CORNEJO');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla jhayli.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci NOT NULL,
  `rol_feregistro` date DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.rol: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`rol_id`, `rol_nombre`, `rol_estatus`, `rol_feregistro`) VALUES
	(1, 'ADMIN', 'ACTIVO', '2021-11-22'),
	(3, 'VENDEDOR', 'ACTIVO', '2021-11-23');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

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

-- Volcando estructura para procedimiento jhayli.SP_EDITAR_PRODUCTO
DELIMITER //
CREATE PROCEDURE `SP_EDITAR_PRODUCTO`(IN IDPRODUCTO INT, IN PRODUCTO VARCHAR(255),
IN PRESENTACION VARCHAR(255), IN CATEGORIA INT, IN UNIDAD INT,
IN PRECIO DECIMAL(10,2), IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
DECLARE PRODUCTOACTUAL VARCHAR(255);
SET @PRODUCTOACTUAL:=(SELECT producto_nombre from producto WHERE producto_id=IDPRODUCTO);
IF @PRODUCTOACTUAL = PRODUCTO THEN 
	UPDATE producto set
	producto_presentacion=PRESENTACION,
	categoria_id=CATEGORIA,
	unidad_id=UNIDAD,
	producto_precioventa=PRECIO,
	producto_estatus=ESTATUS
	WHERE producto_id=IDPRODUCTO;
	SELECT 1;
	
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) producto_nombre from producto WHERE producto_nombre=PRODUCTO);
	
	IF @CANTIDAD = 0 THEN
		UPDATE producto set
		producto_nombre=PRODUCTO,
		producto_presentacion=PRESENTACION,
		categoria_id=CATEGORIA,
		unidad_id=UNIDAD,
		producto_precioventa=PRECIO,
		producto_estatus=ESTATUS
		WHERE producto_id=IDPRODUCTO;
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

-- Volcando estructura para procedimiento jhayli.SP_EDITAR_UNIDADMEDIDA
DELIMITER //
CREATE PROCEDURE `SP_EDITAR_UNIDADMEDIDA`(IN ID INT, IN UNIDADACTUAL VARCHAR(100),
IN UNIDADNUEVA VARCHAR(100), IN ABREVIATURAEDITAR VARCHAR(6), IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;
IF UNIDADACTUAL = UNIDADNUEVA THEN
UPDATE unidad_medida set
unidad_abreviatura=ABREVIATURAEDITAR,
unidad_estatus=ESTATUS
where unidad_id=ID;
SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad_medida where unidad_nombre=UNIDADNUEVA);
IF @CANTIDAD = 0 THEN 
UPDATE unidad_medida set
unidad_nombre=UNIDADNUEVA,
unidad_abreviatura=ABREVIATURAEDITAR,
unidad_estatus=ESTATUS
where unidad_id=ID;
SELECT 1;
ELSE
SELECT 2;
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

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_CLIENTE
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT
	CONCAT(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apemat) AS persona, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	cliente.cliente_fregistro, 
	cliente.cliente_estatus, 
	persona.persona_id, 
	cliente.cliente_id
FROM
	cliente
	INNER JOIN
	persona
	ON 
		cliente.persona_id = persona.persona_id//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_CATEGORIA
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT categoria_id, categoria_nombre 
FROM categoria//
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

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_PRODUCTO
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT producto_id, producto_nombre FROM producto 
where producto_estatus='ACTIVO'//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_PROVEEDOR
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT proveedor_id, proveedor_contacto FROM proveedor 
where proveedor_estatus='ACTIVO'//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_ROL
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT rol_id, rol_nombre from rol where rol_estatus= 'ACTIVO'//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_COMBO_UNIDAD
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_COMBO_UNIDAD`()
SELECT unidad_id, unidad_nombre 
FROM unidad_medida//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_INGRESO
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_INGRESO`(IN INICIO DATE, IN FIN DATE)
SELECT
ingreso.ingreso_id,
ingreso.proveedor_id,
ingreso.usuario_id,
ingreso.ingreso_tipcomprobante,
ingreso.ingreso_seriecomprobante,
ingreso.ingreso_numcomprobante,
ingreso.ingreso_fecha,
ingreso.ingreso_total,
ingreso.ingreso_impuesto,
ingreso.ingreso_estatus,
usuario.usuario_nombre,
CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apemat) as proveedor
FROM
ingreso
INNER JOIN
usuario
ON
ingreso.usuario_id = usuario.usuario_id
INNER JOIN 
proveedor 
ON
ingreso.proveedor_id = proveedor.proveedor_id
INNER JOIN 
persona 
ON
proveedor.persona_id = persona.persona_id
where ingreso.ingreso_fecha BETWEEN INICIO AND FIN//
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

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_PRODUCTO
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_PRODUCTO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre, 
	producto.producto_presentacion, 
	producto.producto_stock, 
	producto.categoria_id, 
	producto.unidad_id, 
	producto.producto_foto, 
	producto.producto_precioventa, 
	producto.producto_estatus, 
	unidad_medida.unidad_nombre, 
	categoria.categoria_nombre
FROM
	producto
	INNER JOIN
	unidad_medida
	ON 
		producto.unidad_id = unidad_medida.unidad_id
	INNER JOIN
	categoria
	ON 
		producto.categoria_id = categoria.categoria_id//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_PROVEEDOR
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_PROVEEDOR`()
SELECT
	proveedor.proveedor_numcontacto, 
	proveedor.proveedor_contacto, 
	CONCAT_WS(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apemat) AS persona, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	proveedor.persona_id, 
	proveedor.proveedor_id, 
	proveedor.proveedor_estatus,
	proveedor.proveedor_razonsocial
FROM
	proveedor
	INNER JOIN
	persona
	ON 
		proveedor.persona_id = persona.persona_id//
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

-- Volcando estructura para procedimiento jhayli.SP_LISTAR_UNIDADMEDIDA
DELIMITER //
CREATE PROCEDURE `SP_LISTAR_UNIDADMEDIDA`()
SELECT
unidad_medida.unidad_id,
unidad_medida.unidad_nombre,
unidad_medida.unidad_fregistro,
unidad_medida.unidad_estatus,
unidad_medida.unidad_abreviatura
FROM
unidad_medida//
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

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_ESTATUS_CLIENTE
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_ESTATUS_CLIENTE`(IN IDCLIENTE INT, IN ESTATUS VARCHAR(10))
UPDATE cliente set
cliente_estatus=ESTATUS
WHERE cliente_id=IDCLIENTE//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_ESTATUS_PROVEEDOR
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_ESTATUS_PROVEEDOR`(IN IDPROVEEDOR INT, IN ESTATUS VARCHAR(10))
UPDATE proveedor set
proveedor_estatus=ESTATUS
WHERE proveedor_id=IDPROVEEDOR//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_PRODUCTO_FOTO
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_PRODUCTO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
UPDATE producto set
producto_foto=FOTO
where producto_id=ID;
SELECT 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_MODIFICAR_PROVEEDOR
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_PROVEEDOR`(IN IDPROVEEDOR INT, IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(12) )
UPDATE proveedor set
proveedor_razonsocial=RAZONSOCIAL,
proveedor_contacto=NOMCONTACTO,
proveedor_numcontacto=NUMCONTACTO
WHERE proveedor_id=IDPROVEEDOR//
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

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_CLIENTE
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_CLIENTE`(IN NOMBRE VARCHAR(100), IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(12))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM persona where persona_nrodocumento=NUMERODOCUMENTO);
IF @CANTIDAD = 0 THEN
INSERT INTO persona(persona_nombre, persona_apepat, persona_apemat, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono, persona_fregistro,persona_estatus)values (NOMBRE, APEPAT, APEMAT, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
INSERT INTO cliente(cliente_fregistro, cliente_estatus, persona_id) VALUES (CURDATE(), 'ACTIVO', LAST_INSERT_ID());
SELECT 1;
ELSE
SELECT 2;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_INGRESO
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_INGRESO`(IN IDPROVEEDOR INT, IN IDUSUARIO INT,
IN TIPO VARCHAR(50), IN SERIE VARCHAR(20), IN NUM VARCHAR(20), IN TOTAL DECIMAL(10,2), IN IMPUESTO DECIMAL(10,2),
IN PORCENTAJE DECIMAL(2,2))
BEGIN 
INSERT INTO ingreso(proveedor_id,usuario_id,ingreso_tipocomprobante,ingreso_seriecomprobante,
ingreso_numcomprobante, ingreso_fecha, ingreso_total, ingreso_impuesto, ingreso_estatus, ingreso_porcentaje)
values(IDPROVEEDOR,IDUSUARIO,TIPO,SERIE,NUM,CURDATE(),TOTAL,IMPUESTO,'PENDIENTE',PORCENTAJE);
SELECT LAST_INSERT_ID();
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_INGRESO_DETALLE
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_INGRESO_DETALLE`(IN ID INT, IN PRODUCTO INT, 
IN CANTIDAD DECIMAL(10,2), IN PRECIO DECIMAL(10,2))
INSERT INTO detalle_ingreso(ingreso_id, producto_id, detalleingreso_cantidad,
detalleingreso_precio)VALUES(ID,PRODUCTO,CANTIDAD,PRECIO)//
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

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_PRODUCTO
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN PRODUCTO VARCHAR(255),
IN PRESENTACION VARCHAR(255), IN CATEGORIA INT, IN UNIDAD INT,
IN PRECIO DECIMAL(10,2), IN RUTA VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE 
producto_nombre=PRODUCTO);
IF @CANTIDAD=0 THEN 
INSERT INTO producto(producto_nombre, producto_presentacion, producto_stock,
categoria_id, unidad_id, producto_foto,producto_precioventa, producto_estatus)
VALUES (PRODUCTO,PRESENTACION,0,CATEGORIA,UNIDAD,RUTA, PRECIO, 'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_PROVEEDOR
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN NOMBRE VARCHAR(100), IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(12), IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(12) )
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM persona where persona_nrodocumento=NUMERODOCUMENTO AND persona_tipodocumento='RUC');
IF @CANTIDAD = 0 THEN
INSERT INTO persona(persona_nombre, persona_apepat, persona_apemat, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono, persona_fregistro,persona_estatus)values (NOMBRE, APEPAT, APEMAT, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
INSERT INTO proveedor(proveedor_numcontacto, proveedor_contacto, proveedor_estatus, persona_id, proveedor_razonsocial) VALUES (NUMCONTACTO, NOMCONTACTO, 'ACTIVO', LAST_INSERT_ID(), RAZONSOCIAL);
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

-- Volcando estructura para procedimiento jhayli.SP_REGISTRAR_UNIDADMEDIDA
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_UNIDADMEDIDA`(IN UNIDAD VARCHAR(100), IN ABREVIATURA CHAR(6))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad_medida
where unidad_nombre=UNIDAD);
IF @CANTIDAD = 0 THEN 
INSERT INTO unidad_medida(unidad_nombre, unidad_abreviatura,
unidad_fregistro, unidad_estatus) values (UNIDAD, ABREVIATURA, CURDATE(),
'ACTIVO');
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
  `unidad_abreviatura` char(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad_fregistro` date DEFAULT NULL,
  PRIMARY KEY (`unidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.unidad_medida: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` (`unidad_id`, `unidad_nombre`, `unidad_estatus`, `unidad_abreviatura`, `unidad_fregistro`) VALUES
	(1, 'Kilogramo', 'ACTIVO', 'kg', '2021-11-29'),
	(2, 'Litro', 'ACTIVO', 'L', '2021-11-29'),
	(3, 'Metro', 'ACTIVO', 'm', '2021-11-29'),
	(4, 'Centimetro', 'ACTIVO', 'cm', '2021-11-29'),
	(5, 'Entero', 'ACTIVO', 'E', '2021-11-29');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla jhayli.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_password`, `usuario_email`, `usuario_intento`, `usuario_estatus`, `rol_id`, `usuario_imagen`, `persona_id`) VALUES
	(1, 'admin', '$2y$10$CEQ98B6dCF2kBdPJsfZBMuHhOsDFsHPfGlYA3pX.kA9tFztA/BsXu', 'admin@gmail.com', 1, 'ACTIVO', 1, 'controller/usuario/img/user_defecto.png', NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

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

-- Volcando datos para la tabla jhayli.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
