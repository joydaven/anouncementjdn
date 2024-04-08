-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 04:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `announcementjdn`
--
CREATE DATABASE IF NOT EXISTS `announcementjdn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `announcementjdn`;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `content`, `start_date`, `end_date`, `user_id`, `active`, `date_created`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'this is my announcement', 'this is my announcement this is my announcement this is my announcement this is my announcement this is my announcement', '2024-04-09', '2024-04-10', 1, 1, '2024-04-08 14:40:18', NULL, '2024-04-08 06:40:18', NULL),
(2, 'asdf', 'asdfasd', '2024-04-10', '2024-04-11', 1, 1, '2024-04-08 14:40:30', NULL, '2024-04-08 06:40:30', NULL),
(3, 'announcement to all group A', 'please note my announcement please note my announcement please note my announcement please note my announcement please note my announcement please note my announcement', '2024-04-09', '2024-04-11', 2, 1, '2024-04-08 14:43:21', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(6, '2024_04_07_162849_add_firstlast_name_to_user_table', 2),
(10, '2024_04_07_163314_create_announcement_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('47RFlX1DG5xJusQXYfJfIujFENsqXmqdbsyQowqv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUTF6R050RGNzRnFrNUpseVpjb0d1dEI4SEo3MVZwZnoybGxoZkJ4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJsb2dpbiI7YTo1OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjQ6InRlc3QiO3M6MTA6ImZpcnN0X25hbWUiO3M6NDoidGVzdCI7czo5OiJsYXN0X25hbWUiO3M6NDoidGVzdCI7czo1OiJlbWFpbCI7czoxNDoidGVzdEBlbWFpbC5jb20iO31zOjEwOiJmaXJzdF9uYW1lIjtzOjQ6InRlc3QiO3M6OToibGFzdF9uYW1lIjtzOjQ6InRlc3QiO3M6NzoidXNlcl9pZCI7YToxOntzOjI6ImlkIjtpOjE7fX0=', 1712586286),
('f3Rv8EgTQZTwXWote6dd09dm4JtjV1RnIYe3OQhI', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZHdyQWFSN0hxMnhPUmhXS1NPaHN4cktKNUFZVlp3ZGJRV3JyQmo0byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIxO30=', 1712580379),
('jxYeLlvpJWovuh9UssDxAIVI7xSpO0gZwWPk5xdE', 24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidDZySkF2TkxpT0d4SXBsMUR5Y0RmRmpjeHl3RU95Nm14VFcyNFNyZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI0O3M6NToibG9naW4iO2E6NTp7czoyOiJpZCI7aToyNDtzOjQ6Im5hbWUiO3M6NDoiam95NCI7czoxMDoiZmlyc3RfbmFtZSI7czo0OiJqb3k0IjtzOjk6Imxhc3RfbmFtZSI7czo0OiJqb3k0IjtzOjU6ImVtYWlsIjtzOjE0OiJqb3k0QGdtYWlsLmNvbSI7fXM6MTA6ImZpcnN0X25hbWUiO2E6MTp7czoxMDoiZmlyc3RfbmFtZSI7czo0OiJqb3k0Ijt9czo5OiJsYXN0X25hbWUiO2E6MTp7czo5OiJsYXN0X25hbWUiO3M6NDoiam95NCI7fXM6NzoidXNlcl9pZCI7YToxOntzOjI6ImlkIjtpOjI0O319', 1712582156),
('MTAcpDwqj0q1elmeF5DnnVzFtySvvIO96qM2z7Rg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidTcyNkJOa2RjUVViUkhtY0pGSlZEdmRrSEdQUFJrYmM0VkF4R0YyTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJsb2dpbiI7YTo1OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjQ6InRlc3QiO3M6MTA6ImZpcnN0X25hbWUiO3M6NDoidGVzdCI7czo5OiJsYXN0X25hbWUiO3M6NDoidGVzdCI7czo1OiJlbWFpbCI7czoxNDoidGVzdEBlbWFpbC5jb20iO31zOjEwOiJmaXJzdF9uYW1lIjthOjE6e3M6MTA6ImZpcnN0X25hbWUiO3M6NDoidGVzdCI7fXM6OToibGFzdF9uYW1lIjthOjE6e3M6OToibGFzdF9uYW1lIjtzOjQ6InRlc3QiO31zOjc6InVzZXJfaWQiO2E6MTp7czoyOiJpZCI7aToxO319', 1712585140),
('PDngEGq7X4fhlwmBbXrbDqDXGFgow2Fwbw9gVUrt', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUXZHQm03MmxpeTMyUkdtbnRySlpVMGhnaG0zSDFjYXlQUXhGS1FOYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIxO3M6NToibG9naW4iO2E6NTp7czoyOiJpZCI7aToyMTtzOjQ6Im5hbWUiO3M6NDoidGVzdCI7czoxMDoiZmlyc3RfbmFtZSI7czo0OiJ0ZXN0IjtzOjk6Imxhc3RfbmFtZSI7czo4OiJhc2RmZGFzZiI7czo1OiJlbWFpbCI7czoyOToiYXNkZmFzZGZzZGFmZGFzZkBhc2Rmc2FkZi5jb20iO31zOjEwOiJmaXJzdF9uYW1lIjthOjE6e3M6MTA6ImZpcnN0X25hbWUiO3M6NDoidGVzdCI7fXM6OToibGFzdF9uYW1lIjthOjE6e3M6OToibGFzdF9uYW1lIjtzOjg6ImFzZGZkYXNmIjt9czo3OiJ1c2VyX2lkIjthOjE6e3M6MjoiaWQiO2k6MjE7fX0=', 1712581732),
('Rtsd7Ep7wKYZit7cX61fP7g4HD5u2r6GcSkKqhk4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUR3ckttRFVrZkJvTUlLMVo0Rm5XbkV3aENuM1pQSzFSUjBsMVVkeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1712587737),
('Stzy7AuCzVmxuv2EQ6efr9fTeLG1fMYgSTyIM33l', 22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTnlCRTJWRWZkdmw4WGVVMGhBWUhIM3VSYVJkWUNNZzJxQnBKVkZTViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIyO30=', 1712581819),
('SuK7fjP1zztffL5Ln0SoLdSDK32jQ0NAmBNh17bh', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNUJwbHVuR1RnR2ZhTnZhbDFIcFg1WVpxa3pGb3ZOYmJibjB4cDd2eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJsb2dpbiI7YTo1OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjQ6InRlc3QiO3M6MTA6ImZpcnN0X25hbWUiO3M6NDoidGVzdCI7czo5OiJsYXN0X25hbWUiO3M6NDoidGVzdCI7czo1OiJlbWFpbCI7czoxNDoidGVzdEBlbWFpbC5jb20iO31zOjEwOiJmaXJzdF9uYW1lIjtzOjQ6InRlc3QiO3M6OToibGFzdF9uYW1lIjtzOjQ6InRlc3QiO3M6NzoidXNlcl9pZCI7YToxOntzOjI6ImlkIjtpOjE7fX0=', 1712586203);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`) VALUES
(1, 'test', 'test@email.com', NULL, '$2y$12$XXv41KEh1mYBXt.dO0Z7TeDddVadtK6nJwlZ2lUITtyikUJiKKFC6', NULL, '2024-04-08 05:32:54', '2024-04-08 05:32:54', 'test', 'test'),
(2, 'test2', 'test2@asdfdasf.com', NULL, '$2y$12$qpE78kS./wa3FW79r/h.QOXjreeOTZQ8wKjA98p3s28815N..WFkO', NULL, '2024-04-08 06:42:23', '2024-04-08 06:42:23', 'test2', 'test2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
