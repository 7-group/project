-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-05-2017 a las 19:40:21
-- Versión del servidor: 5.5.54-0ubuntu0.14.04.1-log
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `java`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basic_information`
--

CREATE TABLE IF NOT EXISTS `basic_information` (
  `binfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `profession` varchar(32) COLLATE utf8_bin NOT NULL,
  `address` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(48) COLLATE utf8_bin NOT NULL,
  `telephone_number` int(13) NOT NULL,
  PRIMARY KEY (`binfo_id`),
  KEY `binfo_id` (`binfo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `basic_information`
--

INSERT INTO `basic_information` (`binfo_id`, `user`, `name`, `last_name`, `profession`, `address`, `email`, `telephone_number`) VALUES
(1, 'rafa', 'Rafael', 'Cardenas', 'Web Developer', 'Barcelona. Spain', 'rmcardenas@jaumebalmes.net', 629983672),
(2, 'edu', 'Eduardo', 'Zaldivar', 'Web Developer', 'Paris, France', 'ezaldivar@jaumebalmes.net', 635291192);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`lang_id`, `language`) VALUES
(1, 'Spanish'),
(2, 'English'),
(3, 'French'),
(4, 'German'),
(5, 'Portuguese'),
(6, 'Chinese'),
(7, 'Japanese'),
(8, 'Russian'),
(9, 'Catala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) COLLATE utf8_bin NOT NULL,
  `pass` varchar(40) COLLATE utf8_bin NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `login_id` (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`login_id`, `user`, `pass`, `level`) VALUES
(1, 'admin', 'admin', 0),
(2, 'guest', '1234', 1),
(3, 'rafa', 'rafa', 1),
(4, 'edu', 'edu', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_lang_percentage`
--

CREATE TABLE IF NOT EXISTS `relation_lang_percentage` (
  `r_lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`r_lang_id`),
  KEY `lang_id` (`lang_id`),
  KEY `login_id` (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `relation_lang_percentage`
--

INSERT INTO `relation_lang_percentage` (`r_lang_id`, `lang_id`, `login_id`, `percentage`) VALUES
(1, 1, 3, 100),
(2, 2, 3, 30),
(3, 9, 3, 70),
(4, 1, 4, 100),
(5, 2, 4, 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_skill_percentage`
--

CREATE TABLE IF NOT EXISTS `relation_skill_percentage` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `login_id` (`login_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `relation_skill_percentage`
--

INSERT INTO `relation_skill_percentage` (`sp_id`, `s_id`, `login_id`, `percentage`) VALUES
(5, 1, 3, 75),
(6, 2, 3, 80),
(7, 5, 3, 90),
(8, 8, 3, 50),
(9, 1, 4, 70),
(10, 2, 4, 80),
(11, 5, 4, 50),
(12, 8, 4, 75),
(13, 3, 4, 100),
(14, 6, 3, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_username_basic_info`
--

CREATE TABLE IF NOT EXISTS `relation_username_basic_info` (
  `rel_u_b_id` int(11) NOT NULL AUTO_INCREMENT,
  `binfo_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`rel_u_b_id`),
  KEY `binfo_id` (`binfo_id`),
  KEY `login_id` (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `relation_username_basic_info`
--

INSERT INTO `relation_username_basic_info` (`rel_u_b_id`, `binfo_id`, `login_id`) VALUES
(1, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `skills`
--

INSERT INTO `skills` (`s_id`, `skill`) VALUES
(1, 'Photoshop'),
(2, 'JavaScript'),
(3, 'Photography'),
(4, 'Illustrator'),
(5, 'Linux'),
(6, 'Java'),
(7, 'Finances'),
(8, 'SEO');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relation_lang_percentage`
--
ALTER TABLE `relation_lang_percentage`
  ADD CONSTRAINT `relation_lang_percentage_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_lang_percentage_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `language` (`lang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relation_skill_percentage`
--
ALTER TABLE `relation_skill_percentage`
  ADD CONSTRAINT `relation_skill_percentage_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_skill_percentage_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `skills` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relation_username_basic_info`
--
ALTER TABLE `relation_username_basic_info`
  ADD CONSTRAINT `relation_username_basic_info_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_username_basic_info_ibfk_1` FOREIGN KEY (`binfo_id`) REFERENCES `basic_information` (`binfo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
