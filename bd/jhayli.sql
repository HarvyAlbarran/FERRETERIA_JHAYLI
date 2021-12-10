/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : jhayli

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 09/12/2021 23:07:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `categoria_fregistro` date NULL DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoria_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'CONSTRUCCIÓN', '2021-11-25', 'ACTIVO');
INSERT INTO `categoria` VALUES (2, 'ELÉCTRICOS', '2021-11-25', 'ACTIVO');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date NULL DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cliente_id`) USING BTREE,
  INDEX `persona_id`(`persona_id`) USING BTREE,
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, '2021-12-01', 'ACTIVO', 2);

-- ----------------------------
-- Table structure for detalle_ingreso
-- ----------------------------
DROP TABLE IF EXISTS `detalle_ingreso`;
CREATE TABLE `detalle_ingreso`  (
  `detalleingreso_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_id` int(11) NULL DEFAULT NULL,
  `producto_id` int(11) NULL DEFAULT NULL,
  `detalleingreso_cantidad` decimal(10, 2) NULL DEFAULT NULL,
  `detalleingreso_precio` decimal(10, 2) NULL DEFAULT NULL,
  `detalleingreso_estatus` enum('INGRESADO','ANULADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detalleingreso_id`) USING BTREE,
  INDEX `ingreso_id`(`ingreso_id`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE,
  CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso` (`ingreso_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_ingreso
-- ----------------------------
INSERT INTO `detalle_ingreso` VALUES (4, 24, 1, 5.00, 10.50, 'INGRESADO');

-- ----------------------------
-- Table structure for detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta`  (
  `detalleventa_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NULL DEFAULT NULL,
  `producto_id` int(11) NULL DEFAULT NULL,
  `detalleventa_cantidad` decimal(10, 2) NULL DEFAULT NULL,
  `detalleventa_precio` decimal(10, 2) NULL DEFAULT NULL,
  `detalleventa_estatus` enum('INGRESADO','ANULADA') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detalleventa_id`) USING BTREE,
  INDEX `venta_id`(`venta_id`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE,
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_venta
-- ----------------------------
INSERT INTO `detalle_venta` VALUES (4, 7, 1, 3.00, 10.00, 'ANULADA');
INSERT INTO `detalle_venta` VALUES (5, 8, 1, 3.00, 10.00, 'ANULADA');
INSERT INTO `detalle_venta` VALUES (6, 9, 1, 3.00, 10.00, 'ANULADA');
INSERT INTO `detalle_venta` VALUES (7, 10, 1, 3.00, 10.00, 'INGRESADO');

-- ----------------------------
-- Table structure for ingreso
-- ----------------------------
DROP TABLE IF EXISTS `ingreso`;
CREATE TABLE `ingreso`  (
  `ingreso_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  `ingreso_tipcomprobante` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ingreso_seriecomprobante` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ingreso_numcomprobante` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ingreso_fecha` date NULL DEFAULT NULL,
  `ingreso_total` decimal(10, 2) NULL DEFAULT NULL,
  `ingreso_impuesto` decimal(10, 2) NULL DEFAULT NULL,
  `ingreso_estatus` enum('INGRESADO','ANULADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ingreso_porcentaje` decimal(2, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`) USING BTREE,
  INDEX `proveedor_id`(`proveedor_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ingreso
-- ----------------------------
INSERT INTO `ingreso` VALUES (24, 2, 1, 'BOLETA', '001', '001', '2021-12-09', 52.50, 0.00, 'INGRESADO', 0.00);

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona`  (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_apepat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_apemat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_nrodocumento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_tipodocumento` enum('DNI','RUC','PASAPORTE') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_telefono` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_fregistro` date NULL DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`persona_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES (1, 'HARVY', 'ALBARRAN', 'SALAZAR', '48251369', 'DNI', 'MASCULINO', '984198324', '2021-11-23', 'ACTIVO');
INSERT INTO `persona` VALUES (2, 'JENNIFFER GERALDINE', 'DIAZ', 'CORONADO', '46894656', 'DNI', 'FEMENINO', '986413872', '2021-11-24', 'ACTIVO');
INSERT INTO `persona` VALUES (3, 'PERLA', 'PAICO', 'SANTOS', '5648315821', 'PASAPORTE', 'FEMENINO', '982572310', '2021-11-24', 'ACTIVO');
INSERT INTO `persona` VALUES (4, 'SEGUNDO', 'ASENJO', 'SAAVEDRA', '78456632', 'DNI', 'MASCULINO', '982158232', '2021-11-24', 'ACTIVO');
INSERT INTO `persona` VALUES (5, 'ERNESTO', 'HUAMAN', 'MIO', '43564125', 'DNI', 'MASCULINO', '985482135', '2021-11-26', 'ACTIVO');
INSERT INTO `persona` VALUES (6, 'WILMER', 'CUNYARACHE', 'ROñA', '64543561', 'DNI', 'MASCULINO', '974356432', '2021-11-26', 'ACTIVO');
INSERT INTO `persona` VALUES (7, 'LUCILA', 'CRUZ', 'LLAGUENTO', '68742348', 'DNI', 'FEMENINO', '987542345', '2021-11-26', 'ACTIVO');
INSERT INTO `persona` VALUES (8, 'FERRETERIA DIAZ', 'PEREZ', 'VASQUEZ', '78943215825', 'RUC', 'FEMENINO', '984214511', '2021-12-02', 'ACTIVO');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_presentacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_stock` decimal(10, 2) NULL DEFAULT NULL,
  `categoria_id` int(11) NULL DEFAULT NULL,
  `unidad_id` int(11) NULL DEFAULT NULL,
  `producto_foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_precioventa` decimal(10, 2) NULL DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`producto_id`) USING BTREE,
  INDEX `categoria_id`(`categoria_id`) USING BTREE,
  INDEX `unidad_id`(`unidad_id`) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`unidad_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'Martillo', 'Andino', 15.00, 1, 5, 'controller/producto/img/producto_default.png', 10.00, 'ACTIVO');
INSERT INTO `producto` VALUES (2, 'CEMENTO', 'PACASMAYO ROJO', 0.00, 1, 5, 'controller/producto/img/producto_default.png', 31.50, 'ACTIVO');
INSERT INTO `producto` VALUES (3, 'CEMENTO AZUL', 'PACASMAYO ', 10.00, 1, 1, 'controller/producto/img/PRO112202112943.png', 32.50, 'ACTIVO');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `proveedor_contacto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int(11) NULL DEFAULT NULL,
  `proveedor_razonsocial` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`) USING BTREE,
  INDEX `persona_id`(`persona_id`) USING BTREE,
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (2, '958514332', 'FERRETERIA DIAZ', 'ACTIVO', 8, 'AV. CHICLAYO Y CORNEJO');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_feregistro` date NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'ADMIN', 'ACTIVO', '2021-11-22');
INSERT INTO `rol` VALUES (3, 'VENDEDOR', 'ACTIVO', '2021-11-23');
INSERT INTO `rol` VALUES (4, 'JEFE DE ALMACEN', 'ACTIVO', '2021-12-09');

