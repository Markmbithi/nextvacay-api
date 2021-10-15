-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.26 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nextvacay
CREATE DATABASE IF NOT EXISTS `nextvacay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nextvacay`;

-- Dumping structure for table nextvacay.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table nextvacay.login_tokens
CREATE TABLE IF NOT EXISTS `login_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumed_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_tokens_token_unique` (`token`),
  KEY `login_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `login_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.login_tokens: ~17 rows (approximately)
/*!40000 ALTER TABLE `login_tokens` DISABLE KEYS */;
INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `consumed_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(53, 2, '$2y$10$EC.NuL1Nk5hCFS7GPh6.q.t8/EYxY8FlpP7.VSjKgUUGzPulKL94i', NULL, '2021-10-13 20:58:48', '2021-10-13 20:48:48', '2021-10-13 20:48:48'),
	(54, 2, '$2y$10$HVfV2t.1gKa0ny6RCFgg9eb1PsfxA0gxOKIv4KKk5gS4FwZ7q2bji', NULL, '2021-10-13 21:04:31', '2021-10-13 20:54:31', '2021-10-13 20:54:31'),
	(55, 2, '$2y$10$JeUIleZVqFGehtMUtExKu.EiM3ZfaRmo1Q8xqcCsJyXV5RKfcGNNe', NULL, '2021-10-13 21:05:53', '2021-10-13 20:55:53', '2021-10-13 20:55:53'),
	(56, 2, '$2y$10$quiYsHtWWt5C9sG8NaUmqusvsOIn9AfDB8TclGOtXRNkyUFp7CJ9.', NULL, '2021-10-13 21:11:12', '2021-10-13 21:01:12', '2021-10-13 21:01:12'),
	(57, 2, '$2y$10$w7DKlffXgCHts1znbwKOie8oKQHIWdKnnnWGSvyKCWrc5kb.rKuwG', NULL, '2021-10-13 21:12:55', '2021-10-13 21:02:55', '2021-10-13 21:02:55'),
	(58, 2, '$2y$10$HY6hoYWNZ3EarW.rFWh56Oq/D6VDjnVrfg0sIqxiRKD93nbU5OeBu', '2021-10-13 21:06:45', '2021-10-13 21:15:16', '2021-10-13 21:05:16', '2021-10-13 21:06:45'),
	(59, 2, '$2y$10$v7NuxMg/dgNn0JongIgLqe//fqydv5JQdypcllohb2R/csIU8QiSG', '2021-10-13 21:09:54', '2021-10-13 21:18:58', '2021-10-13 21:08:58', '2021-10-13 21:09:54'),
	(60, 2, '$2y$10$oblCo0NOT2.l6iXltCZYd.2GoGu/dhsn1WZM3vHiWu345NvYPsw5y', NULL, '2021-10-13 21:19:18', '2021-10-13 21:09:18', '2021-10-13 21:09:18'),
	(61, 2, '$2y$10$l1W9kh4D1i2VRkn9s7vMouaVDbvkAl//w3/Bun3T4aSVkhhjVBvVu', '2021-10-13 21:11:53', '2021-10-13 21:21:15', '2021-10-13 21:11:15', '2021-10-13 21:11:53'),
	(62, 2, '$2y$10$skj0JLRQPYXOaSmZAPHej.dD8CHexobRxMvCJ2luU0wT9O7a5d/LK', '2021-10-13 21:27:27', '2021-10-13 21:37:21', '2021-10-13 21:27:21', '2021-10-13 21:27:27'),
	(63, 2, '$2y$10$r4KtzefywKvNHHXqGYxMruQKl7XryBFVCcnoHm5nWHvN3h5jD3jlO', '2021-10-13 21:28:49', '2021-10-13 21:38:40', '2021-10-13 21:28:40', '2021-10-13 21:28:49'),
	(64, 2, '$2y$10$0flBzUCfqctpv0ajQKW7XOK2q/eN7.wFwukJ2I96oulEzYRXKnkZq', '2021-10-13 21:29:33', '2021-10-13 21:39:28', '2021-10-13 21:29:28', '2021-10-13 21:29:33'),
	(65, 2, '$2y$10$HGPbpcd/6QXqtA.43wBfIeITP2RTllc2q/Bg.St2cQwCP/rNnJInK', '2021-10-13 21:32:12', '2021-10-13 21:42:06', '2021-10-13 21:32:06', '2021-10-13 21:32:12'),
	(66, 2, '$2y$10$qexm4A6pEQf9A2D87lCfbe4smiamIb2z54txQmXurENy1kjzRVXF2', '2021-10-13 21:37:45', '2021-10-13 21:47:39', '2021-10-13 21:37:39', '2021-10-13 21:37:45'),
	(67, 2, '$2y$10$i0t4tly3047kxT5x1cDAtuGhDkqwhqSWMbrHPaZMr2Urwt/39ymWW', '2021-10-13 22:09:42', '2021-10-13 22:19:35', '2021-10-13 22:09:35', '2021-10-13 22:09:42'),
	(68, 2, '$2y$10$XNXVRlyx8wmhsyEiKBAKse3.xPvz0MqOCywPsbXBOAX9apvpKX5Em', '2021-10-13 22:53:43', '2021-10-13 23:03:36', '2021-10-13 22:53:36', '2021-10-13 22:53:43'),
	(69, 2, '$2y$10$cz7uuNpnRy19Bwj.8HQ92.eoFxT5qg74B22y2S6mTiMPBB.Jjzco2', '2021-10-13 23:28:11', '2021-10-13 23:38:04', '2021-10-13 23:28:04', '2021-10-13 23:28:11'),
	(70, 2, '$2y$10$QAVtnl17uaHqzYBp5pBI5OshzAz8fTs3blDzuLC8BGmUoOl0x3QKK', '2021-10-14 09:45:07', '2021-10-14 09:54:59', '2021-10-14 09:44:59', '2021-10-14 09:45:07'),
	(71, 2, '$2y$10$0zuJIm9RQnXxjxnd89uRUusabJ7kFRhUSUgtYPpPXJi/wqI8N3g0q', '2021-10-14 10:07:04', '2021-10-14 10:16:50', '2021-10-14 10:06:50', '2021-10-14 10:07:04'),
	(72, 2, '$2y$10$gaZKfxUL0EOFaWjYtv0QPOheU/8BJqMc8eTA64.VhwZTf1dV9ECqK', '2021-10-14 11:54:12', '2021-10-14 12:04:04', '2021-10-14 11:54:04', '2021-10-14 11:54:12'),
	(73, 2, '$2y$10$Udj6.r4I9c.F8iNUAaRU6OA2V1oE3sig8aRgMQ4zUQ/AaVM.UOL3G', NULL, '2021-10-14 13:31:55', '2021-10-14 13:21:55', '2021-10-14 13:21:55'),
	(74, 2, '$2y$10$xxnZSHYMJrL.Tm20fqKxC.Qrr9UzSbT15pzw3eZsUckKugSxaeW2e', NULL, '2021-10-14 13:41:46', '2021-10-14 13:31:46', '2021-10-14 13:31:46'),
	(75, 2, '$2y$10$iKHAI1dfpcNk19U9LAVauedUbn3dTT7hlVKtxXO77YcOpqdSKKA2S', '2021-10-14 13:33:52', '2021-10-14 13:43:23', '2021-10-14 13:33:23', '2021-10-14 13:33:52'),
	(76, 2, '$2y$10$/nHVadgXh6hHuw54VfnCE.32roxcdLEyugimltxThLmb/qvg902dW', NULL, '2021-10-14 13:44:24', '2021-10-14 13:34:24', '2021-10-14 13:34:24'),
	(77, 2, '$2y$10$doZA8CHdG8IOilDfVVFxMefXDZGHme3f9w4/oPM1kespnp2.E5ZOG', NULL, '2021-10-14 13:45:53', '2021-10-14 13:35:53', '2021-10-14 13:35:53'),
	(78, 2, '$2y$10$JzknQCDnpWDg6WnJXJfX/OHZ5dwAZqLDll3vChaEm8rbJgqVwg.qi', NULL, '2021-10-14 13:46:34', '2021-10-14 13:36:34', '2021-10-14 13:36:34'),
	(79, 2, '$2y$10$BV.N6pChu6hjLQm5g8YwIeCRo9QjhXrY0KmSKZ60xx0uXf3xznnR2', NULL, '2021-10-14 14:12:10', '2021-10-14 14:02:10', '2021-10-14 14:02:10'),
	(80, 2, '$2y$10$/YZOn.iebwQ7etZAEexOQOn78vgXmZVDOiUvVVTRVUuP9xNsQyu9K', NULL, '2021-10-14 14:13:08', '2021-10-14 14:03:08', '2021-10-14 14:03:08'),
	(81, 2, '$2y$10$kJ75KBWnMERoFbp6aDIqL.Lh2UNqmf/R6MKX78mEWwqlmq.DK8Az.', NULL, '2021-10-14 14:13:57', '2021-10-14 14:03:57', '2021-10-14 14:03:57'),
	(82, 2, '$2y$10$YF.itcEht4dK4kGOHSrqzuZ6Fiv9UnwBsjimwpWUmjPsXtAeTqjnG', NULL, '2021-10-14 14:15:47', '2021-10-14 14:05:47', '2021-10-14 14:05:47'),
	(83, 2, '$2y$10$S24YSHc76oweTnOGXy0XHOiKfrw8AlFfJ8KuOUYPw6Nk7zEeFfI4G', NULL, '2021-10-14 14:16:23', '2021-10-14 14:06:23', '2021-10-14 14:06:23'),
	(84, 2, '$2y$10$ZQcVv3QOArPUbDXT87ktHumfZj4pD3f1tDIhTEayhVzV7JlEtm5tS', NULL, '2021-10-14 14:16:52', '2021-10-14 14:06:52', '2021-10-14 14:06:52'),
	(85, 2, '$2y$10$IhhoKl/Ft4Jfd4ZXswc6VOsx9Yon9fqUo2Jz.Yw8D6AeEPVneJS/.', NULL, '2021-10-14 14:17:18', '2021-10-14 14:07:18', '2021-10-14 14:07:18'),
	(86, 2, '$2y$10$Wwn7mmFQzUkzdf.5m3/wa.tmrtb6YEhE2P61d4Nd3ZnF1AmiN7GjO', NULL, '2021-10-14 14:20:22', '2021-10-14 14:10:22', '2021-10-14 14:10:22'),
	(87, 2, '$2y$10$Rb0uEdlXCeRi6Yj/OvdgYuDN7cobqGZrlIoiAeopeECSzK1BxTCn6', NULL, '2021-10-14 14:22:24', '2021-10-14 14:12:24', '2021-10-14 14:12:24'),
	(88, 2, '$2y$10$Ao18V2/k3RmEKh.Oy53w0OGTuJBJl3oLR8LBeNzr1jFcxysSEYHGu', NULL, '2021-10-14 14:23:26', '2021-10-14 14:13:26', '2021-10-14 14:13:26'),
	(89, 2, '$2y$10$ivk.eiVavbSWtoGBR/7AbeZ4qBgJyTOnYbwMBXrLvC8IUbVnmiL3.', NULL, '2021-10-14 14:27:08', '2021-10-14 14:17:08', '2021-10-14 14:17:08'),
	(90, 2, '$2y$10$fZrQd0vHcYCF/dp2J/G8keEztvV0nwAZnkf07OIF5Bss9pn71/qGe', NULL, '2021-10-14 14:33:45', '2021-10-14 14:23:45', '2021-10-14 14:23:45'),
	(91, 2, '$2y$10$ZOEFWAYxxPXCrHXUToDqM.ImrtN/Obz6s0Wsf8.j11M5LzbJFBSYC', '2021-10-14 14:26:42', '2021-10-14 14:35:54', '2021-10-14 14:25:54', '2021-10-14 14:26:42'),
	(92, 2, '$2y$10$7QXRcPGvDelghmGmpqK2puz4XGuIhP4MVbhgZYj/KGKSX.fO/LqTm', '2021-10-14 14:41:09', '2021-10-14 14:48:31', '2021-10-14 14:38:31', '2021-10-14 14:41:09'),
	(93, 2, '$2y$10$UnO80VmBTHZ4/chvqeu7GOAQSnOV3lqZ7DcWG1XBEB4DeKTqAH1xq', NULL, '2021-10-14 14:50:33', '2021-10-14 14:40:33', '2021-10-14 14:40:33');
/*!40000 ALTER TABLE `login_tokens` ENABLE KEYS */;

-- Dumping structure for table nextvacay.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.migrations: ~6 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2021_10_11_160009_create_login_tokens_table', 2),
	(6, '2021_10_12_115205_create_login_tokens_table', 3),
	(7, '2021_10_12_163954_create_login_tokens_table', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table nextvacay.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table nextvacay.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.personal_access_tokens: ~13 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(8, 'App\\Models\\User', 2, 'vacaytoken', '1d1d85217c9fdb5467fb32f29c8ca6b94817b4826eea1a6a9b6800081ee509ce', '["*"]', NULL, '2021-10-13 20:43:16', '2021-10-13 20:43:16'),
	(9, 'App\\Models\\User', 2, 'vacaytoken', '91e98304436d5b8772bddc57b3c59942a053ad21c2c00a125fa1ebbd34188e97', '["*"]', NULL, '2021-10-13 20:43:53', '2021-10-13 20:43:53'),
	(10, 'App\\Models\\User', 2, 'vacaytoken', '3bdf1c1c7aae9c1d45056df4b2fa42a033cd9fa9e8b6b3f373a9e6fb91b05c5d', '["*"]', NULL, '2021-10-13 21:06:45', '2021-10-13 21:06:45'),
	(11, 'App\\Models\\User', 2, 'vacaytoken', '3475981124246f6c0ccf1aadbb858066d124507902df2e6c44232f96b01e7b77', '["*"]', NULL, '2021-10-13 21:09:54', '2021-10-13 21:09:54'),
	(12, 'App\\Models\\User', 2, 'vacaytoken', '5577e1be9fbd917ec3ea01f859dc04708ee19a0c851cef8a2cd5caad3829b4ce', '["*"]', NULL, '2021-10-13 21:11:52', '2021-10-13 21:11:52'),
	(13, 'App\\Models\\User', 2, 'vacaytoken', '641aecf7ad9608fd6a286ddb72c008aabb7afd0de0d04818fdc7b583a8323092', '["*"]', NULL, '2021-10-13 21:27:26', '2021-10-13 21:27:26'),
	(14, 'App\\Models\\User', 2, 'vacaytoken', '703777f8f77e1800b5f358f3df86e8ee08c0046a4013b7c7707833d12fb959f6', '["*"]', NULL, '2021-10-13 21:28:49', '2021-10-13 21:28:49'),
	(15, 'App\\Models\\User', 2, 'vacaytoken', 'e9021f5aba18ebc4fe8372c44fd300182705e3598b81ce388b6a450a8ff40bbe', '["*"]', NULL, '2021-10-13 21:29:32', '2021-10-13 21:29:32'),
	(16, 'App\\Models\\User', 2, 'vacaytoken', '8c4597dd5b4b842e576eac99a3f43ba59965069d60cfded607b689fe2098b44c', '["*"]', NULL, '2021-10-13 21:32:12', '2021-10-13 21:32:12'),
	(17, 'App\\Models\\User', 2, 'vacaytoken', 'f21b7d99c150d6fe2d2cc81d322b425eab4cc0fa241cb7f1e0b867e44ac82d3f', '["*"]', NULL, '2021-10-13 21:37:44', '2021-10-13 21:37:44'),
	(18, 'App\\Models\\User', 2, 'vacaytoken', '16d699a23ce34928a340255817eb4595f425365d2e302d92d3c70d3328dedacf', '["*"]', NULL, '2021-10-13 22:09:42', '2021-10-13 22:09:42'),
	(19, 'App\\Models\\User', 2, 'vacaytoken', 'f8a32476421bd2fda84225d85e675a624e57456cf17c41f842f5cae7f65bdf56', '["*"]', NULL, '2021-10-13 22:53:42', '2021-10-13 22:53:42'),
	(20, 'App\\Models\\User', 2, 'vacaytoken', '0a4b93abaae4ecf3221e6553658811a06fe68d46847f9e0085a7133f60b1e6f0', '["*"]', '2021-10-14 09:51:46', '2021-10-13 23:28:10', '2021-10-14 09:51:46'),
	(21, 'App\\Models\\User', 2, 'vacaytoken', '73d3dd77fc227234fa8014b311c2a7ec054c674b7b48d48da25f3223c58d69ef', '["*"]', '2021-10-14 10:05:56', '2021-10-14 09:45:06', '2021-10-14 10:05:56'),
	(22, 'App\\Models\\User', 2, 'vacaytoken', '9becbe2a4b3f350712b6fe3fcae2e4fc05d97808439b182b07f3aac27b509e9f', '["*"]', '2021-10-14 11:04:14', '2021-10-14 10:07:03', '2021-10-14 11:04:14'),
	(23, 'App\\Models\\User', 2, 'vacaytoken', '938dc541646f0cdcd39cffe66e3544ca1d27cddf159cdd295b2de717da345c59', '["*"]', NULL, '2021-10-14 11:54:11', '2021-10-14 11:54:11'),
	(24, 'App\\Models\\User', 2, 'vacaytoken', 'c7ba7dbda48ed65f895a30afb7e7fbe3b9c30f89d8fd75ff91a640c30e1aa87f', '["*"]', NULL, '2021-10-14 13:33:52', '2021-10-14 13:33:52'),
	(25, 'App\\Models\\User', 2, 'vacaytoken', '1b83f84e6d1d9712ea1043d4cc7332281fa9b603cdc5512490d9fe725ca64961', '["*"]', NULL, '2021-10-14 14:26:41', '2021-10-14 14:26:41'),
	(26, 'App\\Models\\User', 2, 'vacaytoken', 'aece48edecc7d2ebafaecebc37d4459035d4ba286cd0908566aa3c85aa591b34', '["*"]', NULL, '2021-10-14 14:41:08', '2021-10-14 14:41:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table nextvacay.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nextvacay.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Mark Mbila', 'markmbila@gmail.com', NULL, '$2y$10$zrProO14Y5tAnB9ZI7C6GOKhj5ZuNKGEU2MOsK8Phodcg97FlQSSK', NULL, '2021-10-12 08:54:58', '2021-10-14 11:04:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
