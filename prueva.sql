-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para vetsos
CREATE DATABASE IF NOT EXISTS `vetsos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `vetsos`;

-- Volcando estructura para tabla vetsos.apointment
CREATE TABLE IF NOT EXISTS `apointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_professional_id` int(11) DEFAULT NULL,
  `fk_pet_id` int(11) DEFAULT NULL,
  `fk_category_id` int(11) DEFAULT NULL,
  `fk_service_id` int(11) DEFAULT NULL,
  `fk_state_id` int(11) DEFAULT NULL,
  `fk_race_id` int(11) DEFAULT NULL,
  `fk_calendar_id` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `professional_id` (`fk_professional_id`) USING BTREE,
  KEY `pet_id` (`fk_pet_id`) USING BTREE,
  KEY `category_id` (`fk_category_id`) USING BTREE,
  KEY `FK_appointment_service` (`fk_service_id`) USING BTREE,
  KEY `FK_appointment_state` (`fk_state_id`) USING BTREE,
  KEY `FK_apointment_race` (`fk_race_id`),
  KEY `FK_apointment_customer` (`fk_customer_id`),
  KEY `FK_apointment_calendar` (`fk_calendar_id`),
  CONSTRAINT `FK_apointment_calendar` FOREIGN KEY (`fk_calendar_id`) REFERENCES `calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_apointment_customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_apointment_professional` FOREIGN KEY (`fk_professional_id`) REFERENCES `professional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_apointment_race` FOREIGN KEY (`fk_race_id`) REFERENCES `race` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apointment_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apointment_ibfk_2` FOREIGN KEY (`fk_pet_id`) REFERENCES `pet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apointment_ibfk_4` FOREIGN KEY (`fk_service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apointment_ibfk_5` FOREIGN KEY (`fk_state_id`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.apointment: ~5 rows (aproximadamente)
INSERT INTO `apointment` (`id`, `fk_professional_id`, `fk_pet_id`, `fk_category_id`, `fk_service_id`, `fk_state_id`, `fk_race_id`, `fk_calendar_id`, `description`, `fk_customer_id`, `updated`, `created`, `active`) VALUES
	(2, 1, 4, 1, 1, 3, 1, 1, 'ecografia para conocer estado', 5, '2024-02-27 04:40:07', '2024-02-27 04:40:06', 1),
	(3, 1, 3, 2, 1, 3, 5, 2, 'bañar bien', 3, '2024-02-27 04:40:09', '2024-02-27 04:40:11', 1),
	(4, 2, 1, 1, 1, 4, 2, 1, 'funciona', 1, '2024-02-27 04:40:09', '2024-02-27 04:40:10', 1),
	(5, 2, 2, 1, 1, 1, 4, 2, 'esta embarazada', 3, '2024-02-27 04:40:07', '2024-02-27 04:40:12', 1),
	(6, 2, 3, 3, NULL, 2, NULL, 2, 'mi tortuga tiene fiebre', 4, '2024-02-27 04:56:21', '2024-02-27 04:56:20', 1);

-- Volcando estructura para tabla vetsos.calendar
CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dayweek` varchar(50) DEFAULT NULL,
  `citacion` datetime DEFAULT NULL,
  `start` varchar(50) DEFAULT NULL,
  `end` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.calendar: ~2 rows (aproximadamente)
INSERT INTO `calendar` (`id`, `dayweek`, `citacion`, `start`, `end`, `created`, `updated`, `active`) VALUES
	(1, 'lunes', '2024-03-07 11:00:03', '11 : 15  am', '01:20 pm', '2024-02-20 17:02:54', '2024-03-07 15:53:38', 1),
	(2, 'martes', '2024-03-07 11:02:28', '02:00', '03:50', '2024-03-07 16:03:26', '2024-03-07 16:03:26', 1);

-- Volcando estructura para tabla vetsos.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.category: ~3 rows (aproximadamente)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'cita clinica'),
	(2, 'cita de belleza'),
	(3, 'otra');

-- Volcando estructura para tabla vetsos.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `document` char(50) DEFAULT NULL,
  `telefono` char(50) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.customer: ~5 rows (aproximadamente)
INSERT INTO `customer` (`id`, `name`, `lastname`, `document`, `telefono`, `adress`, `created`, `updated`, `active`) VALUES
	(1, 'daniel', 'alavarez ', '1096253028', '3042170369', 'avenida siempre vida avenida 52a-48', '2024-02-20 14:51:28', '2024-02-20 14:51:35', 1),
	(2, 'alfaniel', 'alvarez ', '1096253029', '3042170369', 'avenida siempre vida avenida 52a-48', '2024-02-27 04:54:38', '2024-02-27 04:54:39', 1),
	(3, 'camilo', 'alvarez ', '1096222223', '3042170369', 'avenida siempre vida avenida 52a-48', '2024-02-27 04:54:37', '2024-02-27 04:54:40', 1),
	(4, 'pepe', 'rodrigues', '1096253025', '3042173655', 'el porvenir asa', '2024-02-27 04:54:36', '2024-02-27 04:54:35', 1),
	(5, 'diomedez', 'alvarez ', '109622222', '3042170369', 'avenida siempre vida avenida 52a-48', '2024-03-08 03:18:33', '2024-03-08 03:18:34', 1);

-- Volcando estructura para tabla vetsos.pet
CREATE TABLE IF NOT EXISTS `pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fk_specie_id` int(11) DEFAULT NULL,
  `fk_race_id` int(11) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` year(4) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pet_customer` (`fk_customer_id`) USING BTREE,
  KEY `FK_pet_specie` (`fk_specie_id`) USING BTREE,
  KEY `FK_pet_race` (`fk_race_id`) USING BTREE,
  CONSTRAINT `FK_pet_customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pet_race` FOREIGN KEY (`fk_race_id`) REFERENCES `race` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pet_specie` FOREIGN KEY (`fk_specie_id`) REFERENCES `specie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.pet: ~5 rows (aproximadamente)
INSERT INTO `pet` (`id`, `name`, `fk_specie_id`, `fk_race_id`, `weight`, `sex`, `age`, `color`, `fk_customer_id`, `created`, `updated`, `active`) VALUES
	(1, 'linda', 2, 1, '52 kg', 'masculino', '2039', 'cafe', 1, '2024-02-20 16:00:14', '2024-02-20 16:58:44', 1),
	(2, 'perla', 2, 2, '50', 'femenino', '2024', 'blanco', 3, '2024-02-20 17:06:30', '2024-02-20 17:06:40', 1),
	(3, 'maria', 1, 2, '2kg', 'femenino', '2040', 'celeste', 2, '2024-02-20 17:07:28', '2024-02-20 17:07:30', 1),
	(4, 'fosforo', 2, 1, '3kg', 'masculino', '2015', 'amarillo', 5, '2024-02-27 04:53:29', NULL, 1),
	(5, 'ana', 1, 2, '4kg', 'femenino', '2021', 'cafe', 4, '2024-02-27 04:53:28', NULL, NULL);

-- Volcando estructura para tabla vetsos.professional
CREATE TABLE IF NOT EXISTS `professional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `document` int(11) DEFAULT NULL,
  `schedule` varchar(50) DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.professional: ~3 rows (aproximadamente)
INSERT INTO `professional` (`id`, `name`, `lastname`, `document`, `schedule`, `specialty`, `telefono`, `created`, `updated`, `active`) VALUES
	(1, 'julian', 'ponton', 10252121, 'pelucquero', 'doctor cat', '12345678', '2024-02-20 14:56:17', '2024-02-20 14:56:06', 1),
	(2, 'ricardo veloz', 'sincelejo', 10252121, 'dentista', 'doctor cat', '3333333', '2024-02-25 16:19:29', '2024-02-27 05:44:35', 1),
	(3, 'monica', 'sincelejo', 10252121, 'dentista', 'doctor cat', '3333333', NULL, NULL, 1);

-- Volcando estructura para tabla vetsos.race
CREATE TABLE IF NOT EXISTS `race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_race` varchar(50) DEFAULT NULL,
  `fk_specie` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_race_specie` (`fk_specie`),
  CONSTRAINT `FK_race_specie` FOREIGN KEY (`fk_specie`) REFERENCES `specie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.race: ~7 rows (aproximadamente)
INSERT INTO `race` (`id`, `name_race`, `fk_specie`, `created`, `updated`, `active`) VALUES
	(1, 'schnauzer,', 1, '2024-02-20 14:57:46', '2024-02-20 14:57:45', 1),
	(2, 'Labrador', 1, '2024-02-27 04:28:14', '2024-02-27 04:30:24', 1),
	(3, 'Pastor Alemán', 1, '2024-02-27 04:30:18', '2024-02-27 04:30:23', 1),
	(4, 'Bulldog Francés', 1, '2024-02-27 04:30:15', '2024-02-27 04:30:20', 1),
	(5, 'Siamés', 2, '2024-02-27 04:30:18', '2024-02-27 04:30:22', 1),
	(6, 'Maine Coon', 2, '2024-02-27 04:30:17', '2024-02-27 04:30:21', 1),
	(7, 'mestizo', 2, '2024-02-27 04:30:16', '2024-02-27 04:30:20', 1);

-- Volcando estructura para tabla vetsos.service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_service` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `fk_category_id` int(11) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_service_category` (`fk_category_id`),
  CONSTRAINT `FK_service_category` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.service: ~2 rows (aproximadamente)
INSERT INTO `service` (`id`, `name_service`, `description`, `fk_category_id`, `updated`, `created`, `active`) VALUES
	(1, 'ecografia', 'citas de servcio medico', 1, '2024-02-20 15:02:22', '2024-02-20 15:02:19', 1),
	(2, 'peluqueria', 'servicio baño', 2, '2024-02-27 03:51:27', '2024-02-27 03:51:28', 1);

-- Volcando estructura para tabla vetsos.specie
CREATE TABLE IF NOT EXISTS `specie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeanimal` varchar(50) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.specie: ~3 rows (aproximadamente)
INSERT INTO `specie` (`id`, `typeanimal`, `active`) VALUES
	(1, 'canino', 1),
	(2, 'felino', 1),
	(3, 'otro', 1);

-- Volcando estructura para tabla vetsos.state
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.state: ~4 rows (aproximadamente)
INSERT INTO `state` (`id`, `estado`) VALUES
	(1, 'pendiente'),
	(2, 'active'),
	(3, 'postponed'),
	(4, 'finished');

-- Volcando estructura para tabla vetsos.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.test: ~4 rows (aproximadamente)
INSERT INTO `test` (`id`, `name`, `apellido`, `nacimiento`, `created`, `updated`, `active`) VALUES
	(1, 'daniel', 'ALVAREZ', '1999-02-19', '2024-02-19 15:53:59', '2024-02-19 18:01:21', 0),
	(3, 'kaskakskkaska', ' chacri2', '1992-07-07', NULL, '2024-02-25 17:53:13', 1),
	(4, 'paladin', 'heraldo', '1999-06-07', NULL, NULL, 1),
	(5, 'peluche', ' chacri', '1992-07-07', NULL, NULL, 1),
	(6, 'gerado', ' pastel', '1992-07-07', NULL, NULL, 1);

-- Volcando estructura para tabla vetsos.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vetsos.users: ~2 rows (aproximadamente)
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
	(1, 'daniel', 'dalvarez8@udi.edu.co', '1096253028', '2024-03-11 21:00:04', '2024-03-11 21:00:04'),
	(2, 'camilo', 'correo@example.com', 'contraseña', '2024-03-11 21:12:21', '2024-03-11 21:12:21');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;