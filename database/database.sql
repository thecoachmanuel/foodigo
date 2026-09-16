-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2026 at 12:12 AM
-- Server version: 8.0.45
-- PHP Version: 8.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_foodigo_laravel_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint UNSIGNED NOT NULL,
  `experience_year` int NOT NULL,
  `about_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `experience_year`, `about_image`, `customer_image`, `branch_image`, `created_at`, `updated_at`) VALUES
(1, 15, 'uploads/custom-images/about--2025-03-13-04-45-14-5821.webp', 'uploads/custom-images/about--2025-03-13-04-46-32-9835.webp', 'uploads/custom-images/about--2024-05-15-05-24-49-1388.webp', NULL, '2025-03-12 22:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `about_us_translations`
--

CREATE TABLE `about_us_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `about_us_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us_translations`
--

INSERT INTO `about_us_translations` (`id`, `about_us_id`, `lang_code`, `title`, `description`, `customer_title`, `customer_des`, `branch_title`, `branch_des`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Our Story of food Culinary Excellence at Foodigo', '<p>There are many variations of passages of Lorem Ipsum available, but the to a majority have suffered alteration in some form, by injected humour, or find randomised words which don\'t look even slightly believable.</p>\r\n<p>Over 20 years&rsquo; experience providing top quality house Booking rant and sell for your Amazing Dream &amp; Make you Happy</p>', '90k+ Customers', 'Believe in our service & Care', '100+ Branch', 'Food ready for occupancy', NULL, '2025-05-06 23:13:28'),
(8, 1, 'bn', 'Our Story of food Culinary Excellence at Foodigo', '<p>There are many variations of passages of Lorem Ipsum available, but the to a majority have suffered alteration in some form, by injected humour, or find randomised words which don\'t look even slightly believable.</p>\r\n<p>Over 20 years&rsquo; experience providing top quality house Booking rant and sell for your Amazing Dream &amp; Make you Happy</p>', '90k+ Customers', 'Believe in our service & Care', '100+ Branch', 'Food ready for occupancy', '2025-04-29 03:55:33', '2025-04-29 03:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `restaurant_id`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 10.00, 'disable', '2025-03-12 23:57:12', '2025-09-28 04:10:56'),
(2, 1, 120.00, 'disable', '2025-03-12 23:57:39', '2025-12-10 02:22:24'),
(3, 1, 12.00, 'enable', '2025-03-12 23:58:08', '2025-12-09 21:52:38'),
(4, 7, 12.00, 'enable', '2025-03-12 23:58:32', '2025-10-09 03:18:05'),
(10, 2, 5.00, 'enable', '2025-03-13 01:20:00', '2025-03-13 01:20:00'),
(11, 2, 10.00, 'enable', '2025-03-13 01:20:24', '2025-03-13 01:20:24'),
(12, 2, 20.00, 'enable', '2025-03-13 01:20:45', '2025-03-13 01:20:45'),
(13, 2, 40.00, 'enable', '2025-03-13 01:21:05', '2025-03-13 01:21:05'),
(20, 3, 40.00, 'enable', '2025-03-13 01:21:05', '2025-03-13 01:21:05'),
(21, 3, 40.00, 'enable', '2025-03-13 01:21:05', '2025-03-13 01:21:05'),
(22, 2, 12.00, 'disable', '2025-09-21 04:07:29', '2025-09-21 04:07:29'),
(23, 2, 12.00, 'disable', '2025-09-21 21:37:07', '2025-09-21 21:37:07'),
(24, 2, 12.00, 'enable', '2025-09-21 22:09:27', '2025-09-22 00:27:26'),
(55, 1, 10.00, 'disable', '2025-09-28 04:38:00', '2025-09-28 04:38:00'),
(60, 1, 6.00, 'disable', '2025-09-28 23:19:32', '2025-10-06 02:13:08'),
(86, 1, 2.00, 'disable', '2025-10-06 02:13:17', '2025-10-06 02:13:17'),
(110, 10, 5.00, 'disable', '2025-10-06 04:57:04', '2025-10-06 04:57:04'),
(111, 1, 10.00, 'disable', '2025-10-07 03:44:37', '2025-12-06 22:53:28'),
(121, 7, 20.00, 'enable', '2025-10-09 00:24:43', '2025-10-11 21:42:46'),
(124, 7, 50.00, 'enable', '2025-10-09 03:21:39', '2025-10-11 21:42:55'),
(126, 4, 5.00, 'disable', '2025-10-13 03:10:51', '2025-10-13 03:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `addon_translations`
--

CREATE TABLE `addon_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `addon_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_translations`
--

INSERT INTO `addon_translations` (`id`, `addon_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Pep45', '2024-08-25 02:52:43', '2025-09-28 02:57:05'),
(3, 2, 'en', '7up', '2024-09-02 00:17:52', '2025-09-28 04:29:50'),
(11, 6, 'en', 'Laravel Script', '2024-12-14 11:11:40', '2024-12-14 11:11:40'),
(13, 1, 'en', 'Chicken Leg', '2025-03-12 23:57:12', '2025-03-12 23:57:12'),
(14, 2, 'en', 'Drinks', '2025-03-12 23:57:39', '2025-03-12 23:57:39'),
(15, 3, 'en', 'Nan', '2025-03-12 23:58:08', '2025-03-12 23:58:08'),
(16, 4, 'en', 'custom', '2025-03-12 23:58:32', '2025-09-28 04:34:58'),
(18, 10, 'en', 'Extra Chess', '2025-03-13 01:20:00', '2025-03-13 01:20:00'),
(19, 11, 'en', 'Nan', '2025-03-13 01:20:24', '2025-03-13 01:20:24'),
(20, 12, 'en', '7up', '2025-03-13 01:20:45', '2025-03-13 01:20:45'),
(21, 13, 'en', 'Pepsi', '2025-03-13 01:21:05', '2025-03-13 01:21:05'),
(24, 20, 'en', '7up', '2025-03-13 01:20:45', '2025-03-13 01:20:45'),
(25, 21, 'en', 'Pepsi', '2025-03-13 01:21:05', '2025-03-13 01:21:05'),
(101, 1, 'bn', 'Pepsi', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(102, 2, 'bn', '7up', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(103, 6, 'bn', 'Laravel Script', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(104, 1, 'bn', 'Chicken Leg', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(105, 2, 'bn', 'Drinks', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(106, 3, 'bn', 'Nan', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(107, 4, 'bn', 'Extra Chess', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(108, 10, 'bn', 'Extra Chess', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(109, 11, 'bn', 'Nan', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(110, 12, 'bn', '7up', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(111, 13, 'bn', 'Pepsi', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(114, 20, 'bn', '7up', '2025-04-29 03:55:33', '2025-04-29 03:55:33'),
(115, 21, 'bn', 'Pepsi', '2025-04-29 03:55:33', '2025-04-29 03:55:33'),
(116, 22, 'en', 'Mango Juice', '2025-09-21 04:07:29', '2025-09-21 04:07:29'),
(117, 22, 'bn', 'Mango Juice', '2025-09-21 04:07:29', '2025-09-21 04:07:29'),
(118, 23, 'en', 'Mango', '2025-09-21 21:37:07', '2025-09-21 21:37:07'),
(119, 23, 'bn', 'Mango', '2025-09-21 21:37:07', '2025-09-21 21:37:07'),
(120, 24, 'en', '7up', '2025-09-21 22:09:27', '2025-12-09 21:54:40'),
(121, 24, 'bn', 'Mango1', '2025-09-21 22:09:27', '2025-09-21 22:09:27'),
(182, 55, 'en', 'custom8', '2025-09-28 04:38:00', '2025-09-28 04:39:45'),
(183, 55, 'bn', 'custom7', '2025-09-28 04:38:00', '2025-09-28 04:38:00'),
(192, 60, 'en', 'dfdf', '2025-09-28 23:19:32', '2025-10-06 02:12:57'),
(193, 60, 'bn', 'dfdf', '2025-09-28 23:19:32', '2025-09-28 23:19:32'),
(244, 86, 'en', 'Test', '2025-10-06 02:13:17', '2025-10-06 02:13:17'),
(245, 86, 'bn', 'Test', '2025-10-06 02:13:17', '2025-10-06 02:13:17'),
(292, 110, 'en', 'juice', '2025-10-06 04:57:04', '2025-10-06 04:57:04'),
(293, 110, 'bn', 'juice', '2025-10-06 04:57:04', '2025-10-06 04:57:04'),
(294, 111, 'en', 'RC', '2025-10-07 03:44:37', '2025-10-13 04:10:16'),
(295, 111, 'bn', 'rr', '2025-10-07 03:44:37', '2025-10-07 03:44:37'),
(314, 121, 'en', 'Temo', '2025-10-09 00:24:43', '2025-10-09 03:21:57'),
(315, 121, 'bn', 'lemon', '2025-10-09 00:24:43', '2025-10-09 00:24:43'),
(320, 124, 'en', 'demoFour', '2025-10-09 03:21:39', '2025-10-09 03:21:39'),
(321, 124, 'bn', 'demoFour', '2025-10-09 03:21:39', '2025-10-09 03:21:39'),
(324, 126, 'en', 'test', '2025-10-13 03:10:51', '2025-10-13 03:10:51'),
(325, 126, 'bn', 'test', '2025-10-13 03:10:51', '2025-10-13 03:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'super_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `designation`, `facebook`, `linkedin`, `twitter`, `instagram`, `about_me`, `image`, `admin_type`) VALUES
(4, 'Mahe Karim', 'admin@gmail.com', NULL, '$2y$10$1RxGTNoDRyIb8AP1fc.YcOSRt.TjdS6/Llpe0ZQhV.uFO2nQI8JZO', 'enable', NULL, '2025-08-06 21:05:25', '2025-08-06 21:05:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'super_admin');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/custom-images/-2025-04-21-06-36-24-5613.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', '2025-04-21 00:36:24', '2025-04-21 00:36:24'),
(2, 'uploads/custom-images/-2025-04-21-06-36-37-1699.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', '2025-04-21 00:36:37', '2025-04-21 00:36:37'),
(3, 'uploads/custom-images/-2025-04-21-06-36-48-9483.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', '2025-04-21 00:36:48', '2025-04-21 00:36:48'),
(4, 'uploads/custom-images/-2025-04-21-06-36-58-1800.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', '2025-04-21 00:36:58', '2025-04-21 00:36:58'),
(5, 'uploads/custom-images/-2025-04-21-06-37-20-6397.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', '2025-04-21 00:37:20', '2025-04-21 00:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int NOT NULL DEFAULT '0',
  `blog_category_id` int NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `show_homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `slug`, `image`, `admin_id`, `blog_category_id`, `views`, `status`, `show_homepage`, `is_popular`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'palate-perfection-a-symphony-of-savory-delights', 'uploads/custom-images/blog--2025-03-12-08-18-13-2883.webp', 1, 4, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"foodigo\"}]', '2025-03-12 02:18:13', '2025-03-12 02:19:37'),
(2, 'culinary-chronicles-tasting-lifes-delicious-moments', 'uploads/custom-images/blog--2025-03-12-08-25-17-6590.webp', 1, 2, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"foodigo\"},{\"value\":\"Restaurant\"}]', '2025-03-12 02:25:17', '2025-03-12 02:25:17'),
(3, 'flavorful-tales-a-gastronomic-odyssey-unveiled', 'uploads/custom-images/blog--2025-03-12-08-47-29-6149.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"foodigo\"},{\"value\":\"Restaurant\"}]', '2025-03-12 02:28:11', '2025-03-12 02:47:30'),
(4, 'eats-and-treats-a-culinary-expedition-savory-delights', 'uploads/custom-images/blog--2025-03-12-08-29-43-2524.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"foodigo\"}]', '2025-03-12 02:29:43', '2025-03-12 02:29:43'),
(5, 'crave-chronicles-tastes-that-tell-a-story', 'uploads/custom-images/blog--2025-03-12-08-36-39-5298.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"foodigo\"}]', '2025-03-12 02:36:39', '2025-03-12 02:36:39'),
(6, 'taste-quest-exploring-the-art-of-indulgence', 'uploads/custom-images/blog--2025-03-12-08-39-16-5742.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"Foodigo\"}]', '2025-03-12 02:39:17', '2025-03-12 02:39:17'),
(7, 'flavors-unleashed-a-culinary-symphony', 'uploads/custom-images/blog--2025-03-12-08-42-13-8502.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"foodigo\"},{\"value\":\"Restaurant\"}]', '2025-03-12 02:42:13', '2025-03-12 02:42:13'),
(8, 'dine-devour-a-symphony-of-flavors', 'uploads/custom-images/blog--2025-03-12-08-46-47-6245.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"foodigo\"}]', '2025-03-12 02:43:35', '2025-03-12 02:46:47'),
(9, 'epicurean-escapade-discovering-delectable-delights', 'uploads/custom-images/blog--2025-03-12-08-45-13-2999.webp', 1, 6, 0, 1, 'no', '0', '[{\"value\":\"FoodMenu\"},{\"value\":\"Restaurant\"},{\"value\":\"foodigo\"}]', '2025-03-12 02:45:13', '2025-03-12 02:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'benglai-food', 1, '2025-03-12 02:10:29', '2025-03-12 02:10:29'),
(2, 'junk-food', 1, '2025-03-12 02:10:44', '2025-03-12 02:10:44'),
(4, 'fast-food', 1, '2025-03-12 02:11:10', '2025-03-12 02:11:10'),
(5, 'cold-drinks', 1, '2025-03-12 02:12:31', '2025-03-12 02:12:31'),
(6, 'vegetable', 1, '2025-03-12 02:26:48', '2025-03-12 02:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_translations`
--

CREATE TABLE `blog_category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_category_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_category_translations`
--

INSERT INTO `blog_category_translations` (`id`, `blog_category_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Benglai Food', '2025-03-12 02:10:29', '2025-03-12 02:10:29'),
(2, 2, 'en', 'Junk Food', '2025-03-12 02:10:44', '2025-03-12 02:10:44'),
(4, 4, 'en', 'Fast Food', '2025-03-12 02:11:10', '2025-03-12 02:11:10'),
(5, 5, 'en', 'Cold Drinks', '2025-03-12 02:12:31', '2025-03-12 02:12:31'),
(6, 6, 'en', 'Vegetable', '2025-03-12 02:26:48', '2025-03-12 02:26:48'),
(32, 1, 'bn', 'Benglai Food', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(33, 2, 'bn', 'Junk Food', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(34, 4, 'bn', 'Fast Food', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(35, 5, 'bn', 'Cold Drinks', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(36, 6, 'bn', 'Vegetable', '2025-04-29 03:55:32', '2025-04-29 03:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `name`, `email`, `phone`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'Michael S. Manning', 'hello@foodigo.com', NULL, 'Our team is comprised of seasoned professionals, each bringing a wealth of experience and the expertise to the table with years of dedicated service in their respective.', 1, '2025-03-12 03:01:42', '2025-03-12 03:01:42'),
(2, 9, 'James Carter', 'james.carter@email.com', NULL, 'Foodigo has completely changed the way I discover new restaurants! The recommendations are always spot on.', 1, '2025-03-12 03:03:26', '2025-03-12 03:03:26'),
(3, 9, 'Sophia Reynolds', 'reynolds@email.com', NULL, 'I love the sleek design and easy navigation. Finding great food has never been this simple!', 1, '2025-03-12 03:04:30', '2025-03-12 03:04:30'),
(4, 8, 'Ethan Mitchell', 'mitchell@email.com', NULL, 'Tried a hidden gem near me thanks to Foodigo. Now, it’s my go-to app for dining out!', 1, '2025-03-12 03:05:55', '2025-03-12 03:05:55'),
(5, 8, 'Olivia Bennett', 'bennett@email.com', NULL, 'The food photography and reviews make me crave new dishes every day. Love it!', 1, '2025-03-12 03:06:54', '2025-03-12 03:06:54'),
(6, 8, 'Daniel Foster', 'foster@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go', 1, '2025-03-12 03:07:55', '2025-03-12 03:07:55'),
(7, 7, 'Daniel Foster', 'foster@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go', 1, '2025-03-12 03:08:34', '2025-03-12 03:08:34'),
(8, 7, 'Olivia Bennett:', 'bennett@email.com', NULL, 'The food photography and reviews make me crave new dishes every day. Love it!', 1, '2025-03-12 03:08:57', '2025-03-12 03:08:57'),
(9, 7, 'Ethan Mitchell', 'mitchell@email.com', NULL, 'I love the sleek design and easy navigation. Finding great food has never been this simple!', 1, '2025-03-12 03:09:21', '2025-03-12 03:09:21'),
(10, 6, 'Sophia Reynolds', 'ynold@gmail.com', NULL, 'The food photography and reviews make me crave new dishes every day. Love it!', 1, '2025-03-12 03:10:21', '2025-03-12 03:10:21'),
(11, 6, 'Michael S. Manning', 'bennett@email.com', NULL, 'Tried a hidden gem near me thanks to Foodigo. Now, it’s my go-to app for dining out!', 1, '2025-03-12 03:11:12', '2025-03-12 03:11:12'),
(12, 6, 'Daniel Foster', 'daniel.foster@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go.', 1, '2025-03-12 03:12:30', '2025-03-12 03:12:30'),
(13, 5, 'Emma Collins', 'dfoster@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go', 1, '2025-03-12 03:13:34', '2025-03-12 03:13:34'),
(14, 5, 'Daniel Foster', 'foster@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go', 1, '2025-03-12 03:14:38', '2025-03-12 03:14:38'),
(15, 5, 'Noah Bradley', 'bradley@email.com', NULL, 'Tried a hidden gem near me thanks to Foodigo. Now, it’s my go-to app for dining out!', 1, '2025-03-12 03:15:42', '2025-03-12 03:15:42'),
(16, 4, 'David Richard', 'david@gmail.com', NULL, 'The food photography and reviews make me crave new dishes every day. Love it!', 1, '2025-03-12 03:16:53', '2025-03-12 03:16:53'),
(17, 4, 'Ava Sullivan', 'sullivan@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go.', 1, '2025-03-12 03:17:32', '2025-03-12 03:17:32'),
(18, 4, 'Emily Dawson', 'daniel.foster@email.com', NULL, 'The search filters are amazing! I can find vegan-friendly spots so easily.', 1, '2025-03-12 03:18:42', '2025-03-12 03:18:42'),
(19, 3, 'Liam Harrison', 'harrison@email.com', NULL, 'Foodigo’s user-friendly experience keeps me coming back for more. Highly', 1, '2025-03-12 03:19:46', '2025-03-12 03:19:46'),
(20, 3, 'Ava Sullivan', 'sullivan@gmail.com', NULL, 'The personalized recommendations make me feel like Foodigo really understands my taste', 1, '2025-03-12 03:20:49', '2025-03-12 03:20:49'),
(21, 3, 'Noah Bradley', 'daniel@email.com', NULL, 'Great app for foodies! Whether it&#039;s street food or fine dining, I find exactly what I need', 1, '2025-03-12 03:22:03', '2025-03-12 03:22:03'),
(22, 2, 'Noah Bradley', 'arrison@email.com', NULL, 'Great app for foodies! Whether it&#039;s street food or fine dining, I find exactly what I need', 1, '2025-03-12 03:23:17', '2025-03-12 03:23:17'),
(23, 2, 'Emily Dawson', 'bradley@email.com', NULL, 'The search filters are amazing! I can find vegan-friendly spots so easily.', 1, '2025-03-12 03:23:55', '2025-03-12 03:23:55'),
(24, 2, 'Ava Sullivan', 'bradley@email.com', NULL, 'I travel a lot, and Foodigo helps me find the best local eats wherever I go.', 1, '2025-03-12 03:24:41', '2025-03-12 03:24:41'),
(25, 1, 'Ava Sullivan', 'arrison@email.com', NULL, 'Foodigo’s user-friendly experience keeps me coming back for more. Highly', 1, '2025-03-12 03:25:57', '2025-03-12 03:25:57'),
(26, 1, 'Noah Bradley', 'daniel.foster@email.com', NULL, 'Great app for foodies! Whether it&#039;s street food or fine dining, I find exactly what I need', 1, '2025-03-12 03:27:02', '2025-03-12 03:27:02'),
(27, 1, 'Ava Sullivan', 'foster@email.com', NULL, 'The search filters are amazing! I can find vegan-friendly spots so easily.', 1, '2025-03-12 03:29:10', '2025-03-12 03:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_translations`
--

INSERT INTO `blog_translations` (`id`, `blog_id`, `lang_code`, `title`, `description`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Palate Perfection: A Symphony of Savory Delights', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Palate Perfection: A Symphony of Savory Delights', 'Palate Perfection: A Symphony of Savory Delights', '2025-03-12 02:18:13', '2025-03-12 02:18:13'),
(2, 2, 'en', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', '2025-03-12 02:25:17', '2025-03-12 02:25:17'),
(3, 3, 'en', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', '2025-03-12 02:28:11', '2025-03-12 02:28:11'),
(4, 4, 'en', 'Eats and Treats: A Culinary Expedition Savory Delights', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Eats and Treats: A Culinary Expedition Savory Delights', 'Eats and Treats: A Culinary Expedition Savory Delights', '2025-03-12 02:29:43', '2025-03-12 02:29:43'),
(5, 5, 'en', 'Crave Chronicles: Tastes That Tell a Story', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Crave Chronicles: Tastes That Tell a Story', 'Crave Chronicles: Tastes That Tell a Story', '2025-03-12 02:36:39', '2025-03-12 02:36:39'),
(6, 6, 'en', 'Taste Quest: Exploring the Art of Indulgence', '<ul>\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\n</ul>', 'Taste Quest: Exploring the Art of Indulgence', 'Taste Quest: Exploring the Art of Indulgence', '2025-03-12 02:39:17', '2025-03-12 02:39:17'),
(7, 7, 'en', 'Flavors Unleashed: A Culinary Symphony', '<p>With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements. Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>', 'Flavors Unleashed: A Culinary Symphony', 'Flavors Unleashed: A Culinary Symphony', '2025-03-12 02:42:13', '2025-03-12 02:51:33'),
(8, 8, 'en', 'Dine & Devour: A Symphony of Flavors', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements. Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Dine & Devour: A Symphony of Flavors', 'Dine & Devour: A Symphony of Flavors', '2025-03-12 02:43:35', '2025-03-12 02:50:11'),
(9, 9, 'en', 'Epicurean Escapade: Discovering Delectable Delights', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Epicurean Escapade: Discovering Delectable Delights', 'Epicurean Escapade: Discovering Delectable Delights', '2025-03-12 02:45:13', '2025-03-12 02:45:13'),
(55, 1, 'bn', 'Palate Perfection: A Symphony of Savory Delights', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Palate Perfection: A Symphony of Savory Delights', 'Palate Perfection: A Symphony of Savory Delights', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(56, 2, 'bn', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', 'Culinary Chronicles: Tasting Life\'s Delicious Moments', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(57, 3, 'bn', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', 'Flavorful Tales: A Gastronomic Odyssey Unveiled', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(58, 4, 'bn', 'Eats and Treats: A Culinary Expedition Savory Delights', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Eats and Treats: A Culinary Expedition Savory Delights', 'Eats and Treats: A Culinary Expedition Savory Delights', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(59, 5, 'bn', 'Crave Chronicles: Tastes That Tell a Story', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Crave Chronicles: Tastes That Tell a Story', 'Crave Chronicles: Tastes That Tell a Story', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(60, 6, 'bn', 'Taste Quest: Exploring the Art of Indulgence', '<ul>\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\n</ul>', 'Taste Quest: Exploring the Art of Indulgence', 'Taste Quest: Exploring the Art of Indulgence', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(61, 7, 'bn', 'Flavors Unleashed: A Culinary Symphony', '<p>With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements. Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>', 'Flavors Unleashed: A Culinary Symphony', 'Flavors Unleashed: A Culinary Symphony', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(62, 8, 'bn', 'Dine & Devour: A Symphony of Flavors', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<p>Their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements. Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Dine & Devour: A Symphony of Flavors', 'Dine & Devour: A Symphony of Flavors', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(63, 9, 'bn', 'এপিকিউরিয়ান এসকেপেড: সুস্বাদু খাবার আবিষ্কার করা', '<p>Our team is comprised of seasoned professionals, each bringing a wealth of experience and expertise to the table. With years of dedicated service in their respective fields, our team members have honed their skills to deliver unparalleled results. From intricate problem-solving to innovative strategizing, their collective experience forms the backbone of our success. Guided by a commitment to excellence, our team combines their extensive knowledge with a passion for staying at the forefront of industry advancements.</p>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>\r\n<ul>\r\n<li>Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries.</li>\r\n<li>From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n<li>Discover the artistry of blending flavors and techniques from different cuisines.</li>\r\n<li>Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</li>\r\n</ul>\r\n<p>Discover the artistry of blending flavors and techniques from different cuisines. Explore how culinary fusion can result in unique and tantalizing dishes that transcend cultural boundaries. From Japanese-Peruvian fusion to modern twists on classic comfort foods, we\'ll take you on a global taste tour that celebrates the beauty of culinary creativity.</p>', 'Epicurean Escapade: Discovering Delectable Delights', 'Epicurean Escapade: Discovering Delectable Delights', '2025-04-29 03:55:32', '2025-12-08 23:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty` int NOT NULL DEFAULT '1',
  `addons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `addon_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','inactive','ordered') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `restaurant_id`, `size`, `size_price`, `qty`, `addons`, `addon_price`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(270, 110, 15, 4, 'Medium', 40.00, 2, '{\"10\":1}', 5.00, 85.00, 'active', '2025-09-30 21:39:28', '2025-09-30 21:39:28'),
(293, 123, 184, 7, 'medium', 30.00, 2, '[]', 0.00, 60.00, 'active', '2025-10-12 04:06:40', '2025-10-12 04:06:40'),
(297, 124, 184, 7, 'medium', 30.00, 1, '{\"121\":1}', 20.00, 50.00, 'active', '2025-10-12 23:45:09', '2025-10-12 23:45:09'),
(306, 127, 184, 7, 'medium', 30.00, 1, '{\"121\":1}', 20.00, 50.00, 'active', '2025-10-18 22:26:33', '2025-10-18 22:26:33'),
(307, 128, 184, 7, 'medium', 30.00, 1, '{\"121\":1}', 20.00, 50.00, 'active', '2025-10-18 22:28:26', '2025-10-18 22:28:26'),
(332, 1, 31, 10, 'Medium', 40.00, 1, '{\"12\":1}', 20.00, 60.00, 'active', '2025-12-23 10:30:52', '2025-12-23 10:30:52'),
(333, 1, 32, 10, 'Extra Large', 70.00, 1, '[]', 0.00, 70.00, 'active', '2025-12-27 22:18:53', '2025-12-27 22:18:53'),
(334, 1, 45, 10, 'Small', 30.00, 1, '{\"3\":1}', 12.00, 42.00, 'active', '2026-01-03 19:14:25', '2026-01-03 19:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `cart_addons`
--

CREATE TABLE `cart_addons` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `addon_id` bigint UNSIGNED NOT NULL,
  `addon_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `status`, `created_at`, `updated_at`, `icon`) VALUES
(1, 'pastries-small-chops', 'enable', '2025-03-12 03:35:22', '2025-04-29 03:16:11', 'uploads/custom-images/category--2025-04-29-09-16-11-3680.svg'),
(2, 'burgers-shawarma', 'enable', '2025-03-12 03:36:34', '2025-04-29 03:16:00', 'uploads/custom-images/category--2025-04-29-09-16-00-5917.svg'),
(3, 'meat-pies-pizza', 'enable', '2025-03-12 03:38:38', '2025-04-29 03:15:47', 'uploads/custom-images/category--2025-04-29-09-15-47-3506.svg'),
(4, 'puff-puff-treats', 'enable', '2025-03-12 03:39:35', '2025-04-29 03:15:35', 'uploads/custom-images/category--2025-04-29-09-15-35-8304.svg'),
(5, 'suya-grills', 'enable', '2025-03-12 03:41:11', '2025-04-29 03:15:25', 'uploads/custom-images/category--2025-04-29-09-15-25-4834.svg'),
(6, 'street-bites', 'enable', '2025-03-12 03:48:56', '2025-04-29 03:15:07', 'uploads/custom-images/category--2025-04-29-09-15-07-2258.svg'),
(7, 'drinks-refreshments', 'enable', '2025-03-12 03:50:22', '2025-04-29 03:20:22', 'uploads/custom-images/category--2025-04-29-09-20-22-3167.svg'),
(8, 'cakes-desserts', 'enable', '2025-04-29 03:17:22', '2025-04-29 03:17:22', 'uploads/custom-images/category--2025-04-29-09-17-22-7450.svg'),
(9, 'peppered-chicken-turkey', 'enable', '2025-04-29 03:17:56', '2025-04-29 03:18:05', 'uploads/custom-images/category--2025-04-29-09-18-05-6262.svg'),
(10, 'soups-swallows', 'enable', '2025-04-29 03:18:42', '2025-04-29 03:18:42', 'uploads/custom-images/category--2025-04-29-09-18-42-6436.svg'),
(11, 'rice-jollof-specials', 'enable', '2025-04-29 03:19:04', '2025-04-29 03:19:18', 'uploads/custom-images/category--2025-04-29-09-19-04-7084.svg'),
(12, 'noodles-pasta', 'enable', '2025-04-29 03:19:42', '2025-04-29 03:19:42', 'uploads/custom-images/category--2025-04-29-09-19-42-4606.svg');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `lang_code`, `name`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'en', 'Pastries & Small Chops', '2025-03-12 03:35:22', '2025-03-12 03:35:22', 1),
(2, 'en', 'Burgers & Shawarma', '2025-03-12 03:36:34', '2025-03-12 03:36:34', 2),
(3, 'en', 'Meat Pies & Pizza', '2025-03-12 03:38:38', '2025-03-12 03:38:38', 3),
(4, 'en', 'Puff-Puff & Sweet Treats', '2025-03-12 03:39:35', '2025-03-12 03:39:35', 4),
(5, 'en', 'Suya & Grills', '2025-03-12 03:41:11', '2025-03-12 03:41:11', 5),
(6, 'en', 'Street Bites & Finger Foods', '2025-03-12 03:48:56', '2025-03-13 02:41:10', 6),
(7, 'en', 'Drinks & Refreshments', '2025-03-12 03:50:22', '2025-04-29 03:20:22', 7),
(43, 'en', 'Cakes & Desserts', '2025-04-29 03:17:22', '2025-04-29 03:17:22', 8),
(45, 'en', 'Peppered Chicken & Turkey', '2025-04-29 03:17:56', '2025-04-29 03:17:56', 9),
(47, 'en', 'Soups & Swallows', '2025-04-29 03:18:42', '2025-04-29 03:18:42', 10),
(49, 'en', 'Rice & Jollof Specials', '2025-04-29 03:19:04', '2025-04-29 03:19:18', 11),
(51, 'en', 'Noodles & Pasta', '2025-04-29 03:19:42', '2025-04-29 03:19:42', 12),
(53, 'bn', 'Pastries & Small Chops', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 1),
(54, 'bn', 'Burgers & Shawarma', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 2),
(55, 'bn', 'Meat Pies & Pizza', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 3),
(56, 'bn', 'Puff-Puff & Sweet Treats', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 4),
(57, 'bn', 'Suya & Grills', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 5),
(58, 'bn', 'Street Bites & Finger Foods', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 6),
(59, 'bn', 'Drinks & Refreshments', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 7),
(60, 'bn', 'Cakes & Desserts', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 8),
(61, 'bn', 'Peppered Chicken & Turkey', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 9),
(62, 'bn', 'Soups & Swallows', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 10),
(63, 'bn', 'Rice & Jollof Specials', '2025-04-29 03:55:32', '2025-04-29 03:55:32', 11),
(64, 'bn', 'Noodles & Pasta', '2025-04-29 03:55:32', '2025-12-08 23:46:56', 12);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `image`) VALUES
(1, '2025-03-12 04:10:22', '2025-03-12 04:10:22', 'uploads/custom-images/city--2025-03-12-10-10-22-9704.webp'),
(2, '2025-03-13 00:28:26', '2025-03-13 00:28:26', 'uploads/custom-images/city--2025-03-13-06-28-26-6896.webp'),
(3, '2025-03-15 00:39:09', '2025-03-15 00:39:09', 'uploads/custom-images/city--2025-03-15-06-39-09-5823.webp'),
(4, '2025-03-15 00:40:18', '2025-03-15 00:40:18', 'uploads/custom-images/city--2025-03-15-06-40-18-4222.webp');

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `city_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city_translations`
--

INSERT INTO `city_translations` (`id`, `city_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'San Jose,Spain', '2025-03-12 04:10:22', '2025-03-12 04:10:22'),
(2, 2, 'en', 'San Jose,Spain', '2025-03-13 00:28:26', '2025-03-13 00:28:26'),
(3, 3, 'en', 'Dhaka', '2025-03-15 00:39:09', '2025-03-15 00:39:09'),
(4, 4, 'en', 'Comilla', '2025-03-15 00:40:18', '2025-03-15 00:46:07'),
(25, 1, 'bn', 'San Jose,Spain', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(26, 2, 'bn', 'San Jose,Spain', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(27, 3, 'bn', 'Dhaka', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(28, 4, 'bn', 'Comilla', '2025-04-29 03:55:32', '2025-04-29 03:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `phone`, `email`, `map_code`, `created_at`, `updated_at`) VALUES
(1, '+1 707 797 0462', 'foodigo@gmail.com', 'https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14602.171945259664!2d90.36542965000001!3d23.79928325!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1715065544451!5m2!1sen!2sbd', NULL, '2024-09-25 04:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_translations`
--

CREATE TABLE `contact_us_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_us_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us_translations`
--

INSERT INTO `contact_us_translations` (`id`, `contact_us_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'We love to collab with curious and smart. Let’s do great things together!', '2024-09-25 00:54:03', '2024-09-25 00:54:03'),
(7, 1, 'bn', 'We love to collab with curious and smart. Let’s do great things together!', '2025-04-29 03:55:33', '2025-04-29 03:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `min_purchase_price` decimal(8,2) NOT NULL,
  `discount_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_amount` decimal(8,2) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `restaurant_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `expired_date`, `min_purchase_price`, `discount_type`, `discount_amount`, `status`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 'New Year', 'newyear25', '2025-12-11', 5.00, 'percentage', 10.00, 'enable', 0, '2025-05-04 23:26:52', '2025-12-10 23:05:13'),
(2, 'Black Friday', 'bf2025', '2025-12-20', 10.00, 'percentage', 5.00, 'enable', 0, '2025-12-10 22:36:12', '2025-12-10 22:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `slug`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'nigerian-traditional', 'uploads/custom-images/cuisine--2025-03-12-10-04-56-3732.webp', 'enable', '2025-03-12 04:04:56', '2025-03-12 04:04:56'),
(2, 'afro-fusion', 'uploads/custom-images/cuisine--2025-03-12-10-05-19-2599.webp', 'enable', '2025-03-12 04:05:19', '2025-03-12 04:05:19'),
(3, 'suya-grills', 'uploads/custom-images/cuisine--2025-03-12-10-05-43-5887.webp', 'enable', '2025-03-12 04:05:43', '2025-03-12 04:05:43'),
(4, 'bukka-delicacies', 'uploads/custom-images/cuisine--2025-03-12-10-06-12-9188.webp', 'enable', '2025-03-12 04:06:12', '2025-03-12 04:06:12'),
(5, 'seafood-soups', 'uploads/custom-images/cuisine--2025-03-12-10-06-34-5378.webp', 'enable', '2025-03-12 04:06:34', '2025-03-12 04:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_translations`
--

CREATE TABLE `cuisine_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `cuisine_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine_translations`
--

INSERT INTO `cuisine_translations` (`id`, `cuisine_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Nigerian Traditional', '2025-03-12 04:04:56', '2025-03-12 04:04:56'),
(2, 2, 'en', 'Afro-Fusion & Continental', '2025-03-12 04:05:19', '2025-03-12 04:05:19'),
(3, 3, 'en', 'Suya, Grills & BBQ', '2025-03-12 04:05:43', '2025-03-12 04:05:43'),
(4, 4, 'en', 'Bukka Delicacies', '2025-03-12 04:06:12', '2025-03-12 04:06:12'),
(5, 5, 'en', 'Seafood & Peppersoups', '2025-03-12 04:06:34', '2025-03-12 04:06:34'),
(31, 1, 'bn', 'Nigerian Traditional', '2025-04-29 03:55:32', '2025-12-08 23:48:44'),
(32, 2, 'bn', 'Afro-Fusion & Continental', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(33, 3, 'bn', 'Suya, Grills & BBQ', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(34, 4, 'bn', 'Bukka Delicacies', '2025-04-29 03:55:32', '2025-04-29 03:55:32'),
(35, 5, 'bn', 'Seafood & Peppersoups', '2025-04-29 03:55:32', '2025-04-29 03:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `currency_rate` decimal(8,2) NOT NULL,
  `currency_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before_price',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_code`, `country_code`, `currency_icon`, `is_default`, `currency_rate`, `currency_position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'USD', 'USA', '$', 'no', 1.00, 'before_price', 'active', '2024-05-07 12:20:36', '2024-05-07 12:20:36'),
(3, 'BDT', 'BDT', 'BDT', '৳', 'no', 100.00, 'before_price', 'active', '2024-05-13 02:30:57', '2024-05-13 02:30:57'),
(4, 'INR', 'INR', 'IN', '₹', 'no', 3.00, 'before_price', 'active', '2024-05-13 02:31:45', '2025-05-04 23:37:42'),
(8, 'Nigerian Naira', 'NGN', 'NG', '₦', 'yes', 1.00, 'before_price', 'active', '2025-05-04 23:30:59', '2025-05-04 23:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_withdraws`
--

CREATE TABLE `deliveryman_withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `deliveryman_id` int NOT NULL,
  `withdraw_method_id` int NOT NULL,
  `withdraw_method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdraw_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `charge_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveryman_withdraws`
--

INSERT INTO `deliveryman_withdraws` (`id`, `deliveryman_id`, `withdraw_method_id`, `withdraw_method_name`, `total_amount`, `withdraw_amount`, `charge_amount`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Roket', 10.00, 9.50, 0.50, 'dsdfds', 'approved', '2025-03-16 00:22:38', '2025-03-16 01:03:00'),
(2, 2, 2, 'Others', 40.00, 36.00, 4.00, 'test', 'approved', '2025-03-16 02:45:40', '2025-03-16 02:48:15'),
(3, 2, 1, 'Roket', 50.00, 47.50, 2.50, 'test purpose', 'rejected', '2025-03-16 03:26:43', '2025-03-16 03:27:17'),
(4, 2, 1, 'Roket', 50.00, 47.50, 2.50, 'test', 'rejected', '2025-03-16 03:32:45', '2025-03-16 03:33:16'),
(5, 2, 1, 'Roket', 25.00, 23.75, 1.25, 'testbank', 'pending', '2025-05-06 21:28:03', '2025-05-06 21:28:03'),
(6, 2, 1, 'Roket', 20.00, 19.00, 1.00, 'ABCD', 'pending', '2025-09-20 21:19:30', '2025-09-20 21:19:30'),
(7, 2, 1, 'Roket', 20.00, 19.00, 1.00, 'ABCD', 'pending', '2025-11-02 00:18:22', '2025-11-02 00:18:22'),
(8, 2, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-11-02 02:31:04', '2025-11-02 02:31:04'),
(9, 2, 1, 'Roket', 20.00, 19.00, 1.00, 'ABCD', 'pending', '2025-11-02 02:31:33', '2025-11-02 02:31:33'),
(10, 2, 2, 'Others', 2.00, 1.80, 0.20, '2', 'pending', '2025-11-02 20:43:19', '2025-11-02 20:43:19'),
(11, 2, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-11-03 22:17:06', '2025-11-03 22:17:06'),
(12, 2, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-11-04 03:46:43', '2025-11-04 03:46:43'),
(13, 2, 1, 'Roket', 6.00, 5.70, 0.30, '1', 'pending', '2025-11-04 03:46:56', '2025-11-04 03:46:56'),
(14, 2, 2, 'Others', 5.00, 4.50, 0.50, '2', 'pending', '2025-11-04 22:31:57', '2025-11-04 22:31:57'),
(15, 2, 1, 'Roket', 40.00, 38.00, 2.00, '1', 'pending', '2025-11-05 02:31:11', '2025-11-05 02:31:11'),
(16, 2, 1, 'Roket', 25.00, 23.75, 1.25, '1', 'pending', '2025-11-05 02:36:03', '2025-11-05 02:36:03');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_withdraw_methods`
--

CREATE TABLE `deliveryman_withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdraw_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_areas`
--

CREATE TABLE `delivery_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_fee` double NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_areas`
--

INSERT INTO `delivery_areas` (`id`, `area_name`, `min_time`, `max_time`, `area_fee`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Dhaka Area', '10', '20', 20, 'enable', '2024-09-05 04:17:07', '2024-09-05 04:17:07'),
(4, 'Cumilla', '1000', '20000', 100, 'enable', '2024-09-11 20:52:30', '2024-09-11 20:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint UNSIGNED NOT NULL,
  `man_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `man_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `man_image`, `fname`, `lname`, `email`, `man_type`, `idn_type`, `idn_num`, `idn_image`, `phone`, `password`, `remember_token`, `status`, `created_at`, `updated_at`, `gender`, `country_code`, `date_of_birth`, `city_id`, `zip_code`, `address`, `document_type_id`, `document_number`, `profile_image`, `document`, `short_note`, `vehicle_type_id`, `vehicle_number`, `vehicle_image`, `otp`, `otp_expires_at`, `is_email_verified`) VALUES
(2, 'uploads/custom-images/Ibrahim-2025-11-09-03-21-31-9847.jpg', 'John', 'Doe', 'deliveryman@gmail.com', 'male', NULL, NULL, NULL, '01245788', '$2y$10$sprwOHIDHNMHFi.mRVrkJu1Ga46lQGHa5JvqTnJxkiUXAySdfZSuy', 'ddoKH24FNWQQS8f3RKt29m8grIVkdLHECXxqm1hpW5XxPkBcuweHm70cXwOA', 1, '2025-03-15 01:00:14', '2025-12-07 02:51:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(3, 'uploads/custom-images/Hasan-2025-03-22-09-50-40-4429.png', 'Hasan', 'test', 'hasan@gmail.com', 'male', NULL, NULL, NULL, '01798562841', '$2y$10$RUY7561qbwG4HDrKLCdbbOzO/LZ3rA8P753.A52wDAZQPICI0prvi', NULL, 1, '2025-03-15 01:04:05', '2025-10-06 03:11:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(5, NULL, 'Rashedul', 'Islam', 'yebare6232@dropeso.com', NULL, NULL, NULL, NULL, '1767078222', '$2y$10$BvwA1fYiqj33.UH84Xhb6ekEnlrS9mC7DbYznddTfGyZmZiv4SjnO', NULL, 0, '2025-10-28 03:26:16', '2025-10-28 04:01:38', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761643576_PcPtwJIVsH.jpg', NULL, NULL, '1'),
(6, NULL, 'Rashedul', 'Islam', 'hofep38478@hh7f.com', NULL, NULL, NULL, NULL, '1767078222', '$2y$10$30ocjTCerJfwT2d2WfNF8uxMhZyUmwleh95VjNO./mR7KlUIU4Ha2', NULL, 0, '2025-10-28 21:16:27', '2025-10-28 21:17:22', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761707787_1OladNe2gX.png', NULL, NULL, '1'),
(7, NULL, 'Rashedul', 'Islam', 'hofep38478@hhf.com', NULL, NULL, NULL, NULL, '1767078222', NULL, NULL, 0, '2025-10-29 03:34:26', '2025-10-29 03:34:26', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761730466_2h1AFwjqe4.jpg', '483088', '2025-10-29 09:44:26', '0'),
(8, NULL, 'Rashedul', 'Islam', 'rashed4pa@gmail.com', NULL, NULL, NULL, NULL, '1767078222', NULL, NULL, 0, '2025-10-29 04:20:27', '2025-10-29 04:20:27', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761733227_03JFrD2IRB.png', '106600', '2025-10-29 10:30:27', '0'),
(9, NULL, 'Rashedul', 'Islam', 'hofep38478@hh.com', NULL, NULL, NULL, NULL, '1767078222', NULL, NULL, 0, '2025-10-29 04:43:10', '2025-10-29 04:43:10', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761734590_al7nfGD4LB.jpg', '623755', '2025-10-29 10:53:10', '0'),
(10, NULL, 'Rashedul', 'Islam', 'hofep3848@hh.com', NULL, NULL, NULL, NULL, '1767078222', NULL, NULL, 0, '2025-10-29 04:59:21', '2025-10-29 04:59:21', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', NULL, '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761735561_8THL0hgYWi.jpg', '632355', '2025-10-29 11:09:21', '0'),
(11, NULL, 'Rashedul', 'Islam', 'hofep348@hh.com', NULL, NULL, NULL, NULL, '1767078222', NULL, NULL, 0, '2025-10-29 04:59:47', '2025-10-29 04:59:47', 'male', '+880', '2025-10-12 00:00:00', '1', '1200', 'Mirpur Dhaka.', '1', '34234234', 'uploads/deliveryman/profile_images/1761632726.png', 'uploads/deliveryman/documents/1761632726.png', 'lorem isap', '1', '3424323424', 'uploads/deliveryman/vehicle_images/vehicle_1761735587_wN53srrK9i.jpg', '143284', '2025-10-29 11:09:47', '0'),
(12, NULL, 'fdf', 'dfdf', 'ib@gmail.com', NULL, NULL, NULL, NULL, '+932515115', NULL, NULL, 0, '2025-10-29 05:06:07', '2025-10-29 05:06:07', 'male', '+93', '2025-10-28 00:00:00', '1', '1556', 'fdfdf', 'NID', '15215', '/data/user/0/com.example.foodigo_user/cache/ddb3ffdf-237f-4cb8-a904-2452a51b3c08/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/c3692e8e-2f10-4b1c-9aa6-e2e2ce93ff49/1000000034.png', 'dfdff', 'bike', '55551', 'uploads/deliveryman/vehicle_images/vehicle_1761735967_9QTx0uAkRZ.png', '875892', '2025-10-29 11:16:07', '0'),
(13, NULL, 'fd', 'df', 'fdf@gmail.como', NULL, NULL, NULL, NULL, '+93200020', NULL, NULL, 0, '2025-10-29 05:15:07', '2025-10-29 05:15:07', 'male', '+93', '2025-10-28 00:00:00', '1', '15115', 'dfdf', 'NID', '15115', '/data/user/0/com.example.foodigo_user/cache/cd35466f-bf92-4c59-a885-480c7db3f184/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/36a7e698-cf2e-4983-917c-777620db417b/1000000034.png', 'fdfdf', 'bike', '1551', 'uploads/deliveryman/vehicle_images/vehicle_1761736507_jtKhDKUQqX.png', '867819', '2025-10-29 11:25:07', '0'),
(14, NULL, 'f', 'df', 'fdf@gmail.com', NULL, NULL, NULL, NULL, '+9315151', NULL, NULL, 0, '2025-10-29 21:17:02', '2025-10-29 21:17:02', 'male', '+93', '2025-10-29 00:00:00', '1', '15115', 'dfdf', 'NID', '515', '/data/user/0/com.example.foodigo_user/cache/a5917be9-70ae-4a1e-940d-59ad8376530b/1000000033.png', '/data/user/0/com.example.foodigo_user/cache/e9cf1103-79f6-41b4-af02-9c07d953282f/1000000034.png', 'dfdf', 'bike', '151', 'uploads/deliveryman/vehicle_images/vehicle_1761794222_WvUjwWSVnq.png', '611623', '2025-10-30 03:27:02', '0'),
(15, NULL, 'dfd', 'dfdf', 'fdfj@gmail.com', NULL, NULL, NULL, NULL, '+931515', NULL, NULL, 0, '2025-10-29 21:46:49', '2025-10-29 21:46:49', 'male', '+93', '2025-10-29 00:00:00', '1', '151', 'dfdf', 'NID', '15155', '/data/user/0/com.example.foodigo_user/cache/156587b9-7199-420a-ad14-9d703738b791/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/e7444435-6ddf-4343-81bd-35ac7bf900c8/1000000033.png', 'dfdf', 'bike', '1515', 'uploads/deliveryman/vehicle_images/vehicle_1761796009_sqgOZnAI8t.png', '814485', '2025-10-30 03:56:49', '0'),
(16, NULL, 'df', 'dfd', 'lojab93716@haotuwu.com', NULL, NULL, NULL, NULL, '+932115', NULL, NULL, 0, '2025-10-29 21:48:12', '2025-10-29 21:48:12', 'male', '+93', '2025-10-28 00:00:00', '1', '51151', 'dfdf', 'NID', '1551', '/data/user/0/com.example.foodigo_user/cache/6c0c8301-fd05-4692-9ce5-a77a9ba3a8eb/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/ae80cb33-443a-41cd-a625-67d97c288922/1000000033.png', 'dfdf', 'bike', '151', 'uploads/deliveryman/vehicle_images/vehicle_1761796092_aGjVHy2XK7.png', '544424', '2025-10-30 03:58:12', '0'),
(17, NULL, 'dfdf', 'fdf', 'yejefi7725@haotuwu.com', NULL, NULL, NULL, NULL, '+93221221', NULL, NULL, 0, '2025-10-29 21:55:42', '2025-10-29 21:55:42', 'male', '+93', '2025-10-29 00:00:00', '1', '15115', 'dfdf', 'NID', '5115', '/data/user/0/com.example.foodigo_user/cache/9c830046-11ba-48f0-8a17-0adb6bdd0c85/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/9b6170cc-9ffd-47dc-b751-bad31383ffe0/1000000033.png', 'dffdf', 'bike', '15515', 'uploads/deliveryman/vehicle_images/vehicle_1761796542_7O7yk09yyJ.png', '947579', '2025-10-30 04:05:42', '0'),
(18, NULL, 'dfdf', 'fdf', 'xacoy11481@hh7f.com', NULL, NULL, NULL, NULL, '+930121112', NULL, NULL, 0, '2025-10-29 22:12:21', '2025-10-29 22:12:21', 'male', '+93', '2025-10-29 00:00:00', '1', '1555151', 'dfdf', 'NID', '55151', '/data/user/0/com.example.foodigo_user/cache/0d32639a-b3ac-439e-aa1b-f7e2f5e5d6db/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/cdead533-65bb-4b02-9d64-7371a1ca2f53/1000000033.png', 'dfdf', 'bike', '51155', 'uploads/deliveryman/vehicle_images/vehicle_1761797541_Klh5vmY9me.png', '152963', '2025-10-30 04:22:21', '0'),
(19, NULL, 'fdf', 'fdff', 'wokoye7604@hh7f.com', NULL, NULL, NULL, NULL, '+93515151', NULL, NULL, 0, '2025-10-29 22:27:30', '2025-10-29 22:27:30', 'male', '+93', '2025-10-29 00:00:00', '1', '5115', 'dfdf', 'NID', '5115', '/data/user/0/com.example.foodigo_user/cache/c09930ad-46e2-4d94-b4b2-922598f6e283/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/13095eb1-2d07-454f-b32e-09b176f07b7c/1000000033.png', 'df df', 'bike', '5115', 'uploads/deliveryman/vehicle_images/vehicle_1761798450_DG7wiwbxNH.png', '137947', '2025-10-30 04:37:30', '0'),
(20, NULL, 'fdf', 'ggg', 'ginobav779@haotuwu.com', NULL, NULL, NULL, NULL, '+9315115', NULL, NULL, 0, '2025-10-29 22:42:05', '2025-10-29 22:42:05', 'male', '+93', '2025-10-29 00:00:00', '1', '51115', 'dff', 'NID', '515', '/data/user/0/com.example.foodigo_user/cache/c2cef523-abec-4fee-afbb-4c09ba365e9c/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/2700ab7a-f4fa-4da9-9cfc-7f58866fbbc3/1000000033.png', 'dfdf', 'bike', '1151', 'uploads/deliveryman/vehicle_images/vehicle_1761799325_IUzMiUGBGR.png', '247860', '2025-10-30 04:52:05', '0'),
(21, NULL, 'dfdf', 'dfdf', 'rapobo7264@haotuwu.com', NULL, NULL, NULL, NULL, '+932200202', NULL, NULL, 0, '2025-10-29 22:47:23', '2025-10-29 22:47:41', 'male', '+93', '2025-10-29 00:00:00', '1', '11', 'fdfd', 'NID', '155', '/data/user/0/com.example.foodigo_user/cache/b5bb94bc-7fad-46de-9308-45b8dd0b65ca/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/6c6891b3-73cc-4e19-9d1b-3fb5fa233b12/1000000033.png', 'dfdf', 'bike', 'dfdf', 'uploads/deliveryman/vehicle_images/vehicle_1761799643_Dyp7sEp3ts.png', NULL, NULL, '1'),
(22, NULL, 'fdf', 'ww', 'wefoy45140@haotuwu.com', NULL, NULL, NULL, NULL, '+93511551', NULL, NULL, 0, '2025-10-29 22:49:08', '2025-10-29 22:49:24', 'male', '+93', '2025-10-29 00:00:00', '1', '1551', 'dfd', 'NID', '15', '/data/user/0/com.example.foodigo_user/cache/fd59ede9-f742-4677-8acc-5e5131a648ac/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/9910f820-1153-42aa-8cea-95a4be4586c9/1000000033.png', 'dfdf', 'bike', '1515', 'uploads/deliveryman/vehicle_images/vehicle_1761799748_0vU0ytVSBr.png', NULL, NULL, '1'),
(23, NULL, 'dfdf', 'wwwe', 'vapefa5156@haotuwu.com', NULL, NULL, NULL, NULL, '+9301515151', NULL, NULL, 0, '2025-10-29 23:16:54', '2025-10-29 23:17:20', 'male', '+93', '2025-10-29 00:00:00', '1', '11511', 'fdfdf', 'NID', '151', '/data/user/0/com.example.foodigo_user/cache/95f27d59-c7de-431f-ab21-9562f9c3a96d/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/3fec15ad-ee24-4cc6-8c33-ac57f7fb7854/1000000033.png', 'fdfd', 'bike', '151', 'uploads/deliveryman/vehicle_images/vehicle_1761801414_h2EAB2lohN.png', NULL, NULL, '1'),
(24, NULL, 'dfdf', 'rerer', 'kipay14543@hh7f.com', NULL, NULL, NULL, NULL, '+93020200', '$2y$10$ZE61bi6el608IfBtgYukOeQJkS0MQCO.YsrYEPf.rmm2tP3kXb8NS', NULL, 0, '2025-10-29 23:25:55', '2025-10-29 23:29:05', 'male', '+93', '2025-10-29 00:00:00', '1', '555', 'dfdf', 'NID', '551', '/data/user/0/com.example.foodigo_user/cache/7602ec32-a362-425b-9c80-b9ac5ee49879/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/04d37bc6-3abc-4f89-a6ed-bf8afebfd186/1000000033.png', 'fdf', 'bike', '544', 'uploads/deliveryman/vehicle_images/vehicle_1761801955_14E1e6DkH1.png', NULL, NULL, '1'),
(25, NULL, 'reer', 'gddf', 'ditajoy706@hh7f.com', NULL, NULL, NULL, NULL, '+930202020', '$2y$10$yE92Psnw5Cs3l6wCzslYQOzW.Hbny5hrkv/PmQLYMFzCGv8Y9EiSa', NULL, 0, '2025-10-29 23:31:40', '2025-10-29 23:32:24', 'male', '+93', '2025-10-29 00:00:00', '1', '11515', 'fdfdff', 'NID', '151', '/data/user/0/com.example.foodigo_user/cache/9d1c98cd-e989-4caa-bd94-f5c4a1b8ffed/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/0cef8d45-e9f9-4b21-a1c4-5c2dc8dd263a/1000000033.png', 'fdfdf', 'bike', '5511', 'uploads/deliveryman/vehicle_images/vehicle_1761802300_jkz1EIptO7.png', NULL, NULL, '1'),
(26, NULL, 'dfdf', 'dfdf', 'widofof521@haotuwu.com', NULL, NULL, NULL, NULL, '+93021515', NULL, NULL, 0, '2025-10-29 23:35:01', '2025-10-29 23:35:01', 'male', '+93', '2025-10-29 00:00:00', '2', '5151', 'dfdfdf', 'NID', '51155', '/data/user/0/com.example.foodigo_user/cache/32887f92-76c0-4e1d-a76f-798dfe87b1f6/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/df8e5e77-1b86-41e8-a48f-16e493ba8ca0/1000000033.png', 'dfd dfdf', 'bike', '151', 'uploads/deliveryman/vehicle_images/vehicle_1761802501_41evS84dsb.png', '619045', '2025-10-30 05:45:01', '0'),
(27, NULL, 'dfd', 'eee', 'maditic651@haotuwu.com', NULL, NULL, NULL, NULL, '+931511515', '$2y$10$grwKMg8L9T2o0BiMZwXtIOJtqjtZ3mMfFkVqLR98n6XEp.bt5GXnO', NULL, 0, '2025-10-29 23:36:41', '2025-10-29 23:37:06', 'male', '+93', '2025-10-29 00:00:00', '1', '1200', 'dff', 'NID', '1236', '/data/user/0/com.example.foodigo_user/cache/5a164d28-5936-48fb-aecf-66eee78f62b9/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/90493045-6742-4320-b134-e0b1c75fa94c/1000000033.png', 'g df d', 'bike', '1256987', 'uploads/deliveryman/vehicle_images/vehicle_1761802601_UCC1cno1YR.png', NULL, NULL, '1'),
(28, NULL, 'er', 'dfdf', 'roreki2115@hh7f.com', NULL, NULL, NULL, NULL, '+9315155', NULL, NULL, 0, '2025-10-29 23:49:41', '2025-10-29 23:57:16', 'male', '+93', '1998-03-06 00:00:00', '1', '1256', 'Dhaka', 'NID', '1258', '/data/user/0/com.example.foodigo_user/cache/141160f9-d753-4c03-b4a1-a6be5d899599/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/3aa9dd31-3c6e-4d70-951a-96feee71d1c7/1000000033.png', 'df dfdf', 'bike', '899-888', 'uploads/deliveryman/vehicle_images/vehicle_1761803381_nR6FQTi9NC.png', NULL, NULL, '1'),
(29, NULL, 'rr', 'tt', 'jebidap815@haotuwu.com', NULL, NULL, NULL, NULL, '+93015662', NULL, NULL, 0, '2025-10-30 00:10:13', '2025-10-30 00:16:17', 'male', '+93', '2025-10-29 00:00:00', '1', '9555', 'fkjkd kdfjf', 'NID', '787878', '/data/user/0/com.example.foodigo_user/cache/f8bf9a77-0d68-4d8e-a196-5367d19c4993/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/569bf5ed-ae8b-42e5-8ca1-6ac25901ba14/1000000033.png', 'fd dfdf', 'bike', '45544-5698', 'uploads/deliveryman/vehicle_images/vehicle_1761804613_vBBgh21SX6.png', '606813', '2025-10-30 06:26:17', '0'),
(30, NULL, 'rer', 'jkjjk', 'tenesob123@haotuwu.com', NULL, NULL, NULL, NULL, '+93121211', NULL, NULL, 0, '2025-10-30 00:21:08', '2025-10-30 00:21:41', 'male', '+93', '2025-10-28 00:00:00', '1', '80008', 'df df', 'NID', '8956', '/data/user/0/com.example.foodigo_user/cache/9524e8d1-3174-4617-863f-8576b8dcff45/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/bf0a5dc5-34b9-4f15-9509-6bf9716f4d87/1000000033.png', 'fd df', 'bike', '8956', 'uploads/deliveryman/vehicle_images/vehicle_1761805268_qBOY5YtQHK.png', '388373', '2025-10-30 06:31:41', '0'),
(31, NULL, 'rrr', 'tt', 'nakisol262@hh7f.com', NULL, NULL, NULL, NULL, '+9300515', NULL, NULL, 0, '2025-10-30 00:24:09', '2025-10-30 00:25:00', 'male', '+93', '2025-10-28 00:00:00', '1', '9856', 'fdf', 'NID', '89568', '/data/user/0/com.example.foodigo_user/cache/7b4688d8-cae3-4420-801b-018e274cb358/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/8d8d7363-0b28-4e66-a2aa-a92480b4d2fa/1000000033.png', 'dfd dfdf', 'bike', '89562', 'uploads/deliveryman/vehicle_images/vehicle_1761805449_blEeseh4fC.png', NULL, NULL, '1'),
(32, NULL, 'Wafi', 'Rahim', 'cobixam719@haotuwu.com', 'male', NULL, NULL, NULL, '0124578', '$2y$10$U9zdc.o7obrELvUm7HWaf.8p2L3TLhw/79u0vWXOflpZ2heGvWMda', NULL, 1, '2025-10-30 00:26:08', '2025-11-01 06:54:18', 'male', '+93', '2025-10-28 00:00:00', '1', '8523', 'fdf', 'NID', '8596', '/data/user/0/com.example.foodigo_user/cache/174a4e36-2386-422f-9aa0-1574b0e61953/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/7f39d8e4-4365-447b-94ca-06ce1c910604/1000000033.png', 'dfdf', 'bike', '895623', 'uploads/deliveryman/vehicle_images/vehicle_1761805568_EuIO5LUSv9.png', NULL, NULL, '1'),
(33, NULL, 'rer', 'erhh', 'tre@gmail.com', NULL, NULL, NULL, NULL, '+930121', NULL, NULL, 0, '2025-10-31 07:32:59', '2025-10-31 07:32:59', 'male', '+93', '2025-10-30 00:00:00', '1', '1200', 'dffd', '1', '1236589', '/data/user/0/com.example.foodigo_delivery_man/cache/2ad7a667-b9a2-413c-bd2f-750084e25f01/1000000033.jpg', '/data/user/0/com.example.foodigo_delivery_man/cache/245dbf9a-fbd8-48ee-a587-3b37f1b736cc/1000000033.jpg', 'nj jjnj', '1', '156525', 'uploads/deliveryman/vehicle_images/vehicle_1761917579_tgDW6CKDEf.jpg', '262749', '2025-10-31 13:42:59', '0'),
(34, NULL, 'be', 'fe', 'befem47857@hh7f.com', NULL, NULL, NULL, NULL, '+880175895623', '$2y$10$5VIAj4.sXFIhJbol/XGPieV/NWoYHja0o.smu1wcOvy8q37S2bmAm', NULL, 0, '2025-11-02 20:55:07', '2025-11-02 20:55:35', 'male', '+880', '1999-03-06 00:00:00', '3', '1260', 'Demra', '1', '1600', '/data/user/0/com.example.foodigo_user/cache/89a4c4d9-9d0e-40dd-a178-039d2b6ae594/1000000034.png', '/data/user/0/com.example.foodigo_user/cache/c52b69b8-388f-42b2-8530-ac71119e405f/1000000033.png', 'd dfdf', '1', 'dh-5623', 'uploads/deliveryman/vehicle_images/vehicle_1762138507_SZlDa14Q9o.png', NULL, NULL, '1'),
(35, NULL, 'Ibrahim', 'Hasan', 'fokoca3701@fergetic.com', NULL, NULL, NULL, NULL, '+8801751800957', NULL, NULL, 0, '2025-11-03 22:38:02', '2025-11-03 22:38:02', 'male', '+880', '1999-03-06 00:00:00', '3', '1260', 'Demra', '1', '128890', '/data/user/0/com.example.foodigo_user/cache/861673c0-10af-4e6c-8090-000e4ac69381/1000077213.jpg', '/data/user/0/com.example.foodigo_user/cache/341219cb-5122-4cc9-94db-53257f95b1fe/1000077213.jpg', 'ycvy ubhb', '1', '13579', 'uploads/deliveryman/vehicle_images/vehicle_1762231082_C8DTO8YQNV.jpg', '305679', '2025-11-04 04:48:02', '0'),
(36, NULL, 'Ibrahim', 'Hasan', 'jifiyo7809@burangir.com', NULL, NULL, NULL, NULL, '+8801751800957', '$2y$10$JNDrUJXhRuaeFwC1/xkre.YdClCm3xxHov7vk6jcO4N1bKcwmNTr.', NULL, 0, '2025-11-03 22:39:20', '2025-11-03 22:39:48', 'male', '+880', '1999-03-06 00:00:00', '3', '1260', 'Demra', '1', '128890', '/data/user/0/com.example.foodigo_user/cache/861673c0-10af-4e6c-8090-000e4ac69381/1000077213.jpg', '/data/user/0/com.example.foodigo_user/cache/341219cb-5122-4cc9-94db-53257f95b1fe/1000077213.jpg', 'ycvy ubhb', '1', '13579', 'uploads/deliveryman/vehicle_images/vehicle_1762231160_4jvllomEjl.jpg', NULL, NULL, '1'),
(37, NULL, 'ad', 'fdf', 'ggj@gmail.com', NULL, NULL, NULL, NULL, '+931568995', NULL, NULL, 0, '2025-11-04 20:57:49', '2025-11-04 20:57:49', 'male', '+93', '2025-11-04 00:00:00', '3', '12000', 'Dhaka', '1', '120000', '/data/user/0/com.example.foodigo_delivery/cache/1e43b525-50e3-4cf7-bb1e-3975505c50d2/1000000034.png', '/data/user/0/com.example.foodigo_delivery/cache/1ba7018f-c6b6-46fe-9ec1-a53b6c122d79/1000000034.png', 'df dfdf', '1', 'dff', 'uploads/deliveryman/vehicle_images/vehicle_1762311469_tCSG1mlKb2.png', '198552', '2025-11-05 03:07:49', '0'),
(38, NULL, 'ji', 'fi', 'teletam136@fergetic.com', NULL, NULL, NULL, NULL, '+9315698723', NULL, NULL, 0, '2025-11-04 20:59:57', '2025-11-04 21:00:15', 'male', '+93', '2025-11-04 00:00:00', '1', '9556', 'ff', '1', '12563', '/data/user/0/com.example.foodigo_delivery/cache/dd6d6dd8-97b0-4abe-8c73-5b7bca3f5fb8/1000000034.png', '/data/user/0/com.example.foodigo_delivery/cache/6251c670-4762-44b0-8b9c-0e9860e0003d/1000000033.png', 'dfdf', '1', 'ef5623', 'uploads/deliveryman/vehicle_images/vehicle_1762311597_77sbVMOcE3.png', NULL, NULL, '1'),
(39, NULL, 'ne', 'fa', 'nefata5979@burangir.com', NULL, NULL, NULL, NULL, '+9312365478', '$2y$10$X1PwuIiKByUgkWHJsYqUOOorlLspoWUJNTZ2VCBSyphZDE6.KvB/q', NULL, 0, '2025-11-04 21:02:11', '2025-11-04 21:02:37', 'male', '+93', '2025-11-04 00:00:00', '3', '12305', 'dfd dfdf', '1', '12365', '/data/user/0/com.example.foodigo_delivery/cache/e1d419ad-037c-47c9-8850-904915fb8352/1000000034.png', '/data/user/0/com.example.foodigo_delivery/cache/b0a8d565-4799-4f27-b4b6-f0f7b24e635f/1000000033.png', 'df fdf', '2', '15632', 'uploads/deliveryman/vehicle_images/vehicle_1762311731_8gJpg5biiS.png', NULL, NULL, '1'),
(40, NULL, 'ta', 'mi', 'tamitaf980@burangir.com', NULL, NULL, NULL, NULL, '+8801751800963', '$2y$10$780XELV0pLFj5AF3Ebu/OuZuaxPzmE8ed0ZcaXd08TLyd1/N.gzuy', NULL, 0, '2025-11-05 03:49:36', '2025-11-05 04:00:09', 'male', '+880', '2025-11-04 00:00:00', '3', '1200', 'mirpur', '1', '23790', '/data/user/0/com.example.foodigo_delivery/cache/30cab960-920c-46a4-88b6-4a8c1175de02/1000077213.jpg', '/data/user/0/com.example.foodigo_delivery/cache/a03d47d0-b379-433d-990a-3b8e96c54bf2/1000077213.jpg', 'ycvy ubub', '1', 'fgio458', 'uploads/deliveryman/vehicle_images/vehicle_1762336176_i73Mobso5Q.jpg', NULL, NULL, '1'),
(41, NULL, 'hato', 'ke', 'hatoke7053@datehype.com', NULL, NULL, NULL, NULL, '+8801816781775', NULL, NULL, 0, '2025-12-07 03:06:44', '2025-12-07 03:08:17', 'male', '+880', '2025-12-06 00:00:00', '1', '1200', 'Dhaka', '1', '1203659874', '/data/user/0/com.example.foodigo_delivery/cache/8402ecdf-d035-4996-b404-4c74cedab55c/1000000034.png', '/data/user/0/com.example.foodigo_delivery/cache/f85a8656-8542-47f5-bcff-0135fa60e1d0/1000000033.png', 'dfdf fdf', '1', 'df123654', 'uploads/deliveryman/vehicle_images/vehicle_1765098404_mgJUf06UBN.png', NULL, NULL, '1'),
(42, NULL, 'ge', 'wa', 'gewahey765@docsfy.com', NULL, NULL, NULL, NULL, '+8801816781774', '$2y$10$EiH2j93oGFgcPb.MWV/n4ur1dGdciKm078YERCfvvq1ag/pvx0iWS', NULL, 0, '2025-12-07 03:09:59', '2025-12-07 03:13:08', 'male', '+880', '2025-12-05 00:00:00', '3', '9562', 'dhaka', '1', '212116262', '/data/user/0/com.example.foodigo_delivery/cache/89760a91-4a6b-4495-85ea-8148843f59c3/1000000034.png', '/data/user/0/com.example.foodigo_delivery/cache/a931b7fb-eefc-426e-9437-7849176616d1/1000000034.png', 'dfdf', '1', 'dfdf151515151515', 'uploads/deliveryman/vehicle_images/vehicle_1765098599_jjdpZmIjhH.png', NULL, NULL, '1'),
(43, NULL, 'hh', 'hh', 'ff@gmail.com', NULL, NULL, NULL, NULL, '+88014589632', NULL, NULL, 0, '2025-12-08 21:59:35', '2025-12-08 21:59:35', 'male', '+880', '2025-12-08 00:00:00', '1', '45689', 'hvhvjvj', '1', '4578', '/data/user/0/com.example.foodigo_delivery/cache/86f87052-ac5a-42de-9912-eaabaa0d6f2b/1000080052.jpg', '/data/user/0/com.example.foodigo_delivery/cache/f327389d-f3fe-4de2-857c-111db7d954f4/1000080052.jpg', 'hvjvv', '1', 'hvh', 'uploads/deliveryman/vehicle_images/vehicle_1765252775_cIdPBU4vjw.jpg', '804967', '2025-12-09 04:09:35', '0');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_messages`
--

CREATE TABLE `delivery_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `delivery_man_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enable','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'nid', 'enable', '2025-10-28 04:15:40', '2025-10-28 04:15:40'),
(2, 'driving-license', 'enable', '2025-10-28 04:15:55', '2025-10-28 04:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `document_type_translations`
--

CREATE TABLE `document_type_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `document_type_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_type_translations`
--

INSERT INTO `document_type_translations` (`id`, `document_type_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'NID', '2025-10-28 04:15:40', '2025-10-28 04:15:40'),
(2, 1, 'bn', 'NID', '2025-10-28 04:15:40', '2025-10-28 04:15:40'),
(3, 2, 'en', 'Driving License', '2025-10-28 04:15:55', '2025-10-28 04:15:55'),
(4, 2, 'bn', 'Driving License', '2025-10-28 04:15:55', '2025-10-28 04:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sender_name', 'FoodiGo', NULL, '2025-08-28 08:12:45'),
(2, 'mail_host', 'workzone.minionionbd.com', NULL, '2025-08-28 08:12:45'),
(3, 'email', 'sendmail@workzone.minionionbd.com', NULL, '2025-08-28 08:12:45'),
(4, 'smtp_username', 'sendmail@workzone.minionionbd.com', NULL, '2025-08-28 08:12:45'),
(5, 'smtp_password', ',{dK=1Ov5Vmc', NULL, '2025-08-28 08:12:45'),
(6, 'mail_port', '465', NULL, '2025-08-28 08:12:45'),
(7, 'mail_encryption', 'tls', NULL, '2025-08-28 08:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Reset Password', 'Reset Password', '<h4>Dear <strong>{{user_name}}</strong>,</h4><p>Do you want to reset your password? Please Click the following link and Reset Your Password.</p><p><strong>{{reset_link}}</strong></p><p>&nbsp;</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, NULL),
(2, 'Contact Email', 'Contact Email', '<p>Hello there,</p><p><strong>Mr. {{user_name}} </strong>has send a new email to you. See the message description below:</p><p>Email: <strong>{{user_email}}</strong></p><p>Phone: <strong>{{user_phone}}</strong></p><p><span style=\"background-color: transparent;\">Subject: <strong>{{message_subject}}</strong></span></p><p>Message: <strong>{{message}}</strong></p><p>&nbsp;</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, NULL),
(3, 'NewsLetter Verification', 'NewsLetter Verification', '<h2><strong>Hi there</strong>,</h2><p>Congratulations! Your Subscription has been created successfully. Please Click the following link and Verified Your Subscription.&nbsp;</p><p><strong>{{verification_link}}</strong></p><p>&nbsp;</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, NULL),
(4, 'User Verification', 'User Verification', '<p>Dear <strong>{{user_name}}</strong>,</p><p>Congratulations! Your Account has been created successfully. Please Click the following link and Active your Account.</p><p><strong>{{verification_link}}</strong></p><p>&nbsp;</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, NULL),
(5, 'Order Confirmation', 'Order Confirmation', '<p>Dear <strong>{{user_name}}</strong>,</p><p>Congratulations! Your order has been placed</p><p>Order Id is : #<strong>{{order_id}}</strong></p><p>&nbsp;</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-04 22:55:50'),
(6, 'Order Accept', 'Order Accept', '<p>Dear <strong>{{user_name}}</strong>,</p><p>Your #<strong>{{order_id}}&nbsp;</strong>order hase been accepted.</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-04 23:02:34'),
(7, 'Order Processing', 'Order Processing', '<p>Dear <strong>{{user_name}}</strong>,</p><p>We are preparing on your order #<strong>{{order_id}}</strong></p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-04 23:13:23'),
(8, 'Order On the Way', 'Order On the Way', '<p>Dear <strong>{{user_name}}</strong>,</p><p>We handover your order #<strong>{{order_id}}&nbsp;</strong>to delivery. our deliveryman will contact to you very soon.</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-04 23:14:39'),
(9, 'Order Delivered', 'Order Delivered', '<p>Dear <strong>{{user_name}}</strong>,</p><p>We have successfully delivered your order #<strong>{{order_id}}&nbsp;</strong>. Thanks for your order. please give us a good feedback in our platform.</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-04 23:16:48'),
(10, 'Order Cancel', 'Order Cancel', '<p>Dear <strong>{{user_name}}</strong>,</p><p>We are unable to process your order #{{order_id}}. Please stay with us.</p><p>Thank You</p><p>QuomodoSoft</p>', NULL, '2025-05-07 04:00:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint UNSIGNED NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `facebook`, `twitter`, `linkedin`, `instagram`, `copyright`, `payment_image`, `created_at`, `updated_at`) VALUES
(1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.instagram.com/', 'Copyright 2025, QuomodoSoft. All Rights Reserved.', 'uploads/custom-images/intro-two--2025-04-21-06-55-52-5612.webp', NULL, '2025-04-21 00:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `footer_translations`
--

CREATE TABLE `footer_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `footer_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_us` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_translations`
--

INSERT INTO `footer_translations` (`id`, `footer_id`, `lang_code`, `about_us`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Great platform for the food ordering platform passionate about food. Find your delicious food easier, passionate about food for you!.', NULL, '2024-11-12 23:58:51'),
(2, 1, 'fr', 'Great platform for the food ordering platform passionate about food. Find your delicious food easier, passionate about food for you!.', NULL, '2024-11-12 23:59:07'),
(8, 1, 'bn', 'খাবার অর্ডার করার জন্য দারুন প্ল্যাটফর্ম, খাবারের প্রতি আগ্রহী। আপনার সুস্বাদু খাবার সহজেই খুঁজে নিন, খাবারের প্রতি আগ্রহী!', '2025-04-29 03:55:33', '2025-05-08 02:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'logo', 'uploads/website-images/logo-2025-04-29-08-20-19-6442.svg', NULL, '2025-04-29 02:20:19'),
(2, 'favicon', 'uploads/website-images/favicon-2025-04-29-08-20-19-6989.png', NULL, '2025-04-29 02:20:19'),
(3, 'app_name', 'Nectar', NULL, '2025-03-23 22:46:04'),
(4, 'contact_message_mail', 'admin@gmail.com', NULL, '2025-03-23 22:46:04'),
(5, 'timezone', 'Asia/Dhaka', NULL, '2025-03-23 22:46:04'),
(6, 'selected_theme', 'theme_two', NULL, '2024-09-24 23:21:32'),
(7, 'recaptcha_status', '0', NULL, '2025-04-29 04:21:05'),
(8, 'recaptcha_site_key', '6LdnfvkpAAAAAOoDqEeVqqOA-BIdVmYd4bBPejuq', NULL, '2025-04-29 04:21:05'),
(9, 'recaptcha_secret_key', '6LdnfvkpAAAAAC0GBj1_ERX2y581bVRUdSpNDgJm', NULL, '2025-04-29 04:21:05'),
(10, 'tawk_chat_link', 'https://embed.tawk.to/5a7c31ded7591465c7077c48/default', NULL, '2024-05-07 10:53:59'),
(11, 'tawk_status', '1', NULL, '2024-05-07 10:53:59'),
(12, 'google_analytic_id', '55525522', NULL, '2024-05-07 11:00:35'),
(13, 'google_analytic_status', '0', NULL, '2024-05-07 11:00:35'),
(14, 'pixel_app_id', '156905933', NULL, '2024-05-07 11:05:22'),
(15, 'pixel_status', '0', NULL, '2024-05-07 11:05:22'),
(16, 'placeholder_image', 'uploads/website-images/placeholder-image.png', NULL, '2024-05-07 11:05:22'),
(17, 'cookie_consent_status', '1', NULL, '2025-05-06 23:16:08'),
(18, 'cookie_consent_message', 'We use cookies to personalize content, enhance your browsing experience, and analyze our traffic to deliver delicious meals faster. By clicking \"Accept\", you consent to our use of cookies in accordance with our Privacy Policy.', NULL, '2025-05-06 23:16:08'),
(19, 'error_image', 'uploads/website-images/error-image-2025-04-29-09-40-11-2315.png', NULL, '2025-04-29 03:40:11'),
(20, 'login_page_bg', 'uploads/website-images/login-bg-image-2024-05-09-06-25-25-7589.png', NULL, '2024-05-09 00:25:25'),
(21, 'admin_login', 'uploads/website-images/admin-bg-image-2025-04-29-09-31-16-4771.png', NULL, '2025-04-29 03:31:16'),
(22, 'breadcrumb_image', 'uploads/website-images/breadcrumb-image-2024-11-13-03-50-49-7534.png', NULL, '2024-11-12 21:50:50'),
(23, 'is_facebook', '1', NULL, '2024-05-09 00:46:44'),
(24, 'facebook_client_id', '1844188565781706', NULL, '2024-05-09 00:46:44'),
(25, 'facebook_secret_id', '18441885657817', NULL, '2024-05-09 00:46:44'),
(26, 'facebook_redirect_url', 'http://localhost/callback/facebook', NULL, '2024-05-09 00:46:44'),
(27, 'is_gmail', '1', NULL, '2024-05-09 00:46:44'),
(28, 'gmail_client_id', '673210704627-g002lb3mstedn57b4geupsfhakcqo316.apps.googleusercontent.com', NULL, '2024-05-09 00:46:44'),
(29, 'gmail_secret_id', '673210704627-g002lb3mstedn57b4geupsfhakcqo3', NULL, '2024-05-09 00:46:44'),
(30, 'gmail_redirect_url', 'http://localhost/callback/google', NULL, '2024-05-09 00:46:44'),
(31, 'default_avatar', 'uploads/website-images/avatar-image-2025-05-10-03-46-26-6233.png', NULL, '2025-05-09 21:46:26'),
(32, 'default_cover_image', 'uploads/website-images/default-cover-image-2024-05-09-06-53-46-2041.png', NULL, '2024-05-09 00:53:47'),
(33, 'maintenance_status', '0', NULL, '2025-04-29 03:50:49'),
(34, 'maintenance_image', 'uploads/website-images/maintenance-image-2025-04-29-09-49-27-7499.png', NULL, '2025-04-29 03:49:27'),
(35, 'maintenance_text', 'We are upgrading our site.  We will come back soon.  \r\nPlease stay with us. \r\nThank you.', NULL, '2025-04-29 03:50:49'),
(36, 'app_version', '3.1.0', NULL, '2025-03-23 22:45:10'),
(37, 'delivery_charge', '3', NULL, '2025-03-23 22:46:04'),
(38, 'send_contact_message', 'enable', NULL, NULL),
(39, 'commission_per_sale', '2', NULL, '2025-03-23 22:46:04'),
(40, 'commission_type', 'commission', NULL, '2025-03-23 22:46:04'),
(41, 'login_image_one', 'uploads/website-images/login_image_one-2025-03-22-10-27-30-4674.webp', NULL, '2025-03-22 04:27:30'),
(42, 'login_image_two', 'uploads/website-images/login_image_two-2025-03-22-10-27-31-4700.webp', NULL, '2025-03-22 04:27:31'),
(43, 'login_image_three', 'uploads/website-images/login_image_three-2025-03-22-10-27-31-3376.webp', NULL, '2025-03-22 04:27:31'),
(44, 'login_title_one', 'Simple method for Choosing Your Location', NULL, '2025-04-21 01:26:10'),
(45, 'login_title_two', 'Effortless for Ordering your delectable Cuisine', NULL, '2025-04-21 01:26:10'),
(46, 'login_title_three', 'Simplified to delight in your Flavorful meals', NULL, '2025-04-21 01:26:10'),
(47, 'login_description_one', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment', NULL, '2025-04-21 01:26:10'),
(48, 'login_description_two', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment and help shape the future by starting', NULL, '2025-04-21 01:26:10'),
(49, 'login_description_three', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment and help shape the future by starting', NULL, '2025-04-21 01:26:10'),
(50, 'signup_title_one', 'Simple method for Choosing Your Location', NULL, '2024-10-18 22:34:12'),
(51, 'signup_title_two', 'Effortless for Ordering your delectable Cuisine', NULL, '2024-10-18 22:34:12'),
(52, 'signup_title_three', 'Simplified to delight in your Flavorful meals', NULL, '2024-10-18 22:34:12'),
(53, 'signup_description_one', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment updated', NULL, '2024-10-18 22:34:12'),
(54, 'signup_description_two', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment and help shape the future by starting updated', NULL, '2024-10-18 22:34:12'),
(55, 'signup_description_three', 'Seize the moment and help shape the future by starting a career in blockchain now, the moment and help shape the future by starting updated', NULL, '2024-10-18 22:34:12'),
(56, 'signup_image_one', 'uploads/website-images/signup_image_one-2024-11-13-07-02-30-4739.png', NULL, '2024-11-13 01:02:30'),
(57, 'signup_image_two', 'uploads/website-images/signup_image_two-2024-11-13-07-03-05-6576.png', NULL, '2024-11-13 01:03:05'),
(58, 'signup_image_three', 'uploads/website-images/signup_image_three-2024-11-13-07-03-05-4828.png', NULL, '2024-11-13 01:03:05'),
(59, 'not_found', 'uploads/website-images/not-found-image-2024-03-18-03-11-32-7079.png', '2024-11-13 05:38:27', '2024-11-13 05:38:27'),
(60, 'footer_logo', 'uploads/website-images/footer-logo-2025-04-29-08-25-22-1866.svg', NULL, '2025-04-29 02:25:22'),
(61, 'preloader_status', 'disable', NULL, '2025-03-23 22:46:04'),
(63, 'commission_per_delivery', '2.5', '2025-03-23 22:45:10', '2025-03-23 22:46:04'),
(64, 'splash_screens', '{\"one\":{\"image\":\"uploads\\/splash\\/splash-one-2025-09-14-04-23-17-8293.png\",\"heading\":\"Simple method for  Choosing your Location\",\"subheading\":\"Never overspend your money again with enjoy delicious food feature.\"},\"two\":{\"heading\":\"Simplified Process for Ordering your Tasty Meals\",\"subheading\":\"Never overspend your money again with enjoy delicious food feature.\",\"image\":\"uploads\\/splash\\/splash-two-2025-09-14-04-24-12-6627.png\"},\"three\":{\"heading\":\"Simplified to Delight in your Flavorful Meals\",\"subheading\":\"Never overspend your money again with enjoy delicious food feature.\",\"image\":\"uploads\\/splash\\/splash-three-2025-09-14-04-25-08-7529.png\"}}', '2025-09-13 04:33:02', '2025-09-13 22:25:08'),
(65, 'deliveryman_splash_screen', '{\"image\":\"uploads\\/splash\\/deliveryman-splash-2025-10-28-10-59-28-9853.png\",\"heading\":\"Welcome to\",\"subheading\":\"Foodigo Rider App\"}', '2025-10-28 04:59:28', '2025-11-12 21:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `homepages`
--

CREATE TABLE `homepages` (
  `id` bigint UNSIGNED NOT NULL,
  `intro_banner_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro_banner_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_restaurant_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_app_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_icon1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_icon2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_icon3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_icon4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_playstore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_appstore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_one_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_two_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_three_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_four_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_five` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_five_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_six` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_img_six_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_one_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_one_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_two_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_two_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_restaurant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_restaurant_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_banner_restaurant_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_one_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_one_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_two_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_banner_two_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_working_step_on_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homepages`
--

INSERT INTO `homepages` (`id`, `intro_banner_one`, `intro_banner_two`, `join_restaurant_image`, `mobile_app_image`, `working_step_icon1`, `working_step_icon2`, `working_step_icon3`, `working_step_icon4`, `created_at`, `updated_at`, `mobile_playstore`, `mobile_appstore`, `footer_img_one`, `footer_img_two`, `footer_img_three`, `footer_img_four`, `footer_img_one_link`, `footer_img_two_link`, `footer_img_three_link`, `footer_img_four_link`, `footer_img_five`, `footer_img_five_link`, `footer_img_six`, `footer_img_six_link`, `promotional_banner_one`, `promotional_banner_one_status`, `promotional_banner_one_url`, `promotional_banner_two`, `promotional_banner_two_status`, `promotional_banner_two_url`, `promotional_banner_restaurant`, `promotional_banner_restaurant_status`, `promotional_banner_restaurant_url`, `blog_banner_one`, `blog_banner_one_link`, `blog_banner_one_status`, `blog_banner_two`, `blog_banner_two_link`, `blog_banner_two_status`, `show_working_step_on_mobile`) VALUES
(1, 'uploads/custom-images/intro-one--2025-03-12-09-54-08-1066.webp', 'uploads/custom-images/intro-two--2025-03-12-09-55-13-9441.webp', 'uploads/custom-images/working-step--2025-03-13-04-24-57-3207.webp', 'uploads/custom-images/working-step--2025-03-13-04-26-01-4923.webp', 'uploads/custom-images/working-step--2025-03-12-09-57-57-5214.webp', 'uploads/custom-images/working-step--2025-03-12-09-57-57-7737.webp', 'uploads/custom-images/working-step--2025-03-12-09-57-57-7531.webp', 'uploads/custom-images/working-step--2025-03-12-09-57-57-7223.webp', NULL, '2025-04-29 02:56:05', 'https://play.google.com/store/apps', 'https://www.apple.com/store', 'uploads/custom-images/intro-one--2025-03-13-04-28-15-5904.webp', 'uploads/custom-images/intro-two--2025-03-13-04-28-15-8800.webp', 'uploads/custom-images/intro-two--2025-03-13-04-28-16-5978.webp', 'uploads/custom-images/intro-two--2025-04-29-08-52-44-9192.webp', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'uploads/custom-images/intro-two--2025-04-29-08-56-05-7201.webp', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'uploads/custom-images/intro-two--2025-04-29-08-52-44-7955.webp', 'https://codecanyon.net/user/quomodotheme/portfolio?page=2', 'uploads/custom-images/-2025-03-13-05-08-27-9921.webp', '1', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/-2025-03-13-05-08-28-9322.webp', '1', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/-2025-04-21-06-43-57-9361.webp', '1', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/blog-banner-one-2025-03-13-05-15-46-8390.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', 'uploads/custom-images/blog-banner-two-2025-03-13-05-15-46-2332.webp', 'https://codecanyon.net/user/quomodotheme/portfolio', '1', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_translations`
--

CREATE TABLE `homepage_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `homepage_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `working_step_title1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_title2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_title3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_title4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_restaurant_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `join_restaurant_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_app_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_app_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `working_step_des1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_des2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_des3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_step_des4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homepage_translations`
--

INSERT INTO `homepage_translations` (`id`, `homepage_id`, `lang_code`, `intro_title`, `intro_tags`, `working_step_title1`, `working_step_title2`, `working_step_title3`, `working_step_title4`, `join_restaurant_title`, `join_restaurant_des`, `mobile_app_title`, `mobile_app_des`, `created_at`, `updated_at`, `working_step_des1`, `working_step_des2`, `working_step_des3`, `working_step_des4`) VALUES
(1, 1, 'en', 'Buy or Sell your Delicious Food Effortlessly!', '[{\"value\":\"pizza\"},{\"value\":\"chicken\"},{\"value\":\"chocolate\"}]', 'Search Product', 'Add to Cart', 'Enjoy Food', 'Flexible Payment', 'Join Our Restaurant <span> Food Delivery</span> Service Today!', 'We’ve 15m+ Global and Local Happy Customers, Let’s make the world Happening together.', 'Get a Mobile Application Enjoy Food Experiences', 'We\'ve done it carefully and simply. Combined with the ingredients makes for beautiful landings.', NULL, '2025-05-08 02:14:13', 'Unlocking you effect product searching', 'Add to Cart for Instant Retail Gratification', 'A Journey to Enjoying Food’s Delights', 'Pay online with Multiple credit Cards or Cash!'),
(4, 1, 'bn', 'আপনার সুস্বাদু খাবার কিনুন বা বিক্রি করুন অনায়াসে!', '[{\"value\":\"pizza\"},{\"value\":\"sandwitch\"},{\"value\":\"lacchi\"}]', 'পণ্য অনুসন্ধান করুন', 'কার্টে যোগ করুন', 'খাবার উপভোগ করুন', 'নমনীয় পেমেন্ট', 'আজই আমাদের রেস্তোরাঁর <span>খাবার ডেলিভারি</span> পরিষেবায় যোগদান করুন!', 'আমাদের ১ কোটি ৫০ লক্ষেরও বেশি বিশ্বব্যাপী এবং স্থানীয় সুখী গ্রাহক রয়েছে, আসুন একসাথে বিশ্বকে সফল করি।', 'একটি মোবাইল অ্যাপ্লিকেশন পান খাবারের অভিজ্ঞতা উপভোগ করুন', 'আমরা এটি খুব যত্ন সহকারে এবং সহজভাবে করেছি। উপকরণগুলির সাথে মিশ্রিত করলে সুন্দর অবতরণ তৈরি হয়।', '2025-04-29 03:55:33', '2025-05-08 02:18:11', 'আপনার প্রভাব পণ্য অনুসন্ধান আনলক করা হচ্ছে', 'তাৎক্ষণিক খুচরা সন্তুষ্টির জন্য কার্টে যোগ করুন', 'খাবারের স্বাদ উপভোগ করার যাত্রা', 'একাধিক ক্রেডিট কার্ড বা নগদ অর্থ দিয়ে অনলাইনে অর্থ প্রদান করুন!');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `lang_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang_name`, `lang_code`, `lang_direction`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'left_to_right', 'yes', 1, '2024-05-07 11:56:30', '2025-03-12 01:58:29'),
(16, 'Bangla', 'bn', 'left_to_right', 'No', 1, '2025-04-29 03:55:32', '2025-04-29 03:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'header',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_item_id` bigint UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_translations`
--

CREATE TABLE `menu_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 2),
(9, '2024_05_06_161335_create_admins_table', 3),
(10, '2024_05_06_182035_create_global_settings_table', 4),
(11, '2024_05_07_174113_create_languages_table', 5),
(12, '2024_05_07_180516_create_currencies_table', 6),
(15, '2024_05_09_045544_create_testimonials_table', 7),
(16, '2024_05_09_045555_create_testimonial_trasnlations_table', 7),
(19, '2024_05_09_080956_create_email_settings_table', 8),
(20, '2024_05_09_082850_create_email_templates_table', 9),
(21, '2024_05_09_090449_add_statu_to_users', 10),
(22, '2024_05_09_090506_add_personal_info_to_admins', 10),
(23, '2024_05_09_091106_add_avatar_to_admins', 11),
(24, '2024_05_09_100009_create_seo_settings_table', 12),
(27, '2024_05_09_110823_create_term_and_conditions_table', 13),
(28, '2024_05_09_111521_create_privacy_policies_table', 13),
(29, '2024_05_09_114012_create_faqs_table', 14),
(30, '2024_05_09_114027_create_faq_translations_table', 14),
(31, '2024_05_08_151634_create_blogs_table', 15),
(32, '2024_05_08_152208_create_blog_categories_table', 15),
(33, '2024_05_08_152741_create_blog_translations_table', 15),
(34, '2024_05_08_152807_create_blog_category_translations_table', 15),
(35, '2024_05_12_064013_create_blog_comments_table', 16),
(36, '2024_01_31_044113_create_cities_table', 17),
(37, '2024_01_31_045030_create_city_translations_table', 17),
(38, '2024_02_24_052456_create_categories_table', 17),
(39, '2024_02_24_054937_create_sub_categories_table', 17),
(40, '2024_02_24_054952_create_sub_category_translations_table', 17),
(41, '2024_04_29_101944_create_cuisines_table', 17),
(42, '2024_04_29_102010_create_cuisine_translations_table', 17),
(43, '2024_05_01_065315_create_restaurants_table', 17),
(44, '2024_05_13_053040_add_city_image_to_cities', 18),
(45, '2024_05_13_060052_create_category_translations', 19),
(46, '2024_05_13_062301_add_icon_to_categories', 20),
(47, '2024_05_13_062424_add_category_id_to_category_translation', 21),
(48, '2024_05_13_081716_create_payment_gateways_table', 22),
(50, '2024_05_13_103531_create_coupons_table', 23),
(53, '2024_05_13_121650_create_homepages_table', 24),
(54, '2024_05_13_122614_create_homepage_translations_table', 24),
(55, '2024_05_14_102923_add_working_des_to_homepage_translations', 25),
(56, '2024_05_14_115626_add_app_link_to_homepages', 26),
(57, '2024_05_15_043027_create_about_us_table', 27),
(58, '2024_05_15_043043_create_about_us_translations_table', 27),
(59, '2024_08_13_080541_create_addons_table', 28),
(60, '2024_08_13_080553_create_addon_translations_table', 28),
(63, '2024_08_20_104024_add_new_fields_to_users_table', 29),
(66, '2024_08_14_061706_create_products_table', 32),
(67, '2024_08_14_061718_create_product_translations_table', 32),
(68, '2024_08_25_084145_add_featured_col_to_products_table', 33),
(69, '2024_08_28_114703_create_subscribers_table', 34),
(70, '2024_09_01_102413_create_wishlists_table', 35),
(71, '2024_09_05_065854_create_delivery_areas_table', 36),
(72, '2024_09_05_102615_create_time_slots_table', 37),
(76, '2024_08_24_070514_create_user_addresses_table', 39),
(78, '2024_09_19_032327_create_orders_table', 40),
(79, '2024_09_19_032350_create_order_items_table', 40),
(80, '2024_09_19_103134_create_contact_messages_table', 41),
(81, '2024_09_21_032550_create_restaurant_wishlists_table', 42),
(82, '2024_06_28_145313_create_withdraw_methods_table', 43),
(83, '2024_06_28_161601_create_seller_withdraws_table', 43),
(84, '2023_08_24_091604_create_contact_us_table', 44),
(85, '2024_01_28_094246_create_contact_us_translations_table', 44),
(86, '2024_10_15_035257_add_column_to_restaurants_table', 45),
(87, '2024_10_17_045555_add_column_to_users_table', 46),
(88, '2024_10_19_065807_add_columns_to_homepages_table', 47),
(89, '2024_10_21_091140_create_reviews_table', 48),
(90, '2024_10_22_040907_add_column_to_reviews_table', 49),
(91, '2024_10_22_052809_create_banners_table', 50),
(92, '2024_10_22_091433_create_offers_table', 51),
(93, '2024_10_22_091444_create_offer_products_table', 51),
(94, '2024_10_24_040242_add_columns_to_homepages_table', 52),
(95, '2024_11_13_054938_create_footers_table', 53),
(96, '2024_11_13_054952_create_footer_translations_table', 53),
(97, '2025_02_27_090502_create_delivery_men_table', 54),
(98, '2025_02_27_101004_create_delivery_messages_table', 55),
(99, '2025_02_27_102059_add_delivery_man_id_to_orders_table', 55),
(100, '2025_03_02_053034_add_remember_token_to_delivery_men_table', 56),
(101, '2025_03_02_074939_add_order_request_to_orders_table', 57),
(102, '2025_03_02_082927_add_order_request_date_to_orders_table', 58),
(103, '2025_03_04_065424_create_deliveryman_withdraws_table', 59),
(104, '2025_03_04_065617_create_deliveryman_withdraw_methods_table', 59),
(105, '2025_03_05_052427_add_is_deliveryman_to_seller_withdraws_table', 59),
(106, '2025_05_07_054211_add_admin_type_to_admins', 60),
(107, '2025_05_07_062758_create_sms_settings_table', 61),
(108, '2025_05_07_062947_create_sms_templates_table', 61),
(109, '2024_01_01_000001_create_menus_table', 62),
(110, '2024_01_01_000002_create_menu_items_table', 62),
(111, '2024_01_01_000003_create_menu_translations_table', 62),
(112, '2024_01_01_000004_create_menu_item_translations_table', 62),
(113, '2024_12_19_000000_create_pwa_icon_settings_table', 62),
(114, '2025_08_16_115924_create_user_otps_table', 63),
(115, '2024_01_15_000000_create_carts_table', 64),
(116, '2024_01_15_000001_create_cart_addons_table', 64),
(119, '2025_10_28_000002_add_delivery_man_registration_fields', 65),
(120, '2025_10_28_100001_create_document_types_table', 66),
(121, '2025_10_28_100002_create_document_type_translations_table', 66),
(122, '2025_10_28_100003_create_vehicle_types_table', 66),
(123, '2025_10_28_100004_create_vehicle_type_translations_table', 66);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` double NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `title`, `description`, `offer`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy 25% Discount!', 'Upcoming Black Friday Offer', 5, '2025-06-30 00:00', 1, '2024-10-22 04:40:53', '2025-04-21 00:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `offer_products`
--

CREATE TABLE `offer_products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_products`
--

INSERT INTO `offer_products` (`id`, `product_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 15, 1, '2025-04-21 00:32:38', '2025-04-21 00:32:38'),
(3, 17, 1, '2025-04-21 00:32:47', '2025-04-21 00:32:47'),
(4, 47, 1, '2025-04-21 00:32:52', '2025-04-21 00:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `time_slot_id` bigint UNSIGNED DEFAULT NULL,
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `delivery_charge` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `is_guest` tinyint NOT NULL DEFAULT '0',
  `tnx_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` int NOT NULL DEFAULT '0',
  `order_request` int NOT NULL DEFAULT '0',
  `order_req_date` date DEFAULT NULL,
  `order_req_accept_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `restaurant_id`, `address_id`, `time_slot_id`, `order_type`, `delivery_day`, `coupon`, `discount_amount`, `delivery_charge`, `vat`, `total`, `grand_total`, `payment_method`, `payment_status`, `order_status`, `is_guest`, `tnx_info`, `delivery_address`, `created_at`, `updated_at`, `delivery_man_id`, `order_request`, `order_req_date`, `order_req_accept_date`) VALUES
(1, 269255, 1, 1, NULL, 'delivery', NULL, '', 0, 10.582455741646, 0, 50, 60.582455741646, 'Stripe', 'success', 6, 1, 'txn_3R2og7IZGCIQ9M8p2zx8zoWl', '{\"user_id\":269255,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel@gmail.com\",\"address_type\":\"office\",\"address\":\"Holding no-30, Road-03, Senpara Porbata, \\u09ae\\u09bf\\u09b0\\u09aa\\u09c1\\u09b0 \\u09e7\\u09e6 \\u09a8\\u0982 \\u0997\\u09cb\\u09b2\\u099a\\u09a4\\u09cd\\u09ac\\u09b0, \\u09a2\\u09be\\u0995\\u09be 1216, Bangladesh\",\"longitude\":\"23.804936084709645\",\"latitude\":\"90.3664471534424\"}', '2025-03-15 00:58:30', '2025-11-03 02:46:52', 0, 0, NULL, '2025-11-03'),
(2, 847061, 3, 2, NULL, 'delivery', NULL, '', 0, 584.26834586013, 0, 125, 709.26834586013, 'Stripe', 'success', 5, 1, 'txn_3R3Ak3IZGCIQ9M8p25TXgmSj', '{\"user_id\":847061,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"1 Rd No. 78, Dhaka 1212, Bangladesh\",\"longitude\":\"23.802894324178368\",\"latitude\":\"90.41571396862794\"}', '2025-03-16 00:32:02', '2025-11-03 02:48:19', 2, 3, NULL, '2025-11-03'),
(3, 507690, 3, 3, NULL, 'delivery', NULL, '', 0, 572.05054460805, 0, 85, 657.05054460805, 'Stripe', 'success', 5, 1, 'txn_3R3AtuIZGCIQ9M8p10isjb5t', '{\"user_id\":507690,\"contact_person_name\":\"David Richard\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"admin@gmail.com\",\"address_type\":\"home\",\"address\":\"Q9XC+MMX, Begum Rokeya Ave, Dhaka, Bangladesh\",\"longitude\":\"23.799324258653375\",\"latitude\":\"90.37181854248047\"}', '2025-03-16 00:42:10', '2025-11-03 02:54:02', 2, 3, NULL, '2025-11-03'),
(4, 1, 2, 4, NULL, 'delivery', NULL, '', 0, 17.683809382112, 0, 140, 157.68380938211, 'Stripe', 'success', 6, 0, 'txn_3R3BzrIZGCIQ9M8p24Ccmdwj', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-03-16 01:52:23', '2025-11-03 04:29:02', 2, 4, NULL, '2025-11-03'),
(5, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 105, 109.43308389447, 'Stripe', 'success', 5, 0, 'txn_3R3COLIZGCIQ9M8p2T7ZEwKh', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-03-16 02:17:41', '2025-03-23 23:57:07', 0, 0, NULL, NULL),
(6, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 65, 69.433083894466, 'Stripe', 'success', 5, 0, 'txn_3R3CVkIZGCIQ9M8p1J0GqNRY', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-03-16 02:25:20', '2025-04-21 01:29:43', 0, 0, NULL, NULL),
(7, 762815, 2, 6, NULL, 'delivery', NULL, '', 0, 4.0005451203685, 0, 200, 204.00054512037, 'Stripe', 'success', 1, 1, 'txn_3RGGDIIZGCIQ9M8p0kRLiloR', '{\"user_id\":762815,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"home\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"23.82469252189213\",\"latitude\":\"90.36740370583496\"}', '2025-04-21 03:00:31', '2025-04-21 03:00:31', 0, 0, NULL, NULL),
(8, 1, 1, 5, NULL, 'delivery', NULL, '', 0, 11.230819329777, 0, 28.5, 39.730819329777, 'Stripe', 'success', 2, 0, 'txn_3RGHVpIZGCIQ9M8p2QQP0zB6', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-04-21 04:23:40', '2025-10-19 23:41:56', 0, 0, NULL, NULL),
(9, 1, 1, 5, NULL, 'delivery', NULL, '', 0, 11.230819329777, 0, 100, 111.23081932978, 'Stripe', 'success', 5, 0, 'txn_3RJA0MIZGCIQ9M8p2uRaUxOc', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-04-29 02:59:11', '2025-12-10 00:05:51', 0, 0, NULL, NULL),
(10, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 105, 109.43308389447, 'Stripe', 'success', 5, 0, 'txn_3RJA5QIZGCIQ9M8p2ItMTac6', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-04-29 03:04:20', '2025-12-06 22:48:57', 0, 0, NULL, NULL),
(12, 708096, 2, 7, NULL, 'delivery', NULL, '', 0, 6.6301426381619, 0, 65, 71.630142638162, 'Stripe', 'success', 1, 1, 'txn_3RJCrZIZGCIQ9M8p1ZU9jbJw', '{\"user_id\":708096,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"01833022226\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"home\",\"address\":\"14 Road No 4, Dhaka 1216, Bangladesh\",\"longitude\":\"23.81675719853571\",\"latitude\":\"90.36735534667969\"}', '2025-04-29 06:02:13', '2025-04-29 06:02:13', 0, 0, NULL, NULL),
(13, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 70, 74.433083894466, 'Stripe', 'success', 6, 0, 'txn_3RLGsDIZGCIQ9M8p0HscsiUB', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 22:43:30', '2025-11-06 02:30:04', 0, 0, NULL, NULL),
(14, 1, 1, 5, NULL, 'delivery', NULL, '', 0, 11.230819329777, 0, 95, 106.23081932978, 'Stripe', 'success', 5, 0, 'txn_3RLH4qIZGCIQ9M8p2vBGG4Ya', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 22:56:29', '2025-10-10 21:09:51', 0, 0, NULL, NULL),
(15, 12, 1, 8, NULL, 'delivery', NULL, '', 0, 13.265449389004, 0, 95, 108.265449389, 'Stripe', 'success', 5, 1, 'txn_3RLHCyIZGCIQ9M8p1HZmY3VQ', '{\"user_id\":613484,\"contact_person_name\":\"Blue Cheese\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"seller@gmail.com\",\"address_type\":\"home\",\"address\":\"House 59\\/A, Section 11.5, Block B Rd No 3, \\u09a2\\u09be\\u0995\\u09be 1216, Bangladesh\",\"longitude\":\"23.82155181653423\",\"latitude\":\"90.36568709206543\"}', '2025-05-04 23:04:53', '2025-05-04 23:22:05', 0, 0, NULL, NULL),
(16, 1, 1, 5, NULL, 'delivery', NULL, 'newyear25', 9.5, 11.230819329777, 0, 95, 96.730819329777, 'Mollie', 'success', 6, 0, 'tr_QrftWMw9if', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 23:27:49', '2025-11-04 23:05:27', 0, 0, NULL, NULL),
(17, 1, 10, 5, NULL, 'delivery', NULL, '', 0, 363.54538618715, 0, 50, 413.54538618715, 'Paypal', 'success', 1, 0, 'ZUJKUEUDELUGE', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 23:29:07', '2025-05-04 23:29:07', 0, 0, NULL, NULL),
(18, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 30, 34.433083894466, 'Flutterwave', 'success', 4, 0, '9165666', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 23:36:15', '2025-11-05 21:22:04', 0, 0, NULL, NULL),
(19, 1, 1, 4, NULL, 'delivery', NULL, '', 0, 4.4330838944657, 0, 38, 42.433083894466, 'Razorpay', 'success', 3, 0, 'pay_QR8QtCxEsNvQQW', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 23:39:11', '2025-10-13 04:08:56', 0, 0, NULL, NULL),
(20, 1, 2, 4, NULL, 'delivery', NULL, '', 0, 17.683809382112, 0, 30, 47.683809382112, 'Bank Payment', 'success', 1, 0, 'test', '{\"user_id\":1,\"contact_person_name\":\"Suhail Husain\",\"contact_person_number\":\"01798562848\",\"contact_person_email\":\"sohel1@gmail.com\",\"address_type\":\"home\",\"address\":\"Dhaka\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-04 23:40:49', '2025-05-04 23:40:49', 0, 0, NULL, NULL),
(21, 261447, 2, 9, NULL, 'delivery', NULL, '', 0, 15.380972372126, 0, 30, 45.380972372126, 'Stripe', 'success', 1, 1, 'txn_3RLN7jIZGCIQ9M8p0pMeigkl', '{\"user_id\":261447,\"contact_person_name\":\"Blue Cheese\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"home\",\"address\":\"218\\/7 Begum Rokeya Avenue, Dhaka, Bangladesh\",\"longitude\":\"23.7907867\",\"latitude\":\"90.3756286\"}', '2025-05-05 05:23:54', '2025-05-05 05:23:54', 0, 0, NULL, NULL),
(22, 1, 2, 11, NULL, 'delivery', NULL, '', 0, 4.9211710007705, 0, 45, 49.92117100077, 'Stripe', 'success', 1, 0, 'txn_3RLcrdIZGCIQ9M8p10QCbQKE', '{\"user_id\":1,\"contact_person_name\":\"Abdur Rahman\",\"contact_person_number\":\"01833022226\",\"contact_person_email\":\"abdullah1@gmail.com\",\"address_type\":\"office\",\"address\":\"12 Mirpur Rd, Dhaka 1216, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-05 22:12:21', '2025-05-05 22:12:21', 0, 0, NULL, NULL),
(24, 1, 2, 5, NULL, 'delivery', NULL, '', 0, 11.358671737614, 0, 80, 91.358671737614, 'Stripe', 'success', 1, 0, 'txn_3RM46WIZGCIQ9M8p0dp4MVQx', '{\"user_id\":1,\"contact_person_name\":\"Ibrahim Khalil\",\"contact_person_number\":\"123-343-4444\",\"contact_person_email\":\"user@gmail.com\",\"address_type\":\"office\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"longitude\":\"\",\"latitude\":\"\"}', '2025-05-07 03:17:28', '2025-05-07 03:17:28', 0, 0, NULL, NULL),
(43, 12, 1, 13, 20, 'delivery', '60', 'newyear25', 0, 3.06, 13.6, 85, 101.66, 'Stripe', 'success', 3, 0, 'pi_3S0Fv8IZGCIQ9M8p1MEKJnGv', '{\"id\":13,\"user_id\":12,\"name\":\"John Doe\",\"lat\":\"23.91597198131313\",\"lon\":\"90.40872573852539\",\"email\":\"+1234567890\",\"phone\":\"+1234567890\",\"address\":\"123 Main Street, Apartment 4B\",\"delivery_type\":\"home\",\"is_guest\":0,\"created_at\":\"2025-08-23T21:05:27.000000Z\",\"updated_at\":\"2025-08-23T21:05:27.000000Z\"}', '2025-08-26 09:59:54', '2025-11-05 21:20:46', 0, 0, NULL, NULL),
(44, 12, 2, 57, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 485, 494.86, 'Bank Transfer', 'pending', 1, 0, 'BANK-TXN-2024-001', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-07 21:05:49', '2025-09-07 21:05:49', 0, 0, NULL, NULL),
(45, 12, 2, 57, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 0, 80, 83.06, 'Bank Transfer', 'pending', 1, 0, 'BANK-TXN-2024-001', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-07 21:09:01', '2025-09-07 21:09:01', 0, 0, NULL, NULL),
(46, 12, 2, 57, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 0, 80, 83.06, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-07 21:09:09', '2025-09-07 21:09:09', 0, 0, NULL, NULL),
(47, 12, 2, 57, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 160, 169.86, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-07 21:13:57', '2025-09-07 21:13:57', 0, 0, NULL, NULL),
(48, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', NULL, 0, 'fdfdf', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:03:30', '2025-09-08 00:03:30', 0, 0, NULL, NULL),
(49, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', NULL, 0, 'dfdf', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:07:08', '2025-09-08 00:07:08', 0, 0, NULL, NULL),
(50, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', NULL, 0, 'fdfdf', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:08:03', '2025-09-08 00:08:03', 0, 0, NULL, NULL),
(51, 12, 1, 57, 20, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', NULL, 0, 'dfdfdf', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-08 00:12:47', '2025-09-08 00:12:47', 0, 0, NULL, NULL),
(52, 12, 2, 56, 30, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":56,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.7147612\",\"lon\":\"90.4735964\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:42:11.000000Z\",\"updated_at\":\"2025-08-31T15:42:11.000000Z\"}', '2025-09-08 00:18:53', '2025-09-08 00:18:53', 0, 0, NULL, NULL),
(53, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 140, 140, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:23:18', '2025-09-08 00:23:18', 0, 0, NULL, NULL),
(54, 12, 2, 57, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Bank Transfer', 'pending', NULL, 0, 'hfjuvvu', '{\"id\":57,\"user_id\":\"12\",\"name\":\"tes\",\"lat\":\"23.729156907567496\",\"lon\":\"90.46042632311583\",\"email\":\"01829295\",\"phone\":\"01829295\",\"address\":\"PFH6+H58, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-08-31T15:43:26.000000Z\",\"updated_at\":\"2025-08-31T15:43:26.000000Z\"}', '2025-09-08 00:26:25', '2025-09-08 00:26:25', 0, 0, NULL, NULL),
(55, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', NULL, 0, 'bjjbj jvvj', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:27:32', '2025-09-08 00:27:32', 0, 0, NULL, NULL),
(56, 12, 2, 76, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Bank Transfer', 'pending', NULL, 0, 'vjjj', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:28:51', '2025-09-08 00:28:51', 0, 0, NULL, NULL),
(57, 12, 2, 76, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 30, 39.86, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":76,\"user_id\":\"12\",\"name\":\"asfh\",\"lat\":\"23.7147639\",\"lon\":\"90.473585\",\"email\":\"479\",\"phone\":\"479\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-06T02:29:24.000000Z\",\"updated_at\":\"2025-09-06T02:29:24.000000Z\"}', '2025-09-08 00:42:29', '2025-09-08 00:42:29', 0, 0, NULL, NULL),
(58, 12, 2, 83, 30, 'delivery', '60', '', 0, 0, 0, 280, 280, 'Bank Transfer', 'pending', NULL, 0, 'fdfdfdf', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 02:35:01', '2025-09-08 02:35:01', 0, 0, NULL, NULL),
(59, 12, 2, 83, 30, 'delivery', '60', '', 0, 0, 0, 280, 280, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 02:36:01', '2025-09-08 02:36:01', 0, 0, NULL, NULL),
(60, 12, 2, 83, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 280, 289.86, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 02:37:11', '2025-09-08 02:37:11', 0, 0, NULL, NULL),
(61, 12, 2, 83, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 02:38:48', '2025-09-08 02:38:48', 0, 0, NULL, NULL),
(62, 12, 2, 83, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Bank Transfer', 'pending', NULL, 0, 'IBBL', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 03:05:05', '2025-09-08 03:05:05', 0, 0, NULL, NULL),
(63, 12, 2, 83, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 40, 49.86, 'Bank Transfer', 'pending', NULL, 0, 'BANK-TXN-2024-001', '{\"id\":83,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.699274039602543\",\"lon\":\"90.55344432592392\",\"email\":\"01751800957\",\"phone\":\"01751800957\",\"address\":\"MHX3+88P, Bandar, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T08:32:58.000000Z\",\"updated_at\":\"2025-09-08T08:32:58.000000Z\"}', '2025-09-08 03:26:44', '2025-09-08 03:26:44', 0, 0, NULL, NULL),
(64, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'pending', NULL, 0, 'DBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-08 07:31:14', '2025-09-08 07:31:14', 0, 0, NULL, NULL),
(65, 95, 2, 88, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', NULL, 0, 'IBBL', '{\"id\":88,\"user_id\":\"95\",\"name\":\"Ibrahim\",\"lat\":\"24.346404768990062\",\"lon\":\"89.80841282755136\",\"email\":\"0154545\",\"phone\":\"0154545\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-09T04:37:51.000000Z\",\"updated_at\":\"2025-09-09T04:37:51.000000Z\"}', '2025-09-08 22:38:31', '2025-09-08 22:38:31', 0, 0, NULL, NULL),
(66, 95, 2, 88, 30, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'pending', NULL, 0, 'DBBL', '{\"id\":88,\"user_id\":\"95\",\"name\":\"Ibrahim\",\"lat\":\"24.346404768990062\",\"lon\":\"89.80841282755136\",\"email\":\"0154545\",\"phone\":\"0154545\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-09T04:37:51.000000Z\",\"updated_at\":\"2025-09-09T04:37:51.000000Z\"}', '2025-09-08 22:52:28', '2025-09-08 22:52:28', 0, 0, NULL, NULL),
(67, 95, 2, 88, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Bank Transfer', 'pending', NULL, 0, 'IBBBBLl', '{\"id\":88,\"user_id\":\"95\",\"name\":\"Ibrahim\",\"lat\":\"24.346404768990062\",\"lon\":\"89.80841282755136\",\"email\":\"0154545\",\"phone\":\"0154545\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-09T04:37:51.000000Z\",\"updated_at\":\"2025-09-09T04:37:51.000000Z\"}', '2025-09-08 23:01:32', '2025-09-08 23:01:32', 0, 0, NULL, NULL),
(68, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', NULL, 0, 'dfdff', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-08 23:02:42', '2025-09-08 23:02:42', 0, 0, NULL, NULL),
(69, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', NULL, 0, 'fgfg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-08 23:05:07', '2025-09-08 23:05:07', 0, 0, NULL, NULL),
(70, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 560, 560, 'Bank Transfer', 'pending', 1, 0, 'ggg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-08 23:22:28', '2025-09-08 23:22:28', 0, 0, NULL, NULL),
(71, 95, 2, 88, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":88,\"user_id\":\"95\",\"name\":\"Ibrahim\",\"lat\":\"24.346404768990062\",\"lon\":\"89.80841282755136\",\"email\":\"0154545\",\"phone\":\"0154545\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-09T04:37:51.000000Z\",\"updated_at\":\"2025-09-09T04:37:51.000000Z\"}', '2025-09-08 23:29:14', '2025-09-08 23:29:14', 0, 0, NULL, NULL),
(72, 95, 1, 88, 20, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 5, 0, 'DDD', '{\"id\":88,\"user_id\":\"95\",\"name\":\"Ibrahim\",\"lat\":\"24.346404768990062\",\"lon\":\"89.80841282755136\",\"email\":\"0154545\",\"phone\":\"0154545\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-09T04:37:51.000000Z\",\"updated_at\":\"2025-09-09T04:37:51.000000Z\"}', '2025-09-09 02:06:11', '2025-10-11 20:45:30', 0, 0, NULL, NULL),
(73, 1, 1, 11, 20, 'delivery', '60', 'newyear25', 0, 3.06, 13.6, 85, 101.66, 'Stripe', 'success', 5, 0, 'pi_3S5NSnIZGCIQ9M8p02seNe30', '{\"id\":11,\"user_id\":\"1\",\"name\":\"Abdur Rahman\",\"lat\":\"23.81597198131313\",\"lon\":\"90.40872573852539\",\"email\":\"abdullah1@gmail.com\",\"phone\":\"01833022226\",\"address\":\"12 Mirpur Rd, Dhaka 1216, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-05-06T04:10:51.000000Z\",\"updated_at\":\"2025-05-06T04:10:51.000000Z\"}', '2025-09-09 03:03:49', '2025-11-05 03:43:50', 0, 0, NULL, NULL),
(74, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'BBB', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:44:12', '2025-09-09 04:44:12', 0, 0, NULL, NULL),
(75, 12, 3, 84, 40, 'delivery', '70', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 1, 0, 'IBBBBB', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:45:54', '2025-09-09 04:45:54', 0, 0, NULL, NULL),
(76, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 6, 0, 'fdfdf', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:48:30', '2025-11-05 02:49:29', 0, 0, NULL, NULL),
(77, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 1, 0, 'hhhhh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:50:49', '2025-09-09 04:50:49', 0, 0, NULL, NULL),
(78, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 30, 30, 'Bank Transfer', 'pending', 5, 0, 'ibbbb', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:55:26', '2025-10-19 03:48:05', 0, 0, NULL, NULL),
(79, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 5, 0, 'uuuuu', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 04:58:43', '2025-10-11 20:47:03', 0, 0, NULL, NULL),
(80, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 30, 30, 'Bank Transfer', 'pending', 1, 0, 'ggg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 05:00:20', '2025-09-09 05:00:20', 0, 0, NULL, NULL),
(81, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 1, 0, 'hhhj', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:33:15', '2025-09-09 07:33:15', 0, 0, NULL, NULL),
(82, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'ff', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:38:55', '2025-09-09 07:38:55', 0, 0, NULL, NULL),
(83, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'fgg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:40:11', '2025-09-09 07:40:11', 0, 0, NULL, NULL),
(84, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 65, 65, 'Bank Transfer', 'pending', 1, 0, 'ggg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:43:50', '2025-09-09 07:43:50', 0, 0, NULL, NULL),
(85, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', 1, 0, 'ggh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:45:00', '2025-09-09 07:45:00', 0, 0, NULL, NULL),
(86, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'hhhh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:50:22', '2025-09-09 07:50:22', 0, 0, NULL, NULL),
(87, 12, 3, 84, 40, 'delivery', '70', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', 1, 0, 'iii', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:55:30', '2025-09-09 07:55:30', 0, 0, NULL, NULL),
(88, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 6, 0, 'ggh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:57:56', '2025-11-04 23:15:32', 0, 0, NULL, NULL),
(89, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'ffg', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 07:58:32', '2025-09-09 07:58:32', 0, 0, NULL, NULL),
(90, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 30, 30, 'Bank Transfer', 'pending', 1, 0, 'hyhh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 08:01:56', '2025-09-09 08:01:56', 0, 0, NULL, NULL),
(91, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'ggh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 08:06:33', '2025-09-09 08:06:33', 0, 0, NULL, NULL),
(92, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', 4, 0, 'ghh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 08:07:39', '2025-10-10 21:09:36', 0, 0, NULL, NULL),
(93, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'ghh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 08:08:44', '2025-09-09 08:08:44', 0, 0, NULL, NULL),
(94, 12, 10, 84, 30, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'pending', 6, 0, 'hh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 08:10:23', '2025-11-04 07:52:44', 2, 4, NULL, '2025-11-04'),
(95, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Stripe', 'success', 1, 0, 'pi_3S5fbEIZGCIQ9M8p0Ha2dFZz', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:25:44', '2025-09-09 22:25:44', 0, 0, NULL, NULL),
(96, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 30, 30, 'Stripe', 'success', 1, 0, 'pi_3S5fejIZGCIQ9M8p2g5jgLDG', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:29:20', '2025-09-09 22:29:20', 0, 0, NULL, NULL),
(97, 12, 3, 84, 40, 'delivery', '70', '', 0, 0, 0, 40, 40, 'Stripe', 'success', 1, 0, 'pi_3S5fhsIZGCIQ9M8p0gbOVQy4', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:32:35', '2025-09-09 22:32:35', 0, 0, NULL, NULL),
(98, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Stripe', 'success', 1, 0, 'pi_3S5fl5IZGCIQ9M8p0uSISnj0', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:35:55', '2025-09-09 22:35:55', 0, 0, NULL, NULL),
(99, 12, 1, 84, 20, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Stripe', 'success', 0, 0, 'pi_3S5focIZGCIQ9M8p2nGNZWFv', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:39:34', '2025-09-17 00:54:43', 0, 0, NULL, NULL),
(100, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Stripe', 'success', 1, 0, 'pi_3S5frMIZGCIQ9M8p1vTAHnPW', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:42:25', '2025-09-09 22:42:25', 0, 0, NULL, NULL),
(101, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Stripe', 'success', 1, 0, 'pi_3S5ft4IZGCIQ9M8p2VUM9W22', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:44:09', '2025-09-09 22:44:09', 0, 0, NULL, NULL),
(102, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Stripe', 'success', 1, 0, 'pi_3S5fyQIZGCIQ9M8p2ubMAB86', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 22:49:41', '2025-09-09 22:49:41', 0, 0, NULL, NULL),
(103, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'ikk', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-09 23:26:33', '2025-09-09 23:26:33', 0, 0, NULL, NULL),
(104, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'hghgh', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 00:46:38', '2025-09-10 00:46:38', 0, 0, NULL, NULL),
(105, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'oko', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 01:07:07', '2025-09-10 01:07:07', 0, 0, NULL, NULL),
(106, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 100, 100, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 03:25:20', '2025-09-10 03:25:20', 0, 0, NULL, NULL),
(107, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 04:21:12', '2025-09-10 04:21:12', 0, 0, NULL, NULL),
(108, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'DBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 04:29:15', '2025-09-10 04:29:15', 0, 0, NULL, NULL),
(109, 12, 2, 84, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'DBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 04:35:08', '2025-09-10 04:35:08', 0, 0, NULL, NULL),
(110, 12, 3, 84, 40, 'delivery', '70', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":84,\"user_id\":\"12\",\"name\":\"Ibrahim\",\"lat\":\"23.7147658\",\"lon\":\"90.4735841\",\"email\":\"017555\",\"phone\":\"017555\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-08T13:30:39.000000Z\",\"updated_at\":\"2025-09-08T13:30:39.000000Z\"}', '2025-09-10 04:35:45', '2025-09-10 04:35:45', 0, 0, NULL, NULL),
(111, 96, 2, 96, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":96,\"user_id\":\"96\",\"name\":\"Maso\",\"lat\":\"24.026637360311277\",\"lon\":\"89.64937191456556\",\"email\":\"masojet624@knilok.com\",\"phone\":\"01751989898\",\"address\":\"2MG2+795, Harirampur, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T02:56:38.000000Z\",\"updated_at\":\"2025-09-11T02:56:38.000000Z\"}', '2025-09-10 20:56:58', '2025-09-10 20:56:58', 0, 0, NULL, NULL),
(112, 12, 3, 90, 40, 'delivery', '70', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 1, 0, 'DBBL', '{\"id\":90,\"user_id\":\"12\",\"name\":\"Ibrahim khan\",\"lat\":\"23.7147702\",\"lon\":\"90.4735861\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-10T14:03:17.000000Z\",\"updated_at\":\"2025-09-10T14:03:17.000000Z\"}', '2025-09-10 22:41:56', '2025-09-10 22:41:56', 0, 0, NULL, NULL),
(113, 12, 2, 90, 30, 'delivery', '60', '', 0, 0, 0, 200, 200, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":90,\"user_id\":\"12\",\"name\":\"Ibrahim khan\",\"lat\":\"23.7147702\",\"lon\":\"90.4735861\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-10T14:03:17.000000Z\",\"updated_at\":\"2025-09-10T14:03:17.000000Z\"}', '2025-09-10 23:08:01', '2025-09-10 23:08:01', 0, 0, NULL, NULL),
(114, 12, 2, 90, 30, 'delivery', '60', '', 0, 0, 0, 200, 200, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":90,\"user_id\":\"12\",\"name\":\"Ibrahim khan\",\"lat\":\"23.7147702\",\"lon\":\"90.4735861\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-10T14:03:17.000000Z\",\"updated_at\":\"2025-09-10T14:03:17.000000Z\"}', '2025-09-10 23:08:13', '2025-09-10 23:08:13', 0, 0, NULL, NULL),
(115, 12, 2, 97, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":97,\"user_id\":\"12\",\"name\":\"Ibrahim khan\",\"lat\":\"23.7147702\",\"lon\":\"90.4735861\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T06:15:58.000000Z\",\"updated_at\":\"2025-09-11T06:15:58.000000Z\"}', '2025-09-11 00:16:13', '2025-09-11 00:16:13', 0, 0, NULL, NULL),
(116, 12, 1, 97, 20, 'delivery', '60', '', 0, 0, 0, 200, 200, 'Bank Transfer', 'pending', 6, 0, 'DBBL', '{\"id\":97,\"user_id\":\"12\",\"name\":\"Ibrahim khan\",\"lat\":\"23.7147702\",\"lon\":\"90.4735861\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"24 Lane 4, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T06:15:58.000000Z\",\"updated_at\":\"2025-09-11T06:15:58.000000Z\"}', '2025-09-11 00:18:59', '2025-10-10 21:04:55', 0, 0, NULL, NULL),
(117, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'kjfk kfd', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-11 03:48:10', '2025-09-11 03:48:10', 0, 0, NULL, NULL),
(118, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 340, 340, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-11 04:59:46', '2025-09-11 04:59:46', 0, 0, NULL, NULL);
INSERT INTO `orders` (`id`, `user_id`, `restaurant_id`, `address_id`, `time_slot_id`, `order_type`, `delivery_day`, `coupon`, `discount_amount`, `delivery_charge`, `vat`, `total`, `grand_total`, `payment_method`, `payment_status`, `order_status`, `is_guest`, `tnx_info`, `delivery_address`, `created_at`, `updated_at`, `delivery_man_id`, `order_request`, `order_req_date`, `order_req_accept_date`) VALUES
(119, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-11 05:00:55', '2025-09-11 05:00:55', 0, 0, NULL, NULL),
(120, 12, 1, 98, 20, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 85, 94.86, 'Bank Transfer', 'pending', 6, 0, 'BANK-TXN-2024-001', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-11 05:02:24', '2025-11-04 22:58:33', 0, 0, NULL, NULL),
(121, 12, 2, 98, 30, 'delivery', '60', 'SAVE20', 0, 3.06, 6.8, 40, 49.86, 'Bank Transfer', 'pending', 1, 0, 'BANK-TXN-2024-001', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-11 05:17:47', '2025-09-11 05:17:47', 0, 0, NULL, NULL),
(122, 97, 10, 100, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":100,\"user_id\":\"97\",\"name\":\"Ibrahim\",\"lat\":\"24.696682010191388\",\"lon\":\"90.22704463452101\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"015151515\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-13T03:29:19.000000Z\",\"updated_at\":\"2025-09-13T03:29:19.000000Z\"}', '2025-09-12 21:30:06', '2025-11-04 02:08:38', 2, 3, NULL, '2025-11-04'),
(123, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 1, 0, 'DBBL', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-13 05:05:18', '2025-09-13 05:05:18', 0, 0, NULL, NULL),
(124, 99, 2, 101, 30, 'delivery', '60', '', 0, 0, 0, 105, 105, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":101,\"user_id\":\"99\",\"name\":\"Ibrahim\",\"lat\":\"23.588751312383287\",\"lon\":\"90.12737073004246\",\"email\":\"hafeg60363@obirah.com\",\"phone\":\"01751800957\",\"address\":\"H4RF+2W, Char Madhur, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-13T11:17:55.000000Z\",\"updated_at\":\"2025-09-13T11:17:55.000000Z\"}', '2025-09-13 05:18:07', '2025-09-13 05:18:07', 0, 0, NULL, NULL),
(125, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 160, 160, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-13 21:51:25', '2025-09-13 21:51:25', 0, 0, NULL, NULL),
(126, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 85, 85, 'Bank Transfer', 'pending', 1, 0, 'fkdfjkdjfk', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-14 00:17:46', '2025-09-14 00:17:46', 0, 0, NULL, NULL),
(127, 100, 2, 102, 30, 'delivery', '60', '', 0, 0, 0, 240, 240, 'Stripe', 'success', 1, 0, 'pi_3S7BCmIZGCIQ9M8p21FXhoCz', '{\"id\":102,\"user_id\":\"100\",\"name\":\"Ibrahim Khan\",\"lat\":\"23.8121721\",\"lon\":\"90.3679738\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"9 Rd No. 7, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-14T08:21:41.000000Z\",\"updated_at\":\"2025-09-14T08:21:41.000000Z\"}', '2025-09-14 02:22:44', '2025-09-14 02:22:44', 0, 0, NULL, NULL),
(128, 12, 2, 98, 30, 'delivery', '60', '', 0, 0, 0, 250, 250, 'Bank Transfer', 'pending', 1, 0, 'ffdf', '{\"id\":98,\"user_id\":\"12\",\"name\":\"Ibrahim Khan\",\"lat\":\"24.18535184434867\",\"lon\":\"90.04693027585745\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"52PW+CG3, Mohera, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-11T08:19:23.000000Z\",\"updated_at\":\"2025-09-11T08:19:41.000000Z\"}', '2025-09-14 21:45:34', '2025-09-14 21:45:34', 0, 0, NULL, NULL),
(129, 12, 2, 103, 30, 'delivery', '60', '', 0, 0, 0, 2040, 2040, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":103,\"user_id\":\"12\",\"name\":\"ahmed\",\"lat\":\"23.77726746485494\",\"lon\":\"90.40507055819035\",\"email\":\"Ahmed@gmail.com\",\"phone\":\"045498\",\"address\":\"QCG3+XX8, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-27T10:33:15.000000Z\",\"updated_at\":\"2025-09-27T10:33:15.000000Z\"}', '2025-09-27 05:03:44', '2025-09-27 05:03:44', 0, 0, NULL, NULL),
(130, 12, 2, 103, 30, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":103,\"user_id\":\"12\",\"name\":\"ahmed\",\"lat\":\"23.77726746485494\",\"lon\":\"90.40507055819035\",\"email\":\"Ahmed@gmail.com\",\"phone\":\"045498\",\"address\":\"QCG3+XX8, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-09-27T10:33:15.000000Z\",\"updated_at\":\"2025-09-27T10:33:15.000000Z\"}', '2025-09-27 05:04:38', '2025-09-27 05:04:38', 0, 0, NULL, NULL),
(131, 1, 2, 4, 30, 'delivery', '60', '', 0, 0, 0, 85, 85, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"Dhaka\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-03-16T07:50:45.000000Z\"}', '2025-09-28 21:12:29', '2025-09-28 21:12:29', 0, 0, NULL, NULL),
(132, 1, 8, 4, 30, 'delivery', '60', '', 0, 0, 0, 90, 90, 'Bank Transfer', 'pending', 6, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"Dhaka\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-03-16T07:50:45.000000Z\"}', '2025-09-28 21:13:38', '2025-11-04 02:08:25', 2, 4, NULL, '2025-11-04'),
(133, 1, 10, 4, 30, 'delivery', '60', '', 0, 0, 0, 105, 105, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"Dhaka\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-03-16T07:50:45.000000Z\"}', '2025-09-28 21:15:43', '2025-11-04 02:03:35', 2, 3, NULL, '2025-11-04'),
(134, 1, 1, 4, 10, 'delivery', '60', '', 0, 0, 0, 90, 90, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"Dhaka\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-03-16T07:50:45.000000Z\"}', '2025-09-28 22:01:44', '2025-10-10 21:14:51', 0, 0, NULL, NULL),
(135, 1, 2, 4, 30, 'delivery', '60', '', 0, 0, 0, 110, 110, 'Bank Transfer', 'pending', 1, 0, 'jcjchc', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"Dhaka\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-03-16T07:50:45.000000Z\"}', '2025-09-29 22:16:36', '2025-09-29 22:16:36', 0, 0, NULL, NULL),
(136, 1, 10, 5, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 6, 0, 'IBBL', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim Khalil\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-04-21T07:28:23.000000Z\"}', '2025-09-29 22:42:00', '2025-11-03 21:41:45', 2, 4, NULL, '2025-11-04'),
(137, 1, 10, 5, 30, 'delivery', '60', '', 0, 0, 0, 120, 120, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim Khalil\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"Mirpur-10, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-04-21T07:28:23.000000Z\"}', '2025-09-29 22:42:14', '2025-11-04 00:07:12', 2, 3, NULL, NULL),
(138, 110, 2, 110, 30, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'DBBL', '{\"id\":110,\"user_id\":\"110\",\"name\":\"Test\",\"lat\":\"23.575371876614533\",\"lon\":\"89.98460177332163\",\"email\":\"test@gmail.com\",\"phone\":\"015155115\",\"address\":\"HXGM+G2M, Charbhadrasan, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-01T03:11:57.000000Z\",\"updated_at\":\"2025-10-01T03:11:57.000000Z\"}', '2025-09-30 21:12:14', '2025-09-30 21:12:14', 0, 0, NULL, NULL),
(139, 1, 2, 5, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"House 8, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-09-30T10:16:39.000000Z\"}', '2025-09-30 21:43:57', '2025-09-30 21:43:57', 0, 0, NULL, NULL),
(140, 111, 2, 113, 30, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'success', 2, 0, 'Ibbl', '{\"id\":113,\"user_id\":\"111\",\"name\":\"fila\",\"lat\":\"23.805076908994707\",\"lon\":\"90.36347921937704\",\"email\":\"fila@gmail.com\",\"phone\":\"0176886883\",\"address\":\"R947+29X, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-01T04:26:21.000000Z\",\"updated_at\":\"2025-10-01T04:26:21.000000Z\"}', '2025-09-30 22:27:58', '2025-09-30 22:41:48', 0, 0, NULL, NULL),
(141, 1, 2, 4, 20, 'delivery', '60', '', 0, 0, 0, 600, 600, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain1\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"MQ86+W5P, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-09-30T10:16:11.000000Z\"}', '2025-10-02 01:40:32', '2025-10-02 01:40:32', 0, 0, NULL, NULL),
(142, 1, 2, 4, 20, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain1\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"MQ86+W5P, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-09-30T10:16:11.000000Z\"}', '2025-10-02 01:42:01', '2025-10-02 01:42:01', 0, 0, NULL, NULL),
(143, 1, 2, 4, 20, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain1\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"MQ86+W5P, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-09-30T10:16:11.000000Z\"}', '2025-10-02 01:42:07', '2025-10-02 01:42:07', 0, 0, NULL, NULL),
(144, 1, 2, 5, 20, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"House 8, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-09-30T10:16:39.000000Z\"}', '2025-10-05 21:06:37', '2025-10-05 21:06:37', 0, 0, NULL, NULL),
(145, 115, 2, 116, 20, 'delivery', '60', '', 0, 0, 0, 45, 45, 'Bank Transfer', 'success', 2, 0, 'ibbl', '{\"id\":116,\"user_id\":\"115\",\"name\":\"Ibrahim\",\"lat\":\"23.812198\",\"lon\":\"90.3678987\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"017598258\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-06T05:43:37.000000Z\",\"updated_at\":\"2025-10-06T05:43:37.000000Z\"}', '2025-10-05 23:44:06', '2025-10-05 23:48:35', 0, 0, NULL, NULL),
(146, 116, 10, 117, 30, 'delivery', '60', '', 0, 0, 0, 70, 70, 'Bank Transfer', 'pending', 5, 0, 'test', '{\"id\":117,\"user_id\":\"116\",\"name\":\"Ahmed\",\"lat\":\"23.170264974659133\",\"lon\":\"90.28833478689194\",\"email\":\"ahmed@gmail.com\",\"phone\":\"0185695656446\",\"address\":\"Nambihin Rasta, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-06T09:11:15.000000Z\",\"updated_at\":\"2025-10-06T09:11:15.000000Z\"}', '2025-10-06 03:11:47', '2025-11-04 00:01:03', 2, 3, NULL, NULL),
(147, 1, 2, 5, 10, 'delivery', '60', '', 0, 0, 0, 125, 125, 'Bank Transfer', 'pending', 1, 0, 'ibbl', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"House 8, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-09-30T10:16:39.000000Z\"}', '2025-10-07 09:28:44', '2025-10-07 09:28:44', 0, 0, NULL, NULL),
(148, 117, 4, 118, 30, 'delivery', '120', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'success', 5, 0, 'IBBL', '{\"id\":118,\"user_id\":\"117\",\"name\":\"Test\",\"lat\":\"23.83167664989689\",\"lon\":\"90.34306861460209\",\"email\":\"test@gmail.com\",\"phone\":\"0178959595\",\"address\":\"R8JR+4R, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-08T10:30:24.000000Z\",\"updated_at\":\"2025-10-08T10:30:24.000000Z\"}', '2025-10-08 04:34:32', '2025-10-08 04:38:10', 3, 0, NULL, NULL),
(149, 118, 7, 120, 30, 'delivery', '60', '', 0, 0, 0, 110, 110, 'Bank Transfer', 'success', 5, 0, 'IBBL', '{\"id\":120,\"user_id\":\"118\",\"name\":\"Ibrahim\",\"lat\":\"23.8121762\",\"lon\":\"90.3678988\",\"email\":\"secav59843@fintehs.com\",\"phone\":\"01751800957\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-09T03:02:01.000000Z\",\"updated_at\":\"2025-10-09T03:02:01.000000Z\"}', '2025-10-08 21:38:03', '2025-10-08 23:07:55', 0, 0, NULL, NULL),
(150, 118, 7, 120, 30, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', 2, 0, 'IBBL', '{\"id\":120,\"user_id\":\"118\",\"name\":\"Ibrahim\",\"lat\":\"23.8121762\",\"lon\":\"90.3678988\",\"email\":\"secav59843@fintehs.com\",\"phone\":\"01751800957\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-09T03:02:01.000000Z\",\"updated_at\":\"2025-10-09T03:02:01.000000Z\"}', '2025-10-08 23:39:19', '2025-10-10 21:15:40', 0, 0, NULL, NULL),
(151, 1, 7, 5, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"House 8, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-09-30T10:16:39.000000Z\"}', '2025-10-12 22:23:25', '2025-11-03 22:05:57', 2, 3, NULL, '2025-11-04'),
(152, 1, 2, 4, 10, 'delivery', '60', '', 0, 0, 0, 65, 65, 'Stripe', 'success', 1, 0, 'pi_3SHegWIZGCIQ9M8p0B7hqxOz', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain1\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"MQ86+W5P, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-09-30T10:16:11.000000Z\"}', '2025-10-12 23:52:44', '2025-10-12 23:52:44', 0, 0, NULL, NULL),
(153, 1, 7, 5, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Stripe', 'success', 1, 0, 'pi_3SHenBIZGCIQ9M8p2ioefTWR', '{\"id\":5,\"user_id\":\"1\",\"name\":\"Ibrahim\",\"lat\":\"23.8028556\",\"lon\":\"90.3748344\",\"email\":\"user@gmail.com\",\"phone\":\"123-343-4444\",\"address\":\"House 8, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-04-21T07:28:23.000000Z\",\"updated_at\":\"2025-09-30T10:16:39.000000Z\"}', '2025-10-12 23:59:36', '2025-10-12 23:59:36', 0, 0, NULL, NULL),
(154, 1, 7, 4, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Stripe', 'success', 2, 0, 'pi_3SHf2UIZGCIQ9M8p0uvFV1Iy', '{\"id\":4,\"user_id\":\"1\",\"name\":\"Suhail Husain1\",\"lat\":\"23.804093\",\"lon\":\"90.4152376\",\"email\":\"sohel1@gmail.com\",\"phone\":\"01798562848\",\"address\":\"MQ86+W5P, , Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-03-16T07:50:45.000000Z\",\"updated_at\":\"2025-09-30T10:16:11.000000Z\"}', '2025-10-13 00:15:25', '2025-10-18 21:32:10', 0, 0, NULL, NULL),
(155, 125, 7, 124, 30, 'pickup', '60', '', 0, 0, 0, 150, 150, 'Stripe', 'success', 6, 0, 'pi_3SHhXJIZGCIQ9M8p1OVywnCN', '{\"id\":124,\"user_id\":\"125\",\"name\":\"Ibrahim\",\"lat\":\"23.8121909\",\"lon\":\"90.367889\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800972\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-10-13T08:54:20.000000Z\",\"updated_at\":\"2025-10-13T08:54:20.000000Z\"}', '2025-10-13 02:55:25', '2025-11-03 04:05:19', 2, 4, NULL, '2025-11-03'),
(156, 125, 7, 124, 30, 'delivery', '60', '', 0, 0, 0, 50, 50, 'Bank Transfer', 'pending', 5, 0, 'IBBL', '{\"id\":124,\"user_id\":\"125\",\"name\":\"Ibrahim\",\"lat\":\"23.8121909\",\"lon\":\"90.367889\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800972\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-10-13T08:54:20.000000Z\",\"updated_at\":\"2025-10-13T08:54:20.000000Z\"}', '2025-10-13 03:00:17', '2025-11-03 22:00:04', 2, 3, NULL, '2025-11-03'),
(157, 125, 10, 124, 20, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Bank Transfer', 'success', 5, 0, 'ibbl', '{\"id\":124,\"user_id\":\"125\",\"name\":\"Ibrahim\",\"lat\":\"23.8121909\",\"lon\":\"90.367889\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800972\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-10-13T08:54:20.000000Z\",\"updated_at\":\"2025-10-13T08:54:20.000000Z\"}', '2025-10-13 03:03:17', '2025-11-03 03:13:35', 2, 3, NULL, '2025-11-03'),
(158, 125, 4, 124, 30, 'delivery', '120', '', 0, 0, 0, 75, 75, 'Bank Transfer', 'pending', 6, 0, 'IBBL', '{\"id\":124,\"user_id\":\"125\",\"name\":\"Ibrahim\",\"lat\":\"23.8121909\",\"lon\":\"90.367889\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800972\",\"address\":\"House 8, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-10-13T08:54:20.000000Z\",\"updated_at\":\"2025-10-13T08:54:20.000000Z\"}', '2025-10-13 03:06:40', '2025-11-03 22:41:33', 2, 4, NULL, '2025-11-04'),
(159, 1, 7, 123, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Stripe', 'success', 2, 0, 'pi_3SHidrIZGCIQ9M8p1UiNfCST', '{\"id\":123,\"user_id\":\"1\",\"name\":\"Test\",\"lat\":\"23.79323665690416\",\"lon\":\"90.43317273259163\",\"email\":\"test@gmail.com\",\"phone\":\"01545445\",\"address\":\"Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-13T08:16:35.000000Z\",\"updated_at\":\"2025-10-13T08:16:35.000000Z\"}', '2025-10-13 04:06:15', '2025-10-18 21:32:02', 0, 0, NULL, NULL),
(160, 1, 7, 142, 30, 'pickup', '60', '', 0, 0, 0, 70, 70, 'Stripe', 'success', 1, 0, 'pi_3SJsHIIZGCIQ9M8p2sg8c1mw', '{\"id\":142,\"user_id\":\"1\",\"name\":\"hdhf\",\"lat\":\"23.734775775723445\",\"lon\":\"90.41899390518665\",\"email\":\"bdjf@gmailm.com\",\"phone\":\"959255\",\"address\":\"PCM9+WMV, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-19T08:46:35.000000Z\",\"updated_at\":\"2025-10-19T08:46:35.000000Z\"}', '2025-10-19 02:47:51', '2025-10-19 02:47:51', 0, 0, NULL, NULL),
(161, 1, 7, 142, 30, 'delivery', '60', '', 0, 0, 0, 32, 32, 'Bank Transfer', 'pending', 6, 0, 'IBBL', '{\"id\":142,\"user_id\":\"1\",\"name\":\"hdhf\",\"lat\":\"23.734775775723445\",\"lon\":\"90.41899390518665\",\"email\":\"bdjf@gmailm.com\",\"phone\":\"959255\",\"address\":\"PCM9+WMV, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-19T08:46:35.000000Z\",\"updated_at\":\"2025-10-19T08:46:35.000000Z\"}', '2025-10-19 02:58:07', '2025-11-03 22:18:54', 2, 4, NULL, NULL),
(162, 1, 7, 142, 30, 'delivery', '60', '', 0, 0, 0, 44, 44, 'Stripe', 'success', 1, 0, 'pi_3SMMoAIZGCIQ9M8p1FNULhtd', '{\"id\":142,\"user_id\":\"1\",\"name\":\"hdhf\",\"lat\":\"23.734775775723445\",\"lon\":\"90.41899390518665\",\"email\":\"bdjf@gmailm.com\",\"phone\":\"959255\",\"address\":\"PCM9+WMV, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-19T08:46:35.000000Z\",\"updated_at\":\"2025-10-19T08:46:35.000000Z\"}', '2025-10-25 23:48:06', '2025-10-25 23:48:06', 0, 0, NULL, NULL),
(163, 131, 7, 145, 30, 'delivery', '60', '', 0, 0, 0, 60, 60, 'Stripe', 'success', 5, 0, 'pi_3SMMvxIZGCIQ9M8p1XxxJioQ', '{\"id\":145,\"user_id\":\"131\",\"name\":\"Ibrahim\",\"lat\":\"23.812208\",\"lon\":\"90.3679167\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"Block A, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-26T05:55:34.000000Z\",\"updated_at\":\"2025-10-26T05:55:34.000000Z\"}', '2025-10-25 23:56:09', '2025-10-25 23:56:53', 0, 0, NULL, NULL),
(164, 1, 10, 146, 20, 'delivery', '60', '', 0, 0, 0, 150, 150, 'Bank Transfer', 'success', 6, 0, 'hchchc', '{\"id\":146,\"user_id\":\"1\",\"name\":\"Hossain\",\"lat\":\"23.921453354015668\",\"lon\":\"90.71485832333565\",\"email\":\"hossain@gmail.com\",\"phone\":\"01755888\",\"address\":\"WPC8+G2C, Narsingdi, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-26T06:09:25.000000Z\",\"updated_at\":\"2025-10-26T06:09:25.000000Z\"}', '2025-10-26 00:12:07', '2025-11-03 03:35:34', 2, 4, NULL, '2025-11-03'),
(165, 131, 7, 145, 30, 'delivery', '60', '', 0, 0, 0, 72, 72, 'Bank Transfer', 'success', 6, 0, 'IBBL', '{\"id\":145,\"user_id\":\"131\",\"name\":\"Ibrahim\",\"lat\":\"23.812208\",\"lon\":\"90.3679167\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"Block A, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-26T05:55:34.000000Z\",\"updated_at\":\"2025-10-26T05:55:34.000000Z\"}', '2025-10-26 00:45:42', '2025-11-03 22:13:24', 2, 4, NULL, '2025-11-03'),
(166, 131, 7, 145, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'success', 6, 0, 'Ibnl', '{\"id\":145,\"user_id\":\"131\",\"name\":\"Ibrahim\",\"lat\":\"23.812208\",\"lon\":\"90.3679167\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"Block A, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-26T05:55:34.000000Z\",\"updated_at\":\"2025-10-26T05:55:34.000000Z\"}', '2025-10-26 00:52:01', '2025-11-03 22:00:20', 2, 4, NULL, NULL),
(167, 131, 7, 145, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'success', 5, 0, 'Ibnl', '{\"id\":145,\"user_id\":\"131\",\"name\":\"Ibrahim\",\"lat\":\"23.812208\",\"lon\":\"90.3679167\",\"email\":\"ibrahim@gmail.com\",\"phone\":\"01751800957\",\"address\":\"Block A, Dhaka, Bangladesh\",\"delivery_type\":\"home\",\"is_guest\":\"0\",\"created_at\":\"2025-10-26T05:55:34.000000Z\",\"updated_at\":\"2025-10-26T05:55:34.000000Z\"}', '2025-10-26 00:52:07', '2025-11-04 01:18:18', 2, 3, NULL, '2025-11-04'),
(168, 1, 7, 147, 30, 'delivery', '60', '', 0, 0, 0, 75, 75, 'Bank Transfer', 'success', 5, 0, 'Ibbl', '{\"id\":147,\"user_id\":\"1\",\"name\":\"Ibrahim khan\",\"lat\":\"23.714370579863452\",\"lon\":\"90.47042224556208\",\"email\":\"ibra@gmail.com\",\"phone\":\"01751800957\",\"address\":\"232, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T05:27:10.000000Z\",\"updated_at\":\"2025-11-05T05:27:10.000000Z\"}', '2025-11-04 23:27:27', '2025-11-04 23:34:47', 2, 3, NULL, '2025-11-05'),
(169, 132, 7, 148, 30, 'delivery', '60', '', 0, 0, 0, 80, 80, 'Stripe', 'success', 5, 0, 'pi_3SQ3FMIZGCIQ9M8p2Rz9yxhp', '{\"id\":148,\"user_id\":\"132\",\"name\":\"Ibrahim\",\"lat\":\"23.812171\",\"lon\":\"90.367954\",\"email\":\"ib@gmail.com\",\"phone\":\"017568932\",\"address\":\"Block A, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T09:42:39.000000Z\",\"updated_at\":\"2025-11-05T09:42:39.000000Z\"}', '2025-11-05 03:43:24', '2025-11-05 03:47:31', 2, 3, NULL, '2025-11-05'),
(170, 1, 7, 147, 30, 'delivery', '60', '', 0, 0, 0, 20, 20, 'Bank Transfer', 'pending', 1, 0, 'fdfdf', '{\"id\":147,\"user_id\":\"1\",\"name\":\"Ibrahim khan\",\"lat\":\"23.714370579863452\",\"lon\":\"90.47042224556208\",\"email\":\"ibra@gmail.com\",\"phone\":\"01751800957\",\"address\":\"232, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T05:27:10.000000Z\",\"updated_at\":\"2025-11-25T10:52:23.000000Z\"}', '2025-12-06 21:45:10', '2025-12-06 21:45:10', 0, 0, NULL, NULL),
(171, 1, 7, 147, 30, 'delivery', '60', '', 0, 0, 0, 40, 40, 'Bank Transfer', 'pending', 1, 0, 'IBBL', '{\"id\":147,\"user_id\":\"1\",\"name\":\"Ibrahim khan\",\"lat\":\"23.714370579863452\",\"lon\":\"90.47042224556208\",\"email\":\"ibra@gmail.com\",\"phone\":\"01751800957\",\"address\":\"232, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T05:27:10.000000Z\",\"updated_at\":\"2025-11-25T10:52:23.000000Z\"}', '2025-12-10 00:04:32', '2025-12-10 00:04:32', 0, 0, NULL, NULL),
(172, 1, 7, 147, 30, 'pickup', '60', '', 0, 0, 0, 122, 122, 'Stripe', 'success', 1, 0, 'pi_3Sd1bTIZGCIQ9M8p0DrPf9HI', '{\"id\":147,\"user_id\":\"1\",\"name\":\"Ibrahim khan\",\"lat\":\"23.714370579863452\",\"lon\":\"90.47042224556208\",\"email\":\"ibra@gmail.com\",\"phone\":\"01751800957\",\"address\":\"232, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T05:27:10.000000Z\",\"updated_at\":\"2025-11-25T10:52:23.000000Z\"}', '2025-12-10 22:35:51', '2025-12-10 22:35:51', 0, 0, NULL, NULL),
(173, 1, 5, 147, 27, 'delivery', '60', '', 0, 0, 0, 42, 42, 'Bank Transfer', 'success', 2, 0, 'jjjj', '{\"id\":147,\"user_id\":\"1\",\"name\":\"Ibrahim khan\",\"lat\":\"23.714370579863452\",\"lon\":\"90.47042224556208\",\"email\":\"ibra@gmail.com\",\"phone\":\"01751800957\",\"address\":\"232, Dhaka, Bangladesh\",\"delivery_type\":\"office\",\"is_guest\":\"0\",\"created_at\":\"2025-11-05T05:27:10.000000Z\",\"updated_at\":\"2025-11-25T10:52:23.000000Z\"}', '2025-12-15 04:36:29', '2025-12-19 09:40:07', 33, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `size`, `addons`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(3, 3, 4, '{\"Small\":\"150\"}', '[]', 2, 300, '2024-09-23 03:21:13', '2024-09-23 03:21:13'),
(4, 4, 4, '{\"Small\":\"150\"}', '[]', 2, 300, '2024-09-23 23:22:18', '2024-09-23 23:22:18'),
(5, 5, 2, '{\"Large\":\"99\"}', '{\"1\":\"1\"}', 1, 109, '2024-09-24 00:23:54', '2024-09-24 00:23:54'),
(6, 5, 1, '{\"Large\":\"100\"}', '{\"1\":\"1\"}', 2, 210, '2024-09-24 00:23:54', '2024-09-24 00:23:54'),
(7, 6, 4, '{\"Small\":\"150\"}', '[]', 1, 150, '2024-09-24 00:28:37', '2024-09-24 00:28:37'),
(8, 7, 4, '{\"Small\":\"150\"}', '[]', 1, 150, '2024-09-24 00:30:14', '2024-09-24 00:30:14'),
(9, 8, 2, '{\"Large\":\"99\"}', '{\"1\":\"1\",\"2\":\"1\"}', 2, 253, '2024-09-25 05:13:12', '2024-09-25 05:13:12'),
(10, 8, 1, '{\"Large\":\"100\"}', '[]', 2, 200, '2024-09-25 05:13:12', '2024-09-25 05:13:12'),
(11, 9, 1, '{\"Large\":95}', '[]', 2, 190, '2024-10-23 04:24:51', '2024-10-23 04:24:51'),
(12, 10, 4, '{\"Small\":\"150\"}', '[]', 1, 150, '2024-12-14 10:42:50', '2024-12-14 10:42:50'),
(19, 1, 4, '{\"Small\":\"40\"}', '{\"11\":\"1\"}', 1, 50, '2025-03-15 00:58:30', '2025-03-15 00:58:30'),
(20, 2, 10, '{\"Extra Large\":\"70\"}', '{\"1\":\"1\",\"2\":\"1\"}', 1, 125, '2025-03-16 00:32:02', '2025-03-16 00:32:02'),
(21, 3, 11, '{\"Extra Large\":\"70\"}', '{\"10\":\"1\",\"11\":\"1\"}', 1, 85, '2025-03-16 00:42:10', '2025-03-16 00:42:10'),
(22, 4, 4, '{\"Extra Large\":\"80\"}', '{\"12\":\"1\",\"13\":\"1\"}', 1, 140, '2025-03-16 01:52:23', '2025-03-16 01:52:23'),
(23, 5, 2, '{\"Large\":\"50\"}', '{\"1\":\"1\",\"2\":\"1\"}', 1, 105, '2025-03-16 02:17:41', '2025-03-16 02:17:41'),
(24, 6, 9, '{\"Medium\":\"40\"}', '{\"2\":\"1\"}', 1, 65, '2025-03-16 02:25:20', '2025-03-16 02:25:20'),
(25, 7, 74, '{\"Medium\":\"40\"}', '{\"12\":\"1\",\"13\":\"1\"}', 1, 100, '2025-04-21 03:00:31', '2025-04-21 03:00:31'),
(26, 7, 76, '{\"Medium\":\"40\"}', '{\"12\":\"1\",\"13\":\"1\"}', 1, 100, '2025-04-21 03:00:31', '2025-04-21 03:00:31'),
(27, 8, 3, '{\"Small\":28.5}', '[]', 1, 28.5, '2025-04-21 04:23:40', '2025-04-21 04:23:40'),
(28, 9, 9, '{\"Large\":\"50\"}', '[]', 2, 100, '2025-04-29 02:59:11', '2025-04-29 02:59:11'),
(29, 10, 1, '{\"Medium\":\"40\"}', '{\"1\":\"1\",\"2\":\"1\",\"3\":\"1\"}', 1, 105, '2025-04-29 03:04:20', '2025-04-29 03:04:20'),
(31, 12, 4, '{\"Medium\":\"50\"}', '{\"10\":\"1\",\"11\":\"1\"}', 1, 65, '2025-04-29 06:02:13', '2025-04-29 06:02:13'),
(32, 13, 1, '{\"Small\":\"30\"}', '{\"2\":\"1\",\"3\":\"1\",\"4\":\"1\"}', 1, 70, '2025-05-04 22:43:30', '2025-05-04 22:43:30'),
(33, 14, 1, '{\"Medium\":\"40\"}', '{\"1\":\"1\",\"2\":\"1\"}', 1, 95, '2025-05-04 22:56:29', '2025-05-04 22:56:29'),
(34, 15, 2, '{\"Medium\":\"40\"}', '{\"1\":\"1\",\"2\":\"1\"}', 1, 95, '2025-05-04 23:04:53', '2025-05-04 23:04:53'),
(35, 16, 1, '{\"Medium\":\"40\"}', '{\"1\":\"1\",\"2\":\"1\"}', 1, 95, '2025-05-04 23:27:49', '2025-05-04 23:27:49'),
(36, 17, 44, '{\"Large\":\"50\"}', '[]', 1, 50, '2025-05-04 23:29:07', '2025-05-04 23:29:07'),
(37, 18, 2, '{\"Small\":\"30\"}', '[]', 1, 30, '2025-05-04 23:36:15', '2025-05-04 23:36:15'),
(38, 19, 3, '{\"Medium\":38}', '[]', 1, 38, '2025-05-04 23:39:11', '2025-05-04 23:39:11'),
(39, 20, 5, '{\"Small\":\"30\"}', '[]', 1, 30, '2025-05-04 23:40:49', '2025-05-04 23:40:49'),
(40, 21, 5, '{\"Small\":\"30\"}', '[]', 1, 30, '2025-05-05 05:23:54', '2025-05-05 05:23:54'),
(41, 22, 5, '{\"Medium\":\"40\"}', '{\"10\":\"1\"}', 1, 45, '2025-05-05 22:12:21', '2025-05-05 22:12:21'),
(43, 24, 4, '{\"Medium\":\"50\"}', '{\"11\":\"1\",\"12\":\"1\"}', 1, 80, '2025-05-07 03:17:28', '2025-05-07 03:17:28'),
(44, 25, 4, '{\"Medium\":\"50\"}', '{\"10\":\"1\",\"11\":\"1\"}', 1, 65, '2025-05-07 03:39:23', '2025-05-07 03:39:23'),
(53, 36, 2, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":2}', 2, 110, '2025-08-24 22:09:53', '2025-08-24 22:09:53'),
(54, 36, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":2}', 2, 110, '2025-08-24 22:09:53', '2025-08-24 22:09:53'),
(55, 37, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-24 22:19:47', '2025-08-24 22:19:47'),
(56, 38, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-24 22:28:07', '2025-08-24 22:28:07'),
(57, 39, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:14:39', '2025-08-25 04:14:39'),
(58, 40, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:19:19', '2025-08-25 04:19:19'),
(59, 40, 2, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:19:19', '2025-08-25 04:19:19'),
(60, 41, 2, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:23:40', '2025-08-25 04:23:40'),
(61, 41, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:23:40', '2025-08-25 04:23:40'),
(62, 42, 1, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-25 04:26:51', '2025-08-25 04:26:51'),
(63, 43, 3, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-08-26 09:59:54', '2025-08-26 09:59:54'),
(64, 44, 5, '{\"Large\":\"60.00\"}', '{\"10\":1}', 8, 485, '2025-09-07 21:05:49', '2025-09-07 21:05:49'),
(65, 45, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-07 21:09:01', '2025-09-07 21:09:01'),
(66, 46, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-07 21:09:09', '2025-09-07 21:09:09'),
(67, 47, 4, '{\"Extra Large\":\"80.00\"}', '[]', 2, 160, '2025-09-07 21:13:57', '2025-09-07 21:13:57'),
(68, 48, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 00:03:30', '2025-09-08 00:03:30'),
(69, 49, 4, '{\"Large\":\"70.00\"}', '[]', 1, 70, '2025-09-08 00:07:08', '2025-09-08 00:07:08'),
(70, 50, 4, '{\"Medium\":\"50.00\"}', '[]', 1, 50, '2025-09-08 00:08:04', '2025-09-08 00:08:04'),
(71, 51, 9, '{\"Large\":\"50.00\"}', '[]', 1, 50, '2025-09-08 00:12:47', '2025-09-08 00:12:47'),
(72, 52, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-08 00:18:53', '2025-09-08 00:18:53'),
(73, 53, 4, '{\"Large\":\"70.00\"}', '[]', 2, 140, '2025-09-08 00:23:18', '2025-09-08 00:23:18'),
(74, 54, 5, '{\"Large\":\"60.00\"}', '[]', 1, 60, '2025-09-08 00:26:25', '2025-09-08 00:26:25'),
(75, 55, 4, '{\"Large\":\"70.00\"}', '[]', 1, 70, '2025-09-08 00:27:32', '2025-09-08 00:27:32'),
(76, 56, 5, '{\"Large\":\"60.00\"}', '[]', 1, 60, '2025-09-08 00:28:52', '2025-09-08 00:28:52'),
(77, 57, 5, '{\"Small\":\"30.00\"}', '[]', 1, 30, '2025-09-08 00:42:29', '2025-09-08 00:42:29'),
(78, 58, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-08 02:35:01', '2025-09-08 02:35:01'),
(79, 58, 4, '{\"Medium\":\"50.00\"}', '[]', 4, 200, '2025-09-08 02:35:01', '2025-09-08 02:35:01'),
(80, 59, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-08 02:36:01', '2025-09-08 02:36:01'),
(81, 59, 4, '{\"Medium\":\"50.00\"}', '[]', 4, 200, '2025-09-08 02:36:01', '2025-09-08 02:36:01'),
(82, 60, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-08 02:37:11', '2025-09-08 02:37:11'),
(83, 60, 4, '{\"Medium\":\"50.00\"}', '[]', 4, 200, '2025-09-08 02:37:11', '2025-09-08 02:37:11'),
(84, 61, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 02:38:48', '2025-09-08 02:38:48'),
(85, 62, 5, '{\"Large\":\"60.00\"}', '[]', 1, 60, '2025-09-08 03:05:05', '2025-09-08 03:05:05'),
(86, 63, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 03:26:44', '2025-09-08 03:26:44'),
(87, 64, 5, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-08 07:31:14', '2025-09-08 07:31:14'),
(88, 65, 5, '{\"Medium\":\"40.00\"}', '[]', 3, 120, '2025-09-08 22:38:31', '2025-09-08 22:38:31'),
(89, 66, 4, '{\"Extra Large\":\"80.00\"}', '[]', 1, 80, '2025-09-08 22:52:28', '2025-09-08 22:52:28'),
(90, 67, 5, '{\"Large\":\"60.00\"}', '[]', 1, 60, '2025-09-08 23:01:32', '2025-09-08 23:01:32'),
(91, 68, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 23:02:42', '2025-09-08 23:02:42'),
(92, 69, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 23:05:07', '2025-09-08 23:05:07'),
(93, 70, 5, '{\"Medium\":\"40.00\"}', '[]', 6, 240, '2025-09-08 23:22:28', '2025-09-08 23:22:28'),
(94, 70, 4, '{\"Extra Large\":\"80.00\"}', '[]', 4, 320, '2025-09-08 23:22:28', '2025-09-08 23:22:28'),
(95, 71, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-08 23:29:14', '2025-09-08 23:29:14'),
(96, 72, 1, '{\"Extra Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 02:06:11', '2025-09-09 02:06:11'),
(97, 73, 2, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 85, '2025-09-09 03:03:49', '2025-09-09 03:03:49'),
(98, 74, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 04:44:12', '2025-09-09 04:44:12'),
(99, 75, 11, '{\"Extra Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 04:45:54', '2025-09-09 04:45:54'),
(100, 76, 9, '{\"Extra Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 04:48:30', '2025-09-09 04:48:30'),
(101, 77, 5, '{\"Large\":\"60.00\"}', '[]', 2, 120, '2025-09-09 04:50:49', '2025-09-09 04:50:49'),
(102, 78, 2, '{\"Small\":\"30.00\"}', '[]', 1, 30, '2025-09-09 04:55:26', '2025-09-09 04:55:26'),
(103, 79, 1, '{\"Small\":\"30.00\"}', '{\"1\":2}', 2, 120, '2025-09-09 04:58:43', '2025-09-09 04:58:43'),
(104, 80, 5, '{\"Small\":\"30.00\"}', '[]', 1, 30, '2025-09-09 05:00:20', '2025-09-09 05:00:20'),
(105, 81, 4, '{\"Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 07:33:15', '2025-09-09 07:33:15'),
(106, 82, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 07:38:55', '2025-09-09 07:38:55'),
(107, 83, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 07:40:11', '2025-09-09 07:40:11'),
(108, 84, 5, '{\"Large\":\"60.00\"}', '{\"10\":1}', 1, 65, '2025-09-09 07:43:50', '2025-09-09 07:43:50'),
(109, 85, 4, '{\"Medium\":\"50.00\"}', '[]', 1, 50, '2025-09-09 07:45:00', '2025-09-09 07:45:00'),
(110, 86, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 07:50:22', '2025-09-09 07:50:22'),
(111, 87, 10, '{\"Large\":\"50.00\"}', '[]', 1, 50, '2025-09-09 07:55:30', '2025-09-09 07:55:30'),
(112, 88, 3, '{\"Extra Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 07:57:56', '2025-09-09 07:57:56'),
(113, 89, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 07:58:32', '2025-09-09 07:58:32'),
(114, 90, 5, '{\"Small\":\"30.00\"}', '[]', 1, 30, '2025-09-09 08:01:56', '2025-09-09 08:01:56'),
(115, 91, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 08:06:33', '2025-09-09 08:06:33'),
(116, 92, 3, '{\"Large\":\"50.00\"}', '[]', 1, 50, '2025-09-09 08:07:39', '2025-09-09 08:07:39'),
(117, 93, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 08:08:44', '2025-09-09 08:08:44'),
(118, 94, 41, '{\"Medium\":\"40.00\"}', '[]', 2, 80, '2025-09-09 08:10:23', '2025-09-09 08:10:23'),
(119, 95, 5, '{\"Large\":\"60.00\"}', '[]', 2, 120, '2025-09-09 22:25:44', '2025-09-09 22:25:44'),
(120, 96, 5, '{\"Small\":\"30.00\"}', '[]', 1, 30, '2025-09-09 22:29:20', '2025-09-09 22:29:20'),
(121, 97, 10, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 22:32:35', '2025-09-09 22:32:35'),
(122, 98, 4, '{\"Medium\":\"50.00\"}', '[]', 1, 50, '2025-09-09 22:35:55', '2025-09-09 22:35:55'),
(123, 99, 3, '{\"Large\":\"50.00\"}', '{\"10\":1,\"11\":2}', 1, 50, '2025-09-09 22:39:34', '2025-09-09 22:39:34'),
(124, 100, 4, '{\"Large\":\"70.00\"}', '[]', 1, 70, '2025-09-09 22:42:25', '2025-09-09 22:42:25'),
(125, 101, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 22:44:09', '2025-09-09 22:44:09'),
(126, 102, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 22:49:41', '2025-09-09 22:49:41'),
(127, 103, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-09 23:26:33', '2025-09-09 23:26:33'),
(128, 104, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 00:46:38', '2025-09-10 00:46:38'),
(129, 105, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 01:07:07', '2025-09-10 01:07:07'),
(130, 106, 4, '{\"Medium\":\"50.00\"}', '[]', 2, 100, '2025-09-10 03:25:21', '2025-09-10 03:25:21'),
(131, 107, 5, '{\"Medium\":\"40.00\"}', '[]', 3, 120, '2025-09-10 04:21:12', '2025-09-10 04:21:12'),
(132, 108, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 04:29:15', '2025-09-10 04:29:15'),
(133, 109, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 04:35:08', '2025-09-10 04:35:08'),
(134, 110, 11, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 04:35:45', '2025-09-10 04:35:45'),
(135, 111, 5, '{\"Medium\":\"40.00\"}', '[]', 3, 120, '2025-09-10 20:56:58', '2025-09-10 20:56:58'),
(136, 112, 11, '{\"Extra Large\":\"70.00\"}', '[]', 1, 70, '2025-09-10 22:41:56', '2025-09-10 22:41:56'),
(137, 113, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 23:08:01', '2025-09-10 23:08:01'),
(138, 113, 4, '{\"Extra Large\":\"80.00\"}', '[]', 2, 160, '2025-09-10 23:08:01', '2025-09-10 23:08:01'),
(139, 114, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-10 23:08:13', '2025-09-10 23:08:13'),
(140, 114, 4, '{\"Extra Large\":\"80.00\"}', '[]', 2, 160, '2025-09-10 23:08:13', '2025-09-10 23:08:13'),
(141, 115, 5, '{\"Large\":\"60.00\"}', '[]', 2, 120, '2025-09-11 00:16:13', '2025-09-11 00:16:13'),
(142, 116, 9, '{\"Large\":\"50.00\"}', '[]', 4, 200, '2025-09-11 00:18:59', '2025-09-11 00:18:59'),
(143, 117, 5, '{\"Medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-09-11 03:48:10', '2025-09-11 03:48:10'),
(144, 118, 5, '{\"Large\":\"60.00\"}', '[]', 3, 180, '2025-09-11 04:59:46', '2025-09-11 04:59:46'),
(145, 118, 4, '{\"Extra Large\":\"80.00\"}', '[]', 2, 160, '2025-09-11 04:59:46', '2025-09-11 04:59:46'),
(146, 119, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-11 05:00:55', '2025-09-11 05:00:55'),
(147, 120, 2, '{\"Medium\":\"15.00\"}', '{\"1\":1}', 2, 85, '2025-09-11 05:02:24', '2025-09-11 05:02:24'),
(148, 121, 5, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-11 05:17:47', '2025-09-11 05:17:47'),
(149, 122, 41, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-09-12 21:30:06', '2025-09-12 21:30:06'),
(150, 123, 5, '{\"Medium\":\"40.00\"}', '[]', 3, 120, '2025-09-13 05:05:18', '2025-09-13 05:05:18'),
(151, 124, 4, '{\"Medium\":\"50.00\"}', '{\"10\":1}', 2, 105, '2025-09-13 05:18:07', '2025-09-13 05:18:07'),
(152, 125, 5, '{\"Medium\":\"40.00\"}', '[]', 4, 160, '2025-09-13 21:51:25', '2025-09-13 21:51:25'),
(153, 126, 4, '{\"Small\":\"40.00\"}', '{\"10\":1}', 2, 85, '2025-09-14 00:17:46', '2025-09-14 00:17:46'),
(154, 127, 5, '{\"Medium\":\"40.00\"}', '[]', 6, 240, '2025-09-14 02:22:44', '2025-09-14 02:22:44'),
(155, 128, 5, '{\"Small\":\"30.00\"}', '[]', 3, 90, '2025-09-14 21:45:34', '2025-09-14 21:45:34'),
(156, 128, 4, '{\"Extra Large\":\"80.00\"}', '[]', 2, 160, '2025-09-14 21:45:34', '2025-09-14 21:45:34'),
(157, 129, 4, '{\"large\":\"600.00\"}', '{\"11\":4,\"12\":4,\"13\":3}', 3, 2040, '2025-09-27 05:03:44', '2025-09-27 05:03:44'),
(158, 130, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-09-27 05:04:38', '2025-09-27 05:04:38'),
(159, 131, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 2, 85, '2025-09-28 21:12:29', '2025-09-28 21:12:29'),
(160, 132, 38, '{\"Medium\":\"40.00\"}', '{\"11\":1}', 2, 90, '2025-09-28 21:13:38', '2025-09-28 21:13:38'),
(161, 133, 41, '{\"Medium\":\"40.00\"}', '{\"2\":1}', 2, 105, '2025-09-28 21:15:43', '2025-09-28 21:15:43'),
(162, 134, 2, '{\"medium\":\"40.00\"}', '{\"3\":1}', 2, 90, '2025-09-28 22:01:44', '2025-09-28 22:01:44'),
(163, 135, 4, '{\"medium\":\"40.00\"}', '{\"12\":1,\"11\":1}', 2, 110, '2025-09-29 22:16:36', '2025-09-29 22:16:36'),
(164, 136, 31, '{\"Small\":\"30.00\"}', '[]', 2, 60, '2025-09-29 22:42:00', '2025-09-29 22:42:00'),
(165, 136, 45, '{\"Small\":\"30.00\"}', '[]', 2, 60, '2025-09-29 22:42:00', '2025-09-29 22:42:00'),
(166, 137, 31, '{\"Small\":\"30.00\"}', '[]', 2, 60, '2025-09-29 22:42:14', '2025-09-29 22:42:14'),
(167, 137, 45, '{\"Small\":\"30.00\"}', '[]', 2, 60, '2025-09-29 22:42:14', '2025-09-29 22:42:14'),
(168, 138, 4, '{\"small\":\"20.00\"}', '{\"10\":1}', 2, 45, '2025-09-30 21:12:14', '2025-09-30 21:12:14'),
(169, 139, 4, '{\"medium\":\"40.00\"}', '{\"12\":1}', 1, 60, '2025-09-30 21:43:57', '2025-09-30 21:43:57'),
(170, 140, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-09-30 22:27:58', '2025-09-30 22:27:58'),
(171, 141, 4, '{\"large\":\"600.00\"}', '[]', 1, 600, '2025-10-02 01:40:32', '2025-10-02 01:40:32'),
(172, 142, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-10-02 01:42:01', '2025-10-02 01:42:01'),
(173, 143, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-10-02 01:42:07', '2025-10-02 01:42:07'),
(174, 144, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 1, 45, '2025-10-05 21:06:37', '2025-10-05 21:06:37'),
(175, 145, 4, '{\"small\":\"20.00\"}', '{\"10\":1}', 2, 45, '2025-10-05 23:44:06', '2025-10-05 23:44:06'),
(176, 146, 41, '{\"Small\":\"30.00\"}', '{\"4\":1}', 2, 70, '2025-10-06 03:11:47', '2025-10-06 03:11:47'),
(177, 147, 4, '{\"medium\":\"40.00\"}', '{\"10\":1}', 3, 125, '2025-10-07 09:28:44', '2025-10-07 09:28:44'),
(178, 148, 14, '{\"Extra Large\":\"70.00\"}', '{\"1\":1}', 1, 80, '2025-10-08 04:34:32', '2025-10-08 04:34:32'),
(179, 149, 22, '{\"Large\":\"50.00\"}', '{\"1\":1}', 2, 110, '2025-10-08 21:38:03', '2025-10-08 21:38:03'),
(180, 150, 184, '{\"larg\":\"40.00\"}', '{\"112\":1}', 1, 50, '2025-10-08 23:39:19', '2025-10-08 23:39:19'),
(181, 151, 22, '{\"Small\":\"30.00\"}', '{\"3\":1}', 1, 40, '2025-10-12 22:23:25', '2025-10-12 22:23:25'),
(182, 152, 4, '{\"Medium\":\"15.00\"}', '{\"1\":1,\"2\":1}', 2, 65, '2025-10-12 23:52:44', '2025-10-12 23:52:44'),
(183, 153, 184, '{\"small\":\"20.00\"}', '{\"121\":1}', 1, 40, '2025-10-12 23:59:37', '2025-10-12 23:59:37'),
(184, 154, 184, '{\"small\":\"20.00\"}', '{\"121\":1}', 1, 40, '2025-10-13 00:15:25', '2025-10-13 00:15:25'),
(185, 155, 22, '{\"Extra Large\":\"70.00\"}', '{\"3\":1}', 2, 150, '2025-10-13 02:55:25', '2025-10-13 02:55:25'),
(186, 156, 195, '{\"medium\":\"30.00\"}', '{\"121\":1}', 1, 50, '2025-10-13 03:00:17', '2025-10-13 03:00:17'),
(187, 157, 45, '{\"Extra Large\":\"70.00\"}', '{\"3\":1}', 1, 80, '2025-10-13 03:03:17', '2025-10-13 03:03:17'),
(188, 158, 15, '{\"Extra Large\":\"70.00\"}', '{\"10\":1}', 1, 75, '2025-10-13 03:06:40', '2025-10-13 03:06:40'),
(189, 159, 184, '{\"larg\":\"40.00\"}', '{\"121\":1}', 1, 60, '2025-10-13 04:06:15', '2025-10-13 04:06:15'),
(190, 160, 184, '{\"small\":\"20.00\"}', '{\"124\":1}', 1, 70, '2025-10-19 02:47:51', '2025-10-19 02:47:51'),
(191, 161, 194, '{\"small\":\"20.00\"}', '{\"4\":1}', 1, 32, '2025-10-19 02:58:07', '2025-10-19 02:58:07'),
(192, 162, 194, '{\"small\":\"20.00\"}', '{\"4\":2}', 1, 44, '2025-10-25 23:48:06', '2025-10-25 23:48:06'),
(193, 163, 196, '{\"small\":\"20.00\"}', '{\"121\":1}', 2, 60, '2025-10-25 23:56:09', '2025-10-25 23:56:09'),
(194, 164, 32, '{\"Small\":\"30.00\"}', '{\"3\":3}', 4, 150, '2025-10-26 00:12:07', '2025-10-26 00:12:07'),
(195, 165, 22, '{\"Small\":\"30.00\"}', '{\"3\":1}', 1, 40, '2025-10-26 00:45:42', '2025-10-26 00:45:42'),
(196, 165, 194, '{\"small\":\"20.00\"}', '{\"4\":1}', 1, 32, '2025-10-26 00:45:42', '2025-10-26 00:45:42'),
(197, 166, 22, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-10-26 00:52:01', '2025-10-26 00:52:01'),
(198, 167, 22, '{\"Medium\":\"40.00\"}', '[]', 1, 40, '2025-10-26 00:52:07', '2025-10-26 00:52:07'),
(199, 168, 50, '{\"Extra Large\":\"70.00\"}', '{\"10\":1}', 1, 75, '2025-11-04 23:27:27', '2025-11-04 23:27:27'),
(200, 169, 184, '{\"medium\":\"30.00\"}', '{\"124\":1}', 1, 80, '2025-11-05 03:43:24', '2025-11-05 03:43:24'),
(201, 170, 194, '{\"small\":\"20.00\"}', '[]', 1, 20, '2025-12-06 21:45:10', '2025-12-06 21:45:10'),
(202, 171, 194, '{\"small\":\"20.00\"}', '[]', 2, 40, '2025-12-10 00:04:32', '2025-12-10 00:04:32'),
(203, 172, 194, '{\"small\":\"20.00\"}', '{\"4\":1}', 1, 32, '2025-12-10 22:35:51', '2025-12-10 22:35:51'),
(204, 172, 184, '{\"small\":\"20.00\"}', '{\"124\":1}', 2, 90, '2025-12-10 22:35:51', '2025-12-10 22:35:51'),
(205, 173, 18, '{\"Small\":\"30.00\"}', '{\"3\":1}', 1, 42, '2025-12-15 04:36:29', '2025-12-15 04:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'stripe_status', '1', NULL, '2024-09-17 02:50:08'),
(2, 'stripe_image', 'uploads/website-images/stripe-2024-09-12-06-30-58-9583.png', NULL, '2024-09-12 00:30:58'),
(3, 'stripe_currency_id', '1', NULL, '2024-09-17 02:50:08'),
(4, 'stripe_key', 'pk_test_placeholder_key', NULL, '2024-09-17 02:50:08'),
(5, 'stripe_secret', 'sk_test_placeholder_secret', NULL, '2024-09-17 02:50:08'),
(6, 'paypal_status', '1', NULL, '2025-04-29 03:06:46'),
(7, 'paypal_image', 'uploads/website-images/paypal-2024-09-12-06-31-11-4804.png', NULL, '2024-09-12 00:31:11'),
(8, 'paypal_account_mode', 'sandbox', NULL, '2025-04-29 03:06:46'),
(9, 'paypal_currency_id', '1', NULL, '2025-04-29 03:06:46'),
(10, 'paypal_client_id', 'AWlV5x8Lhj9BRF8_placeholder_client_id', NULL, '2025-04-29 03:06:46'),
(11, 'paypal_secret_key', 'EEvn1J_placeholder_secret_key', NULL, '2025-04-29 03:06:46'),
(12, 'razorpay_status', '1', NULL, '2025-04-29 03:11:09'),
(13, 'razorpay_image', 'uploads/website-images/paypal-2024-09-12-06-31-23-3727.png', NULL, '2024-09-12 00:31:23'),
(14, 'razorpay_currency_id', '4', NULL, '2025-04-29 03:11:09'),
(15, 'razorpay_key', 'rzp_test_placeholder', NULL, '2025-04-29 03:11:09'),
(16, 'razorpay_secret', 'placeholder_secret', NULL, '2025-04-29 03:11:09'),
(17, 'razorpay_name', 'Foodigo', NULL, '2025-04-29 03:11:09'),
(18, 'razorpay_description', 'This is description', NULL, '2025-04-29 03:11:09'),
(19, 'razorpay_theme_color', '#da0b0b', NULL, '2025-04-29 03:11:09'),
(20, 'flutterwave_status', '1', NULL, '2025-05-04 23:35:22'),
(21, 'flutterwave_logo', 'uploads/website-images/paypal-2024-09-12-06-32-23-7032.png', NULL, '2024-09-12 00:32:23'),
(22, 'flutterwave_currency_id', '8', NULL, '2025-05-04 23:35:22'),
(23, 'flutterwave_public_key', 'FLWPUBK_TEST_placeholder', NULL, '2025-05-04 23:35:22'),
(24, 'flutterwave_secret_key', 'FLWSECK_TEST_placeholder', NULL, '2025-05-04 23:35:22'),
(25, 'flutterwave_title', 'Foodigo', NULL, '2025-05-04 23:35:22'),
(26, 'mollie_status', '1', NULL, '2025-04-29 03:35:29'),
(27, 'mollie_image', 'uploads/website-images/paypal-2024-09-12-06-32-28-1397.png', NULL, '2024-09-12 00:32:28'),
(28, 'mollie_currency_id', '1', NULL, '2025-04-29 03:35:29'),
(29, 'mollie_key', 'test_placeholder_key', NULL, '2025-04-29 03:35:29'),
(30, 'paystack_status', '1', NULL, '2025-04-29 03:35:48'),
(31, 'paystack_image', 'uploads/website-images/paypal-2024-09-12-06-32-39-3615.png', NULL, '2024-09-12 00:32:39'),
(32, 'paystack_currency_id', '4', NULL, '2025-04-29 03:35:48'),
(33, 'paystack_public_key', 'pk_test_placeholder_key', NULL, '2025-04-29 03:35:48'),
(34, 'paystack_secret_key', 'sk_test_placeholder_secret', NULL, '2025-04-29 03:35:48'),
(35, 'instamojo_status', '1', NULL, '2025-05-05 00:06:34'),
(36, 'instamojo_image', 'uploads/website-images/paypal-2024-09-12-06-32-46-3069.png', NULL, '2024-09-12 00:32:46'),
(37, 'instamojo_account_mode', 'Sandbox', NULL, '2025-05-05 00:06:34'),
(38, 'instamojo_currency_id', '4', NULL, '2025-05-05 00:06:34'),
(39, 'instamojo_api_key', '9e691c810b484c8a9b47f665edd16551', NULL, '2025-05-05 00:06:34'),
(40, 'instamojo_auth_token', '306c89c9483be1804f06e202d7f32a37', NULL, '2025-05-05 00:06:34'),
(41, 'bank_status', '1', NULL, '2025-05-04 23:40:38'),
(42, 'bank_image', 'uploads/website-images/paypal-2024-09-12-06-32-55-4694.png', NULL, '2024-09-12 00:32:55'),
(43, 'bank_account_info', 'Bank Name: Your bank name\r\nAccount Number:  Your bank account number\r\nRouting Number: Your bank routing number\r\nBranch: Your bank branch name', NULL, '2025-05-04 23:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 12, 'api-token', '33633a65dc1a32955bfcddec2314f3249040ba26619460049de2349a6bc46e7e', '[\"*\"]', NULL, NULL, '2025-08-16 07:19:19', '2025-08-16 07:19:19'),
(3, 'App\\Models\\User', 12, 'api-token', '16d765811d8d47f314f4e844404837508bc9d41c62193f74c1cdf14761c35692', '[\"*\"]', '2025-08-16 08:02:04', NULL, '2025-08-16 07:50:49', '2025-08-16 08:02:04'),
(4, 'App\\Models\\User', 12, 'api-token', 'f2b4acc17f2a4b7a294685596288c2fedb1072c593a9be18e7581f3752db8b42', '[\"*\"]', '2025-08-24 09:41:05', NULL, '2025-08-22 06:29:11', '2025-08-24 09:41:05'),
(5, 'App\\Models\\User', 12, 'api-token', 'c1ee19bb031ab7f1cb8fec80685cee699aa177022b846209fb9323b2921910af', '[\"*\"]', '2025-08-25 04:26:51', NULL, '2025-08-24 21:08:15', '2025-08-25 04:26:51'),
(6, 'App\\Models\\User', 12, 'api-token', '744b1b65bf92667f084a06b6b3ee5e65c064d326cae72b6b63a36cadd91a8841', '[\"*\"]', NULL, NULL, '2025-08-26 06:55:53', '2025-08-26 06:55:53'),
(7, 'App\\Models\\User', 12, 'api-token', '43c44c3a870f4471ad400a8449d08c2778a737c4e3ae97a9068eb359b9b8a49d', '[\"*\"]', NULL, NULL, '2025-08-26 07:49:54', '2025-08-26 07:49:54'),
(8, 'App\\Models\\User', 12, 'api-token', '29d516dd6a87b4c17841d0b93588c18b19a1b84241c217323c47cebefd0b6efb', '[\"*\"]', NULL, NULL, '2025-08-26 07:52:31', '2025-08-26 07:52:31'),
(9, 'App\\Models\\User', 12, 'api-token', '6f29becf07547c8ab5cecd72502c70ecff643fc0cd25656f17af6f488464016e', '[\"*\"]', NULL, NULL, '2025-08-26 07:54:42', '2025-08-26 07:54:42'),
(10, 'App\\Models\\User', 12, 'api-token', '69670143451f6898b887bf469a028cb46226759236200e379f1359d37dfcab80', '[\"*\"]', '2025-08-26 10:23:58', NULL, '2025-08-26 07:55:56', '2025-08-26 10:23:58'),
(11, 'App\\Models\\User', 12, 'api-token', '45ef2eb0a7ce48267288a3c64a07a69a95e6e35e9184483e3edf9056e9c2cc1b', '[\"*\"]', '2025-08-26 08:13:24', NULL, '2025-08-26 07:58:37', '2025-08-26 08:13:24'),
(12, 'App\\Models\\User', 12, 'api-token', 'b6de9d676ae8d9729763672159078d0503b015325f57e98bd52bfddaaf2b4bae', '[\"*\"]', NULL, NULL, '2025-08-26 08:02:28', '2025-08-26 08:02:28'),
(13, 'App\\Models\\User', 12, 'api-token', 'ea012be2c5ba402d0fca97bf9eb24dbf7858bb700eadbc78b18f6b2824a2d9a2', '[\"*\"]', '2025-08-26 10:01:36', NULL, '2025-08-26 08:12:35', '2025-08-26 10:01:36'),
(14, 'App\\Models\\User', 12, 'api-token', 'a97502dc20216ea0a2519bedb42a4218e028c038929eb8633105470ef30174df', '[\"*\"]', '2025-08-26 09:36:42', NULL, '2025-08-26 08:13:32', '2025-08-26 09:36:42'),
(15, 'App\\Models\\User', 1, 'api-token', '2781e5d0c1adcf9f4c0b3d03528586735a582e37249a56680308e25e0e9e5fee', '[\"*\"]', '2025-09-22 03:30:59', NULL, '2025-08-26 10:03:46', '2025-09-22 03:30:59'),
(16, 'App\\Models\\User', 1, 'api-token', 'f12981efdd3cc20e9428bbc722d6554a61cee11590050d6a4a07df18a2e2c2e6', '[\"*\"]', '2025-08-27 14:35:08', NULL, '2025-08-26 10:13:03', '2025-08-27 14:35:08'),
(17, 'App\\Models\\User', 12, 'api-token', '49bee117d5e77eab47a28ef42704af44665cc3e6dbb7669a1b4735804ca75399', '[\"*\"]', '2025-08-27 07:53:04', NULL, '2025-08-27 07:52:06', '2025-08-27 07:53:04'),
(18, 'App\\Models\\User', 12, 'api-token', 'c20ce3b83950fbc5d07221405ff5aaa56bbcd60c1326b117b3decbc7ad4eb035', '[\"*\"]', NULL, NULL, '2025-08-28 07:59:05', '2025-08-28 07:59:05'),
(19, 'App\\Models\\User', 12, 'api-token', '017a04012f1b660b46bcc7ebaf882b8aebd7ebe96f5e5939a1f04239e5274998', '[\"*\"]', '2025-08-28 11:52:28', NULL, '2025-08-28 08:22:29', '2025-08-28 11:52:28'),
(20, 'App\\Models\\User', 1, 'api-token', '7a1897ad636b87b6acdec44f9a95de435687f67d1d57c9be59919ce005e3a043', '[\"*\"]', NULL, NULL, '2025-08-28 09:32:03', '2025-08-28 09:32:03'),
(21, 'App\\Models\\User', 12, 'api-token', 'a61df280082dfda012ff6e9300e544eaf8d7353d86ec54c3531919776a6a014b', '[\"*\"]', NULL, NULL, '2025-08-28 09:34:04', '2025-08-28 09:34:04'),
(22, 'App\\Models\\User', 1, 'api-token', '0f4f08d519ea1abc57ca5e8f3b1d9aa005099695b82ca09403576f0fd8d2feca', '[\"*\"]', NULL, NULL, '2025-08-28 09:38:47', '2025-08-28 09:38:47'),
(23, 'App\\Models\\User', 1, 'api-token', '2428bcb5ed088b2b1dc64302c75a8e165d5b6edffba4593c0426ad74fb05bf1d', '[\"*\"]', NULL, NULL, '2025-08-28 09:40:10', '2025-08-28 09:40:10'),
(24, 'App\\Models\\User', 1, 'api-token', 'c2d7cc2153d59936b74f8d9c57cc7f198d850840ca06bcf1741b459965bb6380', '[\"*\"]', NULL, NULL, '2025-08-28 09:45:45', '2025-08-28 09:45:45'),
(25, 'App\\Models\\User', 1, 'api-token', 'c619f9d8bf6cb4361014e20c6c865fd23775da96876e33133b2a1ca37ae67448', '[\"*\"]', NULL, NULL, '2025-08-28 10:04:42', '2025-08-28 10:04:42'),
(26, 'App\\Models\\User', 1, 'api-token', '603a8a83550d6abdf4c12abdbcec19aa38e364fae073eefff6cda621a38a0735', '[\"*\"]', NULL, NULL, '2025-08-28 10:13:51', '2025-08-28 10:13:51'),
(27, 'App\\Models\\User', 1, 'api-token', '589f9edbb06fd6f79a60351cf08b793ca938d1aa5ae5c3e150e1551ae7e758f4', '[\"*\"]', NULL, NULL, '2025-08-28 10:17:21', '2025-08-28 10:17:21'),
(28, 'App\\Models\\User', 1, 'api-token', '69cd9df6deffacc2e95176d99617328ed821275b43eca54411ff359fcca8a2a5', '[\"*\"]', NULL, NULL, '2025-08-28 10:19:23', '2025-08-28 10:19:23'),
(29, 'App\\Models\\User', 1, 'api-token', 'ead9ae2b954b1a5a5c6e14cd8bd50c286801bdecd6cb96f6cff1cbed1ec0e6e6', '[\"*\"]', NULL, NULL, '2025-08-28 10:31:58', '2025-08-28 10:31:58'),
(30, 'App\\Models\\User', 1, 'api-token', '8ca5f15d927e77d7538e22cb9ce8ba2bcbe11c11626d4553ffce06211a868ea9', '[\"*\"]', NULL, NULL, '2025-08-28 10:32:55', '2025-08-28 10:32:55'),
(31, 'App\\Models\\User', 1, 'api-token', '7ba7b26041e4ae36bf40a7d4a72c2e361cbafd87353525c88833caabc8dfb390', '[\"*\"]', NULL, NULL, '2025-08-28 10:33:16', '2025-08-28 10:33:16'),
(32, 'App\\Models\\User', 1, 'api-token', '19ab32ca8470103385e39fd640ef880a95fe6c91ff429843df24ebc7da0b93e0', '[\"*\"]', NULL, NULL, '2025-08-28 10:38:28', '2025-08-28 10:38:28'),
(33, 'App\\Models\\User', 1, 'api-token', 'bdd947c98da168bf672c9aa6ab5da32c4d6ecdf59063af4c1c0ab18f74a73c76', '[\"*\"]', NULL, NULL, '2025-08-28 10:39:00', '2025-08-28 10:39:00'),
(34, 'App\\Models\\User', 12, 'api-token', 'b5efecdc63b484f46d6437e50ad6506c0bed69528ac9d13f996a5a7feb491ce5', '[\"*\"]', NULL, NULL, '2025-08-28 10:39:44', '2025-08-28 10:39:44'),
(35, 'App\\Models\\User', 1, 'api-token', '65de2829706aaa5b28ddd3cbeb1c2880af28050f7775a840d1655e307a9f68e1', '[\"*\"]', NULL, NULL, '2025-08-28 10:42:12', '2025-08-28 10:42:12'),
(36, 'App\\Models\\User', 1, 'api-token', 'a931a1601825a6b9aac887f023ce7f8eba6eac715056ea8130724642a5523065', '[\"*\"]', NULL, NULL, '2025-08-28 10:56:48', '2025-08-28 10:56:48'),
(37, 'App\\Models\\User', 1, 'api-token', 'a4aa8e74f4ef4856ed35b364d79c12c6a0beda537a9c79c62dd825bf0557be90', '[\"*\"]', NULL, NULL, '2025-08-28 11:04:23', '2025-08-28 11:04:23'),
(38, 'App\\Models\\User', 12, 'api-token', '53069a9bbbef6eb571b9ec8c49389537544d5e80d6a8f5d91566ee589138cfb8', '[\"*\"]', NULL, NULL, '2025-08-28 11:05:01', '2025-08-28 11:05:01'),
(39, 'App\\Models\\User', 1, 'api-token', '5f1e704039ee762a933dda9dfda26b670cd2765c46ff83bcf16bf71741c13fae', '[\"*\"]', NULL, NULL, '2025-08-28 11:07:13', '2025-08-28 11:07:13'),
(40, 'App\\Models\\User', 12, 'api-token', '9bac7683d65148760d44e9e54dc6925f1f20c848793f7831b6b68e7b255e0827', '[\"*\"]', NULL, NULL, '2025-08-28 11:09:55', '2025-08-28 11:09:55'),
(41, 'App\\Models\\User', 12, 'api-token', '54dfcd8e74eb536ac991e73f4a79301e1bbd7c31f66c803426df893dfe195672', '[\"*\"]', NULL, NULL, '2025-08-28 11:11:29', '2025-08-28 11:11:29'),
(42, 'App\\Models\\User', 12, 'api-token', '1fc0f6373bd68963dec356f0499fba4efdef2e8dc9533ebe884307fabdfc5c33', '[\"*\"]', NULL, NULL, '2025-08-28 11:12:46', '2025-08-28 11:12:46'),
(43, 'App\\Models\\User', 12, 'api-token', '353f8d46a05e405c87e07a3f49deba092437b37e025c1861909cc2a18dabc94f', '[\"*\"]', NULL, NULL, '2025-08-28 11:22:12', '2025-08-28 11:22:12'),
(45, 'App\\Models\\User', 12, 'api-token', '7e285b9d146be3e2220357f41ad9368e19c8122bcd56e6561ad06516cfb469bc', '[\"*\"]', NULL, NULL, '2025-08-28 11:53:55', '2025-08-28 11:53:55'),
(46, 'App\\Models\\User', 12, 'api-token', 'e99cf8905e1405b9baf3bc5b01d8eefcedfc3b0fc30f3f34035eb7c0010e3b06', '[\"*\"]', NULL, NULL, '2025-08-28 11:56:16', '2025-08-28 11:56:16'),
(47, 'App\\Models\\User', 12, 'api-token', 'dd42e0be911b5559ab5509d2fa8adbcaaab636ec9f902b9c84356603f0bfbef7', '[\"*\"]', NULL, NULL, '2025-08-28 11:58:25', '2025-08-28 11:58:25'),
(48, 'App\\Models\\User', 12, 'api-token', 'c299c262bac00ef47db76e74f998390e240c2cea6095ce49f7193591166e9fe6', '[\"*\"]', NULL, NULL, '2025-08-28 12:00:15', '2025-08-28 12:00:15'),
(49, 'App\\Models\\User', 12, 'api-token', 'e71710dfbd44adc522a3f3a0a4fe47bec45e4bf6a0d62054f4c044039fb95fc0', '[\"*\"]', NULL, NULL, '2025-08-28 12:01:11', '2025-08-28 12:01:11'),
(50, 'App\\Models\\User', 12, 'api-token', '8bb5a58f4253bc6c2c7dd218c7b66cd8cbfc2f51c28bf2bd0c79795321ce4212', '[\"*\"]', NULL, NULL, '2025-08-28 12:02:48', '2025-08-28 12:02:48'),
(51, 'App\\Models\\User', 12, 'api-token', 'e5b36007221cbeb779dee8f15dfc419c27c012b177cf1be81dcca702c35d9e0b', '[\"*\"]', NULL, NULL, '2025-08-28 12:10:43', '2025-08-28 12:10:43'),
(52, 'App\\Models\\User', 12, 'api-token', 'dc9492a31e31e4c6329055e78162cbef09918650876616fa598eaa17c9895d30', '[\"*\"]', NULL, NULL, '2025-08-28 12:18:45', '2025-08-28 12:18:45'),
(53, 'App\\Models\\User', 12, 'api-token', 'bd52ac7bb2887b8fa32bc375d5e5a7cca8cb5cb0dc5ad9fb9697a4a7958e2407', '[\"*\"]', NULL, NULL, '2025-08-28 12:27:16', '2025-08-28 12:27:16'),
(54, 'App\\Models\\User', 12, 'api-token', '534c969e711e35f0bfc0436004cad8b5c25a594f282d3cb288e8a09aff682825', '[\"*\"]', NULL, NULL, '2025-08-28 12:29:49', '2025-08-28 12:29:49'),
(55, 'App\\Models\\User', 12, 'api-token', '1290092e480fc90755869663e4e5a351f8f898d97fa429fb3cc3e806b7bdb136', '[\"*\"]', NULL, NULL, '2025-08-28 12:31:03', '2025-08-28 12:31:03'),
(56, 'App\\Models\\User', 12, 'api-token', 'cf464da4ef3de03e84b8dbe6e0d542dc408eff66b387740264670036cb3fc00d', '[\"*\"]', NULL, NULL, '2025-08-28 12:32:47', '2025-08-28 12:32:47'),
(57, 'App\\Models\\User', 12, 'api-token', '6a1548f6eaf1ca1dd05f2eb0f740764756762b296fc9b4999c4a1f2d4465802a', '[\"*\"]', NULL, NULL, '2025-08-28 12:49:59', '2025-08-28 12:49:59'),
(58, 'App\\Models\\User', 12, 'api-token', '52e92d54124088a29f7f2c59d3e4066fbed33c1fc71d4de45295b24defbf6ecc', '[\"*\"]', NULL, NULL, '2025-08-28 12:54:34', '2025-08-28 12:54:34'),
(59, 'App\\Models\\User', 12, 'api-token', 'ae1337bb84792284d1e9ca1fefbf8a8834ceb210abb1c42b2f2fdba987989e34', '[\"*\"]', '2025-08-28 13:05:36', NULL, '2025-08-28 13:05:34', '2025-08-28 13:05:36'),
(60, 'App\\Models\\User', 12, 'api-token', 'c5af3425988d00286cdc8319134fdd6c8f8ae43ba2f91673e102b15d6d38cfeb', '[\"*\"]', '2025-08-28 13:17:07', NULL, '2025-08-28 13:17:06', '2025-08-28 13:17:07'),
(61, 'App\\Models\\User', 12, 'api-token', '24a19456bfbd4c762b77d8bccd3528d1014a135444e654d3e96403a8a819713f', '[\"*\"]', '2025-08-28 13:18:58', NULL, '2025-08-28 13:18:57', '2025-08-28 13:18:58'),
(62, 'App\\Models\\User', 12, 'api-token', 'c5d772ecde570e06fa35d4eed442a0f021c2179d22f14d38832137d8418bbd0c', '[\"*\"]', '2025-08-28 13:20:33', NULL, '2025-08-28 13:20:31', '2025-08-28 13:20:33'),
(63, 'App\\Models\\User', 12, 'api-token', '99a27133746f11a17c238c5909a02ac57e02d03499506fda1229436b9a823cbe', '[\"*\"]', '2025-08-28 13:22:42', NULL, '2025-08-28 13:22:41', '2025-08-28 13:22:42'),
(64, 'App\\Models\\User', 12, 'api-token', '0ac887a7f9180afcfe5427608ef818674204eb81ab0e01645fce653fc071d015', '[\"*\"]', '2025-08-28 13:23:29', NULL, '2025-08-28 13:23:27', '2025-08-28 13:23:29'),
(65, 'App\\Models\\User', 12, 'api-token', '98a491e4a7833c7bc1495270635c98ac06816333c3aad55fdbff52bd5b4de636', '[\"*\"]', '2025-08-28 13:28:30', NULL, '2025-08-28 13:28:28', '2025-08-28 13:28:30'),
(66, 'App\\Models\\User', 12, 'api-token', '0cfcb2f2293625a633b5abb065673079d905821f8d145b2e4ad54135c9be247f', '[\"*\"]', '2025-08-28 13:32:05', NULL, '2025-08-28 13:32:03', '2025-08-28 13:32:05'),
(67, 'App\\Models\\User', 12, 'api-token', '91d9fda5de0cbc4f4ea355b16e0daacbdd310dcbc3a9b993146d9acd274762b5', '[\"*\"]', '2025-08-28 13:32:46', NULL, '2025-08-28 13:32:44', '2025-08-28 13:32:46'),
(68, 'App\\Models\\User', 12, 'api-token', '6e3731205a981f117ec29977beefc86d3ea7b623771b162053900a784071a7d4', '[\"*\"]', '2025-08-28 13:34:47', NULL, '2025-08-28 13:34:45', '2025-08-28 13:34:47'),
(69, 'App\\Models\\User', 12, 'api-token', '9b17177db2e32edc1367d445ed009acabbb34c132accd62f01e79832c6c53d15', '[\"*\"]', '2025-08-28 13:51:16', NULL, '2025-08-28 13:51:14', '2025-08-28 13:51:16'),
(70, 'App\\Models\\User', 12, 'api-token', 'f3679a9bb430292cf0ef73ec4686cceee497b6291067d1dec013c48b29dde1e0', '[\"*\"]', '2025-08-28 13:52:06', NULL, '2025-08-28 13:52:04', '2025-08-28 13:52:06'),
(71, 'App\\Models\\User', 12, 'api-token', 'bc95cec36fe8833c8c655f34b7ac0badce53e7493954035d7170cef5ba242f96', '[\"*\"]', '2025-08-28 13:59:14', NULL, '2025-08-28 13:59:13', '2025-08-28 13:59:14'),
(72, 'App\\Models\\User', 12, 'api-token', '0d27c989d07a41f2c7572d529d74cb311b4f7e7827579df504c4ddbcb44ee811', '[\"*\"]', '2025-08-28 14:00:07', NULL, '2025-08-28 14:00:05', '2025-08-28 14:00:07'),
(73, 'App\\Models\\User', 12, 'api-token', '442f3db5f454c29819621127a7975657f2e3d990efe22efb4e902f211cafe2dd', '[\"*\"]', '2025-08-28 14:03:18', NULL, '2025-08-28 14:03:17', '2025-08-28 14:03:18'),
(74, 'App\\Models\\User', 12, 'api-token', 'e7b1c1713b74df67de495f0af6e820b76bfcc8756fd0343e00f37e28c8d73bf7', '[\"*\"]', '2025-08-28 14:07:18', NULL, '2025-08-28 14:07:16', '2025-08-28 14:07:18'),
(75, 'App\\Models\\User', 12, 'api-token', 'bc9e825953c68c684108816c8f2eac5a012708c356ac871ed5b683af40457ddc', '[\"*\"]', '2025-08-28 14:09:14', NULL, '2025-08-28 14:08:45', '2025-08-28 14:09:14'),
(76, 'App\\Models\\User', 12, 'api-token', '2ccdb3ed37d5eb2244b4260b62cf1a1c1076121945f65c775eccedd01158aeb1', '[\"*\"]', '2025-08-28 14:10:03', NULL, '2025-08-28 14:10:01', '2025-08-28 14:10:03'),
(77, 'App\\Models\\User', 12, 'api-token', 'e8d52c07e84493266bc0bee3b96542cb2a642d0660325f2688d98d30fb6b238b', '[\"*\"]', '2025-08-28 14:18:47', NULL, '2025-08-28 14:18:46', '2025-08-28 14:18:47'),
(78, 'App\\Models\\User', 12, 'api-token', '12ca3ec5e4c51fb1f59d8f7f427ffd2ebf3de271cce3bf8b84b779599c31cb89', '[\"*\"]', '2025-08-28 14:20:03', NULL, '2025-08-28 14:20:01', '2025-08-28 14:20:03'),
(79, 'App\\Models\\User', 12, 'api-token', 'c92a9970eefb1b5d4056ad8619bb2a7f68a623cd7f02c398ab6b7b5ae7d9e7ef', '[\"*\"]', '2025-08-28 14:22:43', NULL, '2025-08-28 14:22:41', '2025-08-28 14:22:43'),
(80, 'App\\Models\\User', 12, 'api-token', 'de5a0af2af97583edc5adac22af997f9e7b7a019c1b942f12d9b58965dbd0c8c', '[\"*\"]', '2025-08-28 14:25:14', NULL, '2025-08-28 14:25:09', '2025-08-28 14:25:14'),
(81, 'App\\Models\\User', 12, 'api-token', 'b901cfe0eebbf40589d1e4afcd08bc46cfa3166154c4e91969e7144f53d7a9a1', '[\"*\"]', '2025-08-28 14:48:57', NULL, '2025-08-28 14:31:21', '2025-08-28 14:48:57'),
(82, 'App\\Models\\User', 12, 'api-token', '15f7430e1b48a45a1d3eb0d5364d96fbee0c47f9ed01153433818754d03c54b5', '[\"*\"]', '2025-08-28 14:42:34', NULL, '2025-08-28 14:42:32', '2025-08-28 14:42:34'),
(83, 'App\\Models\\User', 12, 'api-token', '4f6e3a8fef953710bbf961dad7bf938ec7e41f4976a8041d4da6e64ba7347008', '[\"*\"]', '2025-08-28 14:42:46', NULL, '2025-08-28 14:42:41', '2025-08-28 14:42:46'),
(84, 'App\\Models\\User', 12, 'api-token', 'fb8740ba2485b7a9d595811feb6c4b2959f5bb328d115477676350543079bb72', '[\"*\"]', '2025-08-28 14:47:30', NULL, '2025-08-28 14:43:24', '2025-08-28 14:47:30'),
(85, 'App\\Models\\User', 12, 'api-token', '5d1fa4f98f38990fa8c34e403eb01c7d69eba10931c08379bc556ab5fb086960', '[\"*\"]', '2025-08-28 14:59:20', NULL, '2025-08-28 14:51:37', '2025-08-28 14:59:20'),
(86, 'App\\Models\\User', 12, 'api-token', 'f75ea0e75b5acd5dd1449beebba6d0e2f96b0ffb60d56c43e6bc6c824ab4e84d', '[\"*\"]', '2025-08-28 15:01:03', NULL, '2025-08-28 14:59:30', '2025-08-28 15:01:03'),
(87, 'App\\Models\\User', 12, 'api-token', 'f475d6d1a07de9bce8e26fe19c955f5810ebba8f55ff8f56aba110171a6a703a', '[\"*\"]', '2025-08-28 15:24:28', NULL, '2025-08-28 15:00:00', '2025-08-28 15:24:28'),
(88, 'App\\Models\\User', 12, 'api-token', 'f012d947ce1d89a15e60a745d2454e4f76d4deb52c8f59a72639b9b4fc17545d', '[\"*\"]', '2025-08-30 06:52:01', NULL, '2025-08-28 15:01:10', '2025-08-30 06:52:01'),
(89, 'App\\Models\\User', 12, 'api-token', 'dc9fbfd8e8543c80e18174fe1ca0fc44c18ebb04fe0fd4241eabb60f95398ada', '[\"*\"]', '2025-08-28 15:28:41', NULL, '2025-08-28 15:28:18', '2025-08-28 15:28:41'),
(90, 'App\\Models\\User', 12, 'api-token', 'f4ab004e0b14dbe0f7f62b953bcda8ec52382942471d4629f50d5983d41475c2', '[\"*\"]', '2025-08-29 12:43:27', NULL, '2025-08-29 12:42:54', '2025-08-29 12:43:27'),
(91, 'App\\Models\\User', 12, 'api-token', 'a964595e86281df1e880228c1a05eddd0ab0dd6109f7e95748623a5d6d2b513a', '[\"*\"]', '2025-08-29 14:15:22', NULL, '2025-08-29 14:14:51', '2025-08-29 14:15:22'),
(92, 'App\\Models\\User', 12, 'api-token', '333b97a1a42516f38904582650e32208b876bf25e50bd5f042771ddd6c00648e', '[\"*\"]', '2025-08-29 14:19:39', NULL, '2025-08-29 14:19:20', '2025-08-29 14:19:39'),
(93, 'App\\Models\\User', 12, 'api-token', '7833a2e5dacac7417b41f08305bde3597d8fd5ddb258d431a8045180bda2862a', '[\"*\"]', '2025-08-29 14:24:39', NULL, '2025-08-29 14:23:55', '2025-08-29 14:24:39'),
(94, 'App\\Models\\User', 12, 'api-token', 'c734dd8b55490a747a3f9ec42e4a1c7e7229c4f0ea87e00237d1863b714d66df', '[\"*\"]', '2025-08-29 14:28:08', NULL, '2025-08-29 14:25:26', '2025-08-29 14:28:08'),
(95, 'App\\Models\\User', 12, 'api-token', 'e08be20728956e686c4cef3084cb2198821d959bf3309b255f06301fe57445e8', '[\"*\"]', '2025-08-29 14:30:52', NULL, '2025-08-29 14:30:45', '2025-08-29 14:30:52'),
(96, 'App\\Models\\User', 12, 'api-token', 'e2ce8572ce0c11307fad698ef2729be640ac8a9ad385643a19b2261ee9a9ce73', '[\"*\"]', '2025-08-30 06:46:38', NULL, '2025-08-30 06:46:32', '2025-08-30 06:46:38'),
(97, 'App\\Models\\User', 12, 'api-token', 'c851c7de1826ecb37141b88e77e61a7fa0eb0a8b2d9dac6929aa5a80db8b382b', '[\"*\"]', '2025-08-31 04:52:17', NULL, '2025-08-29 21:25:44', '2025-08-31 04:52:17'),
(98, 'App\\Models\\User', 12, 'api-token', 'd45695aea9bff88d9aa3679fb847980f7a6ff7030116ef73310729c9aa551811', '[\"*\"]', '2025-08-29 22:13:11', NULL, '2025-08-29 22:12:57', '2025-08-29 22:13:11'),
(99, 'App\\Models\\User', 12, 'api-token', '2acd8ceefecc1832d470751744aa521fd8802a9752c45bbed54eb06b9e269d9b', '[\"*\"]', '2025-08-29 22:17:52', NULL, '2025-08-29 22:15:24', '2025-08-29 22:17:52'),
(100, 'App\\Models\\User', 12, 'api-token', '727bf0ac40648040c86f029d659d97b906cc69bf29904c99325ed4887cda8e90', '[\"*\"]', '2025-08-29 22:19:27', NULL, '2025-08-29 22:19:22', '2025-08-29 22:19:27'),
(101, 'App\\Models\\User', 12, 'api-token', 'c66705452c72dd9425c944cfcb48080ee05e722c810b7dee7e681c83bf9a105c', '[\"*\"]', '2025-08-29 22:20:20', NULL, '2025-08-29 22:20:16', '2025-08-29 22:20:20'),
(102, 'App\\Models\\User', 12, 'api-token', 'a047f2854b49f366d092ac377871cb7097327ee4415e7a811979fe9d24da13dc', '[\"*\"]', '2025-08-29 22:23:09', NULL, '2025-08-29 22:23:08', '2025-08-29 22:23:09'),
(103, 'App\\Models\\User', 12, 'api-token', '11d1a7b21ba9f745c85776ef67da0faed9050caaf5187e912bb7e344e965897b', '[\"*\"]', '2025-08-29 22:24:43', NULL, '2025-08-29 22:24:42', '2025-08-29 22:24:43'),
(104, 'App\\Models\\User', 12, 'api-token', '91eadbbd5c1c817a0e8a1572d6d67bc6c121b8039353c724a695b5079edd7a7d', '[\"*\"]', '2025-08-29 22:28:10', NULL, '2025-08-29 22:28:09', '2025-08-29 22:28:10'),
(105, 'App\\Models\\User', 12, 'api-token', '5a18334a0219c65a49b5ac558bef11aa66618a42a9ca60fed81b9ad1a0fcdc4e', '[\"*\"]', '2025-08-29 22:56:57', NULL, '2025-08-29 22:31:03', '2025-08-29 22:56:57'),
(106, 'App\\Models\\User', 12, 'api-token', '342f5be5c07c47dc0744f2f562323f801b19b3f1a783fcb22df9175496d64d9c', '[\"*\"]', '2025-08-29 22:58:19', NULL, '2025-08-29 22:58:11', '2025-08-29 22:58:19'),
(107, 'App\\Models\\User', 12, 'api-token', 'a7ee1013c008b6cda6463e6c286b22103fd6192844539a291966ce7b12200327', '[\"*\"]', '2025-08-29 23:05:38', NULL, '2025-08-29 23:00:18', '2025-08-29 23:05:38'),
(108, 'App\\Models\\User', 12, 'api-token', 'b004d6bc76d2ca26a82c5ca38924d0e241bc6b3157adf882729b2cbd337bac34', '[\"*\"]', '2025-08-29 23:32:56', NULL, '2025-08-29 23:32:55', '2025-08-29 23:32:56'),
(109, 'App\\Models\\User', 12, 'api-token', 'fa6a5327d21b27bb143f04baa90a155656c3d32a9e2834b0fbabdd1fd3f7a515', '[\"*\"]', '2025-08-29 23:36:46', NULL, '2025-08-29 23:36:45', '2025-08-29 23:36:46'),
(110, 'App\\Models\\User', 12, 'api-token', 'c6f8436471fb7aa13c4b6beb1a6bc340985587a359723484a7d75e8bbfe4d70f', '[\"*\"]', '2025-08-29 23:46:31', NULL, '2025-08-29 23:44:53', '2025-08-29 23:46:31'),
(111, 'App\\Models\\User', 12, 'api-token', '33d348e8f3a5f7850cfe7592fadafe258e72df1688aeecc11ec64ad98a9f8975', '[\"*\"]', '2025-08-30 00:08:23', NULL, '2025-08-30 00:08:22', '2025-08-30 00:08:23'),
(112, 'App\\Models\\User', 12, 'api-token', 'b6297bd8c126bd1c12233198eb11db36fb03301dd1d41adc795cae694494000d', '[\"*\"]', '2025-08-30 00:11:15', NULL, '2025-08-30 00:11:14', '2025-08-30 00:11:15'),
(113, 'App\\Models\\User', 12, 'api-token', '17bf848afa2ff47139d8c7db421c803df81c4b9a01a1c3c7778590bcdec0dfbc', '[\"*\"]', '2025-08-30 00:24:08', NULL, '2025-08-30 00:24:07', '2025-08-30 00:24:08'),
(114, 'App\\Models\\User', 12, 'api-token', '267ecb169390f5e54771c1f5c09a381dec215bf35e1f7df8df04f34c1ce5c69f', '[\"*\"]', '2025-08-30 00:26:11', NULL, '2025-08-30 00:26:10', '2025-08-30 00:26:11'),
(115, 'App\\Models\\User', 12, 'api-token', 'b861bec0ba70bdbf338dea591e28b693af1ced872242ba8989277a24ade4fe94', '[\"*\"]', '2025-08-30 00:36:06', NULL, '2025-08-30 00:36:04', '2025-08-30 00:36:06'),
(116, 'App\\Models\\User', 12, 'api-token', 'd63d30a8bcbf6ed596e391dae6395f7072222ea5b6c384f82475626a3e8aeca2', '[\"*\"]', '2025-08-30 00:41:51', NULL, '2025-08-30 00:41:50', '2025-08-30 00:41:51'),
(117, 'App\\Models\\User', 12, 'api-token', '42e47b0f9cf0164b04de1b3a6804af0cf8159e97e13425686e8f0a879526510a', '[\"*\"]', '2025-08-30 00:45:26', NULL, '2025-08-30 00:45:25', '2025-08-30 00:45:26'),
(118, 'App\\Models\\User', 12, 'api-token', '3992036d9968136cec78dc6763dcd90d9291607db047f1f43fac289eb27b6dd5', '[\"*\"]', '2025-08-30 00:48:14', NULL, '2025-08-30 00:48:12', '2025-08-30 00:48:14'),
(119, 'App\\Models\\User', 12, 'api-token', '4bb16815ce9e3d6795b95243b2f532ba2265a7cbb6c20c361df7c83746821c4a', '[\"*\"]', '2025-08-30 00:50:08', NULL, '2025-08-30 00:50:07', '2025-08-30 00:50:08'),
(120, 'App\\Models\\User', 12, 'api-token', 'f7ea8ff7b8697dd26a5f391145e4ee9a7a715b58884466d15d10f879e3261768', '[\"*\"]', '2025-08-30 01:58:07', NULL, '2025-08-30 01:58:06', '2025-08-30 01:58:07'),
(121, 'App\\Models\\User', 12, 'api-token', 'f750ed0d24f8ba30f6d870ebec3dab63a9d315f9651ba18aab2d1b04656aca40', '[\"*\"]', '2025-08-30 02:07:25', NULL, '2025-08-30 02:07:24', '2025-08-30 02:07:25'),
(122, 'App\\Models\\User', 12, 'api-token', '24949b46b9bd799714120bea13ceb7ec36fab2b898078122f2e47e455dfcfd50', '[\"*\"]', '2025-08-30 02:15:14', NULL, '2025-08-30 02:15:13', '2025-08-30 02:15:14'),
(123, 'App\\Models\\User', 12, 'api-token', '375e106c99cfc30e297035f6cddfa90a0db0a06a55a85d82b67af93d3aac3ba1', '[\"*\"]', '2025-08-30 02:17:10', NULL, '2025-08-30 02:17:09', '2025-08-30 02:17:10'),
(124, 'App\\Models\\User', 12, 'api-token', '46022c9940bca811297cfbc28dfb9241725b58f7e9af2bf5cd9f84c030330a7f', '[\"*\"]', '2025-08-30 02:25:22', NULL, '2025-08-30 02:25:21', '2025-08-30 02:25:22'),
(125, 'App\\Models\\User', 12, 'api-token', '6380741cd83b4c492f2ba08883ffa56e47e3aa323e9159f0a6afaee4640ea4fa', '[\"*\"]', '2025-08-30 02:36:28', NULL, '2025-08-30 02:35:05', '2025-08-30 02:36:28'),
(126, 'App\\Models\\User', 12, 'api-token', 'fe175e45133cdd040d0cd0d58da0e05813bad7b61816839fc4f104fe2f06bb14', '[\"*\"]', '2025-08-30 02:46:58', NULL, '2025-08-30 02:37:50', '2025-08-30 02:46:58'),
(127, 'App\\Models\\User', 12, 'api-token', '20c42bac9fff5b3919ed5c67eb27124c9d20d0ab78cf1c4c86d7b0f1f6bc5aa1', '[\"*\"]', '2025-08-30 03:02:18', NULL, '2025-08-30 02:56:37', '2025-08-30 03:02:18'),
(128, 'App\\Models\\User', 12, 'api-token', '27dcd6b52763dcdc75395e8c285fb164e366620128a95cb6e28af30bdfe9ad31', '[\"*\"]', '2025-08-30 03:02:34', NULL, '2025-08-30 03:02:31', '2025-08-30 03:02:34'),
(129, 'App\\Models\\User', 12, 'api-token', '36871ba932f51e10c5846582093c210e70cd11c34997e3ecf9ba76455c899bea', '[\"*\"]', '2025-08-30 03:07:17', NULL, '2025-08-30 03:05:37', '2025-08-30 03:07:17'),
(130, 'App\\Models\\User', 12, 'api-token', 'ac0202c65597eb1744c95bba64a5647a254ad82d5efe8e969e8d79e3bfe31bf1', '[\"*\"]', '2025-08-30 03:10:20', NULL, '2025-08-30 03:07:52', '2025-08-30 03:10:20'),
(131, 'App\\Models\\User', 12, 'api-token', 'ef25ee66001448da2e14b9ac7d2ed8838850449e85dc992f5867c6fce0055413', '[\"*\"]', '2025-08-30 03:12:52', NULL, '2025-08-30 03:12:22', '2025-08-30 03:12:52'),
(132, 'App\\Models\\User', 12, 'api-token', 'c2fd7686b9ac9c698764c2a80ae32bf501d80a077da5d476afb1447ae0040d1c', '[\"*\"]', '2025-08-30 03:26:34', NULL, '2025-08-30 03:25:02', '2025-08-30 03:26:34'),
(133, 'App\\Models\\User', 12, 'api-token', '04903ec69b8e3ec4e92ee0d317f209be7075b162e2e00327e26239bb5db75f61', '[\"*\"]', '2025-08-30 03:27:21', NULL, '2025-08-30 03:26:52', '2025-08-30 03:27:21'),
(134, 'App\\Models\\User', 12, 'api-token', '168950934432f34f137f1a13303a3c2c664493588604fff1fd61e4e7c3ee72d4', '[\"*\"]', '2025-08-30 03:31:54', NULL, '2025-08-30 03:27:52', '2025-08-30 03:31:54'),
(135, 'App\\Models\\User', 12, 'api-token', '911d8e9062282a04d58a38d17e41912a8f9c094a230850d2901e0407ef471d8d', '[\"*\"]', '2025-08-30 03:55:01', NULL, '2025-08-30 03:39:30', '2025-08-30 03:55:01'),
(136, 'App\\Models\\User', 12, 'api-token', 'cf4c4146ca76be5b956e54c15ba5a2f2fd22a6be5164ee73f7b53176c1f32e61', '[\"*\"]', '2025-08-30 04:40:59', NULL, '2025-08-30 04:40:56', '2025-08-30 04:40:59'),
(137, 'App\\Models\\User', 12, 'api-token', '3fc5948d49f557ab645a367cfc3b5e4576e0376221d4e990ef30a64b9cda51c7', '[\"*\"]', '2025-08-30 04:51:52', NULL, '2025-08-30 04:46:07', '2025-08-30 04:51:52'),
(138, 'App\\Models\\User', 12, 'api-token', '55e9bd52f2dd76f03295d76b95c0564c97d5ff5a796a6fc3336048bdcb9e2d82', '[\"*\"]', '2025-08-30 05:28:21', NULL, '2025-08-30 05:09:56', '2025-08-30 05:28:21'),
(139, 'App\\Models\\User', 12, 'api-token', 'a3a8f0a9c9240c751636035fa62da5890905d7b1d99fdd086c2ee929032e251a', '[\"*\"]', '2025-08-30 08:11:17', NULL, '2025-08-30 08:08:50', '2025-08-30 08:11:17'),
(140, 'App\\Models\\User', 12, 'api-token', '9f0dd1fc2df1ee05f6690ceedbe31be502ca30bf549a3ae23caa74e148e74f1a', '[\"*\"]', '2025-08-30 11:07:35', NULL, '2025-08-30 11:07:10', '2025-08-30 11:07:35'),
(141, 'App\\Models\\User', 12, 'api-token', 'd27850bd8f01b29b777c3b93bb46b6f7d3b1988149e30c732f30d217b2cd99d5', '[\"*\"]', '2025-08-30 20:48:47', NULL, '2025-08-30 20:41:20', '2025-08-30 20:48:47'),
(142, 'App\\Models\\User', 12, 'api-token', '333f1c9907ec217ae37052a8393bc4e75a26a7eb3499c9c3bdcc5c5235a0123d', '[\"*\"]', '2025-08-30 20:51:03', NULL, '2025-08-30 20:49:21', '2025-08-30 20:51:03'),
(143, 'App\\Models\\User', 12, 'api-token', 'fcb046dbecaa0ef36343f6b5cf41bd1355330046aa9c92f3c95ae2ba2fe10eb3', '[\"*\"]', '2025-08-30 20:53:36', NULL, '2025-08-30 20:52:05', '2025-08-30 20:53:36'),
(144, 'App\\Models\\User', 12, 'api-token', '2453ae1b5be050407a41c8a14c1871577a2a1904718d0910eca555a58553854c', '[\"*\"]', '2025-08-30 21:00:47', NULL, '2025-08-30 20:56:37', '2025-08-30 21:00:47'),
(145, 'App\\Models\\User', 12, 'api-token', 'b5947ac55959ce71f0248421ee6f6b301abcd4899eb6345e74d5924b4f2a36b7', '[\"*\"]', '2025-08-30 21:01:08', NULL, '2025-08-30 21:01:00', '2025-08-30 21:01:08'),
(146, 'App\\Models\\User', 12, 'api-token', '96ca7a9aa1e8470d9bb7ebd1981f320468d1f862c1ab8f62f6ad37d3c6f5701c', '[\"*\"]', '2025-08-30 21:02:04', NULL, '2025-08-30 21:01:52', '2025-08-30 21:02:04'),
(147, 'App\\Models\\User', 12, 'api-token', '4d8af50c280a586e3aaf023de00f446a294e639c23b96e628c24c3e535df37ae', '[\"*\"]', '2025-08-30 21:39:39', NULL, '2025-08-30 21:06:24', '2025-08-30 21:39:39'),
(148, 'App\\Models\\User', 12, 'api-token', '854261d2f26794ab0e85596d693e14ebec381401298cf38cfb83c93f41918ed6', '[\"*\"]', '2025-08-30 22:38:20', NULL, '2025-08-30 22:07:03', '2025-08-30 22:38:20'),
(149, 'App\\Models\\User', 12, 'api-token', 'ce425f59196004623dd5ee03b5e6de1b43b7f87d3ba4363689e9b7ada8d97276', '[\"*\"]', '2025-08-30 22:47:43', NULL, '2025-08-30 22:41:55', '2025-08-30 22:47:43'),
(150, 'App\\Models\\User', 12, 'api-token', '8f783bc1abcd15a9fd4956db3c46e8b124fdf3c50effec3aa0e76dc00d285490', '[\"*\"]', '2025-08-30 22:50:57', NULL, '2025-08-30 22:48:10', '2025-08-30 22:50:57'),
(151, 'App\\Models\\User', 12, 'api-token', '019a876bd416dd889358b73f489ce3da543df5d4572d5342feae013ebc0307ca', '[\"*\"]', '2025-08-30 23:00:44', NULL, '2025-08-30 22:57:05', '2025-08-30 23:00:44'),
(152, 'App\\Models\\User', 12, 'api-token', '0ae7e3b4a1433f713694c7ffba76de81cbfdcc84dd34294b67aca4fafbada0b1', '[\"*\"]', '2025-08-30 23:01:39', NULL, '2025-08-30 23:01:01', '2025-08-30 23:01:39'),
(153, 'App\\Models\\User', 12, 'api-token', 'f306f67adf321240d8755bd815d5b7c7612122f480ca2ae5e739d79c92d626fe', '[\"*\"]', '2025-08-30 23:06:56', NULL, '2025-08-30 23:06:13', '2025-08-30 23:06:56'),
(154, 'App\\Models\\User', 12, 'api-token', '8e395d864dcc46330bb41af1eb5c4774bf36da802b438a604586e9629e9c58f3', '[\"*\"]', '2025-08-30 23:10:17', NULL, '2025-08-30 23:08:52', '2025-08-30 23:10:17'),
(155, 'App\\Models\\User', 12, 'api-token', '56064291d406a3957d1da4a54baa568ec9dd335151f2aa747b08afdaa8288770', '[\"*\"]', '2025-08-30 23:19:36', NULL, '2025-08-30 23:16:44', '2025-08-30 23:19:36'),
(156, 'App\\Models\\User', 12, 'api-token', '74945c082c915a1d804b9b6eb1c2d3847879ed39cf0c79bee3cb3fc46a72db5e', '[\"*\"]', '2025-08-30 23:20:51', NULL, '2025-08-30 23:19:51', '2025-08-30 23:20:51'),
(157, 'App\\Models\\User', 12, 'api-token', '4c0c898b7ba1db97a643315c638b486650c415949bad88d6fe988315cc91111d', '[\"*\"]', '2025-08-30 23:26:37', NULL, '2025-08-30 23:23:01', '2025-08-30 23:26:37'),
(158, 'App\\Models\\User', 12, 'api-token', 'edff67299140946557e5ecf497bbd4925de2ef746d4ff0785fe30df068ef3c5a', '[\"*\"]', '2025-08-30 23:31:11', NULL, '2025-08-30 23:29:13', '2025-08-30 23:31:11'),
(159, 'App\\Models\\User', 12, 'api-token', '2a5ce504f5d21ec6a65f7617efde5b73b0e048b52fc47b19378872b46ba0c9f1', '[\"*\"]', '2025-08-31 00:01:10', NULL, '2025-08-31 00:01:00', '2025-08-31 00:01:10'),
(160, 'App\\Models\\User', 12, 'api-token', '77346c3ad643827994fcb8bb63c6bbc2f9474d4239ba0ed03e1f5da743c22dc4', '[\"*\"]', '2025-08-31 00:12:03', NULL, '2025-08-31 00:11:54', '2025-08-31 00:12:03'),
(161, 'App\\Models\\User', 12, 'api-token', 'c2ca8158dea908a753bd84b1c5145333ff9f70be5956b6a0e9c745498c053399', '[\"*\"]', '2025-08-31 00:15:41', NULL, '2025-08-31 00:15:34', '2025-08-31 00:15:41'),
(162, 'App\\Models\\User', 12, 'api-token', '2fe98cafc4041f63c3fb2ba6131987514e26c40c018f9ddd3ab45d11c5701be7', '[\"*\"]', '2025-08-31 00:19:23', NULL, '2025-08-31 00:19:16', '2025-08-31 00:19:23'),
(163, 'App\\Models\\User', 12, 'api-token', '8eda0440e6b6c3cb028e79051fb66defc0b681b0cddd946b13f2440cc2f06355', '[\"*\"]', '2025-08-31 00:24:29', NULL, '2025-08-31 00:23:56', '2025-08-31 00:24:29'),
(164, 'App\\Models\\User', 12, 'api-token', '7d882f524594ea295785a8b70a02740599687e585425fd716fef078af27a07c5', '[\"*\"]', '2025-08-31 00:36:57', NULL, '2025-08-31 00:36:48', '2025-08-31 00:36:57'),
(165, 'App\\Models\\User', 12, 'api-token', '4c70cac136e098cbc8ae630d727066ecab8ac67d73b3a20d1408c0b3c67da9ee', '[\"*\"]', '2025-08-31 00:43:57', NULL, '2025-08-31 00:38:08', '2025-08-31 00:43:57'),
(166, 'App\\Models\\User', 12, 'api-token', 'aad9945f5538e6feddb91579cb5481578039c18a09dfb13fce6230833fcbf748', '[\"*\"]', '2025-08-31 02:13:18', NULL, '2025-08-31 00:45:03', '2025-08-31 02:13:18'),
(167, 'App\\Models\\User', 12, 'api-token', '2df8626a0170841d718fa35e8dbd191c75bbcbb198e696fffc1f2564deafd850', '[\"*\"]', '2025-08-31 02:44:16', NULL, '2025-08-31 02:14:13', '2025-08-31 02:44:16'),
(168, 'App\\Models\\User', 12, 'api-token', '5683b8a713d70086020595699f0a8d8f654838e43d9800a45ded9204ac6c8a99', '[\"*\"]', '2025-08-31 02:49:34', NULL, '2025-08-31 02:44:36', '2025-08-31 02:49:34'),
(169, 'App\\Models\\User', 12, 'api-token', 'c2fc566e523284bff0048c3f26a2e3f03bf94b68f25be35313f8bba75105354d', '[\"*\"]', '2025-08-31 03:03:02', NULL, '2025-08-31 02:49:54', '2025-08-31 03:03:02'),
(170, 'App\\Models\\User', 12, 'api-token', 'c9ec80823ca10d1ab4b0f0203ec6b25eb1519aed4f12f31a11911ac06bc8dd7a', '[\"*\"]', '2025-08-31 03:07:09', NULL, '2025-08-31 03:04:37', '2025-08-31 03:07:09'),
(171, 'App\\Models\\User', 12, 'api-token', '1e73bb18a99a9e72bb6fa9ab683ea12b72099cbd7e0f36786eb10cb3ca8e6a80', '[\"*\"]', '2025-08-31 03:07:32', NULL, '2025-08-31 03:07:28', '2025-08-31 03:07:32'),
(172, 'App\\Models\\User', 12, 'api-token', '69d52735f8f8003d0e7c774c95b066608d3063fe01311d523a4a20da8ba7a59f', '[\"*\"]', '2025-08-31 03:40:44', NULL, '2025-08-31 03:09:19', '2025-08-31 03:40:44'),
(173, 'App\\Models\\User', 12, 'api-token', '6cea00ede81e54a9121f2a46c28120c8bf020f628dfe9f8eefda30665f367419', '[\"*\"]', '2025-08-31 03:43:31', NULL, '2025-08-31 03:42:39', '2025-08-31 03:43:31'),
(174, 'App\\Models\\User', 12, 'api-token', '6fac065f3ab96956fe78192f48434aff3ce7cb8ea1ac0e7b0d188b678f4574a9', '[\"*\"]', '2025-08-31 05:03:12', NULL, '2025-08-31 03:45:18', '2025-08-31 05:03:12'),
(175, 'App\\Models\\User', 12, 'api-token', '25d54ff3cd5aa07bff595a708d005da11893e03b45f3feb5811910f7668ee102', '[\"*\"]', '2025-09-02 02:21:35', NULL, '2025-08-31 04:52:29', '2025-09-02 02:21:35'),
(176, 'App\\Models\\User', 12, 'api-token', '8dfced750750d3565bd731b461ccfe92b8fd532292065fe9f14fb1484d7965ec', '[\"*\"]', '2025-08-31 05:04:07', NULL, '2025-08-31 05:03:59', '2025-08-31 05:04:07'),
(177, 'App\\Models\\User', 12, 'api-token', '9a21f6a71fe063bef06f5caeb101e945ccea5fda6fb00b53902dfa0910fd9cd3', '[\"*\"]', '2025-09-13 08:56:57', NULL, '2025-08-31 08:13:28', '2025-09-13 08:56:57'),
(178, 'App\\Models\\User', 12, 'api-token', '475794e2318ab0e95e02637342b50aa0d30877e33d669e1e68c8868fd054a0e9', '[\"*\"]', '2025-08-31 08:30:40', NULL, '2025-08-31 08:19:15', '2025-08-31 08:30:40'),
(179, 'App\\Models\\User', 12, 'api-token', '84b8a61b2f19c00a1eee9a8994c9194287c87034bedfa8be180359bd2c8c35eb', '[\"*\"]', '2025-08-31 08:52:33', NULL, '2025-08-31 08:47:21', '2025-08-31 08:52:33'),
(180, 'App\\Models\\User', 12, 'api-token', '1ef6f326a53932d9fa50c117332bd721cb1d9076fb42b6da1946a50d54a9a5dc', '[\"*\"]', '2025-08-31 08:53:15', NULL, '2025-08-31 08:53:07', '2025-08-31 08:53:15'),
(181, 'App\\Models\\User', 12, 'api-token', 'bfa17d72cdc92018dfd9a505b19a4fbe88a01aaf1e6d63cea353810857b57f3d', '[\"*\"]', '2025-08-31 09:03:41', NULL, '2025-08-31 09:00:55', '2025-08-31 09:03:41'),
(182, 'App\\Models\\User', 12, 'api-token', '19b4855df455d9ceec4fced4435a43967ba5290ea26e7fa5cf9f8efefe46520c', '[\"*\"]', '2025-08-31 09:17:44', NULL, '2025-08-31 09:04:16', '2025-08-31 09:17:44'),
(183, 'App\\Models\\User', 12, 'api-token', '272a21af897f83b9d042f6705eb474e372a351564b7af5353ff33c561b840abb', '[\"*\"]', '2025-08-31 09:28:58', NULL, '2025-08-31 09:24:53', '2025-08-31 09:28:58'),
(184, 'App\\Models\\User', 12, 'api-token', '2788a350aa0397417a4e8779acbe896af301674c5c0d96d04a726993471405e4', '[\"*\"]', '2025-08-31 09:30:13', NULL, '2025-08-31 09:29:58', '2025-08-31 09:30:13'),
(185, 'App\\Models\\User', 12, 'api-token', '74eb43452590a2a342b0fe4ae60d8dec80b75b8358c5bc0fd19f5303ca76bcc2', '[\"*\"]', '2025-08-31 09:37:56', NULL, '2025-08-31 09:37:20', '2025-08-31 09:37:56'),
(186, 'App\\Models\\User', 12, 'api-token', 'b158df82a80d62420af0d2799e2421f35e01ca3a6e043aa5a26ce3e84b38fb0c', '[\"*\"]', '2025-08-31 09:45:25', NULL, '2025-08-31 09:38:59', '2025-08-31 09:45:25'),
(187, 'App\\Models\\User', 12, 'api-token', 'b1281e909be41cec5db4d4745aea9a33b6aebb68352a08ba3f6dd6436e9a27a2', '[\"*\"]', '2025-08-31 21:21:36', NULL, '2025-08-31 20:38:05', '2025-08-31 21:21:36'),
(188, 'App\\Models\\User', 12, 'api-token', '41bbee4db71002b94ac57262a1dc6d59f9fdc841083f680665319e9f28942f21', '[\"*\"]', '2025-08-31 21:23:25', NULL, '2025-08-31 21:22:06', '2025-08-31 21:23:25'),
(189, 'App\\Models\\User', 12, 'api-token', '559e2a4bc324c2c5c609b1fb36de7e58748324c121e3c3dd592e7c9c234452ee', '[\"*\"]', '2025-08-31 21:43:49', NULL, '2025-08-31 21:43:14', '2025-08-31 21:43:49'),
(190, 'App\\Models\\User', 12, 'api-token', 'd45c5cd55033aa1879017564f8394dc1c3f1b01d74fda02951b119b9984bff50', '[\"*\"]', '2025-08-31 22:36:10', NULL, '2025-08-31 22:12:46', '2025-08-31 22:36:10'),
(191, 'App\\Models\\User', 12, 'api-token', '36ed8b2bf14f0d165e89b83804d84c2144ae44a7a868c95fe49a6ab7cb0e19c3', '[\"*\"]', '2025-08-31 22:46:16', NULL, '2025-08-31 22:36:26', '2025-08-31 22:46:16'),
(192, 'App\\Models\\User', 12, 'api-token', '75f87981f0f0348550a364fcfbdc0a5a7bcd319058d1fbd807e9f64ccadb2224', '[\"*\"]', '2025-08-31 22:48:00', NULL, '2025-08-31 22:47:41', '2025-08-31 22:48:00'),
(193, 'App\\Models\\User', 12, 'api-token', '813a8b27477c9e9db79eefb731da26793fabc18cbb491ce7968e5bec308ea0d1', '[\"*\"]', '2025-08-31 23:30:49', NULL, '2025-08-31 22:49:04', '2025-08-31 23:30:49'),
(194, 'App\\Models\\User', 12, 'api-token', '606a047bbb72548abdcfdc5b92044f1cfd46952acf1d983aecf8baeb2a9e1ab1', '[\"*\"]', '2025-08-31 23:48:50', NULL, '2025-08-31 23:31:05', '2025-08-31 23:48:50'),
(195, 'App\\Models\\User', 12, 'api-token', '08e526fbd9f58ca5d8b38377584e8449fed05a7210857dddd2a5d633b5e670a0', '[\"*\"]', '2025-09-01 03:02:34', NULL, '2025-08-31 23:50:46', '2025-09-01 03:02:34'),
(196, 'App\\Models\\User', 12, 'api-token', '9d3197cb76da992cff213e337a608f2af15c6fbbd8356972d13d1c2ab12a7f66', '[\"*\"]', '2025-09-01 03:21:10', NULL, '2025-09-01 03:20:59', '2025-09-01 03:21:10'),
(197, 'App\\Models\\User', 12, 'api-token', '0216030eb5673ddc0fbfbf23bd6dab75cc3f09c1b77d38e1c289c25fce06ecb1', '[\"*\"]', '2025-09-01 03:23:49', NULL, '2025-09-01 03:22:08', '2025-09-01 03:23:49'),
(198, 'App\\Models\\User', 12, 'api-token', '19163e2571928b1639afb19d509034ce1274d2b0f1f7e131f64a875be7154547', '[\"*\"]', '2025-09-01 03:54:12', NULL, '2025-09-01 03:30:44', '2025-09-01 03:54:12'),
(199, 'App\\Models\\User', 12, 'api-token', '63c2bad67c5574c02ee4517fc5ede096fb5ef0d283aec4265ca5571fb3f0e794', '[\"*\"]', '2025-09-01 03:58:05', NULL, '2025-09-01 03:56:25', '2025-09-01 03:58:05'),
(200, 'App\\Models\\User', 12, 'api-token', '47fb542b273a3d05b9b000946798b3903b16bfb7d86d57acc5c4b7b1fc9100bf', '[\"*\"]', '2025-09-01 04:12:05', NULL, '2025-09-01 04:01:19', '2025-09-01 04:12:05'),
(201, 'App\\Models\\User', 12, 'api-token', '1430a98d737dc5f64217abda3301f135dc7d5aca0c689bfc6334bea826d24495', '[\"*\"]', '2025-09-01 04:13:48', NULL, '2025-09-01 04:12:25', '2025-09-01 04:13:48'),
(202, 'App\\Models\\User', 12, 'api-token', 'aaea46d521dd685a47d2a78dd6146839d9f6aac13013702c4d90d8b0717b55ed', '[\"*\"]', '2025-09-01 04:16:50', NULL, '2025-09-01 04:14:23', '2025-09-01 04:16:50'),
(203, 'App\\Models\\User', 12, 'api-token', '7e994b99f297d4abf78bb7f0f9a3f833e6bbbfbc24fb99015c2e956f4294c83a', '[\"*\"]', '2025-09-01 04:17:22', NULL, '2025-09-01 04:17:06', '2025-09-01 04:17:22'),
(204, 'App\\Models\\User', 12, 'api-token', 'f72d383383eec263648b750175548bb4edd943a5377abc7a03d73b0f6db18fe1', '[\"*\"]', '2025-09-01 04:58:53', NULL, '2025-09-01 04:32:27', '2025-09-01 04:58:53'),
(205, 'App\\Models\\User', 12, 'api-token', '65827309b961e099354b304ca108596489479c2f261f02ffc75bcd9522e8d0b4', '[\"*\"]', '2025-09-01 08:32:58', NULL, '2025-09-01 07:43:36', '2025-09-01 08:32:58'),
(206, 'App\\Models\\User', 12, 'api-token', 'b60bdb08ba64ffbef983099f0aba39e1161db6e1a0b0d5819e47b17a43d2b07f', '[\"*\"]', '2025-09-01 08:43:41', NULL, '2025-09-01 08:43:40', '2025-09-01 08:43:41'),
(207, 'App\\Models\\User', 12, 'api-token', '8e9b91e14bd754a6d4a969ac4e6b9c010c8482374226d2b3a609e337b9ea5ef1', '[\"*\"]', '2025-09-01 09:18:07', NULL, '2025-09-01 09:15:05', '2025-09-01 09:18:07'),
(208, 'App\\Models\\User', 12, 'api-token', '1380abac56a8f77d019edc6ccde4fd2d07a416ae48de455326d0319caf17e293', '[\"*\"]', '2025-09-01 09:19:55', NULL, '2025-09-01 09:19:49', '2025-09-01 09:19:55'),
(209, 'App\\Models\\User', 12, 'api-token', 'd5a2730e5d07ee2196b0f7c66b620ca3e9c007a8994166c4f000f64fc23e476f', '[\"*\"]', '2025-09-01 09:28:19', NULL, '2025-09-01 09:28:11', '2025-09-01 09:28:19'),
(210, 'App\\Models\\User', 12, 'api-token', '930be18589d01a5dfe1b773ec6fca42819eeacb9cad7b94913767aec3edf0097', '[\"*\"]', NULL, NULL, '2025-09-01 17:37:02', '2025-09-01 17:37:02'),
(211, 'App\\Models\\User', 12, 'api-token', 'b7b6a9f16c8a048836f8970dd5e9c56c201e38e2925149007aedb827341cae74', '[\"*\"]', '2025-09-01 17:41:44', NULL, '2025-09-01 17:37:06', '2025-09-01 17:41:44'),
(212, 'App\\Models\\User', 12, 'api-token', 'd34c3fa4aa3c986afa06c3a73ffb69d06e5baa6fed7045007bc2e345581cdad6', '[\"*\"]', '2025-09-01 17:52:14', NULL, '2025-09-01 17:46:47', '2025-09-01 17:52:14'),
(213, 'App\\Models\\User', 12, 'api-token', '434f0e9c5d2968983c995ee0ccdfab661cd96543336d0489219550c77f12b2fa', '[\"*\"]', '2025-09-01 17:55:28', NULL, '2025-09-01 17:55:23', '2025-09-01 17:55:28'),
(214, 'App\\Models\\User', 12, 'api-token', 'f4cf16221bad6498279f0467a3c3130defd14a194119fcd6ba73a6d7791736b1', '[\"*\"]', '2025-09-01 17:58:41', NULL, '2025-09-01 17:57:14', '2025-09-01 17:58:41'),
(215, 'App\\Models\\User', 12, 'api-token', '7d69fbb700fe7087e924f233e654ef31e8512084b7552e39da799b523bfc2fda', '[\"*\"]', '2025-09-01 18:00:50', NULL, '2025-09-01 18:00:46', '2025-09-01 18:00:50'),
(216, 'App\\Models\\User', 12, 'api-token', '5a75fd4584f4b0b95ae1413df58e0af65e9b6301cc24575b420460dc0f6e21a0', '[\"*\"]', '2025-09-01 18:03:05', NULL, '2025-09-01 18:02:59', '2025-09-01 18:03:05'),
(217, 'App\\Models\\User', 12, 'api-token', '2d8ddfe73159f702720019aa050176cc1127c08b27592a11dadd4c13196caa9c', '[\"*\"]', '2025-09-01 20:37:37', NULL, '2025-09-01 20:37:28', '2025-09-01 20:37:37'),
(218, 'App\\Models\\User', 12, 'api-token', '0ca3b645c6cbec86d17fa8dde488af45dca3dbc9777a8470356e01e6b2af6fe1', '[\"*\"]', '2025-09-01 20:49:46', NULL, '2025-09-01 20:41:15', '2025-09-01 20:49:46'),
(219, 'App\\Models\\User', 12, 'api-token', '44ac3f8c17758bb5e714b525738a02d6c95baa353e7e3d89702df5083cb0a502', '[\"*\"]', '2025-09-01 21:22:10', NULL, '2025-09-01 20:57:34', '2025-09-01 21:22:10'),
(220, 'App\\Models\\User', 12, 'api-token', 'b6c8d5d18b8b0415efc56994cdac7a6184b5dc28b1e4c4c844111930a0713e0f', '[\"*\"]', '2025-09-01 22:51:28', NULL, '2025-09-01 22:42:41', '2025-09-01 22:51:28'),
(221, 'App\\Models\\User', 12, 'api-token', '1a16e7b9335bad0b41343ea125b286c7fcf96c375e6c189e5561fa27e060cee9', '[\"*\"]', '2025-09-01 23:21:13', NULL, '2025-09-01 22:54:06', '2025-09-01 23:21:13'),
(222, 'App\\Models\\User', 12, 'api-token', 'b1b21bfacbca25baf3192c74b2216bd4e9ced7b6947f2be75c1a677c6875fe3d', '[\"*\"]', '2025-09-01 23:22:32', NULL, '2025-09-01 23:21:35', '2025-09-01 23:22:32'),
(223, 'App\\Models\\User', 12, 'api-token', '3f935ac22021e38057962626366a07a568fe3eb6cb8d1b85d9fe0314b74323f3', '[\"*\"]', '2025-09-01 23:49:02', NULL, '2025-09-01 23:26:11', '2025-09-01 23:49:02'),
(224, 'App\\Models\\User', 12, 'api-token', 'b18e5e257db0c184cb98fb8024c148d5301143f76f059e52b39b578082848f35', '[\"*\"]', '2025-09-01 23:57:20', NULL, '2025-09-01 23:56:41', '2025-09-01 23:57:20'),
(225, 'App\\Models\\User', 12, 'api-token', 'cca1bdcecc568bd1f8cb2f59a361147dc6f1242a7f6444e40b66057ea0b04126', '[\"*\"]', '2025-09-02 00:10:59', NULL, '2025-09-01 23:58:43', '2025-09-02 00:10:59'),
(226, 'App\\Models\\User', 12, 'api-token', 'd70b3e424b8ad0ceeffd9ea3b5a257baf2361fcaa09e5d9ec055aaaf7b2695b0', '[\"*\"]', '2025-09-02 00:21:26', NULL, '2025-09-02 00:11:18', '2025-09-02 00:21:26'),
(227, 'App\\Models\\User', 12, 'api-token', '208e821de42987fe85642d53dca28de992a22f2fb7b60f55398eab4a2621322d', '[\"*\"]', '2025-09-02 00:27:57', NULL, '2025-09-02 00:22:20', '2025-09-02 00:27:57'),
(228, 'App\\Models\\User', 12, 'api-token', 'ecd0115add422f485492a7f5e40e3932096f3e8fd3e2fddc1479492db457af77', '[\"*\"]', '2025-09-02 02:19:56', NULL, '2025-09-02 02:09:57', '2025-09-02 02:19:56'),
(229, 'App\\Models\\User', 12, 'api-token', '3b3b9fd915133fe80e859c5e9858616239fd0b68fab11ee080ca7cedf020995d', '[\"*\"]', '2025-09-02 02:29:57', NULL, '2025-09-02 02:21:41', '2025-09-02 02:29:57'),
(230, 'App\\Models\\User', 12, 'api-token', '3a211adb6fc44dc74ae1996f1796b2fe5e442fb45a83dcdae37632cda9a1e2af', '[\"*\"]', '2025-09-02 02:31:04', NULL, '2025-09-02 02:30:18', '2025-09-02 02:31:04'),
(231, 'App\\Models\\User', 12, 'api-token', 'db6acbb81e075479b34e6ba09c1570f7068f9e8ec321e3925be81eec53afb391', '[\"*\"]', '2025-09-02 02:34:05', NULL, '2025-09-02 02:33:32', '2025-09-02 02:34:05'),
(232, 'App\\Models\\User', 12, 'api-token', '908ea8a5243d263fdd821afd8d4b6ba1919d29536bdf4fd39c27468c66bea55a', '[\"*\"]', '2025-09-02 02:36:14', NULL, '2025-09-02 02:35:14', '2025-09-02 02:36:14'),
(233, 'App\\Models\\User', 12, 'api-token', 'aada5e7064389d87db51db7873316dab83f67fff2efc7df2cfa014f10e7bae67', '[\"*\"]', '2025-09-02 03:06:45', NULL, '2025-09-02 02:39:23', '2025-09-02 03:06:45'),
(235, 'App\\Models\\User', 12, 'api-token', '9ea2c72d41b725c3ab0f19fb7015c094342127c15f3404ae545a736c052fbf9e', '[\"*\"]', '2025-09-02 03:35:06', NULL, '2025-09-02 03:25:19', '2025-09-02 03:35:06'),
(236, 'App\\Models\\User', 12, 'api-token', '02310df4983b5ff0be46a9724da6d0f139fba926e81b1cfa15545efe0db668ab', '[\"*\"]', '2025-09-02 03:28:46', NULL, '2025-09-02 03:28:44', '2025-09-02 03:28:46'),
(237, 'App\\Models\\User', 12, 'api-token', '9bc94ff54ece4a7d3a2e607d45856e9ec06ec345dd490ce3b5f997d44ea5fe14', '[\"*\"]', '2025-09-08 22:12:02', NULL, '2025-09-02 03:32:47', '2025-09-08 22:12:02'),
(238, 'App\\Models\\User', 12, 'api-token', '41ddc0238247e97ad45e9d739f4de13c1cfbc5fd398346aed435b5fbcead2e23', '[\"*\"]', '2025-09-02 04:58:13', NULL, '2025-09-02 04:58:12', '2025-09-02 04:58:13'),
(239, 'App\\Models\\User', 12, 'api-token', '8df3cda16859e095fa2c7cf33dd612df48c96f632a8ec2612285d29401742a5c', '[\"*\"]', '2025-09-02 05:00:53', NULL, '2025-09-02 05:00:52', '2025-09-02 05:00:53'),
(240, 'App\\Models\\User', 12, 'api-token', 'e15ac3db6c3017f7aa1f0bd96c4c328bf21417c3d6571f1aa673e3a58f7dd1e3', '[\"*\"]', '2025-09-02 05:05:36', NULL, '2025-09-02 05:05:35', '2025-09-02 05:05:36'),
(241, 'App\\Models\\User', 12, 'api-token', 'a2aaab2f413b88eecc68583b87cb0f2d17bfad83d76f7154fbd42198dc42c05e', '[\"*\"]', '2025-09-02 05:15:44', NULL, '2025-09-02 05:15:43', '2025-09-02 05:15:44'),
(242, 'App\\Models\\User', 12, 'api-token', '29fae801b44680237d38fae6488c50071a07616ce42db708d1283ffc2dceff71', '[\"*\"]', '2025-09-02 05:35:51', NULL, '2025-09-02 05:35:50', '2025-09-02 05:35:51'),
(243, 'App\\Models\\User', 12, 'api-token', '759728ec9d25b45f03ed3baa53200d8f00fb7ec13c0de14275cd39f00af3465b', '[\"*\"]', '2025-09-02 07:34:23', NULL, '2025-09-02 07:34:15', '2025-09-02 07:34:23'),
(244, 'App\\Models\\User', 12, 'api-token', 'c193b6150a07b73a34a01f6ddba33a8f36bae4b5c0d6911696c3e9076e5be69c', '[\"*\"]', '2025-09-02 07:39:26', NULL, '2025-09-02 07:39:25', '2025-09-02 07:39:26'),
(245, 'App\\Models\\User', 12, 'api-token', '9e22c89ac64e8c556c28b00189e12a5c48ba532325e9034f6588fd687b1c7782', '[\"*\"]', '2025-09-02 08:12:51', NULL, '2025-09-02 08:02:31', '2025-09-02 08:12:51'),
(246, 'App\\Models\\User', 12, 'api-token', '364e8b83d1d58a4761e42914b40056aa130a4413d16f04b69c22719cba33fe86', '[\"*\"]', '2025-09-02 08:21:17', NULL, '2025-09-02 08:21:16', '2025-09-02 08:21:17'),
(247, 'App\\Models\\User', 12, 'api-token', 'f959e430c64fb9d165edd09ad383be4751b1e5152f7d2ca08523aae975d78086', '[\"*\"]', '2025-09-02 08:56:11', NULL, '2025-09-02 08:56:10', '2025-09-02 08:56:11'),
(248, 'App\\Models\\User', 12, 'api-token', '9768887480953544ac44445cd22437c11fd18826dc4277c9013250fcbe6533ff', '[\"*\"]', '2025-09-02 09:01:08', NULL, '2025-09-02 09:01:07', '2025-09-02 09:01:08'),
(249, 'App\\Models\\User', 12, 'api-token', '3b79c85bcead3ae0a478b7b2a490c7a07e5928e326bd190b0c49f1699a54297e', '[\"*\"]', '2025-09-02 09:07:15', NULL, '2025-09-02 09:07:14', '2025-09-02 09:07:15'),
(250, 'App\\Models\\User', 12, 'api-token', 'ab3961ed64038d6d1c11fa0a8e468925f53f76ec81a2970566d8051405b64ccf', '[\"*\"]', '2025-09-02 09:19:27', NULL, '2025-09-02 09:19:25', '2025-09-02 09:19:27'),
(251, 'App\\Models\\User', 12, 'api-token', '0cc5a3f1272c590f5001cb0f08c77d84c335517d5961913fd5dd9e3eff37889f', '[\"*\"]', '2025-09-02 09:30:26', NULL, '2025-09-02 09:29:36', '2025-09-02 09:30:26'),
(252, 'App\\Models\\User', 12, 'api-token', '0dac5695bb2227def4cafdc6118651e925ace3c7471b6c1d886ae94db8d3a9b7', '[\"*\"]', '2025-09-02 20:30:48', NULL, '2025-09-02 20:29:15', '2025-09-02 20:30:48'),
(253, 'App\\Models\\User', 12, 'api-token', '2b60b07858854b4dbac123f788740484430ca1673145a03994444ec07e252e03', '[\"*\"]', '2025-09-02 23:20:03', NULL, '2025-09-02 22:17:51', '2025-09-02 23:20:03'),
(254, 'App\\Models\\User', 12, 'api-token', '4d9bc1642f334b0dfa38b18466e08bf2663b2b2156c72f3f71fb1cce36b98dc9', '[\"*\"]', '2025-09-02 23:26:13', NULL, '2025-09-02 23:21:38', '2025-09-02 23:26:13'),
(255, 'App\\Models\\User', 12, 'api-token', '7a5ce8c96a97c7185a47a4354ec0bd89953353c381cafb52f5f2c95474ec5f7b', '[\"*\"]', '2025-09-02 23:35:28', NULL, '2025-09-02 23:34:17', '2025-09-02 23:35:28'),
(256, 'App\\Models\\User', 12, 'api-token', 'd2e2872bc46f38ac8db58a12e6b541bda9752e6aab35a2b9e0d1433b8013b4fa', '[\"*\"]', '2025-09-02 23:44:04', NULL, '2025-09-02 23:41:06', '2025-09-02 23:44:04'),
(257, 'App\\Models\\User', 12, 'api-token', '4c4772ef820ff803521e38edb0ed0ab8ebe08dc3489cd0af6d85f167607a789e', '[\"*\"]', '2025-09-02 23:44:25', NULL, '2025-09-02 23:44:19', '2025-09-02 23:44:25'),
(258, 'App\\Models\\User', 12, 'api-token', '20f7f937c6db4f89da63e89b42c06664d9260a88a7f9e39691e472f959b02722', '[\"*\"]', '2025-09-02 23:51:41', NULL, '2025-09-02 23:51:05', '2025-09-02 23:51:41'),
(259, 'App\\Models\\User', 12, 'api-token', '81353366d944dd94a80af3852795a3203c4844b310aaa59e0da4acedd6ebd470', '[\"*\"]', '2025-09-03 00:00:01', NULL, '2025-09-02 23:58:21', '2025-09-03 00:00:01'),
(260, 'App\\Models\\User', 12, 'api-token', 'c96116db93ddc1161fa068e3f2f887f4c4438220e42bf391770ba7b6204d385d', '[\"*\"]', '2025-09-03 00:12:51', NULL, '2025-09-03 00:07:26', '2025-09-03 00:12:51');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(261, 'App\\Models\\User', 12, 'api-token', 'aba77806f3611084c03090afae6bd63293714bbbcd9b79161e95e9c9ad5f1c14', '[\"*\"]', '2025-09-03 00:26:32', NULL, '2025-09-03 00:14:36', '2025-09-03 00:26:32'),
(262, 'App\\Models\\User', 12, 'api-token', 'd9dbcde386269e15a416ac5e37c7b560a88d198a8021fe945b7c1f18f754d019', '[\"*\"]', '2025-09-03 00:28:00', NULL, '2025-09-03 00:27:22', '2025-09-03 00:28:00'),
(263, 'App\\Models\\User', 12, 'api-token', '166ccac97cab0a3b5adbac093926804dfaab7fb7675a374eb839fc61a5073d99', '[\"*\"]', '2025-09-03 00:41:12', NULL, '2025-09-03 00:28:34', '2025-09-03 00:41:12'),
(264, 'App\\Models\\User', 12, 'api-token', 'ac3f1af0cc11e5e4a4072da31303e6003bc130432ef9b3f9c747fd367fb2cee1', '[\"*\"]', '2025-09-03 00:59:45', NULL, '2025-09-03 00:59:44', '2025-09-03 00:59:45'),
(265, 'App\\Models\\User', 12, 'api-token', 'dcf02b4526d9ca0c7ce7dc8f5911340d3dc0dffd31a065df1f8f3a0c7b7b2da7', '[\"*\"]', '2025-09-03 01:02:53', NULL, '2025-09-03 01:02:52', '2025-09-03 01:02:53'),
(266, 'App\\Models\\User', 12, 'api-token', 'c27a21d781247f010b86ea0a19003c3e3fe70f6d13cd961f03ca9aabcdf52ae3', '[\"*\"]', '2025-09-03 01:30:07', NULL, '2025-09-03 01:30:06', '2025-09-03 01:30:07'),
(267, 'App\\Models\\User', 12, 'api-token', '30776204165e1b66a266cffac05cfaddadb6b9ffa2f0cd7fc5101d32019d08c9', '[\"*\"]', '2025-09-03 02:01:11', NULL, '2025-09-03 01:31:38', '2025-09-03 02:01:11'),
(268, 'App\\Models\\User', 12, 'api-token', 'e68c525f9eed983d2ebae9087cc28ee8c0d0547625f81ed339f529b423fdf347', '[\"*\"]', '2025-09-03 02:06:58', NULL, '2025-09-03 02:06:56', '2025-09-03 02:06:58'),
(269, 'App\\Models\\User', 12, 'api-token', 'd5ecbbadd9c6a2614302e296907412d47fc441f4961327808f5eae081791968c', '[\"*\"]', '2025-09-03 02:48:41', NULL, '2025-09-03 02:15:26', '2025-09-03 02:48:41'),
(270, 'App\\Models\\User', 12, 'api-token', 'd594501f419bcb8e247e161b5dabc3555ec2aa3002e79ec62451b76061f4ebeb', '[\"*\"]', '2025-09-03 03:09:33', NULL, '2025-09-03 03:09:32', '2025-09-03 03:09:33'),
(274, 'App\\Models\\User', 12, 'api-token', '44ce00f67141cb49be53289179973067445fdd41bf0f1bd99bbadc41f8fea497', '[\"*\"]', '2025-09-03 03:18:08', NULL, '2025-09-03 03:18:07', '2025-09-03 03:18:08'),
(275, 'App\\Models\\User', 12, 'api-token', '116985c8f109ca931ef1390abfdc2c94b5bdb88f38a7be78bb34aa30ac590099', '[\"*\"]', '2025-09-03 03:18:31', NULL, '2025-09-03 03:18:30', '2025-09-03 03:18:31'),
(276, 'App\\Models\\User', 12, 'api-token', 'a709debb3e686d0b0ea75081dbc61a20673165acdc6d2bb3d943a0e652ef1f13', '[\"*\"]', '2025-09-03 03:22:41', NULL, '2025-09-03 03:22:40', '2025-09-03 03:22:41'),
(277, 'App\\Models\\User', 12, 'api-token', '8da2275f1c2adc98e367b366825d0daa99f2cdabd88a0fbf3929457bc827505f', '[\"*\"]', '2025-09-03 03:30:57', NULL, '2025-09-03 03:30:56', '2025-09-03 03:30:57'),
(278, 'App\\Models\\User', 12, 'api-token', 'b9c4b6b27dab6508b2e7ef689ff42486cf712ed5d942927601c214df4348792d', '[\"*\"]', '2025-09-03 03:46:23', NULL, '2025-09-03 03:45:38', '2025-09-03 03:46:23'),
(279, 'App\\Models\\User', 12, 'api-token', '2dc5c7117880159981d6434352f8554a3694a9845316699ac4be523d9ae1d3f0', '[\"*\"]', '2025-09-03 04:27:00', NULL, '2025-09-03 03:58:49', '2025-09-03 04:27:00'),
(280, 'App\\Models\\User', 12, 'api-token', '630dbd777810077475d67a7c7a6ada9abaf8174f5fdea7ee56206110056ef667', '[\"*\"]', '2025-09-03 04:28:06', NULL, '2025-09-03 04:28:04', '2025-09-03 04:28:06'),
(282, 'App\\Models\\User', 12, 'api-token', 'fb8475cb9ed272a1c9d05e7361d77bfcc1bc3287cb51ff1e533f44404c411117', '[\"*\"]', '2025-09-03 04:41:59', NULL, '2025-09-03 04:41:15', '2025-09-03 04:41:59'),
(284, 'App\\Models\\User', 12, 'api-token', 'a8e0a7e6a1dcd6ee73e4e6c708b527eef1096c14ec99f61d0cb65a0057f6de86', '[\"*\"]', '2025-09-03 05:12:49', NULL, '2025-09-03 05:01:27', '2025-09-03 05:12:49'),
(285, 'App\\Models\\User', 12, 'api-token', '6dee0430cded1d77ff6223a6d2c99cbe0753cdb6763d5540172368644609c628', '[\"*\"]', '2025-09-03 07:45:35', NULL, '2025-09-03 07:41:31', '2025-09-03 07:45:35'),
(286, 'App\\Models\\User', 12, 'api-token', '6661e8318952856957cbe9ad32c5f7a1d27143ee37735d5cb8f24670f6b45765', '[\"*\"]', '2025-09-03 08:31:07', NULL, '2025-09-03 07:57:20', '2025-09-03 08:31:07'),
(287, 'App\\Models\\User', 12, 'api-token', '5f03d172a046c6a6681ceff863a1e9113c17ad9e7cd99f781784dc5f18abe5ac', '[\"*\"]', '2025-09-03 08:44:03', NULL, '2025-09-03 08:36:59', '2025-09-03 08:44:03'),
(288, 'App\\Models\\User', 12, 'api-token', '8262b24e300bc63d7db2f31c944ee1145c856780291e9f82c5cf63ae79d68ebc', '[\"*\"]', '2025-09-03 08:45:29', NULL, '2025-09-03 08:44:38', '2025-09-03 08:45:29'),
(289, 'App\\Models\\User', 12, 'api-token', 'e65997deceee2728af00f198d5c06dd6e2de168cc427e5789b578ea0cfe61691', '[\"*\"]', '2025-09-03 08:47:30', NULL, '2025-09-03 08:47:24', '2025-09-03 08:47:30'),
(290, 'App\\Models\\User', 12, 'api-token', 'c679525faf0ef392eeb16159ef891421bda6e2977411087df7be58ab309c579a', '[\"*\"]', '2025-09-03 08:51:38', NULL, '2025-09-03 08:51:32', '2025-09-03 08:51:38'),
(291, 'App\\Models\\User', 12, 'api-token', '2189f64e7e9e25c7799cf46b65a837e27d0d6a6355511ffbaee3f8cb282e2708', '[\"*\"]', '2025-09-03 08:59:22', NULL, '2025-09-03 08:54:52', '2025-09-03 08:59:22'),
(292, 'App\\Models\\User', 12, 'api-token', 'b65bd47ffcdc071b6e0c9ce925443190ca8d321cf45767a2a97d348cc5474a1a', '[\"*\"]', '2025-09-03 09:00:31', NULL, '2025-09-03 09:00:30', '2025-09-03 09:00:31'),
(293, 'App\\Models\\User', 12, 'api-token', 'c5fcfcb727e609b8f2a9637d1174bbd9f0297759282d7d70549a7275cafe0db6', '[\"*\"]', '2025-09-03 09:02:45', NULL, '2025-09-03 09:02:44', '2025-09-03 09:02:45'),
(294, 'App\\Models\\User', 12, 'api-token', '1391f4c74af80da63c92cae027596a6fde829f76acb8b56407e56ad910481a08', '[\"*\"]', '2025-09-03 09:13:28', NULL, '2025-09-03 09:10:27', '2025-09-03 09:13:28'),
(295, 'App\\Models\\User', 12, 'api-token', '65fa7fb9d52951cb09c090fd340c132036116842c2f01b79bd86afe10da81d32', '[\"*\"]', '2025-09-03 09:25:42', NULL, '2025-09-03 09:25:37', '2025-09-03 09:25:42'),
(296, 'App\\Models\\User', 12, 'api-token', 'd3401fbf14510f6dbd14230a2374b2de4691c114a9ed3d57858f0ed8f36ad8d7', '[\"*\"]', '2025-09-03 09:26:17', NULL, '2025-09-03 09:26:06', '2025-09-03 09:26:17'),
(297, 'App\\Models\\User', 12, 'api-token', 'ac8920f78d495b7f2b389eead70d4d20b7e4a64f0bc998bef021c4ed63744c29', '[\"*\"]', '2025-09-03 20:54:29', NULL, '2025-09-03 20:51:02', '2025-09-03 20:54:29'),
(298, 'App\\Models\\User', 12, 'api-token', 'f7faf56889191d976fdb36d4d0357f66dc6a8a9a1b13e26e9274b869073445b6', '[\"*\"]', '2025-09-03 21:00:26', NULL, '2025-09-03 20:59:22', '2025-09-03 21:00:26'),
(306, 'App\\Models\\User', 55, 'api-token', '5a480e27bea92cbe939c557e3eac1b5e615fd4c8434297caf4b4593f870f08dd', '[\"*\"]', '2025-09-03 23:12:24', NULL, '2025-09-03 23:09:09', '2025-09-03 23:12:24'),
(310, 'App\\Models\\User', 12, 'api-token', '052612879c4699cf47aa28c089d311c9c7d4b71eb1154391c89929635dd76b51', '[\"*\"]', '2025-09-04 02:20:43', NULL, '2025-09-04 02:16:32', '2025-09-04 02:20:43'),
(311, 'App\\Models\\User', 12, 'api-token', '13fd66347edebcb0a1529cea773534bd7c04d5f682ec5eeaab217f041557eea7', '[\"*\"]', '2025-09-04 03:52:00', NULL, '2025-09-04 03:51:06', '2025-09-04 03:52:00'),
(313, 'App\\Models\\User', 12, 'api-token', '3ffbb6ff3df4bc40171843c0efb8bf27ea42b1d4d8fbdc04e887ce595112390c', '[\"*\"]', '2025-09-04 05:05:01', NULL, '2025-09-04 05:05:00', '2025-09-04 05:05:01'),
(314, 'App\\Models\\User', 12, 'api-token', '208a52a5d2bdbc63a1c5f99f82a4fbf01902e004bdbb0ec9674067d1cba2cf54', '[\"*\"]', '2025-09-05 20:26:34', NULL, '2025-09-05 20:25:46', '2025-09-05 20:26:34'),
(319, 'App\\Models\\User', 12, 'api-token', '17205d748770f5b3a1023d745ca2eeaf86cad4b7bfe038d4dbeb49f4e1fbb177', '[\"*\"]', '2025-09-06 22:54:58', NULL, '2025-09-06 22:44:46', '2025-09-06 22:54:58'),
(320, 'App\\Models\\User', 12, 'api-token', '8e00816ebdda11adc8a0e2eca77c3a28e661a80f553039eeb4f52f249531db60', '[\"*\"]', '2025-09-06 23:02:25', NULL, '2025-09-06 23:02:06', '2025-09-06 23:02:25'),
(321, 'App\\Models\\User', 12, 'api-token', '428eaa7fbec1941ebac67f68cfd56cbb50365825e689dccacde6deda07cd7639', '[\"*\"]', '2025-09-06 23:31:56', NULL, '2025-09-06 23:30:47', '2025-09-06 23:31:56'),
(322, 'App\\Models\\User', 12, 'api-token', '93350cab7d9c48caafe10ba7a03055e78183a202f7f1e8525490775cb3ab227b', '[\"*\"]', '2025-09-06 23:40:34', NULL, '2025-09-06 23:36:11', '2025-09-06 23:40:34'),
(323, 'App\\Models\\User', 12, 'api-token', 'ef667b60b3a74bf95f7cdd1d7a43fae84cdd03c43d665fd0b4ed62d771167747', '[\"*\"]', '2025-09-07 00:47:05', NULL, '2025-09-07 00:46:50', '2025-09-07 00:47:05'),
(324, 'App\\Models\\User', 12, 'api-token', '1128641b864bb7c247f99cc45d2e9cba9290205dc286c3b0effbeb12cbedf930', '[\"*\"]', '2025-09-07 00:56:08', NULL, '2025-09-07 00:48:54', '2025-09-07 00:56:08'),
(325, 'App\\Models\\User', 12, 'api-token', 'e2098881fe2bc1fbdfe13f04fe341d23442f0459205b0104cafec7d36693a986', '[\"*\"]', '2025-09-07 00:58:53', NULL, '2025-09-07 00:56:47', '2025-09-07 00:58:53'),
(326, 'App\\Models\\User', 12, 'api-token', 'b47c2f25a513d56b6e0d091d8c798a6d6c0ff619f8f7602de087825fef6f5469', '[\"*\"]', '2025-09-07 01:10:34', NULL, '2025-09-07 01:10:29', '2025-09-07 01:10:34'),
(327, 'App\\Models\\User', 12, 'api-token', '543c590551d3dbb7b792da89e915eda6fb1a5d582768ddd16fcd0a3c8d87cc40', '[\"*\"]', '2025-09-07 01:13:48', NULL, '2025-09-07 01:13:40', '2025-09-07 01:13:48'),
(328, 'App\\Models\\User', 12, 'api-token', '338b3c7b7b92f6775a33ab2a67f5eae40d8b4a3da0495a8e474433ed6011a3f0', '[\"*\"]', '2025-09-07 01:15:07', NULL, '2025-09-07 01:14:27', '2025-09-07 01:15:07'),
(329, 'App\\Models\\User', 12, 'api-token', 'd15e1c1ff2dca7efdc1c4996f00c0aa64ecad79b8749a13b2d69a0da004f356b', '[\"*\"]', '2025-09-07 01:49:45', NULL, '2025-09-07 01:16:29', '2025-09-07 01:49:45'),
(330, 'App\\Models\\User', 12, 'api-token', '0f23ca2dfffd039ea5cdfc1f0c54f9f092235692cc987044e862f086749d0867', '[\"*\"]', '2025-09-07 02:17:35', NULL, '2025-09-07 01:50:20', '2025-09-07 02:17:35'),
(331, 'App\\Models\\User', 12, 'api-token', '32cbc051486de614464e0ec0f35fd501bed9706a89e27a0a5e74ebfa5e956407', '[\"*\"]', '2025-09-07 02:29:35', NULL, '2025-09-07 02:23:06', '2025-09-07 02:29:35'),
(332, 'App\\Models\\User', 12, 'api-token', 'ae3a24a19af3fce87ac63e26ee91c0f91beb05900a721f3f0b5a3c8706866961', '[\"*\"]', '2025-09-07 03:55:28', NULL, '2025-09-07 03:55:27', '2025-09-07 03:55:28'),
(333, 'App\\Models\\User', 12, 'api-token', '59cbfa8f173fd2d9795620aead369203338756174130f97eb8afd49252438868', '[\"*\"]', '2025-09-07 03:59:06', NULL, '2025-09-07 03:59:05', '2025-09-07 03:59:06'),
(334, 'App\\Models\\User', 12, 'api-token', '650245607f714aba44914321198a1b94709099afb8adc8675b275ba96e37acc6', '[\"*\"]', '2025-09-07 03:59:29', NULL, '2025-09-07 03:59:28', '2025-09-07 03:59:29'),
(335, 'App\\Models\\User', 12, 'api-token', '3df4e9d0fe441359344b8964d8a3f25eccfbcb5da53562bc948b05fe15b7c361', '[\"*\"]', '2025-09-07 04:02:52', NULL, '2025-09-07 04:02:51', '2025-09-07 04:02:52'),
(336, 'App\\Models\\User', 12, 'api-token', '797549a2190402a27734ebe10458c996aa90dd6cc659b31148bcc21add4cddb0', '[\"*\"]', '2025-09-07 04:04:33', NULL, '2025-09-07 04:04:33', '2025-09-07 04:04:33'),
(337, 'App\\Models\\User', 12, 'api-token', 'a9770d2dbd8ac8e84bc5603b2523a6e186b387e6c85b70335ea2a9b155e3c5fe', '[\"*\"]', '2025-09-07 04:11:35', NULL, '2025-09-07 04:06:05', '2025-09-07 04:11:35'),
(338, 'App\\Models\\User', 12, 'api-token', '95090c8209a222133614ee2558befdcda5f9c3cc9e8c052322f7bf6a132c5934', '[\"*\"]', '2025-09-07 04:18:56', NULL, '2025-09-07 04:15:15', '2025-09-07 04:18:56'),
(339, 'App\\Models\\User', 12, 'api-token', 'd01371811cfe265ff0b67fc3b29fb37c4a3d716e3a4fd42a1d999327410bfc31', '[\"*\"]', '2025-09-07 04:23:27', NULL, '2025-09-07 04:19:48', '2025-09-07 04:23:27'),
(341, 'App\\Models\\User', 12, 'api-token', '95686439ecfe350d6586a2b73966f979c630f87de7441521f124d83ea909daee', '[\"*\"]', '2025-09-07 04:27:24', NULL, '2025-09-07 04:27:23', '2025-09-07 04:27:24'),
(342, 'App\\Models\\User', 12, 'api-token', '20479c2a5fc8b12e0289e89705e1817a6b27f66fdb2a1c1865281d5d518b70c3', '[\"*\"]', '2025-09-07 04:37:38', NULL, '2025-09-07 04:29:41', '2025-09-07 04:37:38'),
(344, 'App\\Models\\User', 12, 'api-token', '65df238f322cf6dbccae46ecbcf9fe529e66700c7c46e8f930477e247adfdd80', '[\"*\"]', '2025-09-07 04:48:57', NULL, '2025-09-07 04:47:57', '2025-09-07 04:48:57'),
(345, 'App\\Models\\User', 12, 'api-token', 'e5e2d4905119cd8ab20ced068e97afa4936c924d8f42aad7057bd2338d504f7b', '[\"*\"]', '2025-09-07 05:20:59', NULL, '2025-09-07 04:49:21', '2025-09-07 05:20:59'),
(346, 'App\\Models\\User', 12, 'api-token', 'f42be7bf2da3955ef038ef79d3634f689b56e2e0a2e29e8901adbfde2c42e538', '[\"*\"]', '2025-09-07 08:41:35', NULL, '2025-09-07 08:41:21', '2025-09-07 08:41:35'),
(347, 'App\\Models\\User', 12, 'api-token', 'e0b0a411bb7f829354a2371d2cae35af8508cae137285938c89a84516833ee03', '[\"*\"]', '2025-09-07 20:47:12', NULL, '2025-09-07 20:46:28', '2025-09-07 20:47:12'),
(348, 'App\\Models\\User', 12, 'api-token', 'f8a566303145dddc0b9bf142b683bc244f267ec4129551e7b65f9cd5d34570c1', '[\"*\"]', '2025-09-07 20:48:19', NULL, '2025-09-07 20:48:16', '2025-09-07 20:48:19'),
(349, 'App\\Models\\User', 12, 'api-token', 'dd0d585f2da2fcc1e11a563e9c84202f7d346f2e269ec9b05515baee2313a230', '[\"*\"]', '2025-09-07 21:12:34', NULL, '2025-09-07 20:55:05', '2025-09-07 21:12:34'),
(350, 'App\\Models\\User', 12, 'api-token', 'f87916a4f2b079f8cd925cb759fad1959eaa07fe37da48f897326db3a7268bbc', '[\"*\"]', '2025-09-07 22:03:35', NULL, '2025-09-07 22:00:30', '2025-09-07 22:03:35'),
(351, 'App\\Models\\User', 12, 'api-token', '460a9abb48ae55edb077d8a01201830ca0d3e16c84e28cca04d164afdc8c7b64', '[\"*\"]', '2025-09-07 22:05:00', NULL, '2025-09-07 22:04:57', '2025-09-07 22:05:00'),
(352, 'App\\Models\\User', 12, 'api-token', '79c00c1436baea715334631624ec776774bcee1ded7d55d6efbbb6eca12cf791', '[\"*\"]', '2025-09-07 22:07:53', NULL, '2025-09-07 22:07:47', '2025-09-07 22:07:53'),
(353, 'App\\Models\\User', 12, 'api-token', '26c3af63e1c02d77b74ab32869c227c03345182ecacb7d057d0fe50a12ea0fac', '[\"*\"]', '2025-09-07 22:15:20', NULL, '2025-09-07 22:09:51', '2025-09-07 22:15:20'),
(354, 'App\\Models\\User', 12, 'api-token', 'ea37fee11ff604839d774c9f948091316b534cbc48653141261bad590112b2ff', '[\"*\"]', '2025-09-07 23:19:18', NULL, '2025-09-07 22:16:35', '2025-09-07 23:19:18'),
(355, 'App\\Models\\User', 12, 'api-token', '4c57d1e20a1dc6a048505b6b48442d7f93cb9b377e0ada5e9120c6ab3c76da91', '[\"*\"]', '2025-09-07 23:47:13', NULL, '2025-09-07 23:27:30', '2025-09-07 23:47:13'),
(356, 'App\\Models\\User', 12, 'api-token', 'eecc9539b22801016510acb58d47c787902a44d8863e4704e69729a2832ef844', '[\"*\"]', '2025-09-07 23:50:21', NULL, '2025-09-07 23:47:52', '2025-09-07 23:50:21'),
(357, 'App\\Models\\User', 12, 'api-token', 'c718336599359d40c9f835bb5ea4a5767c82e1f1595c18b9ff593a1a5232f535', '[\"*\"]', '2025-09-08 00:10:42', NULL, '2025-09-08 00:01:42', '2025-09-08 00:10:42'),
(358, 'App\\Models\\User', 12, 'api-token', 'dddf55729bce2fa911cf3b24027738b99f1e8aa643428394a036d7121e2ee072', '[\"*\"]', '2025-09-08 00:17:58', NULL, '2025-09-08 00:12:20', '2025-09-08 00:17:58'),
(359, 'App\\Models\\User', 12, 'api-token', '2a01197fd781caf2bb8de2a9b3a1c038ccce32ae2912540d36dcfc4d15a03e9c', '[\"*\"]', '2025-09-08 00:33:39', NULL, '2025-09-08 00:18:18', '2025-09-08 00:33:39'),
(360, 'App\\Models\\User', 12, 'api-token', 'f5d482b051871a81b5bf027999648d541c2bab583daa51396ba8bfabfcf64878', '[\"*\"]', '2025-09-08 00:26:25', NULL, '2025-09-08 00:25:45', '2025-09-08 00:26:25'),
(361, 'App\\Models\\User', 12, 'api-token', '2df4ea137f04415a56692516903e7d3abec69a7ca95c410556227137a4b1185c', '[\"*\"]', '2025-09-08 00:27:32', NULL, '2025-09-08 00:27:03', '2025-09-08 00:27:32'),
(362, 'App\\Models\\User', 12, 'api-token', '57be9ec95e87511f67a1057b68a1b6612b70c51511d698a98ddb8071577ddef2', '[\"*\"]', '2025-09-08 00:33:09', NULL, '2025-09-08 00:28:20', '2025-09-08 00:33:09'),
(364, 'App\\Models\\User', 12, 'api-token', 'b595b26cf910b14368305651e11aa30ed4987a422af5e8406d1ca39d53d58efe', '[\"*\"]', '2025-09-08 00:49:07', NULL, '2025-09-08 00:35:11', '2025-09-08 00:49:07'),
(365, 'App\\Models\\User', 12, 'api-token', '8e114214e89a3118cfe23a173855fb814aa152af17735556e014d663f906d9e8', '[\"*\"]', '2025-09-08 01:02:13', NULL, '2025-09-08 00:57:12', '2025-09-08 01:02:13'),
(366, 'App\\Models\\User', 12, 'api-token', '048d94d41742993ac63f46898de8e69ac38c708e0244840b57e9ea4189633db1', '[\"*\"]', '2025-09-08 01:06:15', NULL, '2025-09-08 01:06:06', '2025-09-08 01:06:15'),
(367, 'App\\Models\\User', 12, 'api-token', 'd4a2be4b529497cf85169986d59336c9edaccb868f72d154f0f74dedc7e86418', '[\"*\"]', '2025-09-08 02:01:17', NULL, '2025-09-08 01:57:03', '2025-09-08 02:01:17'),
(368, 'App\\Models\\User', 12, 'api-token', '42ce9fc2873d789973220ee8806feb6d879cece746c26b4866896bee22f43644', '[\"*\"]', '2025-09-08 02:16:51', NULL, '2025-09-08 02:07:31', '2025-09-08 02:16:51'),
(369, 'App\\Models\\User', 12, 'api-token', '686c67bb7f9fed5fe71247b14017bd77f689a89fa04a0e6a15bcbf438793f75e', '[\"*\"]', '2025-09-08 02:17:51', NULL, '2025-09-08 02:17:46', '2025-09-08 02:17:51'),
(370, 'App\\Models\\User', 12, 'api-token', 'c445bcb23d70f24fe6d2dba0c05e79e0758cff03bfb81c3bbe1681c41af12383', '[\"*\"]', '2025-09-08 02:35:01', NULL, '2025-09-08 02:30:53', '2025-09-08 02:35:01'),
(371, 'App\\Models\\User', 12, 'api-token', '7f15a464a4e56ccd8e57da869ec062d693dbf4e535ff1a3baf69d38b0165e3cc', '[\"*\"]', '2025-09-08 02:37:19', NULL, '2025-09-08 02:35:28', '2025-09-08 02:37:19'),
(372, 'App\\Models\\User', 12, 'api-token', '280e0d04a013bbb808c2f5c7255360d8e023900982f30d601ef0a4b8fa1fe9b7', '[\"*\"]', '2025-09-08 02:40:55', NULL, '2025-09-08 02:37:44', '2025-09-08 02:40:55'),
(373, 'App\\Models\\User', 12, 'api-token', 'fdd5bfa8be79208d636027cf74249606914ebf14dff228df30d3df0bd18168ea', '[\"*\"]', '2025-09-08 02:51:07', NULL, '2025-09-08 02:50:49', '2025-09-08 02:51:07'),
(374, 'App\\Models\\User', 12, 'api-token', 'f7d88ec260ed07908a48e29133dc5d7af02b637056e52e6089344341ca799424', '[\"*\"]', '2025-09-08 02:51:37', NULL, '2025-09-08 02:51:34', '2025-09-08 02:51:37'),
(376, 'App\\Models\\User', 12, 'api-token', 'ac9aeb71a0214a57877a16d73e0a79639aba7a9e05a293f396fcafe642558ad5', '[\"*\"]', '2025-09-08 03:30:02', NULL, '2025-09-08 03:09:36', '2025-09-08 03:30:02'),
(377, 'App\\Models\\User', 12, 'api-token', '748057fc82d35bef8f50ae763cffd09668eeb14b32e93b287737d16932f51667', '[\"*\"]', '2025-09-08 03:32:29', NULL, '2025-09-08 03:31:53', '2025-09-08 03:32:29'),
(379, 'App\\Models\\User', 12, 'api-token', '191ba4792551d835c19c56b5b27e833377383d3b1a23eb9499a402133aae380d', '[\"*\"]', '2025-09-08 03:56:18', NULL, '2025-09-08 03:56:17', '2025-09-08 03:56:18'),
(380, 'App\\Models\\User', 12, 'api-token', '801e742657c4ac13ea1fbf5b187f32aeda32bf54f9a07181d41cb1f086e1bd8d', '[\"*\"]', '2025-09-08 03:56:41', NULL, '2025-09-08 03:56:40', '2025-09-08 03:56:41'),
(381, 'App\\Models\\User', 12, 'api-token', 'fa4605829a49aed02b3d41d0445c847d0bb6c55c14412cfa845fb76d796a7314', '[\"*\"]', '2025-09-08 04:01:40', NULL, '2025-09-08 04:01:39', '2025-09-08 04:01:40'),
(382, 'App\\Models\\User', 12, 'api-token', '8a1e61f48ba8735f650683e915fa635cad232753f1aa3d9dda31bedae285680b', '[\"*\"]', '2025-09-08 04:05:49', NULL, '2025-09-08 04:05:48', '2025-09-08 04:05:49'),
(383, 'App\\Models\\User', 12, 'api-token', '67f2220005952c7414272299aecfbee1bea10a726569307a647521c36dea7886', '[\"*\"]', '2025-09-08 04:15:01', NULL, '2025-09-08 04:08:26', '2025-09-08 04:15:01'),
(384, 'App\\Models\\User', 12, 'api-token', '69ae1c2d72bf80103a2be059e8b99cc23de829426a19fe822f5eb7ac0ffb29ff', '[\"*\"]', '2025-09-08 04:35:43', NULL, '2025-09-08 04:33:00', '2025-09-08 04:35:43'),
(385, 'App\\Models\\User', 12, 'api-token', 'a333dbd5cbd3bed992a8713e46ffe42baaaa1bd45fd31015f815b272aeeb9f2e', '[\"*\"]', '2025-09-08 04:46:37', NULL, '2025-09-08 04:44:27', '2025-09-08 04:46:37'),
(386, 'App\\Models\\User', 12, 'api-token', '383e8ab032d4a9a7efe553f5e0ee487e410870fee6c126b700c36e0b2be40b3a', '[\"*\"]', '2025-09-08 05:21:24', NULL, '2025-09-08 04:53:00', '2025-09-08 05:21:24'),
(387, 'App\\Models\\User', 12, 'api-token', '71b1b2bceebf6ae7c7efc9b34b7a76406b84d90e7d146be917dff3461a892b3c', '[\"*\"]', '2025-09-08 07:31:14', NULL, '2025-09-08 07:29:39', '2025-09-08 07:31:14'),
(388, 'App\\Models\\User', 12, 'api-token', '93ba9c08a1d691d321723eb61ec0cfc4c3f850e062b9824a7d635aefaf2d0658', '[\"*\"]', '2025-09-08 07:34:55', NULL, '2025-09-08 07:34:54', '2025-09-08 07:34:55'),
(389, 'App\\Models\\User', 12, 'api-token', 'f58878d07bd5c5f4da619c5c9892806564114d8f89b7738f6c1eebdf7ff87dc0', '[\"*\"]', '2025-09-08 07:52:28', NULL, '2025-09-08 07:37:51', '2025-09-08 07:52:28'),
(390, 'App\\Models\\User', 12, 'api-token', 'd4246e6d2bd96855917538a37852f0a149de7026662777c21c272bd7e7005d42', '[\"*\"]', '2025-09-08 07:57:57', NULL, '2025-09-08 07:55:18', '2025-09-08 07:57:57'),
(391, 'App\\Models\\User', 12, 'api-token', '70856ab5b5f38868a412e54dd1ae1226d67e54c5d6bd4d9bf46c628a209a8382', '[\"*\"]', '2025-09-08 07:58:56', NULL, '2025-09-08 07:58:51', '2025-09-08 07:58:56'),
(394, 'App\\Models\\User', 12, 'api-token', 'bdb656733338a9ac9ce960c46cf7384dd107e24055f042019caf10ed444abcf8', '[\"*\"]', '2025-09-08 08:15:15', NULL, '2025-09-08 08:14:59', '2025-09-08 08:15:15'),
(395, 'App\\Models\\User', 12, 'api-token', '9448ee143693754a65c934aff8b119d955e00aecc9fe4f27944de577223cb9f8', '[\"*\"]', '2025-09-08 08:19:16', NULL, '2025-09-08 08:18:39', '2025-09-08 08:19:16'),
(396, 'App\\Models\\User', 12, 'api-token', 'd2b1dba9b6d0a36971c242e8ab3d0b0ed538f6d983d361248b18eac1732409d7', '[\"*\"]', '2025-09-08 21:27:39', NULL, '2025-09-08 20:50:09', '2025-09-08 21:27:39'),
(397, 'App\\Models\\User', 12, 'api-token', '5ee3bb7597aeb6725c88c8be5888cb0917e4387ffe8325be12f9ec6df0103b72', '[\"*\"]', '2025-09-08 21:38:12', NULL, '2025-09-08 21:35:31', '2025-09-08 21:38:12'),
(398, 'App\\Models\\User', 12, 'api-token', '675d32d1c311bb6c1df254a60c4823e591120d2cfcd45ac13dbe6dd31bc92132', '[\"*\"]', '2025-09-08 21:43:39', NULL, '2025-09-08 21:39:08', '2025-09-08 21:43:39'),
(399, 'App\\Models\\User', 12, 'api-token', '8971d5383eeec27f01dffcd026c28ebfe9305821056a15402b0c0748125b482c', '[\"*\"]', '2025-09-08 21:46:00', NULL, '2025-09-08 21:43:50', '2025-09-08 21:46:00'),
(400, 'App\\Models\\User', 12, 'api-token', '94949b39055e12c798573c6c3f1db27a7595fd898b5c5eadc418de0112371ca9', '[\"*\"]', '2025-09-08 22:00:35', NULL, '2025-09-08 21:46:11', '2025-09-08 22:00:35'),
(401, 'App\\Models\\User', 95, 'api-token', '56c999ddaa4cc8647b72efa8dd6be71ef453e9d63e77688f6248da89aaa91365', '[\"*\"]', '2025-09-08 22:13:02', NULL, '2025-09-08 22:06:45', '2025-09-08 22:13:02'),
(402, 'App\\Models\\User', 95, 'api-token', '17a75344ec47d053de5d73aea3044544d12873946dcac6774d685e69a4f7aadb', '[\"*\"]', '2025-09-08 22:32:25', NULL, '2025-09-08 22:15:11', '2025-09-08 22:32:25'),
(403, 'App\\Models\\User', 95, 'api-token', 'b5a96f328908469186611afbcf642ccdeff76d83b6de934c284cadd250b5ea81', '[\"*\"]', '2025-09-08 23:01:32', NULL, '2025-09-08 22:34:56', '2025-09-08 23:01:32'),
(404, 'App\\Models\\User', 95, 'api-token', '68780295605ec268ba5a10c15e41dc622b5efd4875f87d82c375edae0e773b58', '[\"*\"]', '2025-09-09 02:04:32', NULL, '2025-09-08 22:41:15', '2025-09-09 02:04:32'),
(405, 'App\\Models\\User', 12, 'api-token', '48c3054677d42ce57b5a86be7cd4065f88ecba8d83594817a5696fed0ce2814a', '[\"*\"]', '2025-09-08 23:02:42', NULL, '2025-09-08 23:02:02', '2025-09-08 23:02:42'),
(407, 'App\\Models\\User', 95, 'api-token', '1623a3ff2e4bcfa633e76d0a611c6d70f639da5277a8541ead856cd782bb56c4', '[\"*\"]', '2025-09-08 23:27:54', NULL, '2025-09-08 23:26:08', '2025-09-08 23:27:54'),
(409, 'App\\Models\\User', 95, 'api-token', '07a0c02b0a1c0f9c1298f651aad8de3a618874a5ae720d6bd49e1512151b3e18', '[\"*\"]', '2025-09-08 23:41:06', NULL, '2025-09-08 23:28:43', '2025-09-08 23:41:06'),
(410, 'App\\Models\\User', 12, 'api-token', 'c43e4cee3b54a4a973d6743690ad29760b42a0d2a0c81c286374f0a073a5c717', '[\"*\"]', '2025-09-09 00:00:42', NULL, '2025-09-08 23:47:00', '2025-09-09 00:00:42'),
(411, 'App\\Models\\User', 12, 'api-token', 'e7709f2c62a10201a1aa05125ffbf5e2d8ff4a9eba0e7a835d3cffb21db4b477', '[\"*\"]', '2025-09-09 00:20:13', NULL, '2025-09-09 00:16:29', '2025-09-09 00:20:13'),
(413, 'App\\Models\\User', 95, 'api-token', 'b10b2ea48697eae478d16a9cb4953cddc3c0a0984dc2898f67db55e8d58ef2b4', '[\"*\"]', '2025-09-10 02:23:01', NULL, '2025-09-09 02:05:08', '2025-09-10 02:23:01'),
(414, 'App\\Models\\User', 95, 'api-token', 'f789da690d17cc9030eed28ea1a0f546e0e81153332b52f4b8a11977910601f4', '[\"*\"]', '2025-09-09 03:05:29', NULL, '2025-09-09 02:05:37', '2025-09-09 03:05:29'),
(415, 'App\\Models\\User', 12, 'api-token', 'ecafaf56cc566888f52a7f5579d514072b9b358964d05ec17df0eadd3993b6da', '[\"*\"]', '2025-09-09 03:24:09', NULL, '2025-09-09 03:23:56', '2025-09-09 03:24:09'),
(416, 'App\\Models\\User', 12, 'api-token', '65abc0fb07cfd6809a0536a5757490ae0380c3c36a274d35954dde898c6e79b7', '[\"*\"]', '2025-09-09 04:16:17', NULL, '2025-09-09 04:16:05', '2025-09-09 04:16:17'),
(417, 'App\\Models\\User', 12, 'api-token', '72b699fce9a3a187567c83c4ba68a70443cb301043f90413783bb486b4a82c64', '[\"*\"]', '2025-09-09 04:21:20', NULL, '2025-09-09 04:21:10', '2025-09-09 04:21:20'),
(418, 'App\\Models\\User', 12, 'api-token', '8b573c0a56ec408c1841de7cb47e4ea3eae931148f58b733a4b04af6a5f22907', '[\"*\"]', '2025-09-09 04:26:07', NULL, '2025-09-09 04:25:54', '2025-09-09 04:26:07'),
(419, 'App\\Models\\User', 12, 'api-token', '23eeca96fdb644a37a14600c3f03325af4975bfa16b544feb88090437e8cab7c', '[\"*\"]', '2025-09-09 04:34:20', NULL, '2025-09-09 04:34:10', '2025-09-09 04:34:20'),
(420, 'App\\Models\\User', 12, 'api-token', '53b1935d93ba5ec50c4d1be44c6e733fb3e5e7b4de31fb7a8d775fac8d512c3f', '[\"*\"]', '2025-09-09 04:37:00', NULL, '2025-09-09 04:36:49', '2025-09-09 04:37:00'),
(421, 'App\\Models\\User', 12, 'api-token', 'b2c7a9960511075b86fd4107c474973dae41f8d72f3bffa40db6f532e24edf1b', '[\"*\"]', '2025-09-09 04:49:48', NULL, '2025-09-09 04:41:04', '2025-09-09 04:49:48'),
(422, 'App\\Models\\User', 12, 'api-token', '1badb6a3f4b8fe27773df24f1d7bede6eb581252ada5570af1dac614727380c1', '[\"*\"]', '2025-09-09 04:50:49', NULL, '2025-09-09 04:50:20', '2025-09-09 04:50:49'),
(423, 'App\\Models\\User', 12, 'api-token', 'db9896e011249fd40b19be9e357a5774f59b47516e3417df84c9487103d29e11', '[\"*\"]', '2025-09-09 04:55:26', NULL, '2025-09-09 04:54:50', '2025-09-09 04:55:26'),
(424, 'App\\Models\\User', 12, 'api-token', '162825f188285dddf5be96a9ad37ca7b9221c5546f5c57173067d8758e298222', '[\"*\"]', '2025-09-09 04:57:43', NULL, '2025-09-09 04:56:29', '2025-09-09 04:57:43'),
(425, 'App\\Models\\User', 12, 'api-token', '8b663580cca99a8c46259ea025c40a7d27383e0c02e6e61217daa96331d72b91', '[\"*\"]', '2025-09-09 05:03:27', NULL, '2025-09-09 04:58:15', '2025-09-09 05:03:27'),
(426, 'App\\Models\\User', 12, 'api-token', '4085e8a924183e1a37d4e72908353232232659faa335372a3e3434cec18e7e79', '[\"*\"]', '2025-09-09 07:38:55', NULL, '2025-09-09 07:32:07', '2025-09-09 07:38:55'),
(427, 'App\\Models\\User', 12, 'api-token', 'f0214d2b07a892e88ec53d2583dfc0c230b3cb27d0388e801314071eb67539dd', '[\"*\"]', '2025-09-09 07:40:11', NULL, '2025-09-09 07:39:43', '2025-09-09 07:40:11'),
(428, 'App\\Models\\User', 12, 'api-token', '126294fca332dff448562678d13811f69ae05d9b1ac01d9b419e30192dc3b775', '[\"*\"]', '2025-09-09 07:43:50', NULL, '2025-09-09 07:43:22', '2025-09-09 07:43:50'),
(429, 'App\\Models\\User', 12, 'api-token', '8760c88677af9196c10ea49cd743f644c83f0d395927f9f8a7d7b310b06c96e0', '[\"*\"]', '2025-09-09 07:45:00', NULL, '2025-09-09 07:44:33', '2025-09-09 07:45:00'),
(430, 'App\\Models\\User', 12, 'api-token', 'f32efd2d28cb0fbb272f0a4af0536a692c8fc6f8a19661d602ca04d00add40ec', '[\"*\"]', '2025-09-09 07:50:22', NULL, '2025-09-09 07:49:46', '2025-09-09 07:50:22'),
(431, 'App\\Models\\User', 12, 'api-token', 'b45f4510e9a3727fffde45cc271d211a24785854df862de9acceaaf356fd063e', '[\"*\"]', '2025-09-09 07:58:35', NULL, '2025-09-09 07:54:56', '2025-09-09 07:58:35'),
(432, 'App\\Models\\User', 12, 'api-token', '1a4e1e236e11576def42dab6cedef28492ac536f7378debc4f2a8a1cb9e6695c', '[\"*\"]', '2025-09-09 08:02:00', NULL, '2025-09-09 08:01:32', '2025-09-09 08:02:00'),
(433, 'App\\Models\\User', 12, 'api-token', 'd967beed0fa4523f5514140009e641a0a17cc318ac641980cfea87ac6fde5bc1', '[\"*\"]', '2025-09-09 08:07:43', NULL, '2025-09-09 08:06:07', '2025-09-09 08:07:43'),
(434, 'App\\Models\\User', 12, 'api-token', '4cce30ccd719ab23a019606ad943bb2ccd13fdcc0b26bda29fc3374364d8e51b', '[\"*\"]', '2025-09-09 08:11:24', NULL, '2025-09-09 08:08:22', '2025-09-09 08:11:24'),
(435, 'App\\Models\\User', 12, 'api-token', '0143dd93eac1cf69287b1e699b05c0a7673c007939c0d3b902a9aa559ac647d3', '[\"*\"]', '2025-09-09 21:17:21', NULL, '2025-09-09 21:16:53', '2025-09-09 21:17:21'),
(436, 'App\\Models\\User', 12, 'api-token', 'cfabc786358bbdea9952d6278f9d06610a1bb2b750b083cf260da548786af9a0', '[\"*\"]', '2025-09-09 21:20:47', NULL, '2025-09-09 21:20:37', '2025-09-09 21:20:47'),
(437, 'App\\Models\\User', 12, 'api-token', '4b63325e17f5958ec55735e2c8dfd2ad13e07be96f8e661e8d333bf678067c6a', '[\"*\"]', '2025-09-09 21:23:16', NULL, '2025-09-09 21:22:49', '2025-09-09 21:23:16'),
(438, 'App\\Models\\User', 12, 'api-token', 'fa85f9c4d312a84eec8561bff20b2ea4072ee53d208103573d138a17f646eaf9', '[\"*\"]', '2025-09-09 21:42:04', NULL, '2025-09-09 21:26:22', '2025-09-09 21:42:04'),
(439, 'App\\Models\\User', 12, 'api-token', '4610797d02ef1c8572f3aed4547859770b98dcf9b30bf564a91c38b70fe40bef', '[\"*\"]', '2025-09-09 21:51:55', NULL, '2025-09-09 21:48:00', '2025-09-09 21:51:55'),
(440, 'App\\Models\\User', 12, 'api-token', 'b57fc4d92dfbd848b50eda05f5414bd9f0032287ea5f8373a2d267d59879be3e', '[\"*\"]', '2025-09-09 22:05:41', NULL, '2025-09-09 21:54:55', '2025-09-09 22:05:41'),
(441, 'App\\Models\\User', 12, 'api-token', 'c0464d8ea3169b8e466bbd1e93519dba1629498cf97de9703c2f3d342cb61b59', '[\"*\"]', '2025-09-09 22:10:54', NULL, '2025-09-09 22:09:25', '2025-09-09 22:10:54'),
(442, 'App\\Models\\User', 12, 'api-token', '19bccb229fc837461a817db3e0cc4ae6b774f51e88cd03d0da503ee646c91a5f', '[\"*\"]', '2025-09-09 22:15:18', NULL, '2025-09-09 22:14:23', '2025-09-09 22:15:18'),
(443, 'App\\Models\\User', 12, 'api-token', 'a35c5ebe5541673cade7587f16454221b195fd73b82062880b26588383bc3787', '[\"*\"]', '2025-09-09 22:28:56', NULL, '2025-09-09 22:20:32', '2025-09-09 22:28:56'),
(444, 'App\\Models\\User', 12, 'api-token', '10ec0f07f5d5f9793b5a96d6fbdaeec05a3b0b39fe6141cdb31e6182fe129e53', '[\"*\"]', '2025-09-09 22:32:06', NULL, '2025-09-09 22:31:27', '2025-09-09 22:32:06'),
(445, 'App\\Models\\User', 12, 'api-token', '93ee88f349cadb98d828ff4465685c5e49cdba98318a79c66d81a1994b8ac641', '[\"*\"]', '2025-09-09 22:35:20', NULL, '2025-09-09 22:34:51', '2025-09-09 22:35:20'),
(446, 'App\\Models\\User', 12, 'api-token', 'c027917fe44ddb75ca760142990f5af5a04d61baa441c3adcf15453ae419e3e5', '[\"*\"]', '2025-09-09 22:39:05', NULL, '2025-09-09 22:38:45', '2025-09-09 22:39:05'),
(447, 'App\\Models\\User', 12, 'api-token', 'a251a5c587b41db4db521cc59b48fab0b47cf84617ec0a02561216472917da06', '[\"*\"]', '2025-09-09 22:41:44', NULL, '2025-09-09 22:41:26', '2025-09-09 22:41:44'),
(448, 'App\\Models\\User', 12, 'api-token', '66384dbff267871cedb8d4615292545e7df3e44fffea74df89bd6d39515061cb', '[\"*\"]', '2025-09-09 22:43:34', NULL, '2025-09-09 22:43:16', '2025-09-09 22:43:34'),
(449, 'App\\Models\\User', 12, 'api-token', 'd380a6fa19bda32a38171cead18895117aba66baa9a00a573e07500c7836d845', '[\"*\"]', '2025-09-09 22:49:07', NULL, '2025-09-09 22:48:51', '2025-09-09 22:49:07'),
(450, 'App\\Models\\User', 12, 'api-token', '9f4ac260849cdd2256d22303f3a02725da33bc161299db4f26e8b823d351edc1', '[\"*\"]', '2025-09-09 23:09:47', NULL, '2025-09-09 22:51:39', '2025-09-09 23:09:47'),
(451, 'App\\Models\\User', 12, 'api-token', 'b29f1fc4ad75bf95761242f045e04b3fc2ccabf51bc03facdf384a2f8e3cc224', '[\"*\"]', '2025-09-09 23:13:08', NULL, '2025-09-09 23:10:01', '2025-09-09 23:13:08'),
(452, 'App\\Models\\User', 12, 'api-token', '0a64bf6594070d062f94c9d990d9ef212f431a7c3f44ef29dc487ff14679ac07', '[\"*\"]', '2025-09-09 23:16:16', NULL, '2025-09-09 23:13:29', '2025-09-09 23:16:16'),
(453, 'App\\Models\\User', 12, 'api-token', '064caadaa24e9e80381b0bc1a8a386cedd983283eb567ba789612f46a6b8f4f9', '[\"*\"]', '2025-09-09 23:25:08', NULL, '2025-09-09 23:17:17', '2025-09-09 23:25:08'),
(454, 'App\\Models\\User', 12, 'api-token', '435c23003a47f896b293e2181a5a88ee8b8afde26810c3580a3f614412aefe20', '[\"*\"]', '2025-09-09 23:29:33', NULL, '2025-09-09 23:25:38', '2025-09-09 23:29:33'),
(455, 'App\\Models\\User', 12, 'api-token', '9540bf478f096ce4e4a478716def33255567b4bb2ba0e8927e7bd0a87d47a0be', '[\"*\"]', '2025-09-09 23:33:18', NULL, '2025-09-09 23:29:53', '2025-09-09 23:33:18'),
(456, 'App\\Models\\User', 12, 'api-token', 'c967ced84a8ee344ed842e3fc4130f3591f4d3758039594b7f0c8aaf4b317178', '[\"*\"]', '2025-09-09 23:38:10', NULL, '2025-09-09 23:33:30', '2025-09-09 23:38:10'),
(457, 'App\\Models\\User', 12, 'api-token', 'dd1a19319f27c94106bb1e484a487c98f69575631ef337cf42569cbc99e070b8', '[\"*\"]', '2025-09-09 23:39:53', NULL, '2025-09-09 23:38:52', '2025-09-09 23:39:53'),
(458, 'App\\Models\\User', 12, 'api-token', 'b6b6bfd33d50d97f804bd299b6b4f79172209f887662c6c3c459808489ab8237', '[\"*\"]', '2025-09-10 00:18:44', NULL, '2025-09-09 23:43:52', '2025-09-10 00:18:44'),
(459, 'App\\Models\\User', 12, 'api-token', '76fd2473edade0c9ae7fbfe878d83f8f1ae30ad4012e596ec2f4e06104ac9114', '[\"*\"]', '2025-09-10 00:20:44', NULL, '2025-09-10 00:20:38', '2025-09-10 00:20:44'),
(460, 'App\\Models\\User', 12, 'api-token', '32cce880493c86e9839c873360b9577c35f8cd2c0c6a586f3d76b81381e8fc94', '[\"*\"]', '2025-09-10 00:29:27', NULL, '2025-09-10 00:23:38', '2025-09-10 00:29:27'),
(461, 'App\\Models\\User', 12, 'api-token', '93857eee37472abdcd1208aae2bce9adf29583a7beeab16fd30c77c0b10ece74', '[\"*\"]', '2025-09-10 00:29:55', NULL, '2025-09-10 00:29:36', '2025-09-10 00:29:55'),
(462, 'App\\Models\\User', 12, 'api-token', 'f32c8a5440eb7ebf78ad35b586bcd9fbebd71f0fcb85f792c42fb19cd4f442ea', '[\"*\"]', '2025-09-10 00:31:37', NULL, '2025-09-10 00:30:54', '2025-09-10 00:31:37'),
(463, 'App\\Models\\User', 12, 'api-token', 'bcf96352df8e73c259164e4131e4aa8d518f4fe51f81f962323822806d738466', '[\"*\"]', '2025-09-10 00:39:10', NULL, '2025-09-10 00:34:43', '2025-09-10 00:39:10'),
(464, 'App\\Models\\User', 12, 'api-token', '9847be5b258bc20e5eec7c995e8a445ebf7bedb86f96abc9cc811429f3d80416', '[\"*\"]', '2025-09-10 00:39:54', NULL, '2025-09-10 00:39:24', '2025-09-10 00:39:54'),
(465, 'App\\Models\\User', 12, 'api-token', '7b3574088c6f2326acf5b5a3236189a7a0fef652d8d255f5552229f9c06bbcff', '[\"*\"]', '2025-09-10 00:47:01', NULL, '2025-09-10 00:44:19', '2025-09-10 00:47:01'),
(466, 'App\\Models\\User', 12, 'api-token', '023790dd427be6d8dc3830cb622ce7ecee288c5764275b1433219544058f7502', '[\"*\"]', '2025-09-10 00:58:10', NULL, '2025-09-10 00:51:04', '2025-09-10 00:58:10'),
(467, 'App\\Models\\User', 12, 'api-token', '01108b427673a9a8c7d787629d91d0b58b31bbb173827ef89eff31cca611079d', '[\"*\"]', '2025-09-10 01:07:24', NULL, '2025-09-10 01:04:43', '2025-09-10 01:07:24'),
(468, 'App\\Models\\User', 12, 'api-token', 'cc7b325faf3ec259342f58fd5c564385ee4577dd0782f46d544dd5f74f5d3093', '[\"*\"]', '2025-09-10 02:04:33', NULL, '2025-09-10 02:01:37', '2025-09-10 02:04:33'),
(469, 'App\\Models\\User', 12, 'api-token', '105d02d784029e6d90a1e4ab700c2d3b5f63817ce6e4b3a10a43b8f1f90e1345', '[\"*\"]', '2025-09-10 02:22:46', NULL, '2025-09-10 02:08:17', '2025-09-10 02:22:46'),
(470, 'App\\Models\\User', 12, 'api-token', '31fa340e50c8bf7f264817a996024f3880a32a1aa8f17bcf41635f83c758787d', '[\"*\"]', '2025-09-10 23:00:26', NULL, '2025-09-10 02:23:41', '2025-09-10 23:00:26'),
(471, 'App\\Models\\User', 12, 'api-token', '387535587a0772584a01960cf6fcb6375d7b7b4e01b481909bd30cc00355e818', '[\"*\"]', '2025-09-10 03:25:25', NULL, '2025-09-10 02:29:04', '2025-09-10 03:25:25'),
(472, 'App\\Models\\User', 12, 'api-token', 'ab28eacef50e816688b247548296a5d8e6056c41867239569e1c6a4386bb72f0', '[\"*\"]', '2025-09-10 03:30:02', NULL, '2025-09-10 03:26:40', '2025-09-10 03:30:02'),
(473, 'App\\Models\\User', 12, 'api-token', 'd076406712c4044264707543dbc0fb85b5346253b57b21d35e954fcf30ef40a9', '[\"*\"]', '2025-09-10 04:00:39', NULL, '2025-09-10 03:34:13', '2025-09-10 04:00:39'),
(474, 'App\\Models\\User', 12, 'api-token', 'c3e080b4b4aa18717d0b82a463b5d81527fc917d67125737dd2fa45cc9a96811', '[\"*\"]', '2025-09-10 03:38:19', NULL, '2025-09-10 03:37:19', '2025-09-10 03:38:19'),
(475, 'App\\Models\\User', 12, 'api-token', 'fc4e8dc5493c120145a381f028453beb385614500e617b647359d87328ca734a', '[\"*\"]', '2025-09-10 03:47:15', NULL, '2025-09-10 03:41:13', '2025-09-10 03:47:15'),
(476, 'App\\Models\\User', 12, 'api-token', '8dcad24c776cad57f301a72dfcc012d598d4584e178c723cdf0d8cbb3334b378', '[\"*\"]', '2025-09-10 04:07:47', NULL, '2025-09-10 04:02:20', '2025-09-10 04:07:47'),
(477, 'App\\Models\\User', 12, 'api-token', '1a6acaf9c7718c9ccaa9dfb894fb0ac1958a44d106f51627b34d740106e4d31f', '[\"*\"]', '2025-09-10 04:22:05', NULL, '2025-09-10 04:19:58', '2025-09-10 04:22:05'),
(478, 'App\\Models\\User', 12, 'api-token', 'edc7318bd373b4e5a85811cd98c1b7006a4317c77e1cb6b886f350b9ad8d22a3', '[\"*\"]', '2025-09-10 04:39:47', NULL, '2025-09-10 04:28:45', '2025-09-10 04:39:47'),
(479, 'App\\Models\\User', 12, 'api-token', '8f4ca5132d5a08b5a0c268545774d9935fd6c1672d2db3b4d4c547aaf62e5313', '[\"*\"]', '2025-09-10 04:58:25', NULL, '2025-09-10 04:42:46', '2025-09-10 04:58:25'),
(480, 'App\\Models\\User', 12, 'api-token', '9de922f829d2bb2b00f024329951ec175debc5c5cf217f7c64135715c026abb7', '[\"*\"]', '2025-09-10 05:17:42', NULL, '2025-09-10 05:00:29', '2025-09-10 05:17:42'),
(481, 'App\\Models\\User', 12, 'api-token', '68b92e8bd45da1fee0b4adbc81b3a85883624d093c7c30bc5244001d76c21bcf', '[\"*\"]', '2025-09-10 07:54:16', NULL, '2025-09-10 07:52:53', '2025-09-10 07:54:16'),
(482, 'App\\Models\\User', 12, 'api-token', 'f1ee61de61b86ee3c96787a93f53afa96fafff31c15f7e3628fc791c238e794d', '[\"*\"]', '2025-09-10 07:57:21', NULL, '2025-09-10 07:56:16', '2025-09-10 07:57:21'),
(483, 'App\\Models\\User', 12, 'api-token', 'a56e88edb093fdaf44a54c435d9712b755da7fa6109f2646207194393136ed86', '[\"*\"]', '2025-09-10 08:08:14', NULL, '2025-09-10 08:00:00', '2025-09-10 08:08:14'),
(484, 'App\\Models\\User', 12, 'api-token', '9a65b113425d867509a835e054371fa4bbd2318fd820d4400ed5dbb971580720', '[\"*\"]', '2025-09-10 08:10:01', NULL, '2025-09-10 08:08:39', '2025-09-10 08:10:01'),
(485, 'App\\Models\\User', 12, 'api-token', '2cb22d901df0b1f52066dbddaccee1aec2e0baacfb65d68a5f38e189fba6c63a', '[\"*\"]', '2025-09-10 08:11:18', NULL, '2025-09-10 08:10:21', '2025-09-10 08:11:18'),
(486, 'App\\Models\\User', 12, 'api-token', '7babd6312e0432f41e82af524931430fc0362d56f0c82e198b7177ed30293580', '[\"*\"]', '2025-09-10 08:20:35', NULL, '2025-09-10 08:19:00', '2025-09-10 08:20:35'),
(487, 'App\\Models\\User', 12, 'api-token', '73e88572e76290590d7270ff5447392fcabd4b5bfc64047bde67835e6e25a5df', '[\"*\"]', '2025-09-10 08:23:39', NULL, '2025-09-10 08:21:23', '2025-09-10 08:23:39'),
(488, 'App\\Models\\User', 12, 'api-token', 'ea8c56ebc19e07c0d389763c32800f67cb52ca08d7dad16ae80a69982b69b3a1', '[\"*\"]', '2025-09-10 08:27:16', NULL, '2025-09-10 08:26:24', '2025-09-10 08:27:16'),
(489, 'App\\Models\\User', 12, 'api-token', '6ac1091bb271d26b2777088eb821a44224788f46d5cad2e96405f97905da58dc', '[\"*\"]', '2025-09-10 08:30:08', NULL, '2025-09-10 08:29:39', '2025-09-10 08:30:08'),
(490, 'App\\Models\\User', 12, 'api-token', '1e99801971213068dffd4ad8bcdfdac7070d872ac51d8c5cbc1527a5800d0954', '[\"*\"]', '2025-09-10 08:31:39', NULL, '2025-09-10 08:30:54', '2025-09-10 08:31:39'),
(491, 'App\\Models\\User', 12, 'api-token', '7f93fe00136bcd5652ab2f44a5da7b62e8a64cbbf52b5a64e184b93180ea4a2f', '[\"*\"]', '2025-09-10 08:44:57', NULL, '2025-09-10 08:39:15', '2025-09-10 08:44:57'),
(492, 'App\\Models\\User', 12, 'api-token', '818d5d6a866f9349dc92465320b197227b9a8602180874d8c618011022015e56', '[\"*\"]', '2025-09-10 08:56:32', NULL, '2025-09-10 08:55:29', '2025-09-10 08:56:32'),
(493, 'App\\Models\\User', 12, 'api-token', 'f7af511ca2a00bd3d86d2df418486c55b37db296be70d2961b7aacd11b67c5e7', '[\"*\"]', '2025-09-10 09:04:37', NULL, '2025-09-10 09:03:53', '2025-09-10 09:04:37'),
(494, 'App\\Models\\User', 12, 'api-token', '12a061dc044e137bb544afff593a828aafee5941f7f69a6fb4ff2f7fcb87dd51', '[\"*\"]', '2025-09-10 09:07:01', NULL, '2025-09-10 09:06:36', '2025-09-10 09:07:01'),
(495, 'App\\Models\\User', 12, 'api-token', 'f4bb16122c3e1001c9d34f0c4b4dbf35f26cfad7b5f1ced220d4f4734b1738cb', '[\"*\"]', '2025-09-10 09:11:18', NULL, '2025-09-10 09:09:18', '2025-09-10 09:11:18'),
(496, 'App\\Models\\User', 96, 'api-token', '4ec5a09c0fb9abeb717acdf8d2d267762107bbb847b68a309c6a3c5d06545d80', '[\"*\"]', '2025-09-10 21:25:36', NULL, '2025-09-10 20:54:35', '2025-09-10 21:25:36'),
(497, 'App\\Models\\User', 12, 'api-token', 'd36ecf41b494e34c533299e26483639b932e2b32322994f29fae3786750f48bb', '[\"*\"]', '2025-09-10 21:38:29', NULL, '2025-09-10 21:26:48', '2025-09-10 21:38:29'),
(498, 'App\\Models\\User', 12, 'api-token', 'a0131997da27ce6985f772174933273e89d60a8ca2ff4bd111b3ccf9eb4f0c53', '[\"*\"]', '2025-09-10 22:50:19', NULL, '2025-09-10 22:25:38', '2025-09-10 22:50:19'),
(499, 'App\\Models\\User', 12, 'api-token', '602474ab4d7b74b978b32360fd3e06278e6870da39f4b3d847db5198bc1cdc1b', '[\"*\"]', '2025-09-10 23:37:04', NULL, '2025-09-10 23:07:05', '2025-09-10 23:37:04'),
(500, 'App\\Models\\User', 12, 'api-token', '70561182b6f08bbb8d6bfa92e0eafc2a02c3ba821b47efdeb89ddc92f0467551', '[\"*\"]', '2025-09-11 00:08:41', NULL, '2025-09-10 23:51:51', '2025-09-11 00:08:41'),
(501, 'App\\Models\\User', 12, 'api-token', '73be6f96a52c392ac21c4b40a4f43fd9a810cc64ce251e2456d803812765d867', '[\"*\"]', '2025-09-11 00:05:14', NULL, '2025-09-10 23:51:56', '2025-09-11 00:05:14'),
(502, 'App\\Models\\User', 12, 'api-token', 'de58d49ab7fef4a52e2b4c063bc9b37516f9d410bdbd0b61e0cbd2b99c81832f', '[\"*\"]', '2025-09-11 00:31:19', NULL, '2025-09-11 00:06:03', '2025-09-11 00:31:19'),
(503, 'App\\Models\\User', 12, 'api-token', 'de16202028423392b6e0c5dd6be9a6f321dbbb09c97509a7c93e0395542b9efc', '[\"*\"]', '2025-09-11 00:14:10', NULL, '2025-09-11 00:12:36', '2025-09-11 00:14:10'),
(504, 'App\\Models\\User', 12, 'api-token', '610324604798e4095f5bd0163a97a134f4c04da34acaba7b0876155bf3ec1a0a', '[\"*\"]', '2025-09-13 23:53:41', NULL, '2025-09-11 00:14:14', '2025-09-13 23:53:41'),
(505, 'App\\Models\\User', 12, 'api-token', 'c7eddcaaf167445a2a7105ce554e150754bd4c21562dcaf9017c99d74669904b', '[\"*\"]', '2025-09-11 00:48:50', NULL, '2025-09-11 00:33:27', '2025-09-11 00:48:50'),
(506, 'App\\Models\\User', 12, 'api-token', '412ade94f9b5aa82f269e5131bcf42ecac23761e7780689175698093929df6f6', '[\"*\"]', '2025-09-11 00:59:01', NULL, '2025-09-11 00:58:18', '2025-09-11 00:59:01'),
(507, 'App\\Models\\User', 12, 'api-token', 'f46879b2027b35ccfd7cfd1fc841b08a6b519cb9626eeb6c0105b960b4449e4b', '[\"*\"]', '2025-09-11 01:01:39', NULL, '2025-09-11 01:00:49', '2025-09-11 01:01:39'),
(508, 'App\\Models\\User', 12, 'api-token', '2f3e075ab9b40cf877f2e485ce027682d4f009e284802a7bca15eb1504dde64e', '[\"*\"]', '2025-09-11 02:27:59', NULL, '2025-09-11 01:04:36', '2025-09-11 02:27:59'),
(509, 'App\\Models\\User', 12, 'api-token', '93260ff357a5eafc8aef4235420d6147a3b626193d8dea567caa8b351361b969', '[\"*\"]', '2025-09-11 02:31:44', NULL, '2025-09-11 02:30:17', '2025-09-11 02:31:44'),
(510, 'App\\Models\\User', 12, 'api-token', '56845b4ec167b25305344d8e2bfeb7adb2378029b19ee864eeb3437ba5391bd2', '[\"*\"]', '2025-09-11 02:40:11', NULL, '2025-09-11 02:32:19', '2025-09-11 02:40:11'),
(511, 'App\\Models\\User', 12, 'api-token', 'aae48f2cf41fbc2fbda3609143253e6a4caae9acd87b658e28c39b4594df5991', '[\"*\"]', '2025-09-11 02:48:57', NULL, '2025-09-11 02:46:02', '2025-09-11 02:48:57'),
(512, 'App\\Models\\User', 12, 'api-token', '2f745e0a87de851be435a1c0e6ca86f336369a81d63fb06f56052bbb6ccaf5af', '[\"*\"]', '2025-09-11 02:50:01', NULL, '2025-09-11 02:49:45', '2025-09-11 02:50:01'),
(513, 'App\\Models\\User', 12, 'api-token', 'fe85341de75ad22e9aea2240c25abf77be651b08c07e6c8929fa55afa06293b4', '[\"*\"]', '2025-09-11 03:07:35', NULL, '2025-09-11 02:59:30', '2025-09-11 03:07:35'),
(514, 'App\\Models\\User', 12, 'api-token', 'f575e32fc94de9617142e3b5f26eb5c1d97f2f88d7311bb4d853414e86dd00ca', '[\"*\"]', '2025-09-11 03:15:25', NULL, '2025-09-11 03:11:53', '2025-09-11 03:15:25'),
(515, 'App\\Models\\User', 12, 'api-token', '39efb4981ce5eb1e5375f3c9fd5387eda3216f29c53eccf0276c2bdb7a6bff5d', '[\"*\"]', '2025-09-11 03:38:21', NULL, '2025-09-11 03:16:43', '2025-09-11 03:38:21'),
(516, 'App\\Models\\User', 12, 'api-token', '151aaea29c156e685021caa6ccc936d070a46892a2771f1a01905420f0805b03', '[\"*\"]', '2025-09-11 03:42:20', NULL, '2025-09-11 03:38:34', '2025-09-11 03:42:20'),
(517, 'App\\Models\\User', 12, 'api-token', 'd4dcd30db25afd125bae59e19e7781385fc491f8e02583f7581e14141a441ba1', '[\"*\"]', '2025-09-11 04:50:58', NULL, '2025-09-11 03:43:14', '2025-09-11 04:50:58'),
(518, 'App\\Models\\User', 12, 'api-token', 'c73446f340cdd16dbe00fceba0419e003278a1e3a278bc76f98658355aebb87d', '[\"*\"]', '2025-09-11 05:22:08', NULL, '2025-09-11 04:51:15', '2025-09-11 05:22:08'),
(519, 'App\\Models\\User', 12, 'api-token', 'f910679862cb2eb93b8bbafee55f4af27679a39f78277399d83ab034fff26111', '[\"*\"]', '2025-09-12 21:21:49', NULL, '2025-09-12 20:50:03', '2025-09-12 21:21:49'),
(520, 'App\\Models\\User', 97, 'api-token', '0124764c91338e5a4d0a6a712eff1016125c4228e6f6ceac977cf80d7452135a', '[\"*\"]', '2025-09-12 21:41:38', NULL, '2025-09-12 21:24:11', '2025-09-12 21:41:38'),
(521, 'App\\Models\\User', 98, 'api-token', 'f73e13b5ae7afbe87ed8cf80df56b8153bfad91af2535419c49dc3178c0078ed', '[\"*\"]', '2025-09-12 21:50:53', NULL, '2025-09-12 21:43:03', '2025-09-12 21:50:53'),
(522, 'App\\Models\\User', 98, 'api-token', 'b7ad2a7ef65100a4d65fb255e1e9f0f57b72f9b51bf452f2af3aa02ccfa37d5f', '[\"*\"]', '2025-09-12 21:52:33', NULL, '2025-09-12 21:51:43', '2025-09-12 21:52:33'),
(523, 'App\\Models\\User', 98, 'api-token', 'e052d90823287080e6dfcb7831ffa4ba63ce98bb1e29ceb5f7f64c51a69b17b2', '[\"*\"]', '2025-09-12 21:54:38', NULL, '2025-09-12 21:54:35', '2025-09-12 21:54:38'),
(524, 'App\\Models\\User', 98, 'api-token', 'e1ba9fccda7addc5755d60e10e060df81529610c19ba3fdd55ec4a6010828215', '[\"*\"]', '2025-09-12 22:23:21', NULL, '2025-09-12 22:14:27', '2025-09-12 22:23:21'),
(525, 'App\\Models\\User', 98, 'api-token', '79ad5fbfb73240a71bd4895eb24369c8c19c2264c58210cdf6607434f62345ea', '[\"*\"]', '2025-09-12 22:32:45', NULL, '2025-09-12 22:28:30', '2025-09-12 22:32:45'),
(526, 'App\\Models\\User', 98, 'api-token', '34e26d2e363af3033639adcffbcf11ce526d462ff6691d3f5937ccd4b23c1599', '[\"*\"]', '2025-09-12 22:39:45', NULL, '2025-09-12 22:39:44', '2025-09-12 22:39:45'),
(527, 'App\\Models\\User', 12, 'api-token', '73e87a2bd0115be58bda95776203f2c5b4acba0c7f65635c8d826bcc650c73f0', '[\"*\"]', '2025-09-12 23:10:48', NULL, '2025-09-12 22:59:40', '2025-09-12 23:10:48'),
(528, 'App\\Models\\User', 12, 'api-token', 'ee72b5bfda24afedcd5c7f2ef1897d43eda12708cf57d5080bbd271a4c890337', '[\"*\"]', '2025-09-12 23:21:52', NULL, '2025-09-12 23:21:51', '2025-09-12 23:21:52'),
(529, 'App\\Models\\User', 12, 'api-token', '8bc593600c21f4f640d7982d814269684c28251649a9c3eccf6ec06063d22bd2', '[\"*\"]', '2025-09-12 23:26:42', NULL, '2025-09-12 23:26:41', '2025-09-12 23:26:42'),
(530, 'App\\Models\\User', 12, 'api-token', 'a78f46e093efec1226f9b61846951f49be44e8e56b6893fecdb98af283a852a2', '[\"*\"]', '2025-09-12 23:28:28', NULL, '2025-09-12 23:28:27', '2025-09-12 23:28:28'),
(531, 'App\\Models\\User', 12, 'api-token', 'bf4020e81dad4a6eb464c966fe9d5da1fa686d7d0986f7c959eae4752978282f', '[\"*\"]', '2025-09-12 23:35:33', NULL, '2025-09-12 23:35:32', '2025-09-12 23:35:33'),
(532, 'App\\Models\\User', 12, 'api-token', 'ea84c2de49a1a563d949d68f83fcd2742d3ccdccaa558fba202a397fb44b499b', '[\"*\"]', '2025-09-13 00:05:07', NULL, '2025-09-13 00:05:06', '2025-09-13 00:05:07'),
(533, 'App\\Models\\User', 12, 'api-token', '130f21c013d21c8d32f0766c0d99ff11b78206ebe63b2f5ef8fa8b51aff7e0ea', '[\"*\"]', '2025-09-13 00:44:27', NULL, '2025-09-13 00:44:26', '2025-09-13 00:44:27'),
(534, 'App\\Models\\User', 12, 'api-token', '1bc9eefe91864149256e6a681d7a049774cc625817bb506fe0b8ff18d2659711', '[\"*\"]', '2025-09-13 01:02:27', NULL, '2025-09-13 00:57:34', '2025-09-13 01:02:27'),
(535, 'App\\Models\\User', 12, 'api-token', 'b427003ad21fd4461d72faab406e19e4d4fadff8ea7b6f9ca0ccb002168970fa', '[\"*\"]', '2025-09-13 01:08:26', NULL, '2025-09-13 01:08:25', '2025-09-13 01:08:26'),
(536, 'App\\Models\\User', 12, 'api-token', '970e38faf4d10b8717248d93a2397b50dbd7c311700351999415c14fa6bc9867', '[\"*\"]', '2025-09-13 01:19:11', NULL, '2025-09-13 01:19:10', '2025-09-13 01:19:11'),
(537, 'App\\Models\\User', 12, 'api-token', '8be06e401df5a4e65f318c388e92f3cfc4ec25fe636513809dad8f82c9ec87fd', '[\"*\"]', '2025-09-13 01:35:38', NULL, '2025-09-13 01:35:37', '2025-09-13 01:35:38'),
(538, 'App\\Models\\User', 12, 'api-token', 'eaa491a85df19130d793e88a6a1cce84848a6397ebfac67ad9b6423b0f600c5f', '[\"*\"]', '2025-09-13 01:40:33', NULL, '2025-09-13 01:40:32', '2025-09-13 01:40:33'),
(539, 'App\\Models\\User', 12, 'api-token', '6af785168527ce91303ac5983a496e7c9e523dbf23a415845522b09f4a1f57ae', '[\"*\"]', '2025-09-13 02:09:38', NULL, '2025-09-13 01:43:51', '2025-09-13 02:09:38'),
(540, 'App\\Models\\User', 12, 'api-token', '30e161720cebad4ea252bf65ca52a16f30e09d954d8cde6c66ff24d2f5fc72b0', '[\"*\"]', '2025-09-13 02:16:59', NULL, '2025-09-13 02:16:58', '2025-09-13 02:16:59'),
(541, 'App\\Models\\User', 12, 'api-token', 'a4f4228e16fb4351dc6401dda6e76068050ae8b792bdbc9d4d8385e9e64c0af1', '[\"*\"]', '2025-09-13 02:19:19', NULL, '2025-09-13 02:19:18', '2025-09-13 02:19:19'),
(542, 'App\\Models\\User', 12, 'api-token', '9d119183ee1d852bde26b3c5ff2fe78a6a090986d0df0ffa005ec341d29a01a7', '[\"*\"]', '2025-09-13 02:24:33', NULL, '2025-09-13 02:24:31', '2025-09-13 02:24:33');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(543, 'App\\Models\\User', 12, 'api-token', '0b497868c6d5a18f9ae18d640fab52309205713f20a02432e029d78adfa747bd', '[\"*\"]', '2025-09-13 02:31:27', NULL, '2025-09-13 02:31:26', '2025-09-13 02:31:27'),
(544, 'App\\Models\\User', 12, 'api-token', '833a4bd2f36a3e186bbd33a93dfa4a641f974893388407fb06e861db630708dc', '[\"*\"]', '2025-09-13 02:34:25', NULL, '2025-09-13 02:34:24', '2025-09-13 02:34:25'),
(545, 'App\\Models\\User', 12, 'api-token', '9c0fce3c9ebe37206c410b6d9726c6c382f64d19870fa43064674f20cc1ecebf', '[\"*\"]', '2025-09-13 02:44:38', NULL, '2025-09-13 02:44:37', '2025-09-13 02:44:38'),
(546, 'App\\Models\\User', 12, 'api-token', '803f6d61e25192dadf63fc6e18ab6f19ddeff5884294e25a0d53a9700b912d7f', '[\"*\"]', '2025-09-13 03:05:25', NULL, '2025-09-13 03:05:23', '2025-09-13 03:05:25'),
(547, 'App\\Models\\User', 12, 'api-token', 'a968ab6c218638c19aa3561c328762dbcd20dd9706dcd2196c9777b5faa17f3a', '[\"*\"]', '2025-09-13 03:18:35', NULL, '2025-09-13 03:18:33', '2025-09-13 03:18:35'),
(548, 'App\\Models\\User', 12, 'api-token', 'acabfadb757e17d0bf1c50b6fec773714624416705e69edf18646eb88319900e', '[\"*\"]', '2025-09-13 03:26:17', NULL, '2025-09-13 03:26:16', '2025-09-13 03:26:17'),
(549, 'App\\Models\\User', 12, 'api-token', '0396ca0942f0c375b71525b5f3d69d701388768316de334f8b10ecd9b37aeef5', '[\"*\"]', '2025-09-13 03:32:10', NULL, '2025-09-13 03:32:09', '2025-09-13 03:32:10'),
(550, 'App\\Models\\User', 12, 'api-token', '1f0bea9a039f80983994de5ece309cae5bc23abb6bb5608b39889ef2af48cc9c', '[\"*\"]', '2025-09-13 03:52:17', NULL, '2025-09-13 03:52:16', '2025-09-13 03:52:17'),
(551, 'App\\Models\\User', 12, 'api-token', '91aa56bed2627ecb6c80875d09df26999d4f14a34b4b1af627e4a0d2c8f59b76', '[\"*\"]', '2025-09-13 04:02:43', NULL, '2025-09-13 04:02:42', '2025-09-13 04:02:43'),
(552, 'App\\Models\\User', 12, 'api-token', '7c3ddf15a0d673c4ef5df50ae6714d5b8a2787e73ce3498e05fd3561d0b03f37', '[\"*\"]', '2025-09-13 04:07:22', NULL, '2025-09-13 04:07:21', '2025-09-13 04:07:22'),
(553, 'App\\Models\\User', 12, 'api-token', '92c51f49604db863c6033f45eda6af5180f324b3bd6a6479918e914ce60176bb', '[\"*\"]', '2025-09-13 04:25:39', NULL, '2025-09-13 04:12:46', '2025-09-13 04:25:39'),
(554, 'App\\Models\\User', 12, 'api-token', '0c2d37b581e249c7c2458b5f50ff86d369487b3a3013b2054e9ad790959714b7', '[\"*\"]', '2025-09-13 04:27:02', NULL, '2025-09-13 04:26:29', '2025-09-13 04:27:02'),
(555, 'App\\Models\\User', 12, 'api-token', '6a705f039d64c035152b7bd865f2b1fd025c0ec85acceb4a44277a88ea574722', '[\"*\"]', '2025-09-13 04:31:19', NULL, '2025-09-13 04:31:18', '2025-09-13 04:31:19'),
(556, 'App\\Models\\User', 12, 'api-token', 'a7a8138aedbb1d79a4627b2fec381e1dbbefb9e102a1136d4aadadd77db82679', '[\"*\"]', '2025-09-13 04:36:24', NULL, '2025-09-13 04:36:23', '2025-09-13 04:36:24'),
(557, 'App\\Models\\User', 12, 'api-token', '7c45975fe780e2348fc379aef02564eacb188322cdac91452ac674ea08d2a707', '[\"*\"]', '2025-09-13 04:46:34', NULL, '2025-09-13 04:46:33', '2025-09-13 04:46:34'),
(558, 'App\\Models\\User', 12, 'api-token', 'db44519e8263a5bfd07a1ca883e30a44fe8ba69e1da56d2006fb3b453a728934', '[\"*\"]', '2025-09-13 04:50:03', NULL, '2025-09-13 04:50:01', '2025-09-13 04:50:03'),
(559, 'App\\Models\\User', 12, 'api-token', '5bb7fbf9effd62a4b87ae16967a89a1d0af493827edd16d24a62a9fe08a05914', '[\"*\"]', '2025-09-13 05:05:25', NULL, '2025-09-13 04:50:31', '2025-09-13 05:05:25'),
(560, 'App\\Models\\User', 99, 'api-token', '3fe08914451ff3102cd28dfcbdb2435f79a2f6f58e926e6e793e436368891189', '[\"*\"]', '2025-09-13 05:21:18', NULL, '2025-09-13 05:16:16', '2025-09-13 05:21:18'),
(561, 'App\\Models\\User', 12, 'api-token', 'c20405ef53158008ef1d8ec8ba17cbc3e38bddca15ac62ad80479bc60dcbef65', '[\"*\"]', '2025-09-13 08:45:55', NULL, '2025-09-13 08:45:54', '2025-09-13 08:45:55'),
(562, 'App\\Models\\User', 12, 'api-token', 'aa6950b83f49438aced4503e290b64290da77446818354fb24715cbfd0da60b8', '[\"*\"]', '2025-09-13 08:59:31', NULL, '2025-09-13 08:55:25', '2025-09-13 08:59:31'),
(563, 'App\\Models\\User', 12, 'api-token', '7b82aadfb6eabb2fd0f9d743022ca9c9662bf8a7d1130c09249695b42ed33bad', '[\"*\"]', '2025-09-13 09:11:00', NULL, '2025-09-13 09:00:54', '2025-09-13 09:11:00'),
(564, 'App\\Models\\User', 12, 'api-token', 'df78cc391098feab34d05168da34c0fb97027b6b7735934e98215de5989b31a6', '[\"*\"]', '2025-09-13 09:14:54', NULL, '2025-09-13 09:12:02', '2025-09-13 09:14:54'),
(565, 'App\\Models\\User', 12, 'api-token', '6c65c297acab15558c6552beb113f2aa7298f2d44e9d8f594a22250eeb93209b', '[\"*\"]', '2025-09-13 09:41:40', NULL, '2025-09-13 09:40:17', '2025-09-13 09:41:40'),
(566, 'App\\Models\\User', 12, 'api-token', '69e116462b8e87e8a96fcc7b1745f4a4accf4ee1482a4f3fbacd912897cf7799', '[\"*\"]', '2025-09-13 20:46:37', NULL, '2025-09-13 20:46:23', '2025-09-13 20:46:37'),
(567, 'App\\Models\\User', 12, 'api-token', 'e50eb7c32b2e6d7c0884994b5dbeaa9fe29e3801638377553d8087f9f368aa5e', '[\"*\"]', '2025-09-13 21:26:45', NULL, '2025-09-13 20:48:43', '2025-09-13 21:26:45'),
(568, 'App\\Models\\User', 12, 'api-token', '26bd9d4d92bb7884d09700e284df5f3cd71acac20dd70bd29387fff887d16867', '[\"*\"]', '2025-09-13 21:27:24', NULL, '2025-09-13 21:27:22', '2025-09-13 21:27:24'),
(569, 'App\\Models\\User', 12, 'api-token', '69561d501024aa72fe63d66700d67f61e557a37f18f9e2fa5432f8f9ffa27e31', '[\"*\"]', NULL, NULL, '2025-09-13 21:30:02', '2025-09-13 21:30:02'),
(570, 'App\\Models\\User', 12, 'api-token', '2c80f9e57dfe82a836938bbfcf420fad8c8ea87c2eb666c2769d4072a47836e0', '[\"*\"]', '2025-09-13 21:32:13', NULL, '2025-09-13 21:30:04', '2025-09-13 21:32:13'),
(571, 'App\\Models\\User', 12, 'api-token', '5357442157e892afb69df2154b7d037df303dc70e8104486676cc0f05764e941', '[\"*\"]', '2025-09-13 21:38:57', NULL, '2025-09-13 21:37:10', '2025-09-13 21:38:57'),
(572, 'App\\Models\\User', 12, 'api-token', '2f0ae9adca00938043d0f370c346d0718af01c7d95434ca1b45bd1c311cf0a0e', '[\"*\"]', '2025-09-13 21:49:29', NULL, '2025-09-13 21:39:15', '2025-09-13 21:49:29'),
(573, 'App\\Models\\User', 12, 'api-token', '9c7d53c8bb51ac064892ebaa53982342f9fdf6da44bcb12ae673269b330f48b0', '[\"*\"]', '2025-09-13 21:55:17', NULL, '2025-09-13 21:49:57', '2025-09-13 21:55:17'),
(574, 'App\\Models\\User', 12, 'api-token', '77fc92650259760f114eaf9870435a60615ca1633f8901620288d5a5d9a23689', '[\"*\"]', '2025-09-13 22:30:36', NULL, '2025-09-13 22:30:14', '2025-09-13 22:30:36'),
(575, 'App\\Models\\User', 12, 'api-token', '141f76da789eea31872b8c2c414cd5aca2f097f92faf39a67ddbe48aa6d29e7b', '[\"*\"]', '2025-09-13 22:41:22', NULL, '2025-09-13 22:37:27', '2025-09-13 22:41:22'),
(576, 'App\\Models\\User', 12, 'api-token', '2378c087865896c211e11f496790c9a5068022d7f8d4faf015e969e7d65d22c6', '[\"*\"]', '2025-09-13 22:42:04', NULL, '2025-09-13 22:42:03', '2025-09-13 22:42:04'),
(577, 'App\\Models\\User', 12, 'api-token', '053b6507653b9fc967c0374a50694a7737d42c59c17082b1ae4622b471b9f9a5', '[\"*\"]', '2025-09-13 22:49:30', NULL, '2025-09-13 22:46:06', '2025-09-13 22:49:30'),
(578, 'App\\Models\\User', 12, 'api-token', 'acf839a74b8f2dbcdd6440aadf1a1163217bd3b883e9e94a078d85ca9c91a54d', '[\"*\"]', '2025-09-13 22:51:45', NULL, '2025-09-13 22:51:12', '2025-09-13 22:51:45'),
(579, 'App\\Models\\User', 12, 'api-token', '38f4b231df6f840192900e80fca59401cb9eecd1e9f574d2546f687b41c956ee', '[\"*\"]', '2025-09-13 22:53:42', NULL, '2025-09-13 22:53:35', '2025-09-13 22:53:42'),
(580, 'App\\Models\\User', 12, 'api-token', '1e4c33b888b63427404cc06f655c157bc2ca1b22fc6eea6104eb4a5b9ef55914', '[\"*\"]', '2025-09-13 23:10:08', NULL, '2025-09-13 22:56:44', '2025-09-13 23:10:08'),
(581, 'App\\Models\\User', 12, 'api-token', '442eea7b4f55f46492911bf4c095bc698f0afbf13c85dc323558931503a529bb', '[\"*\"]', '2025-09-13 23:14:09', NULL, '2025-09-13 23:13:54', '2025-09-13 23:14:09'),
(582, 'App\\Models\\User', 12, 'api-token', '628dfe4ec0d88fe44aa12ec2859e75d81906ae84f60ca7e0077384a8e0064bf6', '[\"*\"]', '2025-09-13 23:21:35', NULL, '2025-09-13 23:16:55', '2025-09-13 23:21:35'),
(583, 'App\\Models\\User', 12, 'api-token', 'c8426866f161cf6215fdb04d7eae41ebb96133e0ae2850da573725235dfadfae', '[\"*\"]', '2025-09-13 23:25:29', NULL, '2025-09-13 23:22:08', '2025-09-13 23:25:29'),
(584, 'App\\Models\\User', 12, 'api-token', '365888a71543a4b3bad627db05765a6b340c94cf237dcd6ba9404b0c30fb7bc4', '[\"*\"]', '2025-09-13 23:28:54', NULL, '2025-09-13 23:28:53', '2025-09-13 23:28:54'),
(585, 'App\\Models\\User', 12, 'api-token', '6368287f00af4f320aa570da560d82cece7490195e59a51b8c908486dbb68fd7', '[\"*\"]', '2025-09-13 23:33:55', NULL, '2025-09-13 23:33:54', '2025-09-13 23:33:55'),
(586, 'App\\Models\\User', 12, 'api-token', '98db22f394fc79f186c05d322de142a831bafc5a51a270dbbe36355d52cb4f23', '[\"*\"]', '2025-09-13 23:36:44', NULL, '2025-09-13 23:36:40', '2025-09-13 23:36:44'),
(587, 'App\\Models\\User', 12, 'api-token', '21b841c952c68f2d5d74a83ac2ef77853dc7a83f541a15667d5759116b070aff', '[\"*\"]', '2025-09-14 00:11:55', NULL, '2025-09-13 23:50:33', '2025-09-14 00:11:55'),
(588, 'App\\Models\\User', 12, 'api-token', 'bf3bdedc5bbfae4f3c0662a6bf51cfb9148e7ac6c3b09ea1867d386f7938e0ef', '[\"*\"]', '2025-09-14 00:53:29', NULL, '2025-09-14 00:12:20', '2025-09-14 00:53:29'),
(589, 'App\\Models\\User', 1, 'api-token', '9fc35f92e085375b425affe762e0be3b401cf47b5cf9a3c8b714984e90305b20', '[\"*\"]', '2025-09-14 00:52:13', NULL, '2025-09-14 00:51:09', '2025-09-14 00:52:13'),
(590, 'App\\Models\\User', 95, 'api-token', 'b6a038c3cec146881d5e0a9c4b0f7d2a95af2d4370c6bff10b89237c48e1ba71', '[\"*\"]', '2025-09-14 21:02:49', NULL, '2025-09-14 00:52:41', '2025-09-14 21:02:49'),
(591, 'App\\Models\\User', 12, 'api-token', '379f625bfc932347cda60adece13fc8c9f83a026c5323f76f20050c712df3dd3', '[\"*\"]', '2025-09-14 01:06:25', NULL, '2025-09-14 01:06:23', '2025-09-14 01:06:25'),
(598, 'App\\Models\\User', 12, 'api-token', '24d49998f9ef52e4ea34800dfb1221cfa80a8e3675705e46367bf1140e62487a', '[\"*\"]', '2025-09-14 07:27:27', NULL, '2025-09-14 07:19:53', '2025-09-14 07:27:27'),
(599, 'App\\Models\\User', 12, 'api-token', '2c07f4c7f21cfa18d9a6235b7202f6195c19fe22e61c934f24bcc8fd3392d238', '[\"*\"]', '2025-09-14 07:33:47', NULL, '2025-09-14 07:32:41', '2025-09-14 07:33:47'),
(600, 'App\\Models\\User', 102, 'api-token', 'd0f5ea8594530b3bc9a436d8a82860a693071f06d0dfb6b20b0dc55752ce2b01', '[\"*\"]', '2025-09-16 08:14:24', NULL, '2025-09-14 07:37:05', '2025-09-16 08:14:24'),
(601, 'App\\Models\\User', 12, 'api-token', '10c851815416746e2b1a0a9f7d6aec9549c016f07665de471acafbc201e71988', '[\"*\"]', '2025-09-14 22:03:17', NULL, '2025-09-14 21:43:29', '2025-09-14 22:03:17'),
(602, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '404ba0fb056f6ca90c3f522e9174edd567af97dca21566c79ec4d4a1013cc593', '[\"*\"]', NULL, NULL, '2025-09-14 22:19:21', '2025-09-14 22:19:21'),
(604, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '290b86817231cb454fda85910f29f2863a12e12bfc604c8a30b34671b96f89ec', '[\"*\"]', NULL, NULL, '2025-09-14 23:08:53', '2025-09-14 23:08:53'),
(605, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e9d007bcc2c32a67adbcd92053f81fa2df40c157589de29a569de4cc57df29c5', '[\"*\"]', NULL, NULL, '2025-09-14 23:09:46', '2025-09-14 23:09:46'),
(606, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd2aec241876124d2454a8b631e5987bb6b3a34e2f82f4a8e346543f7962a6e99', '[\"*\"]', NULL, NULL, '2025-09-14 23:10:24', '2025-09-14 23:10:24'),
(614, 'App\\Models\\User', 12, 'api-token', '23f85e977de03e625d357a1561649c3790ac579f5b7c4d196e2c03eed18cf90a', '[\"*\"]', '2025-09-14 23:41:41', NULL, '2025-09-14 23:41:41', '2025-09-14 23:41:41'),
(617, 'App\\Models\\User', 12, 'api-token', '7d91324f75040f3d6551bb7f9fbf7643ac97ce203eaf74a6d9dd36eb3b9556b3', '[\"*\"]', NULL, NULL, '2025-09-14 23:49:30', '2025-09-14 23:49:30'),
(619, 'App\\Models\\User', 12, 'api-token', '9069ced29f5b22d83215eaa75e591028d92b4f5e3bad5a633f26409fe320df24', '[\"*\"]', NULL, NULL, '2025-09-14 23:57:43', '2025-09-14 23:57:43'),
(620, 'App\\Models\\User', 12, 'api-token', '9cc82e3b5d81867d29b2753877d7b02e7e87df5bde9ade48c1909d1288d4b3cd', '[\"*\"]', NULL, NULL, '2025-09-14 23:58:55', '2025-09-14 23:58:55'),
(621, 'App\\Models\\User', 12, 'api-token', 'c7cf616be5a6947865014e98c185c7ee5ba5f63046a8965c0a54d1a382dea1d0', '[\"*\"]', NULL, NULL, '2025-09-14 23:59:09', '2025-09-14 23:59:09'),
(622, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7d570dfd2ed3d126643a0210742c482f45be91bb0216d71113799c955b5712a0', '[\"*\"]', NULL, NULL, '2025-09-15 00:11:11', '2025-09-15 00:11:11'),
(623, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a4121b6e0709be83a7d1f68b11d288892a0371b9e887d16678dcd6e19482273c', '[\"*\"]', NULL, NULL, '2025-09-15 00:15:29', '2025-09-15 00:15:29'),
(624, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9dc4f964c37100cd1dff545366795a8825c015cdfd7837fdf778cf529ee39d42', '[\"*\"]', NULL, NULL, '2025-09-15 00:16:46', '2025-09-15 00:16:46'),
(625, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '82ba7c1b9f20eeba8b046b7e75123d68fcb8033097b291463169fa8ad5dc4257', '[\"*\"]', NULL, NULL, '2025-09-15 00:19:52', '2025-09-15 00:19:52'),
(626, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '09dc093fe6b8e41da8f4e54d8e35ff3216a43a693605141fb67cc8c45db60895', '[\"*\"]', NULL, NULL, '2025-09-15 00:21:28', '2025-09-15 00:21:28'),
(629, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bdfd5a14eddf05d0dc55fa11db08153cbb320c44636212738b495d16a500405d', '[\"*\"]', NULL, NULL, '2025-09-15 00:23:54', '2025-09-15 00:23:54'),
(630, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '474c1046b0a53f1f4bba3ab2cb80614d2cc87f9f75eb4c7c4adc3f5ca085485f', '[\"*\"]', NULL, NULL, '2025-09-15 00:24:29', '2025-09-15 00:24:29'),
(631, 'App\\Models\\User', 12, 'api-token', '2ddc97837fb59d9fc9971ce78396449cf5dee964e36c1bdd9448f54652f2fef8', '[\"*\"]', NULL, NULL, '2025-09-15 00:35:23', '2025-09-15 00:35:23'),
(632, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8cb023a2b11d74add7f593ba998cfca9546577f17dc995b794dae9aacaab0b77', '[\"*\"]', '2025-09-15 00:57:44', NULL, '2025-09-15 00:35:46', '2025-09-15 00:57:44'),
(633, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eb843f6adb148d8995e67476ec1e491f177d4a9733cae3c8f9a99f587f88b8a5', '[\"*\"]', NULL, NULL, '2025-09-15 01:04:41', '2025-09-15 01:04:41'),
(634, 'App\\Models\\User', 1, 'api-token', 'd3eb16b2dd41a443c8022e5801f522c66ef9489ce0ba4f1240fc9e56644f6154', '[\"*\"]', '2025-09-15 03:28:59', NULL, '2025-09-15 01:52:35', '2025-09-15 03:28:59'),
(635, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '598ef8e59b0151533622c4763f34812d915f438b2d0923147a906d2a2bffbbba', '[\"*\"]', NULL, NULL, '2025-09-15 01:53:12', '2025-09-15 01:53:12'),
(637, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '112afc5fc57d5052d9e8c599cea48a554d3d534d5335eb94d5650d18b36bc245', '[\"*\"]', NULL, NULL, '2025-09-15 03:10:48', '2025-09-15 03:10:48'),
(638, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '412b7389ae45a6553a20dc2706720810a0663b9a3a1b0118c77855f57d2ed513', '[\"*\"]', NULL, NULL, '2025-09-15 03:15:04', '2025-09-15 03:15:04'),
(639, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4ba2a1b2fbcd0b533c73ed5fbc0669690ea8aa174171265deeca48a880e2c023', '[\"*\"]', NULL, NULL, '2025-09-15 03:15:13', '2025-09-15 03:15:13'),
(641, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c5b4c8f1930b26b1e4a7273eafdf47d9313adee351169c0e5b37aa191e2b9b9b', '[\"*\"]', NULL, NULL, '2025-09-15 03:15:48', '2025-09-15 03:15:48'),
(642, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '49292d68ba818ea50d4284a83f7226ced4c22b3f7359bedd2d4ac576d99460b0', '[\"*\"]', NULL, NULL, '2025-09-15 03:16:11', '2025-09-15 03:16:11'),
(643, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2077e5ec15ce258c3aa39eeebb894926533c18db3294401ccada442a1a97210e', '[\"*\"]', NULL, NULL, '2025-09-15 03:16:35', '2025-09-15 03:16:35'),
(644, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '39f61d6e214a94635d48727559e4240ae3ed0e956a05fed63fb6f5cf2e111d2d', '[\"*\"]', NULL, NULL, '2025-09-15 03:20:27', '2025-09-15 03:20:27'),
(645, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7dbb73fc38c0911ddc41929bc87fcc874b29a15580bc915c45d4223b5659bad7', '[\"*\"]', NULL, NULL, '2025-09-15 03:21:32', '2025-09-15 03:21:32'),
(646, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c6b63cef744ca1b8d2122a49b43566197a8512e92993487b8a7bb99b4c97a82d', '[\"*\"]', NULL, NULL, '2025-09-15 03:23:42', '2025-09-15 03:23:42'),
(648, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '51e3c8ae4c07170cea88ccdfab214ff27962e0483fc7e568c32ebf1b67599fec', '[\"*\"]', NULL, NULL, '2025-09-15 03:26:08', '2025-09-15 03:26:08'),
(649, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b7a8bbd06fe6c7263003485bd2b54b3441d94dfc6196b7122833f391d39f4912', '[\"*\"]', NULL, NULL, '2025-09-15 03:27:03', '2025-09-15 03:27:03'),
(651, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6f6e24d684343e59fed45e308ef997b69a0434e051fba393dfdaa8f8f93b2557', '[\"*\"]', NULL, NULL, '2025-09-15 03:51:44', '2025-09-15 03:51:44'),
(653, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5f5df15e2af64ffbe4f30f109bc8c5272fd7c8d7f10ef97373add2b240485b7c', '[\"*\"]', NULL, NULL, '2025-09-15 03:53:32', '2025-09-15 03:53:32'),
(654, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '77df9fb5340b4e9b17aab1c6b90e5e96b2428dd4c6a027422f6611a922489c37', '[\"*\"]', NULL, NULL, '2025-09-15 03:54:32', '2025-09-15 03:54:32'),
(655, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '590c0e7464e9ed4ff74f1a6d5c160ff21e7415088d37161c76300e8041cb5452', '[\"*\"]', NULL, NULL, '2025-09-15 03:57:51', '2025-09-15 03:57:51'),
(656, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8dc8cc89e91355d4fe7076f1df6a57198af050e86f1345383071ca099b37f2da', '[\"*\"]', NULL, NULL, '2025-09-15 04:05:29', '2025-09-15 04:05:29'),
(657, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '58068060babe8f6fe642cb559274d3c7ca5ddf1851c771799dbd69f85a62345a', '[\"*\"]', NULL, NULL, '2025-09-15 04:06:01', '2025-09-15 04:06:01'),
(658, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '94dc2baa1cd4a1fc8cddaf6d10e862ee854e49f5d5d6c39668e1c0d14d8e2de5', '[\"*\"]', NULL, NULL, '2025-09-15 04:08:24', '2025-09-15 04:08:24'),
(659, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '64f8e77efefdbd7219d23e28ecd3eccf577d86c2d8e82d4f932df7a916d20477', '[\"*\"]', '2025-09-15 04:10:30', NULL, '2025-09-15 04:08:48', '2025-09-15 04:10:30'),
(660, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd9ae5726c405b926b4e8efefac14e6bff9b2b0eeb168ae736b8c2623eadb0a21', '[\"*\"]', NULL, NULL, '2025-09-15 04:09:17', '2025-09-15 04:09:17'),
(662, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cf1a3f333e6e574936cdd796573f218e7ce254a5c1b934a6f729279f3e17fe68', '[\"*\"]', NULL, NULL, '2025-09-15 07:35:56', '2025-09-15 07:35:56'),
(663, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2aa224948e2b8e560abee191d18e894c076197347acfa12212fd40026ecbb9c5', '[\"*\"]', NULL, NULL, '2025-09-15 07:59:14', '2025-09-15 07:59:14'),
(664, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1825804cae968283fce0e38e838dc1ea4b8e6d93c9f1ef673655b8c5cc21505c', '[\"*\"]', NULL, NULL, '2025-09-15 08:12:20', '2025-09-15 08:12:20'),
(665, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5074cb8ef95ffb49fe505845454a1244cc9ee5c92d7f99d3e4c910db41639da0', '[\"*\"]', NULL, NULL, '2025-09-15 08:13:57', '2025-09-15 08:13:57'),
(666, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7e37144904e0841bbe2a2a151f04db894f13b39d0c58ee29b365d6d22eb5d172', '[\"*\"]', '2025-09-15 08:23:06', NULL, '2025-09-15 08:15:20', '2025-09-15 08:23:06'),
(667, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '100523443bfea87758aa5f3c1c0d9cfd6ea4e77c0f5c3be8e8b9d74e28a2ea84', '[\"*\"]', '2025-09-16 05:01:03', NULL, '2025-09-15 20:44:27', '2025-09-16 05:01:03'),
(668, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd0fd5615c31d66a47a8d7c100752db0839d75b91f3087f3fa37070e8e5394fd3', '[\"*\"]', '2025-09-15 21:12:25', NULL, '2025-09-15 20:50:32', '2025-09-15 21:12:25'),
(669, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f17dccca01cb521fff9ff64f10a85e38a4c674b59fb18d96804f78d5a319c1f1', '[\"*\"]', '2025-09-15 21:55:36', NULL, '2025-09-15 21:40:43', '2025-09-15 21:55:36'),
(670, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5ed32af6acf2f25591300d798f7a2a6536a9e28f10fd9cc5539dc16fdb1b2ca9', '[\"*\"]', '2025-09-15 23:01:12', NULL, '2025-09-15 22:11:28', '2025-09-15 23:01:12'),
(671, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a8f3eaa4bdfe2933b76fd77c425b9258c6692b7c282b39ce4052b4f7fa7cd62f', '[\"*\"]', '2025-09-15 23:56:19', NULL, '2025-09-15 23:47:34', '2025-09-15 23:56:19'),
(672, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3a976a23fee489426f934f12489d947d3f650783c95eed5cbeafeed2fd174c0a', '[\"*\"]', '2025-09-15 23:57:15', NULL, '2025-09-15 23:57:15', '2025-09-15 23:57:15'),
(673, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a70673bb9de8d047c5c81654ec0cf683e4f17bb1d169cca53bd2bbd29fe103f8', '[\"*\"]', '2025-09-16 00:01:59', NULL, '2025-09-15 23:59:27', '2025-09-16 00:01:59'),
(674, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '64343cf07373b03f33801b016b0b184cb60f3abbcabce9402dbbae1ed11639b2', '[\"*\"]', '2025-09-16 00:56:59', NULL, '2025-09-16 00:56:59', '2025-09-16 00:56:59'),
(675, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7449e27770947e439746d01e74383b366027694f962ecea9c60b0a417340f653', '[\"*\"]', '2025-09-16 00:59:58', NULL, '2025-09-16 00:59:38', '2025-09-16 00:59:58'),
(676, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ffe7ed48fe6db1b4ef7a70308a9748f6847704580e2b648abc734ec04735b47f', '[\"*\"]', '2025-09-16 01:11:55', NULL, '2025-09-16 01:00:39', '2025-09-16 01:11:55'),
(677, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '591a1a2905a39443a89289e48a4fe1b1f8020b8d8bbfe874a3a2cfcb49a6b066', '[\"*\"]', '2025-09-16 02:36:07', NULL, '2025-09-16 01:14:00', '2025-09-16 02:36:07'),
(678, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cb219af5f99a1ff3f59789722fae5882b086ba81a9be44ba41edc2280fe2fcbf', '[\"*\"]', '2025-09-16 02:38:07', NULL, '2025-09-16 02:37:18', '2025-09-16 02:38:07'),
(679, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0fc7412d5329f76b830e7ba95970242a863d2332e8069fbe74c36d872eb2d75e', '[\"*\"]', '2025-09-16 02:45:08', NULL, '2025-09-16 02:41:27', '2025-09-16 02:45:08'),
(680, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bfea4c83ea18c3980c1436aae65d9a47dd0c0aed0dcb469326bf8b5abaa24084', '[\"*\"]', '2025-09-16 02:45:32', NULL, '2025-09-16 02:45:32', '2025-09-16 02:45:32'),
(681, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9438594f0d6677d044627e81a9f21422db734363ffcd2138c278aa2da3afe0ea', '[\"*\"]', '2025-09-16 02:59:05', NULL, '2025-09-16 02:57:52', '2025-09-16 02:59:05'),
(682, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '688acbbd8dd064d437a4eddf3e7139787ff47f47116978ab8365ac19f6656e58', '[\"*\"]', '2025-09-16 03:03:28', NULL, '2025-09-16 02:59:53', '2025-09-16 03:03:28'),
(683, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5ee3a95d244a25b6ae105985f6af80767413209a2d1fb7f3463f902d29479371', '[\"*\"]', '2025-09-16 03:06:27', NULL, '2025-09-16 03:04:04', '2025-09-16 03:06:27'),
(684, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5bdc4809fbaf379910baf0a6414ebb556758710632b8b8fbde5d5d0251c0f9b0', '[\"*\"]', '2025-09-16 03:15:44', NULL, '2025-09-16 03:15:41', '2025-09-16 03:15:44'),
(685, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a5238e0e19c17ce065e77caca03cb3ba799a2dde8c16fdc5b0a0a1a0e31d5211', '[\"*\"]', '2025-09-16 03:34:26', NULL, '2025-09-16 03:19:38', '2025-09-16 03:34:26'),
(686, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '985d5bd640430804ef51e08f171321c664f47502626d31f0b17d20471d4f2e30', '[\"*\"]', '2025-09-16 03:44:27', NULL, '2025-09-16 03:39:09', '2025-09-16 03:44:27'),
(687, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e5ed8511720dde88f2152f35e95c98f29701160ad05b8ab3dcc76912750b9119', '[\"*\"]', '2025-09-16 04:29:42', NULL, '2025-09-16 04:22:37', '2025-09-16 04:29:42'),
(688, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '255a11c1988dcbe1a21ab9ac0a2e9ad0873bfd2a4d63ea95bfa31298ab76cb49', '[\"*\"]', '2025-09-16 04:34:01', NULL, '2025-09-16 04:30:39', '2025-09-16 04:34:01'),
(689, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '10bf0f7f2682df15f397db2b43565f3388554fca3646f7be9b18e7047195f6c0', '[\"*\"]', '2025-09-16 04:57:15', NULL, '2025-09-16 04:36:43', '2025-09-16 04:57:15'),
(690, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b55517cca66cf03dc4c3e2749db62cd8584a187af5344a8dc3f1e86f281cdbad', '[\"*\"]', '2025-09-16 04:49:17', NULL, '2025-09-16 04:48:52', '2025-09-16 04:49:17'),
(691, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f083f8eea22ef353695227a0f2a68b8a9a6f3aad98e977cf620e444101d6f8fb', '[\"*\"]', '2025-09-16 04:54:30', NULL, '2025-09-16 04:52:08', '2025-09-16 04:54:30'),
(692, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '75b96801fac83fa20b185bfce3793350efd12b96318103a1bead22c5f5b6522a', '[\"*\"]', '2025-09-16 05:11:03', NULL, '2025-09-16 04:59:57', '2025-09-16 05:11:03'),
(693, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '60c923603cf4e6d6dea4a634dc0c02d1c334bd14fec37f9c4441cea654d48995', '[\"*\"]', '2025-09-16 08:15:27', NULL, '2025-09-16 08:09:20', '2025-09-16 08:15:27'),
(694, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '22f801d9be93d6387c2a198e50ae21756e4db3a80372331fbf7f732244934187', '[\"*\"]', '2025-09-16 08:28:14', NULL, '2025-09-16 08:14:44', '2025-09-16 08:28:14'),
(695, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '365b5d0020adaf56eb792fdf49782c3ce112fde8f13e622b046fbb87ffe32de4', '[\"*\"]', '2025-09-16 08:27:28', NULL, '2025-09-16 08:16:17', '2025-09-16 08:27:28'),
(696, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4b1b508241350e0bdec45ef8ea79e8318cd2843ac352404fb66942125b352c6e', '[\"*\"]', '2025-09-16 09:07:44', NULL, '2025-09-16 09:07:43', '2025-09-16 09:07:44'),
(697, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '58310a8a35634946f82fb29dca0468c46813a9af66aae0c98194efa0e3d80725', '[\"*\"]', '2025-09-16 09:13:32', NULL, '2025-09-16 09:09:59', '2025-09-16 09:13:32'),
(698, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5097b72072191ab439eab1123d7c1cfd3db201bf1571f1ecce2503ca6715bf5e', '[\"*\"]', '2025-09-16 09:19:45', NULL, '2025-09-16 09:14:27', '2025-09-16 09:19:45'),
(699, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '47b84cfab2d5577efa9dbac2bb3599be82c1a82a7b2f47136f28f6b169817c64', '[\"*\"]', '2025-09-16 09:28:22', NULL, '2025-09-16 09:22:01', '2025-09-16 09:28:22'),
(700, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e953bbf80f8b55d7319a7798094aff57afa891648341e03020d5a78e10e74a02', '[\"*\"]', '2025-09-16 09:33:10', NULL, '2025-09-16 09:33:09', '2025-09-16 09:33:10'),
(701, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '27a9796905d3907a6a7fbef40a7dd0c0e78cc7ea82dcdcb1e0802a44fca17903', '[\"*\"]', '2025-09-16 09:36:06', NULL, '2025-09-16 09:36:05', '2025-09-16 09:36:06'),
(702, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f2b0e687cff45befb434b10e9e8b42ac6d0bf581f28a13a1335a127f8321da1d', '[\"*\"]', '2025-09-16 09:38:15', NULL, '2025-09-16 09:38:14', '2025-09-16 09:38:15'),
(703, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '50c966d2ed2de5518b7cc54002442cd413e3259fb125c93bb78ec5ae60ae7060', '[\"*\"]', '2025-09-16 09:41:39', NULL, '2025-09-16 09:41:38', '2025-09-16 09:41:39'),
(704, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5081bab56a0be2e5b6b310c2e106a09a63a736e7fef1a3349d8ffd9b86f8cdbf', '[\"*\"]', '2025-09-16 10:53:24', NULL, '2025-09-16 10:49:59', '2025-09-16 10:53:24'),
(705, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '31fe8deb21520cbcb1bad633d3aca69819df34211d3793cb834039092df11b34', '[\"*\"]', '2025-09-21 08:46:27', NULL, '2025-09-16 11:08:45', '2025-09-21 08:46:27'),
(706, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '52769fb129dc7d83f962e07b587c889ff85e5894d45bb3712e8b451edb9cb910', '[\"*\"]', '2025-09-16 11:19:03', NULL, '2025-09-16 11:18:01', '2025-09-16 11:19:03'),
(707, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e1ee56de9ea394df80766634714aac15d513ab503c56a989322787fdfd549a95', '[\"*\"]', '2025-09-16 11:19:54', NULL, '2025-09-16 11:19:53', '2025-09-16 11:19:54'),
(708, 'App\\Models\\User', 12, 'api-token', 'db3ed28ad6cbe6dd5a9c4e9a5de20ed2c8de753cf594bcd7aed75a7bdb8cb5f1', '[\"*\"]', '2025-09-16 11:20:49', NULL, '2025-09-16 11:20:48', '2025-09-16 11:20:49'),
(709, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7076fd123af624a1acf30f7f47731ae3680e2ac646b9a1b30cbd473f63279e0c', '[\"*\"]', '2025-09-16 11:21:15', NULL, '2025-09-16 11:21:13', '2025-09-16 11:21:15'),
(710, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '30e697bce4d842159423c777ca8de9187a88bae8a31fae1de93cd5a0b773fdcd', '[\"*\"]', '2025-09-16 11:25:52', NULL, '2025-09-16 11:22:29', '2025-09-16 11:25:52'),
(711, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd943b7f0f87a5beef02601b535a7d10270f44d009304c9976f0e185916b69d78', '[\"*\"]', '2025-09-16 11:26:30', NULL, '2025-09-16 11:26:29', '2025-09-16 11:26:30'),
(712, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '465d922fe76f2877682912eeb62c017149968bf71fa68a43106cd045cf9c0025', '[\"*\"]', '2025-09-16 11:30:33', NULL, '2025-09-16 11:28:41', '2025-09-16 11:30:33'),
(713, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2447563b8626946f7bcb09b9b70836c9ee3385072b9d3817a944336564748d66', '[\"*\"]', '2025-09-16 11:47:55', NULL, '2025-09-16 11:32:09', '2025-09-16 11:47:55'),
(714, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2e173d7c1f6e6295a81c1d25a51b9cdea3847d1ac506d157d5e57693fce4dc2c', '[\"*\"]', '2025-09-16 12:03:38', NULL, '2025-09-16 11:48:26', '2025-09-16 12:03:38'),
(715, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '43b4413a8c86c8aba1c77fd47c9bc02bed5d6fd9afd7469fe8b23647957b5022', '[\"*\"]', '2025-09-16 21:19:31', NULL, '2025-09-16 20:46:53', '2025-09-16 21:19:31'),
(716, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6ef0d4d665c2af7f9c5597af5c7aec55a908fb9709f1a75db5835e146059b284', '[\"*\"]', '2025-09-17 22:40:39', NULL, '2025-09-16 20:47:42', '2025-09-17 22:40:39'),
(717, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '622918a7a9a4c13b1538f70d3e1182ccf385e6dd865a5880edb03d796470ad5b', '[\"*\"]', '2025-09-16 21:19:55', NULL, '2025-09-16 21:19:54', '2025-09-16 21:19:55'),
(718, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a8d1aaf2a1bc2060b52b0233a7d8b9973e849ca84f668b5fa29098f064ad2ed6', '[\"*\"]', '2025-09-16 21:52:54', NULL, '2025-09-16 21:47:14', '2025-09-16 21:52:54'),
(719, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a03b81bdde272845b2554899e6ce9f703d1994dcf403b6f665c1542dfbffc002', '[\"*\"]', '2025-09-16 22:44:37', NULL, '2025-09-16 22:06:41', '2025-09-16 22:44:37'),
(720, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4c2708e5f4c4418b004c7a74cd11efa631ac30d50bcca016fe4a007f8e825263', '[\"*\"]', '2025-09-16 23:02:20', NULL, '2025-09-16 22:45:25', '2025-09-16 23:02:20'),
(721, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e29ba0d686194a54289bdd765ad4a6eb3a9da25b56fa763613650bc0a08d8b88', '[\"*\"]', '2025-09-16 23:25:58', NULL, '2025-09-16 23:04:19', '2025-09-16 23:25:58'),
(722, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b846bcdd9ecd3c16a556dbd00d434e9b9d239d9785fcee1e4548114b9629f3bb', '[\"*\"]', '2025-09-16 23:26:20', NULL, '2025-09-16 23:26:12', '2025-09-16 23:26:20'),
(723, 'App\\Models\\User', 12, 'api-token', 'ba78fc0f0c8415233b36700c3c8fda473afe8884de4255004c8f172f9e1fb2d2', '[\"*\"]', '2025-09-16 23:27:03', NULL, '2025-09-16 23:26:31', '2025-09-16 23:27:03'),
(724, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a2d3a113418eba19ee5f2118dcb36371ef22d1cf34e747cfb68099dc1d4c7592', '[\"*\"]', '2025-09-17 00:10:36', NULL, '2025-09-16 23:30:47', '2025-09-17 00:10:36'),
(725, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '77844627f87c6df4d1524f03b49f75214bf603cac09d1c40b8f50dd2b43d00c0', '[\"*\"]', '2025-09-17 00:11:15', NULL, '2025-09-17 00:10:53', '2025-09-17 00:11:15'),
(726, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c341259ce9c49201bfa5cb08608a35cb8a0eb35b60e3741c218feb00328696a0', '[\"*\"]', '2025-09-17 00:12:56', NULL, '2025-09-17 00:11:29', '2025-09-17 00:12:56'),
(727, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8751534024aa160cfaba7e5a13354941770ddf1cd70a086145bf66b606df664a', '[\"*\"]', '2025-09-17 00:26:55', NULL, '2025-09-17 00:24:54', '2025-09-17 00:26:55'),
(728, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a6d72f806b439d12350254e3fe687e40569b77ab527beb49acc988e2cfa7f77f', '[\"*\"]', '2025-09-17 00:54:49', NULL, '2025-09-17 00:27:57', '2025-09-17 00:54:49'),
(729, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '42dbc53b6b2977cb4d2f714fdd9b4fad7a6ad851d5c0c998a06154810a1d47cf', '[\"*\"]', '2025-09-17 00:56:17', NULL, '2025-09-17 00:56:16', '2025-09-17 00:56:17'),
(730, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2fab65a010a4961a0f47aa4a63ab97965b27219c86bcef9d6acfb78f439887b0', '[\"*\"]', '2025-09-17 03:14:51', NULL, '2025-09-17 00:57:56', '2025-09-17 03:14:51'),
(731, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd667ae0a9a6fb29065781ad66cec57aec059e638be03ecb4b7037b0d122a296f', '[\"*\"]', '2025-09-17 03:52:31', NULL, '2025-09-17 03:47:40', '2025-09-17 03:52:31'),
(732, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd77d6cc1587ca1b99f145a0ad9aecb1651cb47d0ea893b5c92da72916f6712f9', '[\"*\"]', '2025-09-17 05:25:36', NULL, '2025-09-17 04:01:21', '2025-09-17 05:25:36'),
(733, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7b1f9b343365359ed180169a9890e46a0d21892cacc62dbe486777f0facfd241', '[\"*\"]', '2025-09-17 08:17:13', NULL, '2025-09-17 08:16:26', '2025-09-17 08:17:13'),
(734, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8f313a6db3c21e4a45ca8d1fda29c09da91bbb02cce463464b4b9ac8142d3979', '[\"*\"]', '2025-09-17 20:51:29', NULL, '2025-09-17 20:51:23', '2025-09-17 20:51:29'),
(735, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '38cd8b8c83687aff9883b08cd0b676bd821370855882ae0240a787a602f0f221', '[\"*\"]', '2025-09-17 22:38:05', NULL, '2025-09-17 22:37:30', '2025-09-17 22:38:05'),
(736, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '62f4fb5a2329dd194c47638f77781abdf28b93ad95e9f2c5bd9d4c2f390ec1d3', '[\"*\"]', '2025-09-17 22:39:33', NULL, '2025-09-17 22:39:28', '2025-09-17 22:39:33'),
(737, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ed978844813597b781506fc37e9fe7b61fac6be36341c188c1a5ab74a826e791', '[\"*\"]', '2025-09-17 22:44:50', NULL, '2025-09-17 22:40:21', '2025-09-17 22:44:50'),
(738, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '51d7b94d5d5b8c5fb4063a9ace898ec0b9b2e931e741d05c464cf31932b47a68', '[\"*\"]', '2025-09-17 22:43:12', NULL, '2025-09-17 22:40:47', '2025-09-17 22:43:12'),
(740, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f508579b9610dcdbf62c375dc4db080c9a5368c08c63b9382d67208f86955f8c', '[\"*\"]', '2025-09-17 22:52:26', NULL, '2025-09-17 22:51:42', '2025-09-17 22:52:26'),
(741, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a0a36ee9ecd23b953b6f55766ca4d90de69207fb305776479fdfb6814e5305be', '[\"*\"]', '2025-09-17 22:57:07', NULL, '2025-09-17 22:57:04', '2025-09-17 22:57:07'),
(742, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e349ca5a303bcbb0704b9611a2e022be6ff411dc520b8a6729c0f6a0e2a34fa7', '[\"*\"]', '2025-09-17 23:02:03', NULL, '2025-09-17 23:01:35', '2025-09-17 23:02:03'),
(743, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'feda8e958b917e09e8b51ab1bcfea3fa1c8f55efd0727f17e3142e81c77f01e2', '[\"*\"]', '2025-09-17 23:13:59', NULL, '2025-09-17 23:12:48', '2025-09-17 23:13:59'),
(744, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5cbe9bbf4ba8215e103e77396c3aee3321872d22ea31d6d8e8301973538f1ec4', '[\"*\"]', '2025-09-17 23:39:28', NULL, '2025-09-17 23:39:24', '2025-09-17 23:39:28'),
(745, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1464858e99bbf67db0f1cd02867ed7c2c7d7dbab257898952e9c32d4feeefac5', '[\"*\"]', '2025-09-17 23:40:45', NULL, '2025-09-17 23:40:41', '2025-09-17 23:40:45'),
(746, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2c9766f095775ff072d850358605b1cc7515ce8f993d212fba9d539de8c08256', '[\"*\"]', '2025-09-17 23:43:22', NULL, '2025-09-17 23:43:09', '2025-09-17 23:43:22'),
(747, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '64a0badf95e935278fdfdaa1ec673c8580a0aace7974757f816b6734c62c3fad', '[\"*\"]', '2025-09-17 23:51:24', NULL, '2025-09-17 23:51:21', '2025-09-17 23:51:24'),
(748, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e04de7493f6eb04729b2acc404e5b03f9d3dea0657736dd0b451026dc802c395', '[\"*\"]', '2025-09-18 00:04:26', NULL, '2025-09-17 23:54:04', '2025-09-18 00:04:26'),
(749, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5fbe178347d4cda838a67347437a80f6d08435508e32924e7f22f9cb9b8d9c75', '[\"*\"]', '2025-09-18 00:12:38', NULL, '2025-09-18 00:05:55', '2025-09-18 00:12:38'),
(750, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '12d721b5a56d40853f42c1a587ab02dbeb2ee225ff10a0f0593c3729f0144b82', '[\"*\"]', '2025-09-18 00:59:28', NULL, '2025-09-18 00:13:05', '2025-09-18 00:59:28'),
(751, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1947bb927a39c7c3d8d3274cd45336adb11a66a95f9cfe3d0bc79336a861a0f8', '[\"*\"]', '2025-09-18 01:12:39', NULL, '2025-09-18 01:12:34', '2025-09-18 01:12:39'),
(752, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e757c169838781ef368ebb6c00c10d624be91be4c9495029fdd5be8b6518f8cd', '[\"*\"]', '2025-09-18 01:14:53', NULL, '2025-09-18 01:14:50', '2025-09-18 01:14:53'),
(753, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c353f0e5ab3d0806c77769a291ec895fae7c5b9bfad622a64a1c3739d076d061', '[\"*\"]', '2025-09-18 01:51:12', NULL, '2025-09-18 01:50:58', '2025-09-18 01:51:12'),
(754, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3be26ac4e725c6e80ec8e03a5dd79b4b90145aa17f8c945329215a8c38725254', '[\"*\"]', '2025-09-18 02:07:24', NULL, '2025-09-18 02:06:00', '2025-09-18 02:07:24'),
(755, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'beddd3530089fc743debca4e249e3698e0f450bc7d7fc0f882f2e80e75aae973', '[\"*\"]', '2025-09-18 02:15:39', NULL, '2025-09-18 02:07:37', '2025-09-18 02:15:39'),
(756, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9ec21308632e9d758ea33ab87a27fcab77c6b4909cf4d92adfc4f7f303d76c65', '[\"*\"]', '2025-09-18 02:19:52', NULL, '2025-09-18 02:19:50', '2025-09-18 02:19:52'),
(757, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e732a7ee3a71369c130308ea5f0a8c901d6b9d334409cf533ba35da00745803f', '[\"*\"]', '2025-09-18 02:41:26', NULL, '2025-09-18 02:28:52', '2025-09-18 02:41:26'),
(758, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '815aa70a420fd9136fe1e738a348dd88c28b1852c67e6a6d4a6a888bb3a73160', '[\"*\"]', '2025-09-18 03:31:43', NULL, '2025-09-18 03:31:43', '2025-09-18 03:31:43'),
(759, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a7466961f508a636091059ba3d62b67f35f1d375517bf8ce8b38f57dbfab358e', '[\"*\"]', '2025-09-18 03:32:25', NULL, '2025-09-18 03:32:21', '2025-09-18 03:32:25'),
(760, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '72a681e775413cd20e111f8bd713b3949a0622537782f2c5512e287e7d4fa65b', '[\"*\"]', '2025-09-18 03:47:59', NULL, '2025-09-18 03:39:01', '2025-09-18 03:47:59'),
(761, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2dddb963b2efcc3fbe22f63f2a8e330f9b38b10de8849e6da822ff2c428c170c', '[\"*\"]', '2025-09-18 04:15:48', NULL, '2025-09-18 03:58:34', '2025-09-18 04:15:48'),
(762, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '88524ca0d002b96ab12127ba29eae708f433c8ec41ebd6dcd93a7bdb84e367b1', '[\"*\"]', '2025-09-18 04:36:07', NULL, '2025-09-18 04:16:27', '2025-09-18 04:36:07'),
(763, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '51cf348cfa83f0d82719757e3a96946a019f1e48d76ca05a7b12b6b41f61e3c8', '[\"*\"]', '2025-09-18 05:02:57', NULL, '2025-09-18 04:40:56', '2025-09-18 05:02:57'),
(765, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '76946d0bf1aef56a4fb63670e0a6e242765d602b1e81f55e0cddffab546caa17', '[\"*\"]', '2025-09-18 08:14:57', NULL, '2025-09-18 08:00:32', '2025-09-18 08:14:57'),
(766, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '28d3ba9f811d16b3d50ac0cde83b2c8a20e4867538bab04019786456ad015384', '[\"*\"]', '2025-09-18 09:05:12', NULL, '2025-09-18 09:00:45', '2025-09-18 09:05:12'),
(767, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '93890120a41ccb6349ed1ed768814f6b3712164966cc6d4e89716f6717849427', '[\"*\"]', '2025-09-20 03:43:05', NULL, '2025-09-20 03:41:54', '2025-09-20 03:43:05'),
(768, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0dd71267997c634352215760a7555fd011ee06bf03fd8fe84d696ab114bcddc3', '[\"*\"]', '2025-09-20 07:34:50', NULL, '2025-09-20 07:33:24', '2025-09-20 07:34:50'),
(770, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7569d301e7d96ef5c4e8198fef9180b9db6dba9004efb070c0a6975d4e0242c4', '[\"*\"]', '2025-09-20 21:21:50', NULL, '2025-09-20 20:52:33', '2025-09-20 21:21:50'),
(771, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '28c758149a7ff47ec542660c9968f01a7df4854c065fd7a75781ae6cecb40a19', '[\"*\"]', NULL, NULL, '2025-09-20 21:13:40', '2025-09-20 21:13:40'),
(772, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1cf4899c5ffeee7a110751a892930bf686a571ea29e9a591d4f25b5fb52b40d0', '[\"*\"]', NULL, NULL, '2025-09-20 21:14:59', '2025-09-20 21:14:59'),
(773, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '09c612b60358a3ecdead956841d93977c1c3a3b119bfbfd0539d9ad11f92e177', '[\"*\"]', NULL, NULL, '2025-09-20 21:17:25', '2025-09-20 21:17:25'),
(774, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'fd2f3acf5c0e8f40fc1ca01ed86ddf04be722ac1bcfcf2f1685f97e4715714f7', '[\"*\"]', NULL, NULL, '2025-09-20 21:17:46', '2025-09-20 21:17:46'),
(775, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7b182607248f0ccf5061a7523dba7fa43192cf0b859600b767d9bc3998c6a38b', '[\"*\"]', '2025-09-22 03:29:52', NULL, '2025-09-20 21:17:54', '2025-09-22 03:29:52'),
(776, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e340d476db1dad32fc3897f36e189ca7b2610cc7036b81f9b4e8085c3aae384b', '[\"*\"]', '2025-09-20 21:55:44', NULL, '2025-09-20 21:27:57', '2025-09-20 21:55:44'),
(777, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '172118abacc89ad6e6f3fe37c8b7ced56224afbd2733eda6956b6e91fabfa385', '[\"*\"]', '2025-09-20 22:22:38', NULL, '2025-09-20 22:22:34', '2025-09-20 22:22:38'),
(778, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ce9056544f188d3c32b1782cbff8ed2316bf37fed98ed939b129cbf5b6a41c4d', '[\"*\"]', '2025-09-20 23:08:32', NULL, '2025-09-20 22:25:34', '2025-09-20 23:08:32'),
(779, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '793a271bb627202797e59d23ef22329234040082abfb440b9ad245fcde364616', '[\"*\"]', '2025-09-20 23:17:31', NULL, '2025-09-20 23:08:50', '2025-09-20 23:17:31'),
(780, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5864b3f617b070fd5c7fdecac3abca6effb59bc69bbff28ed38d55d828f9430a', '[\"*\"]', '2025-09-20 23:33:45', NULL, '2025-09-20 23:19:59', '2025-09-20 23:33:45'),
(781, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd2b6c870e4a4b0d5bb564fcdad0981acb1bc0d48b91d7d106d14af8758e9d273', '[\"*\"]', '2025-09-20 23:46:16', NULL, '2025-09-20 23:35:23', '2025-09-20 23:46:16'),
(782, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8956e6cb66ded288f5362474fb463d813f6227c6e4ba2942808f6a6ed6310b54', '[\"*\"]', '2025-09-21 00:03:49', NULL, '2025-09-20 23:46:43', '2025-09-21 00:03:49'),
(783, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '92cb8f18555a43f439e0dc0bbe62147d0b3d86fe3bf692ba9ba543b846f6780a', '[\"*\"]', '2025-09-21 00:14:52', NULL, '2025-09-21 00:12:06', '2025-09-21 00:14:52'),
(784, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c68d143b066af0b607c98fe30e2a520cee289b46e5d72f8fbfda72d110dcbfe5', '[\"*\"]', '2025-09-21 00:26:12', NULL, '2025-09-21 00:15:57', '2025-09-21 00:26:12'),
(785, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '96411597337e662f76b4fb3f50800055091d1ac9c24fdd3c75f5a9421fab47ed', '[\"*\"]', '2025-09-21 00:27:53', NULL, '2025-09-21 00:26:49', '2025-09-21 00:27:53'),
(786, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c992e03a72071f556ce78e5ca19c9450c4775ad8143518fab99874d55f128203', '[\"*\"]', '2025-09-21 00:34:11', NULL, '2025-09-21 00:33:47', '2025-09-21 00:34:11'),
(787, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '18d7593163c8e5d6fcb3f7f4af5898f5c0600d01f6a901433baabc34496e6156', '[\"*\"]', '2025-09-21 00:41:54', NULL, '2025-09-21 00:39:59', '2025-09-21 00:41:54'),
(788, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fc02bda486ccff148f51238512a05afd716e57b29868e650ff9389b619069fa0', '[\"*\"]', '2025-09-21 00:55:34', NULL, '2025-09-21 00:52:03', '2025-09-21 00:55:34'),
(789, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0d86c462f62ca99db6a7e4bbbd0e840e131c6848ff243bbb0871e6e5c7f9d79b', '[\"*\"]', '2025-09-21 01:02:54', NULL, '2025-09-21 00:56:04', '2025-09-21 01:02:54'),
(790, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2c342dfdbf0366dcdd37be273b2b076a7b26f602b31a025eda4e232ade5f2e84', '[\"*\"]', '2025-09-21 01:41:26', NULL, '2025-09-21 01:13:37', '2025-09-21 01:41:26'),
(791, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a26450dd5fc941e4df79e4b0ab1202000fcd6050b67e7a956642ee3efef107e1', '[\"*\"]', '2025-09-21 01:50:47', NULL, '2025-09-21 01:50:38', '2025-09-21 01:50:47'),
(792, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0280d6c9546aac022483cd0c5f57212f4894c1860b5d34360664d6db86bb6715', '[\"*\"]', '2025-09-21 02:01:34', NULL, '2025-09-21 02:01:26', '2025-09-21 02:01:34'),
(793, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '65735a34623424e6777af6e1472c23f99c78214c093be517c6f989af77a01d35', '[\"*\"]', '2025-09-21 02:06:52', NULL, '2025-09-21 02:02:16', '2025-09-21 02:06:52'),
(794, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c2d620027f9d9e98daca956946c4c08dec52378de81fef553b5a90b9c0027ab5', '[\"*\"]', '2025-09-21 02:07:42', NULL, '2025-09-21 02:07:17', '2025-09-21 02:07:42'),
(795, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '71f2bf75e4acbb5bf6dfc083b68c1de71d24312f107307a5b15a37059e59374d', '[\"*\"]', '2025-09-21 02:28:29', NULL, '2025-09-21 02:08:38', '2025-09-21 02:28:29'),
(796, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5ec5d90a0790d16a97cc6b9fd4628ef73e5b536411251abb265c2df070ba8e7c', '[\"*\"]', '2025-09-21 02:42:23', NULL, '2025-09-21 02:32:27', '2025-09-21 02:42:23'),
(797, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ee5fc4b7faae78b7c8e38fa92950b7a46c29b4ad54c6b106499235215a4fd0cd', '[\"*\"]', '2025-09-21 03:00:51', NULL, '2025-09-21 02:45:32', '2025-09-21 03:00:51'),
(798, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f61dc7b5cda9aa43f1445cc9d2cacd6066486ffb85de39a7dd6d37646fa94bc', '[\"*\"]', '2025-09-21 03:02:06', NULL, '2025-09-21 03:01:53', '2025-09-21 03:02:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(799, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '909cbfd2db76e33240dca19fd84aa8aef3f92ba00fec409be18c0928b126a834', '[\"*\"]', '2025-09-21 03:10:36', NULL, '2025-09-21 03:08:40', '2025-09-21 03:10:36'),
(800, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '92a999c856be8cbc4300b31a7ffa221853aa32cd4617e90b5b78a843c802fcd4', '[\"*\"]', '2025-09-21 03:11:28', NULL, '2025-09-21 03:11:19', '2025-09-21 03:11:28'),
(801, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '26a24d74dc7f2f99a400b68c46f6068997e1d2dab091a9dd71cdf344d29fec70', '[\"*\"]', '2025-09-21 03:28:36', NULL, '2025-09-21 03:25:43', '2025-09-21 03:28:36'),
(803, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2b0c3a616f13377da57fb4ede16de4a8e4b031a88996a3dcad2f47f8e6c80183', '[\"*\"]', '2025-09-21 03:47:45', NULL, '2025-09-21 03:29:40', '2025-09-21 03:47:45'),
(804, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9299b3f98ed353c9c604a611913b55af2c8058223bd51851fcc973b53ee7a34f', '[\"*\"]', '2025-09-21 03:48:18', NULL, '2025-09-21 03:48:12', '2025-09-21 03:48:18'),
(805, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '02e0362f2485c9c0ef35ef8c1e0d98a5147f0567c5f639cf0e198de781d7df10', '[\"*\"]', '2025-09-21 03:49:03', NULL, '2025-09-21 03:48:40', '2025-09-21 03:49:03'),
(806, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3086efb37e9e2a4317d9b9d90b7a1d549a346756211befdf59424336afb02292', '[\"*\"]', '2025-09-21 03:49:59', NULL, '2025-09-21 03:49:16', '2025-09-21 03:49:59'),
(807, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '42d1c0a99847f35c7b20c2ee6e88d9af6e3159be6c6cf842ca88ed255081593d', '[\"*\"]', '2025-09-21 03:51:46', NULL, '2025-09-21 03:51:34', '2025-09-21 03:51:46'),
(808, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dfe676242766c26d2d91210e99988503d4e2e4c62deffc30e508900d3769219b', '[\"*\"]', '2025-09-21 03:52:22', NULL, '2025-09-21 03:52:06', '2025-09-21 03:52:22'),
(809, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd689e103b8ad8b93ce622eb92647e544e8b628354562df674e4193fef9ee4e9f', '[\"*\"]', '2025-09-21 03:57:53', NULL, '2025-09-21 03:53:27', '2025-09-21 03:57:53'),
(810, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd98f7990e615125c652570e8d37eab109ce98a769f501975dfab6e780271e5ae', '[\"*\"]', '2025-09-21 04:29:41', NULL, '2025-09-21 04:00:51', '2025-09-21 04:29:41'),
(811, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '991a4260739cbcd7c3b2782538e96d9578fd3f23ace630fd8288ba10df3615db', '[\"*\"]', '2025-09-21 04:30:31', NULL, '2025-09-21 04:30:20', '2025-09-21 04:30:31'),
(812, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '879dbf22ab331f66e855a855fbf33709a44c34dc0584c7e12ddb339639f83a60', '[\"*\"]', '2025-09-21 04:34:35', NULL, '2025-09-21 04:31:52', '2025-09-21 04:34:35'),
(813, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '25cdd9b23e5ea28483658aea264bb47ecbd7e4f641691f72fe26825b22d154f7', '[\"*\"]', '2025-09-21 04:37:04', NULL, '2025-09-21 04:36:32', '2025-09-21 04:37:04'),
(814, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '35532606f685c38eba67e54030720b8ec67824c1433d856480ac8441ca0e5f46', '[\"*\"]', '2025-09-21 04:52:33', NULL, '2025-09-21 04:41:46', '2025-09-21 04:52:33'),
(815, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a74a8de4df397944df4cdd07aab374a41bdce7517b4c165e9fa4a462f722b639', '[\"*\"]', '2025-09-21 04:54:06', NULL, '2025-09-21 04:53:56', '2025-09-21 04:54:06'),
(816, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '59e88e46e81db98248cda014f71f2fb89506ed5d98f22fb04fcf91f5f7d04b42', '[\"*\"]', '2025-09-21 05:10:39', NULL, '2025-09-21 05:09:53', '2025-09-21 05:10:39'),
(817, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '82eae19cf7e9a77031e5cb263a0cf0e6401983c663d8faf66351feb4df75d9bf', '[\"*\"]', '2025-09-21 07:24:06', NULL, '2025-09-21 07:22:09', '2025-09-21 07:24:06'),
(818, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1f3dc0f6acd36edbfa2f041a1e104f3fd1201b587fdb05c4a5d336880f06e5bb', '[\"*\"]', '2025-09-21 07:33:05', NULL, '2025-09-21 07:32:52', '2025-09-21 07:33:05'),
(819, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '83c835e35e1fab7c0f61564cd00bb1eeb861a2a1d5990ab8ddab54ab61fe1d66', '[\"*\"]', '2025-09-21 07:36:32', NULL, '2025-09-21 07:36:19', '2025-09-21 07:36:32'),
(820, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '59ec51e3b0287a059fb2477e1a439af579d4f37d8e75b26a85b758bcde143f53', '[\"*\"]', '2025-09-21 07:48:16', NULL, '2025-09-21 07:43:46', '2025-09-21 07:48:16'),
(821, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '110b8b64d0d841011eb17452074f8397151e35e2c337378f5ad6f97efbb5d8ab', '[\"*\"]', '2025-09-21 08:12:05', NULL, '2025-09-21 07:59:35', '2025-09-21 08:12:05'),
(822, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9eaca90e57d9fee4b957d8d8a5a5d0fdec57593e9c676d2e97d977856d824f77', '[\"*\"]', '2025-09-21 08:16:16', NULL, '2025-09-21 08:14:26', '2025-09-21 08:16:16'),
(823, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '28e444bfff202721cf3c9cdcffa970df62097bf29e1712003fe5860b905941e7', '[\"*\"]', '2025-09-21 08:19:06', NULL, '2025-09-21 08:18:15', '2025-09-21 08:19:06'),
(824, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0344481cce22fc3b9507bd8cfca9d377edf34babde5523fbb3766dae8c7b141a', '[\"*\"]', '2025-09-21 08:23:44', NULL, '2025-09-21 08:22:50', '2025-09-21 08:23:44'),
(825, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '68113f6c65e0a1d82e7bc294fe737918edd8f5668f96ba80bc2323c52ef57099', '[\"*\"]', '2025-09-21 08:32:53', NULL, '2025-09-21 08:32:00', '2025-09-21 08:32:53'),
(826, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2d001bbd7b97c4a991331efaa4c9492b21ecfe8f85a4d575cfed0d07da0be650', '[\"*\"]', '2025-09-21 08:56:31', NULL, '2025-09-21 08:36:50', '2025-09-21 08:56:31'),
(827, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a05128c77ac550b7dece48c4305b2ac88858978535dfbea796dc03f4b464e5e8', '[\"*\"]', '2025-09-21 09:06:08', NULL, '2025-09-21 09:05:32', '2025-09-21 09:06:08'),
(828, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '10aa2283c675cd688c20f503c52c52e774dae13a9e11261967e2a56e2c24062f', '[\"*\"]', '2025-09-21 22:00:16', NULL, '2025-09-21 20:57:33', '2025-09-21 22:00:16'),
(829, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0b0aaa6652348e3a7341cc93c151040d9356f017cacfe9cf255ac9708031a5f3', '[\"*\"]', '2025-09-21 22:07:07', NULL, '2025-09-21 22:06:48', '2025-09-21 22:07:07'),
(830, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c9eb5c53cc6c2168f9d92316e2999b2e6e80186f28c025c22248aaf7f108f09b', '[\"*\"]', '2025-09-21 22:47:59', NULL, '2025-09-21 22:28:37', '2025-09-21 22:47:59'),
(831, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bb4aa9cb81c06a3e14f35a450ec5a0b6f78c615898cdea2da5e1ec4c70c854a1', '[\"*\"]', '2025-09-21 23:28:24', NULL, '2025-09-21 22:48:40', '2025-09-21 23:28:24'),
(832, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eb59c7e06e08efadea121a1f58642845a5ef606f7f041c2df25ff89600fb33f4', '[\"*\"]', '2025-09-21 23:31:51', NULL, '2025-09-21 23:29:30', '2025-09-21 23:31:51'),
(833, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd6a5489b7bd126fb93e5c7e4ab3252b12fb040c740c4c587ad73d8f0d8c9799e', '[\"*\"]', '2025-09-22 00:15:56', NULL, '2025-09-21 23:33:53', '2025-09-22 00:15:56'),
(834, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0cf427a776acb20b229aee12411bc327add8d6ec5f579d7fa2cb42d9ca84aa0e', '[\"*\"]', '2025-09-22 00:37:38', NULL, '2025-09-22 00:24:10', '2025-09-22 00:37:38'),
(835, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd7dc8b4e2cc665d2dc3b2cd73d92a3b2a334aa738d35f5056798d951ad7548a0', '[\"*\"]', '2025-09-22 01:04:22', NULL, '2025-09-22 00:39:35', '2025-09-22 01:04:22'),
(836, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '121ba3464195e72e7e72cbf11334aa6045e28f6ec0ea1508711fb3da223ec7a4', '[\"*\"]', '2025-09-22 01:05:03', NULL, '2025-09-22 01:04:35', '2025-09-22 01:05:03'),
(837, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bbd1efcd50eae2639bc1a2648b73e8b5d76880f6e4e9399583f9ae4c014d801e', '[\"*\"]', '2025-09-22 01:07:43', NULL, '2025-09-22 01:07:37', '2025-09-22 01:07:43'),
(838, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3a87151f10dfd0ec59d1703e4e4671152b1e501060f4f94cd2eb5b73213e17f2', '[\"*\"]', '2025-09-22 01:35:34', NULL, '2025-09-22 01:09:53', '2025-09-22 01:35:34'),
(839, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3afb678c459ebd28c4fa20fec2a6d201582dc0941d26794a02dc67d92562489a', '[\"*\"]', '2025-09-22 02:03:18', NULL, '2025-09-22 01:43:01', '2025-09-22 02:03:18'),
(840, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2e1133b4d504c7be3b8a0691c5f10cdbdefa726a9b3f4a8e4ee8d981a80d3a6b', '[\"*\"]', '2025-09-22 02:21:05', NULL, '2025-09-22 02:06:45', '2025-09-22 02:21:05'),
(841, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6d2289441d68cb50caab3d70b01f6efc740f6a0c9bbdaee5cdd96a22207fd9eb', '[\"*\"]', '2025-09-22 02:46:11', NULL, '2025-09-22 02:21:44', '2025-09-22 02:46:11'),
(843, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '57d57640ac374120d0ee522bfe93a266f40642cf5481e9a06a7c24d91b37786e', '[\"*\"]', '2025-09-22 02:49:39', NULL, '2025-09-22 02:48:17', '2025-09-22 02:49:39'),
(844, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bdeb9b0589219870454c7966c162d8171647196321df9d9663d0ab5c742293d4', '[\"*\"]', '2025-09-22 02:54:24', NULL, '2025-09-22 02:54:24', '2025-09-22 02:54:24'),
(845, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '459fda2238413114cc83f0245cd307a028e1ceb52fc4745c3506a5f72acd3fcb', '[\"*\"]', '2025-09-22 03:27:15', NULL, '2025-09-22 03:27:14', '2025-09-22 03:27:15'),
(846, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '236a52e724c51566c823c95c65481f09cc9e34011a185af60612f5d21ddfeea9', '[\"*\"]', '2025-09-22 03:28:33', NULL, '2025-09-22 03:28:12', '2025-09-22 03:28:33'),
(847, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1bcecfe67fa22adc7f18bf169eaaf45893d2c57ff073aa5d994786843b1bbb83', '[\"*\"]', '2025-09-22 03:34:42', NULL, '2025-09-22 03:29:06', '2025-09-22 03:34:42'),
(850, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '93c3fe1735e381c6df40b81b5e77451a13217483c44630f258b75ca941f1b20d', '[\"*\"]', '2025-09-22 04:36:59', NULL, '2025-09-22 04:05:59', '2025-09-22 04:36:59'),
(851, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '099272735a9d723fc404f683a5c26603580323b6d524fea367e438caa5610d28', '[\"*\"]', '2025-09-22 04:38:03', NULL, '2025-09-22 04:37:59', '2025-09-22 04:38:03'),
(852, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7047f0ad53f0a434598d74006af2376c932386609343c9def1e92f8ab7e4c981', '[\"*\"]', '2025-09-22 04:58:23', NULL, '2025-09-22 04:57:37', '2025-09-22 04:58:23'),
(853, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '217806064c7b17d69f43a72da5b7cb730daed828f8bf913c6a08dbcfb723c3e6', '[\"*\"]', '2025-09-22 05:08:07', NULL, '2025-09-22 05:08:01', '2025-09-22 05:08:07'),
(854, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '512b2ff3b8ab698b8428ab7757ff2b927381e3de90fef3a254c8d69cc1cd7095', '[\"*\"]', '2025-09-22 05:26:57', NULL, '2025-09-22 05:20:30', '2025-09-22 05:26:57'),
(855, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0c5d5477336a983a31847667d2c7a6af1f13fdeade5c5b4843d683a5ef09a7cf', '[\"*\"]', '2025-09-22 05:29:03', NULL, '2025-09-22 05:27:29', '2025-09-22 05:29:03'),
(856, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3126725b99ff44451bda97a7da416fe66f4d82fdcc9a255e114f01c86299919d', '[\"*\"]', '2025-09-22 05:31:36', NULL, '2025-09-22 05:31:30', '2025-09-22 05:31:36'),
(857, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e0911259a686a32221443ce060fbddda3fd1c9e28e2ed85d189d6f7bc242e6b5', '[\"*\"]', '2025-09-25 08:09:45', NULL, '2025-09-22 07:37:51', '2025-09-25 08:09:45'),
(858, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '35b1a104d310613abae4136343eb1755c24b8ebe02d55d48150b422de9046682', '[\"*\"]', '2025-09-22 07:46:23', NULL, '2025-09-22 07:42:00', '2025-09-22 07:46:23'),
(859, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3672c2290159f4d63713666ebb4fac4d6eb8cfe99381954e10ec3d085b7894db', '[\"*\"]', '2025-09-22 08:12:09', NULL, '2025-09-22 08:09:23', '2025-09-22 08:12:09'),
(860, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b5dd408f077c563df06fca4a0c2eaab4138052252df328febea6186571557de1', '[\"*\"]', '2025-09-22 08:16:05', NULL, '2025-09-22 08:13:03', '2025-09-22 08:16:05'),
(861, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '868b9e88ba6b2e32fac84880625a6e124746df53002ac3e508169f3110916f06', '[\"*\"]', '2025-09-22 09:21:11', NULL, '2025-09-22 09:20:34', '2025-09-22 09:21:11'),
(862, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5d6442746369437471e340b2901e50f1102abde86fd6869f53928c7f8db4fed8', '[\"*\"]', '2025-09-22 09:25:42', NULL, '2025-09-22 09:21:42', '2025-09-22 09:25:42'),
(863, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fbee6b336c63dff2465cc1e53bd3573debb2c5f5337d1866342adfc7dbbef37b', '[\"*\"]', NULL, NULL, '2025-09-22 20:49:30', '2025-09-22 20:49:30'),
(864, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '369278ba5b7f4a2ad284e1e71d2a99422baa44a6890d650a7dcc886e07b5fcbf', '[\"*\"]', '2025-09-22 20:57:28', NULL, '2025-09-22 20:50:49', '2025-09-22 20:57:28'),
(865, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8887aa1449917e2651be3616ada1a9bdfa32919ee69faad0c3617b62a8bba31d', '[\"*\"]', '2025-09-23 21:10:41', NULL, '2025-09-22 20:58:03', '2025-09-23 21:10:41'),
(866, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '553eb5a2ee8a1bf83f301b2043adbeff77f9c836dd5a0a95ad261d1a320d186c', '[\"*\"]', '2025-09-22 23:15:11', NULL, '2025-09-22 23:14:14', '2025-09-22 23:15:11'),
(867, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9788c3c97902f06c3dfe7193d5959465c92685aaa18bcd2dd7c2eccfe27f8396', '[\"*\"]', '2025-09-22 23:34:54', NULL, '2025-09-22 23:34:47', '2025-09-22 23:34:54'),
(868, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '30d44b474e48eeaba54f11c16e2ca079affde38ae0e7456ad70c821223c22f21', '[\"*\"]', '2025-09-22 23:39:10', NULL, '2025-09-22 23:37:43', '2025-09-22 23:39:10'),
(869, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '21712cf070c2ec534f8dc865b820d02e6e0f3cc38ff7b48979339a528a679863', '[\"*\"]', '2025-09-23 00:25:51', NULL, '2025-09-22 23:42:21', '2025-09-23 00:25:51'),
(870, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2390c8b3c03075b472a7d1ddab6a82c1111cfec27f50e56ae62f81677f45ef46', '[\"*\"]', '2025-09-23 00:30:43', NULL, '2025-09-23 00:26:25', '2025-09-23 00:30:43'),
(871, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6f91eaa5ea5af700dcaf826bce51765e64fce53056daa7e7a5265955e8d5efcb', '[\"*\"]', '2025-09-23 00:31:48', NULL, '2025-09-23 00:31:03', '2025-09-23 00:31:48'),
(872, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '798247e318cfea4da58d0f232ac274b99f5d927a4f7441b2b0a859b8b466eb4e', '[\"*\"]', '2025-09-23 00:37:30', NULL, '2025-09-23 00:36:17', '2025-09-23 00:37:30'),
(873, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ebacada778b581e20a2c40ec8af1f4912395f082787a4142682c95cc335d5623', '[\"*\"]', '2025-09-23 00:50:33', NULL, '2025-09-23 00:40:05', '2025-09-23 00:50:33'),
(874, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7839e11472858927acd14c7c935aac571c06b6a7ba221359539ebb2d6ed65e01', '[\"*\"]', '2025-09-23 00:52:51', NULL, '2025-09-23 00:52:48', '2025-09-23 00:52:51'),
(875, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '467c30414090a8cbffa656eaaa2562236c4e9ae1cf349b7b0f713e4a3f49e7fe', '[\"*\"]', '2025-09-23 01:13:53', NULL, '2025-09-23 00:55:27', '2025-09-23 01:13:53'),
(876, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '051cbab3ee2bcc9a4fd9f52ec48ea595f9bcc1139ae7cd5c9c77f4a2dda40d31', '[\"*\"]', '2025-09-23 01:16:44', NULL, '2025-09-23 01:14:58', '2025-09-23 01:16:44'),
(877, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '83816201681b5f212bd5f1d9b38101b8280ee4ed28da9b8a59f14315bf093844', '[\"*\"]', '2025-09-23 01:30:17', NULL, '2025-09-23 01:19:35', '2025-09-23 01:30:17'),
(878, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '96d807b18282a88850a7452fba0ce643f8207d196faf3d313980365943e1bbed', '[\"*\"]', '2025-09-23 02:59:59', NULL, '2025-09-23 01:32:41', '2025-09-23 02:59:59'),
(879, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '66ef2c601aefef9b620755ea602d87a492180fe9f5ce3011ebfcf3385d73d240', '[\"*\"]', '2025-09-23 03:54:47', NULL, '2025-09-23 03:10:42', '2025-09-23 03:54:47'),
(880, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0ceadd3a2cfb28bdc5e6fe5afab77e91c3b1ce9ed47d6d3b716ce56a6cc6bace', '[\"*\"]', '2025-09-23 04:05:30', NULL, '2025-09-23 03:55:53', '2025-09-23 04:05:30'),
(881, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '870caaf484c75b72854ad72b3cfc00788745da1aba83afdd3fae07d0dd1191ac', '[\"*\"]', '2025-09-23 04:18:40', NULL, '2025-09-23 04:09:12', '2025-09-23 04:18:40'),
(882, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5608283ae4c8832ecb938482e7738acce8f4ae08d0d3741e7112f3055f31cbe8', '[\"*\"]', '2025-09-23 04:31:25', NULL, '2025-09-23 04:30:59', '2025-09-23 04:31:25'),
(883, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '32008d89203a3fc3f1b90d4744d6dff7f031ad545e7cf0a4d978b2c7c6aafcb0', '[\"*\"]', '2025-09-23 04:44:26', NULL, '2025-09-23 04:36:16', '2025-09-23 04:44:26'),
(884, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bb466836fbf609542a6a0bd982cf13a3c3792d86adbe51bf346350494a1ea08c', '[\"*\"]', '2025-09-23 04:51:38', NULL, '2025-09-23 04:47:15', '2025-09-23 04:51:38'),
(885, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd8cf165262b071a79981f2449bc6dd9fe19f98b264707bc0fee273a030bc3cca', '[\"*\"]', '2025-09-23 05:13:52', NULL, '2025-09-23 04:59:51', '2025-09-23 05:13:52'),
(886, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7b0bf0de968d54def11f97c6d54d7a61ed4ad2b7b311e8933214b16ee9be1c0f', '[\"*\"]', '2025-09-23 05:21:54', NULL, '2025-09-23 05:19:26', '2025-09-23 05:21:54'),
(887, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '03ab4cca1f3ded6a3f5991ba76433352fbf1db4984f0cbe2c160e64e68585dd0', '[\"*\"]', '2025-09-23 07:54:25', NULL, '2025-09-23 07:39:54', '2025-09-23 07:54:25'),
(888, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3807acc2ed6401bb4fd898aed4b95a170bf6f879c69ba880ea2757655aa5ad13', '[\"*\"]', '2025-09-23 08:29:15', NULL, '2025-09-23 08:04:58', '2025-09-23 08:29:15'),
(889, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7a8557fc1b8302179146ea3c8ea1077e867e049b4a2b873727d329ce4e5daf85', '[\"*\"]', '2025-09-23 09:04:45', NULL, '2025-09-23 08:30:36', '2025-09-23 09:04:45'),
(890, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eaaf9ace8810c5f485db10b113989d8fda4b3f557972877535506b5a9c3e8fdf', '[\"*\"]', '2025-09-23 09:20:22', NULL, '2025-09-23 09:07:21', '2025-09-23 09:20:22'),
(891, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cf51ecb2be3cf104d027f1a0e11afe79dd36cdcb0bd6ea6897305358d4af7404', '[\"*\"]', '2025-09-23 09:22:01', NULL, '2025-09-23 09:21:08', '2025-09-23 09:22:01'),
(892, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '202f8c8edeca03fe09550fee030c8811bab7ec01ad8a5c18694fd90c37415f8d', '[\"*\"]', '2025-09-23 20:57:40', NULL, '2025-09-23 20:45:33', '2025-09-23 20:57:40'),
(894, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cdb7b209cbe793ef5749e9aeb11cbf9f47c893937256f5c3b00620c113967713', '[\"*\"]', '2025-09-23 21:14:21', NULL, '2025-09-23 20:58:32', '2025-09-23 21:14:21'),
(895, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd2c59c208f1c039d4480efbef99b0aaef76c0e61d58c3d79633b2e3e6e418be3', '[\"*\"]', '2025-09-23 21:56:10', NULL, '2025-09-23 21:23:05', '2025-09-23 21:56:10'),
(896, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f3845f81566ba5017a633b762f69828d6c54d7d00589c69ccea65609abc082a1', '[\"*\"]', '2025-09-23 21:59:36', NULL, '2025-09-23 21:58:01', '2025-09-23 21:59:36'),
(897, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b3be9636d3b1c33fca790a6e36647fb343fcb722c153bdefc164673e56f3ddb7', '[\"*\"]', '2025-09-23 22:11:39', NULL, '2025-09-23 22:00:04', '2025-09-23 22:11:39'),
(898, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c0542793fa4257af4a98c253c832f34cfcae33f220796024350433fcc792c603', '[\"*\"]', '2025-09-23 22:41:30', NULL, '2025-09-23 22:01:54', '2025-09-23 22:41:30'),
(899, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f8661d7d2040d6d4e7bff40414a0851ad0151e30ea19514a3fd189b6e9c2c618', '[\"*\"]', '2025-09-23 22:13:01', NULL, '2025-09-23 22:12:17', '2025-09-23 22:13:01'),
(900, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1e5172baa1cb31ae0dce6465b72e6ffc8eb24c6c52d0d45be2625b90e3a6c96e', '[\"*\"]', '2025-09-23 23:26:06', NULL, '2025-09-23 22:40:06', '2025-09-23 23:26:06'),
(901, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '10df5097538284c81e3851ff7b73cfd11c9b3f203fcb68adb932715c7f54af6f', '[\"*\"]', '2025-09-23 22:53:25', NULL, '2025-09-23 22:41:36', '2025-09-23 22:53:25'),
(902, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ea607f386d92bd45c953c90d0a167081bf6222a6eaed1b95e9b8ea2b49ab4f67', '[\"*\"]', '2025-09-24 20:51:03', NULL, '2025-09-23 22:53:41', '2025-09-24 20:51:03'),
(903, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fd26c0f4bfc82d42ba37980b55dbbdfe58de7801b84777a8aa3b15602b35b236', '[\"*\"]', '2025-09-23 23:29:23', NULL, '2025-09-23 23:26:18', '2025-09-23 23:29:23'),
(904, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eb185d1250db2e75f541453ec1d9737a10d85a4b6a04292c66dce4d4befa1702', '[\"*\"]', '2025-09-23 23:39:23', NULL, '2025-09-23 23:36:56', '2025-09-23 23:39:23'),
(905, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ddf82d91f4cc95868e995244dba11e4d9c9c118360cf77aeab50784950c37ee2', '[\"*\"]', '2025-09-23 23:44:17', NULL, '2025-09-23 23:40:10', '2025-09-23 23:44:17'),
(906, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '179e286bd508279ab22ad0302c9ca91889ec39ff0142e49e6400b05c71d763a7', '[\"*\"]', '2025-09-24 00:11:06', NULL, '2025-09-23 23:44:35', '2025-09-24 00:11:06'),
(907, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ba763901b0823744a9811442ea765d60aeddd2a1c44a7d8eb629595cac95d30c', '[\"*\"]', '2025-09-24 00:18:58', NULL, '2025-09-24 00:11:27', '2025-09-24 00:18:58'),
(908, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '108de9b33b3d03878ea39c28fae197976898babbfdf6c525484f473ba9042c5f', '[\"*\"]', '2025-09-24 00:43:30', NULL, '2025-09-24 00:20:01', '2025-09-24 00:43:30'),
(909, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '007f5059e83965499ccc83250d35fb95ebd8863f7e0ce0bed29559a47177c180', '[\"*\"]', '2025-09-24 00:51:58', NULL, '2025-09-24 00:51:08', '2025-09-24 00:51:58'),
(910, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd1bc778cb02c2f3943f869ead6ebec312190272b25b6a636d4f71885fd3e0cdd', '[\"*\"]', '2025-09-24 00:53:07', NULL, '2025-09-24 00:52:34', '2025-09-24 00:53:07'),
(911, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f38b41326119f8fdf53a0561d31f7038432eefe8c751291ee546b5a21ac08e38', '[\"*\"]', '2025-09-24 01:08:45', NULL, '2025-09-24 01:00:08', '2025-09-24 01:08:45'),
(912, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '84359f1fcbd607de8a52e489745ba4821ddcfd05f3658a44bbd70d59a778bdd4', '[\"*\"]', '2025-09-24 01:12:35', NULL, '2025-09-24 01:12:14', '2025-09-24 01:12:35'),
(913, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '20adf5b9de5b4b23e40ca8a89c86a223e6b8939fbbd1a3b55a20a42fadb4e1f2', '[\"*\"]', '2025-09-24 01:57:37', NULL, '2025-09-24 01:13:21', '2025-09-24 01:57:37'),
(914, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dde9662a4e8c8952f90ec444eff0ab6c59cf10b4456c031b4efb9a847d4b1dc0', '[\"*\"]', '2025-09-24 02:02:50', NULL, '2025-09-24 01:58:02', '2025-09-24 02:02:50'),
(915, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '93c1293ec4da2de91f7b5e6c9f00fc0a634c5be998feb6749cf5e929d6684d75', '[\"*\"]', '2025-09-24 02:03:22', NULL, '2025-09-24 02:03:06', '2025-09-24 02:03:22'),
(916, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cc0918ed6d9a099bc8ae04746e301911e9726cde27bd67d97590024aa8fdc185', '[\"*\"]', '2025-09-24 02:12:36', NULL, '2025-09-24 02:12:18', '2025-09-24 02:12:36'),
(917, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9d028efb3b4d9fcbaa5f8a723eb2499c208998f0a0c29d19dfaf8acf408c2769', '[\"*\"]', '2025-09-24 02:14:42', NULL, '2025-09-24 02:13:25', '2025-09-24 02:14:42'),
(918, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c077a9e7a8aeca2deb9662077d60f6f1c2354f94df528a3b4d5b884cbe8523e6', '[\"*\"]', '2025-09-24 02:16:07', NULL, '2025-09-24 02:15:16', '2025-09-24 02:16:07'),
(919, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ea351eef09b9614e95990b7a4abb5737ccb6f98f60ce1212922377f677671526', '[\"*\"]', '2025-09-24 02:18:28', NULL, '2025-09-24 02:16:37', '2025-09-24 02:18:28'),
(920, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f3d66a2449784e54c78b7b6a35195f37659ff0865d7765ea50a7f6345032edd1', '[\"*\"]', '2025-09-24 02:29:28', NULL, '2025-09-24 02:21:53', '2025-09-24 02:29:28'),
(921, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '15e0f909541f723a8ba4c8e8ff3f7197a878cba2166d54c6a9a27aa7d3db751a', '[\"*\"]', '2025-09-24 02:31:45', NULL, '2025-09-24 02:29:42', '2025-09-24 02:31:45'),
(922, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '19a6009c3de94278c5cc92c47e8771998732e8846d59b20367ada30fd4819871', '[\"*\"]', '2025-09-24 02:33:57', NULL, '2025-09-24 02:33:54', '2025-09-24 02:33:57'),
(923, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '27d1cc1ab7daa3ef904a71e2dda71c48d532f54ae069bed6743e95bd31a9d647', '[\"*\"]', '2025-09-24 02:43:09', NULL, '2025-09-24 02:35:19', '2025-09-24 02:43:09'),
(924, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bcb69dbf124a77e5189020ddd7888a91901e5a92b6259bb724f163b3953ff4e2', '[\"*\"]', '2025-09-24 02:50:39', NULL, '2025-09-24 02:50:33', '2025-09-24 02:50:39'),
(925, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1e695a9f950fcc7ab8c3a76717a7651672ba58f751ca2ecd8fcb0002034f8ea6', '[\"*\"]', '2025-09-24 02:54:54', NULL, '2025-09-24 02:52:56', '2025-09-24 02:54:54'),
(926, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '40e10515e83587a04e9e7fb9032773eb48908e6a13e3745aef5dfa4b12a59ac7', '[\"*\"]', '2025-09-24 03:05:01', NULL, '2025-09-24 03:00:51', '2025-09-24 03:05:01'),
(927, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9a4f0c43c99b6c49429fbcf0e2ff758c9a393319ba4479640453a3116cc6ca77', '[\"*\"]', '2025-09-24 03:11:34', NULL, '2025-09-24 03:11:24', '2025-09-24 03:11:34'),
(928, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '606bfa7fcbe858940fa7f7b1c1086b642c9b0100b806d7acb492e22a6759ca5b', '[\"*\"]', '2025-09-24 04:02:42', NULL, '2025-09-24 03:13:24', '2025-09-24 04:02:42'),
(929, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '52ae0ebb1e1c1b7bd4f5483b34bccd09a36e0fe1a8657558d5fc8d512946489f', '[\"*\"]', '2025-09-24 04:11:55', NULL, '2025-09-24 04:11:39', '2025-09-24 04:11:55'),
(930, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f5c77840d3293b928d4957a39d814232dfbfc55ff0823880341f7e6124baf196', '[\"*\"]', '2025-09-24 04:13:18', NULL, '2025-09-24 04:12:58', '2025-09-24 04:13:18'),
(931, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '041ee2b707f988b71a23c33a98b2d86247930a108369a505c759849073f42cb1', '[\"*\"]', '2025-09-24 04:27:03', NULL, '2025-09-24 04:17:53', '2025-09-24 04:27:03'),
(932, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '09c016eefc1a3e6034d5abfd71a0adc17592a7f8b25f9e66e3b377acbe7eaec2', '[\"*\"]', NULL, NULL, '2025-09-24 04:45:59', '2025-09-24 04:45:59'),
(933, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0cf77383563d80b984481fc671d01a51a07fccc13648d6d26b285a14c0709846', '[\"*\"]', '2025-09-24 04:51:04', NULL, '2025-09-24 04:50:46', '2025-09-24 04:51:04'),
(934, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fce48ee2590b67e400a7dcfddf125b39fcf5b043c9ee343bb0dc0d327e6705f9', '[\"*\"]', '2025-09-24 05:00:21', NULL, '2025-09-24 05:00:18', '2025-09-24 05:00:21'),
(935, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '32a00a428a9b247cb661c739c498f05617bbb02a2e0aaf94d9ffbd65dc8163b3', '[\"*\"]', '2025-09-24 05:19:57', NULL, '2025-09-24 05:19:22', '2025-09-24 05:19:57'),
(936, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ae49e2097aac1af7c4fae81e3c3c67885457ee419d0376b6ba6099343c1f054c', '[\"*\"]', '2025-09-24 08:40:46', NULL, '2025-09-24 08:01:58', '2025-09-24 08:40:46'),
(937, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0a1f804df48a3e00dd18909b606178a5615bca6aec57264a9a73e35e58798d11', '[\"*\"]', '2025-09-24 08:59:25', NULL, '2025-09-24 08:56:20', '2025-09-24 08:59:25'),
(938, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '45d3ee768c3440bc7027fc258421993011e9d5c797a3d5c2beaa8ae3de1e45a6', '[\"*\"]', '2025-09-24 09:01:37', NULL, '2025-09-24 09:00:27', '2025-09-24 09:01:37'),
(939, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0e20c9378c25414b36efaaedb827e678c09e9da7ab787b61fa10b73640b018d3', '[\"*\"]', '2025-09-24 20:54:53', NULL, '2025-09-24 20:48:47', '2025-09-24 20:54:53'),
(940, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9a1b7e715ba317053364c3435898fe702ae26ba980e66cff334dfd4053931dea', '[\"*\"]', '2025-09-26 21:06:40', NULL, '2025-09-24 20:51:16', '2025-09-26 21:06:40'),
(941, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e0c3d8cd7529642ecd5d09df2f9f7c8082661d59a4712a74c90699ae5e1992f5', '[\"*\"]', '2025-09-24 21:08:13', NULL, '2025-09-24 21:06:31', '2025-09-24 21:08:13'),
(942, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cafe616e6b85f860d25d46766f09b54bef7040adcb6b49a143e830deb07feb9c', '[\"*\"]', '2025-09-24 21:30:19', NULL, '2025-09-24 21:08:36', '2025-09-24 21:30:19'),
(943, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4d513e48fe01abff33666f99fb575bff13beefd842b5ff5e148208fdbf763e0d', '[\"*\"]', '2025-09-24 22:00:16', NULL, '2025-09-24 21:39:23', '2025-09-24 22:00:16'),
(944, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '860c51400968b9f4ef85837a57e55850835e9c5e2476b42b3dedf54adaefd11c', '[\"*\"]', '2025-09-24 22:11:07', NULL, '2025-09-24 22:07:39', '2025-09-24 22:11:07'),
(945, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4be661e5eea4e8fde8df6d486c69195db387081c3d3c3f9b72c301f784a70770', '[\"*\"]', '2025-09-24 22:26:20', NULL, '2025-09-24 22:13:31', '2025-09-24 22:26:20'),
(946, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '25939ced028a29d1229c490e3322971d55b6f8d6bb3b1a9ab6e5c6cd312085f8', '[\"*\"]', '2025-09-24 22:34:34', NULL, '2025-09-24 22:34:28', '2025-09-24 22:34:34'),
(947, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dab203aeb7c8970f032445384de788cdcbf6703ccaed66278cd1f2ab16508075', '[\"*\"]', '2025-09-24 23:08:06', NULL, '2025-09-24 22:37:23', '2025-09-24 23:08:06'),
(948, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a121058900a14c3188b2636f258cc5d136018987d9108941d4fa79899e965b4d', '[\"*\"]', '2025-09-24 23:23:42', NULL, '2025-09-24 23:20:05', '2025-09-24 23:23:42'),
(949, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '30e2ec14d4740a6df169519b4cfae21df77c379f4b29c55d98e3429436d8404d', '[\"*\"]', '2025-09-24 23:38:11', NULL, '2025-09-24 23:36:41', '2025-09-24 23:38:11'),
(950, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ea96518b47d02bf48d8905019bd32dafbb8fa057b700a42a86dd7b90dc974148', '[\"*\"]', '2025-09-24 23:55:07', NULL, '2025-09-24 23:38:38', '2025-09-24 23:55:07'),
(951, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f0fc907d0b6f6514c80a5c22d72da3cb9959c70659c47a8027682ab3b42b88af', '[\"*\"]', '2025-09-25 00:07:28', NULL, '2025-09-25 00:01:11', '2025-09-25 00:07:28'),
(952, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6e78b3980b4f5e6ae030353f062553440999214f84a405137dbfac527ba22109', '[\"*\"]', '2025-09-25 00:44:12', NULL, '2025-09-25 00:12:47', '2025-09-25 00:44:12'),
(953, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '88e87d28b5bb71fd43a221f233ac34dab5e4731a2aa41cec05da9ecfd9914afe', '[\"*\"]', '2025-09-25 01:00:25', NULL, '2025-09-25 01:00:05', '2025-09-25 01:00:25'),
(954, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '77a2da179e0ab9faa0d489245d7c17b3baa0c21772731dd91269add3fe78ef33', '[\"*\"]', '2025-09-25 01:08:43', NULL, '2025-09-25 01:02:10', '2025-09-25 01:08:43'),
(955, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'afb97d4b2514f8737b3eb5c70b418576579246aa9c0e429cca8ffe9532b3c91e', '[\"*\"]', '2025-09-25 01:09:41', NULL, '2025-09-25 01:08:55', '2025-09-25 01:09:41'),
(956, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6a6f8e28ebf47a76e44e471d937da6a0c3eba753957743c7b281190d4548c967', '[\"*\"]', '2025-09-25 01:42:18', NULL, '2025-09-25 01:14:49', '2025-09-25 01:42:18'),
(957, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd0db5223169553b30bab975ab42504dfb7df161f4332fb841ba0943819d2339f', '[\"*\"]', '2025-09-25 01:57:52', NULL, '2025-09-25 01:42:32', '2025-09-25 01:57:52'),
(958, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0c3052d6c92006bdccaecd4642a2df7153e42ba9ca726228aecfa7b72c787d4a', '[\"*\"]', '2025-09-25 02:14:17', NULL, '2025-09-25 01:58:25', '2025-09-25 02:14:17'),
(959, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b65daceea74a4e11211a34cd1afa7fbdfe793160b9340c1d972a779a6558029d', '[\"*\"]', '2025-09-25 02:19:22', NULL, '2025-09-25 02:19:04', '2025-09-25 02:19:22'),
(960, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '37958f0574afa8f93060326050a2732a92c89be88e2b5622a26073fadcf3a084', '[\"*\"]', '2025-09-25 02:26:36', NULL, '2025-09-25 02:20:37', '2025-09-25 02:26:36'),
(961, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '128d522120b86a49dc67f378113341439de2a1d3a725e808b72dbbf21493dd67', '[\"*\"]', '2025-09-25 02:31:55', NULL, '2025-09-25 02:26:47', '2025-09-25 02:31:55'),
(962, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a7e4d5bc395ce7572caaef72f1b723fd9c65bc6b9a6d60b6765a7fa877539666', '[\"*\"]', '2025-09-25 02:34:22', NULL, '2025-09-25 02:32:15', '2025-09-25 02:34:22'),
(963, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '81287051f64e72462e5abde2e42747b3601e15d5e54528e162c5ec146e38440e', '[\"*\"]', '2025-09-25 02:52:24', NULL, '2025-09-25 02:34:55', '2025-09-25 02:52:24'),
(964, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '178d43ed344cbe926f73d7e4abdc8ee61b1e570e27960ab9bad293603c180620', '[\"*\"]', '2025-09-25 03:09:49', NULL, '2025-09-25 03:09:04', '2025-09-25 03:09:49'),
(965, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd89711d13d1f3f7fcc9699d83247f19130aabe65ec2eff5557ef3c097985d251', '[\"*\"]', '2025-09-25 03:17:34', NULL, '2025-09-25 03:10:25', '2025-09-25 03:17:34'),
(966, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '615fae11d5dc4fd2c3dde3a7c64b2df95bf9794ac1ef87b7d7956496c2271d31', '[\"*\"]', '2025-09-25 03:25:26', NULL, '2025-09-25 03:24:35', '2025-09-25 03:25:26'),
(967, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '32d37ce02c9c06825c62aa0d7576832703f1c43f118b5205b3b310d446daba72', '[\"*\"]', '2025-09-25 03:30:28', NULL, '2025-09-25 03:30:19', '2025-09-25 03:30:28'),
(968, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cdc68b63a557dfd4f424e69961658c98f424d77431c23ff78830d7a089a5e629', '[\"*\"]', '2025-09-25 03:45:59', NULL, '2025-09-25 03:42:01', '2025-09-25 03:45:59'),
(969, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '927c2b66cd98da9f9c646973086bd79842975f72e868223d34331125dcb86ef6', '[\"*\"]', '2025-09-25 03:47:05', NULL, '2025-09-25 03:46:44', '2025-09-25 03:47:05'),
(970, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '49b8275525113536c4deb1fee3acc61d7031f6de1cd029aa742c35d577252d0f', '[\"*\"]', '2025-09-25 03:57:33', NULL, '2025-09-25 03:49:19', '2025-09-25 03:57:33'),
(971, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e18571415aac99df717f3dc959aa37777c5682108c7085a8c3c987fc1d4be049', '[\"*\"]', '2025-09-25 04:04:01', NULL, '2025-09-25 04:01:21', '2025-09-25 04:04:01'),
(972, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '714c954a83492a5b9bdc18338acc88dc98379b781e6d3cda2cce70faadae740c', '[\"*\"]', '2025-09-25 04:11:08', NULL, '2025-09-25 04:10:31', '2025-09-25 04:11:08'),
(973, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4bea26fffcba9af4f755bf69f6dfa5d97b63b2a2a8823e4954865552ef1fc8b7', '[\"*\"]', '2025-09-25 04:25:52', NULL, '2025-09-25 04:23:32', '2025-09-25 04:25:52'),
(974, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8f5037563da9eb3e82408c1e74b0da9d3354682d866d67a151f96ca25b7e8180', '[\"*\"]', '2025-09-25 04:29:04', NULL, '2025-09-25 04:28:58', '2025-09-25 04:29:04'),
(975, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3aa6074a583122ab640cc59c84937511d7cc444e225eb7a6cab0dc542cc76f1a', '[\"*\"]', '2025-09-25 04:30:25', NULL, '2025-09-25 04:30:10', '2025-09-25 04:30:25'),
(976, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c2f0f8ebbdf2e203a263dd133d5db452d4503da447159e0d290711073719ecab', '[\"*\"]', '2025-09-25 04:46:03', NULL, '2025-09-25 04:31:06', '2025-09-25 04:46:03'),
(977, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'afb5fca5e973f42813f4096e4d0de32dc317e126b9b8c230002afa37f567c456', '[\"*\"]', '2025-09-25 04:56:18', NULL, '2025-09-25 04:49:35', '2025-09-25 04:56:18'),
(978, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fd413bdb5df69774e7b0da97471717b3939718ac0cfb36e3a449b28ae5bbb954', '[\"*\"]', '2025-09-25 04:57:33', NULL, '2025-09-25 04:57:30', '2025-09-25 04:57:33'),
(979, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ca2a979bb5b6514fe5a57987181834a59240dd3a4e18add1bedada71afe3c2ca', '[\"*\"]', '2025-09-25 05:22:36', NULL, '2025-09-25 04:59:15', '2025-09-25 05:22:36'),
(980, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'aacb798d783924ce883bbe2300353e4fe1a26ecde26f64a8ca007d627f22500b', '[\"*\"]', '2025-09-25 05:32:26', NULL, '2025-09-25 05:31:37', '2025-09-25 05:32:26'),
(981, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7e5959e09d27c154f8db86a56a1c6ae9e2c263385a4a5e9daca5b4ae4aa8bf83', '[\"*\"]', '2025-09-25 08:29:20', NULL, '2025-09-25 08:05:15', '2025-09-25 08:29:20'),
(982, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fe79e82be23e941b881962f1b95a323623b61b006e374a1148b3763d92aab8e7', '[\"*\"]', '2025-09-25 08:16:36', NULL, '2025-09-25 08:09:57', '2025-09-25 08:16:36'),
(983, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4e812e5284c65efc694582dc9db4c786437f9a5406d48a2d3c7ccdccbcbf9c43', '[\"*\"]', '2025-09-25 08:31:05', NULL, '2025-09-25 08:30:28', '2025-09-25 08:31:05'),
(984, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '82aed919fdc4c80d5c574945b3664914e0499fe09385a6805772a36a3c0291ac', '[\"*\"]', '2025-09-25 08:34:20', NULL, '2025-09-25 08:31:31', '2025-09-25 08:34:20'),
(985, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '284fa394fac83314983c800f4b264d72929f789f6b7aa782a2f276c089319ed3', '[\"*\"]', '2025-09-25 08:42:52', NULL, '2025-09-25 08:37:53', '2025-09-25 08:42:52'),
(986, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '006802dbe510f97b97ecbd947c90685905d9acf8f97a85d241488af57e2fa939', '[\"*\"]', '2025-09-25 08:45:27', NULL, '2025-09-25 08:44:35', '2025-09-25 08:45:27'),
(987, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e9ea85a713ebe70a9e25ecad0d6022a9fb441e8c75fe4e4c628f7c3d13928919', '[\"*\"]', '2025-09-25 08:52:09', NULL, '2025-09-25 08:51:44', '2025-09-25 08:52:09'),
(988, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '36e2af7b140e08bb22829d4d5fa7f2bc7b7a4a19ac46d57a788630ec69e51da6', '[\"*\"]', '2025-10-06 09:33:09', NULL, '2025-09-26 03:16:39', '2025-10-06 09:33:09'),
(989, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c9a25a2b548a96c785dd544d31f802658a6afdd88adb1ffad883be1ac2c9fd82', '[\"*\"]', '2025-09-26 03:41:06', NULL, '2025-09-26 03:40:58', '2025-09-26 03:41:06'),
(990, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '03ea4d8e7d9982fbe581a334f5992df8f875729dd0ac1c9bbe7d5553b598b118', '[\"*\"]', '2025-09-26 04:03:44', NULL, '2025-09-26 04:02:42', '2025-09-26 04:03:44'),
(991, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '306edefa3a74c552d0dc1e4e8b41945f81bc04c6ff4c1fb5a12276511a07eacb', '[\"*\"]', '2025-09-26 04:20:48', NULL, '2025-09-26 04:17:49', '2025-09-26 04:20:48'),
(992, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '05f90bf11adeac1ef875bccfee66860de76ad2eb0180213599f30372195acd1f', '[\"*\"]', '2025-09-26 04:32:19', NULL, '2025-09-26 04:26:11', '2025-09-26 04:32:19'),
(993, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '55641d9c8204e140486e70525f49cab37208b6be982e661a108b4d7fb32e1d50', '[\"*\"]', '2025-09-26 04:35:51', NULL, '2025-09-26 04:34:06', '2025-09-26 04:35:51'),
(994, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1e3cedf050ab17e92532664f3f0d9bc63e127d5c19a30717d21f2145fe246f90', '[\"*\"]', '2025-09-26 05:39:40', NULL, '2025-09-26 05:21:09', '2025-09-26 05:39:40'),
(995, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1c62cc8975dae96ac121f985454afbd0411c5d096a4abf90bbea43e75d2aa354', '[\"*\"]', '2025-09-26 05:47:02', NULL, '2025-09-26 05:44:04', '2025-09-26 05:47:02'),
(996, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '527b8b585beade193b43826ea9e3f19a5dc3b195fcf4a9b73f1b65d6e88f3e06', '[\"*\"]', '2025-09-26 05:49:52', NULL, '2025-09-26 05:47:50', '2025-09-26 05:49:52'),
(997, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '85593d10fcf769c2a8b3b9d8884ea097390a9b345351f87d79d3b976ebb8fe99', '[\"*\"]', '2025-09-26 05:55:32', NULL, '2025-09-26 05:53:19', '2025-09-26 05:55:32'),
(998, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '86840ccc4bf967a2c9fef466e8f13c2d345c0fb4acb3a6b81c31b837c90edcce', '[\"*\"]', '2025-09-26 06:03:10', NULL, '2025-09-26 06:01:58', '2025-09-26 06:03:10'),
(999, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a76cd340292e988080a1fe9197943f361447c18cc7568e36627e96a173ac0792', '[\"*\"]', '2025-09-26 06:11:19', NULL, '2025-09-26 06:10:10', '2025-09-26 06:11:19'),
(1000, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '676fe578bbf33a8c98e5c2a50a9e72be0a8cc2da04148e44b9aedecf97b1dae5', '[\"*\"]', '2025-09-26 08:24:06', NULL, '2025-09-26 08:08:00', '2025-09-26 08:24:06'),
(1001, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f76305ab3153388d5aaa2d8c96a8b439eb164d8f0057b852bb66cd0240c99f6b', '[\"*\"]', '2025-09-26 21:04:41', NULL, '2025-09-26 20:54:56', '2025-09-26 21:04:41'),
(1002, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '05435601bc1117a1e85cd069190785bfdc4604c27229f51bb369b68ae39138c8', '[\"*\"]', '2025-09-26 21:43:37', NULL, '2025-09-26 21:42:30', '2025-09-26 21:43:37'),
(1003, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eef8b58633903703f256258b4b02661b872da4ef4510b3398af841fbe01f765d', '[\"*\"]', '2025-09-26 21:44:46', NULL, '2025-09-26 21:44:31', '2025-09-26 21:44:46'),
(1004, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e8bde1aa547b3ea5ec826c8bd282b64ce69638c4d35c5dd546a805190eb75401', '[\"*\"]', '2025-09-26 21:48:54', NULL, '2025-09-26 21:48:45', '2025-09-26 21:48:54'),
(1005, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '966412580028607f6f616ea6f19888cf77e5adf3321c2ddd13e382b8463a7068', '[\"*\"]', '2025-09-26 21:52:33', NULL, '2025-09-26 21:49:47', '2025-09-26 21:52:33'),
(1006, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3b2170adb5713ecb91bd21d903a83968a8712605e1483d26afb618b627474ec1', '[\"*\"]', '2025-09-26 21:57:15', NULL, '2025-09-26 21:53:29', '2025-09-26 21:57:15'),
(1007, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '80bf8f33c28cc8e874bb08af911cafda99fb1372f93240840326013c7ea61f68', '[\"*\"]', '2025-09-27 22:29:23', NULL, '2025-09-26 21:59:03', '2025-09-27 22:29:23'),
(1008, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ea00aa2f5497f824e880e3b6a2b6a4653671a70144572cf1186855eadd44a56f', '[\"*\"]', '2025-09-26 22:02:48', NULL, '2025-09-26 22:01:29', '2025-09-26 22:02:48'),
(1009, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ab2980fdb865c1f43779f02c48842bb738f4ecd6af0390d5b3899c75fd3deda2', '[\"*\"]', '2025-09-26 22:06:02', NULL, '2025-09-26 22:05:18', '2025-09-26 22:06:02'),
(1010, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'af3a9f85b2d2a35b6832bcbabeced42d53cd2e3beeb5eb8a3b92a93d264aed09', '[\"*\"]', '2025-09-26 22:08:05', NULL, '2025-09-26 22:07:24', '2025-09-26 22:08:05'),
(1011, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '155c4181157753df50f0e49ef92a91a8a70b2b0b45105c1d44f0a61fe2f37567', '[\"*\"]', '2025-09-26 22:15:39', NULL, '2025-09-26 22:14:38', '2025-09-26 22:15:39'),
(1012, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0b93fa21032c00fa0294e02da4620bed1da2bb019b297c9cf361ad2347e7e95d', '[\"*\"]', '2025-09-26 22:28:32', NULL, '2025-09-26 22:18:20', '2025-09-26 22:28:32'),
(1013, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '95401c6214928545577dfd8a32ee386767d7382a1d152073c4efcf6828ed0ebf', '[\"*\"]', '2025-09-26 23:04:05', NULL, '2025-09-26 22:31:55', '2025-09-26 23:04:05'),
(1014, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '942863ce3e966b969306c34e94d9f89e86d679b0a514e7cf6c0bf163e2042299', '[\"*\"]', '2025-09-26 23:11:48', NULL, '2025-09-26 23:09:20', '2025-09-26 23:11:48'),
(1015, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fc7cfcd219395b835c1ffc9f7f30b7b38c72720ec87752a617a13d3e72b2cb7e', '[\"*\"]', '2025-09-26 23:16:42', NULL, '2025-09-26 23:15:06', '2025-09-26 23:16:42'),
(1016, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'befe523e28a96b17c395e1c1645148faf19438bcf8bd8c8acdc435599f80ab2c', '[\"*\"]', '2025-09-26 23:30:20', NULL, '2025-09-26 23:29:33', '2025-09-26 23:30:20'),
(1017, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ad0cfd2936249eb8018cdc53a576daf492ba7dc7dd9fa8accf0dc722f3153e61', '[\"*\"]', '2025-09-26 23:43:57', NULL, '2025-09-26 23:31:45', '2025-09-26 23:43:57'),
(1018, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0f39cb8587a6a378e7a3a5e8578750fb79c808084d46f327432d1b4e78cf8c0d', '[\"*\"]', '2025-09-27 00:10:36', NULL, '2025-09-26 23:46:44', '2025-09-27 00:10:36');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1020, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '84b7a99b24e130f129b03ca0616b6c7734d5abb954829537e38e227130843913', '[\"*\"]', '2025-09-27 00:25:18', NULL, '2025-09-26 23:55:31', '2025-09-27 00:25:18'),
(1021, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c4688b105a2334be7a964267e9c740cd2fc94951dda2f70a45d680177faa69cc', '[\"*\"]', '2025-09-27 00:14:55', NULL, '2025-09-27 00:10:53', '2025-09-27 00:14:55'),
(1022, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a683acc34d118a3b9ef62f06ae56818d4396439cf5a2e3527129b55d78d82e72', '[\"*\"]', '2025-09-27 00:19:55', NULL, '2025-09-27 00:15:07', '2025-09-27 00:19:55'),
(1024, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd1f5b11f518d40dc2d4e2976a72f69672265366f35851c01cd6ede589f1e1596', '[\"*\"]', '2025-09-27 00:37:53', NULL, '2025-09-27 00:24:33', '2025-09-27 00:37:53'),
(1025, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4d6589c46e4605d2c9a90b7629e65570cc7750862833f1c7110164423d960500', '[\"*\"]', '2025-09-27 00:45:19', NULL, '2025-09-27 00:41:13', '2025-09-27 00:45:19'),
(1026, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '01e978e9bc590ba5513d5e9eb2809125f47d17a1ff6de80757d84c78b6b86333', '[\"*\"]', '2025-09-27 00:46:40', NULL, '2025-09-27 00:45:59', '2025-09-27 00:46:40'),
(1027, 'App\\Models\\User', 12, 'api-token', 'bec69f63329f8b9383c2c617bc144834986079e8146d5a6424d7b296bf6021f9', '[\"*\"]', '2025-09-27 02:28:50', NULL, '2025-09-27 02:28:50', '2025-09-27 02:28:50'),
(1028, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5712bd407e7abe35f5664cef571e8c8013bf913e66c40255bd1076b1ea36e7cc', '[\"*\"]', '2025-09-27 02:43:11', NULL, '2025-09-27 02:42:36', '2025-09-27 02:43:11'),
(1029, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6641009061cf1605e7ae02d19a0d49a98e0d2b789cc108f40ab15cf2e18b06a5', '[\"*\"]', '2025-09-27 02:45:21', NULL, '2025-09-27 02:45:03', '2025-09-27 02:45:21'),
(1030, 'App\\Models\\User', 12, 'api-token', '518c79505a9925336fa0d939803238c919db6482cc861cb06833185d4afef762', '[\"*\"]', '2025-09-27 02:51:06', NULL, '2025-09-27 02:51:05', '2025-09-27 02:51:06'),
(1031, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '38c11877676d5a273b44f58cdf639bb8874a1781757d2739a39a5727a27419ff', '[\"*\"]', '2025-09-27 03:11:13', NULL, '2025-09-27 03:03:22', '2025-09-27 03:11:13'),
(1032, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'caa42b88736751b25cac13ce7e29dce9e0d154c6afb7e64ffcd3308d850bcf9e', '[\"*\"]', '2025-09-27 03:16:48', NULL, '2025-09-27 03:16:19', '2025-09-27 03:16:48'),
(1033, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4d9de2acdbd81704acf189ce3bde0d37afce05e8005457e8e4222088d48d3386', '[\"*\"]', '2025-09-27 04:04:32', NULL, '2025-09-27 03:47:57', '2025-09-27 04:04:32'),
(1034, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1db235bb38078d11b95d8e28445ce4de3b32349d919ceaddbe444a0fc342596d', '[\"*\"]', '2025-09-27 04:34:43', NULL, '2025-09-27 04:06:10', '2025-09-27 04:34:43'),
(1037, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7acfcf344cb8fc9a79e15dee8418ab8f916891fc4805e71fe5d1b825f79ad853', '[\"*\"]', '2025-09-27 04:43:36', NULL, '2025-09-27 04:33:53', '2025-09-27 04:43:36'),
(1038, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ff448e029a04c83cd48bb168d363ff47951a1ce2baec9bac4697171be0b54dc0', '[\"*\"]', '2025-09-27 04:44:56', NULL, '2025-09-27 04:36:34', '2025-09-27 04:44:56'),
(1039, 'App\\Models\\User', 12, 'api-token', '41ab61d20849b59ab06db9a44a43f1d3e9c9dafa671266bead93694f3960dcee', '[\"*\"]', '2025-09-27 04:54:51', NULL, '2025-09-27 04:45:22', '2025-09-27 04:54:51'),
(1040, 'App\\Models\\User', 12, 'api-token', '3fb837e8c5abd1fa03ccef24481e74f1fb9527bb1daafbf1e7f61d3ede232319', '[\"*\"]', '2025-09-27 05:05:05', NULL, '2025-09-27 04:58:07', '2025-09-27 05:05:05'),
(1041, 'App\\Models\\User', 12, 'api-token', '1e00aa64f729abdc83e763698c1fb25e694fa52161e5384d7fc456ac0bcafefe', '[\"*\"]', '2025-09-27 21:05:28', NULL, '2025-09-27 20:51:32', '2025-09-27 21:05:28'),
(1042, 'App\\Models\\User', 12, 'api-token', 'e67b0c72b8788c09f411e59655cc6d06eca51b0c2ad8d9acd8f7efd0a236648b', '[\"*\"]', '2025-09-27 21:06:31', NULL, '2025-09-27 21:06:23', '2025-09-27 21:06:31'),
(1043, 'App\\Models\\User', 12, 'api-token', '7ecd19f13f7155fc2e3f56546bca4ec678b26934942e24ec7a8f2db44f64b9d1', '[\"*\"]', '2025-09-27 21:17:37', NULL, '2025-09-27 21:08:01', '2025-09-27 21:17:37'),
(1044, 'App\\Models\\User', 12, 'api-token', '07e8500c45b22fd8524d9b6cb19b93593b22a0bb45d9906c6953c0c60117efd6', '[\"*\"]', '2025-09-27 21:38:36', NULL, '2025-09-27 21:26:30', '2025-09-27 21:38:36'),
(1045, 'App\\Models\\User', 12, 'api-token', '38270af985369c47d7db0cbc13c804d95aa5aa64a1b4ab870fe9eadae2b1fc2d', '[\"*\"]', '2025-09-27 21:49:53', NULL, '2025-09-27 21:39:09', '2025-09-27 21:49:53'),
(1046, 'App\\Models\\User', 12, 'api-token', 'f18dd067b1c2444eddffd31eb7c186345133c9b24a829912f4acaa1b93239d77', '[\"*\"]', '2025-09-27 22:12:03', NULL, '2025-09-27 21:51:54', '2025-09-27 22:12:03'),
(1047, 'App\\Models\\User', 12, 'api-token', '4f88af6973018888e8428f9a0da420713c7db27e6a800945a0259817a0cc5ffc', '[\"*\"]', '2025-09-27 22:18:49', NULL, '2025-09-27 22:16:01', '2025-09-27 22:18:49'),
(1048, 'App\\Models\\User', 12, 'api-token', '852bfce1856b975f1772b58324d87ea96314a8a70cb3a0dfe8e7eb6ea51b97ef', '[\"*\"]', '2025-09-27 22:23:30', NULL, '2025-09-27 22:22:09', '2025-09-27 22:23:30'),
(1049, 'App\\Models\\User', 12, 'api-token', 'c61a692d59334cf25f595f68b9c3deab5ccf3f3df8ba5547b3f4f491eb066da6', '[\"*\"]', '2025-09-27 22:24:02', NULL, '2025-09-27 22:23:45', '2025-09-27 22:24:02'),
(1052, 'App\\Models\\User', 1, 'api-token', '5de25fec3f88217d9861aa09b0088b133e9d9aeeedcbc82d94ee18ea3bb39550', '[\"*\"]', '2025-09-27 22:40:53', NULL, '2025-09-27 22:29:58', '2025-09-27 22:40:53'),
(1053, 'App\\Models\\User', 12, 'api-token', '9782b2d7e7af944580d16369a8d70b4d233eb9574858d3c8e5d580a6da47207a', '[\"*\"]', '2025-09-27 22:46:35', NULL, '2025-09-27 22:41:33', '2025-09-27 22:46:35'),
(1054, 'App\\Models\\User', 12, 'api-token', 'f13521d2aa80d5bbc0042af1d28f78304806f9bec8b25f2bfa049b6779dca2c0', '[\"*\"]', '2025-09-27 22:50:19', NULL, '2025-09-27 22:50:17', '2025-09-27 22:50:19'),
(1055, 'App\\Models\\User', 12, 'api-token', '70e5f72daccdbfe4273f31d46a42d17522123365424fc65b659745eea7d05db1', '[\"*\"]', '2025-09-27 22:50:58', NULL, '2025-09-27 22:50:54', '2025-09-27 22:50:58'),
(1056, 'App\\Models\\User', 12, 'api-token', 'fbeb3026a7dabbe47026ed77987b1cbfc6d7e35524ec08f2e19e36edd5beb5c9', '[\"*\"]', '2025-09-27 22:52:20', NULL, '2025-09-27 22:51:18', '2025-09-27 22:52:20'),
(1057, 'App\\Models\\User', 12, 'api-token', '4a4892fbce58cc6f2c49d3a8fcc19324e0aa59ce695a0981f56915daeed30db6', '[\"*\"]', '2025-09-27 22:52:48', NULL, '2025-09-27 22:52:46', '2025-09-27 22:52:48'),
(1058, 'App\\Models\\User', 12, 'api-token', '7f42876e46816e452cd3ae5e24e0cf92956a2d136004e82cfb492ec8bcde42b8', '[\"*\"]', '2025-09-27 22:55:26', NULL, '2025-09-27 22:55:25', '2025-09-27 22:55:26'),
(1060, 'App\\Models\\User', 1, 'api-token', 'eeca4f94d04c54e6dd275a9249862297d0ee04066e08f69178cb8d36b6b6b0ac', '[\"*\"]', '2025-09-27 23:04:44', NULL, '2025-09-27 23:04:04', '2025-09-27 23:04:44'),
(1062, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '399210302b4fcd83aae75fd158137cc8fef336de2ebe622128c4858cbe0c63f6', '[\"*\"]', '2025-09-27 23:21:12', NULL, '2025-09-27 23:15:42', '2025-09-27 23:21:12'),
(1063, 'App\\Models\\User', 12, 'api-token', 'ff6ce26cedd018d1f2e8af94cf13bcee975ae83d1f49c71e347a9349945c01e5', '[\"*\"]', '2025-09-27 23:28:39', NULL, '2025-09-27 23:28:21', '2025-09-27 23:28:39'),
(1064, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c4f583ec8c6f97745a98cb27b96c4ad8669b867457f9d1084d0490832ca2b16d', '[\"*\"]', '2025-09-27 23:28:42', NULL, '2025-09-27 23:28:24', '2025-09-27 23:28:42'),
(1065, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '45dab38cc27b77af70f0f2ed9285010d34952d55f6636554a024c6396198aa7d', '[\"*\"]', '2025-09-27 23:33:14', NULL, '2025-09-27 23:29:30', '2025-09-27 23:33:14'),
(1066, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5d67c3fc5d6bdebc686b0ca4fb2519550709df20748466ceb542605f0a847178', '[\"*\"]', '2025-09-27 23:35:06', NULL, '2025-09-27 23:34:26', '2025-09-27 23:35:06'),
(1067, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6198f125156f15322a7e78ea864c88a24656d66d5f92017c90c6d065fe50e095', '[\"*\"]', '2025-09-27 23:41:48', NULL, '2025-09-27 23:39:40', '2025-09-27 23:41:48'),
(1068, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ba4626e0329e2d5bbc9ff77dd9dc0c02aa33a10d4d02d51338936f1a0909dc3e', '[\"*\"]', '2025-09-28 00:00:18', NULL, '2025-09-27 23:53:28', '2025-09-28 00:00:18'),
(1069, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f439036a321031be67db102a0fd15401f0286c4f05cfe027955c01e94922f32d', '[\"*\"]', '2025-09-28 00:04:02', NULL, '2025-09-28 00:00:35', '2025-09-28 00:04:02'),
(1070, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7c0e19ddb34d2443a2987a6901eede9f37c18eaba35fd0b329dc69949a50fd97', '[\"*\"]', '2025-09-28 00:12:12', NULL, '2025-09-28 00:07:03', '2025-09-28 00:12:12'),
(1071, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f2c8308e0a5068f322612172c80d95877a4768b163da10144e991e577229f6f0', '[\"*\"]', '2025-09-28 00:12:51', NULL, '2025-09-28 00:12:34', '2025-09-28 00:12:51'),
(1072, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c995c9a1506a47b5eb5fe71fac964621d013de21fffb1e6e06dcbe6f60271759', '[\"*\"]', '2025-09-28 00:18:42', NULL, '2025-09-28 00:16:10', '2025-09-28 00:18:42'),
(1073, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '74431fecae1da9a534fcfe95fc1ea3575a9bfdcc2c0983dba48de0cbd3c35001', '[\"*\"]', '2025-09-28 00:20:18', NULL, '2025-09-28 00:19:15', '2025-09-28 00:20:18'),
(1074, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dacd1ff4968e41a8fb201213e6288049546b1b4e7d9d17814264b023aa3fa20f', '[\"*\"]', '2025-09-28 00:23:18', NULL, '2025-09-28 00:20:38', '2025-09-28 00:23:18'),
(1077, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'addf2aa366767c15ce88a8857b39a873d894793a44a8e9492c27673eddd38246', '[\"*\"]', '2025-09-28 00:57:34', NULL, '2025-09-28 00:29:08', '2025-09-28 00:57:34'),
(1078, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'acfde2db886a4d15dd361a4213e8a000424b2dee129ccde5dea007f6efc482f2', '[\"*\"]', '2025-09-28 01:03:54', NULL, '2025-09-28 00:58:15', '2025-09-28 01:03:54'),
(1079, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '05c517ad3631d9ab03ac539d732f745cddaaf0437a44cc1e4ba285da1df2a359', '[\"*\"]', '2025-09-28 02:12:58', NULL, '2025-09-28 01:05:14', '2025-09-28 02:12:58'),
(1080, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6ce2ad6f9b30f1c2a7a75c398e1e202d2dec3bbad0718bde08ddba4d2bee2fe0', '[\"*\"]', '2025-09-28 02:24:39', NULL, '2025-09-28 02:22:10', '2025-09-28 02:24:39'),
(1081, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8325bd0e9b7ac678a84d0e27595e00601022722b3eea306f0afc191c91a9cf1b', '[\"*\"]', '2025-09-28 02:54:54', NULL, '2025-09-28 02:40:14', '2025-09-28 02:54:54'),
(1082, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f343c9cac0c27f15eec30b3f91ae58bee7af575bd40a72dadd065d0a2541ec60', '[\"*\"]', '2025-09-28 03:08:40', NULL, '2025-09-28 02:56:54', '2025-09-28 03:08:40'),
(1083, 'App\\Models\\User', 12, 'api-token', 'ac1d5d5b6e84f45a56de2f0446c08246ffa59bc451f7c26be1f1d5613594da98', '[\"*\"]', '2025-09-28 03:01:07', NULL, '2025-09-28 03:00:37', '2025-09-28 03:01:07'),
(1084, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b3aae48213656a1b8dee7af2ec80cf0f73ee5ab9a5dd3da91f4d5b527ddc64f8', '[\"*\"]', NULL, NULL, '2025-09-28 03:07:54', '2025-09-28 03:07:54'),
(1085, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fbb76f30696736064f973445b4826ae4b3d77120f342fd9cf8f1d7ef06087f4b', '[\"*\"]', NULL, NULL, '2025-09-28 03:08:51', '2025-09-28 03:08:51'),
(1086, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a9b1bf42129c330f289e7dfe623e47c4f0b06a35141f3f8c5e240837db367b83', '[\"*\"]', '2025-09-28 03:42:05', NULL, '2025-09-28 03:09:31', '2025-09-28 03:42:05'),
(1087, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '35cd6c4e69432b8f22877d8197501631df6d69e688b6388b9f8893ed1dd4b2f0', '[\"*\"]', '2025-09-28 03:19:44', NULL, '2025-09-28 03:09:33', '2025-09-28 03:19:44'),
(1088, 'App\\Models\\User', 1, 'api-token', '1641339328576c6642f28c12354fc054d6e6864d698ee5859aba7e8111ff7478', '[\"*\"]', '2025-11-02 04:09:59', NULL, '2025-09-28 03:28:03', '2025-11-02 04:09:59'),
(1089, 'App\\Models\\User', 12, 'api-token', 'd36e2d3bbebe688335838f534b6c6508ba1e51fadd89267a0d8356dfb42276d4', '[\"*\"]', '2025-09-28 03:34:58', NULL, '2025-09-28 03:33:57', '2025-09-28 03:34:58'),
(1090, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '29521cdd4b1835d76e997f0af9d216f00fb98fbf9f271d92e16436c6ed4fa007', '[\"*\"]', '2025-09-28 03:43:17', NULL, '2025-09-28 03:42:29', '2025-09-28 03:43:17'),
(1091, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f464a2f461a6d8887b378f1f70147361a6417c67a1868d499f004877327c6e0d', '[\"*\"]', '2025-09-28 03:59:34', NULL, '2025-09-28 03:49:08', '2025-09-28 03:59:34'),
(1092, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '956a6b50835b841eb507dc105520793c99cd759ca4d8a116130d2d4a591ac209', '[\"*\"]', '2025-09-28 04:00:17', NULL, '2025-09-28 04:00:16', '2025-09-28 04:00:17'),
(1093, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9c38f1a4948ede2cb6d33b19bfce5e6d3bad6a9b2dd7e5f4d997f8e9f1448bb3', '[\"*\"]', '2025-09-28 04:03:43', NULL, '2025-09-28 04:00:40', '2025-09-28 04:03:43'),
(1094, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a960fa6c520f603339f413bdc168af13a7ba28d675ecaf7a02755ae44d447b5c', '[\"*\"]', '2025-09-28 04:04:55', NULL, '2025-09-28 04:04:49', '2025-09-28 04:04:55'),
(1095, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c2d107bf2fff81df8677347b603688023d17c797e726b6cf3a53b3c30c203c0f', '[\"*\"]', '2025-09-28 04:26:48', NULL, '2025-09-28 04:06:54', '2025-09-28 04:26:48'),
(1096, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b3a36ed2388c01b9af068d1c3e58faf46feb21cd30e979a07bb9cda50180654d', '[\"*\"]', '2025-09-28 04:27:10', NULL, '2025-09-28 04:26:58', '2025-09-28 04:27:10'),
(1097, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1dc89bed942014c09e489e4d5d4a6399a077816415be6d84436ad026193d827e', '[\"*\"]', '2025-09-28 04:30:27', NULL, '2025-09-28 04:29:18', '2025-09-28 04:30:27'),
(1098, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd395df919a6dea55dfff72630c20149a1362f91aa9274017e6f558a733e73671', '[\"*\"]', '2025-09-28 05:08:29', NULL, '2025-09-28 04:34:09', '2025-09-28 05:08:29'),
(1099, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bdb9821f887eedec00c762ca4b3d1de20bfb8176a0f6d977424d8c153cf24842', '[\"*\"]', '2025-09-28 20:48:35', NULL, '2025-09-28 20:45:54', '2025-09-28 20:48:35'),
(1100, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '10296ea88f6ec64770a4e84eb8538428efb5d7699d5c89074fa921d2c4e33150', '[\"*\"]', '2025-09-28 21:01:30', NULL, '2025-09-28 20:54:06', '2025-09-28 21:01:30'),
(1101, 'App\\Models\\User', 1, 'api-token', '8486bcbb868e18a5a5f0511088c55a91103db649ea2c7fe86517c88b365311fb', '[\"*\"]', '2025-09-28 21:05:43', NULL, '2025-09-28 21:02:54', '2025-09-28 21:05:43'),
(1102, 'App\\Models\\User', 1, 'api-token', '80e9f138823481a9675e6340c6e6fe379e9e9f275a8297147a0c18889d301c5a', '[\"*\"]', '2025-09-28 21:10:25', NULL, '2025-09-28 21:10:07', '2025-09-28 21:10:25'),
(1104, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '42260299f0fa868ece38296356eb9bae1613ca2382b8ff7bb131110795d52dde', '[\"*\"]', '2025-09-28 21:14:28', NULL, '2025-09-28 21:14:08', '2025-09-28 21:14:28'),
(1106, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e2721cba45946d3eba605ec425d66c9473252aaa4c422201328bd2944575b969', '[\"*\"]', '2025-09-28 21:16:57', NULL, '2025-09-28 21:16:09', '2025-09-28 21:16:57'),
(1107, 'App\\Models\\User', 1, 'api-token', 'c9f37ce4da6e9f74a697d7c13a1c0dfc6d1ddc17fb7efc847eaa490c4ba4d7b9', '[\"*\"]', '2025-09-28 21:18:53', NULL, '2025-09-28 21:18:52', '2025-09-28 21:18:53'),
(1109, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9cc5c65ae36398cdebc3553a3eb82942167de3c278dc8aa92377962d517147b8', '[\"*\"]', '2025-09-28 22:03:00', NULL, '2025-09-28 22:02:02', '2025-09-28 22:03:00'),
(1111, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f0f547169b7ee6f6ffb1b2a1bf47ef3217b5e67dfbca8dcbfbe9a04a0a19f047', '[\"*\"]', '2025-09-28 22:34:37', NULL, '2025-09-28 22:12:41', '2025-09-28 22:34:37'),
(1113, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '89ece9c8565a832122cbed38a8ffd7ec471cc00dc68d43b90e3a9df130d8d24b', '[\"*\"]', '2025-09-28 22:59:39', NULL, '2025-09-28 22:38:08', '2025-09-28 22:59:39'),
(1115, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '97f6a781a1a0d5c91261c88582309747e6cdfdf40482a283718686efa9904fac', '[\"*\"]', '2025-09-28 23:09:18', NULL, '2025-09-28 23:00:33', '2025-09-28 23:09:18'),
(1116, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b07414efb4cea359d5eceaa60456c364c3e1d4e895beda5bbca0b49ba41f7e0c', '[\"*\"]', '2025-09-28 23:17:12', NULL, '2025-09-28 23:16:13', '2025-09-28 23:17:12'),
(1117, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '693b1b8ca92cf1c50d3cce0ccf712f9cb6a68d032e488a88f89071dd3565802d', '[\"*\"]', '2025-09-28 23:25:56', NULL, '2025-09-28 23:18:32', '2025-09-28 23:25:56'),
(1118, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bb0c28e8175967e443172557a85f6d37005225c38a4ce1cb9ec47c372b836d92', '[\"*\"]', '2025-09-28 23:27:40', NULL, '2025-09-28 23:27:01', '2025-09-28 23:27:40'),
(1119, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6c779d1d9f3b265f63e88d8042eaa8f6cbc5f7208251e476dd5be34fa53bd494', '[\"*\"]', '2025-09-28 23:29:41', NULL, '2025-09-28 23:28:45', '2025-09-28 23:29:41'),
(1120, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6e9a956e9353f6037302fe67463d5ff29fb7a4126876e4da782aa24576dcd808', '[\"*\"]', '2025-09-28 23:44:44', NULL, '2025-09-28 23:44:43', '2025-09-28 23:44:44'),
(1121, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bffff97f6ccd8b2322b3a4ac118d45c46dff696a65fcb69683c50d3c618fdb40', '[\"*\"]', '2025-09-28 23:47:14', NULL, '2025-09-28 23:47:13', '2025-09-28 23:47:14'),
(1123, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd429a05d83a985e7fcee20e29359ed264ebcc7d2f06a2e9305748fc47fcab9a8', '[\"*\"]', '2025-09-28 23:49:17', NULL, '2025-09-28 23:48:13', '2025-09-28 23:49:17'),
(1125, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'de063e5495aae007fc4d062664249d021470f6a8d6f37c96b5fa61f3f9c6d0f5', '[\"*\"]', '2025-09-29 00:13:51', NULL, '2025-09-28 23:50:47', '2025-09-29 00:13:51'),
(1127, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3208c1aa47264adebe6ae72e41cd3115678d352f96f8052e9928271686b540e9', '[\"*\"]', '2025-09-29 00:22:34', NULL, '2025-09-29 00:22:34', '2025-09-29 00:22:34'),
(1129, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '79773057b75791d6610d94138658afa6bcf4a8be21b4b2f4431fddfbb806d0ad', '[\"*\"]', '2025-09-29 00:27:41', NULL, '2025-09-29 00:27:40', '2025-09-29 00:27:41'),
(1133, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '18654d559c998bec133e598cd0e75e64d7df871614cf346d34641fb8af410f0a', '[\"*\"]', '2025-09-29 00:38:43', NULL, '2025-09-29 00:38:33', '2025-09-29 00:38:43'),
(1136, 'App\\Models\\User', 1, 'api-token', '921dcc08be9a71adcbae164ee2e81a9e516ef32aee1f036947f85f2f8aa021b8', '[\"*\"]', '2025-09-29 00:50:44', NULL, '2025-09-29 00:49:16', '2025-09-29 00:50:44'),
(1137, 'App\\Models\\User', 1, 'api-token', 'cad6839cfdab0c82facd82ad047f853f67e28b0b7f308fd444d7bebd9d1a1883', '[\"*\"]', '2025-09-29 00:51:33', NULL, '2025-09-29 00:51:22', '2025-09-29 00:51:33'),
(1143, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c4176337c68955d92126d0f590a5dc32ca0a7ab374b6f35b88e10c487fa45d2b', '[\"*\"]', NULL, NULL, '2025-09-29 00:56:45', '2025-09-29 00:56:45'),
(1144, 'App\\Models\\User', 1, 'api-token', '4e74493ab80b3bd885ca94815f1e48389bc1188d60e3dd4e658103415618954b', '[\"*\"]', '2025-09-29 03:17:23', NULL, '2025-09-29 00:56:54', '2025-09-29 03:17:23'),
(1145, 'App\\Models\\User', 1, 'api-token', '8a13931bd4822e7e08ea92fbea215e04ffefeddd50064ff703e00914d6d09e2e', '[\"*\"]', '2025-09-29 01:06:16', NULL, '2025-09-29 01:04:46', '2025-09-29 01:06:16'),
(1146, 'App\\Models\\User', 1, 'api-token', 'a3b7be2c7bb81631e44be98ec4d17011474d968cb9cd43c11318a5f008a902ff', '[\"*\"]', '2025-09-29 01:06:59', NULL, '2025-09-29 01:06:34', '2025-09-29 01:06:59'),
(1147, 'App\\Models\\User', 1, 'api-token', '0f61ff76936d82ff6ae89324468fc710e28fbd4eb06ed730b687d5dd1468f910', '[\"*\"]', '2025-09-29 02:28:57', NULL, '2025-09-29 01:07:20', '2025-09-29 02:28:57'),
(1148, 'App\\Models\\User', 1, 'api-token', '8fadc67bc222d8828f07edc9c10ce3a9e78127e232bcaaf29c4b55fcdc6ac75e', '[\"*\"]', '2025-09-29 03:09:58', NULL, '2025-09-29 02:57:14', '2025-09-29 03:09:58'),
(1149, 'App\\Models\\User', 1, 'api-token', 'eb740b79270e3a004c25ab4656bfdb98b3511ad260459fbe0a9975818784d65c', '[\"*\"]', '2025-09-29 03:10:30', NULL, '2025-09-29 03:10:25', '2025-09-29 03:10:30'),
(1150, 'App\\Models\\User', 1, 'api-token', '13cc390865635f20d1c3ce97427b2d393ef8aa0c74f4722280c9423c36516ef5', '[\"*\"]', '2025-09-29 03:31:37', NULL, '2025-09-29 03:31:09', '2025-09-29 03:31:37'),
(1151, 'App\\Models\\User', 1, 'api-token', 'e2542aedfecb35c61cdd71d53851c27c501bac6866a67eceb1cc74ac684488bd', '[\"*\"]', '2025-09-29 03:33:32', NULL, '2025-09-29 03:32:23', '2025-09-29 03:33:32'),
(1152, 'App\\Models\\User', 1, 'api-token', '1d1ecf4a227cabe564cb47fa83a6fb8b0baffb3aad785f2dd09af9248823693f', '[\"*\"]', '2025-09-29 03:37:04', NULL, '2025-09-29 03:34:28', '2025-09-29 03:37:04'),
(1156, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd8b493ef40c200fffe67590929c0959d40eb054d25cb4780688c8c1b78d29e48', '[\"*\"]', '2025-09-29 03:50:03', NULL, '2025-09-29 03:49:23', '2025-09-29 03:50:03'),
(1157, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f42dea62c1ab1673e76228739bd15636ae2ad66221d213c1d159fb623c6548fb', '[\"*\"]', '2025-09-29 03:56:22', NULL, '2025-09-29 03:53:35', '2025-09-29 03:56:22'),
(1160, 'App\\Models\\User', 1, 'api-token', '30371b78ebb13140d343431c63a1dbb059965bf97d558464aa42d98ae317eec7', '[\"*\"]', '2025-09-29 04:25:37', NULL, '2025-09-29 04:19:21', '2025-09-29 04:25:37'),
(1163, 'App\\Models\\User', 1, 'api-token', 'a3458bebc009e59b003131e85279d14fd127aae3594ce674e8a5295c2767a3d8', '[\"*\"]', '2025-09-29 04:32:00', NULL, '2025-09-29 04:25:57', '2025-09-29 04:32:00'),
(1164, 'App\\Models\\User', 1, 'api-token', '94403438570b581849140ad619f5f9718de92cc2a181166c45ef754b95780cf9', '[\"*\"]', '2025-09-30 00:28:45', NULL, '2025-09-29 04:26:15', '2025-09-30 00:28:45'),
(1167, 'App\\Models\\User', 1, 'api-token', '35758519a93b077b46171414d3b7e6378af385a748138a87d08684aa42d5bce6', '[\"*\"]', '2025-09-29 04:43:40', NULL, '2025-09-29 04:37:24', '2025-09-29 04:43:40'),
(1168, 'App\\Models\\User', 1, 'api-token', '301ea4585a280593682a14938aeffe83b38434f695766055f36bef95a1c244ae', '[\"*\"]', '2025-09-29 04:44:52', NULL, '2025-09-29 04:44:10', '2025-09-29 04:44:52'),
(1169, 'App\\Models\\User', 1, 'api-token', 'a67b3b9baf80f3cafb510ec24e098e3969011789564811ff2f516ff4964b23c0', '[\"*\"]', '2025-09-29 04:47:07', NULL, '2025-09-29 04:45:18', '2025-09-29 04:47:07'),
(1170, 'App\\Models\\User', 1, 'api-token', '8c44deb6f7b15b4889d9b5be662707e68250d93f4f1dbb5457a8c1f7a566c63b', '[\"*\"]', '2025-09-29 05:00:43', NULL, '2025-09-29 04:57:57', '2025-09-29 05:00:43'),
(1171, 'App\\Models\\User', 1, 'api-token', '71a6525aa7e5cedda96965eb3627d97063b9785683802058f2d68a183f712825', '[\"*\"]', '2025-09-29 20:57:49', NULL, '2025-09-29 20:46:37', '2025-09-29 20:57:49'),
(1172, 'App\\Models\\User', 1, 'api-token', '0ceee40c1be9654981851a506ce7880b823c05d50319cb26cc2c37719124c773', '[\"*\"]', '2025-09-29 21:20:08', NULL, '2025-09-29 21:01:19', '2025-09-29 21:20:08'),
(1173, 'App\\Models\\User', 1, 'api-token', '5ffa5a8b04a25922ed48ad7e5c1cf7b3c08aba04a00a7ae2f75ac3ae8d7e3b46', '[\"*\"]', '2025-09-29 21:21:56', NULL, '2025-09-29 21:21:55', '2025-09-29 21:21:56'),
(1174, 'App\\Models\\User', 1, 'api-token', '38d79dfa4a69aeaa200f6d948e6d039cf499f6d1a383023db9ef21a4290c6ec7', '[\"*\"]', '2025-09-29 21:23:08', NULL, '2025-09-29 21:23:06', '2025-09-29 21:23:08'),
(1175, 'App\\Models\\User', 1, 'api-token', 'f4ea1aef50fa926336a7642b65fdb600b5f0faa39c2aa78040d33a4206348ada', '[\"*\"]', '2025-09-29 21:36:43', NULL, '2025-09-29 21:36:42', '2025-09-29 21:36:43'),
(1176, 'App\\Models\\User', 1, 'api-token', '59759992d29ff0971f538ca70c033c28052331cf26460c5131bc2c8bf855d9a2', '[\"*\"]', '2025-09-29 21:44:19', NULL, '2025-09-29 21:39:37', '2025-09-29 21:44:19'),
(1179, 'App\\Models\\User', 1, 'api-token', '4b018f9db232d94f693e1dd128abda58402d1c8ea6fc96f97a23d388185664cb', '[\"*\"]', '2025-09-29 22:00:08', NULL, '2025-09-29 21:54:13', '2025-09-29 22:00:08'),
(1183, 'App\\Models\\User', 1, 'api-token', '161d3e8baa775bc63a68aeda2f0c07b2bf984c94cf00aded0375cc9050cbae56', '[\"*\"]', '2025-09-29 22:10:04', NULL, '2025-09-29 22:08:35', '2025-09-29 22:10:04'),
(1187, 'App\\Models\\User', 1, 'api-token', '4d5aecf7e145c500c8db94f9b56a5aa1149ca4eeecad78eca6baaf7181b86458', '[\"*\"]', '2025-09-29 22:18:17', NULL, '2025-09-29 22:13:14', '2025-09-29 22:18:17'),
(1188, 'App\\Models\\User', 1, 'api-token', '3b27e0c10a05907e3f69b056f8d02ab7e28cc1a325ef401d8d366b57c2a1276e', '[\"*\"]', '2025-09-29 22:49:31', NULL, '2025-09-29 22:21:09', '2025-09-29 22:49:31'),
(1189, 'App\\Models\\User', 1, 'api-token', 'fc894a5e53f748982fbd0b674426f14a9180be691a452610a88517e9da20ac81', '[\"*\"]', '2025-09-29 23:10:59', NULL, '2025-09-29 23:00:49', '2025-09-29 23:10:59'),
(1193, 'App\\Models\\User', 1, 'api-token', 'fc92c4b845aeda44b05b7d4e3d5d28bdbcf9a1eca89cd4054740fdb06c3aa7ed', '[\"*\"]', '2025-09-29 23:22:40', NULL, '2025-09-29 23:21:19', '2025-09-29 23:22:40'),
(1194, 'App\\Models\\User', 1, 'api-token', '7918224409bb29d2c794ed6d42c2c495c93cc04d12a08773ca8e3661fd358f29', '[\"*\"]', '2025-09-29 23:25:28', NULL, '2025-09-29 23:24:34', '2025-09-29 23:25:28'),
(1195, 'App\\Models\\User', 1, 'api-token', 'd6816d40a94b998937f3d0d2a0e57bbba45b5a6bef31b244c6189970826c3044', '[\"*\"]', '2025-09-29 23:30:01', NULL, '2025-09-29 23:29:23', '2025-09-29 23:30:01'),
(1196, 'App\\Models\\User', 1, 'api-token', '4cad9c0939a1b5beaa00a6288428436410f5a07d1f996aa4d70a29927f25ba1f', '[\"*\"]', '2025-09-29 23:32:41', NULL, '2025-09-29 23:30:55', '2025-09-29 23:32:41'),
(1197, 'App\\Models\\User', 1, 'api-token', '34ffbc3a61b424ad34e96dee6adce36cd09e74997a9c401b71873c60a8c81e29', '[\"*\"]', '2025-09-29 23:40:38', NULL, '2025-09-29 23:38:21', '2025-09-29 23:40:38'),
(1198, 'App\\Models\\User', 1, 'api-token', 'a0ce72e2a37fc6fb92cce10afb597cd803f12cca1af7465636d888036c344aa5', '[\"*\"]', '2025-09-29 23:42:59', NULL, '2025-09-29 23:42:39', '2025-09-29 23:42:59'),
(1199, 'App\\Models\\User', 1, 'api-token', 'f3ebd4c831583de3e4adddd535059b5d26bbca42fbefcf84a6d3d4558c961852', '[\"*\"]', '2025-09-29 23:59:22', NULL, '2025-09-29 23:45:56', '2025-09-29 23:59:22'),
(1200, 'App\\Models\\User', 1, 'api-token', 'e69a3f48655c8f5a47b65cb5452efe95d21e093236e9698069f4c0c50b073040', '[\"*\"]', '2025-09-30 00:01:53', NULL, '2025-09-30 00:01:43', '2025-09-30 00:01:53'),
(1201, 'App\\Models\\User', 1, 'api-token', 'd8a1639b0c069e4dbf5029ea93a4a20d04945e50503e29c4d9c3c81ff7728b8f', '[\"*\"]', '2025-09-30 00:09:31', NULL, '2025-09-30 00:09:25', '2025-09-30 00:09:31'),
(1202, 'App\\Models\\User', 1, 'api-token', '17bc1d91e7e39f53a3f7fa9a64efe46fe3cb953fccea3897446a43a50356c624', '[\"*\"]', '2025-09-30 00:10:24', NULL, '2025-09-30 00:10:16', '2025-09-30 00:10:24'),
(1203, 'App\\Models\\User', 1, 'api-token', '491ab0f5d882f5ac01b3ac14a71ac426c8238da2bd5cccb9c91e592cf589362f', '[\"*\"]', '2025-09-30 00:16:18', NULL, '2025-09-30 00:14:09', '2025-09-30 00:16:18'),
(1204, 'App\\Models\\User', 1, 'api-token', 'bfc0ad57573533cd307ea71bde1fc19f1677375f43a77abc30c19614a1c0d24c', '[\"*\"]', '2025-09-30 00:18:47', NULL, '2025-09-30 00:17:33', '2025-09-30 00:18:47'),
(1205, 'App\\Models\\User', 1, 'api-token', '49b03aff9e19ef7086f6d4c97df0238c11806800fdccd626dfce0e0011a22a65', '[\"*\"]', '2025-09-30 00:23:28', NULL, '2025-09-30 00:21:03', '2025-09-30 00:23:28'),
(1206, 'App\\Models\\User', 1, 'api-token', 'fd515f173d23f3035ababf8eb0734b087e7f4a138b29652d2d976a7b68486b01', '[\"*\"]', '2025-09-30 00:25:27', NULL, '2025-09-30 00:24:49', '2025-09-30 00:25:27'),
(1211, 'App\\Models\\User', 1, 'api-token', '444357d763bb3898781090b58d6cd1bf93bc6ee8bd09bd85d42997a7bd3614bd', '[\"*\"]', '2025-09-30 02:00:41', NULL, '2025-09-30 01:59:44', '2025-09-30 02:00:41'),
(1212, 'App\\Models\\User', 1, 'api-token', 'd486c0df37be96fd00184e5b26f44a2abf99d6a06866e397e5294eaa7fd15b42', '[\"*\"]', '2025-09-30 02:03:31', NULL, '2025-09-30 02:03:09', '2025-09-30 02:03:31'),
(1213, 'App\\Models\\User', 1, 'api-token', '387180da1e1e78365d71a90ad3202e30a30be4e3751f71c409d748961ca8fea7', '[\"*\"]', '2025-09-30 02:14:43', NULL, '2025-09-30 02:10:16', '2025-09-30 02:14:43'),
(1214, 'App\\Models\\User', 1, 'api-token', 'a75228740f0e82aa5d1209347800ed4263e34fef445a33e82e4e99f00e301f20', '[\"*\"]', '2025-09-30 02:44:35', NULL, '2025-09-30 02:43:48', '2025-09-30 02:44:35'),
(1215, 'App\\Models\\User', 1, 'api-token', 'd3b72faf05227fa9706ed8cf22f017ed5e083ce5d5414fcdaf878b747354e347', '[\"*\"]', '2025-09-30 02:58:38', NULL, '2025-09-30 02:47:41', '2025-09-30 02:58:38'),
(1216, 'App\\Models\\User', 1, 'api-token', '7a4967709eec1c043fbdf0708741af9eef466489c8e15e093d7e9066beab4811', '[\"*\"]', '2025-09-30 03:07:53', NULL, '2025-09-30 03:06:15', '2025-09-30 03:07:53'),
(1217, 'App\\Models\\User', 1, 'api-token', '19fec984f8beebaee080d374ce3ae754bf63d999a57d66e3bb9ad519d67e8bd0', '[\"*\"]', '2025-09-30 03:10:36', NULL, '2025-09-30 03:08:07', '2025-09-30 03:10:36'),
(1218, 'App\\Models\\User', 1, 'api-token', 'd647b0718acfa4ac82093e1b0a6b504978133343b30fe8cbbf15685a085cd7ab', '[\"*\"]', '2025-09-30 03:21:10', NULL, '2025-09-30 03:16:44', '2025-09-30 03:21:10'),
(1219, 'App\\Models\\User', 1, 'api-token', 'e1160018a3432026d087efb0c8bde5f3637d150514f835d0b300b9c1f6aadc11', '[\"*\"]', '2025-09-30 03:30:04', NULL, '2025-09-30 03:29:53', '2025-09-30 03:30:04'),
(1220, 'App\\Models\\User', 1, 'api-token', '03e512f8257aa267df2e0c840045c0ce94e1bf00ddac869066f2d224e2898979', '[\"*\"]', '2025-09-30 03:33:20', NULL, '2025-09-30 03:32:49', '2025-09-30 03:33:20'),
(1221, 'App\\Models\\User', 1, 'api-token', '4a46b905afcfdbc04fb67470cb3218aa0c7eff25c186923de702c4e27889a0a8', '[\"*\"]', '2025-09-30 03:37:01', NULL, '2025-09-30 03:36:52', '2025-09-30 03:37:01'),
(1223, 'App\\Models\\User', 1, 'api-token', 'd23fb7b4e18179aee7af4133fe07bf14b3f5fe2da72c653b2f6dd7d253faa83f', '[\"*\"]', '2025-09-30 03:49:25', NULL, '2025-09-30 03:44:10', '2025-09-30 03:49:25'),
(1224, 'App\\Models\\User', 1, 'api-token', '1dcf5a8874df32de138342a5b2947355f65ae145cf3d5b8f34a6b3d04b100691', '[\"*\"]', '2025-09-30 03:51:02', NULL, '2025-09-30 03:50:10', '2025-09-30 03:51:02'),
(1225, 'App\\Models\\User', 1, 'api-token', '1d91b97acf7c17f5e18e72f5fe956f29efef688e8ba34c97bf5fab40bbf7178e', '[\"*\"]', '2025-09-30 03:57:30', NULL, '2025-09-30 03:52:39', '2025-09-30 03:57:30'),
(1226, 'App\\Models\\User', 1, 'api-token', '35697fa8456032fa040b592be0c87442bdf722098321fad80ae77367e636c2a8', '[\"*\"]', '2025-09-30 04:04:31', NULL, '2025-09-30 04:03:39', '2025-09-30 04:04:31'),
(1227, 'App\\Models\\User', 1, 'api-token', 'cf3fadb51947047c45f61ebf9cbd0b67141b03e9631c4186612de84ed36551c6', '[\"*\"]', '2025-09-30 04:05:20', NULL, '2025-09-30 04:05:10', '2025-09-30 04:05:20'),
(1228, 'App\\Models\\User', 1, 'api-token', '0ea0ca24644f6429e9397a5e096cfd9a30bf51d49049d1b13625be456c54b8d5', '[\"*\"]', '2025-09-30 04:08:45', NULL, '2025-09-30 04:06:09', '2025-09-30 04:08:45'),
(1229, 'App\\Models\\User', 1, 'api-token', '58b7048b9fed708898ee0cf3ac5ea09e32eb6cfd4a802161110418cce063aa9e', '[\"*\"]', '2025-09-30 04:17:53', NULL, '2025-09-30 04:09:53', '2025-09-30 04:17:53'),
(1230, 'App\\Models\\User', 1, 'api-token', '8867695c2a9f7d6961c71f55979f3263f9d76b89bfc986b3abe5a3a2c8ee7043', '[\"*\"]', '2025-09-30 04:19:10', NULL, '2025-09-30 04:18:31', '2025-09-30 04:19:10'),
(1231, 'App\\Models\\User', 1, 'api-token', 'ade1409f4497dc17a14cbafd333801a0acd88182a5a7ee06e07d9448f33df245', '[\"*\"]', '2025-09-30 04:21:57', NULL, '2025-09-30 04:20:08', '2025-09-30 04:21:57'),
(1232, 'App\\Models\\User', 1, 'api-token', 'b5562943707dd0e5f662579f3e0851352b04ee7c1e5dc84bab4b857b3dca1d72', '[\"*\"]', '2025-09-30 04:34:02', NULL, '2025-09-30 04:33:52', '2025-09-30 04:34:02'),
(1235, 'App\\Models\\User', 1, 'api-token', 'f82840be03337a6b76cee4daf6ccf9bd286679a8609fa571d01bf7b625f97e52', '[\"*\"]', '2025-09-30 04:40:27', NULL, '2025-09-30 04:40:25', '2025-09-30 04:40:27'),
(1237, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a95a2d95143babba15cd6b779bbe8c76010cbaec7518eb2c049cb50dac3508e2', '[\"*\"]', '2025-09-30 04:50:24', NULL, '2025-09-30 04:47:44', '2025-09-30 04:50:24'),
(1238, 'App\\Models\\User', 1, 'api-token', '38840cb8499f4023bdf410ffc9b889044f830c5a8a6b9457b19a2a58627f8e30', '[\"*\"]', '2025-09-30 05:06:22', NULL, '2025-09-30 04:55:28', '2025-09-30 05:06:22'),
(1239, 'App\\Models\\User', 1, 'api-token', '49fbe1890b7feb27f7fd3ef24247b5e471b11558243050c5e2cf9d0dfb889836', '[\"*\"]', NULL, NULL, '2025-09-30 20:59:17', '2025-09-30 20:59:17'),
(1245, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '17b823a0123df9ff104f32c66bc775187ec0493385df3551aa197252441461a6', '[\"*\"]', '2025-09-30 21:30:57', NULL, '2025-09-30 21:29:34', '2025-09-30 21:30:57'),
(1247, 'App\\Models\\User', 110, 'api-token', '8733eef3485e422e61d07a7d3f76bfdf591f4614e335d101edffdbf35bf32af5', '[\"*\"]', '2025-09-30 21:38:18', NULL, '2025-09-30 21:36:54', '2025-09-30 21:38:18'),
(1252, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '38d519c43fc8a99f71192ddcd7be6d11fe1d5ed4097e839f706b87759884ceb6', '[\"*\"]', '2025-09-30 22:06:22', NULL, '2025-09-30 22:06:19', '2025-09-30 22:06:22'),
(1254, 'App\\Models\\User', 1, 'api-token', 'd733bf988406b0310502dbb8b7d39196a164b54d1b07e8603e45ceb549028064', '[\"*\"]', '2025-09-30 22:08:31', NULL, '2025-09-30 22:08:24', '2025-09-30 22:08:31'),
(1262, 'App\\Models\\User', 111, 'api-token', 'f81ba36ff9ff3eaf6e75a0c4e9bc9883ebb782da9550062136bb09a69d79d2a3', '[\"*\"]', '2025-09-30 23:53:46', NULL, '2025-09-30 22:56:35', '2025-09-30 23:53:46'),
(1263, 'App\\Models\\User', 1, 'api-token', '4661a33badd892be3e490908d2fb4112a3e6f201a38bb3d27bb14267a57a5940', '[\"*\"]', '2025-09-30 23:19:54', NULL, '2025-09-30 23:09:43', '2025-09-30 23:19:54'),
(1264, 'App\\Models\\User', 1, 'api-token', '90f56e674a38ce5bc33bd02d5b13638de56cc3e7c74acefe65da794812e436d2', '[\"*\"]', '2025-09-30 23:22:57', NULL, '2025-09-30 23:22:45', '2025-09-30 23:22:57'),
(1265, 'App\\Models\\User', 1, 'api-token', '8538e6031a96fda6a3e9d34d54546c32e419573cb9417d89595930e7f875000c', '[\"*\"]', '2025-09-30 23:25:27', NULL, '2025-09-30 23:23:54', '2025-09-30 23:25:27'),
(1266, 'App\\Models\\User', 1, 'api-token', '5b4794d38e9af678e4c097b53fee6a5c6a14de4e7154c52bf3164b36fac2773f', '[\"*\"]', '2025-09-30 23:28:31', NULL, '2025-09-30 23:25:58', '2025-09-30 23:28:31'),
(1267, 'App\\Models\\User', 1, 'api-token', '5f146c852d8845826232821c27160e458a8a54f6bb9f337cc7e5f9eb83aa92e5', '[\"*\"]', '2025-09-30 23:29:07', NULL, '2025-09-30 23:28:46', '2025-09-30 23:29:07'),
(1268, 'App\\Models\\User', 1, 'api-token', '699e761d098175b5d769751fc063bdc0c36a24d7c6bfed055f838f590d416ee3', '[\"*\"]', '2025-09-30 23:35:46', NULL, '2025-09-30 23:34:50', '2025-09-30 23:35:46'),
(1269, 'App\\Models\\User', 1, 'api-token', 'ec1fb7175ac6684c7a6e64a03b2ee733e6cc247d322f49e62f9b16598538f3a6', '[\"*\"]', '2025-09-30 23:40:16', NULL, '2025-09-30 23:39:56', '2025-09-30 23:40:16'),
(1270, 'App\\Models\\User', 1, 'api-token', 'abb11a1a6211cc5354d2721c4ac8fb441d663b76d24389e441fc8658ecc4037e', '[\"*\"]', '2025-09-30 23:47:34', NULL, '2025-09-30 23:41:11', '2025-09-30 23:47:34'),
(1272, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c3070c9b3bb4be2ef6993cc6bc568f3afe5840cd656fc3f7003a2783c5a40c32', '[\"*\"]', '2025-10-01 00:24:43', NULL, '2025-10-01 00:23:59', '2025-10-01 00:24:43'),
(1276, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eaa2aedef417f392afadfc558fbd10390ed06da2b74175eb6c1170244c685cc9', '[\"*\"]', '2025-10-02 02:36:49', NULL, '2025-10-01 00:37:32', '2025-10-02 02:36:49'),
(1277, 'App\\Models\\User', 1, 'api-token', 'b27fd43dd0e70bb7f6efec5e057ed8870f87ed8996910330e47eb558a8e89d6b', '[\"*\"]', '2025-10-01 02:10:23', NULL, '2025-10-01 02:00:46', '2025-10-01 02:10:23'),
(1278, 'App\\Models\\User', 1, 'api-token', '1e550a022cddfeae9937a5fffb0a46456ab1b5bbc68113d1b0ee7226ac96580f', '[\"*\"]', '2025-10-01 02:42:16', NULL, '2025-10-01 02:16:37', '2025-10-01 02:42:16'),
(1281, 'App\\Models\\User', 1, 'api-token', '14b1942c3d3bf4b28cd2eb40fed7f897368c550d597ce03efcf0083443913e8d', '[\"*\"]', '2025-10-01 03:02:29', NULL, '2025-10-01 03:02:27', '2025-10-01 03:02:29'),
(1282, 'App\\Models\\User', 1, 'api-token', '0dd7a2c70f69662a785beb0ebabc8b2104852e72b31ccf85430f5a894da25b5e', '[\"*\"]', '2025-10-01 03:29:13', NULL, '2025-10-01 03:26:03', '2025-10-01 03:29:13'),
(1283, 'App\\Models\\User', 1, 'api-token', 'a6f859eccfdd0c3fe5a52e9dc528e4063a0e4c3e93453ead87d5a41d3d486780', '[\"*\"]', '2025-10-01 04:10:30', NULL, '2025-10-01 04:10:29', '2025-10-01 04:10:30'),
(1284, 'App\\Models\\User', 1, 'api-token', '1b239d4e7c6c20a5cc426b6b53e4e8c413449efa522f24c745058781b9becb72', '[\"*\"]', '2025-10-01 04:15:07', NULL, '2025-10-01 04:15:05', '2025-10-01 04:15:07'),
(1289, 'App\\Models\\User', 1, 'api-token', '92b3d6abcb5bf7679f31a6276ad00a61134640722f5bd26cb5ce4893e96d5e51', '[\"*\"]', '2025-10-01 20:55:57', NULL, '2025-10-01 20:54:13', '2025-10-01 20:55:57'),
(1291, 'App\\Models\\User', 1, 'api-token', 'ad0ef277009bba75873ea6a9e9aa3e768ee02e903c8afb6ef855049f44c3d16a', '[\"*\"]', '2025-10-02 01:36:21', NULL, '2025-10-02 00:18:51', '2025-10-02 01:36:21'),
(1294, 'App\\Models\\User', 1, 'api-token', '5a08c37ef7f2a9fac274f8a1b759ca7489b0abdc85f4b05e83c60b949035f767', '[\"*\"]', '2025-10-02 01:00:36', NULL, '2025-10-02 00:53:27', '2025-10-02 01:00:36'),
(1295, 'App\\Models\\User', 1, 'api-token', '52d0fd1c2d480c868ac57e7f88a2b4817149ee6ae28980fe6e20f9a2c4335012', '[\"*\"]', '2025-10-02 01:42:29', NULL, '2025-10-02 01:01:29', '2025-10-02 01:42:29'),
(1297, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8beb5f2afdad86e077bde607829dfd8ebf7c7ac697c4ce6b5e9bb899cabbabdc', '[\"*\"]', '2025-10-02 01:43:10', NULL, '2025-10-02 01:43:07', '2025-10-02 01:43:10'),
(1298, 'App\\Models\\User', 1, 'api-token', '2bc3fae0412992b3d8628b4a181556734604e1ea1b103884ee1cf0e6df3c0527', '[\"*\"]', '2025-10-02 01:45:14', NULL, '2025-10-02 01:45:13', '2025-10-02 01:45:14'),
(1301, 'App\\Models\\User', 1, 'api-token', 'bbab65284802a97b5ac3528cf0d71c75d47e7142e7b5da082b10e8ba0f06cd1b', '[\"*\"]', '2025-10-02 02:32:31', NULL, '2025-10-02 02:32:00', '2025-10-02 02:32:31'),
(1303, 'App\\Models\\User', 1, 'api-token', '8dcf70cf71637d9743955c60e4e92b0a43468341f1fff87d17ac2f061b002a99', '[\"*\"]', '2025-10-02 02:46:14', NULL, '2025-10-02 02:40:24', '2025-10-02 02:46:14'),
(1306, 'App\\Models\\User', 1, 'api-token', '994ec0cbfeb708266f30c5f039a428d565bfae8a7a889b8aac8e2097ce7ba960', '[\"*\"]', '2025-10-02 03:15:13', NULL, '2025-10-02 03:06:21', '2025-10-02 03:15:13'),
(1307, 'App\\Models\\User', 1, 'api-token', '39972a872f10d161da169853336f70632527af18ed7b45d1601f0b7ecd3528b3', '[\"*\"]', '2025-10-02 03:46:44', NULL, '2025-10-02 03:16:19', '2025-10-02 03:46:44'),
(1308, 'App\\Models\\User', 1, 'api-token', '937cfc372200c61f412b58230e895ef58cba47bd9dec0b9e0eb9fdd3e98c44ae', '[\"*\"]', '2025-10-02 03:59:32', NULL, '2025-10-02 03:58:05', '2025-10-02 03:59:32'),
(1309, 'App\\Models\\User', 1, 'api-token', '2a959811b77108f5cbc49add423a40f73fed7065faba32b6fd5678c8d9a8b4b9', '[\"*\"]', '2025-10-02 04:04:52', NULL, '2025-10-02 04:03:56', '2025-10-02 04:04:52'),
(1310, 'App\\Models\\User', 1, 'api-token', '0291c5642aee8da5079351d5925e8f040ed51fa733bf7fbe6b0e1dfa5625dfae', '[\"*\"]', '2025-10-02 04:13:15', NULL, '2025-10-02 04:08:38', '2025-10-02 04:13:15'),
(1311, 'App\\Models\\User', 1, 'api-token', '3a773254994accc9092a868acaa2f040a6fcee0390d7c65c6e6abf3c9fcb1e4b', '[\"*\"]', '2025-10-02 04:16:23', NULL, '2025-10-02 04:16:21', '2025-10-02 04:16:23'),
(1312, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '26f8916ade740b9c9943bdb1bbe0a2b493c097a49f7e708612caab1165262b07', '[\"*\"]', '2025-10-02 04:58:18', NULL, '2025-10-02 04:21:35', '2025-10-02 04:58:18'),
(1313, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b19835e1971edff9555d1ccd5c892a7f297a4dd6619925584307d4ac1e3740a2', '[\"*\"]', '2025-10-02 05:08:43', NULL, '2025-10-02 05:04:58', '2025-10-02 05:08:43'),
(1314, 'App\\Models\\User', 1, 'api-token', '877e25e7e267e71426d2c1f860f227965f747e9d134ad7b8faea6e61c9bbc9b8', '[\"*\"]', '2025-10-02 12:24:49', NULL, '2025-10-02 12:23:35', '2025-10-02 12:24:49'),
(1315, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd291efb63e7db77614e3493e8e63843115474217ada36325c07f83cdca35ad1e', '[\"*\"]', '2025-10-05 20:54:49', NULL, '2025-10-05 20:52:23', '2025-10-05 20:54:49'),
(1316, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '43d5be4c02c049a33dbf1064c364c3bd7d4f85ed854e283f74714febe4a722bc', '[\"*\"]', '2025-10-05 21:01:44', NULL, '2025-10-05 20:58:47', '2025-10-05 21:01:44'),
(1318, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f4a04d8e8a837c8ecee9a64622acbcf0ce664e1c450bf1006db66e033fbd69b7', '[\"*\"]', '2025-10-05 21:08:21', NULL, '2025-10-05 21:08:14', '2025-10-05 21:08:21'),
(1319, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '08d3a863e9912dec157f1b10aa089ce55b19058c64c90fae117ae4801333e2fa', '[\"*\"]', '2025-10-05 21:15:22', NULL, '2025-10-05 21:14:29', '2025-10-05 21:15:22'),
(1320, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c0a9e8128e31274f949099425ed66f75e80b85b283f9172edeb5b3dc5671b594', '[\"*\"]', '2025-10-05 21:17:23', NULL, '2025-10-05 21:16:34', '2025-10-05 21:17:23'),
(1321, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '43093e50e5398bb993604ff35e62c2fdd2b1f20abddd25f8dff01532a9f3655f', '[\"*\"]', '2025-10-05 21:19:35', NULL, '2025-10-05 21:18:52', '2025-10-05 21:19:35'),
(1322, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '63caac04007df798517acf7a796177feaca4d5b606c2ff2a9a43f22f64e0cf89', '[\"*\"]', '2025-10-05 21:21:40', NULL, '2025-10-05 21:20:43', '2025-10-05 21:21:40'),
(1323, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b8c7c2da2c33fe1bbd49884d6c3959dfa7247eea16cfa3376bdc713c3ad3e66d', '[\"*\"]', '2025-10-05 21:27:57', NULL, '2025-10-05 21:27:25', '2025-10-05 21:27:57'),
(1324, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9fee7b319eb350933a04828ac9c8ec1dcf49dd6a4cb9b41469746d6f2960daf6', '[\"*\"]', '2025-10-05 21:30:21', NULL, '2025-10-05 21:29:37', '2025-10-05 21:30:21'),
(1325, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0dd3665792da54cfcf049235b41062f4df7907c31b428bcc3799c367846fefd4', '[\"*\"]', '2025-10-05 21:49:20', NULL, '2025-10-05 21:38:25', '2025-10-05 21:49:20'),
(1326, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4c336bcc3de085da224e6e0805e741ddc9b4b674f4d18a939749d7965c47115c', '[\"*\"]', '2025-10-05 22:13:42', NULL, '2025-10-05 21:49:53', '2025-10-05 22:13:42'),
(1327, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f42e29b91fbe774b679e96305ef1aeacdc8a5b27a4c43fa3919eb69cf3bbad7e', '[\"*\"]', '2025-10-05 22:18:15', NULL, '2025-10-05 22:16:47', '2025-10-05 22:18:15'),
(1328, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c9b98d0a3455c4ae6ca0f2751d3567239e10f46b4fdab8335c834a5f02459fb2', '[\"*\"]', '2025-10-05 22:19:03', NULL, '2025-10-05 22:18:56', '2025-10-05 22:19:03'),
(1329, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '690609effbeae89b3392cb47ae8e673c7ab12f80b1a2b83b6c09a760824cd60e', '[\"*\"]', '2025-10-05 22:22:50', NULL, '2025-10-05 22:20:31', '2025-10-05 22:22:50'),
(1330, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f4f4608f41dc3530fceb17fcc6b8257025b37acdc059195fc261f52e5837675', '[\"*\"]', '2025-10-05 22:31:07', NULL, '2025-10-05 22:25:06', '2025-10-05 22:31:07'),
(1331, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f88dfc4aacb29cf9757f940ad94fc30b2ecdd1e67cd98e66934fa7f718f4dba5', '[\"*\"]', '2025-10-05 22:44:38', NULL, '2025-10-05 22:31:19', '2025-10-05 22:44:38'),
(1332, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '147a1cf3f6899a0ce1bc8dfbaf3a60bfd412a1fadb88bca52b324746f4577aad', '[\"*\"]', '2025-10-05 23:03:26', NULL, '2025-10-05 22:45:03', '2025-10-05 23:03:26'),
(1333, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ed8c23aa9dbc06a4a70d2c9c05314561e296c2bdee7f7e4bd8555839436b4059', '[\"*\"]', '2025-10-05 23:10:40', NULL, '2025-10-05 23:03:48', '2025-10-05 23:10:40'),
(1336, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bf32b2e0c759407c70322ade6de8e4efd3125b9c371f11754bd6164d616cd0be', '[\"*\"]', '2025-10-05 23:17:55', NULL, '2025-10-05 23:15:51', '2025-10-05 23:17:55'),
(1337, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6ef90e7151ad88a44f4403453b73760c15418965f9dbe38f127b7f6a7d524363', '[\"*\"]', '2025-10-05 23:29:55', NULL, '2025-10-05 23:19:17', '2025-10-05 23:29:55'),
(1338, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7e5a2aca0d963c5f1761ddc71f13714b0c876987579fc46f2da7a958b0db4efd', '[\"*\"]', '2025-10-05 23:30:15', NULL, '2025-10-05 23:30:09', '2025-10-05 23:30:15'),
(1339, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6a1e50f4c9e126c866b09f95ed3a7df0a32ff48c094c9c5136f6e84a8f5b0dc6', '[\"*\"]', '2025-10-05 23:33:17', NULL, '2025-10-05 23:31:08', '2025-10-05 23:33:17'),
(1340, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'da359679d472b7098bcfc21234b14f49c16668feff7e4cc19e5e831353cc8636', '[\"*\"]', '2025-10-05 23:34:27', NULL, '2025-10-05 23:33:39', '2025-10-05 23:34:27'),
(1348, 'Modules\\Restaurant\\Entities\\Restaurant', 2, 'restaurant-api-token', '4f7363f86bb673539431f6d03b74161f4d45e1f1b6fdabaa15b7e4b08d2e36a3', '[\"*\"]', '2025-10-05 23:57:38', NULL, '2025-10-05 23:55:50', '2025-10-05 23:57:38'),
(1350, 'App\\Models\\User', 115, 'api-token', '7a1e517c00deb3c7e9b87e7abc8dca0ef67b9571f0723978c44697d437e9e803', '[\"*\"]', '2025-10-06 00:06:21', NULL, '2025-10-06 00:06:16', '2025-10-06 00:06:21'),
(1351, 'App\\Models\\User', 1, 'api-token', '0cea82e3ac9efb46ae9689316c3584495fd91e6d36a89b08d68297f9a21f9839', '[\"*\"]', '2025-10-06 00:09:55', NULL, '2025-10-06 00:09:05', '2025-10-06 00:09:55'),
(1353, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0744a462d623271d2f955c2f5feec8481b84ac8b59b48cbf66850c929c59c53d', '[\"*\"]', '2025-10-06 00:11:28', NULL, '2025-10-06 00:11:00', '2025-10-06 00:11:28'),
(1355, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '470e026110f3b6d6523953f5302ad4f2f28040c7e4c2d278a66f51af93cc2045', '[\"*\"]', '2025-10-06 00:20:05', NULL, '2025-10-06 00:13:35', '2025-10-06 00:20:05'),
(1356, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4c2982c005ecbc8f4e81e6a3ac0ccd2510347165c4f26c2349e247bf47aacf37', '[\"*\"]', '2025-10-06 00:22:06', NULL, '2025-10-06 00:21:46', '2025-10-06 00:22:06'),
(1357, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '57e13c7180f65bc2990fb898c44f33aa678ba0ae1ae541abb3e8739095e8af00', '[\"*\"]', '2025-10-06 00:32:03', NULL, '2025-10-06 00:24:28', '2025-10-06 00:32:03'),
(1359, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cc4a315d55d7985d2f2c37f88d33b29ca6358c62a6f9b6766c5a0b59cf70c3d0', '[\"*\"]', '2025-10-06 00:41:46', NULL, '2025-10-06 00:32:51', '2025-10-06 00:41:46'),
(1360, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bed470add86fde2407cfcf839a89830fd90a296fe6ef867e8e8261c228f305f1', '[\"*\"]', '2025-10-06 00:43:19', NULL, '2025-10-06 00:43:11', '2025-10-06 00:43:19'),
(1361, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd31c45f788856289e0230c2360d80d1f2796759359f9e391cdcc4676c9c022cb', '[\"*\"]', '2025-10-06 01:04:45', NULL, '2025-10-06 00:44:11', '2025-10-06 01:04:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1362, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'af6a94e2ef00224378851b8ab68e649c4d302bfa284a39eb29d9637b8fafcb0e', '[\"*\"]', '2025-10-06 01:08:50', NULL, '2025-10-06 01:05:08', '2025-10-06 01:08:50'),
(1363, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '348155efdc70a2bc9a71d8d5f240376bb57dc1514aa7978ada48916424c4f43d', '[\"*\"]', '2025-10-06 01:43:19', NULL, '2025-10-06 01:42:20', '2025-10-06 01:43:19'),
(1364, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6dfb74f3ce44cf3f81380a6ca21f607fcfdf25c65fc0eb9518e30a7b1c923059', '[\"*\"]', '2025-10-06 01:58:57', NULL, '2025-10-06 01:58:52', '2025-10-06 01:58:57'),
(1365, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e4c306f11434867234b10159899f6aeb8b326fce916ff0a8304549d4595bcb3b', '[\"*\"]', '2025-10-06 02:19:02', NULL, '2025-10-06 02:01:10', '2025-10-06 02:19:02'),
(1366, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6db46492fe47fa8b76964a75534c655e6fedb5365ef3d751d1c11a07cbc5d3e0', '[\"*\"]', '2025-10-06 02:28:37', NULL, '2025-10-06 02:12:37', '2025-10-06 02:28:37'),
(1368, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '50a6e85ed7ef47e4688d17a9d7fd2360e55fad608ad04b9d4eb92d5facb07c2d', '[\"*\"]', NULL, NULL, '2025-10-06 02:56:01', '2025-10-06 02:56:01'),
(1369, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '81f2f240f0f4469c6f892ecbc7928747a04ef2aaad7cec83e11ab927498aa58f', '[\"*\"]', NULL, NULL, '2025-10-06 02:58:09', '2025-10-06 02:58:09'),
(1370, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', 'f76d871a623338f3e7798b31273c30aa63732eac1eefb0b400589cd4db988dc9', '[\"*\"]', '2025-10-06 03:12:24', NULL, '2025-10-06 02:59:11', '2025-10-06 03:12:24'),
(1372, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', 'ced5d41363e3b84c4d03cb65e4d92c43ff9da563b61abb004fb5c0a3a0acc968', '[\"*\"]', NULL, NULL, '2025-10-06 03:09:46', '2025-10-06 03:09:46'),
(1373, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '6dad1b455efc6a05f25931343d4ae6ca84b3ffec5975e54cd959f223e699ee8e', '[\"*\"]', NULL, NULL, '2025-10-06 03:11:12', '2025-10-06 03:11:12'),
(1374, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', 'd86b68b0b33f954ae9dd74d844cd63cc2086f7607368d920a572d166aecfb7b7', '[\"*\"]', NULL, NULL, '2025-10-06 03:11:44', '2025-10-06 03:11:44'),
(1375, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dbc4286660b2036a5e3319e06ecb68b11c0d1a611a9e757f9ad8a5148482474e', '[\"*\"]', '2025-10-06 03:14:04', NULL, '2025-10-06 03:13:22', '2025-10-06 03:14:04'),
(1380, 'App\\Models\\User', 116, 'api-token', '7e89834a15ba2f39f01f2a9ad648d1d97f6c02d7cfd7782bdfecbb75d2e952ff', '[\"*\"]', '2025-10-06 03:54:19', NULL, '2025-10-06 03:43:12', '2025-10-06 03:54:19'),
(1381, 'App\\Models\\User', 116, 'api-token', '7e3f13d7cc05a292b18dc3753662e737596602913aaf5936946cff19f9cc196c', '[\"*\"]', '2025-10-06 04:31:47', NULL, '2025-10-06 03:45:43', '2025-10-06 04:31:47'),
(1382, 'App\\Models\\User', 1, 'api-token', '9be2a13d7111638c2a24d6f7a6a369fa03dcbbdf5e7159b83796b0a036be3097', '[\"*\"]', '2025-10-06 03:56:13', NULL, '2025-10-06 03:56:11', '2025-10-06 03:56:13'),
(1383, 'App\\Models\\User', 1, 'api-token', 'dc1541cf5e290e1edf84eef10a8e1317265a6b346d2ca0637a766e9dce37dc33', '[\"*\"]', '2025-10-06 04:02:55', NULL, '2025-10-06 04:02:53', '2025-10-06 04:02:55'),
(1387, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', 'afd30f6978aa72a5012b6574ca4a4d81e655529717451d3d68031b99fca7d764', '[\"*\"]', '2025-10-06 04:09:23', NULL, '2025-10-06 04:09:13', '2025-10-06 04:09:23'),
(1389, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '0ef06dfea9d9e964026c64f18d90ad87636e3866e25e88424fac773247fec539', '[\"*\"]', '2025-10-06 04:18:19', NULL, '2025-10-06 04:12:58', '2025-10-06 04:18:19'),
(1390, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', 'b6e45646b968fa6a7fe9474b2cbc6a2afcf5fc185db02a061c3ac34725c91662', '[\"*\"]', '2025-10-06 04:25:36', NULL, '2025-10-06 04:19:02', '2025-10-06 04:25:36'),
(1392, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '21f2ffbefdef64299c6b50fc1b7248b7b6dcc15798e77831725896c8d964e728', '[\"*\"]', NULL, NULL, '2025-10-06 04:28:54', '2025-10-06 04:28:54'),
(1393, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '957f9091fd647a308b78299a7489ec9b4686738319d6f7b5102a339dd323b25a', '[\"*\"]', '2025-10-06 05:02:00', NULL, '2025-10-06 04:31:22', '2025-10-06 05:02:00'),
(1395, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', 'cacba791edc4251362df86d60424aaeb2d2980994b5a123097c1d073361316e6', '[\"*\"]', '2025-10-06 04:37:55', NULL, '2025-10-06 04:36:52', '2025-10-06 04:37:55'),
(1397, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '354c68573b4245663da170cd5c169ef78e353525e5c17d4f8294bf19711c4f82', '[\"*\"]', '2025-10-06 04:40:34', NULL, '2025-10-06 04:38:40', '2025-10-06 04:40:34'),
(1399, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '6e1d42004321274db1216f2a3e44c8a8d24d8d4649507d429dccabfe2254565d', '[\"*\"]', '2025-10-06 05:06:10', NULL, '2025-10-06 04:43:26', '2025-10-06 05:06:10'),
(1400, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '03518d15e03c4664cc4eee162741ddf058489fd40d40095141b1d80a5cebb4cd', '[\"*\"]', '2025-10-06 05:20:10', NULL, '2025-10-06 05:16:22', '2025-10-06 05:20:10'),
(1401, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7fc9660de2d385024a35c39d63e1a677e81ab510de8ea146a4466e7a60f50974', '[\"*\"]', '2025-10-06 07:40:51', NULL, '2025-10-06 07:21:55', '2025-10-06 07:40:51'),
(1402, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '659fe3b8364fea89c29aac94c59ca6bc03cabb8632e9f7ca8b46f8780192d29b', '[\"*\"]', '2025-10-06 07:51:10', NULL, '2025-10-06 07:45:47', '2025-10-06 07:51:10'),
(1403, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6d49d4800dd9f57a028f0334cdd5212200ea2c7c207cd2a203c93d9fa8502c2f', '[\"*\"]', '2025-10-06 08:00:28', NULL, '2025-10-06 08:00:07', '2025-10-06 08:00:28'),
(1404, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b253a4d1233d641238c8fa16b86b6834fa9a245cc959d0faa6e7a1692ca5f560', '[\"*\"]', '2025-10-06 08:19:25', NULL, '2025-10-06 08:03:48', '2025-10-06 08:19:25'),
(1405, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0fda606372eb6ed25062ea125d75ae2a30630f72570a3098b64427fb3c080ef3', '[\"*\"]', '2025-10-06 09:45:06', NULL, '2025-10-06 09:25:26', '2025-10-06 09:45:06'),
(1406, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6480f098976c824cd5d6965a66911df622ddabd7084da7becf3ee4dc03a974f8', '[\"*\"]', '2025-10-06 09:36:33', NULL, '2025-10-06 09:33:31', '2025-10-06 09:36:33'),
(1407, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '29d355b311eaa9dfe2ace3a83d2dd3d84638361c0133c030d7db707de41936d6', '[\"*\"]', '2025-10-06 20:59:34', NULL, '2025-10-06 20:48:01', '2025-10-06 20:59:34'),
(1408, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8e3128fbd8513d8985e8aeb8d808803b951d7571b3f3e4883d7e9e3ce0c5a4a1', '[\"*\"]', '2025-10-06 21:12:23', NULL, '2025-10-06 21:09:13', '2025-10-06 21:12:23'),
(1409, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2aaefc29e5369fcaca4312f633f8408d82ad79e2fc489fa09410ac2bef1e760f', '[\"*\"]', '2025-10-06 21:13:51', NULL, '2025-10-06 21:13:42', '2025-10-06 21:13:51'),
(1410, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '92f3b1021e97dfa141e3d15dca26d4cb651e1c7411b53dcba844349a03127f2a', '[\"*\"]', '2025-10-08 03:43:42', NULL, '2025-10-06 21:19:46', '2025-10-08 03:43:42'),
(1411, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cb989a9026fe94ec1197e687fb19d25c36e0b08abbc04d1242a0e5d88eee6366', '[\"*\"]', '2025-10-06 21:26:07', NULL, '2025-10-06 21:25:55', '2025-10-06 21:26:07'),
(1412, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0de8d04e013fb0fd6df943bb1e145c71405e248a0c5c1d36bab7a2142f7424e9', '[\"*\"]', '2025-10-06 21:29:12', NULL, '2025-10-06 21:29:05', '2025-10-06 21:29:12'),
(1413, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f2b6301d2c080be8a6148b796d44afefc3d97b50644f83c1c4069663fa934f16', '[\"*\"]', '2025-10-06 21:37:41', NULL, '2025-10-06 21:35:23', '2025-10-06 21:37:41'),
(1414, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f2c82a33e21905efd792fd9a5059dd19ac7962289a54381e090b9f94ccd7829', '[\"*\"]', '2025-10-06 21:46:32', NULL, '2025-10-06 21:40:25', '2025-10-06 21:46:32'),
(1415, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5973fc9272851e9350b5d0545c56474759db70323c1ca7b27ec01a4658001642', '[\"*\"]', '2025-10-06 21:52:00', NULL, '2025-10-06 21:48:20', '2025-10-06 21:52:00'),
(1416, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e685308ae8df041160b8123c0982d013f2c5fa800e7a3658b9230bbd4db5c5c7', '[\"*\"]', '2025-10-06 21:56:05', NULL, '2025-10-06 21:53:09', '2025-10-06 21:56:05'),
(1418, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', 'fe3cf167b0906362cb8964d19c127ca467e1af0dcd835676cd5acfa49da3988e', '[\"*\"]', NULL, NULL, '2025-10-06 22:03:59', '2025-10-06 22:03:59'),
(1419, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '238116dc072e9084759a2efd965d45edf37c4e68d525f609a11d7331f1f9e2ab', '[\"*\"]', '2025-10-06 22:07:59', NULL, '2025-10-06 22:04:34', '2025-10-06 22:07:59'),
(1420, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '68ded6196558dcb990117e7f165e64a5a1647ba71c9b49e81f2c95399dc55e93', '[\"*\"]', '2025-10-06 22:11:59', NULL, '2025-10-06 22:09:29', '2025-10-06 22:11:59'),
(1421, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '169a477cbc1969bbfe56ecd5e5c3e1752fc311d1734e9d7b27f072fb56afad81', '[\"*\"]', '2025-10-06 22:14:45', NULL, '2025-10-06 22:13:42', '2025-10-06 22:14:45'),
(1422, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '770e8fe510612ca67e5d23e84afa92df428d60e0772411bdb1917d01185043a7', '[\"*\"]', '2025-10-06 22:17:43', NULL, '2025-10-06 22:16:30', '2025-10-06 22:17:43'),
(1423, 'Modules\\Restaurant\\Entities\\Restaurant', 10, 'restaurant-api-token', '078c15ab3ac9c678ccbb94fcb37ce0ee762631846f769ca586c5bd5f58611e51', '[\"*\"]', '2025-10-06 22:19:00', NULL, '2025-10-06 22:18:54', '2025-10-06 22:19:00'),
(1425, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '1f1dfcd7a235a2b329808ab74c734ce8fc475b1d078c16fc082988076698bd28', '[\"*\"]', '2025-10-06 22:23:53', NULL, '2025-10-06 22:21:16', '2025-10-06 22:23:53'),
(1427, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'b5e93bcc199d1ff8c674df3f90cd1430efc2611119c4848fd23665da4581c821', '[\"*\"]', '2025-10-06 22:27:19', NULL, '2025-10-06 22:25:56', '2025-10-06 22:27:19'),
(1428, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '75d1a6e03ff5ca538fe58cef9aaec9d1dbdd0ed0a0738b2a3a4291633172eee8', '[\"*\"]', '2025-10-06 22:37:56', NULL, '2025-10-06 22:35:13', '2025-10-06 22:37:56'),
(1429, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'bbf70404bc4b3b4fa07cac765bb9ea3800dfa4e002a9b322d9b19b483121f5a9', '[\"*\"]', '2025-10-06 22:45:22', NULL, '2025-10-06 22:43:43', '2025-10-06 22:45:22'),
(1431, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '4cee620a4aa16dab47f706d333ca5f1d6cb1c635fda53ea7083a45dbf16bf8fa', '[\"*\"]', '2025-10-06 22:51:39', NULL, '2025-10-06 22:50:22', '2025-10-06 22:51:39'),
(1432, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '261bdcc32829dae6247979fa4e8ec9277ef42ebf8f4c28cbc02f9c4ed7e51e14', '[\"*\"]', '2025-10-06 23:01:42', NULL, '2025-10-06 22:57:22', '2025-10-06 23:01:42'),
(1434, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'ef4f5bfb18029cd315c7eb7f9bceae64026c69801940ffc90e10299f3fd963e6', '[\"*\"]', '2025-10-06 23:41:49', NULL, '2025-10-06 23:02:47', '2025-10-06 23:41:49'),
(1435, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'bd999043007b540ab22328aa5b4cbaa7df46209d8de9f00d31be2a47232f699a', '[\"*\"]', '2025-10-11 22:02:49', NULL, '2025-10-06 23:33:40', '2025-10-11 22:02:49'),
(1437, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '6058f17c8b6314ef95603e1b1091c96f03a466298cbe598b89f5049e8c75abdb', '[\"*\"]', '2025-10-06 23:44:47', NULL, '2025-10-06 23:44:40', '2025-10-06 23:44:47'),
(1438, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'fb92ced2ee5edfc6eac2dcf2a2a55c973717375b0469af1dec9c822b993efa1e', '[\"*\"]', '2025-10-06 23:47:37', NULL, '2025-10-06 23:46:07', '2025-10-06 23:47:37'),
(1439, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '43a5083bbe564ff59e14aea049ff7cb0fe1b13c12326817e0506aa7567c35b00', '[\"*\"]', '2025-10-06 23:52:46', NULL, '2025-10-06 23:49:29', '2025-10-06 23:52:46'),
(1440, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '17ef133174a51ed59dcf1bc0a1faf06485bf3919b547058c1cd03acb2042ed81', '[\"*\"]', '2025-10-07 00:05:44', NULL, '2025-10-07 00:00:47', '2025-10-07 00:05:44'),
(1441, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '142bb75677ae25ab1d943a04d4a8a432530b8f6e4fcfe560e8ea46fd66442f20', '[\"*\"]', '2025-10-07 00:17:00', NULL, '2025-10-07 00:07:49', '2025-10-07 00:17:00'),
(1443, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '05df67855571c8d5abb099aec23d4242a57b60e283adc830b8a317c39e9fd2e7', '[\"*\"]', '2025-10-07 00:23:16', NULL, '2025-10-07 00:20:42', '2025-10-07 00:23:16'),
(1445, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '60c6cc527938a99f83f8b6eff43a25eb462251102ac5f9590a02fa036560f79f', '[\"*\"]', '2025-10-07 00:29:35', NULL, '2025-10-07 00:28:48', '2025-10-07 00:29:35'),
(1447, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '3a40b535d31ecff564536c7901e9850ba9e07aa993096cae2ca288cd32f3461e', '[\"*\"]', '2025-10-07 00:40:00', NULL, '2025-10-07 00:32:18', '2025-10-07 00:40:00'),
(1449, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '99e03ffdd09bf8c6ec100597edde31614b93c25b3a2db24cde54995608090910', '[\"*\"]', '2025-10-07 00:44:22', NULL, '2025-10-07 00:41:08', '2025-10-07 00:44:22'),
(1450, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '88e00689115268cffc0a1b07613407570d78aa7cde667356c05379640814ea53', '[\"*\"]', '2025-10-07 00:46:09', NULL, '2025-10-07 00:45:37', '2025-10-07 00:46:09'),
(1451, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2af0bf236eed47ec5b6f1636edba828bcfb0878c0315f7fda68a2d4cdff7e419', '[\"*\"]', NULL, NULL, '2025-10-07 00:52:03', '2025-10-07 00:52:03'),
(1452, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '2c73b844ef931abcd0f957f350a45acf8aa62ff56b972cca650d29e4d1ad4286', '[\"*\"]', NULL, NULL, '2025-10-07 00:52:27', '2025-10-07 00:52:27'),
(1454, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '979b531d3afdaf810fc3bc90a1261101938d983ee98405dc8a373d9982f834c4', '[\"*\"]', '2025-10-07 01:58:50', NULL, '2025-10-07 01:56:15', '2025-10-07 01:58:50'),
(1455, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '48efacbf8be36c9b70844938567800aba30631ac80c11f216592d9b06ac23ea9', '[\"*\"]', '2025-10-07 02:05:39', NULL, '2025-10-07 02:02:29', '2025-10-07 02:05:39'),
(1456, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'ebd5eb8f765f59984314bb018c939c9d04733be0a7cce950743d2f22534dc118', '[\"*\"]', '2025-10-07 02:07:43', NULL, '2025-10-07 02:06:21', '2025-10-07 02:07:43'),
(1457, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '45a0781e5c8ac201e00ed6db208fc1839bc8aae9744f6dd227a53a9820b8953e', '[\"*\"]', '2025-10-07 02:15:03', NULL, '2025-10-07 02:13:15', '2025-10-07 02:15:03'),
(1458, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '336b4c7ff007fe4aed264de78bb7a5937b01111a9cd5f0d021b1280703363602', '[\"*\"]', '2025-10-07 02:18:54', NULL, '2025-10-07 02:18:08', '2025-10-07 02:18:54'),
(1459, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '97c1e1fa85e350b99a3dbf2b18aea4cbec315bee8099d3ebd60f3222828f88ba', '[\"*\"]', '2025-10-07 02:26:47', NULL, '2025-10-07 02:20:52', '2025-10-07 02:26:47'),
(1460, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e721c8f2928d471b660f6312bef40511decdfa7f8266d82a01bde7d6a2732b69', '[\"*\"]', '2025-10-07 02:31:47', NULL, '2025-10-07 02:30:26', '2025-10-07 02:31:47'),
(1461, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8abb5b562522c7ef9a744c7816854eba57c59ccada70d21e8ba2d0d7d4150aca', '[\"*\"]', '2025-10-07 02:38:43', NULL, '2025-10-07 02:38:19', '2025-10-07 02:38:43'),
(1462, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0664488eab00f5ffca3fff16fa90016916dc8fc0f75212cf4e06373c623d8cfb', '[\"*\"]', '2025-10-07 02:40:51', NULL, '2025-10-07 02:39:59', '2025-10-07 02:40:51'),
(1463, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '164e3051ce2b4128cee394b8d088675d65a40ea1ac2bc11ba68eebc97d9fffe5', '[\"*\"]', '2025-10-07 02:57:35', NULL, '2025-10-07 02:42:27', '2025-10-07 02:57:35'),
(1464, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '98171dd0a3b5929e15d81408682b285c8ab41eb8e4a45cd875aecc3f08a8c1e1', '[\"*\"]', '2025-10-07 03:02:38', NULL, '2025-10-07 03:01:37', '2025-10-07 03:02:38'),
(1465, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd2b8536429b94c1f1056964990645fb0ff9f29c69ec1807b28dbe169788e2d0b', '[\"*\"]', '2025-10-07 03:07:20', NULL, '2025-10-07 03:04:43', '2025-10-07 03:07:20'),
(1466, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c948484bd9fc272a97b78f892baa1dd10a0534916ea03ec5bd71dd9348146225', '[\"*\"]', '2025-10-07 03:21:47', NULL, '2025-10-07 03:13:27', '2025-10-07 03:21:47'),
(1467, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f27115ba9abe2e5293e15d068c037729f0413644e74299c10f38bfae4dea311', '[\"*\"]', '2025-10-07 03:28:13', NULL, '2025-10-07 03:27:46', '2025-10-07 03:28:13'),
(1468, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd9b25e0e47541196d861736cad06f6aabf8fbe64356ea2fbb75ed61671501f63', '[\"*\"]', '2025-10-07 03:30:42', NULL, '2025-10-07 03:29:48', '2025-10-07 03:30:42'),
(1469, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3a3b2d679b22ff6fdcb1001d8ddd9c6dc625496884881e88a7e8a9ccbe8384b6', '[\"*\"]', '2025-10-07 03:36:43', NULL, '2025-10-07 03:31:43', '2025-10-07 03:36:43'),
(1470, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '61890091495a13a22a40d313f5ffa0071bcad34203e49bb35cc6851d6424050d', '[\"*\"]', '2025-10-07 04:26:20', NULL, '2025-10-07 03:37:32', '2025-10-07 04:26:20'),
(1471, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '87bd1bf4671dd65c50d6cff95f8712db4cdbbf4b70a3b8a336a44bb5d830b0c5', '[\"*\"]', '2025-10-07 03:45:55', NULL, '2025-10-07 03:43:19', '2025-10-07 03:45:55'),
(1472, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '52990fd6da01e82cf88e23065d5b25bb29a3bc7b96f4849a945e0b9630084e20', '[\"*\"]', '2025-10-07 03:54:59', NULL, '2025-10-07 03:54:56', '2025-10-07 03:54:59'),
(1473, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '51403b2769326ee16403a5066e0410357e19b9d788d366252c524b4337da98bf', '[\"*\"]', '2025-10-07 04:00:07', NULL, '2025-10-07 03:59:00', '2025-10-07 04:00:07'),
(1474, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd90a899db6379d692208abdfccb3e2e7b20f8b21f8e69aa30bd52be35fe78def', '[\"*\"]', '2025-10-07 04:01:01', NULL, '2025-10-07 04:00:57', '2025-10-07 04:01:01'),
(1475, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3d5539bdd04885816a674b2eb04bf26b3b9c3b8d5e331b8bfa4bedc6fc574d73', '[\"*\"]', '2025-10-07 04:02:48', NULL, '2025-10-07 04:01:44', '2025-10-07 04:02:48'),
(1476, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eb3d666a12c96c9862005554ec673b4627db52fd0b0c66b09f9aa98e380ec4bb', '[\"*\"]', '2025-10-07 04:08:54', NULL, '2025-10-07 04:07:25', '2025-10-07 04:08:54'),
(1477, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '54eb4320992fd9ad5da765071339b2da736672faf8ad77ea4505b4e132b36e56', '[\"*\"]', '2025-10-07 04:10:09', NULL, '2025-10-07 04:09:17', '2025-10-07 04:10:09'),
(1478, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f557d559bbb1979c726d4934f24398fd0b2f4c726abb24ae559982204661a238', '[\"*\"]', '2025-10-07 04:15:55', NULL, '2025-10-07 04:13:06', '2025-10-07 04:15:55'),
(1479, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e46b1cd7dc1bbe5596ac1b8b6a4b748756780766d61f4edb34b659055aaf1ec2', '[\"*\"]', '2025-10-07 04:20:45', NULL, '2025-10-07 04:18:04', '2025-10-07 04:20:45'),
(1480, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dfe3e11a514a3b5a7e268969c76a5f3f0e60b066f975132f389346b2fbbf887c', '[\"*\"]', '2025-10-07 04:23:42', NULL, '2025-10-07 04:21:29', '2025-10-07 04:23:42'),
(1481, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b0ac7851fb4f3bf2db410503eb0d5ac1bfb512fa26a1afe117f27ac3ffeaeb53', '[\"*\"]', '2025-10-07 04:23:59', NULL, '2025-10-07 04:23:56', '2025-10-07 04:23:59'),
(1482, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5bf6d046415d55b23e11e3551dea3852861ab7067ae5a77acd8798c738da2db4', '[\"*\"]', '2025-10-07 04:24:16', NULL, '2025-10-07 04:24:12', '2025-10-07 04:24:16'),
(1483, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'babff9894cf3f58c28aa0daf70ce1b6faf500782746c75a42025ab0fce0af96c', '[\"*\"]', '2025-10-07 04:42:16', NULL, '2025-10-07 04:26:24', '2025-10-07 04:42:16'),
(1484, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0679c290dc423e329debad428688b32adc39b61ddd0f68e3c70aa62ec152b3bf', '[\"*\"]', '2025-10-07 05:01:48', NULL, '2025-10-07 04:58:20', '2025-10-07 05:01:48'),
(1485, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8d555dc376d97f805d7e14c9bcb5b2e26b1351d4d0058841d39c6407b1562fe8', '[\"*\"]', '2025-10-07 05:05:43', NULL, '2025-10-07 05:02:03', '2025-10-07 05:05:43'),
(1486, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '95ad2d1898a3ba31ad64010187960226e0c1b3aaa7825b291bdeb9abf3b84bb9', '[\"*\"]', '2025-10-07 05:10:57', NULL, '2025-10-07 05:06:04', '2025-10-07 05:10:57'),
(1489, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'be7466309119971f2aed6633ccc054b65608434edcf1f5c33848c369912dda31', '[\"*\"]', '2025-10-07 09:47:12', NULL, '2025-10-07 09:42:28', '2025-10-07 09:47:12'),
(1490, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '040c533819ea412d0448fc1d8dd263433005d0dd7d93794e9e337958a82b750b', '[\"*\"]', '2025-10-07 10:37:06', NULL, '2025-10-07 09:44:43', '2025-10-07 10:37:06'),
(1491, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2521d721611bffeaf86a4ca14b2b66e9eb9e86f3c41539058b1883955808347b', '[\"*\"]', '2025-10-07 10:02:53', NULL, '2025-10-07 09:54:17', '2025-10-07 10:02:53'),
(1492, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '831afb3d7b2e3b45718a7d5a026df6105cb766cde7e8ca4f51fc722cb6bf5146', '[\"*\"]', '2025-10-07 10:08:03', NULL, '2025-10-07 10:03:24', '2025-10-07 10:08:03'),
(1493, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '83d1532a7dd8eb51cd062a4957407b3c9a20f79f6c4446b11b99c709e6631e80', '[\"*\"]', '2025-10-07 10:22:18', NULL, '2025-10-07 10:14:14', '2025-10-07 10:22:18'),
(1494, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ac9d6ea99cabdc69eac8b20070e2faf766c16a5bbf882ad84299713086c82ebe', '[\"*\"]', '2025-10-07 10:25:29', NULL, '2025-10-07 10:24:33', '2025-10-07 10:25:29'),
(1495, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ac1693fd4e526f7d920a6c957af37ae0951cf4df4fd24dbf02b4abe8d45f35c0', '[\"*\"]', '2025-10-07 10:31:15', NULL, '2025-10-07 10:26:19', '2025-10-07 10:31:15'),
(1496, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '52ef2ddbd8c4faf84994e26e9e7b7783372b7b29ad5b51d30f55d213ec3e9277', '[\"*\"]', '2025-10-07 10:46:36', NULL, '2025-10-07 10:46:10', '2025-10-07 10:46:36'),
(1497, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '87f1499059bfdf95eb0eb72a9a380a1d53384ff76e7efd39655934f29423dd49', '[\"*\"]', '2025-10-07 11:09:29', NULL, '2025-10-07 10:49:04', '2025-10-07 11:09:29'),
(1498, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3357fe89e98724773ac59e45111dbcf8d3ade198ff8005a2b254da078fa9352f', '[\"*\"]', '2025-10-07 11:20:21', NULL, '2025-10-07 11:13:39', '2025-10-07 11:20:21'),
(1499, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '80d36d076f91df871f5d329d68edd25863dcace0ba5b7306b97cd1f99050a0a7', '[\"*\"]', '2025-10-07 11:20:56', NULL, '2025-10-07 11:20:41', '2025-10-07 11:20:56'),
(1500, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0701356ed1bbe423e1f43f901e36c679f4c0112ebae000deaeebf13f26f17453', '[\"*\"]', '2025-10-07 20:53:21', NULL, '2025-10-07 20:47:58', '2025-10-07 20:53:21'),
(1501, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8318f09522a957f88030f0d13e4918f4a2a97ba06eaf74bab690a7e4af96770b', '[\"*\"]', '2025-10-07 21:02:07', NULL, '2025-10-07 20:53:39', '2025-10-07 21:02:07'),
(1502, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ff9b2718f94fb45bc4576c6cb4b26a2f843a25b1c81d436402c9ec846d4b44aa', '[\"*\"]', '2025-10-07 21:05:35', NULL, '2025-10-07 21:03:54', '2025-10-07 21:05:35'),
(1503, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '539f4fa4ae6fea300a398c42d5201212578991e9e152ea6aa5fb56a95de08e3f', '[\"*\"]', '2025-10-07 21:11:47', NULL, '2025-10-07 21:10:35', '2025-10-07 21:11:47'),
(1504, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ca25d727a20971c07f851a9bde66c22f2dcd84558c643842361df14e361d9434', '[\"*\"]', '2025-10-07 21:16:07', NULL, '2025-10-07 21:14:32', '2025-10-07 21:16:07'),
(1505, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f25acf33bf2bb6aa1ee434ea042a6692d02896fd4c3992c3d6eb77e03909a725', '[\"*\"]', '2025-10-07 21:18:29', NULL, '2025-10-07 21:16:20', '2025-10-07 21:18:29'),
(1506, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '49ac6840b0c49f7f93954d9c565aebd28baff95c0ed5f23e8709ba0d884ab264', '[\"*\"]', '2025-10-07 21:22:39', NULL, '2025-10-07 21:18:53', '2025-10-07 21:22:39'),
(1507, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6684d5096c8c0d7014a620fdfcd50e1367b1dce229475ab63e51d7750c9fa04e', '[\"*\"]', '2025-10-07 21:31:45', NULL, '2025-10-07 21:30:20', '2025-10-07 21:31:45'),
(1508, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f1d1f56084108f83ca867f23092e58e8d84b002b167c8345cd7e4fa9cab1a6a1', '[\"*\"]', '2025-10-07 21:42:27', NULL, '2025-10-07 21:42:03', '2025-10-07 21:42:27'),
(1509, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd48a5898fa6de58db772e6a4d790fb63924ae022538b5180b43528a57dce7595', '[\"*\"]', '2025-10-07 21:47:55', NULL, '2025-10-07 21:43:26', '2025-10-07 21:47:55'),
(1510, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '136575a3c777d9d3a64fd3747efd3db228060e324de570a96e5738dcde960cba', '[\"*\"]', '2025-10-07 21:52:32', NULL, '2025-10-07 21:51:55', '2025-10-07 21:52:32'),
(1511, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '434c0b6f60dd6c06132707c6b92359eb77d86ee79bf09dfb3b03b7380a91ec76', '[\"*\"]', '2025-10-07 21:58:38', NULL, '2025-10-07 21:56:30', '2025-10-07 21:58:38'),
(1512, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b15f796880e0904f71c691013f0138c29f80ca616eeed6c95610d1677513df0a', '[\"*\"]', '2025-10-07 22:06:29', NULL, '2025-10-07 22:06:04', '2025-10-07 22:06:29'),
(1514, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '223337b850398fbf23688cfe6088fe025a91231378393b13c7a59c1d0f45cbcb', '[\"*\"]', '2025-10-07 22:30:05', NULL, '2025-10-07 22:28:31', '2025-10-07 22:30:05'),
(1515, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '14bf4978d310d21fe8285d7b55f85b2dd0916ea439a4c0e5233a4a8ea8e228f6', '[\"*\"]', '2025-10-07 22:32:26', NULL, '2025-10-07 22:32:25', '2025-10-07 22:32:26'),
(1516, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b7d60c935828e7dd834a5a52d55c53cecbbca405d2aa7a7843a0da006b195705', '[\"*\"]', '2025-10-07 22:33:35', NULL, '2025-10-07 22:33:30', '2025-10-07 22:33:35'),
(1517, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b19fecd5380d21e3de78538799b684b2bfd51dc98bf456fd75a5e025c6616440', '[\"*\"]', '2025-10-07 22:45:33', NULL, '2025-10-07 22:44:08', '2025-10-07 22:45:33'),
(1518, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '53bb5cbee3877c1ded99ecb716140beb61ae4655cfb169fe21ab08aefdb73cde', '[\"*\"]', '2025-10-07 23:11:25', NULL, '2025-10-07 23:09:48', '2025-10-07 23:11:25'),
(1519, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd720ea63dcfd147fd7134cd793d37046f76ca80db27a0da54d12bad1ad74c123', '[\"*\"]', '2025-10-07 23:13:04', NULL, '2025-10-07 23:12:07', '2025-10-07 23:13:04'),
(1520, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c0890294d2f5843c647b22feaae06c566872ed4026c98a8d5bf39dce86c9f744', '[\"*\"]', '2025-10-07 23:20:59', NULL, '2025-10-07 23:17:12', '2025-10-07 23:20:59'),
(1521, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd15281ad8ce97cd6e948da7fbba8e27455c1d13078f5a1b1f3238d483fd7140a', '[\"*\"]', '2025-10-07 23:21:38', NULL, '2025-10-07 23:21:13', '2025-10-07 23:21:38'),
(1522, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2b98e11a6f26eee426b5c21563bfb7852b497deee4668d579c824cdf45639f51', '[\"*\"]', '2025-10-07 23:28:51', NULL, '2025-10-07 23:28:30', '2025-10-07 23:28:51'),
(1523, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0ae496aa001b495e344aeb6e3f4d862806ce810bd9b0bf332bb50ce29975bd08', '[\"*\"]', '2025-10-07 23:30:25', NULL, '2025-10-07 23:29:45', '2025-10-07 23:30:25'),
(1524, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0d33bbf2ebde411eed4aa4d4a10fb2649ae058f18008b8eff414ff7ffca6761b', '[\"*\"]', '2025-10-07 23:50:47', NULL, '2025-10-07 23:32:10', '2025-10-07 23:50:47'),
(1526, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '4de0dba2a8433182a164fe72c4d4fe57b4edaee9421530982e02f098fb2eb84d', '[\"*\"]', NULL, NULL, '2025-10-07 23:56:05', '2025-10-07 23:56:05'),
(1527, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'ab590f522aaa4963b3153469c9ac6f3d4191da5854e6c5b0ab17fb68ddf42337', '[\"*\"]', '2025-10-08 00:08:27', NULL, '2025-10-07 23:56:20', '2025-10-08 00:08:27'),
(1528, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7a488a88e4a6f46fe901c89d81d41f2b67f815ee1135c2899c74cdf020c2e6ca', '[\"*\"]', '2025-10-08 00:26:54', NULL, '2025-10-08 00:21:48', '2025-10-08 00:26:54'),
(1529, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '184f7f6d22bdf983de79b8f5f89818f994f0f38e6c17f125639044b90f4e673a', '[\"*\"]', '2025-10-08 00:30:08', NULL, '2025-10-08 00:29:19', '2025-10-08 00:30:08'),
(1530, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2be6fe84e743e368d21c215a59718fdfa57ff2b2cc6757d51effba99f1df2357', '[\"*\"]', '2025-10-08 00:32:02', NULL, '2025-10-08 00:31:15', '2025-10-08 00:32:02'),
(1531, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b10a217ac19cb80e5f8cec996039f29c48a6282f1396ddf39f349fda8911f289', '[\"*\"]', '2025-10-08 00:55:39', NULL, '2025-10-08 00:33:01', '2025-10-08 00:55:39'),
(1532, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '644764d8cec492320e5f8747876597c1fcf1a6ec84838f7a7db9ad092d8f3090', '[\"*\"]', '2025-10-08 00:58:02', NULL, '2025-10-08 00:56:17', '2025-10-08 00:58:02'),
(1533, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b06993bffe5a3699d306e9f52ef3a85d4e5a7e2e999be66ad9f798c1cec31fa0', '[\"*\"]', '2025-10-08 01:01:26', NULL, '2025-10-08 00:58:21', '2025-10-08 01:01:26'),
(1535, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'da19aa041dbdcf1579c1197eed711f5ac066db29f3d908aa9a7ebed5a81a754f', '[\"*\"]', '2025-10-08 03:15:45', NULL, '2025-10-08 02:27:11', '2025-10-08 03:15:45'),
(1536, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3713fc50ff7e00085f38df15047f40c5874cd0f9b7bb1142fc5b5331bce01fa0', '[\"*\"]', '2025-10-08 02:35:29', NULL, '2025-10-08 02:32:10', '2025-10-08 02:35:29'),
(1537, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '832fe29fd3387c204cc5d7ff5d050d282c5318ecd74adb2a00670b65d2aa7fa1', '[\"*\"]', '2025-10-08 02:36:23', NULL, '2025-10-08 02:35:56', '2025-10-08 02:36:23'),
(1538, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '27d2b5f77354038e7bca66a4759651dd4cc314507e25784478b194b32f4214f9', '[\"*\"]', '2025-10-08 02:59:43', NULL, '2025-10-08 02:40:17', '2025-10-08 02:59:43'),
(1539, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '747e2b018cdfd10f49d2d758faf9c6907ce8afd0af65b60e1cb247e4161ee262', '[\"*\"]', '2025-10-08 03:00:28', NULL, '2025-10-08 03:00:08', '2025-10-08 03:00:28'),
(1540, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '78edb785690d292b7c30250839752b99e62d0ce22aa456116ae89e5ce30c6bbe', '[\"*\"]', '2025-10-08 03:33:35', NULL, '2025-10-08 03:15:06', '2025-10-08 03:33:35'),
(1541, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '18600800a61209af93cdfab9fb00a057905c202b33beb6f0005a466f2716f91c', '[\"*\"]', '2025-10-08 03:37:57', NULL, '2025-10-08 03:33:58', '2025-10-08 03:37:57'),
(1542, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '703852fb161a327c53185dcbfc2c9394ccf73b99200b119e4d2a71a77d74c449', '[\"*\"]', '2025-10-08 03:38:11', NULL, '2025-10-08 03:38:08', '2025-10-08 03:38:11'),
(1543, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd67b8db6825548489a3166e226579c37965a634d9cc71e9ec02f02c52b937fc0', '[\"*\"]', '2025-10-08 03:40:46', NULL, '2025-10-08 03:38:52', '2025-10-08 03:40:46'),
(1545, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '47cffda91713284a3116c1596d97e80862852f1ef0dbf6c3d844b4273a560717', '[\"*\"]', NULL, NULL, '2025-10-08 03:43:37', '2025-10-08 03:43:37'),
(1546, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1c91cc9307733922300bc8d6dc3cc5af54d444ecbaaad81ffbf36ce458013ded', '[\"*\"]', '2025-10-08 03:49:25', NULL, '2025-10-08 03:43:49', '2025-10-08 03:49:25'),
(1548, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', '7bbbbfe85426823c6cc48be4c63f9de1d88b6bf621f64f1f1786890daa0c3693', '[\"*\"]', '2025-10-08 04:19:51', NULL, '2025-10-08 03:49:53', '2025-10-08 04:19:51'),
(1549, 'Modules\\Restaurant\\Entities\\Restaurant', 3, 'restaurant-api-token', 'b84c465bb2b47ee6ad91f2fc66ed52b9be06996d8b0ea1e4efe2604765a2a6a1', '[\"*\"]', '2025-10-08 04:03:11', NULL, '2025-10-08 03:50:49', '2025-10-08 04:03:11'),
(1550, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '5da8ad3c191f47180e36f5fccca34ca7fb63eab9810ee0454d33b51b8a7053be', '[\"*\"]', '2025-10-08 04:06:24', NULL, '2025-10-08 04:03:40', '2025-10-08 04:06:24'),
(1567, 'Modules\\Restaurant\\Entities\\Restaurant', 4, 'restaurant-api-token', '1c863f894d5ac88ce6ac64991a0fa68a468b8e9fef651567f206963a968e86a7', '[\"*\"]', '2025-10-08 05:11:20', NULL, '2025-10-08 05:05:20', '2025-10-08 05:11:20'),
(1568, 'App\\Models\\User', 118, 'api-token', '6e2c760f4fcae1473da97380fe3ffc975b42582e120bd2fdcdeb5b1a2fa92339', '[\"*\"]', '2025-10-08 21:08:34', NULL, '2025-10-08 20:58:09', '2025-10-08 21:08:34'),
(1569, 'App\\Models\\User', 118, 'api-token', '753cf250cfb2f7d9b5cf3256014b18be2053fbe02174491c16ce6af3ca12e3c3', '[\"*\"]', '2025-10-08 22:51:38', NULL, '2025-10-08 21:03:19', '2025-10-08 22:51:38'),
(1570, 'App\\Models\\User', 118, 'api-token', 'ee9ea75339b7001c1dfe29b0c69530bb930d84a1f8f0d4359848097853e61e7c', '[\"*\"]', '2025-10-08 21:29:55', NULL, '2025-10-08 21:15:10', '2025-10-08 21:29:55'),
(1571, 'App\\Models\\User', 118, 'api-token', 'efb40c3a99021d7eaa3e98f4fb7323bb75841355b241a03ca6d7517c329ce5e6', '[\"*\"]', '2025-10-08 21:47:20', NULL, '2025-10-08 21:31:05', '2025-10-08 21:47:20'),
(1576, 'App\\Models\\User', 118, 'api-token', 'b936ad24d1c9a82b8e03ff47f9aa69c7868fe2f668f357ee76d010fcd735fa3e', '[\"*\"]', '2025-10-08 22:40:18', NULL, '2025-10-08 22:08:22', '2025-10-08 22:40:18'),
(1578, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '2565259ab5f8dc750cd96c8fea956b8735c3c14fdcfc8b5d8634293a43e5f4ea', '[\"*\"]', '2025-10-08 23:03:56', NULL, '2025-10-08 22:43:21', '2025-10-08 23:03:56'),
(1579, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '2928200a8bc794f25d58003f767e78aaadd69380187c52fed2658feeef04df15', '[\"*\"]', '2025-10-09 05:34:45', NULL, '2025-10-08 22:52:12', '2025-10-09 05:34:45'),
(1584, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '17fccaf84c4bd1ecb8409c2e9303f13193244eaa3e7f4a47c00b4abafa0b72f8', '[\"*\"]', '2025-10-08 23:56:14', NULL, '2025-10-08 23:46:34', '2025-10-08 23:56:14'),
(1586, 'App\\Models\\User', 118, 'api-token', '6850a936482d5e2a06c95c7ca85b09be73b0d93504e63d389436d8d7c99af61f', '[\"*\"]', '2025-10-09 00:39:02', NULL, '2025-10-09 00:26:59', '2025-10-09 00:39:02'),
(1587, 'App\\Models\\User', 1, 'api-token', '621f571315c96c50aa46aa1207523a52cc4b646042819d9ef4d6303475477bb8', '[\"*\"]', '2025-10-09 00:45:03', NULL, '2025-10-09 00:41:31', '2025-10-09 00:45:03'),
(1591, 'App\\Models\\User', 1, 'api-token', '0f5bcd65cbdde6595fb7aac36eb611f7e5bd3d76d8afad3a4fc86437a1eb9364', '[\"*\"]', '2025-10-09 01:03:05', NULL, '2025-10-09 01:03:03', '2025-10-09 01:03:05'),
(1592, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'd8078032efef2d79a94415c9e824c7bced93693912babeadd10fdf709ef858a1', '[\"*\"]', '2025-10-09 02:27:55', NULL, '2025-10-09 02:13:06', '2025-10-09 02:27:55'),
(1593, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'd9c86a6563c7edd4f830fb23e9dde716dee503ddede15d493cd88c8ad2e63242', '[\"*\"]', '2025-10-09 02:52:10', NULL, '2025-10-09 02:35:31', '2025-10-09 02:52:10'),
(1594, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '062702be9e03db8ede0283b431c4157844ae554489960309cba4b49035f30499', '[\"*\"]', '2025-10-09 03:14:00', NULL, '2025-10-09 02:57:04', '2025-10-09 03:14:00'),
(1595, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '645425c819de6a48f861f7be57fe9d97a951f0a0cd6639dc507f5ba653df686d', '[\"*\"]', '2025-10-09 03:27:54', NULL, '2025-10-09 03:21:23', '2025-10-09 03:27:54'),
(1596, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '96f7342e2d931ff0e07d511f053a84088873106d91a7956e5b0292018b0f1f0c', '[\"*\"]', '2025-10-09 03:28:33', NULL, '2025-10-09 03:28:30', '2025-10-09 03:28:33'),
(1598, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1bfacbd4dc6f072e48cc5fbb0b6495ea49d212c19318a9860c036109c00a754d', '[\"*\"]', '2025-10-09 03:40:35', NULL, '2025-10-09 03:40:06', '2025-10-09 03:40:35'),
(1599, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '19498db4f18984467df72878a2fc98fe5eba7f03b45a25fc75d82a4dd2d7179d', '[\"*\"]', '2025-10-09 03:40:50', NULL, '2025-10-09 03:40:50', '2025-10-09 03:40:50'),
(1600, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'ffe2a08e9e95be6d64f5acf2bc74ae9ccdd13802a261848c4dbe5333e2a02b73', '[\"*\"]', NULL, NULL, '2025-10-09 03:41:12', '2025-10-09 03:41:12'),
(1601, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '130609ac8bc49030ed384da4a07be0fa1cd2d64132005f613bf7d8d70ebc0db8', '[\"*\"]', '2025-10-09 03:43:18', NULL, '2025-10-09 03:41:45', '2025-10-09 03:43:18'),
(1602, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cb1da61596593de3f6bae8ef515a043bf1d2b0b15cd0b3286bfa5207a38028be', '[\"*\"]', '2025-10-09 03:45:31', NULL, '2025-10-09 03:45:30', '2025-10-09 03:45:31'),
(1604, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f02a9f633c56a934db0e4661eb9a88cef4e36aa1fc609b88287e44fc720b47e0', '[\"*\"]', '2025-10-09 05:09:07', NULL, '2025-10-09 03:46:46', '2025-10-09 05:09:07'),
(1605, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cd3af8c139289fb8a484e43dbcafd4c17df8849a832624b349748340c8f0086c', '[\"*\"]', '2025-10-09 05:13:56', NULL, '2025-10-09 05:13:14', '2025-10-09 05:13:56'),
(1606, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b97653ea8180e5dde6507ddc2d950130416391f1946261616d43e98e11315969', '[\"*\"]', '2025-10-09 05:23:59', NULL, '2025-10-09 05:23:57', '2025-10-09 05:23:59'),
(1607, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f5123ff6984f077ed7a99c2b253c2b371b9c6bf1ed5171386eda8e981e05f698', '[\"*\"]', '2025-10-09 05:25:40', NULL, '2025-10-09 05:24:58', '2025-10-09 05:25:40'),
(1608, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd176b833b10143e88b3a3478550016428a1392cd0110054dae04035cf087eefa', '[\"*\"]', '2025-10-09 05:28:32', NULL, '2025-10-09 05:28:19', '2025-10-09 05:28:32'),
(1610, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '2c52c3b817f3ff08f7453a09b913721767727acfccb351d3c0677e3700d010a3', '[\"*\"]', '2025-10-09 05:35:39', NULL, '2025-10-09 05:33:28', '2025-10-09 05:35:39'),
(1611, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd1d2bc1aba916f03d079cb246f4639c2274237fa259f911649d72f5806127011', '[\"*\"]', '2025-10-09 05:38:22', NULL, '2025-10-09 05:37:58', '2025-10-09 05:38:22'),
(1612, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '780d6f6bf19bf1187299d96b8bb29533cf8b22fe7d919e1ba03ef84bc1542f88', '[\"*\"]', '2025-10-09 05:39:22', NULL, '2025-10-09 05:39:18', '2025-10-09 05:39:22'),
(1613, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3244e34e67d5427e79d16c1f9ac2dff1e66435960b109a879f3afb6a1f691350', '[\"*\"]', '2025-10-12 08:17:13', NULL, '2025-10-10 20:12:18', '2025-10-12 08:17:13'),
(1614, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6373aaa8bb4345f80f9c23b73e9f7df1108c1be8090c2121d946d228544e4d88', '[\"*\"]', '2025-10-10 20:14:54', NULL, '2025-10-10 20:14:40', '2025-10-10 20:14:54'),
(1615, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '004084587bc874d01862bda248171d4e4beb8c1c254b5805ceca405cc7561da3', '[\"*\"]', '2025-10-10 20:48:15', NULL, '2025-10-10 20:45:26', '2025-10-10 20:48:15'),
(1616, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a21f9c19b29398864e7b1d5c1c3a35cf157940d73bcf201348af81209f86c875', '[\"*\"]', '2025-10-10 21:00:01', NULL, '2025-10-10 20:59:09', '2025-10-10 21:00:01'),
(1617, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f54fe73d848c67e2a797688e135bec9a9cd6e6a344e25dd2b89905216279833', '[\"*\"]', '2025-10-10 21:04:55', NULL, '2025-10-10 21:04:05', '2025-10-10 21:04:55'),
(1626, 'App\\Models\\User', 118, 'api-token', '602a77fd914839fa79b86fdb56d327b1248802cff74f69bbf28f7edbb0bb7502', '[\"*\"]', '2025-10-11 21:52:42', NULL, '2025-10-11 21:18:20', '2025-10-11 21:52:42'),
(1634, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '3eb77f2c61796f451f412b4011edf5217b5ac5a91854b5d8cea564db0a73e381', '[\"*\"]', '2025-10-11 22:02:07', NULL, '2025-10-11 21:56:10', '2025-10-11 22:02:07'),
(1635, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '61d2fbd0e7aead89689c80e174e34893426b2167b749433e23b848191ea0efb7', '[\"*\"]', '2025-10-11 22:18:07', NULL, '2025-10-11 22:09:24', '2025-10-11 22:18:07'),
(1636, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0fbeae86d3d8751552229bda24574354bf53e584ebe677e3ab6d85f174364d1f', '[\"*\"]', '2025-10-11 22:19:59', NULL, '2025-10-11 22:19:10', '2025-10-11 22:19:59'),
(1637, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'acb80e5ba6c723e55c6d8c1e4477d865f1ee65fa992c8e543f151a8bce0fe69f', '[\"*\"]', '2025-10-11 22:22:09', NULL, '2025-10-11 22:20:12', '2025-10-11 22:22:09'),
(1639, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '1322dcf21134ef706f0596fbc86f03cb7cebe3bdf1d5b12e0296ca5258e947f8', '[\"*\"]', '2025-10-11 22:24:35', NULL, '2025-10-11 22:23:07', '2025-10-11 22:24:35'),
(1641, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '119a75d01aa8d2ff33414705449249454d650cb4fa9ec4f09f2484d4dbdf3b02', '[\"*\"]', '2025-10-11 22:26:24', NULL, '2025-10-11 22:25:53', '2025-10-11 22:26:24'),
(1642, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'a859a5b5582c2992404e5cdfb67db926f42334e71234ac51ce2321d1ba6732ed', '[\"*\"]', '2025-10-11 22:27:23', NULL, '2025-10-11 22:27:03', '2025-10-11 22:27:23'),
(1645, 'App\\Models\\User', 123, 'api-token', 'd2878d3d0f5773864eddeddad25e7514f067aa02d53d697bf007ee200e2a9a43', '[\"*\"]', '2025-10-11 23:09:16', NULL, '2025-10-11 23:05:54', '2025-10-11 23:09:16'),
(1646, 'App\\Models\\User', 118, 'api-token', '810adbcc3ef83fcb4ef09760213bc13444e690e4f5245682a22e6c24fd5a3965', '[\"*\"]', NULL, NULL, '2025-10-11 23:11:13', '2025-10-11 23:11:13'),
(1647, 'App\\Models\\User', 118, 'api-token', 'b9b99730fc048b971bb6078429f4472758cd5a957bfa55117106b86d8ab598b0', '[\"*\"]', NULL, NULL, '2025-10-11 23:19:00', '2025-10-11 23:19:00'),
(1648, 'App\\Models\\User', 123, 'api-token', '53a75c9803584ce4d6acadb7385178abba93f93c0b69919ffd92174ef8676487', '[\"*\"]', NULL, NULL, '2025-10-11 23:19:12', '2025-10-11 23:19:12'),
(1651, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '4cb8872808b1e85d8208f41b260fa6e68ccc951ad372a6ff66584c40b395638c', '[\"*\"]', NULL, NULL, '2025-10-12 03:47:41', '2025-10-12 03:47:41'),
(1652, 'App\\Models\\User', 123, 'api-token', '60cf61b825c40219a094e200f8b0a569abbe593aeeea1c86a26a2f04a6f31c36', '[\"*\"]', '2025-10-12 04:15:15', NULL, '2025-10-12 03:47:52', '2025-10-12 04:15:15'),
(1653, 'App\\Models\\User', 123, 'api-token', '505f475c391f534a1bd653d4c28c873abbb06542a2fb0ab93b5de2f2193b496c', '[\"*\"]', '2025-10-12 04:06:49', NULL, '2025-10-12 04:00:21', '2025-10-12 04:06:49'),
(1655, 'App\\Models\\User', 1, 'api-token', '16aa91088e8bb91cfe2cb968afedc330a8197bc8bfa0f8ab6f8dec932e4c62d6', '[\"*\"]', '2025-10-12 04:58:28', NULL, '2025-10-12 04:15:57', '2025-10-12 04:58:28'),
(1660, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '77df0d0aaa7d45f73e129bd2fc8373c40551c0324b2091e025f17bd6d84f2148', '[\"*\"]', '2025-10-12 04:32:04', NULL, '2025-10-12 04:27:54', '2025-10-12 04:32:04'),
(1663, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'a39d92a102b11b4a0e1788d374f9db0385e1fd0911da9429f0c08303571bd534', '[\"*\"]', '2025-10-12 04:35:14', NULL, '2025-10-12 04:34:39', '2025-10-12 04:35:14'),
(1668, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '58f665c4c455f288dd695d6aecd313d81ae5f739da46eee72fd4922f47bb3ea3', '[\"*\"]', '2025-10-12 04:42:41', NULL, '2025-10-12 04:40:22', '2025-10-12 04:42:41'),
(1669, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'cdcf58745fee8d30fd2365f04f1d6c28501cb0f57203a3b3b64080ba9e7df48c', '[\"*\"]', '2025-10-12 05:03:17', NULL, '2025-10-12 05:02:51', '2025-10-12 05:03:17'),
(1670, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'b37d36f7bb64cd73f666400fd64a61834049fc23dbc7d04522076d12bb758325', '[\"*\"]', '2025-10-12 05:14:44', NULL, '2025-10-12 05:04:42', '2025-10-12 05:14:44'),
(1672, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '01b7d37942fb443d84912988338b7cbf4f78ce1e540cab4924cfde28a4bc1ba0', '[\"*\"]', '2025-10-12 05:17:56', NULL, '2025-10-12 05:15:47', '2025-10-12 05:17:56'),
(1673, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '58ebbe487ae1abb48e583eb2f31735fbb31b18fa82c45a650389ae8def3fb561', '[\"*\"]', '2025-10-12 08:28:35', NULL, '2025-10-12 08:12:10', '2025-10-12 08:28:35'),
(1674, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd7f8dc8c43ac24c74d0f55cccd4c32139a0b98f8954f059f1ffccb030849e46a', '[\"*\"]', '2025-10-31 10:56:55', NULL, '2025-10-12 08:17:26', '2025-10-31 10:56:55'),
(1675, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9556388130c388b52be5be24a892affcce677a0898cdf3fb683c2d39dd85bb79', '[\"*\"]', '2025-10-12 08:30:30', NULL, '2025-10-12 08:29:13', '2025-10-12 08:30:30'),
(1676, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e958c0a7b3153f8ab505ef38896e82f50ede47a957e78eb116d60534d5604abd', '[\"*\"]', '2025-10-12 08:36:03', NULL, '2025-10-12 08:34:45', '2025-10-12 08:36:03'),
(1677, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8c15a19c845b9b35322fcf263c2c73591f38d34ab418f09aaf49b20de9da2f98', '[\"*\"]', '2025-10-12 08:43:45', NULL, '2025-10-12 08:40:31', '2025-10-12 08:43:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1678, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ef2b313ced9bfae38d89464d32b3a4021c1ad73a907f3add4d75d34b674622cf', '[\"*\"]', '2025-10-12 08:48:09', NULL, '2025-10-12 08:46:54', '2025-10-12 08:48:09'),
(1679, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '78d93a936fe7284384b5affcc80f60a8499d26f847d97cdbfbd93b69ab2fbfd5', '[\"*\"]', '2025-10-12 08:50:57', NULL, '2025-10-12 08:50:09', '2025-10-12 08:50:57'),
(1680, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7d6839e3d47667bb943fbf68b1bdb2204f3a6d64590b9977669a7f0086b32129', '[\"*\"]', '2025-10-12 08:53:25', NULL, '2025-10-12 08:52:01', '2025-10-12 08:53:25'),
(1681, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c9a6bfe08d35df20565f22880ee982165bf2b2d951bc0d45bd19c3b9372007b5', '[\"*\"]', '2025-10-12 08:58:54', NULL, '2025-10-12 08:54:47', '2025-10-12 08:58:54'),
(1682, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8f4a605c68702db94c2a49cf8d330394d79b71399e8d93b344a8b64a14507bea', '[\"*\"]', '2025-10-12 17:47:40', NULL, '2025-10-12 17:45:42', '2025-10-12 17:47:40'),
(1683, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '101d32ffe6050693fb54b1c1058652642c44b66fd59c8b3f7030f4cab7ae5aa9', '[\"*\"]', '2025-10-12 22:09:22', NULL, '2025-10-12 20:39:27', '2025-10-12 22:09:22'),
(1685, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '208ea83bc27039a4ca0b36e3110c5ac9db2fb7537ae0da58ef136e3bf6c233f5', '[\"*\"]', '2025-10-12 21:36:45', NULL, '2025-10-12 20:46:15', '2025-10-12 21:36:45'),
(1689, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4ea5b0b422ad159096ff0f5af893cc228ec741e0a7a449d64c3efddcdccc26b0', '[\"*\"]', '2025-10-12 23:37:03', NULL, '2025-10-12 22:09:48', '2025-10-12 23:37:03'),
(1690, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '699956238a99b8cce03505c660d387b9ed911e5c74c7a0661d47925dbd99f7f7', '[\"*\"]', '2025-10-12 22:21:10', NULL, '2025-10-12 22:10:26', '2025-10-12 22:21:10'),
(1691, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e9332906bb75b8873ca820c4465496c30251e632603ef540655a2b6bf19c2f2a', '[\"*\"]', '2025-10-12 22:22:11', NULL, '2025-10-12 22:21:34', '2025-10-12 22:22:11'),
(1694, 'App\\Models\\User', 1, 'api-token', '28c93a940834f7e3f9b2cee2c57a024b950dec955cf38ae71b1a35c6c70bdfb5', '[\"*\"]', '2025-10-12 22:48:07', NULL, '2025-10-12 22:24:45', '2025-10-12 22:48:07'),
(1699, 'App\\Models\\User', 124, 'api-token', 'b9e2f159c8207e8c980f630ab5c1c8586424b066c917633e036647ef461ec99b', '[\"*\"]', '2025-10-12 23:45:52', NULL, '2025-10-12 23:06:18', '2025-10-12 23:45:52'),
(1700, 'App\\Models\\User', 1, 'api-token', '1f3f147424b9ae984129e54ad8459f856e3dd22b4d90bfc819d8de524be567c7', '[\"*\"]', '2025-10-18 21:59:46', NULL, '2025-10-12 23:37:15', '2025-10-18 21:59:46'),
(1701, 'App\\Models\\User', 1, 'api-token', '3c71629bc756385efb06ac773e056b2f7737a20f148990bd91d57347599400d3', '[\"*\"]', '2025-10-13 00:01:41', NULL, '2025-10-12 23:51:22', '2025-10-13 00:01:41'),
(1703, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8d2695dbcbed01ffcb7d6e96576aefa3e81dad828f2537f23525348bc85481c3', '[\"*\"]', '2025-10-13 00:06:22', NULL, '2025-10-13 00:05:40', '2025-10-13 00:06:22'),
(1704, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9c60463f080645a4f5729244ef95182cb992ea00f27706cfd142d994633a4062', '[\"*\"]', '2025-10-13 00:07:26', NULL, '2025-10-13 00:06:49', '2025-10-13 00:07:26'),
(1709, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bd558e84e91dffe6639f41acc007dafa179af79b834c09479c5f30655bbe18dc', '[\"*\"]', '2025-10-13 00:39:19', NULL, '2025-10-13 00:30:38', '2025-10-13 00:39:19'),
(1710, 'App\\Models\\User', 1, 'api-token', '0a12ec895b3391529075ee39d8fef8adffdbb25cda3bacc51f4067d982d354df', '[\"*\"]', '2025-10-13 02:17:16', NULL, '2025-10-13 00:55:39', '2025-10-13 02:17:16'),
(1732, 'App\\Models\\User', 1, 'api-token', '34dcf841b3fae10d02f36f8cdeef84a1468771a435ff724a58649e8a592529bc', '[\"*\"]', '2025-10-13 04:17:49', NULL, '2025-10-13 04:17:41', '2025-10-13 04:17:49'),
(1733, 'App\\Models\\User', 1, 'api-token', '82be15f1519c9cf96dfcf6d23be227971a5fb0074b569e419be8f0f6c307417b', '[\"*\"]', '2025-10-13 10:47:35', NULL, '2025-10-13 10:47:34', '2025-10-13 10:47:35'),
(1734, 'App\\Models\\User', 1, 'api-token', '408a6ca5539b73e8f519461414ca2064c4a68705c23ff302809d0934539311df', '[\"*\"]', '2025-10-13 20:46:16', NULL, '2025-10-13 20:46:15', '2025-10-13 20:46:16'),
(1736, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3efe0cb4e6c927ec9bcd6fc3390a660aa1463e7d0ef620d9b1cd04f30e9ebbb9', '[\"*\"]', '2025-10-18 06:58:33', NULL, '2025-10-18 06:56:36', '2025-10-18 06:58:33'),
(1740, 'App\\Models\\User', 127, 'api-token', 'f5b9e523b2f9c3891285aeed490543330aa6bac31f329133202b86bf16834112', '[\"*\"]', '2025-10-18 21:35:51', NULL, '2025-10-18 21:34:15', '2025-10-18 21:35:51'),
(1741, 'App\\Models\\User', 127, 'api-token', '1bf9fb9d25ed130899bf24a9821aacbfbe547366bfd837e7ca26e33dcb9d44b2', '[\"*\"]', '2025-10-18 21:45:28', NULL, '2025-10-18 21:44:16', '2025-10-18 21:45:28'),
(1742, 'App\\Models\\User', 127, 'api-token', '56dc7f5ba01f5dcb9657f0b20bc7ce0f4799efca0ae60f24365df90f2a248c46', '[\"*\"]', '2025-10-18 21:48:28', NULL, '2025-10-18 21:46:35', '2025-10-18 21:48:28'),
(1743, 'App\\Models\\User', 127, 'api-token', '76585b422c7a593c9a0aba3933f6bf62720102cbc7ef8d6525a8e6ae844c4968', '[\"*\"]', '2025-10-18 22:13:27', NULL, '2025-10-18 21:55:10', '2025-10-18 22:13:27'),
(1746, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0499e3db530bf10eaed316e409cdf313895f341e905d417296d5f8f10e4c556a', '[\"*\"]', '2025-10-18 22:24:31', NULL, '2025-10-18 22:21:19', '2025-10-18 22:24:31'),
(1748, 'App\\Models\\User', 127, 'api-token', 'a274a6107760bd60aed2d1128a97a5bb4d0a56f1fa267f74bcbaaa5e37b95fa2', '[\"*\"]', '2025-10-18 22:26:59', NULL, '2025-10-18 22:25:50', '2025-10-18 22:26:59'),
(1752, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '39d0e76e5611c0395f3877fd3c536c22d89915c357b34de9b3bbd1e1c0531a5c', '[\"*\"]', '2025-10-18 22:51:48', NULL, '2025-10-18 22:51:48', '2025-10-18 22:51:48'),
(1753, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7343286445882a915b5fcbfd434847237fab52321db1823b862975c0c78b9611', '[\"*\"]', '2025-10-19 01:01:19', NULL, '2025-10-18 23:02:43', '2025-10-19 01:01:19'),
(1754, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '93f743e10442dcd1740bb913c0bae122ea005101d9a7c5e004b935a792a8c7b2', '[\"*\"]', '2025-10-18 23:07:02', NULL, '2025-10-18 23:04:32', '2025-10-18 23:07:02'),
(1755, 'App\\Models\\User', 1, 'api-token', '49b3184d94adcae9823ebe4fdab0630b022446450c1579818d902c0bf391b7df', '[\"*\"]', '2025-10-18 23:14:07', NULL, '2025-10-18 23:08:08', '2025-10-18 23:14:07'),
(1756, 'App\\Models\\User', 1, 'api-token', '0681b2558b944e627e5d227f2693fe0235fbd0264c44688d63b6e058e68864f4', '[\"*\"]', '2025-10-18 23:19:37', NULL, '2025-10-18 23:16:30', '2025-10-18 23:19:37'),
(1757, 'App\\Models\\User', 1, 'api-token', '41163488f08ea446cfe746275c91dd81309001f98adaa8369cd54b48ca54709a', '[\"*\"]', '2025-10-18 23:53:06', NULL, '2025-10-18 23:20:24', '2025-10-18 23:53:06'),
(1760, 'App\\Models\\User', 1, 'api-token', 'e70c72ee1b537c2b0c830a9d3d2cd170b4ccfcf501dcbe375e977772324894e9', '[\"*\"]', '2025-10-19 00:25:43', NULL, '2025-10-19 00:02:46', '2025-10-19 00:25:43'),
(1762, 'App\\Models\\User', 1, 'api-token', 'ffb3f739c63f72972ab6b825b15888d9a28484163770bf24547d981c08c23f57', '[\"*\"]', '2025-10-19 00:38:32', NULL, '2025-10-19 00:32:51', '2025-10-19 00:38:32'),
(1763, 'App\\Models\\User', 1, 'api-token', '7cea5b588d21b65635e7bcd80de9fe20b45bac20cf8b7e4ed927fdf76a6b71ab', '[\"*\"]', '2025-10-19 00:40:29', NULL, '2025-10-19 00:40:28', '2025-10-19 00:40:29'),
(1764, 'App\\Models\\User', 1, 'api-token', '91448fff7acf02473c4120443d0b540d61f51b79369acf1c55f47ea055ca6f1a', '[\"*\"]', '2025-10-19 00:45:40', NULL, '2025-10-19 00:45:39', '2025-10-19 00:45:40'),
(1765, 'App\\Models\\User', 1, 'api-token', 'e351717dc0ed46fb4f98d65249453e01cde16879528adf9585468044aec7b120', '[\"*\"]', '2025-10-19 00:50:02', NULL, '2025-10-19 00:50:00', '2025-10-19 00:50:02'),
(1766, 'App\\Models\\User', 1, 'api-token', 'dec29f1a85e42dc10ca250d9cbf8554c6249db5b70da03bf1caf64a56fc48861', '[\"*\"]', '2025-10-19 00:51:45', NULL, '2025-10-19 00:51:44', '2025-10-19 00:51:45'),
(1767, 'App\\Models\\User', 1, 'api-token', '86e9079f5d9322592816e8fc1af57a2786de4628b89c6d44f3831ff146eda834', '[\"*\"]', '2025-10-19 00:58:19', NULL, '2025-10-19 00:52:05', '2025-10-19 00:58:19'),
(1770, 'App\\Models\\User', 1, 'api-token', '84e9020437e68117c374af35c7602db237072200d79bff8bb80a17c40780a666', '[\"*\"]', '2025-10-19 01:07:20', NULL, '2025-10-19 01:05:14', '2025-10-19 01:07:20'),
(1772, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '97c5e312f0356f7a8b924109900328e02b30e118c131f6cb9e7c8b7a9d278a1d', '[\"*\"]', '2025-10-19 01:47:54', NULL, '2025-10-19 01:09:15', '2025-10-19 01:47:54'),
(1773, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8c6529d6563f80fd7b2c119ae54adec81b54ecad2ccc1d5342d4d4a5c83cd374', '[\"*\"]', '2025-10-19 01:48:12', NULL, '2025-10-19 01:48:09', '2025-10-19 01:48:12'),
(1774, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'baf59db411a6ae0f022dd8b4fb0c8d61ab5e2d128c04d41864e4bd57d7988242', '[\"*\"]', '2025-10-19 01:52:16', NULL, '2025-10-19 01:49:11', '2025-10-19 01:52:16'),
(1775, 'App\\Models\\User', 1, 'api-token', '21e3d9b5c696655e2b847d7d059426a1df5d83a5df12c01d4e83309f0d660321', '[\"*\"]', '2025-10-19 02:14:00', NULL, '2025-10-19 02:03:25', '2025-10-19 02:14:00'),
(1776, 'App\\Models\\User', 1, 'api-token', '8aade243563290a92fecc41fac3269ff5a490946c913511acb9fdfd0dd091686', '[\"*\"]', '2025-10-19 02:27:00', NULL, '2025-10-19 02:14:28', '2025-10-19 02:27:00'),
(1778, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '88fefa88044bd5121f8b95e9e72bdb720cef2954b3c02bd2217e6ba33a87c7c7', '[\"*\"]', '2025-10-19 02:24:37', NULL, '2025-10-19 02:21:43', '2025-10-19 02:24:37'),
(1780, 'App\\Models\\User', 1, 'api-token', 'eee40665c01cbb5a75f2d367f13a45cbbf15d1936b7871d97dc11c1f140cb251', '[\"*\"]', '2025-10-19 02:26:52', NULL, '2025-10-19 02:26:46', '2025-10-19 02:26:52'),
(1781, 'App\\Models\\User', 1, 'api-token', '7143fab7193ffc5e5b4e6406d6e748e7fe631ad61bf3b57c08422ed01645166d', '[\"*\"]', '2025-10-19 02:28:41', NULL, '2025-10-19 02:28:36', '2025-10-19 02:28:41'),
(1783, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '97675076ceab2685e2473603f85499933a92efa79795ae981d56dd2e595b943a', '[\"*\"]', '2025-10-19 02:32:50', NULL, '2025-10-19 02:31:05', '2025-10-19 02:32:50'),
(1785, 'App\\Models\\User', 1, 'api-token', '1d59c6c6f40641c8f7cb3fc94e1538d1729d2c8e209b386df21fc2dde8bda9a4', '[\"*\"]', '2025-10-19 02:41:16', NULL, '2025-10-19 02:33:11', '2025-10-19 02:41:16'),
(1788, 'App\\Models\\User', 1, 'api-token', '610d3d757d68109f7947b4b7e85ecf9a72565c0a279bdf59e636dc269f194cb5', '[\"*\"]', '2025-10-19 02:54:46', NULL, '2025-10-19 02:53:57', '2025-10-19 02:54:46'),
(1789, 'App\\Models\\User', 1, 'api-token', '875dd8869d7db572f027d54e08e8a41e6d717e257d728fe2717b9006f2161a89', '[\"*\"]', '2025-10-19 02:59:04', NULL, '2025-10-19 02:56:34', '2025-10-19 02:59:04'),
(1790, 'App\\Models\\User', 1, 'api-token', '5e077a6511f8ae5fc91388a20b829bfec9c547ed6e9a09a3574d01284362b5ce', '[\"*\"]', '2025-10-19 03:09:05', NULL, '2025-10-19 03:04:51', '2025-10-19 03:09:05'),
(1795, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '44c10cfa1c77cbb37616567e1f784c11fb63f28cfbec9739c480056d458cbed2', '[\"*\"]', '2025-10-19 03:48:16', NULL, '2025-10-19 03:37:57', '2025-10-19 03:48:16'),
(1797, 'App\\Models\\User', 1, 'api-token', '611cdce98fdda68026d0596751ea098609d936b3ddeda3c6efe58d2ba44bd829', '[\"*\"]', '2025-10-19 03:43:50', NULL, '2025-10-19 03:41:01', '2025-10-19 03:43:50'),
(1798, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7d51f443afb9554a432ab4c0fd628d4d01233a5dd44a461b52fe45d9887b3ce7', '[\"*\"]', '2025-10-19 04:34:26', NULL, '2025-10-19 04:17:30', '2025-10-19 04:34:26'),
(1799, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f8955ca5bd3131e7e5cf0d7dddf194b2853172311649e0e5897677cc526543d2', '[\"*\"]', '2025-10-19 04:41:27', NULL, '2025-10-19 04:38:13', '2025-10-19 04:41:27'),
(1800, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '80aa5684accd381bf11c7e06ec81b5c23544a38a159bc91c05c1c50c3d9cee2b', '[\"*\"]', '2025-10-19 23:44:08', NULL, '2025-10-19 23:22:49', '2025-10-19 23:44:08'),
(1801, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0b91ed0eacc0d7facb4c9859e4ae6d09b616f8685dc0acffd1740da75fa36e6e', '[\"*\"]', '2025-10-20 00:57:35', NULL, '2025-10-20 00:57:01', '2025-10-20 00:57:35'),
(1802, 'App\\Models\\User', 1, 'api-token', '27d84bf0ee3b2647493fe3386dfa6b36101d6f2ae706c601331226040cd96213', '[\"*\"]', '2025-10-21 01:08:25', NULL, '2025-10-21 00:25:31', '2025-10-21 01:08:25'),
(1803, 'App\\Models\\User', 1, 'api-token', '0cbbec85e3e511112e1f4bf4d11861c4c572f59f765f3f09de307c854a1e0224', '[\"*\"]', '2025-10-21 02:34:22', NULL, '2025-10-21 02:34:20', '2025-10-21 02:34:22'),
(1806, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '97c46543bf28e643629eb5db33768cb4bba36b595474361d561bca2cbc178e02', '[\"*\"]', '2025-10-26 00:21:38', NULL, '2025-10-25 00:18:23', '2025-10-26 00:21:38'),
(1807, 'App\\Models\\User', 1, 'api-token', 'b122d88434e1fb23f6a709515acdb0c8800d822fda8e398973a2c82359011f37', '[\"*\"]', '2025-10-25 03:49:39', NULL, '2025-10-25 03:49:36', '2025-10-25 03:49:39'),
(1808, 'App\\Models\\User', 1, 'api-token', '74d3f5fc32f83b51d3aafee40ea00b2e78c98a60882086c12dcc78d8af3bf125', '[\"*\"]', '2025-10-25 04:00:29', NULL, '2025-10-25 04:00:27', '2025-10-25 04:00:29'),
(1809, 'App\\Models\\User', 1, 'api-token', '8c230a763131c5c108fb632e3050e47032a7057fdd7f961db32d79530ff76e57', '[\"*\"]', '2025-10-25 04:04:22', NULL, '2025-10-25 04:01:10', '2025-10-25 04:04:22'),
(1810, 'App\\Models\\User', 1, 'api-token', 'd414567d14a1cdacf9aab48c467d4a42f186859ae0e19270789d336ed339cb76', '[\"*\"]', '2025-10-25 04:05:08', NULL, '2025-10-25 04:04:50', '2025-10-25 04:05:08'),
(1811, 'App\\Models\\User', 1, 'api-token', '2858bf5787df0dea0e0d028724550509a12728de3ac8d61faa3eac6241d54019', '[\"*\"]', '2025-10-25 04:37:49', NULL, '2025-10-25 04:05:28', '2025-10-25 04:37:49'),
(1812, 'App\\Models\\User', 1, 'api-token', '9e6204a04b52713c0a5f0f00e85eca8c0d01a2729029faac04500a2785a72294', '[\"*\"]', '2025-10-25 04:41:55', NULL, '2025-10-25 04:39:12', '2025-10-25 04:41:55'),
(1813, 'App\\Models\\User', 1, 'api-token', '6040714476daff5b767a62b63cbe615624bc009f7f0e593bebc179b68889917e', '[\"*\"]', '2025-10-25 04:50:05', NULL, '2025-10-25 04:43:50', '2025-10-25 04:50:05'),
(1814, 'App\\Models\\User', 1, 'api-token', 'd613e37681e3d70599190642d0ce4a59c94bf24cb7717d4fed8ef2cc0b7d91d0', '[\"*\"]', '2025-10-25 04:56:35', NULL, '2025-10-25 04:56:32', '2025-10-25 04:56:35'),
(1815, 'App\\Models\\User', 1, 'api-token', 'd3faa7ed9a8b5e88b4545b1835394da74b860ee471b48784dedee0e7525d69ec', '[\"*\"]', '2025-10-25 20:54:06', NULL, '2025-10-25 20:48:50', '2025-10-25 20:54:06'),
(1816, 'App\\Models\\User', 1, 'api-token', 'a2d88c9c75e3fa97fc1cf75667275bc709fb30d2589737ef1d084b092351107c', '[\"*\"]', '2025-10-25 21:56:26', NULL, '2025-10-25 21:12:26', '2025-10-25 21:56:26'),
(1818, 'App\\Models\\User', 1, 'api-token', 'c298cf2461744b15bc7a166aacde09f20b1a1e6c7794683c3bebb2a140014816', '[\"*\"]', '2025-10-25 22:14:38', NULL, '2025-10-25 22:14:36', '2025-10-25 22:14:38'),
(1819, 'App\\Models\\User', 1, 'api-token', '1b8fde1a6f9193c7d51fd3c3c4d374a19c6a38a0b93be1655bfbf04461275dc1', '[\"*\"]', '2025-10-25 22:42:15', NULL, '2025-10-25 22:23:28', '2025-10-25 22:42:15'),
(1820, 'App\\Models\\User', 1, 'api-token', 'fbbebae2835d7160e75cffb7e6a2cd04339b878b8d1872b7a2868aa8964f8be8', '[\"*\"]', '2025-10-25 22:44:12', NULL, '2025-10-25 22:38:29', '2025-10-25 22:44:12'),
(1824, 'App\\Models\\User', 1, 'api-token', '13afb4e45e3f6ee907dc4efa07e78bb8bd5be1d5d6e9ff75567111573df3127f', '[\"*\"]', '2025-10-25 23:09:32', NULL, '2025-10-25 22:59:26', '2025-10-25 23:09:32'),
(1825, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '94e5ba9de8252ab5cb753e0c1880e1ca860124b390e5f44b26914980b6d7325b', '[\"*\"]', '2025-10-25 23:11:38', NULL, '2025-10-25 23:11:37', '2025-10-25 23:11:38'),
(1828, 'App\\Models\\User', 1, 'api-token', '184a8e05c66d5ebfd6dcfca83b99a5d8f7bc55e5e39e5909db83b732f1843f90', '[\"*\"]', '2025-10-25 23:14:36', NULL, '2025-10-25 23:14:34', '2025-10-25 23:14:36'),
(1829, 'App\\Models\\User', 1, 'api-token', '4b78eb0f019e8940f154c97d1d248ef8771429d2593a42dca94dea4a0dcdcbed', '[\"*\"]', '2025-10-25 23:19:22', NULL, '2025-10-25 23:19:05', '2025-10-25 23:19:22'),
(1830, 'App\\Models\\User', 1, 'api-token', '3c190459954afe1ab26351f2d391d975d0f5487eeb4e2dc9e023db755a32b121', '[\"*\"]', '2025-10-25 23:23:54', NULL, '2025-10-25 23:23:52', '2025-10-25 23:23:54'),
(1831, 'App\\Models\\User', 1, 'api-token', 'd1b404f16f4bad6e1d3c1605741ed0f09a0a3d48826292b202ce7c68d4bdaed0', '[\"*\"]', '2025-10-25 23:30:08', NULL, '2025-10-25 23:26:58', '2025-10-25 23:30:08'),
(1832, 'App\\Models\\User', 1, 'api-token', '18c9f87796d429f8867237954b80bdd0389245c550c04633183ed73bb3dee02f', '[\"*\"]', '2025-10-25 23:36:43', NULL, '2025-10-25 23:34:06', '2025-10-25 23:36:43'),
(1833, 'App\\Models\\User', 1, 'api-token', 'e09541608a73bc9762b14b38130989dd3b2a9c55109bfbb10e89426186530987', '[\"*\"]', '2025-10-25 23:45:16', NULL, '2025-10-25 23:45:11', '2025-10-25 23:45:16'),
(1840, 'App\\Models\\User', 131, 'api-token', '3ac1d2baa46e75c21bfeac76060edbb04255a4a3aef6c435184093f7fb1b1979', '[\"*\"]', '2025-10-26 00:04:07', NULL, '2025-10-26 00:00:35', '2025-10-26 00:04:07'),
(1841, 'App\\Models\\User', 1, 'api-token', 'dbac81548a3d379580fbd9dd1cf16d709475ce92b7efb3d89431e9eadc34d316', '[\"*\"]', '2025-10-26 00:12:17', NULL, '2025-10-26 00:06:40', '2025-10-26 00:12:17'),
(1846, 'App\\Models\\User', 1, 'api-token', '224ed72c488a044f81aec3fc675bbcf04d3c79cedb434c1eb1657c85381c4827', '[\"*\"]', '2025-10-26 00:24:47', NULL, '2025-10-26 00:23:15', '2025-10-26 00:24:47'),
(1850, 'App\\Models\\User', 131, 'api-token', '8676f68935cee1e6bfdd97c1a1ffe7e21950199235f34868d10ef257ad1b070d', '[\"*\"]', '2025-10-26 00:57:39', NULL, '2025-10-26 00:52:34', '2025-10-26 00:57:39'),
(1854, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a5bc85c059f54f18d3bd2bc6c944d3dd54f856f3ae7cdc1cf50dca1b0ad8b42f', '[\"*\"]', NULL, NULL, '2025-10-27 03:35:10', '2025-10-27 03:35:10'),
(1855, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '0864053158c087626c3ca981a54e1e3c40e1d5a51051c04f9c1ebfd92927efa8', '[\"*\"]', NULL, NULL, '2025-10-27 04:23:57', '2025-10-27 04:23:57'),
(1856, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'af6ee564bd133fdab86867830f16cfca213f28b237a594a7b680ec03b3e5fea6', '[\"*\"]', NULL, NULL, '2025-10-27 04:24:42', '2025-10-27 04:24:42'),
(1859, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7ec439af238aea97fd207ad7d1ca4f25afc8c03b7ead4f8c9381648c9f837f1f', '[\"*\"]', NULL, NULL, '2025-10-27 04:44:01', '2025-10-27 04:44:01'),
(1865, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '87eeef27186c556b2613020b129dda8b5a47c7244e0a5164938ba6b4fdda3efa', '[\"*\"]', '2025-10-30 02:58:39', NULL, '2025-10-27 04:52:10', '2025-10-30 02:58:39'),
(1866, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2786d4bcacbb3b1bc63ccd2b2675d3eea35e3c2f4fe0ae80b5cef9e5c7551b61', '[\"*\"]', NULL, NULL, '2025-10-27 04:54:00', '2025-10-27 04:54:00'),
(1867, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '83eed6104679848815fa82527ee4b704d7d069490a5eb7bc432b5a0f0f339f46', '[\"*\"]', '2025-10-27 04:54:31', NULL, '2025-10-27 04:54:30', '2025-10-27 04:54:31'),
(1868, 'App\\Models\\User', 1, 'api-token', '22af41e544f662408b8f2d5bb769686010bcfe7dde28d9f07452bf325c6a6a12', '[\"*\"]', '2025-10-27 04:58:28', NULL, '2025-10-27 04:56:35', '2025-10-27 04:58:28'),
(1869, 'App\\Models\\User', 1, 'api-token', 'a1567fa6a03d7cbdc3c74ff075f06cddebb2a5bf2291d033ca0ad9361ae3c6da', '[\"*\"]', '2025-10-27 05:00:02', NULL, '2025-10-27 04:58:59', '2025-10-27 05:00:02'),
(1870, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c85683dc2ea03b85dd8c8fc1a58d54f205fb58a9b22439dff3085dbeba29b690', '[\"*\"]', '2025-10-27 05:03:13', NULL, '2025-10-27 05:00:10', '2025-10-27 05:03:13'),
(1871, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f48884ebba1ae5382bd13484618809e2388ee138c9ec11b62b66e41e421c335e', '[\"*\"]', '2025-10-27 05:06:46', NULL, '2025-10-27 05:03:22', '2025-10-27 05:06:46'),
(1872, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1bf41d6ba367d2d392360228645889ca4f5674045bcc8e4c1a8e4f952677e551', '[\"*\"]', NULL, NULL, '2025-10-27 05:39:05', '2025-10-27 05:39:05'),
(1873, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a3c040ecd94a832ac8f434781b9d66e3e145d9935e9b283d96755210c1d01969', '[\"*\"]', NULL, NULL, '2025-10-27 05:42:06', '2025-10-27 05:42:06'),
(1874, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd258d69aace2c06c8013981854762533729c1bd6ca17f50590c6058c71ef1153', '[\"*\"]', NULL, NULL, '2025-10-27 05:59:25', '2025-10-27 05:59:25'),
(1875, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ecea34ccff45b3e1908af4c546d1c0cbfcb3f82810b4c839d34b48def2f29831', '[\"*\"]', NULL, NULL, '2025-10-27 09:13:46', '2025-10-27 09:13:46'),
(1876, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'fbb62dad961140439299966560a257341ae283e5951aba6139abde77202cf7b2', '[\"*\"]', NULL, NULL, '2025-10-27 09:16:10', '2025-10-27 09:16:10'),
(1877, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b111e524a4097133295a1cb901159c811699b580c8b7a1612715f046680ee006', '[\"*\"]', NULL, NULL, '2025-10-27 09:21:13', '2025-10-27 09:21:13'),
(1878, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b23eb28250d55fc83c9515eb212067a64304435fea9c95882d142f17a7e0d0b0', '[\"*\"]', NULL, NULL, '2025-10-27 09:23:57', '2025-10-27 09:23:57'),
(1879, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '6e83f51ccb8f3c2a2b693fab3c1831df51f61abae257efc578a5b325ec1acba5', '[\"*\"]', '2025-10-27 09:25:27', NULL, '2025-10-27 09:25:13', '2025-10-27 09:25:27'),
(1880, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '176997f557959f4a1783aba1cedc0eb8db9cfadb579d9a710de7e1fca2084c63', '[\"*\"]', '2025-10-27 22:14:03', NULL, '2025-10-27 20:52:59', '2025-10-27 22:14:03'),
(1881, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f56e3bc22797122f1cf0fa19f14554934f58d475f83f1b1e481269877e7be524', '[\"*\"]', NULL, NULL, '2025-10-30 02:27:35', '2025-10-30 02:27:35'),
(1882, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '1cbf596b0aaba43f66d9f117affa71616c482901bc5358802dd2313cda6cfd43', '[\"*\"]', NULL, NULL, '2025-10-30 02:38:34', '2025-10-30 02:38:34'),
(1883, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'adeebd14d3bf6f66730a31c73b346642c73cdbc254bcd94862d14d26f596f91c', '[\"*\"]', NULL, NULL, '2025-10-30 02:39:06', '2025-10-30 02:39:06'),
(1885, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '763c6a46c4ed0d6f3c82581049b9bf34680f01fc65cda6d1ab46a49cab05cf96', '[\"*\"]', '2025-10-30 03:20:58', NULL, '2025-10-30 02:54:03', '2025-10-30 03:20:58'),
(1886, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'ed9b11e6035a51d504108b60caa7d6284be207b7d46672b974906e15dda69a88', '[\"*\"]', NULL, NULL, '2025-10-30 02:58:08', '2025-10-30 02:58:08'),
(1887, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '4e35b4b33848b2d858cfa0257f5259e9083069785d89c39dd9dc749b075ca756', '[\"*\"]', '2025-11-01 21:40:17', NULL, '2025-10-30 03:00:33', '2025-11-01 21:40:17'),
(1888, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '436c9ec6d7aa421997fd1284ba4d4b0e760533b3c3d378ca07c8ef810f2eb605', '[\"*\"]', '2025-10-30 03:48:40', NULL, '2025-10-30 03:48:31', '2025-10-30 03:48:40'),
(1889, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '9b65044ff51347c5d0887f6a7f8ab15b7f4ec34d3b6d29bf5dbcfd675aeb76cb', '[\"*\"]', '2025-10-30 03:59:32', NULL, '2025-10-30 03:59:29', '2025-10-30 03:59:32'),
(1892, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '279d785669e9443220f24e9ca86c7339f35635caa12f2abeedf2bed98a483882', '[\"*\"]', '2025-10-30 04:05:06', NULL, '2025-10-30 04:04:54', '2025-10-30 04:05:06'),
(1893, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'a037a6d4ae0977d0a5b3a8f0cbbae0cb53cb56f7a4b8a92bed4bbbd448052b37', '[\"*\"]', '2025-11-01 07:01:57', NULL, '2025-10-31 10:56:14', '2025-11-01 07:01:57'),
(1894, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '03853ab2004bc98c86b2590dfa6426c337a100111c724b80562fa7d691df0546', '[\"*\"]', NULL, NULL, '2025-10-31 11:03:24', '2025-10-31 11:03:24'),
(1895, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'b730d37000341a714e18e1a131b09280e5a4b3678a25723d76870cca3a42c5a5', '[\"*\"]', '2025-10-31 11:09:31', NULL, '2025-10-31 11:08:52', '2025-10-31 11:09:31'),
(1897, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'fd301def489c07b4bcf4aa8496b6912ea2d046c9633a3b9c44ad99eaeaf0ccd0', '[\"*\"]', '2025-10-31 11:33:04', NULL, '2025-10-31 11:33:00', '2025-10-31 11:33:04'),
(1899, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f0f1e13e4cd2c898e4051ceb59e4a076eadb707b9747b1587dbdd7eca33fecb0', '[\"*\"]', '2025-10-31 11:35:52', NULL, '2025-10-31 11:35:31', '2025-10-31 11:35:52'),
(1901, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '860f2247bdc67f7e15bbd972351b0c39a4fc6158816b1f869d994a0277bbb018', '[\"*\"]', '2025-10-31 11:41:48', NULL, '2025-10-31 11:40:39', '2025-10-31 11:41:48'),
(1902, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'd6e7e0c1b7e5eb3af7422b82a54dd554f3f66ef78c7499d361496010819ff576', '[\"*\"]', '2025-10-31 11:42:37', NULL, '2025-10-31 11:42:20', '2025-10-31 11:42:37'),
(1903, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '33e4ecd0722fa3af00a35aa4a8e1c65cefcf8828a3b3dbb395d04e21ec304012', '[\"*\"]', '2025-10-31 11:45:25', NULL, '2025-10-31 11:43:12', '2025-10-31 11:45:25'),
(1904, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'fac57287a634966812d6427b6cc341ebf2f5268e738391a68f485603eb39f601', '[\"*\"]', '2025-10-31 12:12:21', NULL, '2025-10-31 11:45:58', '2025-10-31 12:12:21'),
(1905, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '38f3d2f2885822827e01f7bd5170d6ffc3785e3a9ce28fc77443abefa26a4e6a', '[\"*\"]', '2025-10-31 12:24:01', NULL, '2025-10-31 12:23:41', '2025-10-31 12:24:01'),
(1906, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'd8771db3548ab97f71ee432d58122361de1ad4400881f231e9aa9a7401116d48', '[\"*\"]', '2025-10-31 12:24:46', NULL, '2025-10-31 12:24:44', '2025-10-31 12:24:46'),
(1907, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'cfba9a127c4801fc09fa61edb84afdb63f438e62d11f48bbcd16aa67d9e49f33', '[\"*\"]', '2025-10-31 12:32:52', NULL, '2025-10-31 12:32:49', '2025-10-31 12:32:52'),
(1908, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'd40955824af9bafccc3fa0d1bb6394bbcff9ce43857e6762c679e6c4c3457fb1', '[\"*\"]', '2025-10-31 12:48:07', NULL, '2025-10-31 12:44:05', '2025-10-31 12:48:07'),
(1909, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'dfbf406e374f8f5760d7231add6a4a53605f171768302161a0373d20681d295a', '[\"*\"]', '2025-10-31 20:10:19', NULL, '2025-10-31 20:10:16', '2025-10-31 20:10:19'),
(1910, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f1450141ac978e99a05ad7f89a1addfd925225fbc3e0942b7317cc438364581c', '[\"*\"]', '2025-10-31 20:53:47', NULL, '2025-10-31 20:53:42', '2025-10-31 20:53:47'),
(1911, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '85651c2091ab1369bae54fcb138b2ad522e04008e136a681e1f924b587f824a8', '[\"*\"]', '2025-10-31 21:24:17', NULL, '2025-10-31 21:19:57', '2025-10-31 21:24:17'),
(1912, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '1752fb275268c2676a030f94c65f4c20cadf315423d207715c7eac234ea6fecb', '[\"*\"]', '2025-10-31 21:29:17', NULL, '2025-10-31 21:26:58', '2025-10-31 21:29:17'),
(1913, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '02461e491944b59959754a6458837ae3ff6c53afe84eb372bb6fb441f0201db6', '[\"*\"]', '2025-10-31 21:42:06', NULL, '2025-10-31 21:33:25', '2025-10-31 21:42:06'),
(1914, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'b6315386a370e2742189e673745ed890f17f644d58c2417430ae26d71f563068', '[\"*\"]', '2025-10-31 21:42:44', NULL, '2025-10-31 21:42:39', '2025-10-31 21:42:44'),
(1915, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '0366469e3d547a5ce113ba64907805c79f34ebff263c6fa7a721fab090a641cf', '[\"*\"]', '2025-10-31 21:45:02', NULL, '2025-10-31 21:44:58', '2025-10-31 21:45:02'),
(1916, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'dd9e42f3548c8647c0bb0b54d9ca502070a607d9f8f6d61781fc9a3219a3d1cc', '[\"*\"]', '2025-10-31 21:46:05', NULL, '2025-10-31 21:45:56', '2025-10-31 21:46:05'),
(1917, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '6df29218e001bfea0360d2ba0ddb3dc58171785caff4c15e93fa3881f6db604c', '[\"*\"]', '2025-10-31 21:52:28', NULL, '2025-10-31 21:51:12', '2025-10-31 21:52:28'),
(1918, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'a5e9455f963a1736bea9f8adcdfae0822d94d6d249fa5b85e21fec85584f582c', '[\"*\"]', '2025-10-31 22:54:45', NULL, '2025-10-31 22:46:35', '2025-10-31 22:54:45'),
(1919, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '894a852397fea0068aaf8baa7869b4d4b217d7b9686dc5e4fa903b34b43b2383', '[\"*\"]', '2025-10-31 22:59:13', NULL, '2025-10-31 22:58:34', '2025-10-31 22:59:13'),
(1920, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'e28d15049fccb7a5041657610fe53d98f44356a48ef0208ce2d3d7835ef94e6c', '[\"*\"]', '2025-10-31 23:01:16', NULL, '2025-10-31 23:00:59', '2025-10-31 23:01:16'),
(1921, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f44eb76cc754be42626549f9fdf7f29034e263085532c3d13ea983576fcdba20', '[\"*\"]', '2025-10-31 23:10:35', NULL, '2025-10-31 23:10:12', '2025-10-31 23:10:35'),
(1922, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f2beb9a6d56b1b502d2e14681f23efaad02db2da173478007aa514be13a11911', '[\"*\"]', '2025-11-01 07:03:11', NULL, '2025-11-01 06:55:34', '2025-11-01 07:03:11'),
(1923, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'a0be3c8134eafcb0f744eda896dfecd7a10c2f06fee75d49ea06293e353f15ec', '[\"*\"]', '2025-11-01 07:35:12', NULL, '2025-11-01 07:09:59', '2025-11-01 07:35:12'),
(1924, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '0c4fba391c80909ef507d303207f47ff9b70fa91f7163cf94701bd9455fa421e', '[\"*\"]', '2025-11-01 08:42:29', NULL, '2025-11-01 08:42:12', '2025-11-01 08:42:29'),
(1925, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f95fd753921e175b1159821d063db525fb240bb2802fd6c165631cbab493c90f', '[\"*\"]', '2025-11-01 21:13:24', NULL, '2025-11-01 21:13:19', '2025-11-01 21:13:24'),
(1926, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '522cee97580fa81284815d7fe1532267ef6d11a9b811374da2ba15c78a90a2c9', '[\"*\"]', '2025-11-01 21:27:09', NULL, '2025-11-01 21:22:53', '2025-11-01 21:27:09'),
(1927, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', '67bc8e9b25dd22a2a8fa6abb06402c314fabb5c42c5cff73f237cb8c45f28c25', '[\"*\"]', '2025-11-01 21:29:34', NULL, '2025-11-01 21:28:38', '2025-11-01 21:29:34'),
(1928, 'App\\Models\\DeliveryMan', 32, 'deliveryman-api-token', 'f59c62f159962c2c0fdaf8ad82adfef13efbb0e3b09a1eec4489e5f72f2db161', '[\"*\"]', '2025-11-01 21:30:12', NULL, '2025-11-01 21:30:08', '2025-11-01 21:30:12'),
(1930, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '9e1cd4a75575054d6c09b1ce096b155c75031aad2840e9027cc898565106ad95', '[\"*\"]', '2025-11-01 21:51:34', NULL, '2025-11-01 21:39:52', '2025-11-01 21:51:34'),
(1931, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'e7c76fd2305a5b1d24d393ed39f4b8e8fa8ee92dac3c7f4444b52ac514601d47', '[\"*\"]', '2025-11-01 21:52:34', NULL, '2025-11-01 21:45:30', '2025-11-01 21:52:34'),
(1932, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'aef1f6e7e4686f3f20a7edc63297ceb1dc824f230e6763d475bd74ef7063a45e', '[\"*\"]', '2025-11-08 20:58:19', NULL, '2025-11-01 21:51:23', '2025-11-08 20:58:19'),
(1936, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5ed305694db6003417d7dfad734b0e6862b2c82bbb60ac3ce67cfa3264c1884a', '[\"*\"]', '2025-11-01 22:06:05', NULL, '2025-11-01 22:05:56', '2025-11-01 22:06:05'),
(1937, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '08a47fb2ff55fd2cc96278dcedea17f71bd941c789c21ef26591219629160b43', '[\"*\"]', '2025-11-01 23:50:32', NULL, '2025-11-01 23:44:53', '2025-11-01 23:50:32'),
(1938, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '02e99b5bd1261c55c2f7b8b7578607a942d837104312bafbe953b5b0599a2dee', '[\"*\"]', '2025-11-02 00:11:58', NULL, '2025-11-02 00:11:18', '2025-11-02 00:11:58'),
(1939, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '0074b7f333b722f70d9a934485d5967aba6f0427a74637f1419be5bfc29a5f79', '[\"*\"]', '2025-11-02 00:26:28', NULL, '2025-11-02 00:21:45', '2025-11-02 00:26:28'),
(1940, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '69a320020757254f86444eb5b1dbae394f8cb64f43501ba592a0dc73c1451110', '[\"*\"]', '2025-11-02 00:36:26', NULL, '2025-11-02 00:31:57', '2025-11-02 00:36:26'),
(1941, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ec01afa1d5e3adc84d5ba0e4efd29ffb48beb5c2b375d909ce001b442ad9a1c9', '[\"*\"]', '2025-11-02 00:38:56', NULL, '2025-11-02 00:38:38', '2025-11-02 00:38:56'),
(1942, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '0773571245f0d506e1bb37ff75744e7a9c6804d7cee2e9a4ab1197ec39896130', '[\"*\"]', '2025-11-02 00:44:01', NULL, '2025-11-02 00:40:24', '2025-11-02 00:44:01'),
(1943, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'f99d0674d4b77165c363dbf622f3251bb34e837a1bfdf41701661910f580c2ce', '[\"*\"]', '2025-11-02 01:34:58', NULL, '2025-11-02 00:49:49', '2025-11-02 01:34:58'),
(1944, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b36fefddd9fb69e1fdde3bdc27551e3781eb530fe8919da9e91f910a6450f0ed', '[\"*\"]', '2025-11-02 01:39:23', NULL, '2025-11-02 01:39:12', '2025-11-02 01:39:23'),
(1945, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '87a1cb5da7ebbd81ba5cfdb1bc8d89b88389eda8e9bf476d0083d36b5d1ea0e5', '[\"*\"]', '2025-11-02 01:58:18', NULL, '2025-11-02 01:47:10', '2025-11-02 01:58:18'),
(1946, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ad8e13d5ba277cf8554eba5ee0e23f75f796bfa68f7b4160ec36d1f538b3574c', '[\"*\"]', '2025-11-02 02:22:11', NULL, '2025-11-02 02:22:02', '2025-11-02 02:22:11'),
(1947, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '49dacaca7887e1316429953ee93b6ba71f6750b181ed90f05871ae3447f8dd7b', '[\"*\"]', '2025-11-02 02:28:17', NULL, '2025-11-02 02:27:47', '2025-11-02 02:28:17'),
(1948, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '0014062405ba2147127b0869691d8f01588568c482b59b18a8004a7747559076', '[\"*\"]', '2025-11-02 02:33:39', NULL, '2025-11-02 02:29:05', '2025-11-02 02:33:39'),
(1949, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '9b5b2af733bc28d23200ceac86ba253a64dbf7e88228477310a889fd5da9d4bf', '[\"*\"]', '2025-11-02 02:43:50', NULL, '2025-11-02 02:38:05', '2025-11-02 02:43:50'),
(1951, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '77ec7e35f007f2adf26fbedeeacf793d2d473ef50e46e81074c5f73c8b88b4b8', '[\"*\"]', '2025-11-02 04:54:05', NULL, '2025-11-02 03:42:31', '2025-11-02 04:54:05'),
(1952, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '14ffc0997c00a18e9ec7a52e42fbc73850f7a724c1d3b771a644c0b9a5637fc9', '[\"*\"]', '2025-11-02 04:17:18', NULL, '2025-11-02 04:02:33', '2025-11-02 04:17:18'),
(1953, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '47482d9762661e0dd62acf1774910972381572bebe4c6be1237c95ee13cf71a3', '[\"*\"]', '2025-11-03 21:33:33', NULL, '2025-11-02 04:09:55', '2025-11-03 21:33:33'),
(1954, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ca4b548024f6c008e343ee2118ee10fcd428ee04461342e03aadcbb06f967ac4', '[\"*\"]', '2025-11-02 04:54:55', NULL, '2025-11-02 04:54:51', '2025-11-02 04:54:55'),
(1955, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '587579dbaa2a320857039f297d96413a8bce10b81870103619456d6a66283ae4', '[\"*\"]', '2025-11-02 04:58:02', NULL, '2025-11-02 04:58:00', '2025-11-02 04:58:02'),
(1956, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '87818bce1aee0c920ff8f84dec5d38c63d1de8a03b93d061512d74e9b1d8f663', '[\"*\"]', '2025-11-02 05:04:57', NULL, '2025-11-02 05:04:55', '2025-11-02 05:04:57'),
(1957, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2c7cb190efe058a78f3a90efa8589ad423f7c364442be2aeb8d256292cae6646', '[\"*\"]', '2025-11-02 05:18:18', NULL, '2025-11-02 05:08:32', '2025-11-02 05:18:18'),
(1958, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '4d12c9f4b77213ad91d5fda481c84cb760085e8933d8274165181982e511cf02', '[\"*\"]', '2025-11-02 05:51:41', NULL, '2025-11-02 05:51:32', '2025-11-02 05:51:41'),
(1960, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'dbbe5429e6826fa56656cfea15f50d0c8f1fd5f1e3b3a868f0fb9b8f5987d3e1', '[\"*\"]', '2025-11-02 21:12:06', NULL, '2025-11-02 20:57:13', '2025-11-02 21:12:06'),
(1961, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '316ad8e66bb8ace29db9af80ea7206b835f29c8ae77957543e57fd707d4b9375', '[\"*\"]', '2025-11-02 22:08:29', NULL, '2025-11-02 21:22:07', '2025-11-02 22:08:29'),
(1962, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd4a7fd590455745338713708daa575b97a81d1f8f25b5b2ee76890cb7ebd3636', '[\"*\"]', '2025-11-02 22:44:22', NULL, '2025-11-02 22:42:32', '2025-11-02 22:44:22'),
(1963, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '72cc5aa6ce76de86a04f00c774fd49bada03ade097cd5ec3973bf9f457a1fcac', '[\"*\"]', '2025-11-02 23:00:03', NULL, '2025-11-02 22:44:50', '2025-11-02 23:00:03'),
(1964, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '067fd1d0ebc5063b36bfb7967b21cb458410a8493ada2f61411dfeb75e183a65', '[\"*\"]', '2025-11-02 23:07:01', NULL, '2025-11-02 23:00:23', '2025-11-02 23:07:01'),
(1965, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7a5bb711cdc9e1e77133a7711c0454e74b70cb8ae77dbebca094057a85ca235e', '[\"*\"]', '2025-11-02 23:08:51', NULL, '2025-11-02 23:08:48', '2025-11-02 23:08:51'),
(1966, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2e186846a3efbbf45c45c0f8ff8f22f01faea4e2efb2f50291cb17b07b666dd3', '[\"*\"]', '2025-11-02 23:10:46', NULL, '2025-11-02 23:10:15', '2025-11-02 23:10:46'),
(1967, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c59723412af922aa86abe003ca0e8fcaff1fb3c516228cf810ef6ad212080608', '[\"*\"]', '2025-11-02 23:14:47', NULL, '2025-11-02 23:12:00', '2025-11-02 23:14:47'),
(1968, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c0daec715a8baf811f1511fb8ac57707552b108351b4471caaa925e145408931', '[\"*\"]', '2025-11-02 23:21:22', NULL, '2025-11-02 23:20:59', '2025-11-02 23:21:22'),
(1969, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'eb1868234b185a6dadb27e32312c5ebb99d969c1bdefeadca89bf524d817e43d', '[\"*\"]', '2025-11-02 23:52:59', NULL, '2025-11-02 23:22:46', '2025-11-02 23:52:59'),
(1970, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5777a07a83cae90bc5ba4583d31cdd4b0416850532a49075689934c164aa8c9b', '[\"*\"]', '2025-11-03 01:11:06', NULL, '2025-11-03 00:13:47', '2025-11-03 01:11:06'),
(1971, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'cf2c2febfcf303cdacf031db8287694517fea69113d4d69e33b85ca36f225d64', '[\"*\"]', '2025-11-03 02:24:40', NULL, '2025-11-03 01:11:23', '2025-11-03 02:24:40'),
(1972, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5baea597b2991ecab2d72f6807e8aa1992321b40993dc794cae881a75abbedf9', '[\"*\"]', '2025-11-03 02:40:41', NULL, '2025-11-03 02:28:35', '2025-11-03 02:40:41'),
(1974, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'faa2413d9b51152f843def686715b0ee6d1fcdbaf3280740e451e8ca131d6f8d', '[\"*\"]', '2025-11-03 03:16:09', NULL, '2025-11-03 03:05:49', '2025-11-03 03:16:09'),
(1975, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '65ea2bcbd8b40f39fba708a36b9b2976910e3859e4c0a3f434ea16a64e90f3b6', '[\"*\"]', '2025-11-03 03:48:43', NULL, '2025-11-03 03:22:31', '2025-11-03 03:48:43'),
(1976, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '37acdbb86aa573490336b011337c462846b0da5f1eb385d2eeeae548a95c8e08', '[\"*\"]', '2025-11-03 03:49:07', NULL, '2025-11-03 03:49:04', '2025-11-03 03:49:07'),
(1977, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '29b4012ba8b0e932eb4d5966b84dd46b3712172788c273c7076ce6845856050e', '[\"*\"]', '2025-11-03 03:59:19', NULL, '2025-11-03 03:57:05', '2025-11-03 03:59:19'),
(1978, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ddb57e84865ca0dce419e32fb8db3b194f53af1a20cd493fb316b1162643638b', '[\"*\"]', '2025-11-03 04:06:55', NULL, '2025-11-03 04:03:43', '2025-11-03 04:06:55'),
(1979, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7a85c7e990a348b64bcc4a096f0e2f451ff3711fbc54c457304a4664566822cd', '[\"*\"]', '2025-11-03 04:31:44', NULL, '2025-11-03 04:31:38', '2025-11-03 04:31:44'),
(1980, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b7dd51d031805f553076d183cf3dde0a8a18117ba0ab054e241bd844e7af0c52', '[\"*\"]', '2025-11-03 05:01:39', NULL, '2025-11-03 04:32:13', '2025-11-03 05:01:39'),
(1981, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'f02b946a807b7b384678974699bb7779225e381d4a8d20e64585681da25fee87', '[\"*\"]', '2025-11-03 05:08:45', NULL, '2025-11-03 05:02:20', '2025-11-03 05:08:45'),
(1982, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '3b57c8c025119a2078eab4f4b227821bf4d2b3a90f87f2fa5ffb562550e5ab3d', '[\"*\"]', '2025-11-03 20:57:07', NULL, '2025-11-03 20:52:28', '2025-11-03 20:57:07'),
(1983, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '42f1f0e67d790d248cb5eeba97c5116a45c3c6df633d58ab6dd397ab65d80aea', '[\"*\"]', '2025-11-03 21:11:58', NULL, '2025-11-03 20:58:22', '2025-11-03 21:11:58'),
(1984, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5b40289e699480167f9e94d374d46966eebb43261be99b303bfb13afe680a015', '[\"*\"]', '2025-11-03 21:51:12', NULL, '2025-11-03 21:51:07', '2025-11-03 21:51:12'),
(1985, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd3d0973c546d9cc5d1d56471066a422f58a44724c416d14660e3e88033f4959c', '[\"*\"]', '2025-11-03 22:30:31', NULL, '2025-11-03 21:51:36', '2025-11-03 22:30:31'),
(1986, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c8de607a5071280fc2338a57f1ef8800f47bc006f9d9e98d2903bfb30f2db85c', '[\"*\"]', '2025-11-03 22:12:00', NULL, '2025-11-03 22:11:29', '2025-11-03 22:12:00'),
(1987, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '07daa34a73ca7a2a4577ac615074e1163b90c96cb515d3525329ea459f553c5b', '[\"*\"]', '2025-11-03 22:25:18', NULL, '2025-11-03 22:13:17', '2025-11-03 22:25:18'),
(1988, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '004bcf11ef9497ed078df3c224d7afb039350142f0044f661094d42e832f9e1d', '[\"*\"]', '2025-11-03 22:54:30', NULL, '2025-11-03 22:30:50', '2025-11-03 22:54:30'),
(1989, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '6e646ab068506c691f2b228771d2a6b5d61a28882a27e29b2cc9efb99f337f79', '[\"*\"]', '2025-11-03 22:42:11', NULL, '2025-11-03 22:40:49', '2025-11-03 22:42:11'),
(1990, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b6a19493c1fa384152d8688aea65e1a44c32a5d8a4809b9f25c7058ef990c35d', '[\"*\"]', '2025-11-03 22:55:26', NULL, '2025-11-03 22:55:24', '2025-11-03 22:55:26'),
(1991, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd3478670a775082d790db77d77fea0bce1c2eae0387b15b2af1f883f4a58aa77', '[\"*\"]', '2025-11-03 22:58:19', NULL, '2025-11-03 22:58:10', '2025-11-03 22:58:19'),
(1992, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2a8ee9bb2bc3f56b3855504c0061a59f975c09ad81880c8fd492d1a643dfe996', '[\"*\"]', '2025-11-03 23:00:50', NULL, '2025-11-03 23:00:44', '2025-11-03 23:00:50'),
(1993, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '66054e0dfedd054e24d6184514f79a8883689d50b37d0f2ca448d03289c044bd', '[\"*\"]', '2025-11-03 23:02:06', NULL, '2025-11-03 23:01:38', '2025-11-03 23:02:06'),
(1994, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '40fc16fd0329e6f30568550ff164d30a44e8b70d3ea83435bf948be922e095eb', '[\"*\"]', '2025-11-03 23:06:21', NULL, '2025-11-03 23:06:15', '2025-11-03 23:06:21'),
(1995, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd3747e9fb51a486582eb2a684ad02e805993aa2437b5913755fac7c6072e784e', '[\"*\"]', '2025-11-03 23:06:48', NULL, '2025-11-03 23:06:44', '2025-11-03 23:06:48'),
(1996, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'f84e54e3bc44469ef6af76c64db89177816d4f59b4d68416591a353a11d84b5b', '[\"*\"]', '2025-11-03 23:47:04', NULL, '2025-11-03 23:07:59', '2025-11-03 23:47:04'),
(1999, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '10145273fceabfea7c50c0f655f331b8fe5d3c79aa2def4cfbaea0df18b7b460', '[\"*\"]', '2025-11-03 23:37:34', NULL, '2025-11-03 23:34:47', '2025-11-03 23:37:34'),
(2000, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1e88fd7d441d71de8bdd41ce052099bef832e04318527257b185792b4909a7f0', '[\"*\"]', '2025-11-03 23:46:50', NULL, '2025-11-03 23:38:00', '2025-11-03 23:46:50'),
(2001, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5e724f4d6cb0da3cdfa2f189496c9405921ebd5801e0cacd2500b802d25d7e1b', '[\"*\"]', '2025-11-03 23:50:49', NULL, '2025-11-03 23:48:19', '2025-11-03 23:50:49'),
(2002, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '71448e5cc4d8fb1f9287f952808d0ed1929340d1c9c61415cd1d923cc876fc67', '[\"*\"]', '2025-11-03 23:56:10', NULL, '2025-11-03 23:54:46', '2025-11-03 23:56:10'),
(2003, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2328a721344bc5e468459a5e1766020f66eaccc7f2f435ae8a0089cdf80a0337', '[\"*\"]', '2025-11-04 00:01:11', NULL, '2025-11-04 00:00:04', '2025-11-04 00:01:11'),
(2004, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '50e218a59f82b7583c2c0015d34f21871c6fb70eb2568981acc32c04e11a8a8b', '[\"*\"]', '2025-11-04 00:35:35', NULL, '2025-11-04 00:01:35', '2025-11-04 00:35:35'),
(2005, 'App\\Models\\User', 1, 'api-token', 'b89b89d2e4ae97c14c465fca4c2ab3eeafee1077558c977ef854f043f052a885', '[\"*\"]', '2025-11-04 00:05:28', NULL, '2025-11-04 00:05:25', '2025-11-04 00:05:28'),
(2008, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1b79a7587130945d5f8129ad1288d7f09cf4b35319adf756722b09437b76fad6', '[\"*\"]', '2025-11-04 01:11:53', NULL, '2025-11-04 01:04:09', '2025-11-04 01:11:53'),
(2009, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '29f1518108beca76d4354da35b036f7b0adcf80561db1e7dc1da5d0415cdc946', '[\"*\"]', '2025-11-04 01:13:39', NULL, '2025-11-04 01:13:17', '2025-11-04 01:13:39'),
(2010, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '31a4852310022f26d4f4897efc0c0df61aaca1286fde2441ff0aa58c7aa1bbee', '[\"*\"]', '2025-11-04 01:40:52', NULL, '2025-11-04 01:17:56', '2025-11-04 01:40:52'),
(2011, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '082599844e267ab2ab0b1937f2e89d995e48a83cdcd9e40b65d275f4657fdeb8', '[\"*\"]', '2025-11-04 02:15:09', NULL, '2025-11-04 02:03:29', '2025-11-04 02:15:09'),
(2013, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '27c47af4d2269bd8b4d09ff8242dcd09b22cc04845609ae24e0fe46cf48615d5', '[\"*\"]', '2025-11-04 02:54:40', NULL, '2025-11-04 02:29:07', '2025-11-04 02:54:40'),
(2014, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5f62a446bdf29e83082ac6f257e0bd9bf4952e99e3ea8dfcbce1c1f7a9ed5505', '[\"*\"]', '2025-11-04 02:41:03', NULL, '2025-11-04 02:40:36', '2025-11-04 02:41:03'),
(2015, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7dd83809806f0e951803ab161ba5e1a0408c80ae272e3e96b284706c9bb73e38', '[\"*\"]', '2025-11-04 02:41:39', NULL, '2025-11-04 02:41:37', '2025-11-04 02:41:39'),
(2016, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '13ac030d6289a587566b9a502b2abdd77f5d3468dd444088985cb329a4eb0348', '[\"*\"]', '2025-11-04 02:47:41', NULL, '2025-11-04 02:43:30', '2025-11-04 02:47:41'),
(2017, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '9dcfb01e5dbad606077f21797afe686e671da64dafcdfbccf1373c3dad476a23', '[\"*\"]', '2025-11-04 03:14:32', NULL, '2025-11-04 02:44:39', '2025-11-04 03:14:32'),
(2018, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '66d3a655468cfd296eb642f36e9f1bd1657c961d2ade8c030e811a4ca8891e50', '[\"*\"]', '2025-11-04 03:14:51', NULL, '2025-11-04 02:55:06', '2025-11-04 03:14:51'),
(2019, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '166daa8c4e85b3faab7e2dad0918d44799f9472c8e15abef24f573b2c62156d8', '[\"*\"]', '2025-11-04 03:22:02', NULL, '2025-11-04 03:21:26', '2025-11-04 03:22:02'),
(2020, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'f7d58ce4e2fed1a049cf45dcd43c677c60b4c1367dc9ce56842cba46ab15eeaf', '[\"*\"]', '2025-11-04 03:25:33', NULL, '2025-11-04 03:25:26', '2025-11-04 03:25:33'),
(2021, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '6f1224d728c2a524531dd06bc361b36fa284d4ca0ab157b97299cf6995ff9c8c', '[\"*\"]', '2025-11-04 03:45:25', NULL, '2025-11-04 03:30:42', '2025-11-04 03:45:25'),
(2022, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '30bc534cc5d689b888f4c730f8c3657abd414e5c3f48c08ee47a7c067faa5ea5', '[\"*\"]', '2025-11-04 04:24:40', NULL, '2025-11-04 03:45:48', '2025-11-04 04:24:40'),
(2023, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '527bf81c06aab23c5ba194d5f912e5f8674fcd3fa710549803e3fd690e8aaef9', '[\"*\"]', '2025-11-04 04:06:10', NULL, '2025-11-04 04:06:09', '2025-11-04 04:06:10');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2025, 'App\\Models\\User', 1, 'api-token', '7010c764b370d78b95d602804b7be0069f047e699870d7e3a92b36fc91be9338', '[\"*\"]', '2025-11-04 04:39:11', NULL, '2025-11-04 04:38:56', '2025-11-04 04:39:11'),
(2026, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'e342be0a7f3db2b64719bddb07d78b88127231ae3fcc956de916c248577d7f5e', '[\"*\"]', '2025-11-04 07:58:20', NULL, '2025-11-04 07:52:30', '2025-11-04 07:58:20'),
(2027, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '14640982f34b50657e9d216a24e386d646dadfe9d95723fa33a4e90f86f6bb6a', '[\"*\"]', '2025-11-04 21:12:04', NULL, '2025-11-04 21:03:06', '2025-11-04 21:12:04'),
(2028, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1d9bd84553c3e94dda904a8d702da8e91bed7eb5a8cf10f42369a3f5a8b83027', '[\"*\"]', '2025-11-04 21:30:19', NULL, '2025-11-04 21:15:52', '2025-11-04 21:30:19'),
(2029, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c4ab95fffe7b11c1b0e0c74ab34d7cd07deb21effe8fdd286c2c8b68bec01bb6', '[\"*\"]', '2025-11-04 21:58:32', NULL, '2025-11-04 21:19:27', '2025-11-04 21:58:32'),
(2030, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c8de8e208cf5bb39368251249e00983336ef0a7deba7f40aee2aad0a86f22580', '[\"*\"]', '2025-11-04 21:44:53', NULL, '2025-11-04 21:37:17', '2025-11-04 21:44:53'),
(2032, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '3d49e3eee8197a1d7cd750789b5d4eaa2339bacf0d38a40cfb68166c879d115d', '[\"*\"]', '2025-11-04 22:01:42', NULL, '2025-11-04 21:58:53', '2025-11-04 22:01:42'),
(2033, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a36099f01f93c7e85327b214067c74a45e2137272d12d8373692e0244d7af90d', '[\"*\"]', '2025-11-04 22:07:40', NULL, '2025-11-04 22:07:33', '2025-11-04 22:07:40'),
(2034, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4f60f5cfd7eea113f1b21af93ee7f5acf3ffc533b9f8c7363e8e7480f45a1626', '[\"*\"]', '2025-11-04 22:13:13', NULL, '2025-11-04 22:08:12', '2025-11-04 22:13:13'),
(2036, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd4174f6590d32866d6ab16a9c500a4174c1eeda8c47f363a903b66eb85fbc320', '[\"*\"]', '2025-11-04 22:19:32', NULL, '2025-11-04 22:19:32', '2025-11-04 22:19:32'),
(2037, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '264c0a1e471bb1478f9a0a284c5ea14d8d289e3e833453bc49a325eeff7706f3', '[\"*\"]', '2025-11-04 22:32:06', NULL, '2025-11-04 22:29:53', '2025-11-04 22:32:06'),
(2039, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2514812c7e16fc0dfa7eedbde56793ae0a6f17aa87dafc4c5cf048a1df12b86f', '[\"*\"]', '2025-11-04 22:42:18', NULL, '2025-11-04 22:40:19', '2025-11-04 22:42:18'),
(2044, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4890ce2b32e8a1cc8dfc3f4c025d9250b4dc5b4c33291f44b5a812df9def85bf', '[\"*\"]', '2025-11-04 23:05:27', NULL, '2025-11-04 22:59:36', '2025-11-04 23:05:27'),
(2051, 'App\\Models\\User', 1, 'api-token', '139b82ad02ff6c03ba56ffbed22e284606caac7ab33f7094029f046afa7c7fdc', '[\"*\"]', '2025-11-05 00:18:30', NULL, '2025-11-04 23:57:21', '2025-11-05 00:18:30'),
(2057, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7c9003c0a0df5620b33325d7748cb19e6fdc8cf91ae25d1161f856e898897894', '[\"*\"]', '2025-11-05 01:03:11', NULL, '2025-11-05 01:01:20', '2025-11-05 01:03:11'),
(2058, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1d2b510a46b2e99a3e7f7edeb47107fb815794e1d23b580563246dd488502c25', '[\"*\"]', '2025-11-05 02:30:09', NULL, '2025-11-05 02:29:58', '2025-11-05 02:30:09'),
(2059, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '9b7bdedfe7c7622a66dcf189d695d4becf66f1a33889ef49c07f8a173b283822', '[\"*\"]', '2025-11-05 02:31:31', NULL, '2025-11-05 02:30:41', '2025-11-05 02:31:31'),
(2060, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c493e745364512b658179063cce4840a96fb553a82e239c45bde45db903998f6', '[\"*\"]', '2025-11-05 02:35:36', NULL, '2025-11-05 02:35:31', '2025-11-05 02:35:36'),
(2061, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7cc6c527144208f925836306fb02c1a4a0b9b855fbb53773b10999292677ce8f', '[\"*\"]', '2025-11-05 02:37:00', NULL, '2025-11-05 02:35:47', '2025-11-05 02:37:00'),
(2062, 'App\\Models\\User', 1, 'api-token', 'f1c7a0a20acbaf7e344b48a8ecca28b70a44740b5f80da8562564c6a64906768', '[\"*\"]', '2025-11-05 02:37:35', NULL, '2025-11-05 02:37:30', '2025-11-05 02:37:35'),
(2064, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '168b30f5196575d0a99cd196c23c4375a09fac236363d76d40a5fc40b79549c8', '[\"*\"]', '2025-11-05 02:44:45', NULL, '2025-11-05 02:44:41', '2025-11-05 02:44:45'),
(2066, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eaa6fe0c5147e98dc356996309f39ab04dbb9f6cbbc068fdb7fc56add468538f', '[\"*\"]', '2025-11-05 02:49:46', NULL, '2025-11-05 02:47:49', '2025-11-05 02:49:46'),
(2068, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ae56a11643e006399d050e880078a95dfd96fb3b3c355bd0f97d4e667df540bd', '[\"*\"]', '2025-11-05 02:52:27', NULL, '2025-11-05 02:52:02', '2025-11-05 02:52:27'),
(2072, 'App\\Models\\User', 1, 'api-token', '43687c59d33e2fe02026a3831b4988922038cef75cc026d1b71e9367b3f3f1f4', '[\"*\"]', '2025-11-05 02:56:47', NULL, '2025-11-05 02:56:04', '2025-11-05 02:56:47'),
(2073, 'App\\Models\\User', 1, 'api-token', 'edabe65e3b4bc8e754fb6a43c6b6e6e6ee47d1ead7155550ee50a18240d31c60', '[\"*\"]', '2025-11-05 03:02:32', NULL, '2025-11-05 03:00:49', '2025-11-05 03:02:32'),
(2075, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '92e180a6e06514c614e260a2a7f867aaf5376b1e2d6cca438a79a4ca349a79c7', '[\"*\"]', '2025-11-05 03:08:41', NULL, '2025-11-05 03:06:58', '2025-11-05 03:08:41'),
(2076, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a6c07ce1f1ca87f0fbdc59911cc76e3025c7dd61df52ef2bf918987d19de0ba0', '[\"*\"]', '2025-11-05 03:10:02', NULL, '2025-11-05 03:09:58', '2025-11-05 03:10:02'),
(2077, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6c1cc60f968d41cb0865a38ee4c3842972b2ac4fdec07c2ec10a80774f672dd0', '[\"*\"]', '2025-11-05 03:10:33', NULL, '2025-11-05 03:10:29', '2025-11-05 03:10:33'),
(2080, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1228158ab7b4253d06b618421eacacd474c8f08eaf7d60a602c0d5f4e937ed90', '[\"*\"]', '2025-11-05 03:20:34', NULL, '2025-11-05 03:19:39', '2025-11-05 03:20:34'),
(2083, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'dcd1a09509fd66931280ab2d244f5a3040d9a2ba071d912be395ae6411356f3e', '[\"*\"]', '2025-11-05 03:39:31', NULL, '2025-11-05 03:39:24', '2025-11-05 03:39:31'),
(2093, 'App\\Models\\User', 132, 'api-token', '766462e1ed5c2c41e25864b279f26f51134c84148dbb89575e86ac29bdce8554', '[\"*\"]', '2025-11-05 03:47:00', NULL, '2025-11-05 03:46:55', '2025-11-05 03:47:00'),
(2095, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '349e73eb823b239f54aeae398e449fafbba276590aa9a0aa7d542ec061ea59f8', '[\"*\"]', '2025-11-05 04:00:36', NULL, '2025-11-05 04:00:21', '2025-11-05 04:00:36'),
(2096, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '4babec223149d97a5c4a4a468bff9a7ecd9224db74479b14b8111e200b2a9ad5', '[\"*\"]', NULL, NULL, '2025-11-05 04:01:02', '2025-11-05 04:01:02'),
(2099, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'f489a7a55726b3dc222c5bf180485ee1517264abfbc8215fbe39f2c69e6aa522', '[\"*\"]', '2025-11-05 04:02:00', NULL, '2025-11-05 04:02:00', '2025-11-05 04:02:00'),
(2106, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'efcc7919ac481289f066b9b68b1484b049489eaee6ff01b40a589e0dbe6f4415', '[\"*\"]', '2025-11-05 04:09:41', NULL, '2025-11-05 04:09:41', '2025-11-05 04:09:41'),
(2108, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '571f47fc29619d24580bbe8aa78b618b61e92ec05eb3916f8034f266f550c94b', '[\"*\"]', '2025-11-05 05:03:27', NULL, '2025-11-05 05:03:26', '2025-11-05 05:03:27'),
(2109, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '25c17d45e87c80d2ed28886ba8b50ff1471c4f83dc71251564957162f23769ef', '[\"*\"]', '2025-11-05 21:22:04', NULL, '2025-11-05 20:57:15', '2025-11-05 21:22:04'),
(2110, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'cb9c0c166e33418d2a9406cee930244091d07daadc97d4def7e2ae165c2d8023', '[\"*\"]', '2025-11-05 21:40:04', NULL, '2025-11-05 21:40:04', '2025-11-05 21:40:04'),
(2111, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4469a7a157edcc3668cec15f616f9934adc0327b397a101016bc666fbe5bfd92', '[\"*\"]', '2025-11-05 21:41:52', NULL, '2025-11-05 21:41:37', '2025-11-05 21:41:52'),
(2112, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a7f2fe6754585339cec214d0fdc508a637bd766fe0121757f76a34aaa0fb5838', '[\"*\"]', '2025-11-05 22:05:44', NULL, '2025-11-05 22:05:43', '2025-11-05 22:05:44'),
(2113, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2912cef53ba7e3bb783cd2a115187c29d010f8a86d51203c550dc01f95f84c5d', '[\"*\"]', '2025-11-05 22:06:45', NULL, '2025-11-05 22:06:44', '2025-11-05 22:06:45'),
(2114, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'aa8467e51f25c4f7b0e5afb680f60c19e1aa4ec54bf662b875f1d58aadc578ee', '[\"*\"]', '2025-11-05 23:40:23', NULL, '2025-11-05 22:18:27', '2025-11-05 23:40:23'),
(2115, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f543386ac6bd31fc9bf1fa3f14cfed5101239fdee5baf161c15c116b453a7f1e', '[\"*\"]', '2025-11-05 23:47:21', NULL, '2025-11-05 23:41:02', '2025-11-05 23:47:21'),
(2116, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd99b7f428737e466840e6ce8a4333bb0e5d6e7f808acebc2fd937e1a593782eb', '[\"*\"]', '2025-11-05 23:48:31', NULL, '2025-11-05 23:48:30', '2025-11-05 23:48:31'),
(2117, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '47bf5147f9c3483c62789a5864ce85e864e12c9e9e9dfb1be1cdc6dc0c312150', '[\"*\"]', '2025-11-05 23:59:38', NULL, '2025-11-05 23:48:53', '2025-11-05 23:59:38'),
(2118, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8fae5bc9738e6a2a070ba5272f88c329e4acc0aae688a860f112e6d2b398005c', '[\"*\"]', '2025-11-06 00:04:49', NULL, '2025-11-06 00:00:53', '2025-11-06 00:04:49'),
(2119, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7a30116e591a740ea608ecd1d526209393698450ad5fcd9405324ac7f7706a62', '[\"*\"]', '2025-11-06 00:27:44', NULL, '2025-11-06 00:10:24', '2025-11-06 00:27:44'),
(2122, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9526fadfd8cde3c54bb11b3a0e3088d6c2d917b425e911dc3dbb40c0a155616c', '[\"*\"]', '2025-11-06 01:00:58', NULL, '2025-11-06 00:29:34', '2025-11-06 01:00:58'),
(2123, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '08a1242189fc1910d23641adaff9c1e66153e12ec4d3c658f9d28ba05a9d5cb7', '[\"*\"]', '2025-11-06 02:10:50', NULL, '2025-11-06 02:07:41', '2025-11-06 02:10:50'),
(2124, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '962eb88330434c319f89e111f9904cf24cbccf1ef26b487e856cae363a09d34f', '[\"*\"]', '2025-11-06 02:11:58', NULL, '2025-11-06 02:11:54', '2025-11-06 02:11:58'),
(2125, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bfb7027007e64123db3e67b959e57a6a601575a2b43e0e8957585d0cca440b1e', '[\"*\"]', '2025-11-06 02:13:50', NULL, '2025-11-06 02:13:33', '2025-11-06 02:13:50'),
(2127, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'fab8c3d31505b45df20868f4850eabcee16bbb42bb5f6beb1815e04da5c93715', '[\"*\"]', '2025-11-06 02:15:24', NULL, '2025-11-06 02:15:23', '2025-11-06 02:15:24'),
(2128, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '75ca3f50b0ad74b95fec38a21bbcf3144be4f9899b8aa2896f99edeff6c8de73', '[\"*\"]', '2025-11-06 02:29:20', NULL, '2025-11-06 02:16:38', '2025-11-06 02:29:20'),
(2132, 'App\\Models\\User', 1, 'api-token', '78a091c8179dcc5956052db8af99e87d56b66bd575a4cd821a20e8d40907d586', '[\"*\"]', '2025-11-06 02:47:57', NULL, '2025-11-06 02:44:48', '2025-11-06 02:47:57'),
(2133, 'App\\Models\\User', 1, 'api-token', '5ef2fc83049d922a35e57518a3e7d51a4cc658afff7fc88bc3e78111402728c0', '[\"*\"]', '2025-11-06 02:50:53', NULL, '2025-11-06 02:50:51', '2025-11-06 02:50:53'),
(2134, 'App\\Models\\User', 1, 'api-token', 'c318c0e7ef19eec5292121a88a2e7efda3716d3490eeff8cc6b26245af4861e1', '[\"*\"]', '2025-11-06 03:07:49', NULL, '2025-11-06 02:52:47', '2025-11-06 03:07:49'),
(2135, 'App\\Models\\User', 1, 'api-token', '9690a3b2f3ed9f12ceaa5d1e6349ff1a74306cfcde9351087aecbef559b78572', '[\"*\"]', '2025-11-06 03:15:02', NULL, '2025-11-06 03:14:59', '2025-11-06 03:15:02'),
(2137, 'App\\Models\\User', 1, 'api-token', '0cf293dcdaaff2a4b16d19d5cfb6f7d1f285ac9df05c3ca8afc48083ffe7b2b3', '[\"*\"]', '2025-11-06 05:03:13', NULL, '2025-11-06 03:16:47', '2025-11-06 05:03:13'),
(2138, 'App\\Models\\User', 1, 'api-token', '637dd155c9b20be1eee157217a2ce0b62261c72d3d3cf9e9748af362ae0c8b62', '[\"*\"]', '2025-11-07 20:50:21', NULL, '2025-11-07 20:50:19', '2025-11-07 20:50:21'),
(2139, 'App\\Models\\User', 1, 'api-token', 'df33167ef9c60dbd24f89071185b82f8c8362b6b68c12aad78930aa676647f82', '[\"*\"]', '2025-11-07 21:20:04', NULL, '2025-11-07 21:20:01', '2025-11-07 21:20:04'),
(2140, 'App\\Models\\User', 1, 'api-token', 'faa8ba451e86b750b2a2b1be29380cf4dcbfebda2394999a474370806672616d', '[\"*\"]', '2025-11-07 23:02:18', NULL, '2025-11-07 21:56:49', '2025-11-07 23:02:18'),
(2141, 'App\\Models\\User', 1, 'api-token', 'f3cc5f79841c3ce8f625198f65ad8a53350bcfec661af2b0531afea209a36120', '[\"*\"]', '2025-11-07 23:08:40', NULL, '2025-11-07 23:03:25', '2025-11-07 23:08:40'),
(2142, 'App\\Models\\User', 1, 'api-token', 'e64aaa21bd6dff20bd3e46d175e928d25010fe1aef542433745f7c62a921c477', '[\"*\"]', '2025-11-07 23:08:57', NULL, '2025-11-07 23:08:52', '2025-11-07 23:08:57'),
(2143, 'App\\Models\\User', 1, 'api-token', '290eee42e713603502fa96a168b5c5a41f865e5f152a5bb2ca3340ce6a71e7d8', '[\"*\"]', '2025-11-07 23:27:45', NULL, '2025-11-07 23:10:30', '2025-11-07 23:27:45'),
(2144, 'App\\Models\\User', 1, 'api-token', '469b355c09d8228f6fd5022c0055994fe1778d2ee76feb89736bc3a95f0be183', '[\"*\"]', '2025-11-08 00:44:00', NULL, '2025-11-07 23:28:00', '2025-11-08 00:44:00'),
(2146, 'App\\Models\\User', 1, 'api-token', 'd27831d58d323a5d7f5f9dc0bad4f43eeb31352ce7668a726881ae5436bdcfb3', '[\"*\"]', '2025-11-08 02:33:46', NULL, '2025-11-08 02:29:12', '2025-11-08 02:33:46'),
(2147, 'App\\Models\\User', 1, 'api-token', '0184d3180f8d260ccfe6772f5855dda6000e8e1e30cb64b606601b38743b097a', '[\"*\"]', '2025-11-08 02:44:37', NULL, '2025-11-08 02:44:26', '2025-11-08 02:44:37'),
(2148, 'App\\Models\\User', 1, 'api-token', '3cea269d0bc6d392f40759163fb2c417442a09dd896d7f88ae4ccdd1e814249d', '[\"*\"]', '2025-11-08 02:46:50', NULL, '2025-11-08 02:46:41', '2025-11-08 02:46:50'),
(2149, 'App\\Models\\User', 1, 'api-token', 'ca5a32721f1957b11d9b2ed5f2575c342b88e39c34844234ce198c43c2307572', '[\"*\"]', '2025-11-08 03:58:55', NULL, '2025-11-08 03:58:39', '2025-11-08 03:58:55'),
(2154, 'App\\Models\\User', 1, 'api-token', '7d3eea5d07cdb8a2c22ef589b1ddba47c6cef8f5f33f8b21dfda3a11fb54ef7e', '[\"*\"]', '2025-11-08 05:02:27', NULL, '2025-11-08 05:02:24', '2025-11-08 05:02:27'),
(2155, 'App\\Models\\User', 1, 'api-token', 'e43494e640f7286b27619ce39ee4d5f92109d0c9fc3da85ee3a4b5b2417798e5', '[\"*\"]', '2025-11-08 05:05:23', NULL, '2025-11-08 05:04:09', '2025-11-08 05:05:23'),
(2156, 'App\\Models\\User', 1, 'api-token', '3ba83ebed2cc72f6fa80e18b24b8140e408944d2308453f545e93f2a7077bd3a', '[\"*\"]', '2025-11-08 05:16:14', NULL, '2025-11-08 05:05:36', '2025-11-08 05:16:14'),
(2157, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ab4fee57ac7cf4c9be46bcbae1232685f5026680b5b380afd2376c643dd24aff', '[\"*\"]', '2025-11-08 19:47:30', NULL, '2025-11-08 19:47:20', '2025-11-08 19:47:30'),
(2158, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '3c68aa54d11e7f03debab93425411f8755b153a8b5653b12c88b857d9a468544', '[\"*\"]', NULL, NULL, '2025-11-08 20:57:43', '2025-11-08 20:57:43'),
(2159, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '7df81a807da192c2b26801ae8b961e5eaa9331bc7354b8e0c6d76c8d8a9cc060', '[\"*\"]', NULL, NULL, '2025-11-08 21:04:10', '2025-11-08 21:04:10'),
(2160, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '2d1b6693cea4812f5c03c6553bb8c9328d6b5760283e82db6b04714cb7934890', '[\"*\"]', NULL, NULL, '2025-11-08 21:20:56', '2025-11-08 21:20:56'),
(2161, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '2aa719e278dac178ba25d7c196f90a54ace3e6cde9eb0db90aa96734d4ac2825', '[\"*\"]', NULL, NULL, '2025-11-08 21:25:30', '2025-11-08 21:25:30'),
(2162, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '0eca732ed41a5347fa98533ba7b8127e4cfbbe60f2a3b0476fc481c7cf1082e9', '[\"*\"]', NULL, NULL, '2025-11-08 21:43:04', '2025-11-08 21:43:04'),
(2163, 'App\\Models\\DeliveryMan', 3, 'deliveryman-api-token', '3e71ae344d39f2749c322e58334caeddcd7c953691faec4393247dfb0c1efc83', '[\"*\"]', NULL, NULL, '2025-11-08 21:46:42', '2025-11-08 21:46:42'),
(2164, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ab58eab4fa9a1bde1f26b89fb3f3d583916d6393ba0e1facd00b50ce502b1c40', '[\"*\"]', '2025-11-08 23:08:54', NULL, '2025-11-08 23:08:30', '2025-11-08 23:08:54'),
(2165, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a8cb11cc562c2a4848786b310c6af117fe5dc31d87b99323dcb57664cb3fba3c', '[\"*\"]', '2025-11-09 09:21:54', NULL, '2025-11-09 09:20:54', '2025-11-09 09:21:54'),
(2167, 'App\\Models\\User', 1, 'api-token', '2b386ff2c04492df787c86e1b28f23a4110476f1ecc6ff9bb02347f5171bd342', '[\"*\"]', '2025-11-09 09:23:15', NULL, '2025-11-09 09:23:14', '2025-11-09 09:23:15'),
(2168, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '78b5b2c75c8d56d802dc768eb824e960b9b95d8fe616abe6d82d9c77a16cc13e', '[\"*\"]', '2025-11-09 21:33:06', NULL, '2025-11-09 21:32:37', '2025-11-09 21:33:06'),
(2169, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '02cc76e9dc9d8b53156949134e5b6ecb4b091288cca2fa628c55c8cd34f81682', '[\"*\"]', '2025-11-09 21:48:38', NULL, '2025-11-09 21:48:09', '2025-11-09 21:48:38'),
(2170, 'App\\Models\\User', 1, 'api-token', '6b0eb54cb4d4d3cf3eeb044374ea513945e18af8630897cbde3a7529af657ee9', '[\"*\"]', '2025-11-10 03:25:09', NULL, '2025-11-10 03:24:59', '2025-11-10 03:25:09'),
(2171, 'App\\Models\\User', 1, 'api-token', '1436b47ceca7a3115fd65009113865a3e805cfd9b97331c9e19462b8064b6b29', '[\"*\"]', NULL, NULL, '2025-11-10 23:32:17', '2025-11-10 23:32:17'),
(2172, 'App\\Models\\User', 1, 'api-token', 'bf888ad93de8bfcc3dd868b7ce7cdf912c49ab073a2c6bad7f5181c16229f7f4', '[\"*\"]', '2025-11-11 00:43:31', NULL, '2025-11-11 00:14:40', '2025-11-11 00:43:31'),
(2173, 'App\\Models\\User', 1, 'api-token', '3dde79100ba962319c1c6ef3bfdd5eff3ce63f3159b5ae98217d807df8eb4c39', '[\"*\"]', '2025-11-11 02:32:23', NULL, '2025-11-11 02:32:19', '2025-11-11 02:32:23'),
(2174, 'App\\Models\\User', 1, 'api-token', '36d944fcb90e8dda292fe1e2302b32e6ea781cef4674512882039e396b09a28b', '[\"*\"]', '2025-11-16 21:40:41', NULL, '2025-11-16 21:32:34', '2025-11-16 21:40:41'),
(2176, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c4d43409f36f0fc5ba58f3d7afe1d418efe93065ac2bd43ab65801b513c88e38', '[\"*\"]', '2025-11-16 22:16:48', NULL, '2025-11-16 22:07:03', '2025-11-16 22:16:48'),
(2177, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '13d1248177a6419a860720677c32996e964977ca8ea72b595940fff2e490f826', '[\"*\"]', '2025-11-16 22:22:14', NULL, '2025-11-16 22:16:57', '2025-11-16 22:22:14'),
(2179, 'App\\Models\\User', 1, 'api-token', '1991bcd3ba4ce0864eb63d34d074155ddb5249daef8c34a0aaeb6f24fe8f116b', '[\"*\"]', '2025-11-25 04:52:33', NULL, '2025-11-25 04:51:16', '2025-11-25 04:52:33'),
(2183, 'App\\Models\\User', 1, 'api-token', '7b4bcfefda215b67ba671959341f50c79f24e0e1cd3e0de2b26e8153091c4ac9', '[\"*\"]', '2025-12-02 21:56:36', NULL, '2025-12-02 21:56:34', '2025-12-02 21:56:36'),
(2184, 'App\\Models\\User', 1, 'api-token', 'f0d1fa42ce224fb982b6f6fb9e69479f8fd8f8d31657db31f31349ab0669a260', '[\"*\"]', '2025-12-02 22:42:29', NULL, '2025-12-02 21:56:56', '2025-12-02 22:42:29'),
(2188, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '81ba644450c0d0de4a57a9713f259ff32d150c0bb48e6fd8fe62694e4da02e3f', '[\"*\"]', '2025-12-03 00:37:18', NULL, '2025-12-02 23:08:55', '2025-12-03 00:37:18'),
(2189, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'fa9540dfb95b3e77831acc2504eb8d224d81526b0a5b424d70ce5fdcf8104ec9', '[\"*\"]', '2025-12-03 02:13:43', NULL, '2025-12-03 01:07:40', '2025-12-03 02:13:43'),
(2190, 'App\\Models\\User', 1, 'api-token', 'c4d1c11159d1d64d9552afd0eed8854b04eb812da57a4c2e8c01a11185d0dfa8', '[\"*\"]', '2025-12-06 22:01:11', NULL, '2025-12-06 21:10:37', '2025-12-06 22:01:11'),
(2192, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '289a682aa786ba4948a4825cf15cdbe261ea3f8365ab2ed2ebb022679cbcd26b', '[\"*\"]', '2025-12-06 22:13:07', NULL, '2025-12-06 22:13:06', '2025-12-06 22:13:07'),
(2193, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '751f2c44a8b808e548d9967ad0ef6dfea0d8d20b0ca1591518e4b1332672338a', '[\"*\"]', '2025-12-06 22:16:03', NULL, '2025-12-06 22:16:02', '2025-12-06 22:16:03'),
(2197, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2a6c51417ec667d051b00c9d42aadd8361c4546d5663325cac548105fe95dc5f', '[\"*\"]', '2025-12-06 23:02:21', NULL, '2025-12-06 22:53:02', '2025-12-06 23:02:21'),
(2198, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f7d9a28a7f996ceca8e8b36201d281e5f337bd9ce60eeff90d9f5a37991670e0', '[\"*\"]', '2025-12-06 23:11:35', NULL, '2025-12-06 23:09:04', '2025-12-06 23:11:35'),
(2199, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7dba9e3192f0566804a3c5b9301f1ecc47f1ae1d95b5403d343ee7ad1506b609', '[\"*\"]', '2025-12-06 23:20:39', NULL, '2025-12-06 23:20:32', '2025-12-06 23:20:39'),
(2200, 'App\\Models\\User', 1, 'api-token', 'acd18fc3849f56c0b00f1b90dd70549eae7f83dfcba4222de99a8b62cf5e4c38', '[\"*\"]', '2025-12-06 23:23:40', NULL, '2025-12-06 23:23:38', '2025-12-06 23:23:40'),
(2201, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '791871aa418619e518767914b9b94021f84ce1f9fbb0d6a3d08ec041e6456aca', '[\"*\"]', '2025-12-06 23:26:08', NULL, '2025-12-06 23:24:02', '2025-12-06 23:26:08'),
(2202, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a782e3e14e70f1b5541a9499d77b29ef9b9dec4527b3b9dda252ec2f2a248823', '[\"*\"]', '2025-12-06 23:29:39', NULL, '2025-12-06 23:29:25', '2025-12-06 23:29:39'),
(2203, 'App\\Models\\User', 1, 'api-token', '9cfe85b7222cdbae597b8a1e9edbc76bb1dd84eda583c11b75b2c46c3dd21620', '[\"*\"]', '2025-12-06 23:35:50', NULL, '2025-12-06 23:35:36', '2025-12-06 23:35:50'),
(2205, 'App\\Models\\User', 1, 'api-token', 'd6283f4dfe53a6367f53bb8d39994e70f0834f2baa7d7f91a652aa2aa4a47393', '[\"*\"]', '2025-12-07 00:10:37', NULL, '2025-12-06 23:54:11', '2025-12-07 00:10:37'),
(2208, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'daa30b6cd2bef14b8fcd71d6a04f14283179191f60ff909e613805f52e20c454', '[\"*\"]', '2025-12-07 00:25:22', NULL, '2025-12-07 00:25:12', '2025-12-07 00:25:22'),
(2209, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '33e0675d6d7025b463a5fe03a0c4a57c3b624be871bd577b82c2268be151a80f', '[\"*\"]', '2025-12-07 00:31:24', NULL, '2025-12-07 00:31:20', '2025-12-07 00:31:24'),
(2210, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '166bd73371eba2bc598b39f1b6a9f99453561d81107a6aea11aa7a77e9108e26', '[\"*\"]', '2025-12-07 00:38:00', NULL, '2025-12-07 00:37:57', '2025-12-07 00:38:00'),
(2211, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '8efe45a45996582ade7c074b53011bd2d95b88c4ef5f26b7a74c63527cd40f3f', '[\"*\"]', '2025-12-07 00:41:08', NULL, '2025-12-07 00:41:06', '2025-12-07 00:41:08'),
(2213, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '14f84fd8f021f99f2c23cb280999ba690ffa4e380221041efcd21e91d93167b6', '[\"*\"]', '2025-12-07 01:02:32', NULL, '2025-12-07 01:02:29', '2025-12-07 01:02:32'),
(2214, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '1b9a6a003986647d3441c2ab0777ef9479b31b4f33dbc9553ed7e6748742db36', '[\"*\"]', '2025-12-07 01:03:33', NULL, '2025-12-07 01:03:16', '2025-12-07 01:03:33'),
(2217, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ade40ef2179e3d5be3e945f0d5616d4d11f17705cfbb6187daa9a62f06126394', '[\"*\"]', '2025-12-07 03:16:31', NULL, '2025-12-07 03:13:18', '2025-12-07 03:16:31'),
(2218, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '4a0f52b31f0a565c79ec7251f921c898e38babc851e5a3d632f8b349cf17e660', '[\"*\"]', '2025-12-07 03:39:29', NULL, '2025-12-07 03:16:46', '2025-12-07 03:39:29'),
(2219, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '750e53f63802f6bfc230813a42b2d2103d0890ebf421b52e021303b79b21670a', '[\"*\"]', '2025-12-07 03:45:42', NULL, '2025-12-07 03:40:49', '2025-12-07 03:45:42'),
(2220, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '51f6922223b7f59debfd8e8677322e6c278aae6988d94def9c4e678c8a681da1', '[\"*\"]', '2025-12-07 04:54:12', NULL, '2025-12-07 04:12:01', '2025-12-07 04:54:12'),
(2221, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'c1c0dd9f08be765edeab42203eec2b6a8550a8d0b8ee7a2cf7e163c0bb95f717', '[\"*\"]', '2025-12-07 04:32:58', NULL, '2025-12-07 04:31:58', '2025-12-07 04:32:58'),
(2222, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '071fc6b78b6dd9efddc1e8cef5c2075f31263331b361e5e99c3051b7a4bab542', '[\"*\"]', '2025-12-07 04:43:53', NULL, '2025-12-07 04:38:06', '2025-12-07 04:43:53'),
(2223, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '0d457390306e788709cbaa90f691c7b9b967e5ffc7a43a2900516f7ae88749da', '[\"*\"]', '2025-12-07 05:06:58', NULL, '2025-12-07 04:55:24', '2025-12-07 05:06:58'),
(2224, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a67d7538b1081a432055a9e16a4cf0f6a0e37d2e4ae58c714a17cb04c2a8065f', '[\"*\"]', '2025-12-07 21:53:54', NULL, '2025-12-07 21:53:53', '2025-12-07 21:53:54'),
(2226, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ba1bbbdcdc9d11c6843221ed3498109358230359c5d882263c4685eb7f267031', '[\"*\"]', '2025-12-08 21:49:34', NULL, '2025-12-08 21:43:27', '2025-12-08 21:49:34'),
(2227, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '04098b6ca6c361bf5fb6ec11292a560813efbe21b8f99fa626c53713dda7a38d', '[\"*\"]', '2025-12-08 21:50:54', NULL, '2025-12-08 21:50:00', '2025-12-08 21:50:54'),
(2229, 'App\\Models\\User', 1, 'api-token', 'aeb53f65e87525db8bcac97700a4d97ef5ce8b5e6534aa19f724506b7c0ca577', '[\"*\"]', '2025-12-09 00:16:40', NULL, '2025-12-09 00:15:13', '2025-12-09 00:16:40'),
(2230, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1189f5aa2fe81c3057ec79484cecbe058b53a58702182f9dc3170f9cb15bacca', '[\"*\"]', NULL, NULL, '2025-12-09 00:16:26', '2025-12-09 00:16:26'),
(2231, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e6b51372fbd2c8752cf02802e5406b10d39142a823698b0895320ef6060f0106', '[\"*\"]', '2025-12-09 00:44:43', NULL, '2025-12-09 00:44:13', '2025-12-09 00:44:43'),
(2234, 'App\\Models\\User', 1, 'api-token', '8cdec14ccb439402866ff7f3bdec04ed11a6315ef73feb070732675505a19afe', '[\"*\"]', '2025-12-09 02:03:00', NULL, '2025-12-09 02:02:58', '2025-12-09 02:03:00'),
(2235, 'App\\Models\\User', 1, 'api-token', '0da3c485bf0af72d165c3eaf82cde8c6a9b1bc838f8c288ae83eba36c5852b18', '[\"*\"]', '2025-12-09 02:04:06', NULL, '2025-12-09 02:04:04', '2025-12-09 02:04:06'),
(2241, 'App\\Models\\User', 1, 'api-token', '284e7e6a2d01bb3236aba98eb69dddf64cb92cbcade2d1a429d6779c0b3fbd26', '[\"*\"]', '2025-12-09 04:24:07', NULL, '2025-12-09 04:23:35', '2025-12-09 04:24:07'),
(2243, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ff1b3603f6e34ca3fae58061f74892b52e1ec98359395679012513692e5a0500', '[\"*\"]', '2025-12-09 05:12:23', NULL, '2025-12-09 05:04:10', '2025-12-09 05:12:23'),
(2246, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5ee82a504a5c25bf16fda88b78cb1129e4a1b6c713cf975944f3c1c703b845b6', '[\"*\"]', '2025-12-09 20:55:42', NULL, '2025-12-09 20:50:11', '2025-12-09 20:55:42'),
(2248, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5e1f85bfef3344e1e9e7ff16f50ab76b7b715cb931d6ddc6d4e2148826d31454', '[\"*\"]', '2025-12-09 21:20:24', NULL, '2025-12-09 21:15:27', '2025-12-09 21:20:24'),
(2255, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b92feea8090c472d4e3681fe792a84c779804de40df68cdd93f6bed7aa2551ea', '[\"*\"]', '2025-12-09 21:36:37', NULL, '2025-12-09 21:32:54', '2025-12-09 21:36:37'),
(2259, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b3866c0cda81d42f054c6baa66451e2241ca32594a619ffcd3acf26e541c61b3', '[\"*\"]', '2025-12-09 21:47:43', NULL, '2025-12-09 21:47:08', '2025-12-09 21:47:43'),
(2260, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a3e7f39a92f9ed8019fd69540e34c619fcb112592d1a4a3f0eabada51a5fbce1', '[\"*\"]', NULL, NULL, '2025-12-09 21:48:41', '2025-12-09 21:48:41'),
(2261, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a03f1e407969537c2651b18b11c82d7e5548cc8c68d768009417d0cebf3910c0', '[\"*\"]', '2025-12-09 21:57:27', NULL, '2025-12-09 21:48:43', '2025-12-09 21:57:27'),
(2262, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'bc627fe2b0ca92752b202d9e470debb263272f9413304079ecd0c9d7be4ee3b3', '[\"*\"]', '2025-12-09 21:54:51', NULL, '2025-12-09 21:48:51', '2025-12-09 21:54:51'),
(2263, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b4c7caf79421c7ca249b2d45c5e7aa567fe360fa8c95e6bc961cbb59e2724703', '[\"*\"]', '2025-12-09 21:58:55', NULL, '2025-12-09 21:58:10', '2025-12-09 21:58:55'),
(2267, 'App\\Models\\User', 1, 'api-token', '6a05c3b7c8e146c2249d1bcab635682aeb6215d3d988dc2502b8e959885a4981', '[\"*\"]', '2025-12-09 23:03:21', NULL, '2025-12-09 23:03:07', '2025-12-09 23:03:21'),
(2269, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '911ecc22e26ef59fc677c686b199ad8a30b20bf0561ee14cf969ecc035c4cc20', '[\"*\"]', '2025-12-09 23:38:23', NULL, '2025-12-09 23:38:19', '2025-12-09 23:38:23'),
(2271, 'App\\Models\\User', 1, 'api-token', '1b217b95292830d8c9eb5755705dcf114391bd47dafc79fab5701b9077a2abda', '[\"*\"]', '2025-12-09 23:38:52', NULL, '2025-12-09 23:38:50', '2025-12-09 23:38:52'),
(2274, 'App\\Models\\User', 1, 'api-token', '93568829b6ab0043fcc72fc3a8f0ff5d480718f826e9e2cd6f0d4bd041315a36', '[\"*\"]', '2025-12-10 02:22:24', NULL, '2025-12-09 23:52:48', '2025-12-10 02:22:24'),
(2275, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ef7e8e88400ec62c10c1a78c68a028fa78af59bd7adaf8113a62537d3fd60891', '[\"*\"]', '2025-12-09 23:54:12', NULL, '2025-12-09 23:54:06', '2025-12-09 23:54:12'),
(2288, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'a6cf255a153813f13ca8a938b75c0c5eb01d9f70b9d336df68f1c16157587992', '[\"*\"]', '2025-12-10 00:10:16', NULL, '2025-12-10 00:10:15', '2025-12-10 00:10:16'),
(2294, 'App\\Models\\User', 1, 'api-token', '49cc89dd5ef8f0f908a24658b26dec0c38e5cd1668a1d1df4375951ab0259b17', '[\"*\"]', '2025-12-10 00:14:01', NULL, '2025-12-10 00:13:37', '2025-12-10 00:14:01'),
(2296, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1520ed17176ff500d7be964095bf5f5b36a8127e7def391bcdb3e8ccccd98fc4', '[\"*\"]', '2025-12-10 00:15:17', NULL, '2025-12-10 00:15:17', '2025-12-10 00:15:17'),
(2300, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'b6c53f5eeddb89b746d87fcc8b34a20abdcecb005c5b28f32366b392609317ec', '[\"*\"]', '2025-12-10 00:31:56', NULL, '2025-12-10 00:30:52', '2025-12-10 00:31:56'),
(2306, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'af15bdf58dfe74e4250b0906c3534cfd2413224eb5a7797c57b063a695d9e6e5', '[\"*\"]', '2025-12-10 00:45:59', NULL, '2025-12-10 00:38:18', '2025-12-10 00:45:59'),
(2307, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7fda04601af601e3060446d5e2b72c60f831bd7834c573b096752d66c9e7f75a', '[\"*\"]', '2025-12-10 00:43:47', NULL, '2025-12-10 00:42:45', '2025-12-10 00:43:47'),
(2308, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0f8c7029a94f2654696785a1088ec3d817a366376fc55e5339e5a586f1a39e1a', '[\"*\"]', '2025-12-10 00:44:18', NULL, '2025-12-10 00:44:03', '2025-12-10 00:44:18'),
(2310, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c524f4a8b4ea12b4020d275882d67cd82e49e3968944b81d61701abab0f4b817', '[\"*\"]', '2025-12-10 02:10:47', NULL, '2025-12-10 02:08:57', '2025-12-10 02:10:47'),
(2313, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6b0cb337e025e5a1d2a7a5ce44f8816a8a283aee0401d37468581297a1b1364f', '[\"*\"]', '2025-12-10 02:39:16', NULL, '2025-12-10 02:38:27', '2025-12-10 02:39:16'),
(2316, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '9a07e52c28973d0305dc3cc14956a3d4fb640a61d7c98e4906a06712c85ae1c9', '[\"*\"]', '2025-12-10 02:51:38', NULL, '2025-12-10 02:46:18', '2025-12-10 02:51:38'),
(2317, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '0ec04251d2bbbdb89d220fc5e63457decf8d790441e1387660a84992c1dd313b', '[\"*\"]', '2025-12-10 02:53:20', NULL, '2025-12-10 02:52:49', '2025-12-10 02:53:20'),
(2326, 'App\\Models\\User', 1, 'api-token', 'b149df51861e7265587c2c1cc79a4076457bc6ce46ae433f3158a793f9237e44', '[\"*\"]', '2025-12-10 23:20:22', NULL, '2025-12-10 03:38:40', '2025-12-10 23:20:22'),
(2330, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '9e091396902b701619adfe7fca6d6532123e0e7fb7168c525305f904a4c5e615', '[\"*\"]', '2025-12-10 21:50:14', NULL, '2025-12-10 04:31:23', '2025-12-10 21:50:14'),
(2335, 'App\\Models\\User', 1, 'api-token', 'b91e55a21821fd48e2ec6e79739754b50c01310dd66fbf6cde4121d9eff65883', '[\"*\"]', '2025-12-10 05:05:55', NULL, '2025-12-10 04:36:07', '2025-12-10 05:05:55'),
(2338, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5c2765fd89b3b483bb6708b8e5c74110a9197dc251fd5bff1829a4a6bf680552', '[\"*\"]', '2025-12-10 04:50:38', NULL, '2025-12-10 04:50:08', '2025-12-10 04:50:38'),
(2340, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'dd68702ad475db20c02c39700819360ad3b1a39f212eb442b61616a14b243fe1', '[\"*\"]', '2025-12-10 22:09:37', NULL, '2025-12-10 22:08:37', '2025-12-10 22:09:37'),
(2345, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '704777fc330e7106b585853287cadf7401a28720a530317e584f4c669ce94a1b', '[\"*\"]', '2025-12-10 22:24:05', NULL, '2025-12-10 22:23:12', '2025-12-10 22:24:05'),
(2347, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ab07f5c19cfd9217e033145f420df2b78743c81d4b00a987e9d7fdd9ae80f6d9', '[\"*\"]', '2025-12-10 22:29:46', NULL, '2025-12-10 22:29:21', '2025-12-10 22:29:46'),
(2349, 'App\\Models\\User', 1, 'api-token', '7d29154039989f68875cb06770449b24e8f8e12ef24ad34cd9309144358e9fa8', '[\"*\"]', '2025-12-10 22:36:19', NULL, '2025-12-10 22:32:18', '2025-12-10 22:36:19'),
(2351, 'App\\Models\\User', 1, 'api-token', '3c2fea42e38599c88b369a8da0c058a7b469016eb3d57e84b42defad57512626', '[\"*\"]', '2025-12-10 23:15:31', NULL, '2025-12-10 22:41:18', '2025-12-10 23:15:31'),
(2353, 'App\\Models\\User', 1, 'api-token', '5bc8478b0c80f5271bff5b7b9daaa1e3c06ebd0d974667597074de70b6cf43b1', '[\"*\"]', '2025-12-13 04:49:05', NULL, '2025-12-13 04:49:03', '2025-12-13 04:49:05'),
(2355, 'App\\Models\\User', 1, 'api-token', '83190cc502b2128f5329eae267fa7e68ae0e176ddfcadc6cca405d92169377d5', '[\"*\"]', '2025-12-15 04:30:06', NULL, '2025-12-15 04:29:01', '2025-12-15 04:30:06'),
(2361, 'App\\Models\\User', 1, 'api-token', '093867f82a1db1cbe1777528934947cb890c75d14cfb3cf9dc2a70a14eb60f56', '[\"*\"]', '2025-12-15 04:42:47', NULL, '2025-12-15 04:42:45', '2025-12-15 04:42:47'),
(2362, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'fa63ebd5ca5e336602bd656f4930970897bc9e8d62326a20c711cbb1bab54ab0', '[\"*\"]', '2025-12-15 04:49:41', NULL, '2025-12-15 04:47:12', '2025-12-15 04:49:41'),
(2363, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'ccdf7d34df530685eca76addff826ab43ed690f5a8ccae40cb58c439ef3be6e9', '[\"*\"]', '2025-12-18 19:18:36', NULL, '2025-12-18 19:18:35', '2025-12-18 19:18:36'),
(2364, 'App\\Models\\User', 1, 'api-token', '2fb98c1d1b631fd987063174c198065264e8b0d192c6df9fd60eb036be7b5bbe', '[\"*\"]', '2025-12-19 01:46:45', NULL, '2025-12-19 01:46:09', '2025-12-19 01:46:45'),
(2366, 'App\\Models\\User', 1, 'api-token', 'c4903e7053d485814f6dca491058061076d85d2ac62def361ddb5cc0d921cf52', '[\"*\"]', '2025-12-20 22:02:24', NULL, '2025-12-20 21:56:28', '2025-12-20 22:02:24'),
(2367, 'App\\Models\\User', 1, 'api-token', '77cec8ed0f1e1bb3514bd158905977ca5c346ba37a028dab70e94a736e4b9575', '[\"*\"]', NULL, NULL, '2025-12-21 11:34:59', '2025-12-21 11:34:59'),
(2368, 'App\\Models\\User', 1, 'api-token', '9bd1e4ca2868bc04a981882184ec68d0281cea7c704086a182f459e280e89594', '[\"*\"]', '2025-12-21 15:03:04', NULL, '2025-12-21 11:47:43', '2025-12-21 15:03:04'),
(2369, 'App\\Models\\User', 1, 'api-token', '69e28042049a5d29208c9b69ec36450d079f4829599962cab425b404bc6f359e', '[\"*\"]', NULL, NULL, '2025-12-21 11:54:54', '2025-12-21 11:54:54'),
(2370, 'App\\Models\\User', 1, 'api-token', '87265958ef9bc366afa6452d2cb9dbd4c12edf51c61f8be70cac2d766d1b32f9', '[\"*\"]', NULL, NULL, '2025-12-21 11:55:26', '2025-12-21 11:55:26'),
(2371, 'App\\Models\\User', 1, 'api-token', '8879b802120d43f8acb50a46cbd547b3fdfe998d787e192accb49f83cd8c97c5', '[\"*\"]', NULL, NULL, '2025-12-21 12:09:42', '2025-12-21 12:09:42'),
(2372, 'App\\Models\\User', 1, 'api-token', 'b44af2bda46f0757092048019aa9b2fe290ba16eaf2127e174b3112eda0c345f', '[\"*\"]', NULL, NULL, '2025-12-21 12:10:21', '2025-12-21 12:10:21'),
(2373, 'App\\Models\\User', 1, 'api-token', 'c7aee132ebd31ddee8af41b6bb1aaed3987f8907729c9511c7a2dd0b6fa1d844', '[\"*\"]', NULL, NULL, '2025-12-21 12:21:19', '2025-12-21 12:21:19'),
(2374, 'App\\Models\\User', 1, 'api-token', '1f4abb04f7c73c98629c4c21377ce95a470068cb3cccbad50d806dbdb74f3d49', '[\"*\"]', '2025-12-22 07:57:43', NULL, '2025-12-21 13:02:48', '2025-12-22 07:57:43'),
(2375, 'App\\Models\\User', 1, 'api-token', '6990c35d2ddd7d7759b619b5a71f2e96a7ac82ed3db0cc3107c4c739f892cf9c', '[\"*\"]', '2025-12-22 08:11:09', NULL, '2025-12-21 13:14:04', '2025-12-22 08:11:09'),
(2376, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '952d373c2a036f263381c9a9a9f88d1582075eb8c71214b522f3f655368d9782', '[\"*\"]', NULL, NULL, '2025-12-21 15:15:43', '2025-12-21 15:15:43'),
(2377, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '1f4f949dbd5a8384d532cc35853a2ab1b017d0adeb4daf3b071523f007daac60', '[\"*\"]', NULL, NULL, '2025-12-21 15:16:15', '2025-12-21 15:16:15'),
(2378, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7df81dece84249e48d66fba6a71b3318809dcf30b47f412d4e908188cd8eff8b', '[\"*\"]', '2025-12-21 15:19:41', NULL, '2025-12-21 15:19:38', '2025-12-21 15:19:41'),
(2379, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd12a11df5fd8b828cf05941bf51649102676a4634239cfc3a15b382e18b658a3', '[\"*\"]', '2025-12-21 15:33:24', NULL, '2025-12-21 15:33:22', '2025-12-21 15:33:24'),
(2380, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '85f2e5b1f6c90cfefda262dd62bf70d9fc61e4d1163e2d5751139a94bc072588', '[\"*\"]', '2025-12-21 15:39:27', NULL, '2025-12-21 15:39:25', '2025-12-21 15:39:27'),
(2381, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '56485fd1d6da41d53cb144af3ef3a071837acd1834a0d1dcebeed94da7322282', '[\"*\"]', '2025-12-21 16:02:15', NULL, '2025-12-21 15:48:23', '2025-12-21 16:02:15'),
(2382, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4650399617b52c5d6e1bb0e58ed0c52ed223ed8792d52a2c5d6562f4227419e0', '[\"*\"]', '2025-12-21 16:16:02', NULL, '2025-12-21 16:03:31', '2025-12-21 16:16:02'),
(2383, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e68584d5dc08119f8732626e565b5ea5f35bb547806ba785bcebe193d7604b93', '[\"*\"]', '2025-12-22 07:49:33', NULL, '2025-12-22 07:49:17', '2025-12-22 07:49:33'),
(2384, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'ed30730b18ee318e6b65565cea63af63982e8818bce2e8cff2c888c456520679', '[\"*\"]', '2025-12-22 08:25:06', NULL, '2025-12-22 08:07:42', '2025-12-22 08:25:06'),
(2385, 'App\\Models\\User', 1, 'api-token', '9bc05a5703b6bc2176e796779add61c3b87e16fdb64d38fe45deade113e95165', '[\"*\"]', NULL, NULL, '2025-12-22 08:22:07', '2025-12-22 08:22:07'),
(2386, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'daef27d7be22824a8455ca9ea605577e92e94501704cc602945eb0a231852d1e', '[\"*\"]', NULL, NULL, '2025-12-22 08:22:17', '2025-12-22 08:22:17'),
(2387, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e34989888a21ddc46d06ff20da1dfb4cbe46b8db679c3f34f6cdcf6a4cdfc936', '[\"*\"]', NULL, NULL, '2025-12-22 08:22:26', '2025-12-22 08:22:26'),
(2388, 'App\\Models\\User', 1, 'api-token', '4a19f43dd61603fb37640106856df5bc187ada54c2071061f97b2780475a0be5', '[\"*\"]', NULL, NULL, '2025-12-22 08:22:54', '2025-12-22 08:22:54'),
(2389, 'App\\Models\\User', 1, 'api-token', '0fb421bd80a3fad329470a373e18dbaba5922c8d0ceeddd3d0eec8b034b3989e', '[\"*\"]', '2025-12-22 11:13:16', NULL, '2025-12-22 08:23:04', '2025-12-22 11:13:16'),
(2390, 'App\\Models\\User', 1, 'api-token', '67dbf13cb3460eddb7555b319de4b39980fb86ef13e9cbe9f094c47da7e2d0ef', '[\"*\"]', '2025-12-22 08:30:34', NULL, '2025-12-22 08:29:28', '2025-12-22 08:30:34'),
(2391, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '67cb7ed6d0e4e5adc5f633921c93542e1b77276728f76f39a8209474f824a593', '[\"*\"]', '2025-12-22 09:04:28', NULL, '2025-12-22 08:31:59', '2025-12-22 09:04:28'),
(2392, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e99f6ba052d047a448ac42a94d39a4dc0634913e9f3ceaa0cf6f9eb74e0ba110', '[\"*\"]', '2025-12-22 09:06:26', NULL, '2025-12-22 09:06:17', '2025-12-22 09:06:26'),
(2393, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '393fa3716311dbd6c9a0e5428db539f0cea9bfaf744b32934dd8b48888ac08cc', '[\"*\"]', '2025-12-22 09:15:27', NULL, '2025-12-22 09:14:45', '2025-12-22 09:15:27'),
(2394, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '99ccc46772dd3b4987feee2a15ce658abfd965be1316315ff17eb834311abe3e', '[\"*\"]', '2025-12-22 09:19:18', NULL, '2025-12-22 09:17:08', '2025-12-22 09:19:18'),
(2395, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'e36c7c549667dd76599bb362c019138e4297e66ca1dc04485bc8cb5e8e888a10', '[\"*\"]', '2025-12-22 09:28:27', NULL, '2025-12-22 09:24:48', '2025-12-22 09:28:27'),
(2396, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '93dbb93808b6e63754f8c321dd1e782c1d0fbf9a707db70876a4da764054a644', '[\"*\"]', '2025-12-22 09:29:13', NULL, '2025-12-22 09:29:04', '2025-12-22 09:29:13'),
(2397, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '87dd987cc6a4af438bf5fce2115b0171c851a3c64f9c9a3ec72fc98c225bda19', '[\"*\"]', '2025-12-22 09:33:53', NULL, '2025-12-22 09:33:36', '2025-12-22 09:33:53'),
(2398, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '4ed95a32f1738dfc53681c7853a2009100a77e7516e4f76f6df84434ee4479ca', '[\"*\"]', '2025-12-22 09:37:26', NULL, '2025-12-22 09:37:00', '2025-12-22 09:37:26'),
(2399, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'eae489d830d12d34f426713f70bcd2f6fe49a4c4d2259dc09ac9aaa3b33ee1c4', '[\"*\"]', '2025-12-22 09:37:54', NULL, '2025-12-22 09:37:42', '2025-12-22 09:37:54'),
(2400, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '279946a077b375812e4688dbd40ce7820c58994237e35405231ff9e5f6d12374', '[\"*\"]', '2025-12-22 09:38:44', NULL, '2025-12-22 09:38:20', '2025-12-22 09:38:44'),
(2401, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'dcef168b32697fafa63fecf03f06d700e98c03b14145d7ec138919f817d2f6e3', '[\"*\"]', '2025-12-22 10:00:32', NULL, '2025-12-22 09:38:58', '2025-12-22 10:00:32'),
(2402, 'App\\Models\\User', 1, 'api-token', 'ee907e157866a9dcdf418c5a23837760de577dfaf389a19eb2a19754fa28ac2a', '[\"*\"]', '2025-12-22 10:32:19', NULL, '2025-12-22 10:01:02', '2025-12-22 10:32:19'),
(2403, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '72af1e0d4349c2accd328a80fb2f4eca063e7f94c808c8a7b269dd68ff336c91', '[\"*\"]', '2025-12-22 10:35:32', NULL, '2025-12-22 10:35:22', '2025-12-22 10:35:32'),
(2404, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'd630ba7e6076f256abd26cb0b6cb68b626617720db18d6a13bad945465bed33e', '[\"*\"]', NULL, NULL, '2025-12-22 10:37:06', '2025-12-22 10:37:06'),
(2405, 'App\\Models\\User', 1, 'api-token', 'bd662b91451f6c5a7fcdeef063d1a71307f5b65d97ab04b6e02fe3b402cb152c', '[\"*\"]', '2025-12-22 10:43:49', NULL, '2025-12-22 10:40:27', '2025-12-22 10:43:49'),
(2406, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'de8c16158905ff58faaba36e63f89190390a6c9a0016978107b52a62cd80c318', '[\"*\"]', '2025-12-22 10:46:35', NULL, '2025-12-22 10:44:23', '2025-12-22 10:46:35'),
(2409, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '634cce8ab5f16713c7038eaf8c8f4d6fa60182fe30b592b236c508179fc8b6e3', '[\"*\"]', '2025-12-22 14:11:36', NULL, '2025-12-22 13:39:14', '2025-12-22 14:11:36'),
(2415, 'App\\Models\\User', 1, 'api-token', '5896814d682be4074f79e0486f442ae94be0b52a8321a381d4337cd30d3d1351', '[\"*\"]', '2025-12-22 13:56:17', NULL, '2025-12-22 13:55:04', '2025-12-22 13:56:17'),
(2416, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '2df452795b625b329307225773c987199788271cfb6eb4c342affb1a5148c069', '[\"*\"]', '2025-12-22 13:58:42', NULL, '2025-12-22 13:55:15', '2025-12-22 13:58:42'),
(2417, 'App\\Models\\User', 1, 'api-token', '45f5ac48f91bd2ebd329f19d3f27ce9b48b1690baf2f90d24075718608166d1a', '[\"*\"]', '2025-12-22 16:00:45', NULL, '2025-12-22 14:16:32', '2025-12-22 16:00:45'),
(2418, 'App\\Models\\User', 1, 'api-token', '2ec7c737556981348678befea3315126bf33ec7a29ae1c3929d887663a1d2bd3', '[\"*\"]', '2025-12-22 15:30:35', NULL, '2025-12-22 14:46:29', '2025-12-22 15:30:35'),
(2421, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'd72505282fc84b09c354a6a00da0d6fdb7229c26f12582c0d4ac7d1584a9b392', '[\"*\"]', '2025-12-23 09:56:31', NULL, '2025-12-23 09:56:27', '2025-12-23 09:56:31'),
(2423, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '67f9771c11450ccfd437ef3825a6f0034cc633c503df53e2eaa36e7f31c4a688', '[\"*\"]', '2025-12-23 10:31:48', NULL, '2025-12-23 10:31:22', '2025-12-23 10:31:48'),
(2424, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '638a64f28ae8aef74bb9ad86185265f65e0416faf8a1931a84733957d91a887d', '[\"*\"]', '2025-12-23 10:32:07', NULL, '2025-12-23 10:31:57', '2025-12-23 10:32:07'),
(2426, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '38969c2719aaa4d0a647924c5b2385732afdb8886687d6d5958f369295cdf894', '[\"*\"]', '2025-12-23 10:38:41', NULL, '2025-12-23 10:33:10', '2025-12-23 10:38:41'),
(2427, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '5420f07a89d0e9a72e74a06bca0a145953b6953c0211ad50bf5659cc29b6f8c8', '[\"*\"]', '2025-12-23 10:35:14', NULL, '2025-12-23 10:34:52', '2025-12-23 10:35:14'),
(2430, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', '9d94a8e899b7a5035c27a283809c224b8e1e12cfff84f3259d314a073bc02500', '[\"*\"]', '2025-12-23 10:41:11', NULL, '2025-12-23 10:40:45', '2025-12-23 10:41:11'),
(2436, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '47fe1e74648a2c65152a7444273f375fff8eaf8e0d46b32076429ae0cc5e4c56', '[\"*\"]', '2025-12-23 11:52:04', NULL, '2025-12-23 11:50:11', '2025-12-23 11:52:04'),
(2437, 'Modules\\Restaurant\\Entities\\Restaurant', 7, 'restaurant-api-token', 'dd08fb76c6a883e85054c09622fd987ef274ddd37d3fe2568e440ab454068ff0', '[\"*\"]', '2025-12-23 11:59:11', NULL, '2025-12-23 11:58:58', '2025-12-23 11:59:11'),
(2441, 'App\\Models\\User', 1, 'api-token', 'bd07552367f9eee86cc9d58e763941aeb2314f6fa126d4d5dee2de78ed312286', '[\"*\"]', '2025-12-23 13:56:40', NULL, '2025-12-23 13:53:34', '2025-12-23 13:56:40'),
(2442, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '4b42788ddedbde8045f0145b8dbc5ae4ae2af226beaefafb4929bc6882068bc5', '[\"*\"]', '2025-12-23 13:57:36', NULL, '2025-12-23 13:54:04', '2025-12-23 13:57:36'),
(2443, 'App\\Models\\User', 1, 'api-token', 'b054b7da3ac8aa7fcb2db7ffa78453047e5dda594603bba1308b574496f036f0', '[\"*\"]', '2026-01-09 03:42:33', NULL, '2025-12-23 19:22:21', '2026-01-09 03:42:33'),
(2444, 'App\\Models\\User', 1, 'api-token', '77ed9925bc248bc4d8a6081f30fdc13a58f48a02999980327f93b45676dc9b3a', '[\"*\"]', '2025-12-24 07:34:29', NULL, '2025-12-24 07:32:21', '2025-12-24 07:34:29'),
(2445, 'App\\Models\\User', 1, 'api-token', '8839373e5f749a816089f0cbd7836ede46b469f16c7aeacbcffeb340a756b100', '[\"*\"]', '2025-12-24 19:08:57', NULL, '2025-12-24 19:08:15', '2025-12-24 19:08:57'),
(2447, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6dcb114e86efbeeec3b7f11a2662e414a980c2eebbda2577d4a4c5658d546261', '[\"*\"]', '2025-12-26 02:40:20', NULL, '2025-12-26 02:39:22', '2025-12-26 02:40:20'),
(2448, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '6debeae8a186256509b107aae191251b61220a6fa8fb79ecf27da868b517f52f', '[\"*\"]', '2025-12-26 02:45:45', NULL, '2025-12-26 02:42:48', '2025-12-26 02:45:45'),
(2449, 'App\\Models\\User', 1, 'api-token', 'd87730c212c1e5f0f2497a3d3faedd9a039c4ee83c15fc84101750e1c7624df6', '[\"*\"]', '2025-12-27 07:51:51', NULL, '2025-12-27 07:47:29', '2025-12-27 07:51:51'),
(2451, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '895b1c9dbc23dea8f89cd56ad33b55be3780ee114a6ef63a314527a666d86b32', '[\"*\"]', '2025-12-27 21:48:30', NULL, '2025-12-27 21:47:45', '2025-12-27 21:48:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2452, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '7f959d5d5bb5a5569fd99a9e4447ad81bd6fedf0edd47cb9c16795f1bf98893f', '[\"*\"]', '2025-12-27 21:50:37', NULL, '2025-12-27 21:50:06', '2025-12-27 21:50:37'),
(2453, 'App\\Models\\User', 1, 'api-token', '65850af8df1ad7e0578928f324cf30b3be70fb6c65111b4c1a815a9ab5fe6d33', '[\"*\"]', '2025-12-28 09:25:11', NULL, '2025-12-27 22:17:59', '2025-12-28 09:25:11'),
(2455, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '327ef445541fc573fbe4560fa652ff610e58d27cbd2c00eeb12686a079a2ef1a', '[\"*\"]', '2025-12-28 16:56:17', NULL, '2025-12-27 23:38:52', '2025-12-28 16:56:17'),
(2456, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '6fa8c89935ac2277b80a9aedec4ecb5d64428f4fb73002267fa0093f628f6cb1', '[\"*\"]', '2025-12-27 23:41:25', NULL, '2025-12-27 23:40:50', '2025-12-27 23:41:25'),
(2457, 'App\\Models\\User', 1, 'api-token', 'c0ca2d9c4758462bc98a2e34a220fb4917424315fd6884335c6aed575677cc7b', '[\"*\"]', '2026-01-01 18:57:10', NULL, '2025-12-27 23:44:35', '2026-01-01 18:57:10'),
(2458, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '23317af6e86f21d8c65aa22917e8b8f5bfbdb15e291d7dd8dd9e5494b98f8dbf', '[\"*\"]', '2025-12-28 08:10:02', NULL, '2025-12-28 08:02:10', '2025-12-28 08:10:02'),
(2463, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '08b27f7e7f46ad98a6e614a0254f4a06f3c77173dfbd6869a07c5f659c6697e9', '[\"*\"]', '2026-01-12 09:12:53', NULL, '2025-12-28 10:46:47', '2026-01-12 09:12:53'),
(2464, 'App\\Models\\User', 1, 'api-token', '0aac42c77fd278c00f4922258e5e8f3f731ed6d84d6f0eb227c4877aa1c5efb0', '[\"*\"]', NULL, NULL, '2025-12-28 15:52:35', '2025-12-28 15:52:35'),
(2465, 'App\\Models\\User', 1, 'api-token', '27dd0a5a1ae63bfba35e016b9a7d5f883279160e0619e10b256e7c9c1e3a131e', '[\"*\"]', NULL, NULL, '2025-12-28 15:53:52', '2025-12-28 15:53:52'),
(2466, 'App\\Models\\User', 1, 'api-token', '66e245a106c7b5310ae046d30ebe3404ea4f5c56e4d476920d146f1d977ed9d0', '[\"*\"]', '2025-12-28 21:27:57', NULL, '2025-12-28 21:24:50', '2025-12-28 21:27:57'),
(2468, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a00d5cb4044f2511d9d28d95128946ef3d243482afa789f54265b3545b46a7f5', '[\"*\"]', '2025-12-28 22:28:04', NULL, '2025-12-28 21:38:27', '2025-12-28 22:28:04'),
(2469, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '8937e96eda9ec5051bc27e91eea9ba1dab55d3814a6b0f0686abf1b0a679be0c', '[\"*\"]', '2025-12-28 22:27:48', NULL, '2025-12-28 22:27:02', '2025-12-28 22:27:48'),
(2471, 'App\\Models\\User', 1, 'api-token', '21f69fc320c391d137a80f3c65d770e818263b3a7f65382e8e0800a0345e11dd', '[\"*\"]', '2025-12-29 22:54:25', NULL, '2025-12-29 22:53:31', '2025-12-29 22:54:25'),
(2473, 'App\\Models\\User', 1, 'api-token', '037e10e638bff0dbf20358a81b949ca3a52cec032449eaadec1c9c1bb1342fc3', '[\"*\"]', '2025-12-30 17:34:57', NULL, '2025-12-30 17:33:28', '2025-12-30 17:34:57'),
(2474, 'App\\Models\\User', 1, 'api-token', 'd389aee8cb3cde521f2416c122e2419277575c6cb960aa895888f324bbe3408f', '[\"*\"]', '2026-01-03 19:15:01', NULL, '2026-01-03 19:13:05', '2026-01-03 19:15:01'),
(2475, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '7592d917b93881d880d224b621d61f04e4327b4855017d73972b31238774e4ee', '[\"*\"]', '2026-01-08 03:28:01', NULL, '2026-01-05 09:13:48', '2026-01-08 03:28:01'),
(2477, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '04e21e1aeb97c5e5ec36c59aeb4c22f5fe68fe7d9f1d909298d721ce0b6c6b62', '[\"*\"]', '2026-01-05 09:18:48', NULL, '2026-01-05 09:18:47', '2026-01-05 09:18:48'),
(2479, 'App\\Models\\User', 1, 'api-token', '402e8c04ae5f0a4f98461ae75ec680303cca5736b92fd4e2c92eca5ed625918b', '[\"*\"]', '2026-01-05 15:01:22', NULL, '2026-01-05 14:35:51', '2026-01-05 15:01:22'),
(2480, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'c251f762f66933e14047f7db670305188f5e50178ab80f40d5841ad2ec928713', '[\"*\"]', '2026-01-05 20:38:45', NULL, '2026-01-05 20:36:57', '2026-01-05 20:38:45'),
(2482, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '04b62a02ce2e291bc06215b81cea16fcc9c0a6e4d7b4e47048c556ab1c2de22e', '[\"*\"]', '2026-01-07 03:34:27', NULL, '2026-01-07 03:32:04', '2026-01-07 03:34:27'),
(2483, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f5b960650620b1181fb7d0d82b485ba5f0e0ecb5d9b65535ebbf03b61fce0abf', '[\"*\"]', '2026-01-07 08:01:03', NULL, '2026-01-07 07:57:38', '2026-01-07 08:01:03'),
(2486, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '2825ce06d9ed86dbfa1e78d27003fa91f25c30c4ab70355719d4611496c10887', '[\"*\"]', '2026-01-08 03:27:22', NULL, '2026-01-08 03:26:56', '2026-01-08 03:27:22'),
(2487, 'App\\Models\\User', 1, 'api-token', 'e1e4b6b9e012e30f58deb51a8b8ce44cd8679d7b540deabbe574d145f2706c82', '[\"*\"]', '2026-01-09 03:50:25', NULL, '2026-01-09 03:49:11', '2026-01-09 03:50:25'),
(2488, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '5cc98be9a14f44222010c4bef7a464d66a14e8f3f97e05bd8d00f9a6973809f3', '[\"*\"]', '2026-01-12 04:17:20', NULL, '2026-01-12 04:17:19', '2026-01-12 04:17:20'),
(2490, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '3577a96689f42fbc0ff9f8f23bd327a65e1847925061ed53ca9ece844823ed2b', '[\"*\"]', '2026-01-12 04:22:25', NULL, '2026-01-12 04:21:13', '2026-01-12 04:22:25'),
(2491, 'App\\Models\\User', 1, 'api-token', '4d6fcf855e0b1f059147c66aa94d80935e6acb797d726f441202b312f8e5cd1c', '[\"*\"]', NULL, NULL, '2026-01-12 09:35:14', '2026-01-12 09:35:14'),
(2493, 'App\\Models\\User', 1, 'api-token', '99afd0fd3e9ef046625ecd0bec31e41ae03e71e4b68a51372bdaf3d590187adb', '[\"*\"]', '2026-01-18 18:38:34', NULL, '2026-01-18 17:51:16', '2026-01-18 18:38:34'),
(2494, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '64795946a9f50aee82c365c553b9ff5ce156ffc7dcb083557963a3c137ace00e', '[\"*\"]', '2026-01-22 13:10:31', NULL, '2026-01-22 13:09:27', '2026-01-22 13:10:31'),
(2495, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'a10b56353c1ef7c5cb0dfa8212b5d7beb1d1eb14d287f0fbe62d523632e3e3bd', '[\"*\"]', '2026-01-22 17:53:18', NULL, '2026-01-22 17:25:42', '2026-01-22 17:53:18'),
(2496, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', 'f3d62aacc4920ff3709d828f18e3adc4f448715e8f6d11ff814f1e97b6df5b74', '[\"*\"]', '2026-01-22 21:44:35', NULL, '2026-01-22 21:44:33', '2026-01-22 21:44:35'),
(2497, 'App\\Models\\User', 1, 'api-token', '552814fb8dbdc522c27d8112741617126c74362d373f53a339d3d63e4ad1f174', '[\"*\"]', '2026-01-22 22:35:40', NULL, '2026-01-22 21:45:16', '2026-01-22 22:35:40'),
(2500, 'App\\Models\\User', 1, 'api-token', '2d8d65e2af471c0df60a7798a90c0689cdca481fa6aa33466b4282f4714fb9b0', '[\"*\"]', '2026-01-23 06:48:31', NULL, '2026-01-23 06:48:28', '2026-01-23 06:48:31'),
(2504, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '4121b3d6fb8c7cd76b0f4873c4b2c41c38c221d6db4bdbbdd066ad48058b287b', '[\"*\"]', '2026-01-24 09:12:22', NULL, '2026-01-24 09:10:16', '2026-01-24 09:12:22'),
(2505, 'App\\Models\\User', 1, 'api-token', 'bcf5b05de004585f3d0289e8fe4b3dc2adc0c60c89f5a1347b007bf767e76b9b', '[\"*\"]', '2026-01-24 09:14:46', NULL, '2026-01-24 09:11:24', '2026-01-24 09:14:46'),
(2506, 'App\\Models\\User', 1, 'api-token', '83a878fa8b2736ba4459000af6820bf4e2d023d5f3935087cdb95c5b5049e45b', '[\"*\"]', '2026-01-24 16:53:58', NULL, '2026-01-24 16:53:39', '2026-01-24 16:53:58'),
(2512, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '107c1d88f3fc771515e38a23a37a9c9b93e3defdb1e24136116eaf5718c8e200', '[\"*\"]', '2026-01-24 17:12:11', NULL, '2026-01-24 17:11:45', '2026-01-24 17:12:11'),
(2513, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '668a84ce1c0bd2b0f094caf943d522ff90831c0155e0ee7d41a795181a6bc555', '[\"*\"]', '2026-01-24 17:29:21', NULL, '2026-01-24 17:29:20', '2026-01-24 17:29:21'),
(2517, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'e3c73a088d34ca9521a47f94f58189fecc7661f7f7baed230f64be30774cb94a', '[\"*\"]', '2026-01-24 17:36:01', NULL, '2026-01-24 17:35:59', '2026-01-24 17:36:01'),
(2518, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '28b3fe0eb2b0136716ba8423e2c135eaee63baf30bd80724609f4d62f2a5724c', '[\"*\"]', '2026-01-28 23:07:54', NULL, '2026-01-28 23:07:43', '2026-01-28 23:07:54'),
(2519, 'App\\Models\\User', 1, 'api-token', '841d2cf8aa9ce0d5bd5b75f41d81a3850f49fb1dafc5ad1d50ec86e4f0e9d4a8', '[\"*\"]', '2026-01-28 23:08:47', NULL, '2026-01-28 23:08:22', '2026-01-28 23:08:47'),
(2520, 'App\\Models\\User', 1, 'api-token', '1e6d798a9640b56158ea5cadf9d7d016ae48b2b967c20eab2300152ae9cb75eb', '[\"*\"]', NULL, NULL, '2026-02-06 23:00:47', '2026-02-06 23:00:47'),
(2521, 'App\\Models\\User', 1, 'api-token', '791c82eca40610166310caeeae6f475ac7fd54d9ffa50eb07b21e34c0bbf0abe', '[\"*\"]', NULL, NULL, '2026-02-12 14:09:50', '2026-02-12 14:09:50'),
(2522, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', 'b56c31a97bbdaaac020b5ef9da19eede3871418fe72b713b0ff7f5ff73d4b0b2', '[\"*\"]', NULL, NULL, '2026-02-13 20:40:46', '2026-02-13 20:40:46'),
(2523, 'App\\Models\\User', 1, 'api-token', '557875856680914ba518e9b778a06b0b9e893bdd4df5a972dc0dcb28111d8a0d', '[\"*\"]', NULL, NULL, '2026-02-13 20:41:30', '2026-02-13 20:41:30'),
(2524, 'App\\Models\\User', 1, 'api-token', '229f34bd59cdbec269ae36cb479dc02ba6700af9480d09215b687f3976007f05', '[\"*\"]', NULL, NULL, '2026-02-15 05:25:25', '2026-02-15 05:25:25'),
(2525, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '33bfa94f69d9b780fe88414cb8d5bb755f135ce49eebb727e6e4d932cb79ef25', '[\"*\"]', NULL, NULL, '2026-02-15 05:30:19', '2026-02-15 05:30:19'),
(2526, 'Modules\\Restaurant\\Entities\\Restaurant', 1, 'restaurant-api-token', '75826e7f31bbec988dc2a05de69241f89ff14453efe7e39c6a1d5c2f8f71cd44', '[\"*\"]', NULL, NULL, '2026-02-15 05:34:46', '2026-02-15 05:34:46'),
(2527, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '8cf9421cec51d25783138e5373f676535cf1efcc7e55b20745e1e36d1d7a34ac', '[\"*\"]', NULL, NULL, '2026-02-15 05:36:58', '2026-02-15 05:36:58'),
(2528, 'App\\Models\\DeliveryMan', 2, 'deliveryman-api-token', '84eeee06003d6386899621c4ca1b54e4504fc9eb78f8c6be5d257f2d62b0f340', '[\"*\"]', NULL, NULL, '2026-02-15 09:20:28', '2026-02-15 09:20:28'),
(2529, 'App\\Models\\User', 1, 'api-token', 'f832f860afeacd9a583cce9c3f39bccc79dff250f8690ad358446a291024f936', '[\"*\"]', NULL, NULL, '2026-02-15 09:26:07', '2026-02-15 09:26:07'),
(2530, 'App\\Models\\User', 1, 'api-token', 'd0a2b7c307c994afa8b1919d69897d4386618bc71bea00b849b7b2ffbfc54465', '[\"*\"]', NULL, NULL, '2026-02-15 09:29:48', '2026-02-15 09:29:48'),
(2531, 'App\\Models\\User', 1, 'api-token', 'b4f7424cc961d7048b803b087dc61a0a80635d71f77e4686af5c74d9aebc8392', '[\"*\"]', NULL, NULL, '2026-02-15 23:02:51', '2026-02-15 23:02:51'),
(2532, 'App\\Models\\User', 1, 'api-token', '5f6222d7b50added7ce70bb8ec367108fcbc822e4721def2ece809fee0aad828', '[\"*\"]', NULL, NULL, '2026-02-16 01:13:44', '2026-02-16 01:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `lang_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'en', '<h4>1. What are Privacy Policy?</h4>\r\n<p>Foodigo collects various types of information from users, which may include personal details (such as name, contact information, and payment details), device-related data (such as IP address and browser type), and usage information (such as pages visited and actions taken within the platform). Users have the right to access and update their personal information held by Foodigo. This section explains how users can do so and the procedures for making such requests.</p>\r\n<h4>2. Foodigo Privacy Policy Examples</h4>\r\n<p>Foodigo expects users to conduct themselves responsibly and respectfully while using our platform. This includes refraining from any behavior that may harm or disrupt the experience of other users or violate any laws or regulations. Users are prohibited from engaging in activities such as harassing, intimidating, or defaming others, as well as attempting to access unauthorized areas of the platform or interfering with its operation. Additionally, users must not use Foodigo for any unlawful</p>\r\n<h4>Features</h4>\r\n<ul>\r\n<li>User Registration and Authentication:</li>\r\n<li>Restaurant Listings and Profiles:</li>\r\n<li>Menu Display and Customization:</li>\r\n<li>Order Placement and Checkout:</li>\r\n<li>Multiple Ordering Channels:</li>\r\n<li>Real-Time Order Tracking:</li>\r\n<li>Payment Gateway</li>\r\n</ul>\r\n<h4>3. Protect Your Property</h4>\r\n<p>Protecting your property is paramount, and we take this responsibility seriously. Our platform employs robust security measures to safeguard your personal information, payment details, and any other data you entrust to us. Through encryption protocols, firewalls, and regular security audits, we strive to prevent unauthorized access, alteration, or disclosure of your information. Additionally, we continuously monitor our systems for any potential threats or vulnerabilities, promptly addressing any issues that may arise. Rest assured that your privacy and security are our top priorities, and we remain committed to maintaining the highest standards of protection for your property.\"</p>\r\n<h4>4. What to Include in Terms and Conditions for Online Stores</h4>\r\n<p>By accessing our website and making purchases, you agree to comply with the following terms and conditions. User accounts are created subject to registration requirements, password protection, and the right to terminate accounts at our discretion. Product listings on our website include accurate descriptions, pricing, and availability details, though we reserve the right to modify or discontinue products without notice. Orders are processed upon confirmation, with payment accepted via approved methods and subject to applicable taxes and fees. Shipping and delivery terms, including estimated times and costs, are outlined in our policies.</p>\r\n<h4>5.Pricing and Payment Terms</h4>\r\n<p>Pricing and Payment Terms are essential components of our service. By utilizing our platform, you agree to the prices listed for products and services, including any applicable taxes or fees. We strive to maintain accurate pricing information, but reserve the right to adjust prices at our discretion. Payments are processed securely through approved methods, such as credit/debit cards, digital wallets, or other designated payment gateways. By providing payment information, you authorize us to charge the designated amount for your purchases.</p>', NULL, '2025-04-29 20:50:14'),
(13, 'bn', '<p>১. গোপনীয়তা নীতি কী?</p>\r\n<p>Foodigo ব্যবহারকারীদের কাছ থেকে বিভিন্ন ধরণের তথ্য সংগ্রহ করে, যার মধ্যে ব্যক্তিগত বিবরণ (যেমন নাম, যোগাযোগের তথ্য এবং অর্থপ্রদানের বিবরণ), ডিভাইস-সম্পর্কিত ডেটা (যেমন IP ঠিকানা এবং ব্রাউজারের ধরণ), এবং ব্যবহারের তথ্য (যেমন পরিদর্শন করা পৃষ্ঠা এবং প্ল্যাটফর্মের মধ্যে নেওয়া পদক্ষেপ) অন্তর্ভুক্ত থাকতে পারে। ব্যবহারকারীদের Foodigo-এর কাছে থাকা তাদের ব্যক্তিগত তথ্য অ্যাক্সেস এবং আপডেট করার অধিকার রয়েছে। এই বিভাগটি ব্যবহারকারীরা কীভাবে এটি করতে পারেন এবং এই ধরনের অনুরোধ করার পদ্ধতিগুলি ব্যাখ্যা করে।</p>\r\n<p>২. Foodigo গোপনীয়তা নীতির উদাহরণ</p>\r\n<p>Foodigo আশা করে যে ব্যবহারকারীরা আমাদের প্ল্যাটফর্ম ব্যবহার করার সময় দায়িত্বশীলতা এবং শ্রদ্ধার সাথে আচরণ করবেন। এর মধ্যে এমন কোনও আচরণ থেকে বিরত থাকা অন্তর্ভুক্ত যা অন্যান্য ব্যবহারকারীদের অভিজ্ঞতার ক্ষতি করতে পারে বা ব্যাহত করতে পারে বা কোনও আইন বা নিয়ম লঙ্ঘন করতে পারে। ব্যবহারকারীদের হয়রানি, ভয় দেখানো বা মানহানির মতো কার্যকলাপে জড়িত হওয়া, সেইসাথে প্ল্যাটফর্মের অননুমোদিত এলাকায় অ্যাক্সেস করার চেষ্টা করা বা এর কার্যক্রমে হস্তক্ষেপ করা নিষিদ্ধ। অতিরিক্তভাবে, ব্যবহারকারীদের কোনও অবৈধ কাজের জন্য Foodigo ব্যবহার করা উচিত নয়</p>\r\n<p>বৈশিষ্ট্য<br>ব্যবহারকারী নিবন্ধন এবং প্রমাণীকরণ:</p>\r\n<p>রেস্তোরাঁর তালিকা এবং প্রোফাইল:</p>\r\n<p>মেনু প্রদর্শন এবং কাস্টমাইজেশন:</p>\r\n<p>অর্ডার প্লেসমেন্ট এবং চেকআউট:</p>\r\n<p>একাধিক অর্ডারিং চ্যানেল:</p>\r\n<p>রিয়েল-টাইম অর্ডার ট্র্যাকিং:</p>\r\n<p>পেমেন্ট গেটওয়ে</p>\r\n<p>৩. আপনার সম্পত্তি রক্ষা করুন</p>\r\n<p>আপনার সম্পত্তি রক্ষা করা অত্যন্ত গুরুত্বপূর্ণ এবং আমরা এই দায়িত্বটি গুরুত্ব সহকারে নিই। আমাদের প্ল্যাটফর্ম আপনার ব্যক্তিগত তথ্য, অর্থপ্রদানের বিবরণ এবং আমাদের উপর আপনার আস্থা রাখা অন্য যেকোনো ডেটা সুরক্ষিত রাখার জন্য শক্তিশালী নিরাপত্তা ব্যবস্থা ব্যবহার করে। এনক্রিপশন প্রোটোকল, ফায়ারওয়াল এবং নিয়মিত নিরাপত্তা নিরীক্ষার মাধ্যমে, আমরা আপনার তথ্যের অননুমোদিত অ্যাক্সেস, পরিবর্তন বা প্রকাশ রোধ করার চেষ্টা করি। অতিরিক্তভাবে, আমরা যেকোনো সম্ভাব্য হুমকি বা দুর্বলতার জন্য আমাদের সিস্টেমগুলিকে ক্রমাগত পর্যবেক্ষণ করি, উদ্ভূত যেকোনো সমস্যা তাৎক্ষণিকভাবে সমাধান করি। \"নিশ্চিত থাকুন যে আপনার গোপনীয়তা এবং সুরক্ষা আমাদের সর্বোচ্চ অগ্রাধিকার, এবং আমরা আপনার সম্পত্তির সুরক্ষার সর্বোচ্চ মান বজায় রাখতে প্রতিশ্রুতিবদ্ধ।\"</p>\r\n<p>৪. অনলাইন স্টোরের জন্য শর্তাবলীতে কী অন্তর্ভুক্ত করবেন</p>\r\n<p>আমাদের ওয়েবসাইট অ্যাক্সেস করে এবং কেনাকাটা করে, আপনি নিম্নলিখিত শর্তাবলী মেনে চলতে সম্মত হন। ব্যবহারকারীর অ্যাকাউন্টগুলি নিবন্ধনের প্রয়োজনীয়তা, পাসওয়ার্ড সুরক্ষা এবং আমাদের বিবেচনার ভিত্তিতে অ্যাকাউন্ট বন্ধ করার অধিকার সাপেক্ষে তৈরি করা হয়। আমাদের ওয়েবসাইটে পণ্য তালিকাগুলিতে সঠিক বিবরণ, মূল্য নির্ধারণ এবং প্রাপ্যতার বিবরণ অন্তর্ভুক্ত রয়েছে, যদিও আমরা নোটিশ ছাড়াই পণ্যগুলি পরিবর্তন বা বন্ধ করার অধিকার সংরক্ষণ করি। অর্ডারগুলি নিশ্চিতকরণের পরে প্রক্রিয়া করা হয়, অনুমোদিত পদ্ধতির মাধ্যমে অর্থ প্রদান গৃহীত হয় এবং প্রযোজ্য কর এবং ফি সাপেক্ষে। আনুমানিক সময় এবং খরচ সহ শিপিং এবং ডেলিভারি শর্তাবলী আমাদের নীতিতে বর্ণিত আছে।</p>\r\n<p>৫. মূল্য নির্ধারণ এবং অর্থ প্রদানের শর্তাবলী</p>\r\n<p>মূল্য নির্ধারণ এবং অর্থ প্রদানের শর্তাবলী আমাদের পরিষেবার অপরিহার্য উপাদান। আমাদের প্ল্যাটফর্ম ব্যবহার করে, আপনি পণ্য এবং পরিষেবার জন্য তালিকাভুক্ত দামের সাথে সম্মত হন, যার মধ্যে প্রযোজ্য কর বা ফি অন্তর্ভুক্ত। আমরা সঠিক মূল্য নির্ধারণের তথ্য বজায় রাখার চেষ্টা করি, তবে আমাদের বিবেচনার ভিত্তিতে মূল্য সমন্বয় করার অধিকার সংরক্ষণ করি। ক্রেডিট/ডেবিট কার্ড, ডিজিটাল ওয়ালেট, অথবা এর মতো অনুমোদিত পদ্ধতির মাধ্যমে অর্থ প্রদান নিরাপদে প্রক্রিয়া করা হয়। অন্যান্য মনোনীত পেমেন্ট গেটওয়ে। পেমেন্ট তথ্য প্রদান করে, আপনি আমাদের আপনার ক্রয়ের জন্য নির্ধারিত পরিমাণ চার্জ করার অনুমতি দিচ্ছেন।</p>', '2025-04-29 03:55:32', '2025-12-09 00:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `offer_price` double NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `slug`, `image`, `category_id`, `restaurant_id`, `price`, `offer_price`, `status`, `addon_items`, `created_at`, `updated_at`, `is_featured`) VALUES
(13, 'pounded-yam-egusi-soup-goat-meat', 'uploads/custom-images/whirlwind-culinary-concction-2025-03-13-09-36-30-7611.webp', 10, 4, 4500, 4200, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(14, 'double-sausage-chicken-shawarma', 'uploads/custom-images/white-cream-on-hog-dog-2025-03-13-09-38-31-4280.webp', 2, 4, 3200, 2900, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(15, 'amala-ewedu-gbegiri-abula-special', 'uploads/custom-images/colorful-hot-pizza-2025-03-13-09-39-38-6451.webp', 10, 4, 3800, 3500, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(16, 'sweet-golden-puff-puff-box', 'uploads/custom-images/whirlwind-culinary-sauce-nice-2025-03-13-10-03-24-6175.webp', 4, 5, 1500, 1200, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(17, 'eba-fresh-seafood-okra-soup-crab', 'uploads/custom-images/whirlwind-culinary-concction-2025-03-13-10-05-05-8103.webp', 10, 5, 5200, 4800, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(18, 'crispy-nigerian-meat-pie-2pcs', 'uploads/custom-images/hot-pizza-2025-03-13-10-06-17-1113.webp', 3, 5, 1800, 1500, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(22, 'gizdodo-supreme-gizzard-dodo-bowl', 'uploads/custom-images/ystic-flavor-2025-03-15-05-09-04-9079.webp', 6, 7, 3500, 3200, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(23, 'chilled-zobo-hibiscus-infusion', 'uploads/custom-images/aurora-palate-party-2025-03-15-05-10-22-8687.webp', 7, 7, 1200, 1000, 'enable', '[\"10\",\"11\",\"12\",\"13\",\"121\"]', '2025-03-13 00:05:40', '2025-10-11 22:18:07', 'enable'),
(24, 'classic-chapman-mocktail-citrus-bitters', 'uploads/custom-images/epicurean-tornado-bilas-2025-03-15-05-11-50-3284.webp', 7, 7, 2200, 1900, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(25, 'grilled-whole-catfish-point-kill', 'uploads/custom-images/whirlwind-culinary-concction-2025-03-15-05-19-55-3809.webp', 5, 8, 6000, 5500, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(26, 'hot-spicy-goat-meat-pepper-soup', 'uploads/custom-images/whirlwind-culinary-sauce-nice-2025-03-15-05-20-59-5086.webp', 10, 8, 3500, 3200, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(27, 'asun-peppered-roasted-goat-meat-bites', 'uploads/custom-images/white-cream-on-hog-dog-2025-03-15-05-22-44-1899.webp', 5, 8, 4200, 3800, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(31, 'crispy-chicken-burger-sweet-potato-fries', 'uploads/custom-images/whirlwind-culinary-concction-2025-03-15-05-19-55-3809.webp', 2, 10, 3800, 3500, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(32, 'smoky-party-jollof-rice-fried-chicken', 'uploads/custom-images/whirlwind-culinary-sauce-nice-2025-03-15-05-20-59-5086.webp', 11, 10, 3800, 3500, 'enable', '[\"1\",\"2\",\"3\",\"4\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(33, 'special-nigerian-fried-rice-prawns', 'uploads/custom-images/white-cream-on-hog-dog-2025-03-15-05-22-44-1899.webp', 11, 10, 4200, 3900, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-21 04:12:15', 'enable'),
(34, 'ofada-rice-ayamase-designer-stew', 'uploads/custom-images/peanut-butter-cookie-2026-02-07-05-45-26-7281.webp', 11, 8, 4500, 4200, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:45:26', 'enable'),
(35, 'peppered-grilled-chicken-platter', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-46-09-8578.webp', 9, 8, 3200, 2900, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:46:09', 'enable'),
(36, 'assorted-small-chops-platter', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-46-40-2264.webp', 1, 8, 2800, 2500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:46:41', 'enable'),
(38, 'spicy-beef-suya-platter-yaji-spice', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-47-14-7191.webp', 5, 8, 3000, 2700, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:47:14', 'enable'),
(40, 'village-native-rice-smoked-fish-ponmo', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-47-54-7337.webp', 11, 8, 4000, 3600, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:47:54', 'enable'),
(41, 'spicy-efo-riro-assorted-meats-semo', 'uploads/custom-images/peanut-butter-cookie-2026-02-07-05-54-14-1390.webp', 10, 10, 4500, 4200, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:54:14', 'enable'),
(42, 'pounded-yam-bitterleaf-soup-ofe-onugbu', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-55-15-1304.webp', 10, 10, 4800, 4400, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:55:15', 'enable'),
(43, 'afang-soup-stockfish-beef-pounded-yam', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-56-13-5617.webp', 10, 10, 5000, 4600, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:56:13', 'enable'),
(45, 'spicy-peppered-turkey-wings-platter', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-57-31-7301.webp', 9, 10, 4500, 4000, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:57:31', 'enable'),
(46, 'peppered-snail-plantain-combo', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-58-21-4607.webp', 6, 7, 5500, 5000, 'enable', '[\"121\",\"124\"]', '2025-03-13 00:05:40', '2026-02-07 10:58:21', 'enable'),
(47, 'fresh-coconut-milk-cake-slice', 'uploads/custom-images/white-icing-cake-in-bokeh-2026-02-07-06-00-57-8432.webp', 8, 7, 2500, 2200, 'enable', '[\"4\"]', '2025-03-13 00:05:40', '2026-02-07 11:00:58', 'enable'),
(50, 'charcoal-grilled-chicken-drumsticks', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-20-33-4194.webp', 9, 7, 3200, 2800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:20:33', 'enable'),
(51, 'stir-fried-jollof-macaroni-sausage', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-22-35-9724.webp', 12, 6, 2800, 2500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:22:35', 'enable'),
(53, 'spicy-grilled-goat-meat-kebab', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-23-06-1923.webp', 5, 6, 3800, 3500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:23:06', 'enable'),
(54, 'decadent-dark-chocolate-brownie-square', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-27-44-4351.webp', 8, 6, 2000, 1800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:27:44', 'enable'),
(55, 'crispy-stir-fried-macaroni-diced-sausage', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-15-34-8410.webp', 12, 5, 2800, 2500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:15:34', 'enable'),
(57, 'flame-grilled-quarter-chicken-yaji-spice', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-29-14-6763.jpg', 9, 5, 3200, 2800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:29:14', 'enable'),
(58, 'crunchy-chin-chin-party-jar', 'uploads/custom-images/peanut-butter-cookie-2026-02-07-04-35-41-1489.webp', 1, 5, 2000, 1800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 09:35:41', 'enable'),
(59, 'oatmeal-raisin-coconut-cookies', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-04-37-12-5207.webp', 1, 5, 1800, 1500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 09:37:12', 'enable'),
(60, 'double-chocolate-fudge-cake-slice', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-30-48-1563.webp', 8, 5, 2600, 2300, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:30:48', 'enable'),
(61, 'sweet-banana-bread-loaf-slice', 'uploads/custom-images/peanut-butter-cookie-2026-02-07-05-32-02-5539.webp', 1, 4, 1800, 1500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:32:03', 'enable'),
(62, 'gourmet-chocolate-chip-muffin', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-32-38-5173.webp', 1, 4, 1600, 1400, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:32:38', 'enable'),
(63, 'rich-red-velvet-cake-slice', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-33-22-3649.webp', 8, 4, 2500, 2200, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:33:22', 'enable'),
(64, 'indomie-relish-special-eggs-sausage', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-34-09-9466.webp', 12, 4, 2500, 2200, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:34:09', 'enable'),
(66, 'spicy-peppered-gizzard-bowl', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-34-49-7377.webp', 6, 4, 2800, 2500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:34:49', 'enable'),
(67, 'vanilla-bean-cupcake-box', 'uploads/custom-images/peanut-butter-cookie-2026-02-07-05-35-44-5416.webp', 8, 3, 2400, 2000, 'enable', '[\"20\"]', '2025-03-13 00:05:40', '2026-02-07 10:35:45', 'enable'),
(68, 'sweet-cinnamon-sugar-churro-bites', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-36-11-7141.webp', 4, 3, 1800, 1500, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:36:12', 'enable'),
(69, 'fresh-mango-passion-fruit-smoothie', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-37-38-6292.webp', 7, 3, 2000, 1800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:37:38', 'enable'),
(72, 'peppered-goat-meat-roasted-yam-platter', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-38-26-4884.webp', 5, 3, 4500, 4000, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:38:26', 'enable'),
(73, 'singapore-style-stir-fried-noodles-chicken', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-39-18-5503.webp', 12, 2, 3200, 2800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:39:18', 'enable'),
(74, 'bole-fish-roasted-plantain-grilled-fish', 'uploads/custom-images/whirlwind-culinary-concction-2025-04-29-09-26-09-8472.png', 6, 2, 3500, 3200, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2025-04-29 03:26:10', 'enable'),
(75, 'crispy-fried-chicken-wings-sweet-dodo', 'uploads/custom-images/grilled-chicken-pieces-carrots-2026-02-07-05-41-04-7020.webp', 9, 2, 3200, 2800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:41:04', 'enable'),
(76, 'fluffy-butter-pound-cake-slice', 'uploads/custom-images/oatmeal-raisin-cookie-2026-02-07-05-41-40-5516.webp', 8, 2, 2200, 1900, 'enable', '[\"10\",\"11\",\"12\",\"13\"]', '2025-03-13 00:05:40', '2026-02-07 10:41:40', 'enable'),
(77, 'chocolate-glazed-doughnuts-box-3', 'uploads/custom-images/double-chocolate-cookie-2026-02-07-05-42-26-9138.webp', 4, 2, 2000, 1800, 'enable', 'null', '2025-03-13 00:05:40', '2026-02-07 10:42:26', 'enable'),
(184, 'chinese-wok-noodles-shredded-chicken', 'uploads/custom-images/chinise-noodles-2025-10-09-05-34-43-8574.jpg', 12, 7, 3500, 3200, 'enable', '[\"121\",\"124\"]', '2025-10-08 23:34:43', '2025-10-12 21:36:48', 'enable'),
(196, 'jollof-spaghetti-meatballs-dodo', 'uploads/custom-images/fried-macaroni-and-sausage-2026-02-07-05-12-47-4917.webp', 12, 7, 3200, 2900, 'enable', '[\"121\",\"124\"]', '2025-10-18 22:37:38', '2026-02-07 10:12:47', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `lang_code`, `name`, `short_description`, `size`, `specification`, `created_at`, `updated_at`) VALUES
(1, 13, 'en', 'Pounded Yam with Rich Egusi Soup & Goat Meat', 'Smooth, fluffy pounded yam served with rich melon-seed Egusi soup, cooked with fresh spinach, dried fish, stockfish, and tender goat meat.', '{\"Single Portion\":\"4500\",\"Double Meat\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(2, 13, 'bn', 'Pounded Yam with Rich Egusi Soup & Goat Meat', 'Smooth, fluffy pounded yam served with rich melon-seed Egusi soup, cooked with fresh spinach, dried fish, stockfish, and tender goat meat.', '{\"Single Portion\":\"4500\",\"Double Meat\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(3, 14, 'en', 'Double Sausage & Chicken Shawarma', 'Warm flatbread wrapped around seasoned grilled chicken shreds, double hotdog sausages, crisp cabbage, and rich spicy mayonnaise-ketchup cream.', '{\"Single Sausage\":\"2700\",\"Double Sausage & Chicken\":\"3200\",\"Jumbo Deluxe\":\"4200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(4, 14, 'bn', 'Double Sausage & Chicken Shawarma', 'Warm flatbread wrapped around seasoned grilled chicken shreds, double hotdog sausages, crisp cabbage, and rich spicy mayonnaise-ketchup cream.', '{\"Single Sausage\":\"2700\",\"Double Sausage & Chicken\":\"3200\",\"Jumbo Deluxe\":\"4200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(5, 15, 'en', 'Amala with Silky Ewedu & Gbegiri (Abula Special)', 'Fluffy dark Oyo Amala served with green Ewedu, golden yellow bean Gbegiri soup, hot buka stew, assorted shaki, soft kpomo, and tender beef.', '{\"Standard\":\"3800\",\"Assorted Special\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(6, 15, 'bn', 'Amala with Silky Ewedu & Gbegiri (Abula Special)', 'Fluffy dark Oyo Amala served with green Ewedu, golden yellow bean Gbegiri soup, hot buka stew, assorted shaki, soft kpomo, and tender beef.', '{\"Standard\":\"3800\",\"Assorted Special\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(7, 16, 'en', 'Sweet Golden Puff-Puff Box (10 Pcs)', 'Freshly fried, pillowy sweet golden-brown Nigerian puff-puff dusted with powdered cinnamon sugar.', '{\"Regular (10 pcs)\":\"1500\",\"Party Tub (25 pcs)\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(8, 16, 'bn', 'Sweet Golden Puff-Puff Box (10 Pcs)', 'Freshly fried, pillowy sweet golden-brown Nigerian puff-puff dusted with powdered cinnamon sugar.', '{\"Regular (10 pcs)\":\"1500\",\"Party Tub (25 pcs)\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(9, 17, 'en', 'Eba with Fresh Seafood Okra Soup & Crab', 'Yellow Ijebu Garri swallow paired with fresh crunchy diced okra soup loaded with jumbo prawns, calamari, fresh fish chunks, and whole blue crab.', '{\"Regular\":\"5200\",\"Seafood King Deluxe\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(10, 17, 'bn', 'Eba with Fresh Seafood Okra Soup & Crab', 'Yellow Ijebu Garri swallow paired with fresh crunchy diced okra soup loaded with jumbo prawns, calamari, fresh fish chunks, and whole blue crab.', '{\"Regular\":\"5200\",\"Seafood King Deluxe\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(11, 18, 'en', 'Crispy Nigerian Meat Pie (2 Pcs)', 'Rich, buttery, flaky golden pastry stuffed with finely minced lean beef, diced potatoes, and savory herb seasonings.', '{\"Pack of 2\":\"1800\",\"Box of 4\":\"3400\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(12, 18, 'bn', 'Crispy Nigerian Meat Pie (2 Pcs)', 'Rich, buttery, flaky golden pastry stuffed with finely minced lean beef, diced potatoes, and savory herb seasonings.', '{\"Pack of 2\":\"1800\",\"Box of 4\":\"3400\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(13, 22, 'en', 'Gizdodo Supreme (Gizzard & Dodo Bowl)', 'Sweet fried ripe plantain cubes (Dodo) and crunchy peppered chicken gizzard tossed in sweet bell peppers and habanero chili sauce.', '{\"Standard Bowl\":\"3500\",\"Jumbo Bowl\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(14, 22, 'bn', 'Gizdodo Supreme (Gizzard & Dodo Bowl)', 'Sweet fried ripe plantain cubes (Dodo) and crunchy peppered chicken gizzard tossed in sweet bell peppers and habanero chili sauce.', '{\"Standard Bowl\":\"3500\",\"Jumbo Bowl\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(15, 23, 'en', 'Chilled Zobo Hibiscus Infusion (50cl)', 'All-natural chilled drink brewed from dried roselle hibiscus flowers, infused with fresh crushed ginger, cloves, and pineapple sweet juice.', '{\"Bottle (50cl)\":\"1200\",\"Jug (1.5L)\":\"3000\"}', '[]', '2025-03-13 00:05:40', '2025-10-11 22:18:07'),
(16, 23, 'bn', 'Chilled Zobo Hibiscus Infusion (50cl)', 'All-natural chilled drink brewed from dried roselle hibiscus flowers, infused with fresh crushed ginger, cloves, and pineapple sweet juice.', '{\"Bottle (50cl)\":\"1200\",\"Jug (1.5L)\":\"3000\"}', '[]', '2025-03-13 00:05:40', '2025-10-11 22:18:07'),
(17, 24, 'en', 'Classic Chapman Mocktail with Citrus & Bitters', 'Signature Nigerian sparkling mocktail crafted with Fanta, Sprite, aromatic Angostura bitters, fresh cucumber ribbons, and orange slices.', '{\"Glass (400ml)\":\"2200\",\"Pitcher (1L)\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(18, 24, 'bn', 'Classic Chapman Mocktail with Citrus & Bitters', 'Signature Nigerian sparkling mocktail crafted with Fanta, Sprite, aromatic Angostura bitters, fresh cucumber ribbons, and orange slices.', '{\"Glass (400ml)\":\"2200\",\"Pitcher (1L)\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(19, 25, 'en', 'Grilled Whole Catfish Point & Kill with Spicy Sauce', 'Fresh whole African catfish seasoned with traditional herbs, slowly charcoal-grilled, and served with spicy pepper sauce, roasted yam, and coleslaw.', '{\"Medium Catfish\":\"5500\",\"Large Catfish\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(20, 25, 'bn', 'Grilled Whole Catfish Point & Kill with Spicy Sauce', 'Fresh whole African catfish seasoned with traditional herbs, slowly charcoal-grilled, and served with spicy pepper sauce, roasted yam, and coleslaw.', '{\"Medium Catfish\":\"5500\",\"Large Catfish\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(21, 26, 'en', 'Hot & Spicy Goat Meat Pepper Soup', 'Intensely aromatic light broth brewed with traditional calabash nutmeg (Ehuru), African scent leaves, and tender bone-in goat meat chunks.', '{\"Standard Bowl\":\"3500\",\"Mega Bowl\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(22, 26, 'bn', 'Hot & Spicy Goat Meat Pepper Soup', 'Intensely aromatic light broth brewed with traditional calabash nutmeg (Ehuru), African scent leaves, and tender bone-in goat meat chunks.', '{\"Standard Bowl\":\"3500\",\"Mega Bowl\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(23, 27, 'en', 'Asun Peppered Roasted Goat Meat Bites', 'Smoky flame-roasted goat meat cut into spicy bite-sized chunks and sauteed with hot habanero chili peppers and sliced white onions.', '{\"Regular Portion\":\"4200\",\"Large Portion\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(24, 27, 'bn', 'Asun Peppered Roasted Goat Meat Bites', 'Smoky flame-roasted goat meat cut into spicy bite-sized chunks and sauteed with hot habanero chili peppers and sliced white onions.', '{\"Regular Portion\":\"4200\",\"Large Portion\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(25, 31, 'en', 'Crispy Chicken Burger with Sweet Potato Fries', 'Crispy golden fried chicken breast patty topped with melted cheddar cheese, fresh lettuce, tomatoes, and signature spicy mayo on toasted brioche.', '{\"Single Patty\":\"3800\",\"Double Patty Deluxe\":\"4900\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(26, 31, 'bn', 'Crispy Chicken Burger with Sweet Potato Fries', 'Crispy golden fried chicken breast patty topped with melted cheddar cheese, fresh lettuce, tomatoes, and signature spicy mayo on toasted brioche.', '{\"Single Patty\":\"3800\",\"Double Patty Deluxe\":\"4900\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(27, 32, 'en', 'Smoky Party Jollof Rice & Fried Chicken', 'Authentic wood-smoked party Jollof rice prepared with rich tomato-pepper reduction, served with crispy seasoned fried chicken and sweet fried plantain.', '{\"Regular\":\"3800\",\"Large\":\"4800\",\"Jumbo Party Pack\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(28, 32, 'bn', 'Smoky Party Jollof Rice & Fried Chicken', 'Authentic wood-smoked party Jollof rice prepared with rich tomato-pepper reduction, served with crispy seasoned fried chicken and sweet fried plantain.', '{\"Regular\":\"3800\",\"Large\":\"4800\",\"Jumbo Party Pack\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(29, 33, 'en', 'Special Nigerian Fried Rice with Prawns', 'Flavorful Basmati rice stir-fried with sweet corn, carrots, green peas, liver bits, and seasoned jumbo prawns.', '{\"Regular\":\"4200\",\"Large\":\"5200\",\"Special\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(30, 33, 'bn', 'Special Nigerian Fried Rice with Prawns', 'Flavorful Basmati rice stir-fried with sweet corn, carrots, green peas, liver bits, and seasoned jumbo prawns.', '{\"Regular\":\"4200\",\"Large\":\"5200\",\"Special\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2025-04-21 04:12:15'),
(31, 34, 'en', 'Ofada Rice with Spicy Ayamase Designer Stew', 'Traditional unpolished Ofada rice served in broad leaves with rich bleached palm oil green-pepper Ayamase sauce, assorted meats, and boiled egg.', '{\"Standard\":\"4500\",\"Mega Portion\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:45:26'),
(32, 34, 'bn', 'Ofada Rice with Spicy Ayamase Designer Stew', 'Traditional unpolished Ofada rice served in broad leaves with rich bleached palm oil green-pepper Ayamase sauce, assorted meats, and boiled egg.', '{\"Standard\":\"4500\",\"Mega Portion\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:45:26'),
(33, 35, 'en', 'Peppered Grilled Chicken Platter', 'Succulent quarter chicken grilled to perfection and tossed in spicy Nigerian Scotch bonnet habanero pepper sauce.', '{\"Quarter Chicken\":\"3200\",\"Half Chicken\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:46:09'),
(34, 35, 'bn', 'Peppered Grilled Chicken Platter', 'Succulent quarter chicken grilled to perfection and tossed in spicy Nigerian Scotch bonnet habanero pepper sauce.', '{\"Quarter Chicken\":\"3200\",\"Half Chicken\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:46:09'),
(35, 36, 'en', 'Assorted Small Chops Platter (12 Pcs)', 'Crispy golden beef samosas, vegetable spring rolls, sweet plantain mosa, fluffy puff-puff, and tender peppered gizzard bites.', '{\"Standard Box (12 pcs)\":\"2800\",\"Jumbo Party Pack (24 pcs)\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:46:41'),
(36, 36, 'bn', 'Assorted Small Chops Platter (12 Pcs)', 'Crispy golden beef samosas, vegetable spring rolls, sweet plantain mosa, fluffy puff-puff, and tender peppered gizzard bites.', '{\"Standard Box (12 pcs)\":\"2800\",\"Jumbo Party Pack (24 pcs)\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:46:41'),
(37, 38, 'en', 'Spicy Beef Suya Platter with Yaji Spice', 'Thinly sliced tender beef skewered, grilled over open charcoal flames, dusted with authentic Northern Nigerian Kuli-kuli Yaji spice, and fresh onions.', '{\"Regular Portion\":\"3000\",\"Double Portion\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:47:14'),
(38, 38, 'bn', 'Spicy Beef Suya Platter with Yaji Spice', 'Thinly sliced tender beef skewered, grilled over open charcoal flames, dusted with authentic Northern Nigerian Kuli-kuli Yaji spice, and fresh onions.', '{\"Regular Portion\":\"3000\",\"Double Portion\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:47:14'),
(39, 40, 'en', 'Village Native Rice with Smoked Fish & Ponmo', 'Palm oil infused local rice cooked with locust beans (Iru), dried crayfish, smoked catfish chunks, soft ponmo, and scent leaves.', '{\"Regular\":\"4000\",\"Jumbo Bowl\":\"5400\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:47:54'),
(40, 40, 'bn', 'Village Native Rice with Smoked Fish & Ponmo', 'Palm oil infused local rice cooked with locust beans (Iru), dried crayfish, smoked catfish chunks, soft ponmo, and scent leaves.', '{\"Regular\":\"4000\",\"Jumbo Bowl\":\"5400\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:47:54'),
(41, 41, 'en', 'Spicy Efo Riro with Assorted Meats & Semo', 'Rich Yoruba spinach vegetable soup cooked with locust beans (Iru), crayfish, smoked panla fish, ponmo, and beef, served with warm Semovita.', '{\"Single Wrap\":\"4500\",\"Double Meat\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:54:14'),
(42, 41, 'bn', 'Spicy Efo Riro with Assorted Meats & Semo', 'Rich Yoruba spinach vegetable soup cooked with locust beans (Iru), crayfish, smoked panla fish, ponmo, and beef, served with warm Semovita.', '{\"Single Wrap\":\"4500\",\"Double Meat\":\"5800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:54:14'),
(43, 42, 'en', 'Pounded Yam with Bitterleaf Soup (Ofe Onugbu)', 'Traditional Eastern Nigerian bitterleaf soup thickened with cocoyam, flavored with ogiri, dried fish, and tender beef chunks, served with pounded yam.', '{\"Regular\":\"4800\",\"Special\":\"6000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:55:15'),
(44, 42, 'bn', 'Pounded Yam with Bitterleaf Soup (Ofe Onugbu)', 'Traditional Eastern Nigerian bitterleaf soup thickened with cocoyam, flavored with ogiri, dried fish, and tender beef chunks, served with pounded yam.', '{\"Regular\":\"4800\",\"Special\":\"6000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:55:15'),
(45, 43, 'en', 'Afang Soup with Stockfish, Beef & Pounded Yam', 'Calabar delicacy prepared with shredded wild Afang leaves, waterleaves, periwinkles, stockfish head, and tender beef.', '{\"Regular\":\"4600\",\"Deluxe Seafood\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:56:13'),
(46, 43, 'bn', 'Afang Soup with Stockfish, Beef & Pounded Yam', 'Calabar delicacy prepared with shredded wild Afang leaves, waterleaves, periwinkles, stockfish head, and tender beef.', '{\"Regular\":\"4600\",\"Deluxe Seafood\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:56:13'),
(47, 45, 'en', 'Spicy Peppered Turkey Wings Platter', 'Thick cut, succulent turkey wings seasoned, boiled in aromatics, fried, and glazed in fiery Scotch bonnet pepper sauce.', '{\"2 Jumbo Wings\":\"4500\",\"4 Jumbo Wings\":\"7500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:57:31'),
(48, 45, 'bn', 'Spicy Peppered Turkey Wings Platter', 'Thick cut, succulent turkey wings seasoned, boiled in aromatics, fried, and glazed in fiery Scotch bonnet pepper sauce.', '{\"2 Jumbo Wings\":\"4500\",\"4 Jumbo Wings\":\"7500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:57:31'),
(49, 46, 'en', 'Peppered Snail & Plantain Combo', 'Giant African land snails sauteed in hot pepper-onion sauce, served alongside golden sweet fried plantain slices.', '{\"2 Giant Snails\":\"5000\",\"4 Giant Snails\":\"8500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:58:21'),
(50, 46, 'bn', 'Peppered Snail & Plantain Combo', 'Giant African land snails sauteed in hot pepper-onion sauce, served alongside golden sweet fried plantain slices.', '{\"2 Giant Snails\":\"5000\",\"4 Giant Snails\":\"8500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:58:21'),
(51, 47, 'en', 'Fresh Coconut Milk Cake Slice', 'Light and fluffy sponge cake infused with fresh coconut milk and topped with toasted coconut shavings.', '{\"Single Slice\":\"2500\",\"Double Slice Box\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 11:00:58'),
(52, 47, 'bn', 'Fresh Coconut Milk Cake Slice', 'Light and fluffy sponge cake infused with fresh coconut milk and topped with toasted coconut shavings.', '{\"Single Slice\":\"2500\",\"Double Slice Box\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 11:00:58'),
(53, 50, 'en', 'Charcoal Grilled Chicken Drumsticks & Carrots', 'Juicy marinated chicken drumsticks flame-grilled with roasted carrots, bell peppers, and savory Nigerian spice rub.', '{\"2 Drumsticks\":\"3200\",\"4 Drumsticks\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:20:33'),
(54, 50, 'bn', 'Charcoal Grilled Chicken Drumsticks & Carrots', 'Juicy marinated chicken drumsticks flame-grilled with roasted carrots, bell peppers, and savory Nigerian spice rub.', '{\"2 Drumsticks\":\"3200\",\"4 Drumsticks\":\"5200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:20:33'),
(55, 51, 'en', 'Stir-Fried Nigerian Jollof Macaroni with Sausage', 'Elbow macaroni tossed in savory tomato-pepper sauce with sliced sausages, sweet corn, and aromatic herbs.', '{\"Regular\":\"2800\",\"Large\":\"3800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:22:35'),
(56, 51, 'bn', 'Stir-Fried Nigerian Jollof Macaroni with Sausage', 'Elbow macaroni tossed in savory tomato-pepper sauce with sliced sausages, sweet corn, and aromatic herbs.', '{\"Regular\":\"2800\",\"Large\":\"3800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:22:35'),
(57, 53, 'en', 'Spicy Grilled Goat Meat Kebab (Asun Skewers)', 'Skewered roasted goat meat interlayered with bell peppers and onions, basted in hot suya pepper glaze.', '{\"3 Skewers\":\"3800\",\"6 Skewers\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:23:06'),
(58, 53, 'bn', 'Spicy Grilled Goat Meat Kebab (Asun Skewers)', 'Skewered roasted goat meat interlayered with bell peppers and onions, basted in hot suya pepper glaze.', '{\"3 Skewers\":\"3800\",\"6 Skewers\":\"6500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:23:06'),
(59, 54, 'en', 'Decadent Dark Chocolate Brownie Square', 'Rich, fudgy chocolate brownie square made with pure cocoa and melted chocolate chips.', '{\"Single Square\":\"2000\",\"Box of 3\":\"5000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:27:44'),
(60, 54, 'bn', 'Decadent Dark Chocolate Brownie Square', 'Rich, fudgy chocolate brownie square made with pure cocoa and melted chocolate chips.', '{\"Single Square\":\"2000\",\"Box of 3\":\"5000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:27:44'),
(61, 55, 'en', 'Crispy Stir-Fried Macaroni with Diced Sausage', 'Crispy stir-fried macaroni tossed with juicy sausage, onions, and light spices for a savory, comforting bite.', '{\"Regular\":\"2500\",\"Large\":\"3500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:15:34'),
(62, 55, 'bn', 'Crispy Stir-Fried Macaroni with Diced Sausage', 'Crispy stir-fried macaroni tossed with juicy sausage, onions, and light spices for a savory, comforting bite.', '{\"Regular\":\"2500\",\"Large\":\"3500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:15:34'),
(63, 57, 'en', 'Flame-Grilled Quarter Chicken & Yaji Spice', 'Quarter chicken seasoned with aromatic herbs, grilled over charcoal, and dusted with Northern Yaji pepper spice.', '{\"Quarter Chicken\":\"3200\",\"Half Chicken\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:29:14'),
(64, 57, 'bn', 'Flame-Grilled Quarter Chicken & Yaji Spice', 'Quarter chicken seasoned with aromatic herbs, grilled over charcoal, and dusted with Northern Yaji pepper spice.', '{\"Quarter Chicken\":\"3200\",\"Half Chicken\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:29:14'),
(65, 58, 'en', 'Crunchy Chin-Chin Party Jar (500g)', 'Authentic Nigerian crunchy sweet fried pastry bites made with rich milk, butter, and fragrant nutmeg.', '{\"Jar (500g)\":\"2000\",\"Mega Tub (1kg)\":\"3600\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 09:35:41'),
(66, 58, 'bn', 'Crunchy Chin-Chin Party Jar (500g)', 'Authentic Nigerian crunchy sweet fried pastry bites made with rich milk, butter, and fragrant nutmeg.', '{\"Jar (500g)\":\"2000\",\"Mega Tub (1kg)\":\"3600\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 09:35:41'),
(67, 59, 'en', 'Oatmeal Raisin & Coconut Cookies (Box of 4)', 'Freshly baked wholesome oatmeal cookies packed with plump raisins, toasted coconut flakes, and sweet honey.', '{\"Box of 4\":\"1800\",\"Box of 8\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 09:37:12'),
(68, 59, 'bn', 'Oatmeal Raisin & Coconut Cookies (Box of 4)', 'Freshly baked wholesome oatmeal cookies packed with plump raisins, toasted coconut flakes, and sweet honey.', '{\"Box of 4\":\"1800\",\"Box of 8\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 09:37:12'),
(69, 60, 'en', 'Double Chocolate Fudge Cake Slice', 'Decadent moist chocolate sponge coated with rich dark chocolate ganache and chocolate chips.', '{\"Single Slice\":\"2600\",\"Double Slice Box\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:30:48'),
(70, 60, 'bn', 'Double Chocolate Fudge Cake Slice', 'Decadent moist chocolate sponge coated with rich dark chocolate ganache and chocolate chips.', '{\"Single Slice\":\"2600\",\"Double Slice Box\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:30:48'),
(71, 61, 'en', 'Sweet Banana Bread Loaf Slice', 'Moist sweet bread made with ripe bananas, walnuts, and butter, lightly toasted with honey spread.', '{\"2 Slices\":\"1800\",\"Full Loaf\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:32:03'),
(72, 61, 'bn', 'Sweet Banana Bread Loaf Slice', 'Moist sweet bread made with ripe bananas, walnuts, and butter, lightly toasted with honey spread.', '{\"2 Slices\":\"1800\",\"Full Loaf\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:32:03'),
(73, 62, 'en', 'Gourmet Chocolate Chip Muffin', 'Fluffy bakery-style muffin loaded with Belgian dark and milk chocolate morsels.', '{\"Single Muffin\":\"1600\",\"Pack of 3\":\"4200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:32:38'),
(74, 62, 'bn', 'Gourmet Chocolate Chip Muffin', 'Fluffy bakery-style muffin loaded with Belgian dark and milk chocolate morsels.', '{\"Single Muffin\":\"1600\",\"Pack of 3\":\"4200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:32:38'),
(75, 63, 'en', 'Rich Red Velvet Cake Slice', 'Moist red velvet sponge layered with smooth vanilla cream cheese frosting and white chocolate curls.', '{\"Single Slice\":\"2500\",\"Double Slice Box\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:33:22'),
(76, 63, 'bn', 'Rich Red Velvet Cake Slice', 'Moist red velvet sponge layered with smooth vanilla cream cheese frosting and white chocolate curls.', '{\"Single Slice\":\"2500\",\"Double Slice Box\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:33:22'),
(77, 64, 'en', 'Indomie Relish Special with Eggs & Sausage', 'Wok-tossed Nigerian Indomie noodles with shredded carrots, bell peppers, double fried eggs, and sliced beef sausage.', '{\"Hungry Man Size\":\"2500\",\"Super Pack Double\":\"3500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:34:09'),
(78, 64, 'bn', 'Indomie Relish Special with Eggs & Sausage', 'Wok-tossed Nigerian Indomie noodles with shredded carrots, bell peppers, double fried eggs, and sliced beef sausage.', '{\"Hungry Man Size\":\"2500\",\"Super Pack Double\":\"3500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:34:09'),
(79, 66, 'en', 'Spicy Peppered Gizzard Bowl', 'Tender, crunchy chicken gizzards deep fried and tossed in hot pepper sauce with diced bell peppers and onions.', '{\"Regular\":\"2800\",\"Large\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:34:49'),
(80, 66, 'bn', 'Spicy Peppered Gizzard Bowl', 'Tender, crunchy chicken gizzards deep fried and tossed in hot pepper sauce with diced bell peppers and onions.', '{\"Regular\":\"2800\",\"Large\":\"4500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:34:49'),
(81, 67, 'en', 'Vanilla Bean Cupcake Box (4 Pcs)', 'Fluffy Madagascar vanilla sponge cupcakes crowned with whipped buttercream swirls and colorful sprinkles.', '{\"Box of 4\":\"2400\",\"Box of 8\":\"4400\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:35:45'),
(82, 67, 'bn', 'Vanilla Bean Cupcake Box (4 Pcs)', 'Fluffy Madagascar vanilla sponge cupcakes crowned with whipped buttercream swirls and colorful sprinkles.', '{\"Box of 4\":\"2400\",\"Box of 8\":\"4400\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:35:45'),
(83, 68, 'en', 'Sweet Cinnamon Sugar Churro Bites', 'Crispy golden pastry sticks rolled in fragrant cinnamon sugar, served with warm melted chocolate dip.', '{\"Standard Box\":\"1800\",\"Party Box\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:36:12'),
(84, 68, 'bn', 'Sweet Cinnamon Sugar Churro Bites', 'Crispy golden pastry sticks rolled in fragrant cinnamon sugar, served with warm melted chocolate dip.', '{\"Standard Box\":\"1800\",\"Party Box\":\"3200\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:36:12'),
(85, 69, 'en', 'Fresh Mango & Passion Fruit Smoothie (50cl)', 'Creamy refreshing blend of sweet local mangoes, passion fruit pulp, Greek yogurt, and crushed ice.', '{\"Cup (50cl)\":\"2000\",\"Large Cup (75cl)\":\"2800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:37:38'),
(86, 69, 'bn', 'Fresh Mango & Passion Fruit Smoothie (50cl)', 'Creamy refreshing blend of sweet local mangoes, passion fruit pulp, Greek yogurt, and crushed ice.', '{\"Cup (50cl)\":\"2000\",\"Large Cup (75cl)\":\"2800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:37:38'),
(87, 72, 'en', 'Peppered Goat Meat & Roasted Yam Platter', 'Tender goat meat sautéed with hot habanero chili sauce, served with roasted white yam slices and spicy palm oil dip.', '{\"Regular\":\"4500\",\"Deluxe\":\"6000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:38:26'),
(88, 72, 'bn', 'Peppered Goat Meat & Roasted Yam Platter', 'Tender goat meat sautéed with hot habanero chili sauce, served with roasted white yam slices and spicy palm oil dip.', '{\"Regular\":\"4500\",\"Deluxe\":\"6000\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:38:26'),
(89, 73, 'en', 'Singapore Style Stir-Fried Noodles with Chicken', 'Thin egg noodles tossed with shredded chicken breast, bell peppers, carrots, spring onions, and light soy sauce.', '{\"Regular\":\"2800\",\"Large\":\"3800\",\"Jumbo\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:39:18'),
(90, 73, 'bn', 'Singapore Style Stir-Fried Noodles with Chicken', 'Thin egg noodles tossed with shredded chicken breast, bell peppers, carrots, spring onions, and light soy sauce.', '{\"Regular\":\"2800\",\"Large\":\"3800\",\"Jumbo\":\"4800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:39:18'),
(91, 74, 'en', 'Bole & Fish Special (Roasted Plantain & Grilled Fish)', 'Port Harcourt style charcoal-roasted sweet plantain (Bole) served with spiced grilled mackerel fish and pepper sauce.', '{\"Single Bole & Fish\":\"3500\",\"Double Combo\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2025-04-29 03:26:10'),
(92, 74, 'bn', 'Bole & Fish Special (Roasted Plantain & Grilled Fish)', 'Port Harcourt style charcoal-roasted sweet plantain (Bole) served with spiced grilled mackerel fish and pepper sauce.', '{\"Single Bole & Fish\":\"3500\",\"Double Combo\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2025-04-29 03:26:10'),
(93, 75, 'en', 'Crispy Fried Chicken Wings & Sweet Dodo', 'Golden crunchy chicken wings served alongside sweet golden fried ripe plantain slices and dip.', '{\"4 Wings + Dodo\":\"3200\",\"8 Wings + Dodo\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:41:04'),
(94, 75, 'bn', 'Crispy Fried Chicken Wings & Sweet Dodo', 'Golden crunchy chicken wings served alongside sweet golden fried ripe plantain slices and dip.', '{\"4 Wings + Dodo\":\"3200\",\"8 Wings + Dodo\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:41:04'),
(95, 76, 'en', 'Fluffy Butter Pound Cake Slice', 'Rich and buttery traditional pound cake slice, baked golden brown with natural vanilla extract.', '{\"Single Slice\":\"2200\",\"Pack of 3\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:41:40'),
(96, 76, 'bn', 'Fluffy Butter Pound Cake Slice', 'Rich and buttery traditional pound cake slice, baked golden brown with natural vanilla extract.', '{\"Single Slice\":\"2200\",\"Pack of 3\":\"5500\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:41:40'),
(97, 77, 'en', 'Chocolate Glazed Doughnuts (Box of 3)', 'Soft yeast-raised artisan doughnuts coated in rich milk chocolate glaze and topped with toasted peanuts.', '{\"Box of 3\":\"2000\",\"Box of 6\":\"3800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:42:26'),
(98, 77, 'bn', 'Chocolate Glazed Doughnuts (Box of 3)', 'Soft yeast-raised artisan doughnuts coated in rich milk chocolate glaze and topped with toasted peanuts.', '{\"Box of 3\":\"2000\",\"Box of 6\":\"3800\"}', '[]', '2025-03-13 00:05:40', '2026-02-07 10:42:26'),
(99, 184, 'en', 'Chinese Wok Noodles with Shredded Chicken', 'Stir-fried Asian noodles with crunchy cabbage, bell peppers, shredded chicken breast, and sesame oil.', '{\"Standard Box\":\"3500\",\"Large Box\":\"4800\"}', '[]', '2025-10-08 23:34:43', '2025-10-12 21:36:48'),
(100, 184, 'bn', 'Chinese Wok Noodles with Shredded Chicken', 'Stir-fried Asian noodles with crunchy cabbage, bell peppers, shredded chicken breast, and sesame oil.', '{\"Standard Box\":\"3500\",\"Large Box\":\"4800\"}', '[]', '2025-10-08 23:34:43', '2025-10-12 21:36:48'),
(101, 196, 'en', 'Jollof Spaghetti with Meatballs & Dodo', 'Spicy Nigerian style Jollof spaghetti cooked in savory tomato reduction with seasoned beef meatballs and fried plantain.', '{\"Regular\":\"3200\",\"Mega Bowl\":\"4500\"}', '[]', '2025-10-18 22:37:38', '2026-02-07 10:12:47'),
(102, 196, 'bn', 'Jollof Spaghetti with Meatballs & Dodo', 'Spicy Nigerian style Jollof spaghetti cooked in savory tomato reduction with seasoned beef meatballs and fried plantain.', '{\"Regular\":\"3200\",\"Mega Bowl\":\"4500\"}', '[]', '2025-10-18 22:37:38', '2026-02-07 10:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `pwa_icon_settings`
--

CREATE TABLE `pwa_icon_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `icon_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/png',
  `purpose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any maskable',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pwa_icon_settings`
--

INSERT INTO `pwa_icon_settings` (`id`, `icon_size`, `icon_path`, `icon_type`, `purpose`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '72x72', 'uploads/pwa-icons/pwa-icon-72x72-2025-08-07-03-26-54-8296.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:26:54'),
(2, '96x96', 'uploads/pwa-icons/pwa-icon-96x96-2025-08-07-03-26-54-6678.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:26:54'),
(3, '128x128', 'uploads/pwa-icons/pwa-icon-128x128-2025-08-07-03-27-15-8215.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:27:15'),
(4, '144x144', 'uploads/pwa-icons/pwa-icon-144x144-2025-08-07-03-27-15-9110.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:27:15'),
(5, '152x152', 'uploads/pwa-icons/pwa-icon-152x152-2025-08-07-03-27-15-2133.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:27:15'),
(6, '192x192', 'uploads/pwa-icons/pwa-icon-192x192-2025-08-07-03-31-55-7708.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:31:55'),
(7, '384x384', 'uploads/pwa-icons/pwa-icon-384x384-2025-08-07-03-31-55-4877.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:31:55'),
(8, '512x512', 'uploads/pwa-icons/pwa-icon-512x512-2025-08-07-03-31-55-1741.png', 'image/png', 'any maskable', 1, '2025-08-06 21:26:06', '2025-08-06 21:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int NOT NULL,
  `cuisines` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `max_delivery_distance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closing_hour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_processing_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_processing_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_slot_separate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_featured` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `is_pickup_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `is_delivery_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `admin_approval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `is_banned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `forget_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_trusted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `logo`, `cover_image`, `restaurant_name`, `slug`, `city_id`, `cuisines`, `whatsapp`, `address`, `latitude`, `longitude`, `max_delivery_distance`, `owner_name`, `owner_email`, `owner_phone`, `name`, `email`, `password`, `opening_hour`, `closing_hour`, `min_processing_time`, `max_processing_time`, `time_slot_separate`, `tags`, `is_featured`, `is_pickup_order`, `is_delivery_order`, `admin_approval`, `is_banned`, `forget_password_token`, `created_at`, `updated_at`, `is_trusted`) VALUES
(4, 'uploads/custom-images/restaurant-logo--2025-03-13-09-31-02-1262.webp', 'uploads/custom-images/restaurant-cover--2025-03-13-09-31-02-3112.webp', 'Yellow Chilli Restaurant & Bar', 'yellow-chilli-restaurant', 1, '["1","3","4"]', '08031234567', '27 Oju Olobun Close, Off Bishop Oluwole St, Victoria Island, Lagos', 6.4281, 3.4219, 2000.00, 'Emeka Okonkwo', 'yellowchilli@gmail.com', '08031234567', 'Emeka Okonkwo', 'yellowchilli@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '08:00', '23:00', '30', '60', '0', '[{"value":"nigerian food"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-13 03:31:02', '2025-03-14 22:42:38', 1),
(5, 'uploads/custom-images/restaurant-logo--2025-03-13-10-02-09-7775.webp', 'uploads/custom-images/restaurant-cover--2025-03-13-10-02-09-3990.webp', 'The Place Restaurant', 'the-place-restaurant', 1, '["1","2","3"]', '08039876543', '4 Adeola Odeku St, Victoria Island, Lagos', 6.4312, 3.4184, 2000.00, 'Tunde Bakare', 'theplace@gmail.com', '08039876543', 'Tunde Bakare', 'theplace@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '08:00', '23:00', '25', '45', '0', '[{"value":"nigerian food"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-13 04:02:09', '2025-03-14 22:42:52', 1),
(6, 'uploads/custom-images/restaurant-logo--2025-03-13-10-14-52-6034.webp', 'uploads/custom-images/restaurant-cover--2025-03-13-10-14-52-9079.webp', 'Mega Chicken & Grills', 'mega-chicken-grills', 1, '["1","2","5"]', '08023456789', 'Plot 1, Commercial Block, Lekki - Epe Expy, Ikota, Lagos', 6.4474, 3.5284, 2000.00, 'Bola Ahmed', 'megachicken@gmail.com', '08023456789', 'Bola Ahmed', 'megachicken@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '07:30', '23:00', '20', '50', '0', '[{"value":"chicken, grills"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-13 04:14:52', '2025-03-14 22:43:10', 1),
(7, 'uploads/custom-images/restaurant-logo--2025-03-15-04-48-22-5280.webp', 'uploads/custom-images/restaurant-cover--2025-03-15-04-48-22-1558.webp', 'Kilimanjaro Eatery', 'kilimanjaro-eatery', 1, '["1","3","4"]', '08034567890', '138 Admiralty Way, Lekki Phase 1, Lagos', 6.4498, 3.4723, 2000.00, 'Nnamdi Kanu', 'kilimanjaro@gmail.com', '08034567890', 'Nnamdi Kanu', 'kilimanjaro@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '08:00', '22:30', '30', '55', '0', '[{"value":"kilimanjaro"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-14 22:48:22', '2025-10-18 21:23:01', 1),
(8, 'uploads/custom-images/restaurant-logo--2025-03-15-04-58-28-9673.webp', 'uploads/custom-images/restaurant-cover--2025-03-15-04-58-28-4644.webp', 'Bukka Hut Lounge', 'bukka-hut-lounge', 1, '["1","4","5"]', '08056789012', 'Block 69A, Plot 8 Admiralty Way, Lekki Phase 1, Lagos', 6.4485, 3.4682, 2000.00, 'Rasheed Bello', 'bukkahut@gmail.com', '08056789012', 'Rasheed Bello', 'bukkahut@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '08:00', '23:00', '25', '50', '0', '[{"value":"bukka hut"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-14 22:58:28', '2025-03-15 00:46:45', 1),
(10, 'uploads/custom-images/restaurant-logo--2025-10-08-09-41-17-2746.webp', 'uploads/custom-images/restaurant-cover--2025-10-08-09-41-17-7684.webp', 'Chicken Republic Express', 'chicken-republic-express', 1, '["2","3"]', '08078901234', '23 Glover Road, Ikoyi, Lagos', 6.4520, 3.4350, 2000.00, 'Ibrahim Musa', 'chickenrepublic@gmail.com', '08078901234', 'Ibrahim Musa', 'chickenrepublic@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '08:00', '22:00', '20', '40', '0', '[{"value":"chicken republic"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-03-14 23:46:07', '2025-10-08 03:41:17', 1),
(11, 'uploads/custom-images/restaurant-logo--2025-05-10-07-49-12-7006.webp', 'uploads/custom-images/restaurant-cover--2025-05-10-07-49-12-2717.webp', 'Terra Kulture Food Lounge', 'terra-kulture-lounge', 1, '["1","4"]', '08089012345', 'Plot 1376 Tiamiyu Savage St, Victoria Island, Lagos', 6.4315, 3.4241, 2000.00, 'Bolanle Austen', 'terrakulture@gmail.com', '08089012345', 'Bolanle Austen', 'terrakulture@gmail.com', '$2y$10$f6b4i/2B7bW3.c8E92dD2O88tY7o7/g2dM4rW1eL9/c8E92dD2O88', '09:00', '23:00', '30', '60', '0', '[{"value":"terra kulture"}]', 'enable', 'enable', 'enable', 'enable', 'disable', NULL, '2025-05-10 01:49:12', '2025-05-10 01:49:12', 1);value&quot;:&quot;tst&quot;},{&quot;value&quot;:&quot;tag3&quot;},{&quot;value&quot;:&quot;tag4&quot;}]', 'disable', 'disable', 'enable', 'disable', 'disable', NULL, '2025-05-10 01:49:12', '2025-05-10 01:49:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wishlists`
--

CREATE TABLE `restaurant_wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_wishlists`
--

INSERT INTO `restaurant_wishlists` (`id`, `user_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '2025-05-06 05:23:44', '2025-05-06 05:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `order_id`, `product_id`, `review`, `rating`, `status`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(1, 1, 5, 2, 'There are many variations of passages of Lorem Ipsum available,to majority have into the find end to suffered', 5, 0, '2025-03-16 02:23:20', '2025-03-16 02:23:20', 1),
(2, 1, 6, 4, 'There are many variations of passages of Lorem Ipsum  available,to majority have into the find end to suffered', 5, 0, '2025-04-21 01:42:05', '2025-04-21 01:42:05', 2),
(3, 1, 5, 1, 'Toasted pita pockets embracing golden, crispy mashed chickpea fritters, adorned with vibrant Mediterranean toppings.', 4, 0, '2025-04-21 01:43:22', '2025-04-21 01:43:22', 1),
(4, 12, 15, 2, 'Excellent food! Very delicious and well-prepared.', 5, 0, '2025-08-24 00:41:09', '2025-08-24 00:41:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraws`
--

CREATE TABLE `seller_withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` int NOT NULL,
  `withdraw_method_id` int NOT NULL,
  `withdraw_method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdraw_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `charge_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deliveryman` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_withdraws`
--

INSERT INTO `seller_withdraws` (`id`, `seller_id`, `withdraw_method_id`, `withdraw_method_name`, `total_amount`, `withdraw_amount`, `charge_amount`, `description`, `status`, `created_at`, `updated_at`, `is_deliveryman`) VALUES
(1, 1, 1, 'Roket', 50.00, 47.50, 2.50, 'Test purpose', 'approved', '2025-03-16 02:33:14', '2025-03-16 02:34:03', 0),
(2, 1, 1, 'Roket', 50.00, 47.50, 2.50, 'test', 'approved', '2025-03-16 02:35:27', '2025-03-16 02:35:41', 0),
(3, 1, 2, 'Others', 40.00, 36.00, 4.00, 'test', 'rejected', '2025-03-16 02:50:09', '2025-03-16 02:53:02', 0),
(5, 1, 1, 'Roket', 20.00, 19.00, 1.00, 'test', 'approved', '2025-03-16 03:21:06', '2025-10-01 00:32:09', 0),
(6, 1, 1, 'Roket', 20.00, 19.00, 1.00, 'ABCD', 'pending', '2025-09-22 07:45:45', '2025-09-22 07:45:45', 0),
(7, 1, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-09-22 09:22:05', '2025-09-22 09:22:05', 0),
(8, 1, 1, 'Roket', 10.00, 9.50, 0.50, '1', 'pending', '2025-09-23 23:00:01', '2025-09-23 23:00:01', 0),
(9, 1, 2, 'Others', 20.00, 18.00, 2.00, '2', 'pending', '2025-09-27 03:07:59', '2025-09-27 03:07:59', 0),
(10, 1, 2, 'Others', 20.00, 18.00, 2.00, '2', 'pending', '2025-09-27 03:10:50', '2025-09-27 03:10:50', 0),
(11, 1, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-09-27 03:11:03', '2025-09-27 03:11:03', 0),
(12, 1, 1, 'Roket', 10.00, 9.50, 0.50, '1', 'pending', '2025-09-27 03:16:34', '2025-09-27 03:16:34', 0),
(13, 1, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-09-27 04:34:42', '2025-09-27 04:34:42', 0),
(14, 1, 2, 'Others', 59.00, 53.10, 5.90, '2', 'pending', '2025-09-27 04:35:11', '2025-09-27 04:35:11', 0),
(16, 1, 1, 'Roket', 10.00, 9.50, 0.50, '1', 'pending', '2025-09-27 23:21:12', '2025-09-27 23:21:12', 0),
(17, 1, 1, 'Roket', 10.00, 9.50, 0.50, 'ABCD', 'pending', '2025-09-27 23:24:21', '2025-09-27 23:24:21', 0),
(18, 1, 2, 'Others', 1.00, 0.90, 0.10, '2', 'pending', '2025-09-27 23:29:46', '2025-09-27 23:29:46', 0),
(19, 1, 2, 'Others', 0.50, 0.45, 0.05, '2', 'pending', '2025-09-28 00:11:48', '2025-09-28 00:11:48', 0),
(20, 1, 2, 'Others', 0.20, 0.18, 0.02, '2', 'pending', '2025-09-28 00:18:42', '2025-09-28 00:18:42', 0),
(21, 1, 2, 'Others', 0.02, 0.02, 0.00, '2', 'pending', '2025-09-28 00:19:29', '2025-09-28 00:19:29', 0),
(22, 1, 1, 'Roket', 0.01, 0.01, 0.00, '1', 'pending', '2025-09-28 00:22:04', '2025-09-28 00:22:04', 0),
(23, 1, 1, 'Roket', 0.01, 0.01, 0.00, '1', 'pending', '2025-09-28 00:29:49', '2025-09-28 00:29:49', 0),
(24, 1, 1, 'Roket', 0.01, 0.01, 0.00, '1', 'pending', '2025-09-29 04:21:34', '2025-09-29 04:21:34', 0),
(25, 1, 1, 'Roket', 5.00, 4.75, 0.25, '1', 'approved', '2025-10-01 00:39:29', '2025-10-01 00:39:47', 0),
(26, 1, 2, 'Others', 1.00, 0.90, 0.10, '2', 'pending', '2025-10-02 04:22:26', '2025-10-02 04:22:26', 0),
(27, 1, 1, 'Roket', 1.00, 0.95, 0.05, '1', 'pending', '2025-10-06 02:25:07', '2025-10-06 02:25:07', 0),
(28, 4, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-10-08 05:05:59', '2025-10-08 05:05:59', 0),
(29, 7, 2, 'Others', 60.00, 54.00, 6.00, '2', 'approved', '2025-10-08 23:20:25', '2025-10-09 02:11:36', 0),
(30, 7, 2, 'Others', 20.00, 18.00, 2.00, '2', 'pending', '2025-10-09 02:20:05', '2025-10-09 02:20:05', 0),
(31, 7, 2, 'Others', 20.00, 18.00, 2.00, '2', 'pending', '2025-10-09 02:41:11', '2025-10-09 02:41:11', 0),
(32, 7, 2, 'Others', 2.00, 1.80, 0.20, '2', 'pending', '2025-10-09 02:41:37', '2025-10-09 02:41:37', 0),
(33, 7, 2, 'Others', 0.20, 0.18, 0.02, '2', 'pending', '2025-10-09 02:46:47', '2025-10-09 02:46:47', 0),
(34, 7, 1, 'Roket', 2.50, 2.38, 0.13, '1', 'pending', '2025-10-09 02:51:11', '2025-10-09 02:51:11', 0),
(35, 1, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-10-13 04:12:38', '2025-10-13 04:12:38', 0),
(36, 7, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-10-18 21:29:39', '2025-10-18 21:29:39', 0),
(37, 1, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-10-18 22:23:48', '2025-10-18 22:23:48', 0),
(38, 7, 2, 'Others', 50.00, 45.00, 5.00, '2', 'pending', '2025-10-18 22:34:00', '2025-10-18 22:34:00', 0),
(39, 7, 2, 'Others', 10.00, 9.00, 1.00, '2', 'pending', '2025-10-18 22:35:22', '2025-10-18 22:35:22', 0),
(40, 7, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-10-19 01:45:03', '2025-10-19 01:45:03', 0),
(41, 1, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-10-19 02:49:35', '2025-10-19 02:49:35', 0),
(42, 1, 1, 'Roket', 50.00, 47.50, 2.50, '1', 'pending', '2025-10-19 23:32:57', '2025-10-19 23:32:57', 0),
(43, 1, 1, 'Roket', 20.00, 19.00, 1.00, '1', 'pending', '2025-12-09 22:38:19', '2025-12-09 22:38:19', 0),
(44, 1, 2, 'Others', 5.00, 4.50, 0.50, '2', 'pending', '2025-12-10 04:17:37', '2025-12-10 04:17:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `page_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `page_name`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'Foodigo || Buy or Sell your Delicious Food Effortlessly', '<p>Foodigo || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2025-04-21 04:01:01'),
(2, 'Blogs', 'Foodigo || Buy or Sell your Delicious Food Effortlessly', '<p>Foodigo || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43'),
(3, 'About Us', 'About Us', 'About Us', NULL, NULL),
(4, 'Contact Us', 'Contact Us', '<p>Contact Us</p>', NULL, '2024-05-09 04:12:54'),
(5, 'FAQ', 'FAQ', 'FAQ', NULL, NULL),
(6, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', NULL, NULL),
(7, 'Category', 'Category || Buy or Sell your Delicious Food Effortlessly', '<p>Category || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43'),
(8, 'Cuisine', 'Cuisine || Buy or Sell your Delicious Food Effortlessly', '<p>Category || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43'),
(9, 'Offer', 'Offer || Buy or Sell your Delicious Food Effortlessly', '<p>Offer || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43'),
(10, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', NULL, NULL),
(11, 'Restaurant', 'Restaurant || Buy or Sell your Delicious Food Effortlessly', '<p>Restaurant || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43'),
(12, 'Search Page', 'Search Page || Buy or Sell your Delicious Food Effortlessly', '<p>Search Page || Buy or Sell your Delicious Food Effortlessly</p>', NULL, '2024-11-12 21:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'twilio_status', 'inactive', NULL, '2025-05-07 05:35:34'),
(2, 'twilio_sid', 'AC00000000000000000000000000000000', NULL, '2025-05-07 05:35:34'),
(3, 'twilio_auth_token', '00000000000000000000000000000000', NULL, '2025-05-07 05:35:34'),
(4, 'biztech_api_key', 'placeholder_biztech_api_key', NULL, '2025-05-07 02:37:35'),
(5, 'biztech_client_id', '00000000-0000-0000-0000-000000000000', NULL, '2025-05-07 02:37:35'),
(6, 'biztech_sender_id', '8809617609947', NULL, '2025-05-07 02:37:35'),
(7, 'biztech_status', 'inactive', NULL, '2025-05-07 02:37:35'),
(8, 'new_order_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(9, 'order_accept_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(10, 'order_process_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(11, 'order_on_way_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(12, 'order_deliver_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(13, 'order_cancel_to_user', 'active', NULL, '2025-05-07 01:10:28'),
(14, 'default_phone_code', '+880', NULL, '2025-05-07 05:35:34'),
(15, 'twilio_phone_number', '+13254651591', NULL, '2025-05-07 05:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `template_key`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, 'New Order to User', 'new_order_to_user', 'New Order', 'Dear {{user_name}},\r\n\r\nCongratulations! Your order has been placed. Order Id is : #{{order_id}}\r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:22:07'),
(2, 'Order Accept', 'order_accept_to_user', 'Order Accept', 'Dear {{user_name}},\r\n\r\n\r\nYour #{{order_id}} order hase been accepted.\r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:25:05'),
(3, 'Order Processing', 'order_process_to_user', 'Order Processing', 'Dear {{user_name}},\r\n\r\nWe are preparing on your order #{{order_id}}\r\n\r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:26:36'),
(4, 'Order On the Way', 'order_on_way_to_user', 'Order On the Way', 'Dear {{user_name}},\r\n\r\nWe handover your order #{{order_id}} to delivery. our deliveryman will contact to you very soon. \r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:27:59'),
(5, 'Order Delivered', 'order_deliver_to_user', 'Order Delivered', 'Dear {{user_name}},\r\n\r\nWe have successfully delivered your order #{{order_id}}. Thanks for your order. please give us a good feedback in our platform.\r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:29:22'),
(6, 'Order Cancel', 'order_cancel_to_user', 'Order Cancel', 'Dear {{user_name}},\r\n\r\nWe are unable to process your order #{{order_id}}. Please stay with us.\r\n\r\nThank You\r\nQuomodoSoft', NULL, '2025-05-07 01:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `is_verified` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `term_and_conditions`
--

CREATE TABLE `term_and_conditions` (
  `id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_and_conditions`
--

INSERT INTO `term_and_conditions` (`id`, `lang_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'en', '<h4>1. What are Terms and Conditions?</h4>\r\n<p>Foodigo collects various types of information from users, which may include personal details (such as name, contact information, and payment details), device-related data (such as IP address and browser type), and usage information (such as pages visited and actions taken within the platform). Users have the right to access and update their personal information held by Foodigo. This section explains how users can do so and the procedures for making such requests.</p>\r\n<h4>2. Foodigo Terms and Conditions Examples</h4>\r\n<p>Foodigo expects users to conduct themselves responsibly and respectfully while using our platform. This includes refraining from any behavior that may harm or disrupt the experience of other users or violate any laws or regulations. Users are prohibited from engaging in activities such as harassing, intimidating, or defaming others, as well as attempting to access unauthorized areas of the platform or interfering with its operation. Additionally, users must not use Foodigo for any unlawful</p>\r\n<p>Features</p>\r\n<ul>\r\n<li>User Registration and Authentication:</li>\r\n<li>Restaurant Listings and Profiles:</li>\r\n<li>Menu Display and Customization:</li>\r\n<li>Order Placement and Checkout:</li>\r\n<li>Multiple Ordering Channels:</li>\r\n<li>Real-Time Order Tracking:</li>\r\n<li>Payment Gateway</li>\r\n</ul>\r\n<h4>3. Protect Your Property</h4>\r\n<p>Protecting your property is paramount, and we take this responsibility seriously. Our platform employs robust security measures to safeguard your personal information, payment details, and any other data you entrust to us. Through encryption protocols, firewalls, and regular security audits, we strive to prevent unauthorized access, alteration, or disclosure of your information. Additionally, we continuously monitor our systems for any potential threats or vulnerabilities, promptly addressing any issues that may arise. Rest assured that your privacy and security are our top priorities, and we remain committed to maintaining the highest standards of protection for your property.\"</p>\r\n<h4>4. What to Include in Terms and Conditions for Online Stores</h4>\r\n<p>By accessing our website and making purchases, you agree to comply with the following terms and conditions. User accounts are created subject to registration requirements, password protection, and the right to terminate accounts at our discretion. Product listings on our website include accurate descriptions, pricing, and availability details, though we reserve the right to modify or discontinue products without notice. Orders are processed upon confirmation, with payment accepted via approved methods and subject to applicable taxes and fees. Shipping and delivery terms, including estimated times and costs, are outlined in our policies.</p>\r\n<h4>5.Pricing and Payment Terms</h4>\r\n<p>Pricing and Payment Terms are essential components of our service. By utilizing our platform, you agree to the prices listed for products and services, including any applicable taxes or fees. We strive to maintain accurate pricing information, but reserve the right to adjust prices at our discretion. Payments are processed securely through approved methods, such as credit/debit cards, digital wallets, or other designated payment gateways. By providing payment information, you authorize us to charge the designated amount for your purchases.</p>', NULL, '2025-04-21 03:38:26'),
(13, 'bn', '<p>১. শর্তাবলী কী?</p>\r\n<p>Foodigo ব্যবহারকারীদের কাছ থেকে বিভিন্ন ধরণের তথ্য সংগ্রহ করে, যার মধ্যে ব্যক্তিগত বিবরণ (যেমন নাম, যোগাযোগের তথ্য এবং অর্থপ্রদানের বিবরণ), ডিভাইস-সম্পর্কিত ডেটা (যেমন IP ঠিকানা এবং ব্রাউজারের ধরণ), এবং ব্যবহারের তথ্য (যেমন পরিদর্শন করা পৃষ্ঠা এবং প্ল্যাটফর্মের মধ্যে নেওয়া পদক্ষেপ) অন্তর্ভুক্ত থাকতে পারে। ব্যবহারকারীদের Foodigo-এর কাছে থাকা তাদের ব্যক্তিগত তথ্য অ্যাক্সেস এবং আপডেট করার অধিকার রয়েছে। এই বিভাগটি ব্যবহারকারীরা কীভাবে এটি করতে পারেন এবং এই ধরনের অনুরোধ করার পদ্ধতিগুলি ব্যাখ্যা করে।</p>\r\n<p>২. Foodigo শর্তাবলীর উদাহরণ</p>\r\n<p>Foodigo আশা করে যে ব্যবহারকারীরা আমাদের প্ল্যাটফর্ম ব্যবহার করার সময় দায়িত্বশীলতা এবং শ্রদ্ধার সাথে আচরণ করবেন। এর মধ্যে এমন কোনও আচরণ থেকে বিরত থাকা অন্তর্ভুক্ত যা অন্যান্য ব্যবহারকারীদের অভিজ্ঞতার ক্ষতি করতে পারে বা ব্যাহত করতে পারে বা কোনও আইন বা প্রবিধান লঙ্ঘন করতে পারে। ব্যবহারকারীদের হয়রানি, ভয় দেখানো বা মানহানির মতো কার্যকলাপে জড়িত হওয়া, সেইসাথে প্ল্যাটফর্মের অননুমোদিত এলাকায় অ্যাক্সেস করার চেষ্টা করা বা এর কার্যক্রমে হস্তক্ষেপ করা নিষিদ্ধ। অতিরিক্তভাবে, ব্যবহারকারীদের কোনও অবৈধ কাজের জন্য Foodigo ব্যবহার করা উচিত নয়</p>\r\n<p>বৈশিষ্ট্য</p>\r\n<p>ব্যবহারকারী নিবন্ধন এবং প্রমাণীকরণ:</p>\r\n<p>রেস্তোরাঁর তালিকা এবং প্রোফাইল:</p>\r\n<p>মেনু প্রদর্শন এবং কাস্টমাইজেশন:</p>\r\n<p>অর্ডার প্লেসমেন্ট এবং চেকআউট:</p>\r\n<p>একাধিক অর্ডারিং চ্যানেল:</p>\r\n<p>রিয়েল-টাইম অর্ডার ট্র্যাকিং:</p>\r\n<p>পেমেন্ট গেটওয়ে</p>\r\n<p>৩. আপনার সম্পত্তি রক্ষা করুন</p>\r\n<p>আপনার সম্পত্তি রক্ষা করা অত্যন্ত গুরুত্বপূর্ণ এবং আমরা এই দায়িত্বটি গুরুত্ব সহকারে নিই। আমাদের প্ল্যাটফর্ম আপনার ব্যক্তিগত তথ্য, অর্থপ্রদানের বিবরণ এবং আমাদের উপর আপনার আস্থা রাখা অন্য যেকোনো ডেটা সুরক্ষিত রাখার জন্য শক্তিশালী নিরাপত্তা ব্যবস্থা ব্যবহার করে। এনক্রিপশন প্রোটোকল, ফায়ারওয়াল এবং নিয়মিত নিরাপত্তা নিরীক্ষার মাধ্যমে, আমরা আপনার তথ্যের অননুমোদিত অ্যাক্সেস, পরিবর্তন বা প্রকাশ রোধ করার চেষ্টা করি। অতিরিক্তভাবে, আমরা যেকোনো সম্ভাব্য হুমকি বা দুর্বলতার জন্য আমাদের সিস্টেমগুলিকে ক্রমাগত পর্যবেক্ষণ করি, উদ্ভূত যেকোনো সমস্যা তাৎক্ষণিকভাবে সমাধান করি। \"নিশ্চিত থাকুন যে আপনার গোপনীয়তা এবং সুরক্ষা আমাদের সর্বোচ্চ অগ্রাধিকার, এবং আমরা আপনার সম্পত্তির সুরক্ষার সর্বোচ্চ মান বজায় রাখতে প্রতিশ্রুতিবদ্ধ।\"</p>\r\n<p>৪. অনলাইন স্টোরের জন্য শর্তাবলীতে কী অন্তর্ভুক্ত করবেন</p>\r\n<p>আমাদের ওয়েবসাইট অ্যাক্সেস করে এবং কেনাকাটা করে, আপনি নিম্নলিখিত শর্তাবলী মেনে চলতে সম্মত হন। ব্যবহারকারীর অ্যাকাউন্টগুলি নিবন্ধনের প্রয়োজনীয়তা, পাসওয়ার্ড সুরক্ষা এবং আমাদের বিবেচনার ভিত্তিতে অ্যাকাউন্ট বন্ধ করার অধিকার সাপেক্ষে তৈরি করা হয়। আমাদের ওয়েবসাইটে পণ্য তালিকাগুলিতে সঠিক বিবরণ, মূল্য নির্ধারণ এবং প্রাপ্যতার বিবরণ অন্তর্ভুক্ত রয়েছে, যদিও আমরা নোটিশ ছাড়াই পণ্যগুলি পরিবর্তন বা বন্ধ করার অধিকার সংরক্ষণ করি। অর্ডারগুলি নিশ্চিতকরণের পরে প্রক্রিয়া করা হয়, অনুমোদিত পদ্ধতির মাধ্যমে অর্থ প্রদান গৃহীত হয় এবং প্রযোজ্য কর এবং ফি সাপেক্ষে। আনুমানিক সময় এবং খরচ সহ শিপিং এবং ডেলিভারি শর্তাবলী আমাদের নীতিতে বর্ণিত আছে।</p>\r\n<p>৫. মূল্য নির্ধারণ এবং অর্থ প্রদানের শর্তাবলী</p>\r\n<p>মূল্য নির্ধারণ এবং অর্থ প্রদানের শর্তাবলী আমাদের পরিষেবার অপরিহার্য উপাদান। আমাদের প্ল্যাটফর্ম ব্যবহার করে, আপনি পণ্য এবং পরিষেবার জন্য তালিকাভুক্ত দামের সাথে সম্মত হন, যার মধ্যে প্রযোজ্য কর বা ফি অন্তর্ভুক্ত। আমরা সঠিক মূল্য নির্ধারণের তথ্য বজায় রাখার চেষ্টা করি, তবে আমাদের বিবেচনার ভিত্তিতে মূল্য সমন্বয় করার অধিকার সংরক্ষণ করি। ক্রেডিট/ডেবিট কার্ড, ডিজিটাল ওয়ালেট, অথবা এর মতো অনুমোদিত পদ্ধতির মাধ্যমে অর্থ প্রদান নিরাপদে প্রক্রিয়া করা হয়। অন্যান্য মনোনীত পেমেন্ট গেটওয়ে। পেমেন্ট তথ্য প্রদান করে, আপনি আমাদের আপনার ক্রয়ের জন্য নির্ধারিত পরিমাণ চার্জ করার অনুমতি দিচ্ছেন।</p>', '2025-04-29 03:55:32', '2025-12-09 00:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `logo`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, NULL, 'uploads/custom-images/john-doe-20240509054208.png', 'active', '2024-05-08 23:42:08', '2024-05-08 23:42:08'),
(6, NULL, 'uploads/custom-images/david-simmonsss-20240509054711.png', 'active', '2024-05-08 23:47:11', '2024-05-08 23:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_trasnlations`
--

CREATE TABLE `testimonial_trasnlations` (
  `id` bigint UNSIGNED NOT NULL,
  `testimonial_id` int NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_trasnlations`
--

INSERT INTO `testimonial_trasnlations` (`id`, `testimonial_id`, `lang_code`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(3, 5, 'en', 'John Doe', 'Senior Chef', 'Comment *', '2024-05-08 23:42:08', '2024-05-08 23:42:08'),
(4, 6, 'en', 'David Simmonsss', 'Web Developer', 'test', '2024-05-08 23:47:11', '2024-05-08 23:47:11'),
(13, 5, 'fr', 'John Doe', 'Senior Chef', 'Comment *', '2024-05-12 03:02:01', '2024-05-12 03:02:01'),
(14, 6, 'fr', 'David Simmonsss', 'Web Developer', 'test', '2024-05-12 03:02:01', '2024-05-12 03:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `slot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `slot`, `status`, `created_at`, `updated_at`) VALUES
(2, '10:00 AM - 12:00 PM', 'enable', '2024-09-06 20:58:23', '2024-09-06 20:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `verification_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forget_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `readable_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `image`, `phone`, `address`, `verification_token`, `forget_password_token`, `is_banned`, `readable_id`) VALUES
(1, 'Richard H', 'user@gmail.com', '2025-03-16 01:06:07', '$2y$10$1RxGTNoDRyIb8AP1fc.YcOSRt.TjdS6/Llpe0ZQhV.uFO2nQI8JZO', NULL, '2025-03-16 01:06:07', '2025-12-13 04:48:38', 'enable', 'uploads/users/1760350009.jpg', '+12345678', 'Mirpur, Dhaka, Banglades', 'BkyGj0xRpxT5mxTNKgNJc6W1Ho0KIlrFnsFPdJ4JELBZL2xS3PDWWXqVdmNv7VxR1Bk42GVZxXPozGevb94YyWFg0ZXL2nL1GTWy', NULL, 'disable', '100000'),
(12, 'John Doe', 'karami7306@colimarl.com', '2025-08-16 13:01:16', '$2y$10$Q3u6SPIzc.fSQAeF1ebpseNUZ9QE25c7ZiqEQ97n5vNOg9Ch94wsi', NULL, '2025-08-16 06:39:27', '2025-09-27 22:46:28', 'enable', NULL, '+1234567890', 'Dhaka Bangladesh', NULL, NULL, 'disable', '100001'),
(14, 'John Test', 'test@gmail.com', NULL, '$2y$10$6x5YC69VE5TEIn0jp.B6ne1agT6LciWmItkdjnLPHRa.p7t6W95g2', NULL, '2025-08-26 07:59:05', '2025-08-26 07:59:05', 'enable', NULL, '+1234567899', NULL, '25xQ4vEWbm06iyoCWDJm6dpaFo7pPJtnfY0ZgJab7YsNRpXAIBv0GCeH8uYeGLcX2m1Ap1WintNt2KWlzMeaJZeatRlveuIMigyg', NULL, 'disable', '100002'),
(20, 'Custom Menu1', 'woboho9491@ahanim.com', NULL, '$2y$10$smptbMTySD8TqOiKAdrICuTOAFFS4n3IZrKzAjxO6TKwE.K0jQz8a', NULL, '2025-08-28 08:13:10', '2025-08-28 08:13:10', 'enable', NULL, NULL, NULL, '7wJW8jh3XDhNxz6kMj0BSWXfERzkiDyKioFuoEANpyqTyZW1QPXlw0XUM6DEdIeYtXNzURTFxzvBBJvr7lLVj0QYolJZFSnj22XL', NULL, 'disable', '100003'),
(21, 'Custom Menu1', 'rolego5249@cavoyar.com', NULL, '$2y$10$UIFTd08razXrYm/S0mRw5OmpkvEp87PMlRXR5mfZtrUdWecK9IsSO', NULL, '2025-08-29 21:19:51', '2025-08-29 21:22:33', 'enable', NULL, NULL, NULL, 'c2dM9v9DuVXArsyfOTrfaBoj1YJrRpOyB6Bwytvx30qJVOzQs3ELpSpBTFyVjr61pJ4Blc2y8dYNqGnMiVAqvEA3fEukqPphMJe9', 'q0bWwc3lYgikmAobznBLBPp4Erlg3GyHdyc8d5zSBoMCbN3Z2HiNSOUEBix8CBx8k2WA6t4PSoX5NXHgAkYfUhxMY7ormWuXmVie', 'disable', '100004'),
(28, 'John Doe', 'karami87306@colimarl.com', NULL, '$2y$10$Ng7oR2VchM8wzK8sbdGZE.gB/jd754zFW9Y4sXHLLU2IfX98rXIHy', NULL, '2025-09-03 02:53:52', '2025-09-03 02:53:52', 'enable', NULL, '+12349567890', NULL, 'MGLsTyIcNGAxTWYGf4ZKZyUDLQZ49J4WzEGXkUrX892vDL0DPDOMIwivkhcE0681dpq0wAZxsFoo4Vq8NLUrmnVzbNailKeqTnay', NULL, 'disable', '100005'),
(31, 'Ibrahm', 'ibrahim@gmail.com', NULL, '$2y$10$cOJdN3aETLhLwBYfXjnH9OOEdPSVwDuHKV2tggFRXHT2HvvUXQg4y', NULL, '2025-09-03 20:41:55', '2025-09-03 20:41:55', 'enable', NULL, '01751800957', NULL, '750A5nIdN4x6XAjp7ImZOaPCAgFTck3LMMtY7cS5BNas3vcfPWM6xBdtN4jdJ8hBeM9tPejV107vXwaBV3kzIw9iqVin9ioA9rUW', NULL, 'disable', '100006'),
(32, 'kepe', 'kepec85518@lespedia.com', NULL, '$2y$10$hKHnlv04RQsuKSVmTyc1Uez1xpOFRq50bx1J5VkazFn6PnHgmQTIS', NULL, '2025-09-03 22:03:03', '2025-09-03 22:03:03', 'enable', NULL, NULL, NULL, 'pckVcykVNGN5l1CxDCxbtF4I38ZBEUTzl2CAoT9EkEyeXKldL1GdALTpUR0Jt7AI88eelBwCncOONbB5rgPtlF2kOYeDJgQgacGR', NULL, 'disable', '100007'),
(33, 'test', 'tes1t@gmail.com', NULL, '$2y$10$GgXT570JDfs8J8NDEko1leiAUM3OJV4IDUyrUZG8CqfcLRPb.08JG', NULL, '2025-09-03 22:14:39', '2025-09-03 22:14:39', 'enable', NULL, NULL, NULL, 'ux8r5tzDO7GvfkTyc7bHmS049uufIeSu7Iqhla1FM6aAELkuQYJmRrYTS6bOy2rZVOpJx7YTVJZNvztmWizNQmEmtOljwH0WSHXm', NULL, 'disable', '100008'),
(34, 'test', 'tes1@gmail.com', NULL, '$2y$10$StrMxOYq.KXBDhfWKKMEiuDmOBVYPxWmAbxoR6jisKmYlmuZU3mGi', NULL, '2025-09-03 22:16:50', '2025-09-03 22:16:50', 'enable', NULL, '1414', NULL, 'D3g2XY8ooaKQRwEmrzMcELaOfYQaDVHyyQL5W5ZfxBT8ONv6Fliejbev77Zu6s8UZllbXskukCov3zcf6r8FlJrJcd88ipcvtkiG', NULL, 'disable', '100009'),
(38, 'Ibrahm', 'ibrahm@gmail.com', NULL, '$2y$10$S71dTEebUTchzoqP5EDFi.4v6mRK5T32Oj0VS0N/lsKfngmKABBNO', NULL, '2025-09-03 22:17:36', '2025-09-03 22:17:36', 'enable', NULL, '0175180097', NULL, 'UKAem2MKd9d2GlcC9w4aj0MKFnimwN7Fs8GHmr055L4ZfSbFDOkZii4rh35A9eIi54AkeTwpksmM7owtJdiqzgpBxZmZum5bIF8o', NULL, 'disable', '100010'),
(41, 'Test', 'tekfjdf@gmail.com', NULL, '$2y$10$nivfuaef.Z77xqlv.2Zec.BQy4sYlQo5Wi/RFMcWmRVslc4.gENPa', NULL, '2025-09-03 22:18:20', '2025-09-03 22:18:20', 'enable', NULL, '555656565', NULL, 'cZMDCc0eHCk4qvPw17TM1bUSTGZrnzp47GJLLTCokeDa2xX1KyxIVOI9ESmSlS5oVHOajnz6eQib3ZdJ9Wqe4DuZTIEqccOAIdHS', NULL, 'disable', '100011'),
(43, 'Test', 'abc@gmail.com', NULL, '$2y$10$HNzD4MKWFY18A7T3tQmLc.9NTAhqHIL9aOetuynl.QgaJ1/i/qsia', NULL, '2025-09-03 22:20:39', '2025-09-03 22:20:39', 'enable', NULL, '54455', NULL, 'zDJkzGA7FaprUXRwLi26gFv0TyKSDf9DC1O357utIYoQkF2MN6tJdAwlWfFcLrGYiGc6L83DoIH5uw6sa8jUy6KBUAbvB6jjq9ic', NULL, 'disable', '100012'),
(44, 'Ibrahim', 'hibixa9958@lespedia.com', NULL, '$2y$10$WnioW51C/WBApcWDiWDc9O7ba5C6fsdIT9DY9ZUSWO7f7e.wkR8gm', NULL, '2025-09-03 22:37:13', '2025-09-03 22:37:13', 'enable', NULL, '01789656', NULL, 'yG3SDBcCWSwlzwDgl50tl8AJGMaN70fZdXqClZtsSeHGqEkmAI4m9eBhhMySTaOPGHnRC9CQeteRiFrjikuHE3sWGkDZwZiB9Ek6', NULL, 'disable', '100013'),
(45, 'fine', 'finek81966@lespedia.com', NULL, '$2y$10$CZOf5ILPPMHkVJmLBDC2pOoDUf9t5Ah0AIqDZ8hS2dSgtar2crwH6', NULL, '2025-09-03 22:39:53', '2025-09-03 22:39:53', 'enable', NULL, '1236548', NULL, '5b7YdEYNlB5oQAHSvu8tTV8RwPZ2XLHJPC2X0A0nKLAQHFbs3mvsrCro7yEKbaDFprNtOuRdiFwNHu5c9mPvSyez3jKVWyCeWJEy', NULL, 'disable', '100014'),
(46, 'xopo', 'xoporas625@mogash.com', NULL, '$2y$10$6AafzoxgJW1ZuLRq49TjGuTRkb9cFVK7gLUmhFIwKAV2Z6P4DgGme', NULL, '2025-09-03 22:48:41', '2025-09-03 22:48:41', 'enable', NULL, '123456', NULL, 'oHosk0sffmfSYAUfgRR53pm9KiuLHjLrBIYuMgYiGck1bwP6ck60CLkLRyxR4SeAJjkwA12w6wN0rer13EuWjrWt6tBCSFht4YVe', NULL, 'disable', '100015'),
(47, 'xogo', 'xogowo1973@mogash.com', NULL, '$2y$10$zQM.HK34AqIfQlfZC4erU.q5bnywdNkFS/fCUvfC0b3Z4xHD050sy', NULL, '2025-09-03 22:51:16', '2025-09-03 22:51:16', 'enable', NULL, '1234', NULL, 'VWjNjEO1kvCcYcpO6adPNVNU4NMRcnCBxSsCTdSuurgaB16j38mc0QdDo9JGibfbIZk0vr5luJlNj24zQXI0t4xfLoHcNdez9SAr', NULL, 'disable', '100016'),
(51, 'Ibrahm', 'ibfrahm@gmail.com', NULL, '$2y$10$/1i3WRd64OHFOlqHmInQdexq4wMZQkrs9ZgueH08LbInotjRdQOeC', NULL, '2025-09-03 22:53:56', '2025-09-03 22:53:56', 'enable', NULL, '017518097', NULL, 'qWH02sZLqIA7ROwbpVheENxoGf0f7yN2vQlUn8KcOj6v9FX3XPSBUVJ2ji1xgfhP2wYBnaXO0Jl9uDtW2BDpD58NQJiwi29yQFyn', NULL, 'disable', '100017'),
(52, 'rirax', 'riraxo6162@mogash.com', NULL, '$2y$10$4eMcGR.0QE8NErzcr8vwv.YkXSaG6LdKTLXMkxKt2tR43sTtsLSyu', NULL, '2025-09-03 22:54:46', '2025-09-03 22:54:46', 'enable', NULL, '012365487', NULL, 'QAgdUl0ptuFJdD9c75IMZn5ObEPGU9EHt3U548iuXkhzPfJjL3D5hNVG40C2WZhudM5B4I0QZxWLWGiEIdyYfNbpvAIXEJSc3cct', NULL, 'disable', '100018'),
(53, 'vefav', 'vefav22103@mogash.com', NULL, '$2y$10$QrzshpVIh.tVh52Rpz0Jf.ywEIzactHWdnuli.3AZ9hV5Bctp/.0S', NULL, '2025-09-03 22:57:39', '2025-09-03 22:57:39', 'enable', NULL, '01265487', NULL, 'Q5JE7yOJWRMAuXpVJtF1opn4UD6Zpgkc7Nwei6AEncnCnHBMCo5oHi8vMlTbe0TBJs0iehZALFvaQuPksOuNX5AMnivlETwzZkpR', NULL, 'disable', '100019'),
(54, 'ginor', 'ginor28871@lespedia.com', NULL, '$2y$10$XLRRrCv9iyQqMd.xL9dMIeGwDNunD5i6QY5qWADi/lDe7AjvFSy96', NULL, '2025-09-03 23:00:09', '2025-09-03 23:00:09', 'enable', NULL, '012654', NULL, 'NbbqSRagWRpjF4DGKL1WPyGcwqbbEkw0MW63JjjIPwR0TmnVrXSImQc3k5enUUMNPJ6i3sYXxhZ8aARfiUxZv069pyHfr7Fk22C2', NULL, 'disable', '100020'),
(55, 'sore', 'sorebeg583@lespedia.com', '2025-09-03 23:07:01', '$2y$10$PneaVr8lCkRC0uUiOv7Yw.KuLdREw1gINISGC.rZlWl2KBZqP4a9u', NULL, '2025-09-03 23:06:44', '2025-09-03 23:07:01', 'enable', NULL, '01236487', NULL, NULL, NULL, 'disable', '100021'),
(56, 'kago', 'kagola1284@lespedia.com', '2025-09-03 23:21:53', '$2y$10$agUctvTP/e7MgFQV433LguT6CXB6eSjfSOG2bFEhuoUMUsPBy4A6K', NULL, '2025-09-03 23:21:33', '2025-09-03 23:21:53', 'enable', NULL, '012364', NULL, NULL, NULL, 'disable', '100022'),
(57, 'kive', 'kivem69117@lespedia.com', '2025-09-03 23:51:00', '$2y$10$zMfBHmX4bFnb8ahriRV6FOWPGFCx1zS.NenJ9ydIOmJdBC4O3hm3e', NULL, '2025-09-03 23:50:39', '2025-09-03 23:51:00', 'enable', NULL, '01236598', NULL, NULL, NULL, 'disable', '100023'),
(58, 'xofi', 'xorif76325@lespedia.com', NULL, '$2y$10$JbwnM8TDtJXPDPe7iynlceIGqJbKOY2MmZXZg1XTfNdMS07qe6H3y', NULL, '2025-09-03 23:55:26', '2025-09-03 23:55:26', 'enable', NULL, '015565', NULL, 'GmMc9HGp96gP8kXKMzYGYqG84b12X66aFtno0iFOWVVHmGETs37ea9eaeFKPyZxyO2jyALY2krfyN84xyAZU2GrNeDEAH4CLzUpO', NULL, 'disable', '100024'),
(59, 'vicole', 'vicolew746@mogash.com', NULL, '$2y$10$vlQijwCMbbDVtnnbDYFQj.CcotU1w.swjAhLySbKab5ba5NXjCKAu', NULL, '2025-09-04 00:16:40', '2025-09-04 00:16:40', 'enable', NULL, '01265988', NULL, 'M8JmJYGilgv4ECJkbz0MwQWyeI0FAXyl9k41wjovABp0OKJqaJvyHorvkeHdSkB10Cof5I3EQFaKJtOCxwMClmNXmktZ3ftclARF', NULL, 'disable', '100025'),
(60, 'did', 'didox52217@mogash.com', NULL, '$2y$10$wIO.gcxpgfGL1OgrKt3/Je/OWjeDhlBBotXW6FlgqGI0uSqty6eDS', NULL, '2025-09-04 00:19:27', '2025-09-04 00:19:27', 'enable', NULL, '0126598745', NULL, 'Y1y6gFuCU71KgWlGc4q439zTlgtNIlcDHLFwveF9B7l9P9xbzK2fb3ptZaDqrktfEx2CbFcrUJ1dkfXpShd2k3pxCu2sM82TPF49', NULL, 'disable', '100026'),
(61, 're', 'rawiye1621@lespedia.com', NULL, '$2y$10$5gJR0oKvPuTbv5eNkms5HeKlerwbCPi..j2rJj7Sj7xZKuJcy0MZu', NULL, '2025-09-04 00:23:04', '2025-09-04 00:23:04', 'enable', NULL, '012598855', NULL, 'jKtGI5RljVr34zb0Vml997ManqRdxsXAlOzv9YcufRwYtnAqi1tz09BRE0ogR3ZghWmoHGbWJTm2FFcVtej4TVS0BqwF2gbTymGg', NULL, 'disable', '100027'),
(62, 'toke', 'tokew17646@mogash.com', NULL, '$2y$10$l6aDnwvmFVADVPzQQEp./.N9aRRPOiiPwowBzSRLIH72dHnnZIt6.', NULL, '2025-09-04 00:33:54', '2025-09-04 00:33:54', 'enable', NULL, '0123659874', NULL, 'YwypESJ7IfvOVq4bwREyARusXp9Ifr3dNATs9xVodUpyMUUVHTTU0SfRCJhZzZRp5FcaojFdzVHNj4afqcxeIrdKgnvfyamd9T5o', NULL, 'disable', '100028'),
(63, 'toke', 'pomip60677@lespedia.com', NULL, '$2y$10$H6IJ0293KsRPIKtLNBgzfegDrmN19SzF/I9VDW2SgYxlIcqJSrT7q', NULL, '2025-09-04 00:37:33', '2025-09-04 00:37:33', 'enable', NULL, '012365987', NULL, 'vsPv5YmPgm30MM4ifoL30NwS3VJuA2xDYtMGScxZ4x96lQmzJiv1uAxU0NW6fy0iYGAUWrjcvI4m45Op12F7vkYp6uvtoxaoSZAE', NULL, 'disable', '100029'),
(64, 'voco', 'vocowe9910@lespedia.com', '2025-09-04 00:54:26', '$2y$10$oUf9/w1/ZPeu7Bd0Kx5q8Oybu.G.denOCQEy6jz26lBFBQHP/Qxue', NULL, '2025-09-04 00:53:36', '2025-09-04 00:54:26', 'enable', NULL, '0123658', NULL, NULL, NULL, 'disable', '100030'),
(65, 'neda', 'nedaxe1005@mogash.com', '2025-09-04 02:12:59', '$2y$10$N3zkWgfvgccCnd1BGrhMNO7nIM64IO8BP8ln.COMPPEgLvy0TOckm', NULL, '2025-09-04 02:12:45', '2025-09-04 02:12:59', 'enable', NULL, '0145987', NULL, NULL, NULL, 'disable', '100031'),
(66, 'bij', 'bijari7634@lespedia.com', '2025-09-04 03:09:31', '$2y$10$E6zNUmVTqHTeo0noQAIEaOXEzpnBXcJE1nbHF7ENWiNJXEyH2Ao0G', NULL, '2025-09-04 03:09:09', '2025-09-04 03:09:31', 'enable', NULL, '0147895632', NULL, NULL, NULL, 'disable', '100032'),
(67, 'wefida', 'wefida7728@mogash.com', '2025-09-04 03:11:37', '$2y$10$2uUVfNp5WZyzOBXvEgQhpeqNKBCFdwFJyoTqOoqxY/ksSIYYi9WoG', NULL, '2025-09-04 03:11:16', '2025-09-04 03:11:37', 'enable', NULL, '01254789632', NULL, NULL, NULL, 'disable', '100033'),
(71, 'John Doe', 'karamif7306@colimarl.com', NULL, '$2y$10$fr1Th4fMDMfj8CoNj2bBv.xHD2awCEG3DV1b5b0hIj8vTDgXoLgji', NULL, '2025-09-04 03:23:33', '2025-09-04 03:23:33', 'enable', NULL, '+12348567890', NULL, 'MGHnx1zg032S6KeXOF4UJAohKdJ74LJpdvs2h0MMiVAbbyZwbdtGGdNJpgPADShjHOpuKuozIv3BD2WUpb0xGWlvnUUZjcvGKqlv', NULL, 'disable', '100034'),
(72, 'wotiw', 'wotiw63550@mogash.com', '2025-09-04 03:24:39', '$2y$10$IS2QNKWzd8Ju48dUtmgGzeD2ZDhYaNKvgkdewkPezKxWp.z21Uana', NULL, '2025-09-04 03:24:21', '2025-09-04 03:24:39', 'enable', NULL, '01265985222', NULL, NULL, NULL, 'disable', '100035'),
(73, 'gake', 'gakejos716@mogash.com', '2025-09-04 03:36:43', '$2y$10$BrlOcnoWUywbOgA/RRvWcOvblZwMssAZwAi3MyZaqujT5AF2sovHe', NULL, '2025-09-04 03:36:25', '2025-09-04 03:36:43', 'enable', NULL, '012', NULL, NULL, NULL, 'disable', '100036'),
(74, 'yiva', 'yivajec344@mogash.com', '2025-09-04 03:39:46', '$2y$10$FlBlHkZ7TCexHYBsEA76EO0AFkWnlnpanJtlbRP.sYCQLuNCTwcrG', NULL, '2025-09-04 03:39:25', '2025-09-04 03:39:46', 'enable', NULL, '0111223', NULL, NULL, NULL, 'disable', '100037'),
(75, 'lapip', 'lapipe4265@lespedia.com', '2025-09-04 03:45:51', '$2y$10$rpIHpC1ObJS/h2Dqq8nIhObjUJInQjvcd9T6EyDbSzuajALLCjU4.', NULL, '2025-09-04 03:45:33', '2025-09-04 03:45:51', 'enable', NULL, '02233655', NULL, NULL, NULL, 'disable', '100038'),
(76, 're', 'relew22004@lespedia.com', '2025-09-04 04:15:32', '$2y$10$as93uBICWnMkqZ.drlKy8eXDPjmPwsO4BWt7Iw8V6bSxxMqyhx0k2', NULL, '2025-09-04 04:15:19', '2025-09-04 04:15:32', 'enable', NULL, '0111223333', NULL, NULL, NULL, 'disable', '100039'),
(77, 'ff', 'jilijay655@mogash.com', '2025-09-04 04:25:18', '$2y$10$TCBhGuCRFVmNZJXgxm0zceo/eswZaLbT7CZ2Q64xSAp3xARhjLc/W', NULL, '2025-09-04 04:24:57', '2025-09-04 04:25:18', 'enable', NULL, '01478888', NULL, NULL, NULL, 'disable', '100040'),
(78, 'mow', 'mowija7509@mogash.com', NULL, '$2y$10$fbqGcg7LE6ek4aObBurK7.ICXSE3o8AuSTAdeqtQCAVBRA6uWGIkO', NULL, '2025-09-04 04:43:07', '2025-09-04 04:43:07', 'enable', NULL, '0123666999', NULL, 'hMITgZTZvl7kRIQ3GmY2OZbl061YMzKqtCJuHYN8gZGmxrxjz9HdpEa1pyLavarjvOpxR0EQ1M4XCmdn6BE6DPNKbsHr2YWbiSEK', NULL, 'disable', '100041'),
(79, 'nanav', 'nanavif647@mogash.com', NULL, '$2y$10$uUDy7VTaL3KW2LrtIHVaHuYWa6Rb4a65BZIu6dM7p3vEtSz/wxd..', NULL, '2025-09-04 04:46:40', '2025-09-04 04:46:40', 'enable', NULL, '0147777', NULL, 'kpgEZb9pwDAI6v9eWOa3Lb61Lz2IkOSXG4oe1yqhCKnuJhd9HesrKPBtsitrk1QWgFlfWEPsmZMXeGVmzGSLPQguFplkU4jfPgSu', NULL, 'disable', '100042'),
(80, 'notire', 'notire7562@lespedia.com', '2025-09-04 04:49:04', '$2y$10$KawP4psR8RJSa.HrS9tuDeoLRrOCSG4PLkY3Sb/OnJC1gBERpmokm', NULL, '2025-09-04 04:48:50', '2025-09-04 04:49:04', 'enable', NULL, '011122555', NULL, NULL, NULL, 'disable', '100043'),
(81, 'rede', 'redey65740@cspaus.com', '2025-09-05 20:31:42', '$2y$10$Er/pIOvKwkhHfzTY.EjTxey4pBu0y8AkGWLQ0BYvEcEx8rXxjPVj6', NULL, '2025-09-05 20:31:22', '2025-09-05 20:31:42', 'enable', NULL, '0124986', NULL, NULL, NULL, 'disable', '100044'),
(82, 'la', 'lapitij438@certve.com', '2025-09-06 03:53:50', '$2y$10$/OgJdN2k3vchFaQayWZiG.6LZYy8SXbouZg5i/gYBBvIK2RVGkQDG', NULL, '2025-09-06 03:53:30', '2025-09-06 03:53:50', 'enable', NULL, '023578', NULL, NULL, NULL, 'disable', '100045'),
(83, 'sixan', 'sixano1796@cspaus.com', '2025-09-06 04:19:49', '$2y$10$Ymv4n.gZkZ01NZy3FFvy8eKAJGx9reoSRu/RviAYR3pqVt7p6nVPm', NULL, '2025-09-06 04:19:22', '2025-09-06 04:19:49', 'enable', NULL, '014689', NULL, NULL, NULL, 'disable', '100046'),
(84, 'bahe', 'bahef30031@cspaus.com', '2025-09-06 04:34:31', '$2y$10$L3F21NzgsIKJAF3LJqqWeO2Bf7iyPpRhej2xiqTTb2a5rODO1DRE2', NULL, '2025-09-06 04:34:09', '2025-09-06 04:34:31', 'enable', NULL, '09876544', NULL, NULL, NULL, 'disable', '100047'),
(85, 'pil', 'pilajiy714@certve.com', '2025-09-06 04:56:12', '$2y$10$lD6n7i90sVt32rdED4HqQ..55/zuhdjjEiSq42n02MZ.nM4tL3k02', NULL, '2025-09-06 04:55:48', '2025-09-06 04:56:12', 'enable', NULL, '098654', NULL, NULL, NULL, 'disable', '100048'),
(86, 'pedo', 'pedote1691@certve.com', NULL, '$2y$10$lR3F44MA.EjEAfC6fV4gGO/GbC3bUcKNz/3pxGiT8PATTb7vGnZnq', NULL, '2025-09-06 04:59:47', '2025-09-06 04:59:47', 'enable', NULL, '0246854', NULL, 'Rce2pL8CkuB7rr2BSbr2AhGHLxrJmyj7OpPHJ45AHlg9zgqxBY2tUPCVSTk2r8oXgFEg5JyfTNEpjBpfJXWirVahqc1rLSwaMqOF', NULL, 'disable', '100049'),
(88, 'John Doe', 'karami736@colimarl.com', NULL, '$2y$10$3qGgneIuf5O/xl5Ufjvrm.xPLzoQAJSVmRoyltHIntWRzYL7KpGk2', NULL, '2025-09-06 07:54:52', '2025-09-06 07:54:52', 'enable', NULL, '+123456789', NULL, 'xRdLxLT0Z7GmgFDMrp4DHrQcCnc760iJBqfHgnmtxXYhL53ZMNOD9F6tlFxpLpPv2XcuBTX1IO8UNdI5Gjt0YvRe2yMdTehiHoZ1', NULL, 'disable', '100050'),
(89, 'ghh', 'fh@gmail.com', NULL, '$2y$10$KWe3CKGZv78BoZTaUtQNZuTd0pbpjzr5LbeGKr98Xa.frKTmyAglu', NULL, '2025-09-06 21:22:03', '2025-09-06 21:22:03', 'enable', NULL, '012656', NULL, 'X4nKqFqR9lZciCQT68UTQ5PM6NkSwjiFLRqBNBq14I1XJ9U1dWNDOdggf6MxWNglPMk7QSrmm4hOcmFTBbIFK4tOR8L4IfZCkROw', NULL, 'disable', '100051'),
(90, 'rolajoj', 'rolajoj880@knilok.com', '2025-09-06 21:29:54', '$2y$10$MPs1yydYbJ7hfQO124C60.M.JYXv04.K3BWt0SXgdGnMR/HvdVmFu', NULL, '2025-09-06 21:29:26', '2025-09-06 21:29:54', 'enable', NULL, '012365989', NULL, NULL, NULL, 'disable', '100052'),
(91, 'delos', 'delos63382@inupup.com', '2025-09-06 21:32:03', '$2y$10$n0MUY7q964PF1Gigck1Qr.d8WwXHkCnOjSuKj8b3/ANOFTVUguWOe', NULL, '2025-09-06 21:31:07', '2025-09-06 21:32:03', 'enable', NULL, '0121212', NULL, NULL, NULL, 'disable', '100053'),
(92, 'sovilen', 'sovilen194@knilok.com', '2025-09-06 22:18:10', '$2y$10$WhqYMpiqSQZR2urrUVFGc.eAYYkwKqGAMbnOQeIjvsxa10lkDSOxK', NULL, '2025-09-06 22:17:50', '2025-09-06 22:18:10', 'enable', NULL, '0123656', NULL, NULL, NULL, 'disable', '100054'),
(93, 'darogo', 'darogot440@knilok.com', '2025-09-06 22:36:45', '$2y$10$9OlsQpV0ScfSBH3OggrmmOKHv0MOPYUmWbmInuE4bHXgQRi3AnPCC', NULL, '2025-09-06 22:36:33', '2025-09-06 22:36:45', 'enable', NULL, '011112222', NULL, NULL, NULL, 'disable', '100055'),
(94, 'John Doe', 'karami76@colimarl.com', NULL, '$2y$10$BpW8oaW0kT9.1Cdwi0wxmuoDIAIPTfPRE3aNMaX.A9NcNh1kIJa7G', NULL, '2025-09-07 04:34:28', '2025-09-07 04:34:28', 'enable', NULL, '+12345690', NULL, 'NIrZJ3cn1Qmto9ky9LR114a6APzfXOWoXqgXK0cnNvti34y5rvZOUM27reI99KKWP07Ls37Tm3OB58x59HLVNEHOFbLChJiywXFY', NULL, 'disable', '100056'),
(95, 'haxi', 'haxisiy726@inupup.com', '2025-09-08 22:06:01', '$2y$10$teYEFPqQqrgBdiGCIA22wOjt/l12oMOcNGgF9vwb0tkVwTDhUvJGW', NULL, '2025-09-08 22:05:47', '2025-09-08 23:38:53', 'enable', NULL, '0155151', 'Mirpur Dhaka', NULL, NULL, 'disable', '100057'),
(96, 'maso', 'masojet624@knilok.com', '2025-09-10 20:54:23', '$2y$10$lva/ZEY8UyMmjPZhwUnNmu/.LRmjwr3dR6TyGvLb7EPH6RxOYckgm', NULL, '2025-09-10 20:54:06', '2025-09-10 20:54:53', 'enable', NULL, '0175180896', 'Demra Dhaka', NULL, NULL, 'disable', '100058'),
(97, 'gajas', 'gajas92988@obirah.com', '2025-09-12 21:23:58', '$2y$10$a8d1qIxvDWt2JTN0/axMfeCPvRyqrVW3cwPdPi560JXNdVPpB065m', NULL, '2025-09-12 21:23:44', '2025-09-12 21:41:37', 'enable', NULL, '01751898989', 'Mirpur Dhaak', NULL, NULL, 'disable', '100059'),
(98, 'sinapeb', 'sinapeb778@merumart.com', '2025-09-12 21:42:50', '$2y$10$t/m5ZomJqxUdfUV.pO8geeWm6cyqwL2vDF39xLvHFawRhsUwzAacK', NULL, '2025-09-12 21:42:37', '2025-09-12 21:43:18', 'enable', NULL, '01265959', 'Demra Dhaka', NULL, NULL, 'disable', '100060'),
(99, 'hafeg', 'hafeg60363@obirah.com', '2025-09-13 05:16:07', '$2y$10$HFr6cS5ftZ5z2tkhWEZ4Mu8lZLznAyXgPyWxpmTDl/W19RRbXrZNq', NULL, '2025-09-13 05:15:42', '2025-09-13 05:16:07', 'enable', NULL, '0148484', NULL, NULL, NULL, 'disable', '100061'),
(100, 'kejey', 'kejey35738@obirah.com', '2025-09-14 02:14:26', '$2y$10$kfzm21J2p80W/KLk5mWtmuMdHtiuNxjQiBNA3mLL.1QVzEeFtoRJG', NULL, '2025-09-14 02:14:07', '2025-09-14 02:24:40', 'enable', NULL, '01589099', 'Demra Dhaka', NULL, NULL, 'disable', '100062'),
(101, 'yeh', 'yehem64810@merumart.com', '2025-09-14 04:01:49', '$2y$10$1N4eZv8fuAbZ7YXjtMr.w.nsRtpADbRhUdFzDqSEHxKNwxhywemqu', NULL, '2025-09-14 04:01:28', '2025-09-14 04:01:49', 'enable', NULL, '0175180 95336', NULL, NULL, NULL, 'disable', '100063'),
(102, 'John Doe', 'yalaxaj718@ekuali.com', '2025-09-14 07:36:41', '$2y$10$DgGXYr9W0bvHAg.6HYaMUulSV7S1SavHyBw8cTx4nG0XVjZNNXrca', NULL, '2025-09-14 07:36:07', '2025-09-14 07:39:45', 'enable', NULL, '019889898', NULL, NULL, NULL, 'disable', '100064'),
(106, 'John Doe', 'johndoe@gmail.com', NULL, '$2y$10$qIqkedHT/ZfM5Z7eiGvmbuImGpL8OxtPeREi2aeWjMFixQ5wL4Xpi', NULL, '2025-09-30 21:04:58', '2025-09-30 21:04:58', 'enable', NULL, '+321123', NULL, 'B54INLs1Ov86Zz444eRgXu4mKLTl2o0Qjw56CxA3jkAd7P5FZxvC0ig8jvLTpYO19jYqlSPQnMs08ruhWCLNk2GCEnCU0c6jMU32', NULL, 'disable', '100065'),
(110, 'riripa', 'riripa7133@hiepth.com', '2025-09-30 21:09:02', '$2y$10$1inUmTyeUhbIShTicbVPyu/H/tban0P2vRYGhRgN78j7pkJFv1iGO', NULL, '2025-09-30 21:08:45', '2025-09-30 21:10:15', 'enable', 'uploads/users/1759288215.jpg', '018595258', 'Demra Dhaka', NULL, NULL, 'disable', '100066'),
(111, 'fil', 'filita5166@mv6a.com', '2025-09-30 22:23:49', '$2y$10$rK3yQgJK6HltoKxtCtQiZeO5s1FBLvwOIlimgBgkPAQGFiUTmWjmu', NULL, '2025-09-30 22:23:32', '2025-10-01 22:28:06', 'enable', 'uploads/users/1759292696.jpg', '01458388383', 'Dhaka', NULL, NULL, 'disable', '100067'),
(112, 'sobo', 'sobowa7400@mv6a.com', '2025-10-01 22:34:03', '$2y$10$b6njyyyo0V.XxLSNRsLYiO9zsandSP3Ej/pM7EsCpi02eCQucNn9G', NULL, '2025-10-01 22:33:46', '2025-10-01 22:34:03', 'enable', NULL, '01478965263', NULL, NULL, NULL, 'disable', '100068'),
(113, 'tiyeg', 'tiyeg71343@hiepth.com', '2025-10-01 22:36:28', '$2y$10$sqRSohGWIC/0vIF76vYdvOiony40X/p1rUkqDDO9hPYwME2HuvW2K', NULL, '2025-10-01 22:35:29', '2025-10-01 22:36:28', 'enable', NULL, '01545454', NULL, NULL, NULL, 'disable', '100069'),
(114, 'dabid', 'dabid28713@fintechs.com', NULL, '$2y$10$IEg3mTTiTc/KU0JBBtfONerc0IeuV3A4IqNxozkBO8FztrZO5zj.6', NULL, '2025-10-05 23:39:16', '2025-10-05 23:39:16', 'enable', NULL, '01754689325', NULL, 'hyLJqTgsGAVEaCsik4thqCinN351VxMmHS24c3OIJMYDKt2XvHSMtIAOw2V6gtJfORqJwbZrPhDJXPR9PhgDnpdh7UBQoFPgmwJr', NULL, 'disable', '100070'),
(115, 'xifi', 'xifiko9307@fintehs.com', '2025-10-05 23:41:30', '$2y$10$qav/Z.v0pws7CYO5/E5fOeWUMl3h.EFBTDVTxPqQb7f.z.BknhUvm', NULL, '2025-10-05 23:41:14', '2025-10-05 23:55:00', 'enable', 'uploads/users/1759730100.jpg', '017453698', 'Mirpur', NULL, NULL, 'disable', '100071'),
(116, 'test', 'mikan41921@erynka.com', '2025-10-06 03:06:01', '$2y$10$ZHq7H0M7.cjB/HExOIdVSelZNoBk6vtSXg9hX2D94Zrh5JHx.u7JS', NULL, '2025-10-06 03:05:36', '2025-10-06 03:07:32', 'enable', 'uploads/users/1759741652.jpg', '01612465989', NULL, NULL, NULL, 'disable', '100072'),
(117, 'xifiko', 'xejihe4805@fintehs.com', '2025-10-08 04:26:44', '$2y$10$0OPZycT6wTinDf4uJLLN4ONdtXUp2kCyzyvmagnBc2sP/FdOSEvu.', NULL, '2025-10-08 04:26:23', '2025-10-08 04:27:13', 'enable', 'uploads/users/1759919233.png', '017985623', 'Demra Dhaka', NULL, NULL, 'disable', '100073'),
(118, 'secav', 'secav59843@fintehs.com', '2025-10-08 20:57:56', '$2y$10$GCEBFBUytXFETTEvdCslQOB5cgGVfkCNTc86S8mJXT85bfz.tAa9S', NULL, '2025-10-08 20:57:38', '2025-10-08 20:58:59', 'enable', 'uploads/users/1759978739.jpg', '0175180099', 'Jatrabari dhaka', NULL, NULL, 'disable', '100074'),
(119, 'topar', 'topar44823@fanlvr.com', NULL, '$2y$10$qkc9orVoGH9VXWAdoGF6Ae9JB92zo56y.ojDfnOThA5he8TJaHlBy', NULL, '2025-10-11 23:03:01', '2025-10-11 23:03:01', 'enable', NULL, '01789652314', NULL, 'DPzlYXZ7DdQF8X4Jp1jmcZSdzeBzboZqjGxIpa2LgDvU9L5RtOH42fmDO3NpUHFa8sOkoBCONbbJNy9IeMjKss8FjkXHfUjY1iHA', NULL, 'disable', '100075'),
(123, 'ronet', 'ronet43646@gamegta.com', '2025-10-11 23:05:43', '$2y$10$LjV6kPXaxkbH7zFsM/si.uVCTy7vgUQ579yEeIJ0YGyJZ0KsgDM8q', NULL, '2025-10-11 23:05:16', '2025-10-12 03:44:20', 'enable', 'uploads/users/1760245642.png', '017518009595', 'Mirpur - 1 Dhaka', NULL, NULL, 'disable', '100076'),
(124, 'lamec', 'lamec89672@gamegta.com', '2025-10-12 22:53:53', '$2y$10$Uhv6HYtsT60uxVuoNYp4O.1BBnLrvsDt.d9WXnWTC9zXheEI1.jWa', NULL, '2025-10-12 22:53:37', '2025-10-12 23:05:52', 'enable', 'uploads/users/1760331293.png', '01751800563', 'Demra Dhaka Bangladesh', NULL, NULL, 'disable', '100077'),
(125, 'fafovi', 'fafovi1502@gamegta.com', '2025-10-13 02:51:03', '$2y$10$MC.WDMJOmp4VlIY12l2Ga.WGLceS3e1OPxhgJ7P0F5MtjGFyKs8Py', NULL, '2025-10-13 02:50:40', '2025-10-13 02:52:28', 'enable', 'uploads/users/1760345548.jpg', '01751800952', 'Jatrabari Dhaka', NULL, NULL, 'disable', '100078'),
(126, 'hossain', 'gegeyi8179@gta5hx.com', '2025-10-13 04:15:07', '$2y$10$q/G00KmuzGtuM9gOPgz6nuUDcmPWhm9JNCzbP/1N6NgTI4btTnC2C', NULL, '2025-10-13 04:14:36', '2025-10-13 04:15:07', 'enable', NULL, NULL, NULL, NULL, NULL, 'disable', '100079'),
(127, 'kano', 'kanok75856@fogdiver.com', '2025-10-18 21:03:49', '$2y$10$XjJOoM9Se2XzgyWcWk4gw.4tnwuSNueAit9sV22A/NpCNmnV0e8QW', NULL, '2025-10-18 21:03:34', '2025-10-18 21:03:49', 'enable', NULL, '0158965454', NULL, NULL, NULL, 'disable', '100080'),
(128, 'rarex', 'rarex23261@foxroids.com', '2025-10-18 22:27:58', '$2y$10$/aC0TWmiOol5aMuYnu5BNO5w4g/2ZYrITs/72s7hZ.mQmCTVhQB2m', NULL, '2025-10-18 22:27:45', '2025-10-18 22:27:58', 'enable', NULL, '01511515', NULL, NULL, NULL, 'disable', '100081'),
(131, 'varte', 'varet32880@hh7f.com', '2025-10-25 23:53:34', '$2y$10$KZCdTXGUncwVfUguU.pEL.LEffiuVvFGRKAYkkJQVLE.DA5Rd3Sai', NULL, '2025-10-25 23:53:13', '2025-10-26 00:50:40', 'enable', 'uploads/users/1761458049.jpg', '01751800956', 'Demra Dhaka', NULL, NULL, 'disable', '100082'),
(132, 'tamitaf', 'tamitaf980@burangir.com', '2025-11-05 03:41:10', '$2y$10$n4Zw3cvX9YYLu4WfgumF5.D63u67PBhCG8cVXZFggX7AZnlQUBRDK', NULL, '2025-11-05 03:40:49', '2025-11-05 03:41:39', 'enable', 'uploads/users/1762335699.jpg', '017569532', 'dhaka', NULL, NULL, 'disable', '100083'),
(138, 'socapok', 'socapok175@lawior.com', '2025-12-10 03:31:16', '$2y$10$4GCjM77wQCnBRc3esZwL9.UE9aBF6slPsbu78jlhyE1CkZGHe3AeO', NULL, '2025-12-10 03:31:02', '2025-12-10 03:32:59', 'enable', 'uploads/users/1765359107.jpg', '0175180057', 'Dhaka', NULL, NULL, 'disable', '100084');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_guest` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `name`, `lat`, `lon`, `email`, `phone`, `address`, `delivery_type`, `is_guest`, `created_at`, `updated_at`) VALUES
(1, 269255, 'Suhail Husain', '23.804936084709645', '90.3664471534424', 'sohel@gmail.com', '01798562848', 'Holding no-30, Road-03, Senpara Porbata, মিরপুর ১০ নং গোলচত্বর, ঢাকা 1216, Bangladesh', 'office', 0, '2025-03-15 00:58:30', '2025-03-15 00:58:30'),
(2, 847061, 'Suhail Husain', '23.802894324178368', '90.41571396862794', 'sohel1@gmail.com', '01798562848', '1 Rd No. 78, Dhaka 1212, Bangladesh', 'home', 0, '2025-03-16 00:32:02', '2025-03-16 00:32:02'),
(3, 507690, 'David Richard', '23.799324258653375', '90.37181854248047', 'admin@gmail.com', '01798562848', 'Q9XC+MMX, Begum Rokeya Ave, Dhaka, Bangladesh', 'home', 0, '2025-03-16 00:42:10', '2025-03-16 00:42:10'),
(6, 762815, 'Ibrahim Khalil', '23.82469252189213', '90.36740370583496', 'user@gmail.com', '123-343-4444', 'Mirpur-10, ঢাকা, Bangladesh', 'home', 0, '2025-04-21 03:00:31', '2025-04-21 03:00:31'),
(7, 708096, 'Ibrahim Khalil', '23.81675719853571', '90.36735534667969', 'user@gmail.com', '01833022226', '14 Road No 4, Dhaka 1216, Bangladesh', 'home', 0, '2025-04-29 06:02:13', '2025-04-29 06:02:13'),
(8, 613484, 'Blue Cheese', '23.82155181653423', '90.36568709206543', 'seller@gmail.com', '123-343-4444', 'House 59/A, Section 11.5, Block B Rd No 3, ঢাকা 1216, Bangladesh', 'home', 0, '2025-05-04 23:04:53', '2025-05-04 23:04:53'),
(9, 261447, 'Blue Cheese', '23.7907867', '90.3756286', 'user@gmail.com', '123-343-4444', '218/7 Begum Rokeya Avenue, Dhaka, Bangladesh', 'home', 0, '2025-05-05 05:23:54', '2025-05-05 05:23:54'),
(88, 95, 'Ibrahim', '24.346404768990062', '89.80841282755136', '0154545', '0154545', 'Nambihin Rasta, , Bangladesh', 'home', 0, '2025-09-08 22:37:51', '2025-09-08 22:37:51'),
(96, 96, 'Maso', '24.026637360311277', '89.64937191456556', 'masojet624@knilok.com', '01751989898', '2MG2+795, Harirampur, Bangladesh', 'home', 0, '2025-09-10 20:56:38', '2025-09-10 20:56:38'),
(99, 12, 'Test2', '37.4220936', '-122.083922', 'test@gmail.com', '0189246065', 'Google Building 40, Mountain View, United States', 'office', 0, '2025-09-11 02:27:26', '2025-09-27 22:01:42'),
(100, 97, 'Ibrahim', '24.696682010191388', '90.22704463452101', 'ibrahim@gmail.com', '015151515', 'Nambihin Rasta, , Bangladesh', 'home', 0, '2025-09-12 21:29:19', '2025-09-12 21:29:19'),
(101, 99, 'Ibrahim', '23.588751312383287', '90.12737073004246', 'hafeg60363@obirah.com', '01751800957', 'H4RF+2W, Char Madhur, Bangladesh', 'home', 0, '2025-09-13 05:17:55', '2025-09-13 05:17:55'),
(102, 100, 'Ibrahim Khan', '23.8121721', '90.3679738', 'ibrahim@gmail.com', '01751800957', '9 Rd No. 7, Dhaka, Bangladesh', 'home', 0, '2025-09-14 02:21:41', '2025-09-14 02:21:41'),
(104, 12, 'Ibrahim Khan', '37.4212162', '-122.0828568', 'ibrahim@gmail.com', '01751800957', 'Google Building 43, Mountain View, United States', 'home', 0, '2025-09-27 22:06:51', '2025-09-27 22:23:26'),
(110, 110, 'Test', '23.575371876614533', '89.98460177332163', 'test@gmail.com', '015155115', 'HXGM+G2M, Charbhadrasan, Bangladesh', 'home', 0, '2025-09-30 21:11:57', '2025-09-30 21:11:57'),
(111, 110, 'tsdfdfd', '23.82637603069024', '90.53276516497135', 'fdfdf@gmail.com', '014544554', 'RGGM+C52, , Bangladesh', 'home', 0, '2025-09-30 21:40:36', '2025-09-30 21:40:36'),
(112, 110, 'demo', '23.748468814555814', '90.41153032332659', 'demo@gmail.com', '051515155', '39 Dr Goli, Dhaka, Bangladesh', 'home', 0, '2025-09-30 21:42:12', '2025-09-30 21:42:12'),
(113, 111, 'fila', '23.805076908994707', '90.36347921937704', 'fila@gmail.com', '0176886883', 'R947+29X, Dhaka, Bangladesh', 'home', 0, '2025-09-30 22:26:21', '2025-09-30 22:26:21'),
(116, 115, 'Ibrahim', '23.812198', '90.3678987', 'ibrahim@gmail.com', '017598258', 'House 8, ঢাকা, Bangladesh', 'home', 0, '2025-10-05 23:43:37', '2025-10-05 23:43:37'),
(117, 116, 'Ahmed', '23.170264974659133', '90.28833478689194', 'ahmed@gmail.com', '0185695656446', 'Nambihin Rasta, , Bangladesh', 'home', 0, '2025-10-06 03:11:15', '2025-10-06 03:11:15'),
(118, 117, 'Test', '23.83167664989689', '90.34306861460209', 'test@gmail.com', '0178959595', 'R8JR+4R, Dhaka, Bangladesh', 'home', 0, '2025-10-08 04:30:24', '2025-10-08 04:30:24'),
(119, 117, 'demo', '23.793321021404992', '90.44539287686348', 'demo@gmail.com', '01212112', 'QCVW+H44, Dhaka, Bangladesh', 'office', 0, '2025-10-08 04:34:12', '2025-10-08 04:34:12'),
(120, 118, 'Ibrahim', '23.8121762', '90.3678988', 'secav59843@fintehs.com', '01751800957', 'House 8, ঢাকা, Bangladesh', 'home', 0, '2025-10-08 21:02:01', '2025-10-08 21:02:01'),
(122, 124, 'Test', '23.848756278127265', '90.34546583890915', 'test@gmail.com', '0148484888', 'নিম তলা, Dhaka, Bangladesh', 'home', 0, '2025-10-12 23:09:01', '2025-10-12 23:09:01'),
(124, 125, 'Ibrahim', '23.8121909', '90.367889', 'ibrahim@gmail.com', '01751800972', 'House 8, ঢাকা, Bangladesh', 'office', 0, '2025-10-13 02:54:20', '2025-10-13 02:54:20'),
(129, 127, 'kanok4', '23.768327714491086', '90.39143957197666', 'kanok75856@fogdiver.com', '0144545', 'Dhaka, Bangladesh', 'home', 0, '2025-10-18 21:05:12', '2025-10-18 21:48:26'),
(131, 127, 'Test', '37.4212162', '-122.0828568', 'test@gmail.com', '01515515', 'Google Building 43, Mountain View, United States', 'home', 0, '2025-10-18 22:26:16', '2025-10-18 22:26:16'),
(132, 127, 'Demo', '37.4212162', '-122.0828568', 'demo@gmail.com', '01515515', 'Google Building 43, Mountain View, United States', 'home', 0, '2025-10-18 22:26:56', '2025-10-18 22:26:56'),
(133, 128, 'Testdfdf', '37.4212162', '-122.0828568', 'test@gmail.com', '0184884', 'Google Building 43, Mountain View, United States', 'home', 0, '2025-10-18 22:28:47', '2025-10-18 22:28:54'),
(134, 128, 'Test', '37.4212162', '-122.0828568', 'test@gmail.com', '0151551', 'Google Building 43, Mountain View, United States', 'home', 0, '2025-10-18 22:50:03', '2025-10-18 22:50:03'),
(145, 131, 'Ibrahim', '23.812208', '90.3679167', 'ibrahim@gmail.com', '01751800957', 'Block A, Dhaka, Bangladesh', 'home', 0, '2025-10-25 23:55:34', '2025-10-25 23:55:34'),
(148, 132, 'Ibrahim', '23.812171', '90.367954', 'ib@gmail.com', '017568932', 'Block A, Dhaka, Bangladesh', 'office', 0, '2025-11-05 03:42:39', '2025-11-05 03:42:39'),
(149, 1, 'Rakib khan', '23.8122103', '90.3679673', 'rakib@gmail.com', '0175180095', '9 Rd No. 7, Dhaka, Bangladesh', 'office', 0, '2025-12-15 04:37:50', '2025-12-15 04:38:05'),
(150, 1, 'John Doe', '40.7829', '-73.9654', 'demoaddress@gmail.com', '+1234567890', '123 Main Street, Apartment 4B', 'home', 0, '2025-12-21 13:17:59', '2025-12-21 13:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email_verification',
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_otps`
--

INSERT INTO `user_otps` (`id`, `user_id`, `otp`, `type`, `expires_at`, `used`, `created_at`, `updated_at`) VALUES
(6, 14, '567227', 'email_verification', '2025-08-26 08:14:05', 0, '2025-08-26 07:59:05', '2025-08-26 07:59:05'),
(9, 28, '745041', 'email_verification', '2025-09-03 03:08:52', 0, '2025-09-03 02:53:52', '2025-09-03 02:53:52'),
(11, 32, '168906', 'email_verification', '2025-09-03 22:18:03', 0, '2025-09-03 22:03:03', '2025-09-03 22:03:03'),
(12, 33, '692033', 'email_verification', '2025-09-03 22:29:39', 0, '2025-09-03 22:14:39', '2025-09-03 22:14:39'),
(13, 34, '939856', 'email_verification', '2025-09-03 22:31:50', 0, '2025-09-03 22:16:50', '2025-09-03 22:16:50'),
(14, 38, '760184', 'email_verification', '2025-09-03 22:32:36', 0, '2025-09-03 22:17:36', '2025-09-03 22:17:36'),
(15, 41, '742633', 'email_verification', '2025-09-03 22:33:20', 0, '2025-09-03 22:18:20', '2025-09-03 22:18:20'),
(16, 43, '323628', 'email_verification', '2025-09-03 22:35:39', 0, '2025-09-03 22:20:39', '2025-09-03 22:20:39'),
(17, 44, '331712', 'email_verification', '2025-09-03 22:52:13', 0, '2025-09-03 22:37:13', '2025-09-03 22:37:13'),
(18, 45, '701727', 'email_verification', '2025-09-03 22:54:53', 0, '2025-09-03 22:39:53', '2025-09-03 22:39:53'),
(19, 46, '211886', 'email_verification', '2025-09-03 23:03:41', 0, '2025-09-03 22:48:41', '2025-09-03 22:48:41'),
(20, 47, '950359', 'email_verification', '2025-09-03 23:06:16', 0, '2025-09-03 22:51:16', '2025-09-03 22:51:16'),
(21, 51, '831680', 'email_verification', '2025-09-03 23:08:56', 0, '2025-09-03 22:53:56', '2025-09-03 22:53:56'),
(22, 52, '181198', 'email_verification', '2025-09-03 23:09:46', 0, '2025-09-03 22:54:46', '2025-09-03 22:54:46'),
(23, 53, '899619', 'email_verification', '2025-09-03 23:12:39', 0, '2025-09-03 22:57:39', '2025-09-03 22:57:39'),
(24, 54, '459417', 'email_verification', '2025-09-03 23:15:09', 0, '2025-09-03 23:00:09', '2025-09-03 23:00:09'),
(25, 55, '239571', 'email_verification', '2025-09-04 05:07:01', 1, '2025-09-03 23:06:44', '2025-09-03 23:07:01'),
(26, 56, '406737', 'email_verification', '2025-09-04 05:21:53', 1, '2025-09-03 23:21:33', '2025-09-03 23:21:53'),
(27, 57, '141624', 'email_verification', '2025-09-04 05:51:00', 1, '2025-09-03 23:50:39', '2025-09-03 23:51:00'),
(30, 58, '531342', 'email_verification', '2025-09-04 00:11:45', 0, '2025-09-03 23:56:45', '2025-09-03 23:56:45'),
(31, 59, '459275', 'email_verification', '2025-09-04 00:31:40', 0, '2025-09-04 00:16:40', '2025-09-04 00:16:40'),
(32, 60, '126525', 'email_verification', '2025-09-04 00:34:27', 0, '2025-09-04 00:19:27', '2025-09-04 00:19:27'),
(33, 61, '544651', 'email_verification', '2025-09-04 00:38:04', 0, '2025-09-04 00:23:04', '2025-09-04 00:23:04'),
(34, 62, '854772', 'email_verification', '2025-09-04 00:48:54', 0, '2025-09-04 00:33:54', '2025-09-04 00:33:54'),
(35, 63, '633523', 'email_verification', '2025-09-04 00:52:33', 0, '2025-09-04 00:37:33', '2025-09-04 00:37:33'),
(37, 64, '128122', 'email_verification', '2025-09-04 06:54:26', 1, '2025-09-04 00:54:09', '2025-09-04 00:54:26'),
(45, 64, '196500', 'email_verification', '2025-09-04 02:26:39', 0, '2025-09-04 02:11:39', '2025-09-04 02:11:39'),
(46, 65, '447246', 'email_verification', '2025-09-04 08:12:59', 1, '2025-09-04 02:12:45', '2025-09-04 02:12:59'),
(48, 65, '470478', 'email_verification', '2025-09-04 02:30:40', 0, '2025-09-04 02:15:40', '2025-09-04 02:15:40'),
(49, 66, '352185', 'email_verification', '2025-09-04 09:09:31', 1, '2025-09-04 03:09:09', '2025-09-04 03:09:31'),
(50, 67, '535467', 'email_verification', '2025-09-04 09:11:37', 1, '2025-09-04 03:11:16', '2025-09-04 03:11:37'),
(53, 67, '257922', 'email_verification', '2025-09-04 03:36:10', 0, '2025-09-04 03:21:10', '2025-09-04 03:21:10'),
(54, 71, '361140', 'email_verification', '2025-09-04 03:38:33', 0, '2025-09-04 03:23:33', '2025-09-04 03:23:33'),
(55, 72, '290101', 'email_verification', '2025-09-04 09:24:39', 1, '2025-09-04 03:24:21', '2025-09-04 03:24:39'),
(57, 72, '643977', 'email_verification', '2025-09-04 03:44:38', 0, '2025-09-04 03:29:38', '2025-09-04 03:29:38'),
(58, 73, '851825', 'email_verification', '2025-09-04 09:36:43', 1, '2025-09-04 03:36:25', '2025-09-04 03:36:43'),
(59, 73, '955968', 'email_verification', '2025-09-04 03:51:57', 0, '2025-09-04 03:36:57', '2025-09-04 03:36:57'),
(60, 74, '225981', 'email_verification', '2025-09-04 09:39:46', 1, '2025-09-04 03:39:25', '2025-09-04 03:39:46'),
(61, 75, '383457', 'email_verification', '2025-09-04 09:45:51', 1, '2025-09-04 03:45:33', '2025-09-04 03:45:51'),
(62, 75, '877258', 'email_verification', '2025-09-04 04:01:06', 0, '2025-09-04 03:46:06', '2025-09-04 03:46:06'),
(63, 76, '522745', 'email_verification', '2025-09-04 10:15:32', 1, '2025-09-04 04:15:19', '2025-09-04 04:15:32'),
(69, 76, '656261', 'email_verification', '2025-09-04 04:39:14', 0, '2025-09-04 04:24:14', '2025-09-04 04:24:14'),
(70, 77, '245432', 'email_verification', '2025-09-04 10:25:18', 1, '2025-09-04 04:24:57', '2025-09-04 04:25:18'),
(79, 77, '692244', 'email_verification', '2025-09-04 04:56:52', 0, '2025-09-04 04:41:52', '2025-09-04 04:41:52'),
(80, 78, '297616', 'email_verification', '2025-09-04 04:58:07', 0, '2025-09-04 04:43:07', '2025-09-04 04:43:07'),
(81, 79, '744569', 'email_verification', '2025-09-04 05:01:40', 0, '2025-09-04 04:46:40', '2025-09-04 04:46:40'),
(82, 80, '600410', 'email_verification', '2025-09-04 10:49:04', 1, '2025-09-04 04:48:50', '2025-09-04 04:49:04'),
(86, 80, '264478', 'email_verification', '2025-09-04 05:12:29', 0, '2025-09-04 04:57:29', '2025-09-04 04:57:29'),
(87, 81, '609384', 'email_verification', '2025-09-06 02:31:42', 1, '2025-09-05 20:31:22', '2025-09-05 20:31:42'),
(98, 81, '699767', 'email_verification', '2025-09-05 21:58:33', 0, '2025-09-05 21:43:33', '2025-09-05 21:43:33'),
(102, 82, '470112', 'email_verification', '2025-09-06 09:53:50', 1, '2025-09-06 03:53:30', '2025-09-06 03:53:50'),
(108, 82, '568774', 'email_verification', '2025-09-06 04:32:54', 0, '2025-09-06 04:17:54', '2025-09-06 04:17:54'),
(109, 83, '498134', 'email_verification', '2025-09-06 10:19:49', 1, '2025-09-06 04:19:22', '2025-09-06 04:19:49'),
(110, 83, '897843', 'email_verification', '2025-09-06 04:35:18', 0, '2025-09-06 04:20:18', '2025-09-06 04:20:18'),
(111, 84, '619812', 'email_verification', '2025-09-06 10:34:31', 1, '2025-09-06 04:34:09', '2025-09-06 04:34:31'),
(117, 84, '436588', 'email_verification', '2025-09-06 05:07:26', 0, '2025-09-06 04:52:26', '2025-09-06 04:52:26'),
(118, 85, '374187', 'email_verification', '2025-09-06 10:56:12', 1, '2025-09-06 04:55:48', '2025-09-06 04:56:12'),
(119, 85, '933317', 'email_verification', '2025-09-06 05:12:26', 0, '2025-09-06 04:57:26', '2025-09-06 04:57:26'),
(120, 86, '231867', 'email_verification', '2025-09-06 05:14:47', 0, '2025-09-06 04:59:47', '2025-09-06 04:59:47'),
(122, 88, '502206', 'email_verification', '2025-09-06 08:09:52', 0, '2025-09-06 07:54:52', '2025-09-06 07:54:52'),
(123, 89, '288554', 'email_verification', '2025-09-06 21:37:03', 0, '2025-09-06 21:22:03', '2025-09-06 21:22:03'),
(124, 90, '961382', 'email_verification', '2025-09-07 03:29:54', 1, '2025-09-06 21:29:26', '2025-09-06 21:29:54'),
(126, 91, '366744', 'email_verification', '2025-09-07 03:32:03', 1, '2025-09-06 21:31:41', '2025-09-06 21:32:03'),
(127, 92, '994622', 'email_verification', '2025-09-07 04:18:10', 1, '2025-09-06 22:17:50', '2025-09-06 22:18:10'),
(134, 92, '315551', 'email_verification', '2025-09-06 22:50:05', 0, '2025-09-06 22:35:05', '2025-09-06 22:35:05'),
(135, 93, '627878', 'email_verification', '2025-09-07 04:36:45', 1, '2025-09-06 22:36:33', '2025-09-06 22:36:45'),
(136, 93, '309628', 'email_verification', '2025-09-06 22:52:00', 0, '2025-09-06 22:37:00', '2025-09-06 22:37:00'),
(137, 94, '241734', 'email_verification', '2025-09-07 04:49:28', 0, '2025-09-07 04:34:28', '2025-09-07 04:34:28'),
(138, 95, '453378', 'email_verification', '2025-09-09 04:06:01', 1, '2025-09-08 22:05:47', '2025-09-08 22:06:01'),
(146, 95, '883204', 'email_verification', '2025-09-09 21:31:05', 0, '2025-09-09 21:16:05', '2025-09-09 21:16:05'),
(147, 96, '443237', 'email_verification', '2025-09-11 02:54:23', 1, '2025-09-10 20:54:06', '2025-09-10 20:54:23'),
(148, 97, '521970', 'email_verification', '2025-09-13 03:23:58', 1, '2025-09-12 21:23:44', '2025-09-12 21:23:58'),
(149, 98, '877394', 'email_verification', '2025-09-13 03:42:50', 1, '2025-09-12 21:42:37', '2025-09-12 21:42:50'),
(150, 99, '805896', 'email_verification', '2025-09-13 11:16:07', 1, '2025-09-13 05:15:42', '2025-09-13 05:16:07'),
(151, 100, '623892', 'email_verification', '2025-09-14 08:14:26', 1, '2025-09-14 02:14:07', '2025-09-14 02:14:26'),
(172, 100, '357681', 'email_verification', '2025-09-14 04:14:57', 0, '2025-09-14 03:59:57', '2025-09-14 03:59:57'),
(173, 101, '514492', 'email_verification', '2025-09-14 10:01:49', 1, '2025-09-14 04:01:28', '2025-09-14 04:01:49'),
(190, 102, '656147', 'email_verification', '2025-09-14 13:36:41', 1, '2025-09-14 07:36:07', '2025-09-14 07:36:41'),
(191, 102, '122969', 'email_verification', '2025-09-14 13:39:45', 1, '2025-09-14 07:37:41', '2025-09-14 07:39:45'),
(192, 101, '387674', 'email_verification', '2025-09-14 21:11:43', 0, '2025-09-14 20:56:43', '2025-09-14 20:56:43'),
(193, 1, '117450', 'email_verification', '2025-09-30 21:16:10', 0, '2025-09-30 21:01:10', '2025-09-30 21:01:10'),
(194, 106, '842868', 'email_verification', '2025-09-30 21:19:58', 0, '2025-09-30 21:04:58', '2025-09-30 21:04:58'),
(195, 110, '314989', 'email_verification', '2025-10-01 03:09:02', 1, '2025-09-30 21:08:45', '2025-09-30 21:09:02'),
(200, 110, '268710', 'email_verification', '2025-09-30 21:35:06', 0, '2025-09-30 21:20:06', '2025-09-30 21:20:06'),
(201, 111, '383352', 'email_verification', '2025-10-01 04:23:49', 1, '2025-09-30 22:23:32', '2025-09-30 22:23:49'),
(205, 31, '769140', 'email_verification', '2025-10-01 21:41:15', 0, '2025-10-01 21:26:15', '2025-10-01 21:26:15'),
(220, 111, '207803', 'email_verification', '2025-10-02 04:28:06', 1, '2025-10-01 22:27:04', '2025-10-01 22:28:06'),
(221, 111, '287511', 'email_verification', '2025-10-01 22:44:32', 0, '2025-10-01 22:29:32', '2025-10-01 22:29:32'),
(222, 112, '767840', 'email_verification', '2025-10-02 04:34:03', 1, '2025-10-01 22:33:46', '2025-10-01 22:34:03'),
(223, 113, '309972', 'email_verification', '2025-10-02 04:36:28', 1, '2025-10-01 22:35:29', '2025-10-01 22:36:28'),
(241, 113, '292382', 'email_verification', '2025-10-02 00:14:12', 0, '2025-10-01 23:59:12', '2025-10-01 23:59:12'),
(242, 114, '312238', 'email_verification', '2025-10-05 23:54:16', 0, '2025-10-05 23:39:16', '2025-10-05 23:39:16'),
(243, 115, '269967', 'email_verification', '2025-10-06 05:41:30', 1, '2025-10-05 23:41:14', '2025-10-05 23:41:30'),
(244, 116, '597876', 'email_verification', '2025-10-06 09:06:01', 1, '2025-10-06 03:05:36', '2025-10-06 03:06:01'),
(245, 117, '941853', 'email_verification', '2025-10-08 10:26:44', 1, '2025-10-08 04:26:23', '2025-10-08 04:26:44'),
(246, 118, '931169', 'email_verification', '2025-10-09 02:57:56', 1, '2025-10-08 20:57:38', '2025-10-08 20:57:56'),
(247, 12, '926563', 'email_verification', '2025-10-12 22:34:02', 0, '2025-10-11 22:19:02', '2025-10-11 22:19:02'),
(248, 119, '564411', 'email_verification', '2025-10-11 23:18:01', 0, '2025-10-11 23:03:01', '2025-10-11 23:03:01'),
(249, 123, '630929', 'email_verification', '2025-10-12 05:05:43', 1, '2025-10-11 23:05:16', '2025-10-11 23:05:43'),
(283, 123, '524656', 'email_verification', '2025-10-12 09:36:36', 1, '2025-10-12 03:26:50', '2025-10-12 03:36:36'),
(284, 123, '932245', 'email_verification', '2025-10-12 09:37:57', 1, '2025-10-12 03:37:27', '2025-10-12 03:37:57'),
(285, 123, '345205', 'email_verification', '2025-10-12 09:42:58', 1, '2025-10-12 03:42:26', '2025-10-12 03:42:58'),
(286, 123, '484511', 'email_verification', '2025-10-12 09:44:19', 1, '2025-10-12 03:43:46', '2025-10-12 03:44:19'),
(287, 124, '731732', 'email_verification', '2025-10-13 04:53:53', 1, '2025-10-12 22:53:37', '2025-10-12 22:53:53'),
(288, 124, '646670', 'email_verification', '2025-10-13 04:55:50', 1, '2025-10-12 22:55:20', '2025-10-12 22:55:50'),
(289, 124, '805221', 'email_verification', '2025-10-13 04:57:24', 1, '2025-10-12 22:56:52', '2025-10-12 22:57:24'),
(290, 124, '226668', 'email_verification', '2025-10-13 04:59:43', 1, '2025-10-12 22:59:13', '2025-10-12 22:59:43'),
(291, 124, '909069', 'email_verification', '2025-10-13 05:04:35', 1, '2025-10-12 23:04:03', '2025-10-12 23:04:35'),
(292, 124, '650216', 'email_verification', '2025-10-13 05:05:52', 1, '2025-10-12 23:05:18', '2025-10-12 23:05:52'),
(293, 125, '703711', 'email_verification', '2025-10-13 08:51:03', 1, '2025-10-13 02:50:40', '2025-10-13 02:51:03'),
(294, 126, '658738', 'email_verification', '2025-10-13 10:15:07', 1, '2025-10-13 04:14:36', '2025-10-13 04:15:07'),
(295, 127, '954037', 'email_verification', '2025-10-19 03:03:49', 1, '2025-10-18 21:03:34', '2025-10-18 21:03:49'),
(296, 128, '459430', 'email_verification', '2025-10-19 04:27:58', 1, '2025-10-18 22:27:45', '2025-10-18 22:27:58'),
(297, 131, '910137', 'email_verification', '2025-10-26 05:53:34', 1, '2025-10-25 23:53:13', '2025-10-25 23:53:34'),
(298, 132, '456587', 'email_verification', '2025-11-05 09:41:10', 1, '2025-11-05 03:40:49', '2025-11-05 03:41:10'),
(299, 138, '995262', 'email_verification', '2025-12-10 09:31:16', 1, '2025-12-10 03:31:02', '2025-12-10 03:31:16'),
(300, 138, '301756', 'email_verification', '2025-12-10 09:32:59', 1, '2025-12-10 03:32:21', '2025-12-10 03:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enable','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bike', 'enable', '2025-10-28 04:16:07', '2025-10-28 04:16:07'),
(2, 'cycle', 'enable', '2025-10-28 04:16:22', '2025-10-28 04:16:22'),
(3, 'walker', 'enable', '2025-10-28 04:16:34', '2025-10-28 04:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_translations`
--

CREATE TABLE `vehicle_type_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_type_translations`
--

INSERT INTO `vehicle_type_translations` (`id`, `vehicle_type_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Bike', '2025-10-28 04:16:07', '2025-10-28 04:16:07'),
(2, 1, 'bn', 'Bike', '2025-10-28 04:16:07', '2025-10-28 04:16:07'),
(3, 2, 'en', 'Cycle', '2025-10-28 04:16:22', '2025-10-28 04:16:22'),
(4, 2, 'bn', 'Cycle', '2025-10-28 04:16:22', '2025-10-28 04:16:22'),
(5, 3, 'en', 'Walker', '2025-10-28 04:16:34', '2025-10-28 04:16:34'),
(6, 3, 'bn', 'Walker', '2025-10-28 04:16:34', '2025-10-28 04:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(124, 131, 17, '2025-10-25 23:58:34', '2025-10-25 23:58:34'),
(128, 1, 14, '2025-12-07 00:04:25', '2025-12-07 00:04:25'),
(129, 1, 184, '2025-12-09 03:08:41', '2025-12-09 03:08:41'),
(136, 1, 15, '2025-12-23 08:11:11', '2025-12-23 08:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdraw_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `method_name`, `min_amount`, `max_amount`, `withdraw_charge`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Roket', 20.00, 50.00, 5.00, '<p>description</p>', 'enable', '2025-03-15 22:37:50', '2025-03-16 00:22:14'),
(2, 'Others', 50.00, 100.00, 10.00, '<p>Description section</p>', 'enable', '2025-03-16 02:45:15', '2025-03-16 02:45:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_us_translations`
--
ALTER TABLE `about_us_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_translations`
--
ALTER TABLE `addon_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_status_index` (`user_id`,`status`),
  ADD KEY `carts_restaurant_id_index` (`restaurant_id`);

--
-- Indexes for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_addons_addon_id_foreign` (`addon_id`),
  ADD KEY `cart_addons_cart_id_index` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_translations`
--
ALTER TABLE `contact_us_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisine_translations`
--
ALTER TABLE `cuisine_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_withdraws`
--
ALTER TABLE `deliveryman_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_withdraw_methods`
--
ALTER TABLE `deliveryman_withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_email_unique` (`email`);

--
-- Indexes for table `delivery_messages`
--
ALTER TABLE `delivery_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_slug_unique` (`slug`);

--
-- Indexes for table `document_type_translations`
--
ALTER TABLE `document_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_type_translations_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_translations`
--
ALTER TABLE `footer_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepages`
--
ALTER TABLE `homepages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage_translations`
--
ALTER TABLE `homepage_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`);

--
-- Indexes for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pwa_icon_settings`
--
ALTER TABLE `pwa_icon_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_wishlists`
--
ALTER TABLE `restaurant_wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraws`
--
ALTER TABLE `seller_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_and_conditions`
--
ALTER TABLE `term_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_trasnlations`
--
ALTER TABLE `testimonial_trasnlations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_otps_user_id_type_index` (`user_id`,`type`),
  ADD KEY `user_otps_expires_at_index` (`expires_at`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicle_types_slug_unique` (`slug`);

--
-- Indexes for table `vehicle_type_translations`
--
ALTER TABLE `vehicle_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_type_translations_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_us_translations`
--
ALTER TABLE `about_us_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `addon_translations`
--
ALTER TABLE `addon_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT for table `cart_addons`
--
ALTER TABLE `cart_addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us_translations`
--
ALTER TABLE `contact_us_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cuisine_translations`
--
ALTER TABLE `cuisine_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deliveryman_withdraws`
--
ALTER TABLE `deliveryman_withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `deliveryman_withdraw_methods`
--
ALTER TABLE `deliveryman_withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `delivery_messages`
--
ALTER TABLE `delivery_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_type_translations`
--
ALTER TABLE `document_type_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `footer_translations`
--
ALTER TABLE `footer_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `homepages`
--
ALTER TABLE `homepages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homepage_translations`
--
ALTER TABLE `homepage_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_translations`
--
ALTER TABLE `menu_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offer_products`
--
ALTER TABLE `offer_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2533;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=665;

--
-- AUTO_INCREMENT for table `pwa_icon_settings`
--
ALTER TABLE `pwa_icon_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `restaurant_wishlists`
--
ALTER TABLE `restaurant_wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seller_withdraws`
--
ALTER TABLE `seller_withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `term_and_conditions`
--
ALTER TABLE `term_and_conditions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonial_trasnlations`
--
ALTER TABLE `testimonial_trasnlations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicle_type_translations`
--
ALTER TABLE `vehicle_type_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD CONSTRAINT `cart_addons_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_addons_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_type_translations`
--
ALTER TABLE `document_type_translations`
  ADD CONSTRAINT `document_type_translations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD CONSTRAINT `user_otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_type_translations`
--
ALTER TABLE `vehicle_type_translations`
  ADD CONSTRAINT `vehicle_type_translations_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
