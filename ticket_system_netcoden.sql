-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 29, 2024 at 12:57 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_system_netcoden`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `group_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `order` int DEFAULT NULL,
  `status` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `group_name`, `image`, `meta_title`, `meta_description`, `meta_keyword`, `order`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bug', 'bug', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 1, 1, NULL, '2024-09-28 12:19:25', '2024-09-28 12:19:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Ticket\\Models\\Ticket', 1, '17286840-f6f3-49d9-8963-c5992b2f38af', 'tickets', 'Screenshot_30', 'bqMzO8Zte7qzQDf9kyui9gCXYHvG5OGPmUkY5qA6.png', 'image/png', 'media', 'media', 588022, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 06:01:02', '2024-09-29 06:01:05'),
(2, 'Modules\\Ticket\\Models\\Ticket', 2, 'd11a2e33-d423-4eda-9405-2f35009017f7', 'tickets', 'Screenshot_31', 'dAYiVCZtGJRSjwWBBBD0bd0PgMzPEcw4DjsMnP9i.png', 'image/png', 'media', 'media', 50070, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 06:05:07', '2024-09-29 06:05:08'),
(3, 'Modules\\Ticket\\Models\\Ticket', 3, '3a4fa8ba-6a9a-4e5f-b8ca-674ce1a8d59d', 'tickets', 'Screenshot_51', '9XMCaP0KikDOiQzfAP25nxjXqSx5KF9XfaNbE0A8.png', 'image/png', 'media', 'media', 19361, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 06:07:43', '2024-09-29 06:07:44'),
(4, 'Modules\\Ticket\\Models\\Ticket', 4, 'e7784c6b-d42f-489d-8023-340d4c73c46a', 'tickets', 'Screenshot_43', 'BC3Xn4UJVYta1QkLgTdNU5KCssrmVvGt1nUcrxsv.png', 'image/png', 'media', 'media', 874775, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 08:38:13', '2024-09-29 08:38:14'),
(5, 'Modules\\Ticket\\Models\\Ticket', 5, 'f4a0146f-6698-4f0f-9f95-087b330ac235', 'tickets', 'Screenshot_31', 'lYzA4B8ctv3MBExxzL8hxWHs701qsjPWVsrQYJSZ.png', 'image/png', 'media', 'media', 50070, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 08:55:32', '2024-09-29 08:55:35'),
(6, 'Modules\\Ticket\\Models\\Ticket', 6, '8cda9d99-c3ff-4823-90ba-192e8c9ee9c2', 'tickets', 'Screenshot_31', 'kCle6PaXsA1Nj9SvY4S85ls9lu0kX4GDVYxj5coD.png', 'image/png', 'media', 'media', 50070, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-09-29 08:56:00', '2024-09-29 08:56:01'),
(7, 'Modules\\Ticket\\Models\\Ticket', 1, 'fe19948b-2c0a-43f7-87e1-03712a67b3cd', 'tickets', 'Screenshot_2', 'EVX14UPJ7AfhkmZ3VS9QC7s5XtaIKKZxS8lp7bXq.png', 'image/png', 'media', 'media', 131041, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 2, '2024-09-29 12:32:45', '2024-09-29 12:32:46'),
(8, 'Modules\\Ticket\\Models\\Ticket', 2, 'd695987d-1645-47c4-af47-24d768831bd4', 'tickets', 'Screenshot_51', 'PDQWbsQwO8ESoLnzpZe5HWNM74BP4Axcwdk1ubm4.png', 'image/png', 'media', 'media', 19361, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 2, '2024-09-29 12:42:16', '2024-09-29 12:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_22_233017_add_profile_columns_to_users_table', 1),
(5, '2024_03_23_023114_create_permission_tables', 1),
(6, '2024_03_23_025255_create_media_table', 1),
(7, '2024_03_24_145514_create_settings_table', 1),
(8, '2024_03_24_151236_create_notifications_table', 1),
(9, '2024_03_24_195455_create_user_providers_table', 1),
(10, '2024_03_26_013544_create_activity_log_table', 1),
(11, '2024_03_26_013545_add_event_column_to_activity_log_table', 1),
(12, '2024_03_26_013546_add_batch_uuid_column_to_activity_log_table', 1),
(13, '2024_04_06_020035_create_posts_table', 1),
(14, '2024_04_06_031129_create_categories_table', 1),
(15, '2024_04_06_033820_create_tags_table', 1),
(16, '2024_04_06_154118_create_polymorphic_taggables_table', 1),
(17, '2024_09_28_052558_create_tickets_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_backend', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(2, 'edit_settings', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(3, 'view_logs', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(4, 'view_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(5, 'add_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(6, 'edit_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(7, 'edit_users_permissions', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(8, 'delete_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(9, 'restore_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(10, 'block_users', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(11, 'view_roles', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(12, 'add_roles', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(13, 'edit_roles', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(14, 'delete_roles', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(15, 'restore_roles', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(16, 'view_backups', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(17, 'add_backups', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(18, 'create_backups', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(19, 'download_backups', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(20, 'delete_backups', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(21, 'view_posts', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(22, 'add_posts', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(23, 'edit_posts', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(24, 'delete_posts', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(25, 'restore_posts', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(26, 'view_categories', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(27, 'add_categories', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(28, 'edit_categories', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(29, 'delete_categories', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(30, 'restore_categories', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(31, 'view_tags', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(32, 'add_tags', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(33, 'edit_tags', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(34, 'delete_tags', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(35, 'restore_tags', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(36, 'view_comments', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(37, 'add_comments', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(38, 'edit_comments', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(39, 'delete_comments', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(40, 'restore_comments', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `category_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` int DEFAULT NULL,
  `image` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_og_image` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_og_url` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `order` int DEFAULT NULL,
  `status` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Published',
  `moderated_by` int UNSIGNED DEFAULT NULL,
  `moderated_at` datetime DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_by_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_alias` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(2, 'administrator', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35'),
(5, 'user', 'web', '2024-09-28 10:52:35', '2024-09-28 10:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `type`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'app_name', 'Laravel Starter', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(2, 'app_description', 'A Ticket Support System', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(3, 'footer_text', 'Built with Laravel', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:58', NULL),
(4, 'show_copyright', '1', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(5, 'email', 'info@example.com', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(6, 'website_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:58', NULL),
(7, 'facebook_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(8, 'twitter_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:59', NULL),
(9, 'instagram_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:59', NULL),
(10, 'youtube_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:59', NULL),
(11, 'linkedin_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(12, 'whatsapp_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(13, 'messenger_url', '#', 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(14, 'meta_site_name', 'Laravel Support', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:59', NULL),
(15, 'meta_description', 'Laravel Starter is a CMS like modular starter application project built with latest Laravel. This starter project can be used as a foundation to build your own projects.', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(16, 'meta_keyword', 'Web Application, web app, Laravel, Laravel starter, Bootstrap, Admin, Template, Open Source, nasir khan saikat, nasirkhansaikat', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(17, 'meta_image', 'img/default_banner.jpg', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(18, 'meta_fb_app_id', '569561286532601', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(19, 'meta_twitter_site', '@nasirkhansaikat', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(20, 'meta_twitter_creator', '@nasirkhansaikat', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(21, 'google_analytics', 'G-ABCDE12345', 'text', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL),
(22, 'custom_css_block', NULL, 'string', 1, 1, NULL, '2024-09-28 12:39:10', '2024-09-28 12:39:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `file` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Open',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `title`, `message`, `user_id`, `category_id`, `file`, `status`, `created_by`, `updated_by`, `deleted_by`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'i found a bug', 'when i login error', 5, NULL, '/storage/media/7/EVX14UPJ7AfhkmZ3VS9QC7s5XtaIKKZxS8lp7bXq.png', 'Closed', 5, 1, NULL, NULL, '2024-09-29 12:32:45', '2024-09-29 12:33:27', NULL),
(2, 'support test ticket', 'Support ticket description', 5, NULL, '/storage/media/8/PDQWbsQwO8ESoLnzpZe5HWNM74BP4Axcwdk1ubm4.png', 'Closed', 5, 1, NULL, NULL, '2024-09-29 12:42:15', '2024-09-29 12:43:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `social_profiles` json DEFAULT NULL,
  `avatar` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_count` int NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `mobile`, `gender`, `date_of_birth`, `address`, `bio`, `social_profiles`, `avatar`, `last_ip`, `login_count`, `last_login`, `status`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '100001', 'Super Admin', 'Super', 'Admin', 'super@admin.com', '2024-09-28 10:52:33', '$2y$12$Ojw.jtkcxcObMHvJYWMtEubXHtprn6mMc.kQcm7siFJDDQbjhM2de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 6, '2024-09-29 12:40:18', 1, NULL, 1, NULL, NULL, '2024-09-28 10:52:33', '2024-09-29 12:40:18', NULL),
(2, '100002', 'Admin Istrator', 'Admin', 'Istrator', 'admin@admin.com', '2024-09-28 10:52:34', '$2y$12$WS7dT3TYd1SZAX6Hh7S6heRNnD97FXypFrLel6fsqZtHVa9nwln0q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-28 10:52:34', '2024-09-28 10:52:34', NULL),
(5, '100005', 'General User', 'General', 'User', 'user@user.com', '2024-09-28 10:52:34', '$2y$12$Dm56vXPIN57yoxGVTS46jeYOEXHBC8AnZhlxtnAb0yShixkFCN/bm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 10, '2024-09-29 12:41:02', 1, NULL, 5, NULL, NULL, '2024-09-28 10:52:34', '2024-09-29 12:41:02', NULL),
(6, '100006', 'User2 Test', 'User2', 'Test', 'user2@gmail.com', '2024-09-28 12:40:31', '$2y$12$Ojw.jtkcxcObMHvJYWMtEubXHtprn6mMc.kQcm7siFJDDQbjhM2de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 3, '2024-09-29 12:43:54', 1, 1, 6, NULL, NULL, '2024-09-28 12:38:19', '2024-09-29 12:43:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_providers`
--

DROP TABLE IF EXISTS `user_providers`;
CREATE TABLE IF NOT EXISTS `user_providers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `provider` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_providers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_providers`
--
ALTER TABLE `user_providers`
  ADD CONSTRAINT `user_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
