-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for konux_sdi
CREATE DATABASE IF NOT EXISTS `konux_sdi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `konux_sdi`;

-- Dumping structure for table konux_sdi.konux_accelerometer_y
CREATE TABLE IF NOT EXISTS `konux_accelerometer_y` (
  `sen_platform_code` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `TS_CREATION` timestamp NULL DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table konux_sdi.konux_accelerometer_y: ~12 rows (approximately)
/*!40000 ALTER TABLE `konux_accelerometer_y` DISABLE KEYS */;
INSERT INTO `konux_accelerometer_y` (`sen_platform_code`, `value`, `TS_CREATION`) VALUES
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41');
/*!40000 ALTER TABLE `konux_accelerometer_y` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_accelerometer_z
CREATE TABLE IF NOT EXISTS `konux_accelerometer_z` (
  `sen_platform_code` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `TS_CREATION` timestamp NULL DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table konux_sdi.konux_accelerometer_z: ~12 rows (approximately)
/*!40000 ALTER TABLE `konux_accelerometer_z` DISABLE KEYS */;
INSERT INTO `konux_accelerometer_z` (`sen_platform_code`, `value`, `TS_CREATION`) VALUES
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41');
/*!40000 ALTER TABLE `konux_accelerometer_z` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_battery
CREATE TABLE IF NOT EXISTS `konux_battery` (
  `sen_platform_code` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `TS_CREATION` timestamp NULL DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table konux_sdi.konux_battery: ~7 rows (approximately)
/*!40000 ALTER TABLE `konux_battery` DISABLE KEYS */;
INSERT INTO `konux_battery` (`sen_platform_code`, `value`, `TS_CREATION`) VALUES
	('PT001', 10.4, '2018-08-12 13:51:41'),
	('PT001', 11.4, '2018-08-12 13:51:41'),
	('PT001', 12.1, '2018-08-12 13:51:41'),
	('PT001', 11.4, '2018-08-12 13:51:41'),
	('PT001', 10.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41');
/*!40000 ALTER TABLE `konux_battery` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_configuration
CREATE TABLE IF NOT EXISTS `konux_configuration` (
  `con_id` int(11) NOT NULL,
  `con_valid_from` datetime DEFAULT NULL,
  `con_valid_to` datetime DEFAULT NULL,
  `con_accelerometer_z` text DEFAULT NULL COMMENT 'I save the description of the used configuration. Ex. 20Khz for data collection, or 10Khz etc...',
  `con_accelerometer_y` text DEFAULT NULL COMMENT 'I save the description of the used configuration. Ex. 20Khz for data collection, or 10Khz etc...',
  `con_temperature` text DEFAULT NULL COMMENT 'I save the description of the used configuration. Ex. 20Khz for data collection, or 10Khz etc...',
  `con_battery` text DEFAULT NULL COMMENT 'I save the description of the used configuration. Ex. 20Khz for data collection, or 10Khz etc...',
  `con_gyroscope` text DEFAULT NULL COMMENT 'I save the description of the used configuration. Ex. 20Khz for data collection, or 10Khz etc...',
  `TS_CREATION` timestamp NULL DEFAULT current_timestamp(),
  `TS_LS_UPDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`con_id`)
) ENGINE=Aria  DEFAULT CHARSET=latin1;

-- Dumping data for table konux_sdi.konux_configuration: ~4 rows (approximately)
/*!40000 ALTER TABLE `konux_configuration` DISABLE KEYS */;
INSERT INTO `konux_configuration` (`con_id`, `con_valid_from`, `con_valid_to`, `con_accelerometer_z`, `con_accelerometer_y`, `con_temperature`, `con_battery`, `con_gyroscope`, `TS_CREATION`, `TS_LS_UPDATE`) VALUES
	(1,'2018-08-13 00:00:00', '2018-08-23 00:00:00', '20Khz', '10Ghz', 'celsius', 'Volt', '10Khz', '2018-08-13 12:26:30', '2018-08-13 12:26:30'),
	(2,'2018-08-12 00:00:00', '2018-08-12 00:00:00', '20Khz', '10Ghz', 'celsius', 'Volt', '10Khz', '2018-08-13 12:26:40', '2018-08-13 12:26:40'),
	(3,'2018-08-12 00:00:00', '2018-08-12 00:00:00', '20Khz', '100khz', 'celsius', 'Volt', '10Khz', '2018-08-13 12:26:49', '2018-08-13 12:26:49'),
	(4,'2018-08-10 00:00:00', '2018-08-13 00:00:00', '20Khz', '20khz', 'celsius', 'Volt', '10Khz', '2018-08-13 12:26:58', '2018-08-13 12:26:58');
