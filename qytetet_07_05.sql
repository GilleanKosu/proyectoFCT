-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2019 a las 12:12:41
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qytetet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE `carta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `efecto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carta`
--

INSERT INTO `carta` (`id`, `nombre`, `efecto`, `usuario_id`) VALUES
(0, 'PagarCobrar', 'Suma 500 al jugador', NULL),
(1, 'PagarCobrar', 'Suma 1000 al jugador', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta_partida`
--

CREATE TABLE `carta_partida` (
  `carta_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casillas`
--

CREATE TABLE `casillas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casillas`
--

INSERT INTO `casillas` (`id`, `nombre`, `tipo`) VALUES
(1, 'inicio', 'Salida'),
(2, 'fuencarral', 'Sorpresa'),
(3, 'alberto_aguilera', 'Sorpresa'),
(4, 'suerte1', 'Sorpresa'),
(5, 'glorieta_bilbao', 'Sorpresa'),
(6, 'injail', 'Sorpresa'),
(7, 'calle_bailen', 'Sorpresa'),
(8, 'plaza_españa', 'Calle'),
(9, 'puerta_del_sol', 'Calle'),
(10, 'impuesto', 'Impuesto'),
(11, 'parking', 'Parking'),
(12, 'suerte2', 'Sorpresa'),
(13, 'gran_via', 'Calle'),
(14, 'paseo_de_la_castellana', 'Calle'),
(15, 'paseo_del_prado', 'Calle'),
(16, 've_carcel', 'Juez'),
(17, 'reyes_catolicos', 'Calle'),
(18, 'cea_bermudez', 'Calle'),
(19, 'maria_molina', 'Calle'),
(20, 'avenida_america', 'Calle');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casillas_partida`
--

CREATE TABLE `casillas_partida` (
  `casillas_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dado`
--

CREATE TABLE `dado` (
  `id` int(11) NOT NULL,
  `caras` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dado`
--

INSERT INTO `dado` (`id`, `caras`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `nombre_remitente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_remitente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensaje_remitente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190408164833', '2019-04-09 14:55:11'),
('20190420151546', '2019-04-23 13:49:26'),
('20190425211502', '2019-04-25 21:15:38'),
('20190425211902', '2019-04-25 21:19:30'),
('20190426105948', '2019-04-26 11:04:35'),
('20190429075252', '2019-04-29 07:57:30'),
('20190501171358', '2019-05-02 09:07:44'),
('20190502092852', '2019-05-02 09:30:25'),
('20190502101952', '2019-05-02 10:20:48'),
('20190502103450', '2019-05-02 10:37:34'),
('20190503074924', '2019-05-03 07:51:13'),
('20190507100906', '2019-05-07 10:10:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `id` int(11) NOT NULL,
  `dado_id` int(11) DEFAULT NULL,
  `ganador` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_turnos` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida_user`
--

CREATE TABLE `partida_user` (
  `partida_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo_propiedad`
--

CREATE TABLE `titulo_propiedad` (
  `id` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `casilla_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `titulo_propiedad`
--

INSERT INTO `titulo_propiedad` (`id`, `precio_compra`, `nombre`, `casilla_id`, `usuario_id`) VALUES
(1, 3200, 'Prado', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casillas_id` int(11) DEFAULT NULL,
  `saldo_partida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nickname`, `casillas_id`, `saldo_partida`) VALUES
(1, 'cosa@gmail.com', '[]', 'c4ca4238a0b923820dcc509a6f75849b', '', NULL, NULL),
(2, 'cosa2@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'azul', 2, 7500),
(3, 'cosa3@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'rojo', 4, 7500),
(4, 'cosa4@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'platinum', 1, NULL),
(5, 'cosa5@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'esmerald', NULL, NULL),
(6, 'aadf@gmail.com', '[]', '1', 'juanpepe', NULL, NULL),
(8, 'asdfasdf', '', '1', 'hola', NULL, NULL),
(10, 'a1b2c3@gmail.com', '[]', '1', '1111111111', NULL, NULL),
(12, 'aadf12123@gmail.com', '[]', '1', 'adsf', NULL, NULL),
(13, 'aadfmnb@gmail.com', '[]', '1', 'holaadsf', NULL, NULL),
(14, 'aadfmnbasd@gmail.com', '[]', '1', 'holaadsf', NULL, NULL),
(15, '111@gmail.com', '[]', '1', '1212', NULL, NULL),
(16, 'blabla@gmail.com', '[]', '1', 'blabla', NULL, NULL),
(17, 'blabla1@gmail.com', '[]', '1', 'blabla1', NULL, NULL),
(18, 'aadf1sd23@gmail.com', '[]', '1', 'josepedro', NULL, NULL),
(19, 'md5@gmail.com', '[]', 'c4ca4238a0b923820dcc509a6f75849b', 'md5', 2, 7500);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BDB93BE4DB38439E` (`usuario_id`);

--
-- Indices de la tabla `carta_partida`
--
ALTER TABLE `carta_partida`
  ADD PRIMARY KEY (`carta_id`,`partida_id`),
  ADD KEY `IDX_A5E5ED5A46A559E1` (`carta_id`),
  ADD KEY `IDX_A5E5ED5AF15A1987` (`partida_id`);

--
-- Indices de la tabla `casillas`
--
ALTER TABLE `casillas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `casillas_partida`
--
ALTER TABLE `casillas_partida`
  ADD PRIMARY KEY (`casillas_id`,`partida_id`),
  ADD KEY `IDX_20A97933EDE6CE06` (`casillas_id`),
  ADD KEY `IDX_20A97933F15A1987` (`partida_id`);

--
-- Indices de la tabla `dado`
--
ALTER TABLE `dado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A9C1580CB7CA418D` (`dado_id`);

--
-- Indices de la tabla `partida_user`
--
ALTER TABLE `partida_user`
  ADD PRIMARY KEY (`partida_id`,`user_id`),
  ADD KEY `IDX_F45797C9F15A1987` (`partida_id`),
  ADD KEY `IDX_F45797C9A76ED395` (`user_id`);

--
-- Indices de la tabla `titulo_propiedad`
--
ALTER TABLE `titulo_propiedad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A8E4619F97DD048E` (`casilla_id`),
  ADD KEY `IDX_A8E4619FDB38439E` (`usuario_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D649EDE6CE06` (`casillas_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carta`
--
ALTER TABLE `carta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `casillas`
--
ALTER TABLE `casillas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `dado`
--
ALTER TABLE `dado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9976328;

--
-- AUTO_INCREMENT de la tabla `titulo_propiedad`
--
ALTER TABLE `titulo_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carta`
--
ALTER TABLE `carta`
  ADD CONSTRAINT `FK_BDB93BE4DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `carta_partida`
--
ALTER TABLE `carta_partida`
  ADD CONSTRAINT `FK_A5E5ED5A46A559E1` FOREIGN KEY (`carta_id`) REFERENCES `carta` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A5E5ED5AF15A1987` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `casillas_partida`
--
ALTER TABLE `casillas_partida`
  ADD CONSTRAINT `FK_20A97933EDE6CE06` FOREIGN KEY (`casillas_id`) REFERENCES `casillas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_20A97933F15A1987` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `FK_A9C1580CB7CA418D` FOREIGN KEY (`dado_id`) REFERENCES `dado` (`id`);

--
-- Filtros para la tabla `partida_user`
--
ALTER TABLE `partida_user`
  ADD CONSTRAINT `FK_F45797C9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F45797C9F15A1987` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `titulo_propiedad`
--
ALTER TABLE `titulo_propiedad`
  ADD CONSTRAINT `FK_A8E4619F97DD048E` FOREIGN KEY (`casilla_id`) REFERENCES `casillas` (`id`),
  ADD CONSTRAINT `FK_A8E4619FDB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649EDE6CE06` FOREIGN KEY (`casillas_id`) REFERENCES `casillas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
