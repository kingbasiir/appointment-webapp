-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 17, 2022 at 03:36 AM
-- Server version: 5.7.36
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `callcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

DROP TABLE IF EXISTS `ea_appointments`;
CREATE TABLE IF NOT EXISTS `ea_appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text,
  `notes` text,
  `hash` text,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT '0',
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text,
  PRIMARY KEY (`id`),
  KEY `id_users_provider` (`id_users_provider`),
  KEY `id_users_customer` (`id_users_customer`),
  KEY `id_services` (`id_services`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `is_unavailable`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`) VALUES
(1, '2022-05-11 02:46:34', '2022-05-11 09:15:00', '2022-05-11 09:30:00', '', '', 'nw0ScAsPJR3x', 0, 4, 6, 1, NULL),
(3, '2022-05-11 06:32:05', '2022-05-11 15:15:00', '2022-05-11 15:30:00', '', '', 'iP3mbArZ4DgN', 0, 8, 7, 1, NULL),
(9, '2022-05-12 03:17:41', '2022-05-13 10:00:00', '2022-05-13 10:15:00', '', '', 'sMuYFqNPSk5f', 0, 4, 6, 1, NULL),
(19, '2022-05-13 08:43:07', '2022-05-19 09:00:00', '2022-05-19 09:30:00', NULL, '', '7x5NdcZnbi3I', 0, 4, 18, 2, NULL),
(20, '2022-05-13 08:45:49', '2022-05-20 09:30:00', '2022-05-20 10:00:00', NULL, '', 'qnzDBPxJAo7m', 0, 4, 19, 2, NULL),
(21, '2022-05-13 08:47:49', '2022-05-24 09:30:00', '2022-05-24 10:00:00', NULL, '', 'MNvaklropEI4', 0, 4, 18, 2, NULL),
(22, '2022-05-13 08:49:59', '2022-05-13 17:00:00', '2022-05-13 17:15:00', 'Orchard', '', 'j0BK74oNUegb', 0, 4, 6, 1, NULL),
(23, '2022-05-17 01:57:27', '2022-05-18 09:00:00', '2022-05-18 10:00:00', NULL, '', 'PntJ6csDOeX2', 0, 4, 19, 1, NULL),
(24, '2022-05-17 02:10:48', '2022-05-17 10:00:00', '2022-05-17 11:00:00', NULL, '', 'OiLmVDXryNZ7', 0, 4, 19, 1, NULL),
(25, '2022-05-17 02:22:12', '2022-05-17 11:15:00', '2022-05-17 12:15:00', NULL, '', 'u4WnodEOpcGb', 0, 4, 19, 1, NULL),
(26, '2022-05-17 02:45:01', '2022-05-20 09:00:00', '2022-05-20 09:30:00', NULL, '', 'JrHLuUMTgh0E', 0, 8, 20, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

DROP TABLE IF EXISTS `ea_consents`;
CREATE TABLE IF NOT EXISTS `ea_consents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

DROP TABLE IF EXISTS `ea_migrations`;
CREATE TABLE IF NOT EXISTS `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

DROP TABLE IF EXISTS `ea_roles`;
CREATE TABLE IF NOT EXISTS `ea_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

DROP TABLE IF EXISTS `ea_secretaries_providers`;
CREATE TABLE IF NOT EXISTS `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL,
  PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  KEY `secretaries_users_provider` (`id_users_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_secretaries_providers`
--

INSERT INTO `ea_secretaries_providers` (`id_users_secretary`, `id_users_provider`) VALUES
(5, 4),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

DROP TABLE IF EXISTS `ea_services`;
CREATE TABLE IF NOT EXISTS `ea_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text,
  `location` text,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT '1',
  `id_service_categories` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service_categories` (`id_service_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `location`, `availabilities_type`, `attendants_number`, `id_service_categories`) VALUES
