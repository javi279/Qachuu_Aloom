-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2024 a las 04:00:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_qa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_limite` date DEFAULT NULL,
  `block_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `alumn_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `nombre`, `descripcion`, `fecha_limite`, `block_id`, `is_active`, `fecha_creacion`, `alumn_id`, `team_id`) VALUES
(25, 'Fumigación', 'Fumigar milpa a las 2 semanas', '2024-10-31', 15, 1, '2024-10-30 22:24:18', NULL, NULL),
(26, 'Chapeo', 'Hay que chambear :3', '2024-11-10', 15, 1, '2024-10-31 00:57:40', NULL, NULL),
(27, 'Taller con madres guias', 'Replica de recetas nutritivas', '2025-01-08', 17, 1, '2024-11-07 22:34:02', NULL, NULL),
(33, 'formacion politica', 'taller con jovenes \r\ntaller con madres guias \r\ntaller con socios', '2025-05-14', 18, 1, '2024-11-07 23:00:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_detalle`
--

CREATE TABLE `actividad_detalle` (
  `id_actividad` int(11) NOT NULL,
  `id_beneficiario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad_detalle`
--

INSERT INTO `actividad_detalle` (`id_actividad`, `id_beneficiario`) VALUES
(25, 42),
(25, 43),
(26, 42),
(27, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumn`
--

CREATE TABLE `alumn` (
  `id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone` varchar(60) NOT NULL,
  `DPI` varchar(13) NOT NULL,
  `Ocupacion` varchar(255) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Hijos` int(11) NOT NULL,
  `Genero` enum('Masculino','Femenino') NOT NULL,
  `Funcion` enum('Socio','Participante','Guia') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `alumn`
--

INSERT INTO `alumn` (`id`, `image`, `name`, `lastname`, `address`, `phone`, `DPI`, `Ocupacion`, `Edad`, `Hijos`, `Genero`, `Funcion`, `is_active`, `created_at`, `user_id`) VALUES
(42, '1730326941.jpg', 'CHRISTOPER', 'LUNA', 'RABINAL', '21211212', '12121212121', 'Agricultor', 34, 3, 'Masculino', 'Socio', 1, '0000-00-00 00:00:00', 1),
(43, '1731460452.jpg', 'JAVIER', 'ALEJANDRO', 'SU CASA :3', '21211212', '121', 'Agricultor', 24, 2, 'Masculino', 'Participante', 1, '0000-00-00 00:00:00', 1),
(44, '1730352847.jpg', 'CAMILIOOOO', 'JAVIER', 'GUATEMALA', '23123123123', '1702432141503', 'Profesor', 23, 3, 'Masculino', 'Socio', 1, '0000-00-00 00:00:00', 1),
(45, '1731018383.png', 'CANDELARIA', 'PIOX', 'PICHEC', '12345678', '1234567891234', 'Estudiante', 20, 3, 'Femenino', 'Socio', 1, '0000-00-00 00:00:00', 1),
(46, '', 'MAXIMILIANA', 'LAJUJ', 'NIMACABAJ', '9/58784', '2589632587425', 'ama de casa', 40, 2, 'Femenino', 'Socio', 1, '0000-00-00 00:00:00', 1),
(47, '1731458847.png', 'ALEJANDRA', 'GONZALEZ', 'CALLE LOS NARANJOS', '547821', '2121212121212', 'Mestra', 21, 2, 'Femenino', 'Socio', 1, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumn_team`
--

CREATE TABLE `alumn_team` (
  `id` int(11) NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `alumn_team`
--

INSERT INTO `alumn_team` (`id`, `alumn_id`, `team_id`) VALUES
(1, 42, 1),
(2, 43, 1),
(3, 44, 5),
(4, 45, 1),
(5, 46, 13),
(6, 47, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assistance`
--

CREATE TABLE `assistance` (
  `id` int(11) NOT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `date_at` date NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behavior`
--

CREATE TABLE `behavior` (
  `id` int(11) NOT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `date_at` date NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `block`
--

CREATE TABLE `block` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_alerta` date DEFAULT NULL,
  `estado_alerta` varchar(50) DEFAULT 'Pendiente',
  `responsable` varchar(100) DEFAULT NULL,
  `contribucion_proyecto` varchar(255) DEFAULT NULL,
  `archivo_pdf` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `block`
--

INSERT INTO `block` (`id`, `name`, `team_id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `fecha_alerta`, `estado_alerta`, `responsable`, `contribucion_proyecto`, `archivo_pdf`, `is_active`) VALUES
(15, 'SIEMBRA DE MAIZ', 1, 'PRODUCCION DE SEMILLA EN COMUNIDAD', '2024-01-01', '2024-12-31', '2024-11-15', 'Vigente', 'VICTORIA', 'SEMILLA DE MAIZ', '1731456915.pdf', 1),
(16, 'SDASDASDASD', 1, 'JSIDOIASDSADSAD', '2024-11-03', '2024-10-25', '2024-10-27', 'Enviado', 'YO', 'DASDASDASDASD', '1730329272.pdf', 1),
(17, 'ICF', 1, 'Sobre la contribución de salud y nutrición', '2025-01-01', '2026-01-01', '2025-01-01', 'Pendiente', 'Rubi', 'Autosostenibilidad de la comunidad', '1731018715.pdf', 1),
(18, 'BIZKAIA', 13, 'reflexion y nutricion', '2025-01-01', '2024-11-15', '2025-09-16', 'Pendiente', 'candelaria piox', 'formacion de mujereres liderezas', '1731020205.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calification`
--

CREATE TABLE `calification` (
  `id` int(11) NOT NULL,
  `val` double DEFAULT NULL,
  `alumn_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `calification`
--

INSERT INTO `calification` (`id`, `val`, `alumn_id`, `block_id`, `is_active`) VALUES
(31, 0, 42, 15, 0),
(33, 0, 42, 16, 0),
(37, 0, 43, 15, 0),
(39, 1, 45, 17, 0),
(41, 1, 45, 15, 0),
(46, 0, 47, 15, 0),
(56, 1, 47, 16, 0),
(63, 0, 43, 16, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Grupos'),
(3, 'Acceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `idproyecto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `archivo_pdf` varchar(255) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

CREATE TABLE `team` (
  `idgrupo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `favorito` tinyint(1) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `team`
--

INSERT INTO `team` (`idgrupo`, `nombre`, `favorito`, `idusuario`) VALUES
(1, 'ALDEA 7', 1, 1),
(2, 'ALDEA 6', 1, 1),
(3, 'ALDEA 5', 1, 1),
(4, 'ALDEA 4', 1, 1),
(5, 'ALDEA 3', 1, 1),
(6, 'ALDEA 2', 1, 1),
(10, 'ALDEA 1', 0, 1),
(11, 'GRUPO PRUEBA', 0, 3),
(12, 'PROYECTO 1', 0, 4),
(13, 'NIMACABAJ', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'Javier', 'DNI', '72154871', 'Calle los alpes 210', '547821', 'admin@gmail.com', 'Administrador', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1535417472.jpg', 1),
(3, 'Javi', 'DNI', '72154871', 'SAN JERONIMO', '00000000', 'xyz@gmail.com', 'Administrador', 'javi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1728441533.png', 1),
(4, 'Kevin', 'DNI', '72154871', 'CALLE LOS ALPES 210', '0000 0000', 'xyz@gmail.com', 'Administrador', 'kevin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '1728448996.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(20, 3, 1),
(21, 3, 2),
(22, 3, 3),
(34, 4, 1),
(35, 4, 2),
(36, 4, 3),
(37, 1, 1),
(38, 1, 2),
(39, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `block_id` (`block_id`);

--
-- Indices de la tabla `actividad_detalle`
--
ALTER TABLE `actividad_detalle`
  ADD PRIMARY KEY (`id_actividad`,`id_beneficiario`),
  ADD KEY `id_beneficiario` (`id_beneficiario`);

--
-- Indices de la tabla `alumn`
--
ALTER TABLE `alumn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `calification`
--
ALTER TABLE `calification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`idproyecto`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `team_ibfk_1` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `alumn`
--
ALTER TABLE `alumn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `assistance`
--
ALTER TABLE `assistance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `calification`
--
ALTER TABLE `calification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `team`
--
ALTER TABLE `team`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`);

--
-- Filtros para la tabla `actividad_detalle`
--
ALTER TABLE `actividad_detalle`
  ADD CONSTRAINT `actividad_detalle_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  ADD CONSTRAINT `actividad_detalle_ibfk_2` FOREIGN KEY (`id_beneficiario`) REFERENCES `alumn` (`id`);

--
-- Filtros para la tabla `alumn`
--
ALTER TABLE `alumn`
  ADD CONSTRAINT `alumn_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  ADD CONSTRAINT `alumn_team_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `alumn_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD CONSTRAINT `assistance_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `assistance_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `block_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `calification`
--
ALTER TABLE `calification`
  ADD CONSTRAINT `calification_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `calification_ibfk_2` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`);

--
-- Filtros para la tabla `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
