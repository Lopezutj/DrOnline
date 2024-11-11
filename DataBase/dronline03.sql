-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2024 a las 04:08:31
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
-- Base de datos: `dronline03`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha_cita` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `estado` enum('pendiente','completada','cancelada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `numero_colegiado` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `id_usuario`, `especialidad`, `numero_colegiado`, `telefono`) VALUES
(1, 1, 'Nefrologia', '2022094', '3325074976'),
(2, 18, 'Cardiologia', '20231004', '33121212121');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `id_usuario`, `fecha_nacimiento`, `sexo`, `direccion`, `telefono`, `id_medico`) VALUES
(13, 15, '1996-10-01', 'M', 'Por camino antigua a tesistan ', '33121212121', 1),
(15, 17, '1990-01-01', 'M', 'Calle Falsa 123', '555-1234', 1),
(16, 19, '1994-01-12', '', 'Santa Luz ', '3336336970', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_medicos`
--

CREATE TABLE `registros_medicos` (
  `id_registro` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL,
  `tipo_registro` enum('consulta','examen','diagnostico') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id_tratamiento` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('activo','completado','cancelado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `tipo_usuario` enum('medico','paciente') DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `contraseña`, `tipo_usuario`, `fecha_creacion`, `ultima_actualizacion`) VALUES
(1, 'Roberto Murillo Sanchez', 'rob.mursan@icloud.com', '$2y$10$VaJwsC5EXJ7zsiVXlOyKxem8zQTC23yqhbp3ezWEDgAa25lTtdslG', 'medico', '2024-11-05 22:11:11', '2024-11-05 22:11:11'),
(3, 'Hector Cardenas ', 'hector@gmail.com', '$2y$10$U1b4wncZpHe00dX94/8a6OGGBD2bqptTa6pyLRjYy3W5VkYMpm4Om', 'paciente', '2024-11-05 22:48:50', '2024-11-05 22:48:50'),
(4, 'Eduardo Torres ', 'eduardoTorres@gmail.com', '$2y$10$p734uEJvUxBBf9XXMdo0s.zjY7.q0XEs/Oxhz08RJpmt.dz7LQ8Fq', 'paciente', '2024-11-05 22:55:41', '2024-11-05 22:55:41'),
(5, 'Eduardo Torres ', 'e@k', '$2y$10$f4QlFkidADgrs/eiwvXddudczgNmAWBPqzu7UiyPWOJS6Y8dGxRgq', 'paciente', '2024-11-05 23:20:10', '2024-11-05 23:20:10'),
(6, 'Fernando Cano ', 'cano@gmail.com', '$2y$10$TJuX3WrOK7R5cZyDEoKjiudiymmfU8CGAgIsmu4P.4Ywvup6Vi1iK', 'paciente', '2024-11-05 23:30:19', '2024-11-05 23:30:19'),
(7, 'Fernando Cano ', 'cano@gmail.com', '$2y$10$0W9gx9CBB77vonF5Ec33.uuprTn87COhm3prrAldI48p0XtrmCRjq', 'paciente', '2024-11-05 23:34:53', '2024-11-05 23:34:53'),
(8, 'Jetzael Quevdo ', 'jetzael@gmail.com', '$2y$10$EQWOyx/7quKjpHHz8ldmpeG5q2r9MKav4VyXlfjqg2uBEcyo.mAVq', 'paciente', '2024-11-05 23:37:27', '2024-11-05 23:37:27'),
(9, 'Jetzael Quevdo ', 'jetzael@gmail.com.mx', '$2y$10$r4ZnqvKBmfpSiVbQBSeL0edhI8rIO.hSVLgJP.x2Aa4kx3fJkrirm', 'paciente', '2024-11-05 23:40:40', '2024-11-05 23:40:40'),
(10, 'Hector Cardenas ', 'hector@gmail.com', '$2y$10$luQJb6uvKhQ2wmHYF7POmOp0zKlxJ/shUdmnA0iwkAM1O3sRojeKG', 'paciente', '2024-11-05 23:53:28', '2024-11-05 23:53:28'),
(11, 'Brisa Paola ', 'brisa@gmail.com', '$2y$10$cNU/g9mjSDh6wOR4UuxxHePdCXTIVzieUcrADx26uOZ4uXj3qmiXK', 'paciente', '2024-11-06 00:14:56', '2024-11-06 00:14:56'),
(12, 'Efrain espinosa ', 'efrain@gmail.com', '$2y$10$jPHYjNkBy.27es34r7XBZOo7Z9LzG4UqbItrjWkbOm6WHKD9iTGkC', 'paciente', '2024-11-06 00:16:05', '2024-11-06 00:16:05'),
(13, 'Efrain espinosa ', 'efrain@gmail.com', '$2y$10$kPlQRfizMGloxYGP24s1ZOyhPU6gILDeUzg/RiyU91FsooAA.Y8Ku', 'paciente', '2024-11-06 00:21:22', '2024-11-06 00:21:22'),
(14, 'Efrain espinosa ', 'efrain@gmail.com', '$2y$10$COTFsQwsgPp8vUT8YjQWUuhDaUJDQVk8vfnJMKRM5Rw3skPeIzUaC', 'paciente', '2024-11-06 00:23:08', '2024-11-06 00:23:08'),
(15, 'Luis Uribe', 'uribe@gmail.com', '$2y$10$78WEbDfHMRbDcGjwC4j9UeXzoNTG7QkayUjyBpadLLWC5HSNu4TnO', 'paciente', '2024-11-07 19:22:04', '2024-11-07 19:22:04'),
(16, 'Roberto Murillo Sanchez', 'omarlopez@gmail.com', '$2y$10$RmpP9mvX6tdUkYa2HyOt7u9RF7H6dJWt7xsOeHdNoLalUyIdoBV32', 'paciente', '2024-11-07 20:22:58', '2024-11-07 20:22:58'),
(17, 'Juan Pérez', 'juan.perez@example.com', '$2y$10$PyQ6eOcLroTRGsCo6.t6QulFV3.hoXKuGWIUAoNdQuHA/hqINylOi', 'paciente', '2024-11-11 01:14:23', '2024-11-11 01:14:23'),
(18, 'Rob', 'rober_mostwanted@hotmail.com', '$2y$10$4qO/2rs66lADqpkTkX4fOeKMj5aw/u62FtvJ0HtDL7H82SEEN6g4W', 'medico', '2024-11-11 02:00:24', '2024-11-11 02:00:24'),
(19, 'Brian ', 'brian@gmail.com', '$2y$10$tHiHhWIPxPjXkK3BfmaCyegl.DKFNUvCsFMdirBX9l/QT9HH8Znte', 'paciente', '2024-11-11 02:07:07', '2024-11-11 02:07:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `fk_pacientes_medico` (`id_medico`);

--
-- Indices de la tabla `registros_medicos`
--
ALTER TABLE `registros_medicos`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `registros_medicos`
--
ALTER TABLE `registros_medicos`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_pacientes_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `registros_medicos`
--
ALTER TABLE `registros_medicos`
  ADD CONSTRAINT `registros_medicos_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `registros_medicos_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `tratamientos_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
