-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2019 a las 12:33:34
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
-- Estructura de tabla para la tabla `casillas`
--

CREATE TABLE `casillas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casillas`
--

INSERT INTO `casillas` (`id`, `nombre`) VALUES
(1, 'inicio'),
(2, 'fuencarral'),
(3, 'alberto_aguilera'),
(4, 'suerte1'),
(5, 'glorieta_bilbao'),
(6, 'injail'),
(7, 'calle_bailen'),
(8, 'plaza_españa'),
(9, 'puerta_del_sol'),
(10, 'impuesto'),
(11, 'parking'),
(12, 'suerte2'),
(13, 'gran_via'),
(14, 'paseo_de_la_castellana'),
(15, 'paseo_del_prado'),
(16, 've_carcel'),
(17, 'reyes_catolicos'),
(18, 'cea_bermudez'),
(19, 'maria_molina'),
(20, 'avenida_america');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casillas_partida`
--

CREATE TABLE `casillas_partida` (
  `casillas_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casillas_partida`
--

INSERT INTO `casillas_partida` (`casillas_id`, `partida_id`) VALUES
(1, 373947),
(1, 2543703),
(1, 2766509),
(1, 4511095),
(1, 5846751),
(1, 7028288),
(1, 7350500),
(1, 8419903),
(2, 373947),
(2, 2543703),
(2, 2766509),
(2, 4511095),
(2, 5846751),
(2, 7028288),
(2, 7350500),
(2, 8419903),
(3, 373947),
(3, 2543703),
(3, 2766509),
(3, 4511095),
(3, 5846751),
(3, 7028288),
(3, 7350500),
(3, 8419903),
(4, 373947),
(4, 2543703),
(4, 2766509),
(4, 4511095),
(4, 5846751),
(4, 7028288),
(4, 7350500),
(4, 8419903),
(5, 373947),
(5, 2543703),
(5, 2766509),
(5, 4511095),
(5, 5846751),
(5, 7028288),
(5, 7350500),
(5, 8419903),
(6, 373947),
(6, 2543703),
(6, 2766509),
(6, 4511095),
(6, 5846751),
(6, 7028288),
(6, 7350500),
(6, 8419903),
(7, 373947),
(7, 2543703),
(7, 2766509),
(7, 4511095),
(7, 5846751),
(7, 7028288),
(7, 7350500),
(7, 8419903),
(8, 373947),
(8, 2543703),
(8, 2766509),
(8, 4511095),
(8, 5846751),
(8, 7028288),
(8, 7350500),
(8, 8419903),
(9, 373947),
(9, 2543703),
(9, 2766509),
(9, 4511095),
(9, 5846751),
(9, 7028288),
(9, 7350500),
(9, 8419903),
(10, 373947),
(10, 2543703),
(10, 2766509),
(10, 4511095),
(10, 5846751),
(10, 7028288),
(10, 7350500),
(10, 8419903),
(11, 373947),
(11, 2543703),
(11, 2766509),
(11, 4511095),
(11, 5846751),
(11, 7028288),
(11, 7350500),
(11, 8419903),
(12, 373947),
(12, 2543703),
(12, 2766509),
(12, 4511095),
(12, 5846751),
(12, 7028288),
(12, 7350500),
(12, 8419903),
(13, 373947),
(13, 2543703),
(13, 2766509),
(13, 4511095),
(13, 5846751),
(13, 7028288),
(13, 7350500),
(13, 8419903),
(14, 373947),
(14, 2543703),
(14, 2766509),
(14, 4511095),
(14, 5846751),
(14, 7028288),
(14, 7350500),
(14, 8419903),
(15, 373947),
(15, 2543703),
(15, 2766509),
(15, 4511095),
(15, 5846751),
(15, 7028288),
(15, 7350500),
(15, 8419903),
(16, 373947),
(16, 2543703),
(16, 2766509),
(16, 4511095),
(16, 5846751),
(16, 7028288),
(16, 7350500),
(16, 8419903),
(17, 373947),
(17, 2543703),
(17, 2766509),
(17, 4511095),
(17, 5846751),
(17, 7028288),
(17, 7350500),
(17, 8419903),
(18, 373947),
(18, 2543703),
(18, 2766509),
(18, 4511095),
(18, 5846751),
(18, 7028288),
(18, 7350500),
(18, 8419903),
(19, 373947),
(19, 2543703),
(19, 2766509),
(19, 4511095),
(19, 5846751),
(19, 7028288),
(19, 7350500),
(19, 8419903),
(20, 373947),
(20, 2543703),
(20, 2766509),
(20, 4511095),
(20, 5846751),
(20, 7028288),
(20, 7350500),
(20, 8419903);

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
('20190429075252', '2019-04-29 07:57:30');

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

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`id`, `dado_id`, `ganador`, `num_turnos`, `fecha`) VALUES
(361364, 1, '', 0, '2019-04-30 06:36:56'),
(373947, 1, '', 0, '2019-04-30 08:03:39'),
(672884, 1, '', 0, '2019-04-29 10:11:26'),
(723925, 1, '', 0, '2019-04-26 12:06:11'),
(962977, 1, '', 0, '2019-04-30 06:35:33'),
(1067143, 1, '', 0, '2019-04-29 08:05:41'),
(1156802, 1, '', 0, '2019-04-29 07:03:51'),
(1207716, 1, '', 0, '2019-04-30 06:42:54'),
(1256462, 1, '', 0, '2019-04-29 08:35:24'),
(1321263, 1, '', 0, '2019-04-29 07:06:00'),
(1340929, 1, '', 0, '2019-04-29 06:23:05'),
(1373959, 1, '', 0, '2019-04-30 06:24:19'),
(1458066, 1, '', 0, '2019-04-30 06:57:10'),
(1624077, 1, '', 0, '2019-04-29 10:25:45'),
(1717311, 1, '', 0, '2019-04-29 06:56:09'),
(1866636, 1, '', 0, '2019-04-29 08:46:24'),
(2486869, 1, '', 0, '2019-04-29 10:12:59'),
(2543703, 1, '', 0, '2019-04-30 07:51:22'),
(2553932, 1, '', 0, '2019-04-29 08:47:49'),
(2572828, 1, '', 0, '2019-04-29 08:40:16'),
(2737384, 1, '', 0, '2019-04-26 12:08:20'),
(2766509, 1, '', 0, '2019-04-30 08:06:10'),
(2785097, 1, '', 0, '2019-04-29 11:17:19'),
(2887293, 1, '', 0, '2019-04-30 06:26:03'),
(3168213, 1, '', 0, '2019-04-29 10:28:22'),
(3244315, 1, '', 0, '2019-04-29 09:23:40'),
(3361226, 1, '', 0, '2019-04-30 07:00:39'),
(3762359, 1, '', 0, '2019-04-29 06:55:52'),
(3817084, 1, '', 0, '2019-04-29 10:06:44'),
(4141719, 1, '', 0, '2019-04-29 08:34:36'),
(4236107, 1, '', 0, '2019-04-30 06:46:23'),
(4259282, 1, '', 0, '2019-04-29 08:22:11'),
(4402717, 1, '', 0, '2019-04-29 08:18:54'),
(4471305, 1, '', 0, '2019-04-29 07:02:24'),
(4511095, 1, '', 0, '2019-04-30 07:30:00'),
(4527821, 1, '', 0, '2019-04-29 10:08:03'),
(4618759, 1, '', 0, '2019-04-29 06:57:11'),
(4653557, 1, '', 0, '2019-04-29 07:09:28'),
(4722722, 1, '', 0, '2019-04-29 06:50:38'),
(4862373, 1, '', 0, '2019-04-29 08:41:40'),
(4947682, 1, '', 0, '2019-04-29 08:45:20'),
(5014786, 1, '', 0, '2019-04-30 06:20:27'),
(5063743, 1, '', 0, '2019-04-29 06:49:13'),
(5072442, 1, '', 0, '2019-04-30 07:19:33'),
(5239828, 1, '', 0, '2019-04-29 08:46:53'),
(5274706, 1, '', 0, '2019-04-29 09:26:26'),
(5374226, 1, '', 0, '2019-04-29 08:51:09'),
(5569642, 1, '', 0, '2019-04-29 10:18:37'),
(5711565, 1, '', 0, '2019-04-29 06:42:45'),
(5722280, 1, '', 0, '2019-04-29 10:12:27'),
(5769839, 1, '', 0, '2019-04-29 10:39:49'),
(5846751, 1, '', 0, '2019-04-30 08:04:32'),
(6170190, 1, '', 0, '2019-04-29 07:02:47'),
(6623421, 1, '', 0, '2019-04-29 10:34:02'),
(6682438, 1, '', 0, '2019-04-29 10:18:09'),
(6691873, 1, '', 0, '2019-04-29 08:40:42'),
(6794118, 1, '', 0, '2019-04-29 08:39:48'),
(6927422, 1, '', 0, '2019-04-29 08:39:14'),
(6931604, 1, '', 0, '2019-04-29 06:27:16'),
(6966179, 1, '', 0, '2019-04-30 06:22:19'),
(7028288, 1, '', 0, '2019-04-30 08:07:42'),
(7114861, 1, '', 0, '2019-04-29 07:02:58'),
(7123098, 1, '', 0, '2019-04-29 08:39:36'),
(7147676, 1, '', 0, '2019-04-30 06:39:35'),
(7172876, 1, '', 0, '2019-04-30 06:22:32'),
(7183365, 1, '', 0, '2019-04-29 08:24:04'),
(7288476, 1, '', 0, '2019-04-30 07:21:18'),
(7350500, 1, '', 0, '2019-04-30 08:05:49'),
(7360178, 1, '', 0, '2019-04-29 09:18:58'),
(7391471, 1, '', 0, '2019-04-30 06:47:11'),
(7402272, 1, '', 0, '2019-04-29 06:36:53'),
(7469305, 1, '', 0, '2019-04-30 07:23:00'),
(7479164, 1, '', 0, '2019-04-29 09:26:47'),
(7536623, 1, '', 0, '2019-04-30 06:54:07'),
(7723545, 1, '', 0, '2019-04-30 06:21:21'),
(7751479, 1, '', 0, '2019-04-29 06:40:53'),
(7796647, 1, '', 0, '2019-04-29 06:40:31'),
(7821157, 1, '', 0, '2019-04-29 07:01:30'),
(7895695, 1, '', 0, '2019-04-29 08:20:58'),
(8105902, 1, '', 0, '2019-04-29 06:57:50'),
(8116301, 1, '', 0, '2019-04-29 06:39:32'),
(8136695, 1, '', 0, '2019-04-29 08:45:44'),
(8236533, 1, '', 0, '2019-04-29 06:49:34'),
(8339520, 1, '', 0, '2019-04-29 10:32:12'),
(8419903, 1, '', 0, '2019-04-30 08:02:57'),
(8617570, 1, '', 0, '2019-04-29 06:20:28'),
(8624230, 1, '', 0, '2019-04-29 08:19:39'),
(8796928, 1, '', 0, '2019-04-29 10:08:20'),
(8993506, 1, '', 0, '2019-04-29 08:22:49'),
(9034565, 1, '', 0, '2019-04-26 11:36:14'),
(9122579, 1, '', 0, '2019-04-29 11:19:38'),
(9125211, 1, '', 0, '2019-04-30 07:18:35'),
(9349736, 1, '', 0, '2019-04-30 06:23:21'),
(9391197, 1, '', 0, '2019-04-29 07:10:14'),
(9478287, 1, '', 0, '2019-04-29 08:46:01'),
(9513893, 1, '', 0, '2019-04-29 10:34:37'),
(9552362, 1, '', 0, '2019-04-30 06:47:52'),
(9619818, 1, '', 0, '2019-04-30 06:37:33'),
(9661088, 1, '', 0, '2019-04-30 06:53:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida_user`
--

