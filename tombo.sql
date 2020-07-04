-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2020 a las 05:15:12
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tombo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `idCategoria_producto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`idCategoria_producto`, `nombre`) VALUES
(1, 'abarrotes'),
(2, 'piqueos'),
(3, 'bebidas'),
(4, 'confiteria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `idCategoria_producto` int(11) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `capacidad` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precio_unitario`, `stock`, `idCategoria_producto`, `marca`, `capacidad`) VALUES
(1, 'Gaseosa INCA KOLA', 'Gaseosa INCA KOLA Botella 1L', 4.3, 20, 3, 'INCA KOLA', '1L'),
(2, 'Agua sin Gas CIELO', 'Agua sin Gas CIELO Botella 2.5L', 2.5, 24, 3, 'CIELO', '2.5L'),
(3, 'Papas PRINGLES Sabor Original', 'Papas PRINGLES Sabor Original Lata 124g', 7.9, 24, 2, 'PRINGLES', '124g'),
(4, 'GASEOSA COCA COLA', 'Gaseosa COCA COLA Botella 1L', 4.3, 12, 3, 'COCA COLA', '1L'),
(5, 'Vodka SMIRNOFF Red Botetla', 'Vodka SMIRNOFF Red Botetla 700ml', 23.9, 12, 3, 'SMIRNOFF', '700ml');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_ventas`
--

CREATE TABLE `producto_has_ventas` (
  `Producto_idProducto` int(11) NOT NULL,
  `Ventas_idVentas` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVentas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`idCategoria_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria_producto` (`idCategoria_producto`);

--
-- Indices de la tabla `producto_has_ventas`
--
ALTER TABLE `producto_has_ventas`
  ADD PRIMARY KEY (`Producto_idProducto`,`Ventas_idVentas`),
  ADD KEY `fk_Producto_has_Ventas_Ventas1_idx` (`Ventas_idVentas`),
  ADD KEY `fk_Producto_has_Ventas_Producto_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVentas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `idCategoria_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria_producto`) REFERENCES `categoria_producto` (`idCategoria_producto`);

--
-- Filtros para la tabla `producto_has_ventas`
--
ALTER TABLE `producto_has_ventas`
  ADD CONSTRAINT `fk_Producto_has_Ventas_Producto` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Ventas_Ventas1` FOREIGN KEY (`Ventas_idVentas`) REFERENCES `ventas` (`idVentas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
