-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2019 a las 17:16:22
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

--
-- Volcado de datos para la tabla `carta_partida`
--

INSERT INTO `carta_partida` (`carta_id`, `partida_id`) VALUES
(1, 143978),
(1, 929709),
(1, 951850),
(1, 1017285),
(1, 1074324),
(1, 1351568),
(1, 1483144),
(1, 2740238),
(1, 2818628),
(1, 2983501),
(1, 3823466),
(1, 3847552),
(1, 4009344),
(1, 4713704),
(1, 5596256),
(1, 6011773),
(1, 6093414),
(1, 6137525),
(1, 6491287),
(1, 6499169),
(1, 6913385),
(1, 7474458),
(1, 7546394),
(1, 7617055),
(1, 8041872),
(1, 9050944),
(1, 9133837),
(1, 9166307),
(2, 143978),
(2, 929709),
(2, 951850),
(2, 1017285),
(2, 1074324),
(2, 1351568),
(2, 1483144),
(2, 2740238),
(2, 2818628),
(2, 2983501),
(2, 3823466),
(2, 3847552),
(2, 4009344),
(2, 4713704),
(2, 5596256),
(2, 6011773),
(2, 6093414),
(2, 6137525),
(2, 6491287),
(2, 6499169),
(2, 6913385),
(2, 7474458),
(2, 7546394),
(2, 7617055),
(2, 8041872),
(2, 9050944),
(2, 9133837),
(2, 9166307),
(3, 143978),
(3, 929709),
(3, 951850),
(3, 1017285),
(3, 1074324),
(3, 1351568),
(3, 1483144),
(3, 2740238),
(3, 2818628),
(3, 2983501),
(3, 3823466),
(3, 3847552),
(3, 4009344),
(3, 4713704),
(3, 5596256),
(3, 6011773),
(3, 6093414),
(3, 6137525),
(3, 6491287),
(3, 6499169),
(3, 6913385),
(3, 7474458),
(3, 7546394),
(3, 7617055),
(3, 8041872),
(3, 9050944),
(3, 9133837),
(3, 9166307),
(4, 143978),
(4, 929709),
(4, 951850),
(4, 1017285),
(4, 1074324),
(4, 1351568),
(4, 1483144),
(4, 2740238),
(4, 2818628),
(4, 2983501),
(4, 3823466),
(4, 3847552),
(4, 4009344),
(4, 4713704),
(4, 5596256),
(4, 6011773),
(4, 6093414),
(4, 6137525),
(4, 6491287),
(4, 6499169),
(4, 6913385),
(4, 7474458),
(4, 7546394),
(4, 7617055),
(4, 8041872),
(4, 9050944),
(4, 9133837),
(4, 9166307),
(5, 143978),
(5, 929709),
(5, 951850),
(5, 1017285),
(5, 1074324),
(5, 1351568),
(5, 1483144),
(5, 2740238),
(5, 2818628),
(5, 2983501),
(5, 3823466),
(5, 3847552),
(5, 4009344),
(5, 4713704),
(5, 5596256),
(5, 6011773),
(5, 6093414),
(5, 6137525),
(5, 6491287),
(5, 6499169),
(5, 6913385),
(5, 7474458),
(5, 7546394),
(5, 7617055),
(5, 8041872),
(5, 9050944),
(5, 9133837),
(5, 9166307),
(6, 143978),
(6, 929709),
(6, 951850),
(6, 1017285),
(6, 1074324),
(6, 1351568),
(6, 1483144),
(6, 2740238),
(6, 2818628),
(6, 2983501),
(6, 3823466),
(6, 3847552),
(6, 4009344),
(6, 4713704),
(6, 5596256),
(6, 6011773),
(6, 6093414),
(6, 6137525),
(6, 6491287),
(6, 6499169),
(6, 6913385),
(6, 7474458),
(6, 7546394),
(6, 7617055),
(6, 8041872),
(6, 9050944),
(6, 9133837),
(6, 9166307);

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

--
-- Volcado de datos para la tabla `casillas_partida`
--