CREATE TABLE `partida_user` (
  `partida_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partida_user`
--

INSERT INTO `partida_user` (`partida_id`, `user_id`) VALUES
(361364, 2),
(373947, 2),
(672884, 2),
(962977, 2),
(1067143, 2),
(1207716, 2),
(1256462, 2),
(1256462, 3),
(1321263, 2),
(1321263, 4),
(1373959, 2),
(1458066, 2),
(1458066, 3),
(1624077, 2),
(2486869, 2),
(2543703, 2),
(2543703, 3),
(2543703, 4),
(2766509, 2),
(2785097, 2),
(2887293, 2),
(3168213, 2),
(3244315, 2),
(3361226, 2),
(3361226, 3),
(3361226, 4),
(3361226, 5),
(3817084, 2),
(4236107, 2),
(4259282, 2),
(4402717, 2),
(4511095, 2),
(4653557, 2),
(4653557, 3),
(4722722, 2),
(4722722, 3),
(5014786, 2),
(5014786, 3),
(5072442, 2),
(5072442, 3),
(5072442, 4),
(5072442, 5),
(5274706, 2),
(5374226, 2),
(5569642, 2),
(5722280, 2),
(5769839, 2),
(5769839, 3),
(5846751, 2),
(5846751, 3),
(6623421, 2),
(6682438, 2),
(7028288, 2),
(7147676, 2),
(7183365, 2),
(7288476, 2),
(7288476, 3),
(7288476, 4),
(7350500, 2),
(7360178, 2),
(7391471, 2),
(7469305, 2),
(7479164, 2),
(7479164, 3),
(7536623, 2),
(7723545, 2),
(7895695, 2),
(8339520, 2),
(8419903, 2),
(8419903, 3),
(8624230, 2),
(8796928, 2),
(8993506, 2),
(9034565, 2),
(9034565, 3),
(9034565, 4),
(9034565, 5),
(9122579, 2),
(9125211, 2),
(9125211, 3),
(9125211, 4),
(9125211, 5),
(9349736, 2),
(9391197, 2),
(9513893, 2),
(9552362, 2),
(9619818, 2),
(9661088, 2);

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
  `casillas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nickname`, `casillas_id`) VALUES
(1, 'cosa@gmail.com', '[]', '$argon2i$v=19$m=1024,t=2,p=2$ZEI0TmhkQ0xtWTVkVVhDWA$Fp02IZPKl+69dN8uVA+b1B8dfOqWN4ao+lnzY09E+kc', '', NULL),
(2, 'cosa2@gmail.com', '', '1', 'azul', 19),
(3, 'cosa3@gmail.com', '', '1', 'rojo', 1),
(4, 'cosa4@gmail.com', '', '1', 'platinum', 1),
(5, 'cosa5@gmail.com', '', '1', 'esmerald', NULL);

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `casillas`
--
ALTER TABLE `casillas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `dado`
--
ALTER TABLE `dado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9661089;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649EDE6CE06` FOREIGN KEY (`casillas_id`) REFERENCES `casillas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
