-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2019 a las 14:10:56
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
('20190426105948', '2019-04-26 11:04:35');

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
(723925, 1, '', 0, '2019-04-26 12:06:11'),
(2737384, 1, '', 0, '2019-04-26 12:08:20'),
(9034565, 1, '', 0, '2019-04-26 11:36:14');

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
(9034565, 2),
(9034565, 3),
(9034565, 4),
(9034565, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nickname`) VALUES
(1, 'cosa@gmail.com', '[]', '$argon2i$v=19$m=1024,t=2,p=2$ZEI0TmhkQ0xtWTVkVVhDWA$Fp02IZPKl+69dN8uVA+b1B8dfOqWN4ao+lnzY09E+kc', ''),
(2, 'cosa2@gmail.com', '', '1', 'azul'),
(3, 'cosa3@gmail.com', '', '1', 'rojo'),
(4, 'cosa4@gmail.com', '', '1', 'platinum'),
(5, 'cosa5@gmail.com', '', '1', 'esmerald');

--
-- Índices para tablas volcadas
--

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
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dado`
--
ALTER TABLE `dado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9818924;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