(1, 'Consultation', 60, '100.00', 'SGD', '', '', 'flexible', 1, NULL),
(2, 'Free Consulation', 30, '0.00', '', '', '', 'flexible', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

DROP TABLE IF EXISTS `ea_services_providers`;
CREATE TABLE IF NOT EXISTS `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL,
  PRIMARY KEY (`id_users`,`id_services`),
  KEY `services_providers_services` (`id_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(4, 1),
(8, 1),
(4, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

DROP TABLE IF EXISTS `ea_service_categories`;
CREATE TABLE IF NOT EXISTS `ea_service_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_service_categories`
--

INSERT INTO `ea_service_categories` (`id`, `name`, `description`) VALUES
(1, 'General Law', ''),
(2, 'Marriage Law', ''),
(3, 'House Law', '');

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

DROP TABLE IF EXISTS `ea_settings`;
CREATE TABLE IF NOT EXISTS `ea_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}'),
(2, 'book_advance_timeout', '30'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'DMY'),
(6, 'require_captcha', '0'),
(7, 'time_format', 'regular'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'first_weekday', 'sunday'),
(15, 'require_phone_number', '1'),
(16, 'api_token', ''),
(17, 'display_any_provider', '1'),
(18, 'company_name', 'Call Center Demo'),
(19, 'company_email', 'muhdbasiir@gmail.com'),
(20, 'company_link', 'www.sysniq.my');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

DROP TABLE IF EXISTS `ea_users`;
CREATE TABLE IF NOT EXISTS `ea_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `id_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_roles` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `id_roles`) VALUES
(1, 'Muhd Basiir ', 'Zulkifle', 'muhdbasiir@gmail.com', '', '0137828478', '', '', '', '', '', 'Asia/Kuala_Lumpur', 'english', 1),
(4, 'Lawyer', 'Number One', 'lawyer1@2vr360.online', '', '0117828478', '', '', '', '', '', 'Asia/Kuala_Lumpur', 'english', 2),
(5, 'Telemarketer', 'Number 1', 'telemarketer1@2vr360.online', '', '0137828478', '', '', '', '', '', 'Asia/Kuala_Lumpur', 'english', 4),
(6, 'Aiman', 'Customer 1', 'muhdaimanaziz93@gmail.com', NULL, '0137821234', '', '', NULL, '', '', 'Asia/Kuala_Lumpur', 'english', 3),
(7, 'Hamirul ', 'Customer 2', 'hamirul.dev@gmail.com', NULL, '0131234567', '', '', NULL, '', '', 'Asia/Kuala_Lumpur', 'english', 3),
(8, 'Lawyer', ' Number Two', 'muhdbasiir@gmail.com', '', '0137828478', 'No 01-06, 1', 'JOHOR BAHRU', 'JOHOR', '81200', '', 'Asia/Kuala_Lumpur', 'english', 2),
(18, 'MUHD BASIIR', 'ZULKIFLE', 'benborn2code@gmail.com', NULL, '0161231234', 'No 01-06, 1, Jalan Seroja Indah, Taman Seroja', 'JOHOR BAHRU', NULL, '81200', '', 'Asia/Kuala_Lumpur', 'english', 3),
(19, 'MUHD BASIIR', 'ZULKIFLE', 'muhdbasiir@gmail.com', NULL, '0141231236', 'No 01-06, 1, Jalan Seroja Indah, Taman Seroja', 'JOHOR BAHRU', NULL, '81200', NULL, 'Asia/Kuala_Lumpur', 'english', 3),
(20, 'MUHD BASIIR', 'ZULKIFLE', 'softwareu1@i-smart.com.sg', NULL, '0131231234', 'No 01-06, 1, Jalan Seroja Indah, Taman Seroja', 'JOHOR BAHRU', NULL, '81200', NULL, 'Asia/Kuala_Lumpur', 'english', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

DROP TABLE IF EXISTS `ea_user_settings`;
CREATE TABLE IF NOT EXISTS `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text,
  `working_plan_exceptions` text,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT '30',
  `sync_future_days` int(11) DEFAULT '90',
  `calendar_view` varchar(32) DEFAULT 'default',
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'superuser', 'e169d4a89f3401258527469a55602b16b896ee3dbb468ce6f5852d326627adeb', 'ab20a01a8f52d5d25ff6dc4586440a9d2ca99489a3857f04e4a838209f2ba118', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(4, 'lawyer1', 'c05578dea0496d945997f01d7f9f645a6ac7018c15ca8bbb819ba694e810f147', '1834446870625ec2ddad6d055000ad89d8501921b2c34662976e9299f31f49cd', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default'),
(5, 'telemarketer1', 'db0943d8b71e7a27fa5af7e33250087a05ab35256fc6fc7690f9ff5b73bb7ac7', '3fc15cde30136ad6097b63615c5e607c32158270531727f689937fc163bc3e48', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(8, 'lawyer2', 'f99838d084ed991352eca43bd45be37250f895b74dd3d8ae49a5e6ef3d1daeaa', '762c20612f1c00227aabc74fa8c5cb8f661321b60f5e6a7ed7aab936dc3b7c58', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