-- ----------------------------
-- Table structure for unidad_medida
-- ----------------------------
DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida`  (
  `unidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `unidad_abreviatura` char(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `unidad_fregistro` date NULL DEFAULT NULL,
  PRIMARY KEY (`unidad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unidad_medida
-- ----------------------------
INSERT INTO `unidad_medida` VALUES (1, 'Kilogramo', 'ACTIVO', 'kg', '2021-11-29');
INSERT INTO `unidad_medida` VALUES (2, 'Litro', 'ACTIVO', 'L', '2021-11-29');
INSERT INTO `unidad_medida` VALUES (3, 'Metro', 'ACTIVO', 'm', '2021-11-29');
INSERT INTO `unidad_medida` VALUES (4, 'Centimetro', 'ACTIVO', 'cm', '2021-11-29');
INSERT INTO `unidad_medida` VALUES (5, 'Entero', 'ACTIVO', 'E', '2021-11-29');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_intento` int(11) NOT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 0,
  `usuario_imagen` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`) USING BTREE,
  INDEX `FK_usuario_rol`(`rol_id`) USING BTREE,
  INDEX `persona_id`(`persona_id`) USING BTREE,
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'admin', '$2y$10$CEQ98B6dCF2kBdPJsfZBMuHhOsDFsHPfGlYA3pX.kA9tFztA/BsXu', 'admin@gmail.com', 1, 'ACTIVO', 1, 'controller/usuario/img/user_defecto.png', NULL);
INSERT INTO `usuario` VALUES (2, 'harvy', '$2y$10$BTIoLG2nLwAwQ55XLZL0aOZbmzuJLejoMOraWjRMJCPQvGZlFBOI6', 'harvy@gmail.com', 1, 'ACTIVO', 4, 'controller/usuario/img/IMG912202135643.png', 1);

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  `venta_tipocomprobante` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `venta_seriecomprobante` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `venta_numcomprobante` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `venta_fecha` date NULL DEFAULT NULL,
  `venta_impuesto` decimal(10, 2) NULL DEFAULT NULL,
  `venta_total` decimal(10, 2) NULL DEFAULT NULL,
  `venta_estatus` enum('PAGADA','ANULADA','REGISTRADA') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `venta_porcentaje` decimal(2, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`venta_id`) USING BTREE,
  INDEX `cliente_id`(`cliente_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venta
-- ----------------------------
INSERT INTO `venta` VALUES (7, 1, 1, 'BOLETA', '001', '001', '2021-12-08', 0.00, 30.00, 'ANULADA', 0.00);
INSERT INTO `venta` VALUES (8, 1, 1, 'BOLETA', '002', '002', '2021-12-08', 0.00, 30.00, 'ANULADA', 0.00);
INSERT INTO `venta` VALUES (9, 1, 1, 'BOLETA', '003', '003', '2021-12-08', 0.00, 30.00, 'ANULADA', 0.00);
INSERT INTO `venta` VALUES (10, 1, 1, 'BOLETA', '001', '001', '2021-12-09', 0.00, 30.00, 'REGISTRADA', 0.00);

-- ----------------------------
-- Procedure structure for SP_ACTUALIZAR_CONTRA_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_CONTRA_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_ACTUALIZAR_CONTRA_USUARIO`(IN ID INT, IN CONTRA VARCHAR
(250))
UPDATE usuario set
usuario_password=CONTRA
where usuario_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ACTUALIZAR_DATOS_PERSONA_PROFILE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_INGRESO`(IN IDINGRESO INT)
BEGIN
DECLARE CANTIDAD INT;
DECLARE IDPRODUCTO INT;
DECLARE SCTOCKACTUAL DECIMAL(10,2);
DECLARE DETALLEID INT;
UPDATE ingreso set 
ingreso_estatus='ANULADO'
where ingreso_id=IDINGRESO;
SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_ingreso 
where detalleingreso_estatus='INGRESADO' AND ingreso_id=IDINGRESO);
WHILE @CANTIDAD > 0 DO
SET @IDPRODUCTO:=(SELECT producto_id from detalle_ingreso 
where detalleingreso_estatus='INGRESADO' AND ingreso_id=IDINGRESO
LIMIT 1);

set @DETALLEID:=(SELECT detalleingreso_id from detalle_ingreso 
where detalleingreso_estatus='INGRESADO' AND ingreso_id=IDINGRESO LIMIT 1);

SET @STOCKACTUAL:=(SELECT producto_stock from producto 
where producto_id=@IDPRODUCTO);

UPDATE producto set
producto_stock=@STOCKACTUAL -(SELECT detalleingreso_cantidad from detalle_ingreso 
where detalleingreso_estatus='INGRESADO' AND ingreso_id=IDINGRESO LIMIT 1)
WHERE producto_id=@IDPRODUCTO;
UPDATE detalle_ingreso SET
detalleingreso_estatus='ANULADO' 
where detalleingreso_id=@DETALLEID;
SET @CANTIDAD:= @CANTIDAD-1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_VENTA`(IN IDVENTA INT)
BEGIN
DECLARE CANTIDAD INT;
DECLARE IDPRODUCTO INT;
DECLARE SCTOCKACTUAL DECIMAL(10,2);
DECLARE DETALLEID INT;
UPDATE venta set 
venta_estatus='ANULADA'
where venta_id=IDVENTA;
SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_venta
where detalleventa_estatus='INGRESADO' AND venta_id=IDVENTA);
WHILE @CANTIDAD > 0 DO
SET @IDPRODUCTO:=(SELECT producto_id from detalle_venta 
where detalleventa_estatus='INGRESADO' AND venta_id=IDVENTA
LIMIT 1);

set @DETALLEID:=(SELECT detalleventa_id from detalle_venta 
where detalleventa_estatus='INGRESADO' AND venta_id=IDVENTA LIMIT 1);

SET @STOCKACTUAL:=(SELECT producto_stock from producto 
where producto_id=@IDPRODUCTO);

UPDATE producto set
producto_stock=@STOCKACTUAL +(SELECT detalleventa_cantidad from detalle_venta 
where detalleventa_estatus='INGRESADO' AND venta_id=IDVENTA LIMIT 1)
WHERE producto_id=@IDPRODUCTO;
UPDATE detalle_venta SET
detalleventa_estatus='ANULADA' 
where detalleventa_id=@DETALLEID;
SET @CANTIDAD:= @CANTIDAD-1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_CATEGORIA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PERSONA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ROL`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_UNIDADMEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_UNIDADMEDIDA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre, 
	categoria.categoria_fregistro, 
	categoria.categoria_estatus
FROM
	categoria
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CLIENTE`;
delimiter ;;
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
		cliente.persona_id = persona.persona_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT categoria_id, categoria_nombre 
FROM categoria
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_CLIENTE`()
SELECT
	CONCAT_WS(' ',persona.persona_nombre, persona.persona_apepat, persona.persona_apemat) as cliente,
	persona.persona_nrodocumento, 
	cliente.cliente_id
FROM
	cliente
	INNER JOIN
	persona
	ON 
		cliente.persona_id = persona.persona_id
		WHERE cliente.cliente_estatus = 'ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT
	persona.persona_id, 
	CONCAT_WS(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apemat)
FROM
	persona
	WHERE persona_estatus = 'ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT producto_id, producto_nombre, producto_stock, producto_precioventa FROM producto 
where producto_estatus='ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT proveedor_id, proveedor_contacto FROM proveedor 
where proveedor_estatus='ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT rol_id, rol_nombre from rol where rol_estatus= 'ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_UNIDAD
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_UNIDAD`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_UNIDAD`()
SELECT unidad_id, unidad_nombre 
FROM unidad_medida
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO`;
delimiter ;;
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
where ingreso.ingreso_fecha BETWEEN INICIO AND FIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PERSONA`;
delimiter ;;
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
	persona
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO`;
delimiter ;;
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
		producto.categoria_id = categoria.categoria_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PROVEEDOR`;
delimiter ;;
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
		proveedor.persona_id = persona.persona_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ROL`()
SELECT
	rol.rol_id, 
	rol.rol_nombre, 
	rol.rol_estatus, 
	rol.rol_feregistro
FROM
	rol
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_UNIDADMEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_UNIDADMEDIDA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_UNIDADMEDIDA`()
SELECT
unidad_medida.unidad_id,
unidad_medida.unidad_nombre,
unidad_medida.unidad_fregistro,
unidad_medida.unidad_estatus,
unidad_medida.unidad_abreviatura
FROM
unidad_medida
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
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
		usuario.persona_id = persona.persona_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_VENTA`(IN INICIO DATE, IN FIN DATE)
SELECT
	usuario.usuario_nombre, 
	venta.venta_tipocomprobante, 
	venta.venta_seriecomprobante, 
	venta.venta_numcomprobante, 
	venta.venta_fecha, 
	venta.venta_impuesto, 
	venta.venta_total, 
	venta.venta_estatus, 
	venta.venta_id, 
	venta.cliente_id, 
	venta.usuario_id, 
	CONCAT_WS(' ',persona.persona_nombre, persona.persona_apepat, persona.persona_apemat) AS cliente
FROM
	venta
	INNER JOIN
	usuario
	ON 
		venta.usuario_id = usuario.usuario_id
	INNER JOIN
	cliente
	ON 
		venta.cliente_id = cliente.cliente_id
	INNER JOIN
	persona
	ON 
		cliente.persona_id = persona.persona_id 
		where venta.venta_fecha BETWEEN INICIO AND FIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_ESTATUS_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESTATUS_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_ESTATUS_CLIENTE`(IN IDCLIENTE INT, IN ESTATUS VARCHAR(10))
UPDATE cliente set
cliente_estatus=ESTATUS
WHERE cliente_id=IDCLIENTE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_ESTATUS_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESTATUS_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_ESTATUS_PROVEEDOR`(IN IDPROVEEDOR INT, IN ESTATUS VARCHAR(10))
UPDATE proveedor set
proveedor_estatus=ESTATUS
WHERE proveedor_id=IDPROVEEDOR
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PRODUCTO_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PRODUCTO_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PRODUCTO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
UPDATE producto set
producto_foto=FOTO
where producto_id=ID;
SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PROVEEDOR`(IN IDPROVEEDOR INT, IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(12))
UPDATE proveedor set
proveedor_razonsocial=RAZONSOCIAL,
proveedor_contacto=NOMCONTACTO,
proveedor_numcontacto=NUMCONTACTO
WHERE proveedor_id=IDPROVEEDOR
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
UPDATE usuario set
usuario_imagen=FOTO
where usuario_id=ID;
SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CATEGORIA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_INGRESO`(IN IDPROVEEDOR INT, IN IDUSUARIO INT,
IN TIPO VARCHAR(50), IN SERIE VARCHAR(20), IN NUM VARCHAR(20), IN TOTAL DECIMAL(10,2), IN IMPUESTO DECIMAL(10,2),
IN PORCENTAJE DECIMAL(2,2))
BEGIN 
INSERT INTO ingreso(proveedor_id,usuario_id,ingreso_tipcomprobante,ingreso_seriecomprobante,
ingreso_numcomprobante, ingreso_fecha, ingreso_total, ingreso_impuesto, ingreso_estatus, ingreso_porcentaje)
values(IDPROVEEDOR,IDUSUARIO,TIPO,SERIE,NUM,CURDATE(),TOTAL,IMPUESTO,'INGRESADO',PORCENTAJE);
SELECT LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_INGRESO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_INGRESO_DETALLE`(IN ID INT, IN PRODUCTO INT, 
IN CANTIDAD DECIMAL(10,2), IN PRECIO DECIMAL(10,2))
INSERT INTO detalle_ingreso(ingreso_id, producto_id, detalleingreso_cantidad,
detalleingreso_precio, detalleingreso_estatus)VALUES(ID,PRODUCTO,CANTIDAD,PRECIO, 'INGRESADO')
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PERSONA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN NOMBRE VARCHAR(100), IN APEPAT VARCHAR(50), IN APEMAT VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(11), IN TIPODOCUMENTO VARCHAR(12), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(12), IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(12))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ROL`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_UNIDADMEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_UNIDADMEDIDA`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_VENTA`(IN IDCLIENTE INT, IN IDUSUARIO INT,
IN TIPO VARCHAR(50), IN SERIE VARCHAR(20), IN NUM VARCHAR(20), IN TOTAL DECIMAL(10,2), IN IMPUESTO DECIMAL(10,2),
IN PORCENTAJE DECIMAL(2,2))
BEGIN 
INSERT INTO venta(cliente_id,usuario_id,venta_tipocomprobante,venta_seriecomprobante,
venta_numcomprobante, venta_fecha, venta_total, venta_impuesto, venta_estatus, venta_porcentaje)
values(IDCLIENTE,IDUSUARIO,TIPO,SERIE,NUM,CURDATE(),TOTAL,IMPUESTO,'REGISTRADA',PORCENTAJE);
SELECT LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_VENTA_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VENTA_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_VENTA_DETALLE`(IN ID INT, IN PRODUCTO INT, 
IN CANTIDAD DECIMAL(10,2), IN PRECIO DECIMAL(10,2))
INSERT INTO detalle_venta(venta_id, producto_id, detalleventa_cantidad,
detalleventa_precio, detalleventa_estatus)VALUES(ID,PRODUCTO,CANTIDAD,PRECIO, 'INGRESADO')
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_GRAFICO_INGRESO_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_GRAFICO_INGRESO_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_DATOS_GRAFICO_INGRESO_WIDGET`(IN INICIO DATE, IN FIN DATE)
SELECT 
producto.producto_nombre,
sum(detalle_ingreso.detalleingreso_cantidad) as cantidad
FROM 
detalle_ingreso
INNER JOIN 
producto 
ON
detalle_ingreso.producto_id = producto.producto_id
INNER JOIN 
ingreso
ON
detalle_ingreso.ingreso_id = ingreso.ingreso_id
where ingreso_fecha BETWEEN INICIO AND FIN 
GROUP BY detalle_ingreso.producto_id ORDER BY cantidad DESC LIMIT 5
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_GRAFICO_VENTA_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_GRAFICO_VENTA_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_DATOS_GRAFICO_VENTA_WIDGET`(IN INICIO DATE, IN FIN DATE)
SELECT 
producto.producto_nombre,
sum(detalle_venta.detalleventa_cantidad) as cantidad
FROM
detalle_venta 
INNER JOIN 
producto 
ON 
detalle_venta.producto_id = producto.producto_id
INNER JOIN 
venta 
ON
detalle_venta.venta_id = venta.venta_id
where venta.venta_fecha BETWEEN INICIO AND FIN 
GROUP BY detalle_venta.producto_id ORDER BY cantidad DESC LIMIT 5
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_USUARIO`;
delimiter ;;
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
	where usuario_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_DATOS_WIDGET`(IN INICIO DATE, IN FIN DATE)
