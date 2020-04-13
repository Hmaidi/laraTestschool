-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.2.3-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for schooldata
CREATE DATABASE IF NOT EXISTS `schooldata` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `schooldata`;

-- Dumping structure for table schooldata.appointments
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `finish_time` datetime NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_fk_360714` (`client_id`),
  KEY `employee_fk_360715` (`employee_id`),
  CONSTRAINT `client_fk_360714` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `employee_fk_360715` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.appointments: ~0 rows (approximately)
DELETE FROM `appointments`;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;

-- Dumping structure for table schooldata.appointment_service
CREATE TABLE IF NOT EXISTS `appointment_service` (
  `appointment_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  KEY `appointment_id_fk_360720` (`appointment_id`),
  KEY `service_id_fk_360720` (`service_id`),
  CONSTRAINT `appointment_id_fk_360720` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_id_fk_360720` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.appointment_service: ~0 rows (approximately)
DELETE FROM `appointment_service`;
/*!40000 ALTER TABLE `appointment_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_service` ENABLE KEYS */;

-- Dumping structure for table schooldata.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.clients: ~0 rows (approximately)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `name`, `phone`, `adresse`, `responsable`, `specialite`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'School name', '967888', 'Tunis lafayette', 'Shan Ahmed', 'Administration Comptabilité + Informatique + Infographie', '2020-04-13 21:10:38', '2020-04-13 22:48:17', NULL),
	(2, 'tt', 'ttt', 'ttt', 'My Name', 'tt', '2020-04-13 22:01:50', '2020-04-13 23:06:01', '2020-04-13 23:06:01');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table schooldata.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomPrenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieuInscription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Groupe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Specialite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Datedenaissance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lieudenaissance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CIN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delivree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numphone1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numphone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateInscription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fraisinscrit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraisForm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Attestations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `casier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DescriptionCandidat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.employees: ~9 rows (approximately)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `NomPrenom`, `lieuInscription`, `Groupe`, `Specialite`, `Datedenaissance`, `Lieudenaissance`, `CIN`, `Delivree`, `Numphone1`, `Numphone2`, `DateInscription`, `Fraisinscrit`, `fraisForm`, `etat`, `Attestations`, `casier`, `DescriptionCandidat`, `photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(6, 'cxvc xcvx', 'ddd', 'gsdgds', 'fsf', '2020-04-14', 'gdsg', 'sdgs', '2020-04-06', '967259874', NULL, '2020-03-30', 'qsfqf', 'sqdsqd', '46565', 'fsqsqf', 'qsdq', 'http://127.0.0.1:8000/admin/employees', 'MADA-Logo_1586459319.png', '2020-04-09 19:08:39', '2020-04-09 21:29:46', '2020-04-09 21:29:46'),
	(7, 'cxvc xcvx', 'ddd', 'gsdgds', 'fsf', '2020-04-06', 'gdsg', '0888', '2020-03-10', '967259874', NULL, '2020-04-01', 'qsfqf', 'sqdsqd', '967259874967259874', 'fsqsqf', 'qsdq', 'Numphone2', 'smart_environment_icon_hover_1586459465.png', '2020-04-09 19:11:05', '2020-04-09 21:29:51', '2020-04-09 21:29:51'),
	(8, 'cxvc xcvx', 'ddd', 'gsdgds', 'fsf', '2020-04-13', 'gdsg', '0888', '2020-04-14', '967259874', NULL, '2020-04-15', 'qsfqf', 'sqdsqd', '46565', 'fsqsqf', 'qsdq', 'Lieudenaissance', 'smart_environment_icon_hover_1586463541.png', '2020-04-09 20:19:01', '2020-04-09 21:29:48', '2020-04-09 21:29:48'),
	(9, 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'fsf', '2020-04-13', 'cxvc xcvx999', '0888', '2020-03-30', '967259874', '967259874', '2020-03-31', 'cxvc xcvx999', 'sqdsqd', NULL, 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'smart_environment_icon_hover_1586467392.png', '2020-04-09 21:23:12', '2020-04-09 21:29:55', '2020-04-09 21:29:55'),
	(10, 'cxvc xcvx', 'cxvc xcvx999', 'cxvc xcvx999', 'fsf', '2020-04-13', 'cxvc xcvx999', '0888', '2020-04-22', '967259874', '967259874', '2020-03-31', 'cxvc xcvx999', 'sqdsqd', '46565', 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'avatar.png', '2020-04-09 21:24:27', '2020-04-09 21:29:53', '2020-04-09 21:29:53'),
	(11, 'cxvc xcvx', 'cxvc xcvx999', 'cxvc xcvx999', 'fsf', '2020-04-13', 'cxvc xcvx999', '0888', '2020-04-06', NULL, '967259874', '2020-03-31', 'cxvc xcvx999', 'sqdsqd', '46565', 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'avatar.png', '2020-04-09 21:24:54', '2020-04-09 21:29:41', '2020-04-09 21:29:41'),
	(12, 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'fsf', '2020-04-13', 'cxvc xcvx999', '0888', '2020-04-07', NULL, '967259874', '2020-03-31', 'cxvc xcvx999', 'sqdsqd', '46565', 'cxvc xcvx999', 'cxvc xcvx999', 'cxvc xcvx999', 'avatar.png', '2020-04-09 21:26:02', '2020-04-09 21:29:39', '2020-04-09 21:29:39'),
	(13, 'Numphone1Numphone15555666', 'Numphone1Numphone1Numphone1', 'Numphone1', 'Numphone1', '2020-04-07', 'Numphone1', 'Numphone1', '2020-04-07', 'Numphone1', 'Numphone1', '2020-03-30', 'Numphone1', 'Numphone1', 'Numphone1', 'Numphone1', 'Numphone1', 'Numphone1', 'smart_environment_icon_hover_1586467605.png', '2020-04-09 21:26:45', '2020-04-10 19:04:15', '2020-04-10 19:04:15'),
	(14, 'mohaddine', 'ddd', 'gsdgds', 'fsf', '2020-04-07 00:00:00', 'gdsg', '0888', '2020-04-14 00:00:00', '967259874', '967259874', '2020-04-14 00:00:00', 'qsfqf', 'sqdsqd', '46565', 'fsqsqf', 'qq', 'qqq', 'smart_environment_icon_hover_1586467858.png', '2020-04-09 21:30:58', '2020-04-11 17:14:07', '2020-04-11 17:14:07'),
	(15, 'Shan Ahmed', 'ddd', 'gsdgds', 'fsf', '2020-04-21 20:01:50', 'gdsg', '0888', '2020-04-14 20:01:58', '0502394020', '967259874', '2020-04-14 20:02:04', 'qsfqf', 'sqdsqd', '46565', 'fsqsqf', 'qsdq', 'Description Candidat*', 'avatar.png', '2020-04-10 19:03:24', '2020-04-10 19:03:24', NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table schooldata.employee_service
CREATE TABLE IF NOT EXISTS `employee_service` (
  `employee_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  KEY `employee_id_fk_360622` (`employee_id`),
  KEY `service_id_fk_360622` (`service_id`),
  CONSTRAINT `employee_id_fk_360622` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_id_fk_360622` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.employee_service: ~0 rows (approximately)
DELETE FROM `employee_service`;
/*!40000 ALTER TABLE `employee_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_service` ENABLE KEYS */;

-- Dumping structure for table schooldata.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.media: ~0 rows (approximately)
DELETE FROM `media`;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table schooldata.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.migrations: ~19 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(5, '2016_06_01_000004_create_oauth_clients_table', 1),
	(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(7, '2019_09_19_000000_create_media_table', 1),
	(8, '2019_09_19_000001_create_permissions_table', 1),
	(9, '2019_09_19_000002_create_roles_table', 1),
	(10, '2019_09_19_000003_create_users_table', 1),
	(11, '2019_09_19_000004_create_services_table', 1),
	(12, '2019_09_19_000005_create_employees_table', 2),
	(13, '2019_09_19_000006_create_clients_table', 2),
	(14, '2019_09_19_000007_create_appointments_table', 2),
	(15, '2019_09_19_000008_create_permission_role_pivot_table', 2),
	(16, '2019_09_19_000009_create_role_user_pivot_table', 2),
	(17, '2019_09_19_000010_create_employee_service_pivot_table', 2),
	(18, '2019_09_19_000011_create_appointment_service_pivot_table', 2),
	(19, '2019_09_19_000012_add_relationship_fields_to_appointments_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table schooldata.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.oauth_access_tokens: ~0 rows (approximately)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table schooldata.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.oauth_auth_codes: ~0 rows (approximately)
DELETE FROM `oauth_auth_codes`;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table schooldata.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.oauth_clients: ~0 rows (approximately)
DELETE FROM `oauth_clients`;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table schooldata.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.oauth_personal_access_clients: ~0 rows (approximately)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table schooldata.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.oauth_refresh_tokens: ~0 rows (approximately)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table schooldata.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table schooldata.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.permissions: ~36 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'user_management_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(2, 'permission_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(3, 'permission_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(4, 'permission_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(5, 'permission_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(6, 'permission_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(7, 'role_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(8, 'role_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(9, 'role_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(10, 'role_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(11, 'role_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(12, 'user_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(13, 'user_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(14, 'user_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(15, 'user_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(16, 'user_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(17, 'service_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(18, 'service_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(19, 'service_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(20, 'service_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(21, 'service_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(22, 'employee_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(23, 'employee_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(24, 'employee_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(25, 'employee_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(26, 'employee_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(27, 'client_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(28, 'client_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(29, 'client_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(30, 'client_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(31, 'client_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(32, 'appointment_create', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(33, 'appointment_edit', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(34, 'appointment_show', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(35, 'appointment_delete', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL),
	(36, 'appointment_access', '2019-09-19 12:14:15', '2019-09-19 12:14:15', NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table schooldata.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  KEY `role_id_fk_360589` (`role_id`),
  KEY `permission_id_fk_360589` (`permission_id`),
  CONSTRAINT `permission_id_fk_360589` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_id_fk_360589` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.permission_role: ~56 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35),
	(1, 36),
	(2, 17),
	(2, 18),
	(2, 19),
	(2, 20),
	(2, 21),
	(2, 22),
	(2, 23),
	(2, 24),
	(2, 25),
	(2, 26),
	(2, 27),
	(2, 28),
	(2, 29),
	(2, 30),
	(2, 31),
	(2, 32),
	(2, 33),
	(2, 34),
	(2, 35),
	(2, 36);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table schooldata.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Admin', '2019-09-19 12:08:28', '2019-09-19 12:08:28', NULL),
	(2, 'User', '2019-09-19 12:08:28', '2019-09-19 12:08:28', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table schooldata.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  KEY `user_id_fk_360598` (`user_id`),
  KEY `role_id_fk_360598` (`role_id`),
  CONSTRAINT `role_id_fk_360598` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_360598` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.role_user: ~0 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table schooldata.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.services: ~10 rows (approximately)
DELETE FROM `services`;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `name`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'in', 41.00, '2020-04-09 11:44:12', '2020-04-09 11:44:12', NULL),
	(2, 'maxime', 27.00, '2020-04-09 11:44:12', '2020-04-09 11:44:12', NULL),
	(3, 'quo', 77.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(4, 'quis', 48.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(5, 'repellendus', 48.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(6, 'laborum', 21.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(7, 'aliquid', 43.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(8, 'omnis', 29.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(9, 'ipsa', 83.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL),
	(10, 'enim', 67.00, '2020-04-09 11:44:13', '2020-04-09 11:44:13', NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table schooldata.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table schooldata.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$Y.jEitizf.DW3V7gxCnMr.SdWN2i1w4gobo28vTLGaFajqcjUl8Oy', NULL, '2019-09-19 12:08:28', '2019-09-19 12:08:28', NULL),
	(2, 'Shan Ahmed', 'Ahmed@admin.com', NULL, '$2y$10$2WVlm9hsk9Q29PGDBiFB8uQP4nwygDTY4B.EPNqRUruX7dVVUtEIa', NULL, '2020-04-10 19:04:44', '2020-04-10 19:04:44', NULL),
	(101, 'My Name', 'Sofien@gmail.com', NULL, '$2y$10$rlq/ST2jFGYhZlC/fWmKhOwwvX2YTe5OXPRBv4HGNNumQTzr1Q3Be', NULL, '2020-04-12 17:19:21', '2020-04-12 17:19:21', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
