-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2023 a las 07:55:23
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `saborusm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones_usuario`
--

CREATE TABLE `calificaciones_usuario` (
  `id_calificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha_calificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones_usuario`
--

INSERT INTO `calificaciones_usuario` (`id_calificacion`, `id_usuario`, `id_receta`, `calificacion`, `fecha_calificacion`) VALUES
(1, 5, 8, 3, '2023-11-05 06:45:32'),
(2, 4, 8, 5, '2023-11-05 06:51:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo_platillo` varchar(225) NOT NULL,
  `etiquetas` varchar(255) NOT NULL,
  `calificacion` float NOT NULL,
  `V_Calificado` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `ingredientes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `nombre`, `tipo_platillo`, `etiquetas`, `calificacion`, `V_Calificado`, `imagen`, `ingredientes`) VALUES
(8, 'fideos finales', 'final', 'sadjaslk', 4, 2, '1699165532_fideos_con_carne_y_salsa_de_tomate_con_monte_43363_600_square.jpg', 'fideos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `fecha_nac`, `correo`, `password`) VALUES
(4, 'tomas', '1999-12-16', 'a@gmail.com', '$2y$10$924btvhKofEY/dDs1i4ZZumweSjsMwuhO7a.Aq055LH1ds.pGldCK'),
(5, 'fideos', '1999-06-16', 'd@gmail.com', '$2y$10$BfwanX/mgUhKnD2W/SdNDu/jbJVefIwMUFziZXjnx464VghnSlmeu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones_usuario`
--
ALTER TABLE `calificaciones_usuario`
  ADD PRIMARY KEY (`id_calificacion`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_receta`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones_usuario`
--
ALTER TABLE `calificaciones_usuario`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