SELECT
IFNULL(sum(venta.venta_total),0),
(SELECT IFNULL(sum(ingreso.ingreso_total),0) from ingreso where ingreso_fecha BETWEEN INICIO AND FIN),
(SELECT COUNT(*) from venta where venta_fecha BETWEEN INICIO AND FIN),
(SELECT COUNT(*) from ingreso where ingreso_fecha BETWEEN INICIO AND FIN)
FROM 
venta 
where venta.venta_fecha BETWEEN INICIO AND FIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO VARCHAR(15))
SELECT * FROM usuario WHERE usuario_nombre=USUARIO
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_ingreso
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_ACTUALIZAR_STOCK_INGRESO`;
delimiter ;;
CREATE TRIGGER `TR_ACTUALIZAR_STOCK_INGRESO` BEFORE INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN 
DECLARE STOCKACTUAL DECIMAL(10,2);
SET @STOCKACTUAL:=(SELECT producto_stock from producto where producto_id=new.producto_id);
UPDATE producto set 
producto_stock=@STOCKACTUAL+new.detalleingreso_cantidad
where  producto_id=new.producto_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_venta
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_ACTUALIZAR_STOCK`;
delimiter ;;
CREATE TRIGGER `TR_ACTUALIZAR_STOCK` BEFORE INSERT ON `detalle_venta` FOR EACH ROW BEGIN 
DECLARE STOCKACTUAL DECIMAL(10,2);
SET @STOCKACTUAL:=(SELECT producto_stock from producto where producto_id=new.producto_id);
UPDATE producto set
producto_stock=@STOCKACTUAL-new.detalleventa_cantidad
where producto_id=new.producto_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