INSERT INTO `casillas_partida` (`casillas_id`, `partida_id`) VALUES
(1, 143978),
(1, 929709),
(1, 951850),
(1, 1017285),
(1, 1074324),
(1, 1351568),
(1, 1483144),
(1, 2740238),
(1, 2818628),
(1, 2983501),
(1, 3823466),
(1, 3847552),
(1, 4009344),
(1, 4713704),
(1, 5596256),
(1, 6011773),
(1, 6093414),
(1, 6137525),
(1, 6491287),
(1, 6499169),
(1, 6913385),
(1, 7474458),
(1, 7546394),
(1, 7617055),
(1, 8041872),
(1, 9050944),
(1, 9133837),
(1, 9166307),
(2, 143978),
(2, 929709),
(2, 951850),
(2, 1017285),
(2, 1074324),
(2, 1351568),
(2, 1483144),
(2, 2740238),
(2, 2818628),
(2, 2983501),
(2, 3823466),
(2, 3847552),
(2, 4009344),
(2, 4713704),
(2, 5596256),
(2, 6011773),
(2, 6093414),
(2, 6137525),
(2, 6491287),
(2, 6499169),
(2, 6913385),
(2, 7474458),
(2, 7546394),
(2, 7617055),
(2, 8041872),
(2, 9050944),
(2, 9133837),
(2, 9166307),
(3, 143978),
(3, 929709),
(3, 951850),
(3, 1017285),
(3, 1074324),
(3, 1351568),
(3, 1483144),
(3, 2740238),
(3, 2818628),
(3, 2983501),
(3, 3823466),
(3, 3847552),
(3, 4009344),
(3, 4713704),
(3, 5596256),
(3, 6011773),
(3, 6093414),
(3, 6137525),
(3, 6491287),
(3, 6499169),
(3, 6913385),
(3, 7474458),
(3, 7546394),
(3, 7617055),
(3, 8041872),
(3, 9050944),
(3, 9133837),
(3, 9166307),
(4, 143978),
(4, 929709),
(4, 951850),
(4, 1017285),
(4, 1074324),
(4, 1351568),
(4, 1483144),
(4, 2740238),
(4, 2818628),
(4, 2983501),
(4, 3823466),
(4, 3847552),
(4, 4009344),
(4, 4713704),
(4, 5596256),
(4, 6011773),
(4, 6093414),
(4, 6137525),
(4, 6491287),
(4, 6499169),
(4, 6913385),
(4, 7474458),
(4, 7546394),
(4, 7617055),
(4, 8041872),
(4, 9050944),
(4, 9133837),
(4, 9166307),
(5, 143978),
(5, 929709),
(5, 951850),
(5, 1017285),
(5, 1074324),
(5, 1351568),
(5, 1483144),
(5, 2740238),
(5, 2818628),
(5, 2983501),
(5, 3823466),
(5, 3847552),
(5, 4009344),
(5, 4713704),
(5, 5596256),
(5, 6011773),
(5, 6093414),
(5, 6137525),
(5, 6491287),
(5, 6499169),
(5, 6913385),
(5, 7474458),
(5, 7546394),
(5, 7617055),
(5, 8041872),
(5, 9050944),
(5, 9133837),
(5, 9166307),
(6, 143978),
(6, 929709),
(6, 951850),
(6, 1017285),
(6, 1074324),
(6, 1351568),
(6, 1483144),
(6, 2740238),
(6, 2818628),
(6, 2983501),
(6, 3823466),
(6, 3847552),
(6, 4009344),
(6, 4713704),
(6, 5596256),
(6, 6011773),
(6, 6093414),
(6, 6137525),
(6, 6491287),
(6, 6499169),
(6, 6913385),
(6, 7474458),
(6, 7546394),
(6, 7617055),
(6, 8041872),
(6, 9050944),
(6, 9133837),
(6, 9166307),
(7, 143978),
(7, 929709),
(7, 951850),
(7, 1017285),
(7, 1074324),
(7, 1351568),
(7, 1483144),
(7, 2740238),
(7, 2818628),
(7, 2983501),
(7, 3823466),
(7, 3847552),
(7, 4009344),
(7, 4713704),
(7, 5596256),
(7, 6011773),
(7, 6093414),
(7, 6137525),
(7, 6491287),
(7, 6499169),
(7, 6913385),
(7, 7474458),
(7, 7546394),
(7, 7617055),
(7, 8041872),
(7, 9050944),
(7, 9133837),
(7, 9166307),
(8, 143978),
(8, 929709),
(8, 951850),
(8, 1017285),
(8, 1074324),
(8, 1351568),
(8, 1483144),
(8, 2740238),
(8, 2818628),
(8, 2983501),
(8, 3823466),
(8, 3847552),
(8, 4009344),
(8, 4713704),
(8, 5596256),
(8, 6011773),
(8, 6093414),
(8, 6137525),
(8, 6491287),
(8, 6499169),
(8, 6913385),
(8, 7474458),
(8, 7546394),
(8, 7617055),
(8, 8041872),
(8, 9050944),
(8, 9133837),
(8, 9166307),
(9, 143978),
(9, 929709),
(9, 951850),
(9, 1017285),
(9, 1074324),
(9, 1351568),
(9, 1483144),
(9, 2740238),
(9, 2818628),
(9, 2983501),
(9, 3823466),
(9, 3847552),
(9, 4009344),
(9, 4713704),
(9, 5596256),
(9, 6011773),
(9, 6093414),
(9, 6137525),
(9, 6491287),
(9, 6499169),
(9, 6913385),
(9, 7474458),
(9, 7546394),
(9, 7617055),
(9, 8041872),
(9, 9050944),
(9, 9133837),
(9, 9166307),
(10, 143978),
(10, 929709),
(10, 951850),
(10, 1017285),
(10, 1074324),
(10, 1351568),
(10, 1483144),
(10, 2740238),
(10, 2818628),
(10, 2983501),
(10, 3823466),
(10, 3847552),
(10, 4009344),
(10, 4713704),
(10, 5596256),
(10, 6011773),
(10, 6093414),
(10, 6137525),
(10, 6491287),
(10, 6499169),
(10, 6913385),
(10, 7474458),
(10, 7546394),
(10, 7617055),
(10, 8041872),
(10, 9050944),
(10, 9133837),
(10, 9166307),
(11, 143978),
(11, 929709),
(11, 951850),
(11, 1017285),
(11, 1074324),
(11, 1351568),
(11, 1483144),
(11, 2740238),
(11, 2818628),
(11, 2983501),
(11, 3823466),
(11, 3847552),
(11, 4009344),
(11, 4713704),
(11, 5596256),
(11, 6011773),
(11, 6093414),
(11, 6137525),
(11, 6491287),
(11, 6499169),
(11, 6913385),
(11, 7474458),
(11, 7546394),
(11, 7617055),
(11, 8041872),
(11, 9050944),
(11, 9133837),
(11, 9166307),
(12, 143978),
(12, 929709),
(12, 951850),
(12, 1017285),
(12, 1074324),
(12, 1351568),
(12, 1483144),
(12, 2740238),
(12, 2818628),
(12, 2983501),
(12, 3823466),
(12, 3847552),
(12, 4009344),
(12, 4713704),
(12, 5596256),
(12, 6011773),
(12, 6093414),
(12, 6137525),
(12, 6491287),
(12, 6499169),
(12, 6913385),
(12, 7474458),
(12, 7546394),
(12, 7617055),
(12, 8041872),
(12, 9050944),
(12, 9133837),
(12, 9166307),
(13, 143978),
(13, 929709),
(13, 951850),
(13, 1017285),
(13, 1074324),
(13, 1351568),
(13, 1483144),
(13, 2740238),
(13, 2818628),
(13, 2983501),
(13, 3823466),
(13, 3847552),
(13, 4009344),
(13, 4713704),
(13, 5596256),
(13, 6011773),
(13, 6093414),
(13, 6137525),
(13, 6491287),
(13, 6499169),
(13, 6913385),
(13, 7474458),
(13, 7546394),
(13, 7617055),
(13, 8041872),
(13, 9050944),
(13, 9133837),
(13, 9166307),
(14, 143978),
(14, 929709),
(14, 951850),
(14, 1017285),
(14, 1074324),
(14, 1351568),
(14, 1483144),
(14, 2740238),
(14, 2818628),
(14, 2983501),
(14, 3823466),
(14, 3847552),
(14, 4009344),
(14, 4713704),
(14, 5596256),
(14, 6011773),
(14, 6093414),
(14, 6137525),
(14, 6491287),
(14, 6499169),
(14, 6913385),
(14, 7474458),
(14, 7546394),
(14, 7617055),
(14, 8041872),
(14, 9050944),
(14, 9133837),
(14, 9166307),
(15, 143978),
(15, 929709),
(15, 951850),
(15, 1017285),
(15, 1074324),
(15, 1351568),
(15, 1483144),
(15, 2740238),
(15, 2818628),
(15, 2983501),
(15, 3823466),
(15, 3847552),
(15, 4009344),
(15, 4713704),
(15, 5596256),
(15, 6011773),
(15, 6093414),
(15, 6137525),
(15, 6491287),
(15, 6499169),
(15, 6913385),
(15, 7474458),
(15, 7546394),
(15, 7617055),
(15, 8041872),
(15, 9050944),
(15, 9133837),
(15, 9166307),
(16, 143978),
(16, 929709),
(16, 951850),
(16, 1017285),
(16, 1074324),
(16, 1351568),
(16, 1483144),
(16, 2740238),
(16, 2818628),
(16, 2983501),
(16, 3823466),
(16, 3847552),
(16, 4009344),
(16, 4713704),
(16, 5596256),
(16, 6011773),
(16, 6093414),
(16, 6137525),
(16, 6491287),
(16, 6499169),
(16, 6913385),
(16, 7474458),
(16, 7546394),
(16, 7617055),
(16, 8041872),
(16, 9050944),
(16, 9133837),
(16, 9166307),
(17, 143978),
(17, 929709),
(17, 951850),
(17, 1017285),
(17, 1074324),
(17, 1351568),
(17, 1483144),
(17, 2740238),
(17, 2818628),
(17, 2983501),
(17, 3823466),
(17, 3847552),
(17, 4009344),
(17, 4713704),
(17, 5596256),
(17, 6011773),
(17, 6093414),
(17, 6137525),
(17, 6491287),
(17, 6499169),
(17, 6913385),
(17, 7474458),
(17, 7546394),
(17, 7617055),
(17, 8041872),
(17, 9050944),
(17, 9133837),
(17, 9166307),
(18, 143978),
(18, 929709),
(18, 951850),
(18, 1017285),
(18, 1074324),
(18, 1351568),
(18, 1483144),
(18, 2740238),
(18, 2818628),
(18, 2983501),
(18, 3823466),
(18, 3847552),
(18, 4009344),
(18, 4713704),
(18, 5596256),
(18, 6011773),
(18, 6093414),
(18, 6137525),
(18, 6491287),
(18, 6499169),
(18, 6913385),
(18, 7474458),
(18, 7546394),
(18, 7617055),
(18, 8041872),
(18, 9050944),
(18, 9133837),
(18, 9166307),
(19, 143978),
(19, 929709),
(19, 951850),
(19, 1017285),
(19, 1074324),
(19, 1351568),
(19, 1483144),
(19, 2740238),
(19, 2818628),
(19, 2983501),
(19, 3823466),
(19, 3847552),
(19, 4009344),
(19, 4713704),
(19, 5596256),
(19, 6011773),
(19, 6093414),
(19, 6137525),
(19, 6491287),
(19, 6499169),
(19, 6913385),
(19, 7474458),
(19, 7546394),
(19, 7617055),
(19, 8041872),
(19, 9050944),
(19, 9133837),
(19, 9166307),
(20, 143978),
(20, 929709),
(20, 951850),
(20, 1017285),
(20, 1074324),
(20, 1351568),
(20, 1483144),
(20, 2740238),
(20, 2818628),
(20, 2983501),
(20, 3823466),
(20, 3847552),
(20, 4009344),
(20, 4713704),
(20, 5596256),
(20, 6011773),
(20, 6093414),
(20, 6137525),
(20, 6491287),
(20, 6499169),
(20, 6913385),
(20, 7474458),
(20, 7546394),
(20, 7617055),
(20, 8041872),
(20, 9050944),
(20, 9133837),
(20, 9166307);

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
('20190507100906', '2019-05-08 17:27:00'),
('20190520202030', '2019-05-20 20:21:08');

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
(143978, 1, '', 0, '2019-05-19 08:19:23'),
(929709, 1, '', 0, '2019-05-19 09:14:42'),
(951850, 1, '', 0, '2019-05-19 09:16:37'),
(1017285, 1, '', 0, '2019-05-19 09:17:52'),
(1074324, 1, '', 0, '2019-05-20 17:18:18'),
(1351568, 1, '', 0, '2019-05-20 17:17:45'),
(1483144, 1, '', 0, '2019-05-20 17:14:03'),
(2740238, 1, '', 0, '2019-05-19 07:41:55'),
(2818628, 1, '', 0, '2019-05-20 17:19:56'),
(2983501, 1, '', 0, '2019-05-20 21:26:43'),
(3823466, 1, '', 0, '2019-05-20 22:05:27'),
(3847552, 1, '', 0, '2019-05-19 08:19:34'),
(4009344, 1, '', 0, '2019-05-20 17:15:17'),
(4713704, 1, '', 0, '2019-05-20 18:27:19'),
(5596256, 1, '', 0, '2019-05-19 09:15:37'),
(6011773, 1, '', 0, '2019-05-20 17:16:06'),
(6093414, 1, '', 0, '2019-05-20 19:21:08'),
(6137525, 1, '', 0, '2019-05-19 08:18:26'),
(6491287, 1, '', 0, '2019-05-20 21:58:01'),
(6499169, 1, '', 0, '2019-05-19 08:18:46'),
(6913385, 1, '', 0, '2019-05-20 19:37:59'),
(7474458, 1, '', 0, '2019-05-20 17:10:25'),
(7546394, 1, '', 0, '2019-05-19 08:17:45'),
(7617055, 1, '', 0, '2019-05-20 22:05:53'),
(8041872, 1, '', 0, '2019-05-20 18:29:48'),
(9050944, 1, '', 0, '2019-05-20 16:10:14'),
(9133837, 1, '', 0, '2019-05-20 17:18:38'),
(9166307, 1, '', 0, '2019-05-20 21:28:39');

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
(143978, 2),
(929709, 2),
(929709, 3),
(951850, 2),
(951850, 3),
(1017285, 2),
(1074324, 2),
(1351568, 2),
(1483144, 2),
(2740238, 2),
(2740238, 3),
(2818628, 2),
(2983501, 2),
(3823466, 2),
(3847552, 2),
(4009344, 2),
(4713704, 2),
(4713704, 3),
(5596256, 2),
(5596256, 3),
(6011773, 2),
(6093414, 2),
(6137525, 2),
(6491287, 2),
(6499169, 2),
(6913385, 2),
(7474458, 2),
(7546394, 2),
(7617055, 2),
(8041872, 2),
(8041872, 3),
(9050944, 2),
(9133837, 2),
(9166307, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo_propiedad`
--

CREATE TABLE `titulo_propiedad` (
  `id` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `casilla_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `titulo_propiedad`
--

INSERT INTO `titulo_propiedad` (`id`, `precio_compra`, `nombre`, `casilla_id`, `usuario_id`, `grupo`) VALUES
(1, 3200, 'Fuencarral', 2, 2, 'verde'),
(2, 3200, 'Alberto Aguilera', 3, NULL, 'verde'),
(3, 3200, 'Glorieta Bilbao', 5, NULL, 'verde'),
(4, 3200, 'Calle Bailen', 7, NULL, 'amarilla'),
(5, 3200, 'Plaza España', 8, NULL, 'amarilla'),
(6, 3200, 'Puerta del sol', 9, NULL, 'amarilla'),
(7, 3200, 'Gran via', 13, NULL, 'azul'),
(8, 3200, 'Paseo de la Castellana', 14, NULL, 'azul'),
(9, 3200, 'Paseo del prado', 15, NULL, 'azul'),
(10, 3200, 'Reyes Catolicos', 17, NULL, 'rojo'),
(11, 3200, 'Cea Bermudez', 18, NULL, 'rojo'),
(12, 3200, 'Maria Molina', 19, NULL, 'rojo'),
(13, 3200, 'Avenida America', 20, NULL, 'rojo');

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
(2, 'cosa2@gmail.com', '', 'c4ca4238a0b923820dcc509a6f75849b', 'azul', 2, 7500),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9166308;

--
-- AUTO_INCREMENT de la tabla `titulo_propiedad`
--
ALTER TABLE `titulo_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
