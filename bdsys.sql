-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2021 a las 08:54:52
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`, `ESTADO`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'EMPLEADO', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(30) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`, `estado`) VALUES
(1, 'Bebidas', b'1'),
(2, 'Lácteos', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `FECHANACIMIENTO` varchar(10) DEFAULT NULL,
  `TIPODOCUMENTO` varchar(10) DEFAULT NULL,
  `NUMERODOCUMENTO` varchar(15) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IDEMPLEADO`, `NOMBRE`, `APELLIDOS`, `TELEFONO`, `FECHANACIMIENTO`, `TIPODOCUMENTO`, `NUMERODOCUMENTO`, `IDUSUARIO`) VALUES
(4, 'Alexander', 'Fuentes Medina', '917967148', '1999-12-19', 'D', '78019778', 1),
(5, 'Stephano', 'Sanchez Medina', '963987456', '1999-10-09', 'D', '45987456', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(30) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nombreMarca`, `estado`) VALUES
(1, 'Coca Cola', b'1'),
(2, 'Gloria', b'1'),
(3, 'Aje', b'1'),
(4, 'Molitalia', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL DEFAULT 'No existe información del producto',
  `precio` decimal(8,2) NOT NULL,
  `cantidad` smallint(6) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcion`, `precio`, `cantidad`, `idCategoria`, `idMarca`, `idProveedor`) VALUES
(1, 'Gaseosa coca cola', '200 ML CON AZÚCAR', '2.00', 100, 1, 1, 1),
(2, 'Leche gloria', 'Caja de 500 ML', '6.70', 200, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` char(9) NOT NULL,
  `ruc` char(11) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombre`, `direccion`, `telefono`, `ruc`, `estado`) VALUES
(1, 'Grupo Coca Cola', 'AV. REPÚBLICA DE PANAMÁ URB. LIMATAMBO 4050 SURQUILLO - LIMA - LIMA', '014114200', '20415932376', b'1'),
(2, 'Grupo Gloria', 'Av. República de Panamá 2461, Santa Catalina, Lima 13, Perú', '014707170', '20100190797', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(20) DEFAULT NULL,
  `CLAVE` varchar(10) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`) VALUES
(1, 'Alexander', 'admin', b'1', 1),
(2, 'Adriana', '123', b'1', 2),
(3, 'Jorge', 'admin', b'1', 1),
(8, 'Andres', 'jujujj', b'1', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `FK_EMPLEADO_USU` (`IDUSUARIO`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `FK_PRODUCTO_CATEGORIA` (`idCategoria`),
  ADD KEY `FK_PRODUCTO_MARCA` (`idMarca`),
  ADD KEY `FK_PRODUCTO_PROVEEDORES` (`idProveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_USUARIO_CARGO` (`IDCARGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IDEMPLEADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USU` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_PRODUCTO_CATEGORIA` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `FK_PRODUCTO_MARCA` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  ADD CONSTRAINT `FK_PRODUCTO_PROVEEDORES` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_CARGO` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`IDCARGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
