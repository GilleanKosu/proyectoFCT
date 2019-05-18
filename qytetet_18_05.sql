-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2019 a las 23:44:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

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
(1, 'Carta1', 'Te desplazas a la casilla de inicio', NULL),
(2, 'Carta2', 'Vas a la cárcel', NULL),
(3, 'Carta3', 'Recibes 1500 euros', NULL),
(4, 'Carta4', 'Le pagas a la banca 1500 euros', NULL),
(5, 'Carta5', 'El jugador recibe 500 euros de cada jugador', NULL),
(6, 'Carta6', 'El jugador paga 500 euros de cada jugador', NULL);

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
(1, 'inicio', 'inicio'),
(2, 'fuencarral', 'calle'),
(3, 'alberto_aguilera', 'calle'),
(4, 'suerte1', 'sorpresa'),
(5, 'glorieta_bilbao', 'calle'),
(6, 'injail', 'carcel'),
(7, 'calle_bailen', 'calle'),
(8, 'plaza_españa', 'calle'),
(9, 'puerta_del_sol', 'calle'),
(10, 'impuesto', 'impuesto'),
(11, 'parking', 'parking'),
(12, 'suerte2', 'sorpresa'),
(13, 'gran_via', 'calle'),
(14, 'paseo_de_la_castellana', 'calle'),
(15, 'paseo_del_prado', 'calle'),
(16, 've_carcel', 'irCarcel'),
(17, 'reyes_catolicos', 'calle'),
(18, 'cea_bermudez', 'calle'),
(19, 'maria_molina', 'calle'),
(20, 'avenida_america', 'calle');

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
(1, 1);

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
('20190503074924', '2019-05-03 14:07:17'),
('20190507100906', '2019-05-08 17:27:00');

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
(1, 3200, 'Fuencarral', 2, NULL),
(2, 3200, 'Alberto Aguilera', 3, NULL),
(3, 3200, 'Glorieta Bilbao', 5, NULL),
(4, 3200, 'Calle Bailen', 7, NULL),
(5, 3200, 'Plaza España', 8, NULL),
(6, 3200, 'Puerta del sol', 9, NULL),
(7, 3200, 'Gran via', 13, NULL),
(8, 3200, 'Paseo de la Castellana', 14, NULL),
(9, 3200, 'Paseo del prado', 15, NULL),
(10, 3200, 'Reyes Catolicos', 17, NULL),
(11, 3200, 'Cea Bermudez', 18, NULL),
(12, 3200, 'Maria Molina', 19, NULL),
(13, 3200, 'Avenida America', 20, NULL);

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
(1, 'cosa@gmail.com', '[]', '$argon2i$v=19$m=1024,t=2,p=2$ZEI0TmhkQ0xtWTVkVVhDWA$Fp02IZPKl+69dN8uVA+b1B8dfOqWN4ao+lnzY09E+kc', '', 1, NULL),
(2, 'cosa2@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'azul', 1, 7500),
(3, 'cosa3@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'rojo', 1, 7500),
(4, 'cosa4@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'platinum', 12, 9000),
(5, 'cosa5@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'esmerald', 12, 10500),
(6, 'antonio@gmail.com', '[]', 'c4ca4238a0b923820dcc509a6f75849b', 'Tomás pepe', 6, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9939670;

--
-- AUTO_INCREMENT de la tabla `titulo_propiedad`
--
ALTER TABLE `titulo_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