/*!40000 ALTER TABLE `konux_configuration` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_gyroscope
CREATE TABLE IF NOT EXISTS `konux_gyroscope` (
  `sen_platform_code` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `TS_CREATION` timestamp NULL DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

-- Dumping data for table konux_sdi.konux_gyroscope: ~8 rows (approximately)
/*!40000 ALTER TABLE `konux_gyroscope` DISABLE KEYS */;
INSERT INTO `konux_gyroscope` (`sen_platform_code`, `value`, `TS_CREATION`) VALUES
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41'),
	('PT001', 53.4, '2018-08-12 13:51:41'),
	('PT001', 5.1, '2018-08-12 13:51:41');
/*!40000 ALTER TABLE `konux_gyroscope` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_switch
CREATE TABLE IF NOT EXISTS `konux_switch` (
  `swi_id` int(11) DEFAULT NULL COMMENT 'Id of the switch where the platform is installed',
  `swi_component` char(2) DEFAULT NULL COMMENT 'Component F or P of the switch',
  `swi_type` char(2) DEFAULT NULL COMMENT 'Switch type K or M',
  `swi_gis` point DEFAULT NULL COMMENT 'Geo Coordinate of the Switch component',
  `swi_location` char(2) DEFAULT NULL COMMENT 'Location A B or C',
  `sen_platform_code` varchar(10) NOT NULL,
  `TS_CREATION` timestamp NOT NULL DEFAULT current_timestamp(),
  `TS_LS_UPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=latin1 CHECKSUM=1;

-- Dumping data for table konux_sdi.konux_switch: ~8 rows (approximately)
/*!40000 ALTER TABLE `konux_switch` DISABLE KEYS */;
INSERT INTO `konux_switch` (`swi_id`, `swi_component`, `swi_type`, `swi_gis`, `swi_location`, `sen_platform_code`, `TS_CREATION`, `TS_LS_UPDATE`) VALUES
	(2, 'F', 'M', _binary 0x00000000010100000000000000008045400000000000004B40, 'A', 'PT001', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(2, 'P', 'K', _binary 0x00000000010100000000000000008045400000000000004B40, 'A', 'PT002', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(1, 'P', 'M', _binary 0x00000000010100000000000000008045400000000000004B40, 'C', 'PT003', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(1, 'F', 'M', _binary 0x00000000010100000000000000008045400000000000004B40, 'B', 'PT004', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(3, 'F', 'M', _binary 0x00000000010100000000000000008045400000000000004B40, 'B', 'PT005', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(4, 'P', 'K', _binary 0x00000000010100000000000000008045400000000000004B40, 'B', 'PT002', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(4, 'P', 'K', _binary 0x00000000010100000000000000008045400000000000004B40, 'B', 'PT001', '2018-08-13 12:31:17', '2018-08-13 12:31:17'),
	(5, 'P', 'M', _binary 0x00000000010100000000000000008045400000000000004B40, 'C', 'PT006', '2018-08-13 13:53:09', '2018-08-13 13:53:09');
/*!40000 ALTER TABLE `konux_switch` ENABLE KEYS */;

-- Dumping structure for table konux_sdi.konux_temperature
CREATE TABLE IF NOT EXISTS `konux_temperature` (
  `sen_platform_code` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `TS_CREATION` timestamp NULL DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table konux_sdi.konux_temperature: ~13 rows (approximately)
/*!40000 ALTER TABLE `konux_temperature` DISABLE KEYS */;
INSERT INTO `konux_temperature` (`sen_platform_code`, `value`, `TS_CREATION`) VALUES
	('PT001',53.4,'2018-08-12 13:51:41'),
	('PT001',5.1,'2018-08-12 13:51:41'),
	('PT001',53.4,'2018-08-12 13:51:41'),
	('PT001',5.1,'2018-08-12 13:51:41'),
	('PT001',53.4,'2018-08-12 13:51:41'),
	('PT001',5.1,'2018-08-12 13:51:41'),
	('PT001',3.4,'2018-08-12 13:51:41'),
	('PT002',-20,'2018-08-13 10:00:41'),
	('PT002',-10,'2018-08-13 10:00:41'),
	('PT003',-3,'2018-08-13 10:00:41'),
	('PT002',-1,'2018-08-13 10:00:41'),
	('PT002',-1,'2018-08-12 10:00:41'),
	('PT006',-1,'2018-08-12 10:00:41');
/*!40000 ALTER TABLE `konux_temperature` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
