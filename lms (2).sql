-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2025 at 01:20 PM
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
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_token` char(36) DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `guest_token`, `course_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, NULL, 'd9818637-d644-45f8-9b2e-03a793f54a92', 19, 1, '2025-12-26 05:23:32', '2025-12-26 05:23:32'),
(2, NULL, 'bd5222f0-9c84-49fa-9c0c-ba644e1e6769', 19, 1, '2025-12-26 05:23:33', '2025-12-26 05:23:33'),
(3, NULL, '777ef995-b2d1-4e1a-91f4-00a5478014e5', 19, 1, '2025-12-26 05:23:33', '2025-12-26 05:23:33'),
(4, NULL, 'a86a8d5a-fc5d-43d6-a543-e89c0d6b2da7', 19, 1, '2025-12-26 05:23:33', '2025-12-26 05:23:33'),
(5, NULL, '1f0a1c30-4bbe-47b2-b46e-3b4fdc85bd04', 19, 1, '2025-12-26 05:23:34', '2025-12-26 05:23:34'),
(6, NULL, 'c5dc766d-dafd-41af-88a1-b27eb2be724e', 19, 1, '2025-12-26 05:23:34', '2025-12-26 05:23:34'),
(7, NULL, '2cd15ae8-e5e2-41e8-b709-9ffab8176a9c', 19, 1, '2025-12-26 05:23:34', '2025-12-26 05:23:34'),
(8, NULL, '839a4d94-dd68-40cf-a0b5-b311dd32f2a5', 19, 1, '2025-12-26 05:23:38', '2025-12-26 05:23:38'),
(9, NULL, 'c657e518-1c57-454f-bc9d-5d235d006555', 19, 1, '2025-12-26 05:23:39', '2025-12-26 05:23:39'),
(10, NULL, '73b4cbd8-886d-47c4-bd8e-5afbfe1eda39', 19, 1, '2025-12-26 05:23:39', '2025-12-26 05:23:39'),
(11, NULL, 'a6cf540d-cd41-4753-9991-87fa10c054eb', 19, 1, '2025-12-26 05:23:39', '2025-12-26 05:23:39'),
(12, NULL, 'b56ecf13-4c98-4d2a-b23d-b32f74fac0b8', 19, 1, '2025-12-26 05:23:39', '2025-12-26 05:23:39'),
(13, NULL, 'f16fde75-9142-4727-8f9e-33f15afa5ce0', 19, 1, '2025-12-26 05:23:40', '2025-12-26 05:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Web', 'web-development', 'http://127.0.0.1:8000/upload/category/694e7d3f767fe.jpg', '2025-12-26 05:32:31', '2025-12-26 06:49:11'),
(2, 'Mobile', 'mobile-development', 'http://127.0.0.1:8000/upload/category/694e7d2aad020.jpg', '2025-12-26 05:32:32', '2025-12-26 06:48:50'),
(3, 'Design', 'design', 'http://127.0.0.1:8000/upload/category/694e7cb5f0399.jpg', '2025-12-26 05:32:32', '2025-12-26 06:46:53'),
(4, 'Business', 'business', 'http://127.0.0.1:8000/upload/category/694e7c282bba9.jpg', '2025-12-26 05:32:32', '2025-12-26 06:44:32'),
(5, 'IT', 'it-software', 'http://127.0.0.1:8000/upload/category/694e7d0565025.jpg', '2025-12-26 05:32:32', '2025-12-26 06:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `certificate_number` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` varchar(255) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `instructor_id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'INS5OFF5', '5', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 5, 'INS5OFF10', '10', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 5, 'INS5OFF15', '15', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 6, 'INS6OFF5', '5', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 6, 'INS6OFF10', '10', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 6, 'INS6OFF15', '15', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 7, 'INS7OFF5', '5', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 7, 'INS7OFF10', '10', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 7, 'INS7OFF15', '15', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 8, 'INS8OFF5', '5', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 8, 'INS8OFF10', '10', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 8, 'INS8OFF15', '15', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 9, 'INS9OFF5', '5', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 9, 'INS9OFF10', '10', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 9, 'INS9OFF15', '15', '2026-01-25', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `course_image` varchar(255) DEFAULT NULL,
  `course_title` text DEFAULT NULL,
  `course_name` text DEFAULT NULL,
  `course_name_slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `duration` decimal(8,2) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `prerequisites` text DEFAULT NULL,
  `bestseller` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `highestrated` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Inactive',
  `can_have_quizzes` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video_url`, `label`, `resources`, `certificate`, `duration`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `can_have_quizzes`, `created_at`, `updated_at`) VALUES
(1, 2, 7, 5, 'http://127.0.0.1:8000/upload/course/694e70d1b764a.jpg', 'Swift - Masterclass by Instructor 1 (Vol 1)', 'Swift - Masterclass by Instructor 1 (Vol 1)', 'swift-masterclass-by-instructor-1-vol-1', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(253, 221, 227);\" data-pasted=\"true\">In this SwiftUI masterclass, you will learn to build a full fledged iPhone app using Swift, SwiftUI, and Xcode. We will be building a functional to do list app from scratch. We&#39;ll explore the various constructs of building beautiful User Interfaces for your app. Next, we will integrate Google Firebase as a backend for the app. This backend will let the user Register and Log In to your new app. We&#39;ll dive into the world of saving data into a database &ndash; to do list items &ndash; and getting the users saved information. You&#39;ll get a chance to build reusable components like headers, Calendars, buttons, and more. Additionally, we&#39;ll get into the details of working with data in a declarative UI framework like SwiftUI. We&#39;ll leverage best practices with ViewModels, StateObjects, Bindings, and more. By the end of this FREE masterclass, you&#39;ll have a beautiful and functional SwiftUI iPhone app to show off to your friends. You can access the full project code by supporting on Patreon:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbVVRcENHZnN4dW5aSUlFZ0Zhcjd2ZGM0cVVud3xBQ3Jtc0ttZWxFa3ZnSEtxemIyZkg0Uzd1NW5ndmtkbEd2RTctQi1Teno3Z05kOHhDQ2Vrak1kdzU4d2htdjRVOTRGUzBrUFlUR21aTTRPX1JqdEE5VHQ1eEFTQlRUM1cyUnRsem5vY2pFT2JjaWlTYTFZR2dVMA&q=https%3A%2F%2Fiosacademy.io%2Fresources&v=t_mypMqSXNw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://iosacademy.io/resources</a></span></p>', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 'advance', NULL, 'no', 41.54, 51, 27, '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(253, 221, 227);\" data-pasted=\"true\">In this SwiftUI masterclass, you will learn to build a full fledged iPhone app using Swift, SwiftUI, and Xcode. We will be building a functional to do list app from scratch. We&#39;ll explore the various constructs of building beautiful User Interfaces for your app. Next, we will integrate Google Firebase as a backend for the app. This backend will let the user Register and Log In to your new app. We&#39;ll dive into the world of saving data into a database &ndash; to do list items &ndash; and getting the users saved information. You&#39;ll get a chance to build reusable components like headers, Calendars, buttons, and more. Additionally, we&#39;ll get into the details of working with data in a declarative UI framework like SwiftUI. We&#39;ll leverage best practices with ViewModels, StateObjects, Bindings, and more. By the end of this FREE masterclass, you&#39;ll have a beautiful and functional SwiftUI iPhone app to show off to your friends. You can access the full project code by supporting on Patreon:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbVVRcENHZnN4dW5aSUlFZ0Zhcjd2ZGM0cVVud3xBQ3Jtc0ttZWxFa3ZnSEtxemIyZkg0Uzd1NW5ndmtkbEd2RTctQi1Teno3Z05kOHhDQ2Vrak1kdzU4d2htdjRVOTRGUzBrUFlUR21aTTRPX1JqdEE5VHQ1eEFTQlRUM1cyUnRsem5vY2pFT2JjaWlTYTFZR2dVMA&q=https%3A%2F%2Fiosacademy.io%2Fresources&v=t_mypMqSXNw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://iosacademy.io/resources</a></span></p>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:56:09'),
(2, 4, 16, 5, 'http://127.0.0.1:8000/upload/course/694e7166c6f06.jpg', 'Management - Masterclass by Instructor 1 (Vol 2)', 'Management - Masterclass by Instructor 1 (Vol 2)', 'management-masterclass-by-instructor-1-vol-2', '<p>Quis autem totam qui possimus. Eveniet eos delectus sit debitis ipsam provident vero. Deserunt et corporis qui et. Repudiandae aut et veritatis facilis odio. Sed vel similique nemo accusamus voluptatibus ut et. Odio rerum et doloribus ut. Dolore quod fugit tempora asperiores cumque eos quas. Libero atque maxime aut harum tenetur. Temporibus magnam maiores error molestiae. Nam optio et asperiores officia accusamus cumque vitae.</p>', 'https://www.youtube.com/watch?v=JEsQCqEVQmY', 'medium', NULL, NULL, 13.86, 164, 16, '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\" data-pasted=\"true\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/organisingclass12businessstudies\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#Organisingclass12businessstudies</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/organising\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#Organising</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/organisingintroduction\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#Organisingintroduction</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/organisinginmanagement\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#Organisinginmanagement</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/organisingprocess\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#Organisingprocess</a></span></p>', 'no', 'yes', 'yes', 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:58:38'),
(3, 2, 8, 5, 'http://127.0.0.1:8000/upload/course/694e71d7a2ed7.jpg', 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 'kotlin-masterclass-by-instructor-1-vol-3', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 250, 234);\" data-pasted=\"true\">In this video I&#39;ll teach you everything you need to know to start developing real software with Kotlin. Download IntelliJ:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbU9mcVpkYUdrd0Yxc1dtdS1EbXFTZ0xjZ1U4QXxBQ3Jtc0trVTRRNHhlSnVETGhMZVdRQWNWanBJQkFia3RUQmEtS1oxUmhHSnBqczl5MktidVl0MEU4VGpsUUJKRlh0VVotaGZDNGFXdEdNUEpwNXJOSk9rX2lOMXJQUTlkeWNDY1MwMmhydFFjS2ZnT1ZJM2Rwdw&q=https%3A%2F%2Fwww.jetbrains.com%2Fidea%2Fdownload&v=dzUc9vrsldM\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.jetbrains.com/idea/download</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 250, 234);\">&nbsp;▶️ KOTLIN NEWBIE TO PRO Playlist:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 250, 234);\"><span dir=\"auto\" style=\"margin: 0px; padding: 0px 0px 1px; border: 0px; background: rgba(69, 201, 119, 0.17); border-radius: 8px;\"><a tabindex=\"0\" href=\"https://www.youtube.com/playlist?list=PLQkwcJG4YTCRSQikwhtoApYs9ij_Hc5Z9\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">&nbsp; <span style=\"margin: 0.5px 0px 0px; padding: 0px; border: 0px; background: transparent; display: inline-block;\"><img alt=\"\" src=\"blob:http://127.0.0.1:8000/f7ff52d4-ddaa-450e-828f-623a967a8646\" style=\"padding: 0px; border: 0px; background: transparent; visibility: inherit; min-height: 1px; min-width: 1px; object-fit: fill; height: 10px; width: 14px;\" class=\"fr-fic fr-dii\"></span> &bull; KOTLIN NEWBIE TO PRO &nbsp;</a></span></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 250, 234);\">&nbsp;⭐ Courses with real-life practices ⭐ Save countless hours of time ⭐ 100% money back guarantee for 30 days ⭐ Become a professional Android developer now:</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa2hvSVFpemV6RjVFWXAtR3dGeWRtZnNjS1lDUXxBQ3Jtc0trMDBTa0ZNQnEwMVN5R25lQzVXV2luOXdSVGpCZ0FpLXU2eW1UdHpxM2YyOW9qNmJXOXhVZ2JJLXVDZV93QlVaX21MYnByck5EZ2ZkSXV1QXRON0VJeDR2bXZVbTlKUVdnRnZhSmtGTEpkMEVEQ0ozTQ&q=https%3A%2F%2Fpl-coding.com%2Fpremium-courses%3Futm_source%3Dyoutube%26utm_medium%3Dvideo%26utm_campaign%3Ddefault%26cmc_strip%3Dutm&v=dzUc9vrsldM\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://pl-coding.com/premium-courses...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 250, 234);\">&nbsp;🎓 Become an industry-ready Android developer in the Mobile Dev Campus:</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbnV0QjF6MjdnUEpscTNVRFN6bnNwSER2UkM4d3xBQ3Jtc0ttaDZzWS1jSUdVNUN6WHZNcU5WNS1NdTBpc19VV1RsLUNUZVJ6QzYyeHE1OGpDcU9id2hHblJ6TWxGbS11VlRTanM1YTYxVzJJZTE2RmpRdU5NUXhOR3VWNkxFa0wwUVpLR0ZPbnJWdzVodFo4Vk1UOA&q=https%3A%2F%2Fpl-coding.com%2Fcampus%3Futm_source%3Dyoutube%26utm_campaign%3Ddefault%26utm_medium%3Dvideo%26cmc_strip%3Dutm&v=dzUc9vrsldM\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://pl-coding.com/campus?utm_sour...</a></span></p>', 'https://www.youtube.com/watch?v=dzUc9vrsldM&t=90s', 'Featured', NULL, NULL, 16.81, 81, 22, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Full 2025 Kotlin Crash Course For Beginners</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:00:31');
INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video_url`, `label`, `resources`, `certificate`, `duration`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `can_have_quizzes`, `created_at`, `updated_at`) VALUES
(4, 5, 20, 5, 'http://127.0.0.1:8000/upload/course/694e7229bcf3c.jpg', 'Python - Masterclass by Instructor 1 (Vol 4)', 'Python - Masterclass by Instructor 1 (Vol 4)', 'python-masterclass-by-instructor-1-vol-4', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\" data-pasted=\"true\">This lecture was made with a lot of love❤️ Notes :&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbHB1alNRR3hDNi1NeFNzbGY1SDV3Tm9BWXp0d3xBQ3Jtc0tuTGxFVWlrc2I1YVRiVTJ4ZW0wS1F0akxPX2FZbjJEMjMzQ0Z4Vkc3OFdNVjQtTTByY0kzS2dzZGVweFRweDN6WWpGVzhZOUYxek9fUU1YZVQ5WDEyTFpudVFSUW1MOVcwakVCaFdpamNORXJlMFVHaw&q=https%3A%2F%2Fdrive.google.com%2Fdrive%2Ffolders%2F1LahwPSc6f9nkxBiRrz6LFUzkrg-Kzvov%3Fusp%3Dsharing&v=t2_Q2BRzeEE\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://drive.google.com/drive/folder...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;✨ Instagram :&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\"><span dir=\"auto\" style=\"margin: 0px; padding: 0px 0px 1px; border: 0px; background: rgba(201, 119, 69, 0.17); border-radius: 8px;\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa1dMWFY1VkgyVndadHJ2UWItbW53d0E4QjVwUXxBQ3Jtc0tsR0ttQkV3U2hfSkFwU3dYM19OLXFxOTZ0OTVvejYxd2RueWFOVExJSWQ3MjFZei1LYkppbzVaRmRWSTZJOUhtdmVRTzVidUF4cjI0ckNTY2t0TmJ4SG14MmM3QkFTT3F4ZzM2U3BEcVkya3F4bG45bw&q=https%3A%2F%2Fwww.instagram.com%2Fshradhakhapra%2F&v=t2_Q2BRzeEE\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">&nbsp;<span style=\"margin: 0.5px 0px 0px; padding: 0px; border: 0px; background: transparent; display: inline-block;\"><img alt=\"\" src=\"blob:http://127.0.0.1:8000/80b7caaa-fa63-49c2-9603-b5857b9c1a30\" style=\"padding: 0px; border: 0px; background: transparent; visibility: inherit; min-height: 1px; min-width: 1px; object-fit: fill; height: 14px; width: 14px;\" class=\"fr-fic fr-dii\"></span> / shradhakhapra &nbsp;</a></span></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">✨ LinkedIn :&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\"><span dir=\"auto\" style=\"margin: 0px; padding: 0px 0px 1px; border: 0px; background: rgba(201, 119, 69, 0.17); border-radius: 8px;\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3ZrSnEtU3c3V3RNUnVPaG5EQlFxcUY0THZiZ3xBQ3Jtc0ttTW5sSUQ5YjRLNmE4TkgyOE9ZRnpzSm9kTjhIN1VlODRqMlptUnBNN2p1eW1sUWU4dUI2NVUwNV9TQnNvODNsdmRMbVJwYkE3ZFh6T0llTkRfTGx1SGlvTWJpdnlwREJRRDd0b2RSOXltd0FDZzZRTQ&q=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fshradha-khapra%2F&v=t2_Q2BRzeEE\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">&nbsp;<span style=\"margin: 0.5px 0px 0px; padding: 0px; border: 0px; background: transparent; display: inline-block;\"><img alt=\"\" src=\"blob:http://127.0.0.1:8000/9b405eb0-b047-4ec1-bc75-af1b88b3658f\" style=\"padding: 0px; border: 0px; background: transparent; visibility: inherit; min-height: 1px; min-width: 1px; object-fit: fill; height: 14px; width: 14px;\" class=\"fr-fic fr-dii\"></span> / shradha-khapra &nbsp;</a></span></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;Timestamps Introduction&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">00:00</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=41s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">00:41</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Introduction to Python</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=481s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">08:01</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Python Installation (Windows)</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=566s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">09:26</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Python Installation (Mac)</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=626s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">10:26</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- VSCode Installation</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=758s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">12:38</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- First Program</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=1030s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">17:10</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Python Character Set</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=1250s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">20:50</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Variables and how to use them</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=1802s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">30:02</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Rules for Identifiers</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=2005s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">33:25</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Data Types</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=2396s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">39:56</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Keywords</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=2571s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">42:51</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Print Sum</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=2712s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">45:12</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Comments in Python</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=2833s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">47:13</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Operators in Python</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=3744s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">1:02:24</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Type Conversion</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=4121s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">1:08:41</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Inputs in Python</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0&index=1&t=4552s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">1:15:52</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 234, 224);\">&nbsp;- Let&#39;s Practice</span></p>', 'https://www.youtube.com/watch?v=t2_Q2BRzeEE&list=PLGjplNEQ1it8-0CmoljS5yeV-GlKSUEt0', 'advance', NULL, 'yes', 46.17, 118, 16, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Python Full Course❤️ | Variables &amp; Data Types | Lecture 1</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:01:53'),
(5, 3, 11, 5, 'http://127.0.0.1:8000/upload/course/694e7270476f3.jpg', 'Figma - Masterclass by Instructor 1 (Vol 5)', 'Figma - Masterclass by Instructor 1 (Vol 5)', 'figma-masterclass-by-instructor-1-vol-5', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\" data-pasted=\"true\">If you&rsquo;re a beginner, this tutorial might be the best and fastest way to learn Figma! &nbsp;Without wasting a moment, Matt will show you around the UI, how to use tools, adjust properties, align objects, edit text and images, create masks, and even more advanced features like auto layout, components, and prototyping. Master Figma and learn how to create stunning responsive websites with Matt in our newly updated and in-depth course, &lsquo;Figma For Web Designers 2.0&rsquo; 👉&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbHZzelU2RmxkX0xmZXJzMlZwMldBNHlZdXRSd3xBQ3Jtc0tuRUJ2aDh4eGNyOXJMN0tKUU1QMEpRdTRDQWJpeXpsZGVMN1RBNGR5ZE1RbHcyb2dTOUI1eG1PZ2pxMUoxaHdmTkhWY3V1MU43RHhfYllGOHpRYTdmUUYxeWlJODlGQ2JPYnFoYXJoa0lhdTl0VHQwUQ&q=https%3A%2F%2Fbit.ly%2F495ZokB&v=jQ1sfKIl50E\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://bit.ly/495ZokB</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\">&nbsp;FREE TRAINING: 3 Steps to Build a Thriving Web Design Career 👉&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbWktY292OHdORXFvby10NDNobE55ZkdYcGpRd3xBQ3Jtc0trZkRCTVZ4alA4b0pWSHk0dk1lbkVBaFRCM01xQVZoZ2V5NUd1Q2JpYjZPSXNrNU1CS2tWZkZyS1duZDhuMS1WYWE0TWVUQm9zamtBZU9tZGlXN0hxRF80cFA4SEFkT2hxVkhEZ1N0N0FsbzV2THZRSQ&q=https%3A%2F%2Fbit.ly%2F3Tiua2G&v=jQ1sfKIl50E\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://bit.ly/3Tiua2G</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\">&nbsp;Download the image used in the demo 👉&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3lYSjhRekMyRzZBc0RSSjc3Z3VXa05MX09Pd3xBQ3Jtc0tuZkpkN2tUakFodVZvMGFvNElKanNxMzFhT3B0STBtYjZ1VE5PSmxmcFJxUjY4V3drUHFmeHF4ZGJWMEZJOGR2MXQ1VU9MX19kVHhoVVBtWHp6cGw5NWNnZHZCQ1dtZEN0YV9XZ3U1dmw5aUJuTzJaRQ&q=https%3A%2F%2Funsplash.com%2Fphotos%2Fnorthern-light-at-night-cVBz9q1T_9M&v=jQ1sfKIl50E\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://unsplash.com/photos/northern-...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\">&nbsp;CHAPTERS</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=jQ1sfKIl50E&list=PLXC_gcsKLD6lovcamt6i27q0hbXq6fmwi&index=1\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">0:00</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\">&nbsp;Figma basics</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=jQ1sfKIl50E&list=PLXC_gcsKLD6lovcamt6i27q0hbXq6fmwi&index=1&t=449s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">7:29</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(228, 224, 250);\">&nbsp;Higher-level features</span></p>', 'https://www.youtube.com/watch?v=jQ1sfKIl50E&list=PLXC_gcsKLD6lovcamt6i27q0hbXq6fmwi', 'medium', NULL, 'yes', 5.72, 127, 15, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Figma Tutorial for Beginners (13-min crash course!)</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:03:13'),
(6, 2, 7, 6, 'http://127.0.0.1:8000/upload/course/694e756b310f9.jpg', 'Swift - Masterclass by Instructor 2 (Vol 1)', 'Swift - Masterclass by Instructor 2 (Vol 1)', 'swift-masterclass-by-instructor-2-vol-1', '<p>Ea nemo voluptatem sapiente accusamus hic et. Quisquam consequatur sed odit. Ad ipsam harum perferendis possimus ut cupiditate. Quos odio aut officia eos et id. Doloremque autem qui doloremque iusto architecto amet fugiat. Enim iusto excepturi mollitia ad dolorem provident impedit. Sint dolorem molestiae repudiandae nihil et quis molestias. Nulla totam ad nam enim aspernatur et explicabo. Necessitatibus magnam tenetur incidunt atque recusandae aliquid.</p>', 'https://www.youtube.com/watch?v=CwA1VWP0Ldw&t=1560s', 'advance', NULL, 'yes', 5.64, 57, 35, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Swift Programming Tutorial | FULL COURSE | Absolute Beginner</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:15:47');
INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video_url`, `label`, `resources`, `certificate`, `duration`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `can_have_quizzes`, `created_at`, `updated_at`) VALUES
(7, 1, 3, 6, 'http://127.0.0.1:8000/upload/course/694e75b7673fb.jpg', 'Node.js - Masterclass by Instructor 2 (Vol 2)', 'Node.js - Masterclass by Instructor 2 (Vol 2)', 'nodejs-masterclass-by-instructor-2-vol-2', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\" data-pasted=\"true\">[Prerequisite] Ultimate Javascript Tutorials:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\"><span dir=\"auto\" style=\"margin: 0px; padding: 0px 0px 1px; border: 0px; background: rgba(111, 201, 69, 0.17); border-radius: 8px;\"><a tabindex=\"0\" href=\"https://www.youtube.com/playlist?list=PLinedj3B30sDFRdgPYvjnBs2JsDdHPIMv\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">&nbsp; <span style=\"margin: 0.5px 0px 0px; padding: 0px; border: 0px; background: transparent; display: inline-block;\"><img alt=\"\" src=\"blob:http://127.0.0.1:8000/e32bb556-832b-43cb-91f1-0c0b4d391361\" style=\"padding: 0px; border: 0px; background: transparent; visibility: inherit; min-height: 1px; min-width: 1px; object-fit: fill; height: 10px; width: 14px;\" class=\"fr-fic fr-dii\"></span> &bull; Ultimate Javascript Tutorials &nbsp;</a></span></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\">&nbsp;► Complete Full Stack Web Developer RoadMap 2023:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\"><span dir=\"auto\" style=\"margin: 0px; padding: 0px 0px 1px; border: 0px; background: rgba(111, 201, 69, 0.17); border-radius: 8px;\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=qHy4UY58_Uc\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">&nbsp; <span style=\"margin: 0.5px 0px 0px; padding: 0px; border: 0px; background: transparent; display: inline-block;\"><img alt=\"\" src=\"blob:http://127.0.0.1:8000/f1683f24-a19a-466c-b3ee-d64dc1d77f47\" style=\"padding: 0px; border: 0px; background: transparent; visibility: inherit; min-height: 1px; min-width: 1px; object-fit: fill; height: 10px; width: 14px;\" class=\"fr-fic fr-dii\"></span> &bull; Complete Full Stack Web Developer Roadmap ... &nbsp;</a></span></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\">&nbsp;Quick Links Node.JS Website:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3lKTlBWczhENkxkODNlMWZYNS1nSkJMWXM5d3xBQ3Jtc0trdEtpQnVfR2lmaFQxNmpIS2lReWs4S005elltZnNfOUFWOEgzQVg0c0NSd3REaDZjcW43Y0pXV2ttRlNjYkxHenRoYWlyalZmMTBTeFg1aVJOWkZqZHRuY2htTkFnUzkzSjF1V2RZN1dBa1Q4Um1mSQ&q=https%3A%2F%2Fnodejs.org%2Fen%2F&v=ohIAiuHMKMI\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://nodejs.org/en/</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(232, 252, 223);\">&nbsp;Node.js is a JavaScript runtime built on Chrome&#39;s V8 JavaScript engine. It allows developers to run JavaScript on the server side, creating server-side applications with JavaScript.</span></p>', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 'medium', NULL, 'no', 12.52, 91, 10, '<p>Basic knowledge of Node.js</p>', 'no', 'yes', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:17:03'),
(8, 4, 13, 6, 'http://127.0.0.1:8000/upload/course/694e760ead279.jpg', 'Finance - Masterclass by Instructor 2 (Vol 3)', 'Finance - Masterclass by Instructor 2 (Vol 3)', 'finance-masterclass-by-instructor-2-vol-3', '<p>Eligendi tenetur ipsum suscipit quia quod soluta. Laboriosam ut voluptatibus cum est quia. Delectus sed unde praesentium harum dolor. Earum natus labore totam. Similique sed eos culpa autem itaque culpa. Itaque sed cupiditate quisquam nostrum porro enim voluptatibus. Exercitationem nemo hic quo alias magni quis et. Est libero necessitatibus cupiditate veniam. Et qui distinctio dolorum quos. Officia totam sunt cupiditate vero commodi commodi voluptatem. Id consequatur quo sit hic aliquam sunt. Voluptas animi consequatur atque aut quia et quia.</p>', 'https://www.youtube.com/watch?v=9cWUFy6qgWc&list=PLW6gAKWk8fHx-g3_kLYuZvcLPFF4fBXW-', 'medium', NULL, 'yes', 48.14, 147, 13, '<p><br data-pasted=\"true\"><span style=\"color: rgb(241, 241, 241); font-family: Roboto, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(15, 15, 15); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Lecture 1: Understanding the Structure of Finance Domain | How To Prepare for Finance Domain</span></p>', 'yes', 'yes', 'yes', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:18:30'),
(9, 3, 10, 6, 'http://127.0.0.1:8000/upload/course/694e76519ff5a.jpg', 'Graphic Design - Masterclass by Instructor 2 (Vol 4)', 'Graphic Design - Masterclass by Instructor 2 (Vol 4)', 'graphic-design-masterclass-by-instructor-2-vol-4', '<p><span style=\"color: rgb(252, 237, 223); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">Graphic Design Masterclass &ndash; Sponsored by Ethio telecom This journey is powered by Ethio telecom &ndash; connecting you to creativity.</span></p>', 'https://www.youtube.com/watch?v=LF9kA9A2G5s&list=PLqBRN6Coa27bpcY3zsEnAxFmr2idUjtb7', 'medium', NULL, 'yes', 26.15, 182, 15, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Introduction to Graphic Design Masterclass&nbsp;</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:19:37'),
(10, 1, 3, 6, 'http://127.0.0.1:8000/upload/course/694e769976747.jpg', 'Node.js - Masterclass by Instructor 2 (Vol 5)', 'Node.js - Masterclass by Instructor 2 (Vol 5)', 'nodejs-masterclass-by-instructor-2-vol-5', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(236, 252, 222);\" data-pasted=\"true\">Course Files:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXZXYWlTSzJfTDZmdjZrZFZRenZlb2xfM3hWUXxBQ3Jtc0ttdGs2WWcyVkFCdHhKX2dQSzloakxfTWc0LXZZRWlsU3dNZm04Nmt1STFxUmVhRnpFd1FFTTJPbWViMlAwdDRNenl2X2FMdEQ2MDJhbDlwSndIQkVBbTFsOGlOT1d5SGRZRFg5ZHI1c1BOS2RBTTB2VQ&q=https%3A%2F%2Fgithub.com%2Fsgupta8limitless%2Fnode-api-dev-nov-23&v=tXUtEgycggI\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://github.com/sgupta8limitless/n...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(236, 252, 222);\">&nbsp;Unlock the power of Node.js with our quick tutorial! 🌐 Dive into the fundamentals of Node.js and master the FS (File System) module for seamless file operations. Perfect for beginners and developers looking to enhance their skills. 🚨 Subscribe for more content and let&#39;s code together! 💻🎉</span></p>', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 'advance', NULL, 'yes', 47.45, 185, 29, '<p>Basic knowledge of Node.js</p>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:20:49'),
(11, 5, 18, 7, 'http://127.0.0.1:8000/upload/course/694e730595748.avif', 'Cloud Computing - Masterclass by Instructor 3 (Vol 1)', 'Cloud Computing - Masterclass by Instructor 3 (Vol 1)', 'cloud-computing-masterclass-by-instructor-3-vol-1', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\" data-pasted=\"true\">&quot;️🔥 Cloud Architect Masters Program -&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa0tVVjBFSWpJZlY4MVVscTIxejhTMkV1eTRQUXxBQ3Jtc0tucDlWWVB1NGRxZ3pjT0U5OUdYcFNEelEteG5jYU9Cbm5hck1mdHIxd3dhQ2t3UlVoUHVXSHJwTWgwR3J3enN4Z0VmYTRRbVNJYVFpZjhrT1g3ME0wZ2tqd3hJc0Z0dHVSNVB2UktVRE9ObFBHOVRzQQ&q=https%3A%2F%2Fwww.simplilearn.com%2Fcloud-solutions-architect-masters-program-training%3Futm_campaign%3DM988_fsOSWo%26utm_medium%3DDescriptionFFF%26utm_source%3DYoutube&v=M988_fsOSWo\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.simplilearn.com/cloud-sol...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\">️🔥Cloud Computing and DevOps Certification Program, delivered by Simplilearn in collaboration with Purdue University -&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbFZyNlV5Q0J5UHdzT1JCQWRkMUxkMVFNTXBld3xBQ3Jtc0ttd3RGZHVQRXFJMjhHazF2U3NVNm9vRnpROU5jNEV5WUttU0FYOTRXSlQ2U3I3SVlmazE1aV9BT3dKVzhaUXB0dUYxUFRmT19PR3E5QzRPYk55dmRlMFRUa0VvVldDeVJkc19MQkRPakZMdjhOZUF1WQ&q=https%3A%2F%2Fwww.simplilearn.com%2Fcloud-computing-devops-certificate-program%3Futm_campaign%3DM988_fsOSWo%26utm_medium%3DDescriptionFFF%26utm_source%3DYoutube&v=M988_fsOSWo\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.simplilearn.com/cloud-com...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\">️🔥IITK - Professional Certificate Program in Cloud Computing and DevOps -&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbkFNLVRyRUpfeEJBN0pIOHA0ZkVWLWtxcDVnQXxBQ3Jtc0trZ2JrWlluV05OS3lja3o3SFVvc0NmVjI1cnpocEZtd3Y3MlJDWXRhZGx5dFVvTXlRSlZiSHZZWHc5X3hnZ3doaGpwNkRxQXliMW9zM3ZPckRhY3ZJYVlsZWJ1a3phM0NQMDRZa1dWZ1UzUE1yZkI0NA&q=https%3A%2F%2Fwww.simplilearn.com%2Fcloud-computing-devops-course%3Futm_campaign%3DM988_fsOSWo%26utm_medium%3DDescriptionFFF%26utm_source%3DYoutube&v=M988_fsOSWo\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.simplilearn.com/cloud-com...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\">&quot; Cloud computing is a popular practice involving the internet to store and manage your data on the internet. In this video on cloud computing, we&#39;ll take you through all of the basic concepts of cloud computing like what makes it unique, its different models, and more. So without further ado, let&#39;s jump right into cloud computing. Don&#39;t forget to take the quiz at&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=M988_fsOSWo&t=303s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">05:03</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\">!&nbsp;</span></p>', 'https://www.youtube.com/watch?v=M988_fsOSWo', 'medium', NULL, 'yes', 24.84, 95, 16, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Cloud Computing In 6 Minutes | What Is Cloud Computing? | Cloud Computing Explained | Simplilearn</h1>', 'no', 'yes', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:07:20'),
(12, 5, 18, 7, 'http://127.0.0.1:8000/upload/course/694e73b9daccf.jpg', 'Cloud Computing - Masterclass by Instructor 3 (Vol 2)', 'Cloud Computing - Masterclass by Instructor 3 (Vol 2)', 'cloud-computing-masterclass-by-instructor-3-vol-2', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 243, 253);\" data-pasted=\"true\"><br>🔥 Cloud Architect Masters Program (Use Code &quot;𝐘𝐎𝐔𝐓𝐔𝐁𝐄𝟐𝟎&quot;):&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbUpndFVYOHo0ZzMwbDczeTdLd2hSWkRGbFNrQXxBQ3Jtc0tsbWkzbFJWc0xabFdUQ09IaDM3Y0RSNXRZNkNhdk9pQTkwZk5zTDViSC1Dc25vTFZvWlNnZUdjR2Q0QnRfZDdVREdqZ1ZuUkV5ekNWc1NabFZOMmpzVVZUQ1hYNDlqYVo4LWhQMjgyZE84bUdLSWRuRQ&q=https%3A%2F%2Fwww.edureka.co%2Fmasters-program%2Fcloud-architect-training&v=usYySG1nbfI\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.edureka.co/masters-progra...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 243, 253);\">This Edureka video on &quot;Introduction To Cloud&rdquo; will introduce you to basics of cloud computing and talk about different types of Cloud service provides and its service models. Following are the topics covered in this cloud computing tutorial for beginners: 1. What is Cloud Computing? 2. Uses of Cloud Computing 3. Cloud Computing Service Models 4. Cloud Computing Deployment Models 5. Cloud Service Providers 6. Cloud Computing Demo - AWS, Google Cloud, Azure</span><br><br></p>', 'https://www.youtube.com/watch?v=M988_fsOSWo', 'Bestseller', NULL, NULL, 45.37, 55, 13, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Cloud Computing Introduction | Cloud Computing Tutorial for Beginners | Cloud Certification |Edureka</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:08:33'),
(13, 4, 14, 7, 'http://127.0.0.1:8000/upload/course/694e740999f66.jpg', 'Marketing - Masterclass by Instructor 3 (Vol 3)', 'Marketing - Masterclass by Instructor 3 (Vol 3)', 'marketing-masterclass-by-instructor-3-vol-3', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 233, 224);\" data-pasted=\"true\">This week&#39;s video is brought to you by Artlist! &nbsp;They offer an excellent subscription for video, music and VoiceOver assets for your content and ads &nbsp;Sign up for Artlist with my link and get 2 extra months free if you purchase an annual subscription! &nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa01MYnhET3h3YXVCbXNPWTNZWVdubExmVjlYUXxBQ3Jtc0trTVVLeU51dlBJd2NpS2UyRE5GaVhVbjcyVU8wQVB0S190ZzFEYlRDa2dTV3oxSzlxNG9RdWwwckdITU95NmppcV9JXzE4ZGpBLVRoeHltc0ZDY01oX0VoNDRCWEZyNE92TWpRQ09OMnNsMVR4Ny1Pdw&q=https%3A%2F%2Fartlist.io%2Fartlist-70446%2F%3Fartlist_aid%3Dorenmeetsworld_3432%26utm_source%3Daffiliate_p%26utm_medium%3Dorenmeetsworld_3432%26utm_campaign%3Dorenmeetsworld_3432&v=FA57Uf8V3rQ\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://artlist.io/artlist-70446/?art...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 233, 224);\">&nbsp;This is what I use for all music and additional footage in my short form and long form videos. This video is about everything you need to know to get an overview of marketing - SEO, influencer marketing, organic social, meta ads, events, we cover it all.</span></p>', 'https://www.youtube.com/watch?v=FA57Uf8V3rQ', 'beginer', NULL, 'yes', 45.92, 102, 39, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">The Art of Marketing (Full Masterclass)</h1>', 'yes', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:09:53'),
(14, 3, 9, 7, 'http://127.0.0.1:8000/upload/course/694e746069dcd.jpg', 'UI/UX - Masterclass by Instructor 3 (Vol 4)', 'UI/UX - Masterclass by Instructor 3 (Vol 4)', 'uiux-masterclass-by-instructor-3-vol-4', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 233, 250);\" data-pasted=\"true\">Don&#39;t forget to take the quiz at&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/watch?v=ODpB9-MCa5s&t=443s\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">00:07:23</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 233, 250);\">! Comment below what you think is the right answer, to be one of the 3 lucky winners who can win Amazon vouchers worth INR 500 or $10! (Depending on your location). What are you waiting for? Winners will be announced on Mar 14th, 2025. &nbsp; 🔥IIIT Bangalore Advanced Certification In UI UX Design (India Only):&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbDNLV2I4dEhIWmtIN0daSTVjeWpnZk5uME1IZ3xBQ3Jtc0trOVhTV3piRFk1c0UwOF9MTDFOQXpYcllrQnlSQXZuc0toVkcyb2ZXaDhWT1Q2eWhncWxzMU1WXzM3STVMaDRYYzRKODMxdlRHNWlHOGpGazltbXJWWVVIV3VkcW5OS1BBYldEc3pnZ25Ud0xxLUZ0VQ&q=https%3A%2F%2Fwww.simplilearn.com%2Fui-ux-certification-training-course%3Futm_campaign%3DODpB9-MCa5s%26utm_medium%3DDescriptionFirstFold%26utm_source%3Dyoutube&v=ODpB9-MCa5s\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.simplilearn.com/ui-ux-cer...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 233, 250);\">&nbsp; &nbsp;🔥IIITB - Advanced Certification in UI UX Design(US ONLY) -&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbDdSUVp3OXdUR2I5SENyQjktUXRuazBWd3huZ3xBQ3Jtc0tuNERDMGsxYWxaMjRaMG85Qm1mUXdzVWl0YjZLZXY0eWFEclByaU1vOUZnQjJZR01TVjFJOUxDR0NwSlA5YTY5YktPbmgzMm1NSHc0bEwzMHU0MkV0a3pZb3QzMVhUN2VDWGVYU1Y5Mms1ZzNQVm5JVQ&q=https%3A%2F%2Fwww.simplilearn.com%2Fui-ux-certification-training-course%3Futm_campaign%3DODpB9-MCa5s%26utm_medium%3DDescriptionFirstFold%26utm_source%3Dyoutube&v=ODpB9-MCa5s\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.simplilearn.com/ui-ux-cer...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(224, 233, 250);\">&nbsp; &nbsp;In this video on &#39;What is UI/UX?&#39;, you&rsquo;ll follow Sam, a curious college student, as they set on a journey to understand how great design shapes the digital world. Through Sam&rsquo;s experience, you&rsquo;ll discover how UI (User Interface) focuses on the look and feel of apps and websites, while UX (User Experience) ensures they are intuitive and user-friendly. By exploring real-world design challenges, key UI/UX principles, and essential tools like Figma and Canva, you&rsquo;ll learn how thoughtful design improves usability and transforms ideas into seamless digital experiences. Following are the topics discussed in this video on UI UX for beginners:</span></p>', 'https://www.youtube.com/watch?v=ODpB9-MCa5s', 'advance', NULL, 'yes', 27.86, 69, 34, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">UI/UX Explained In 8 Minutes | UI/UX Design For Beginners | UI/UX Design Basics | Simplilearn</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:11:20');
INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video_url`, `label`, `resources`, `certificate`, `duration`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `can_have_quizzes`, `created_at`, `updated_at`) VALUES
(15, 2, 6, 7, 'http://127.0.0.1:8000/upload/course/694e74b22b046.jpg', 'React Native - Masterclass by Instructor 3 (Vol 5)', 'React Native - Masterclass by Instructor 3 (Vol 5)', 'react-native-masterclass-by-instructor-3-vol-5', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\" data-pasted=\"true\">React Native allows developers to build cross-platform apps for iOS, Android, and the Web from a single JavaScript codebase. Get started building your first native mobile app with React Native&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/react\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#react</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/mobiledev\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#mobiledev</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/hashtag/100secondsofcode\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">#100SecondsOfCode</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">&nbsp;🔗 Resources React Native Docs&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa09xcE5MOTZIWUtOX2NvQWN2cktQVEJ4RnUxQXxBQ3Jtc0traks0RXFndGFfS2RVU0o5RUZWUjN5YzNPeWFvMG51WTZxOG1SdVJoM2Ria0lleDJ4SXlEVll4ZVVrZW1vNzdYbk5SM1kzVUE3a3RNOHpzX19KVEdXRGFNX3l3VzdZSzFWLXd2WlJFWnN1SHFMX0dJVQ&q=https%3A%2F%2Freactnative.dev%2F&v=gvkqT_Uoahw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://reactnative.dev</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">Expo&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqblhWcUVGZWlMUThMNFpaOEtiV1FpZ2RYTzZ1Z3xBQ3Jtc0tteVJxeV9nTDFfM0JvT1pNaHNZRTBtbFJiZmI2ZWo4N0lsS1NxdFV2SXdmOUlNUi1icTdYSW9ubzZsS3NrQ0pmYTBKcGU2QmRPQUNndDBzTmFiTUpJQjFyQlJQaHhWY3RCWEQ2NFlJaVZXaWIzX3V0NA&q=https%3A%2F%2Fexpo.dev%2F&v=gvkqT_Uoahw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://expo.dev</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">RN Bridge&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3h2dHRraFBWRkVJb2pkbFFOMTI4dzlQZ3E0d3xBQ3Jtc0ttS29xUVdMNGpxMG1tdHF0QjFMQWc3Rjg0MFRVRVRrQ2pjWnh3QTZvTmoxSUk0QVJXbU1nYnZtUkJPSVYxOXhLbDVOb0xaTFQwYnB6VW5wQWFySUstLWFBTkVwdUdVR19xVG5GUW16QmplRndleFFmUQ&q=https%3A%2F%2Fhackernoon.com%2Funderstanding-react-native-bridge-concept-e9526066ddb8&v=gvkqT_Uoahw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://hackernoon.com/understanding-...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">&nbsp;🔥 Get More Content - Upgrade to PRO Upgrade to Fireship PRO at&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa0pWOEt4ODFUdlpQa1ZpZjgzVmJmQnRWejRyZ3xBQ3Jtc0ttZDFmb2pHLVA1OUxsQXhOZEJ1dGdKM3BjNWo4cEdQSHcxeXFkQTR4MVIyWC04bHRNRGVhLTBRSjZ0S3gtTnNNbmFrZENpckd2Nk9sUlVCTFFEc2NXZkFreTBLaU1SR3JMS1ZqSFJnQlhwUk8zWEdkMA&q=https%3A%2F%2Ffireship.io%2Fpro&v=gvkqT_Uoahw\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://fireship.io/pro</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(221, 246, 253);\">Use code lORhwXd2 for 25% off your first payment.&nbsp;</span></p>', 'https://www.youtube.com/watch?v=gvkqT_Uoahw', 'beginer', NULL, 'yes', 23.77, 143, 16, '<p><br data-pasted=\"true\"><span style=\"color: rgb(241, 241, 241); font-family: Roboto, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(15, 15, 15); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">React Native in 100 Seconds</span></p>', 'no', 'yes', 'yes', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:12:42'),
(16, 5, 19, 8, 'http://127.0.0.1:8000/upload/course/694e77df4fd24.jpg', 'Data Science - Masterclass by Instructor 4 (Vol 1)', 'Data Science - Masterclass by Instructor 4 (Vol 1)', 'data-science-masterclass-by-instructor-4-vol-1', '<p><span style=\"color: rgb(223, 233, 252); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">Start your journey of building job-ready skills for an in-demand career in Data Science by taking the first step in attending the FREE Data Science Masterclass</span></p>', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 'advance', NULL, 'yes', 36.51, 71, 28, '<p>Basic knowledge of Data Science</p>', 'yes', 'yes', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:26:15'),
(17, 4, 13, 8, 'http://127.0.0.1:8000/upload/course/694e785549146.jpg', 'Finance - Masterclass by Instructor 4 (Vol 2)', 'Finance - Masterclass by Instructor 4 (Vol 2)', 'finance-masterclass-by-instructor-4-vol-2', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 228, 224);\" data-pasted=\"true\">n this value-packed episode, we are joined with Peeyush Chitlangia from&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/@FinShiksha\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">‪@FinShiksha‬</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 228, 224);\">&nbsp; to give a practical walkthrough of how financial modeling works &mdash; from forecasting Maruti Suzuki&rsquo;s revenue to linking balance sheets, P&amp;L, and cash flow statements. Learn how to source real data, make correct assumptions, and use Excel to model company performance and valuation. The conversation also sheds light on how financial modeling acts as a non-negotiable skill for roles in equity research, PE/VC, and investment banking, and how professionals from diverse backgrounds (CAs, MBAs, engineers) can master it and command top salaries. From job market realities to projection techniques, this is a must-watch for every finance aspirant.</span></p>', 'https://www.youtube.com/watch?v=9cWUFy6qgWc&list=PLW6gAKWk8fHx-g3_kLYuZvcLPFF4fBXW-', 'Bestseller', NULL, NULL, 15.68, 61, 24, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Lecture 1: Understanding the Structure of Finance Domain | How To Prepare for Finance Domain</h1>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:28:13'),
(18, 5, 18, 8, 'http://127.0.0.1:8000/upload/course/694e78a61c503.avif', 'Cloud Computing - Masterclass by Instructor 4 (Vol 3)', 'Cloud Computing - Masterclass by Instructor 4 (Vol 3)', 'cloud-computing-masterclass-by-instructor-4-vol-3', '<p><span style=\"color: rgb(221, 253, 244); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">This cource provides a comprehensive overview of the Cloud Computing syllabus, covering everything from foundational concepts to advanced topics. We&rsquo;ll explore cloud architectures, deployment models, services, and the key technologies that power modern cloud solutions.</span></p>', 'https://www.youtube.com/watch?v=M988_fsOSWo', 'advance', NULL, 'yes', 14.41, 173, 19, '<h1 style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(15, 15, 15); word-break: break-word; font-family: Roboto, Arial, sans-serif; font-size: 2rem; line-height: 2.8rem; font-weight: 700; overflow: hidden; max-height: 5.6rem; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal; color: rgb(241, 241, 241); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-pasted=\"true\">Complete Cloud 🌧️ Computing Syllabus | Cloud Computing for Interviews, College &amp; Universities Exam</h1>', 'no', 'no', 'yes', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:29:34'),
(19, 4, 13, 8, 'http://127.0.0.1:8000/upload/course/694e78e7a2edd.jpg', 'Finance - Masterclass by Instructor 4 (Vol 4)', 'Finance - Masterclass by Instructor 4 (Vol 4)', 'finance-masterclass-by-instructor-4-vol-4', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 228, 224);\" data-pasted=\"true\">➡ Join This Group To Be Invited To Future Offline KwK Events in Mumbai:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbTU2eDQwTV83Mmpra2VYX3VSNFpfRXRfUW8wd3xBQ3Jtc0ttazctUFpfR0YxNE0tYTdrX0lkWVA3aUlQdy1NZDdxd1dmOGV0UEdtd1ZxeDI4TG5pcEgwbXgyaEx0dU1MdzAydnNTV1pxU2JZblRha2Y4ZGt1QUdfa2lWTVlDU3hLekhETEY5LVJjYTVwblIwd2o1UQ&q=https%3A%2F%2Fchat.whatsapp.com%2FF3MbHDPwTwC..&v=zz7JXlikFKA\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://chat.whatsapp.com/F3MbHDPwTwC..</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 228, 224);\">. &nbsp;In this value-packed episode, we are joined with Peeyush Chitlangia from&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/@FinShiksha\" target=\"\" style=\"text-decoration: none; display: inline; color: inherit;\">‪@FinShiksha‬</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(250, 228, 224);\">&nbsp; to give a practical walkthrough of how financial modeling works &mdash; from forecasting Maruti Suzuki&rsquo;s revenue to linking balance sheets, P&amp;L, and cash flow statements. Learn how to source real data, make correct assumptions, and use Excel to model company performance and valuation. The conversation also sheds light on how financial modeling acts as a non-negotiable skill for roles in equity research, PE/VC, and investment banking, and how professionals from diverse backgrounds (CAs, MBAs, engineers) can master it and command top salaries. From job market realities to projection techniques, this is a must-watch for every finance aspirant.</span></p>', 'https://www.youtube.com/watch?v=zz7JXlikFKA&t=6s', 'advance', NULL, 'yes', 8.79, 142, 24, '<p>Basic knowledge of Finance</p>', 'yes', 'yes', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 06:30:39'),
(21, 3, 10, 9, 'http://127.0.0.1:8000/upload/course/694e6ed0d5e6c.jpg', 'Graphic Design - Masterclass by Instructor 5 (Vol 1)', 'Graphic Design - Masterclass by Instructor 5 (Vol 1)', 'graphic-design-masterclass-by-instructor-5-vol-1', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(252, 232, 222);\" data-pasted=\"true\">So you want to be a graphic designer? Learn the fundamentals of design in this graphic design basics course. ► The broadest range of asset categories, all in one place:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbmZIRGpORm5SZ2F1NW1VMWNqMDJKemhpcFpyUXxBQ3Jtc0ttcUMwbjhGZGprUDJvRXBva1N2SkEtMnZfOE9RejBuNk5qQ0JCMlVFckd1VFI4TV9zU3RfUXlzRDN0cElNb1kwRWlFR3hpNjByY19GZFNEOGZyZGhhLU1CX043cjZDUXhPR2VpT1hzVzNBRm9KMy0yMA&q=https%3A%2F%2Felements.envato.com%2F%3Futm_campaign%3Dyt_tutsplus_GQS7wPujL2k%26utm_medium%3Dreferral%26utm_source%3Dyoutube.com%26utm_content%3Ddescription&v=GQS7wPujL2k\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://elements.envato.com/?utm_camp...</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(252, 232, 222);\">&nbsp;Follow along with Laura Keung and learn everything from basic design principles and color theory to typography and brand design. &nbsp;You&rsquo;ll learn how to apply graphic design theory to print and digital products, what a professional design workflow looks like, and how to use design assets to create your best work.&nbsp;</span></p>', 'https://www.youtube.com/watch?v=GQS7wPujL2k', 'beginer', NULL, 'no', 5.95, 99, 20, '<p>Basic knowledge of Graphic Design</p>', 'no', 'no', 'no', 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:47:36'),
(22, 4, 15, 9, 'http://127.0.0.1:8000/upload/course/694e6c3ba7f5d.jpg', 'Entrepreneurship - Masterclass by Instructor 5 (Vol 2)', 'Entrepreneurship - Masterclass by Instructor 5 (Vol 2)', 'entrepreneurship-masterclass-by-instructor-5-vol-2', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(237, 237, 237);\" data-pasted=\"true\">Sometimes, you need to break the rules to innovate &mdash; but which ones? Entrepreneurship professor John Mullins shares six counter-conventional mindsets for entrepreneurs looking to think strategically, navigate challenges and change the world. If you love watching TED Talks like this one, become a TED Member to support our mission of spreading ideas:&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbEF6aElIcnAyNElrbHMxbFBVaHpkVkY2cWNaQXxBQ3Jtc0tudVBaNmFybm5GYmNTeURlZHRSV0RzZzF1dzd4ZElqcExJcnlVTWxPUkxxZlY3ZTNoR2VDMEJNWUVwREdEX211WDl0Sno4bHowX2Jxci04c0c5ZTZBb2wzSWphRkk1ZUFXMmJBZHg1blY3T0IyM1dsVQ&q=https%3A%2F%2Fted.com%2Fmembership&v=eHJnEHyyN1Y\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://ted.com/membership</a></span></p>', 'https://www.youtube.com/watch?v=eHJnEHyyN1Y', 'medium', NULL, 'yes', 30.01, 163, 27, '<p>Basic knowledge of Entrepreneurship</p>', 'no', 'yes', 'no', 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:36:35'),
(23, 3, 9, 9, 'http://127.0.0.1:8000/upload/course/694e6cb7749c7.jpg', 'UI/UX - Masterclass by Instructor 5 (Vol 3)', 'UI/UX - Masterclass by Instructor 5 (Vol 3)', 'uiux-masterclass-by-instructor-5-vol-3', '<p><span style=\"color: rgb(224, 250, 243); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">Are you ready to dive into the fascinating world of User Interface and User Experience design? ✨Whether you&#39;re a beginner looking to start a new career, or a seasoned designer aiming to refine your skills, this course is perfect for you. ✨ In this in-depth guide, I unveil the secrets of UI/UX design, providing you with expert tips, insider strategies, and a comprehensive roadmap to success. Join me on this journey as I explore the art and science behind creating exceptional user experiences.</span></p>', 'https://www.youtube.com/watch?v=O5IXf8qB9U4&list=PLdvOfoe7PXT0ouChAnR1nHlT8BJIo5hP_', 'advance', NULL, 'yes', 16.09, 77, 36, '<p>Basic knowledge of UI/UX</p>', 'no', 'no', 'yes', 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:38:39'),
(24, 3, 11, 9, 'http://127.0.0.1:8000/upload/course/694e6d292f904.jpg', 'Figma - Masterclass by Instructor 5 (Vol 4)', 'Figma - Masterclass by Instructor 5 (Vol 4)', 'figma-masterclass-by-instructor-5-vol-4', '<p><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(231, 222, 252);\" data-pasted=\"true\">Want to learn Figma but don&rsquo;t know where to start? This 2022 updated, step-by-step tutorial will give you everything you need to start using Figma in your Web and UI design projects....Remember to Subscribe&nbsp;</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbEJOUXlnWGRRMUJpVjgyeVpDVktrdmhVVkpJZ3xBQ3Jtc0ttTUVWb0VXZjA0TDJSQklMMHlBQUgzdHJ5TUZXamQxaS1IdmFaS0RVSGlaVEFZNG9ZVE9iem8wSGZudkNPdFR3ZW5SUmtYcXZaVG1aU0dlZ0NLeGRlNHJnRnJzQVc2MVlhWG9NVDRUMnhNVDg5T2FKUQ&q=https%3A%2F%2Fgoo.gl%2F6vCw64&v=II-6dDzc-80\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://goo.gl/6vCw64</a></span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(231, 222, 252);\">&nbsp; I have been using Figma for 4 years in my design work and just love the tool so much. In this video, I cover all the basics you would need to know you start using Figma today in your professional design work. By the time you&#39;re done watching the video, you should be able to download the program, install, start making amazing things, and wonder why you ever waited to make the switch. ------------------------------------------------------------------------------------ 🤝 //////////// Get my new Intro to UI/UX design course:</span><span dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgba(255, 255, 255, 0.1); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(62, 166, 255);\"><a tabindex=\"0\" href=\"https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXRRVzZRN1UzNmVRN1FDOW1Ndnk4VURpcVl3Z3xBQ3Jtc0trLTl0cXppZE02T0tkTEY0RUJOQVJyZmo2ak10VGZzOFE1bk9JSlhBTUtUaHRid0w3MlNUdS1FRlVpeTNDRFg0ZVZ4ZzhqYkRoemwyQXBNalVVSzhqUWdteHhwNGp5MThTa1FxS2NzQ2U5WGFrSkVKYw&q=https%3A%2F%2Fwww.jesseshowalter.com%2Fc%2Fintro-to-ui-ux-design%2F&v=II-6dDzc-80\" rel=\"nofollow\" target=\"_blank\" style=\"text-decoration: none; display: inline; color: inherit;\">https://www.jesseshowalter.com/c/intr...</a></span></p>', 'https://www.youtube.com/watch?v=II-6dDzc-80', 'medium', NULL, 'yes', 32.91, 143, 25, '<p>Basic knowledge of Figma</p>', 'yes', 'no', 'no', 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:40:33'),
(25, 3, 9, 9, 'http://127.0.0.1:8000/upload/course/694e6da4b9392.jpg', 'UI/UX - Masterclass by Instructor 5 (Vol 5)', 'UI/UX - Masterclass by Instructor 5 (Vol 5)', 'uiux-masterclass-by-instructor-5-vol-5', '<p><span style=\"color: rgb(250, 226, 224); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">Want to become a UI/UX Designer in 2025 but don&rsquo;t know where to start? This UI/UX Design Full Course for Absolute Beginners by Intellipaat is your all-in-one video to learn the fundamentals, tools, and real-world skills needed to kick-start your career in design! You&#39;ll begin with an easy-to-follow UI/UX career roadmap, and then dive into essential design principles like Atomic Design, UI Elements, and what makes good vs bad UI. You&#39;ll master color theory using the 60-30-10 rule, understand how to build style guides and design systems, and learn about inclusive design and accessibility including WCAG guidelines and how to create accessibility sheets. This course also covers usability evaluation methods, quantitative vs qualitative testing, user load, and explores UX design patterns in detail. Dive deep into powerful UX laws like Fitts&rsquo;, Hick&rsquo;s, Jakob&rsquo;s, and more, followed by a hands-on UX workshop, UI card design practice, and a real-world UX case study. To wrap it up, you&#39;ll get insider tips with UI/UX interview questions and answers to help you prepare for job opportunities.</span></p>', 'https://www.youtube.com/watch?v=MBblN98-5lg', 'beginer', NULL, 'no', 5.17, 197, 36, '<p><span style=\"color: rgb(250, 226, 224); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(255, 255, 255, 0.1); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\" data-pasted=\"true\">Want to become a UI/UX Designer in 2025 but don&rsquo;t know where to start? This UI/UX Design Full Course for Absolute Beginners by Intellipaat is your all-in-one video to learn the fundamentals, tools, and real-world skills needed to kick-start your career in design! You&#39;ll begin with an easy-to-follow UI/UX career roadmap, and then dive into essential design principles like Atomic Design, UI Elements, and what makes good vs bad UI. You&#39;ll master color theory using the 60-30-10 rule, understand how to build style guides and design systems, and learn about inclusive design and accessibility including WCAG guidelines and how to create accessibility sheets. This course also covers usability evaluation methods, quantitative vs qualitative testing, user load, and explores UX design patterns in detail. Dive deep into powerful UX laws like Fitts&rsquo;, Hick&rsquo;s, Jakob&rsquo;s, and more, followed by a hands-on UX workshop, UI card design practice, and a real-world UX case study. To wrap it up, you&#39;ll get insider tips with UI/UX interview questions and answers to help you prepare for job opportunities.</span></p>', 'no', 'no', 'yes', 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `course_goals`
--

CREATE TABLE `course_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `goal_name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_goals`
--

INSERT INTO `course_goals` (`id`, `course_id`, `goal_name`, `created_at`, `updated_at`) VALUES
(76, 22, 'Goal 1: Master Entrepreneurship core concepts.', '2025-12-26 05:36:35', '2025-12-26 05:36:35'),
(77, 22, 'Goal 2: Master Entrepreneurship core concepts.', '2025-12-26 05:36:35', '2025-12-26 05:36:35'),
(78, 22, 'Goal 3: Master Entrepreneurship core concepts.', '2025-12-26 05:36:35', '2025-12-26 05:36:35'),
(79, 23, 'Goal 1: Master UI/UX core concepts.', '2025-12-26 05:38:39', '2025-12-26 05:38:39'),
(80, 23, 'Goal 2: Master UI/UX core concepts.', '2025-12-26 05:38:39', '2025-12-26 05:38:39'),
(81, 23, 'Goal 3: Master UI/UX core concepts.', '2025-12-26 05:38:39', '2025-12-26 05:38:39'),
(82, 24, 'Goal 1: Master Figma core concepts.', '2025-12-26 05:40:33', '2025-12-26 05:40:33'),
(83, 24, 'Goal 2: Master Figma core concepts.', '2025-12-26 05:40:33', '2025-12-26 05:40:33'),
(84, 24, 'Goal 3: Master Figma core concepts.', '2025-12-26 05:40:33', '2025-12-26 05:40:33'),
(91, 25, 'Goal 1: Master UI/UX core concepts.', '2025-12-26 05:44:51', '2025-12-26 05:44:51'),
(92, 25, 'Goal 2: Master UI/UX core concepts.', '2025-12-26 05:44:51', '2025-12-26 05:44:51'),
(93, 25, 'Goal 3: Master UI/UX core concepts.', '2025-12-26 05:44:51', '2025-12-26 05:44:51'),
(94, 21, 'Goal 1: Master Graphic Design core concepts.', '2025-12-26 05:47:36', '2025-12-26 05:47:36'),
(95, 21, 'Goal 2: Master Graphic Design core concepts.', '2025-12-26 05:47:36', '2025-12-26 05:47:36'),
(96, 21, 'Goal 3: Master Graphic Design core concepts.', '2025-12-26 05:47:36', '2025-12-26 05:47:36'),
(97, 1, 'Goal 1: Master Swift core concepts.', '2025-12-26 05:56:09', '2025-12-26 05:56:09'),
(98, 1, 'Goal 2: Master Swift core concepts.', '2025-12-26 05:56:09', '2025-12-26 05:56:09'),
(99, 1, 'Goal 3: Master Swift core concepts.', '2025-12-26 05:56:09', '2025-12-26 05:56:09'),
(100, 2, 'Goal 1: Master Management core concepts.', '2025-12-26 05:58:38', '2025-12-26 05:58:38'),
(101, 2, 'Goal 2: Master Management core concepts.', '2025-12-26 05:58:38', '2025-12-26 05:58:38'),
(102, 2, 'Goal 3: Master Management core concepts.', '2025-12-26 05:58:38', '2025-12-26 05:58:38'),
(106, 3, 'Goal 1: Master Kotlin core concepts.', '2025-12-26 06:00:31', '2025-12-26 06:00:31'),
(107, 3, 'Goal 2: Master Kotlin core concepts.', '2025-12-26 06:00:31', '2025-12-26 06:00:31'),
(108, 3, 'Goal 3: Master Kotlin core concepts.', '2025-12-26 06:00:31', '2025-12-26 06:00:31'),
(109, 4, 'Goal 1: Master Python core concepts.', '2025-12-26 06:01:53', '2025-12-26 06:01:53'),
(110, 4, 'Goal 2: Master Python core concepts.', '2025-12-26 06:01:53', '2025-12-26 06:01:53'),
(111, 4, 'Goal 3: Master Python core concepts.', '2025-12-26 06:01:53', '2025-12-26 06:01:53'),
(115, 5, 'Goal 1: Master Figma core concepts.', '2025-12-26 06:03:13', '2025-12-26 06:03:13'),
(116, 5, 'Goal 2: Master Figma core concepts.', '2025-12-26 06:03:13', '2025-12-26 06:03:13'),
(117, 5, 'Goal 3: Master Figma core concepts.', '2025-12-26 06:03:13', '2025-12-26 06:03:13'),
(124, 11, 'Goal 1: Master Cloud Computing core concepts.', '2025-12-26 06:07:32', '2025-12-26 06:07:32'),
(125, 11, 'Goal 2: Master Cloud Computing core concepts.', '2025-12-26 06:07:32', '2025-12-26 06:07:32'),
(126, 11, 'Goal 3: Master Cloud Computing core concepts.', '2025-12-26 06:07:32', '2025-12-26 06:07:32'),
(127, 12, 'Goal 1: Master Cloud Computing core concepts.', '2025-12-26 06:08:33', '2025-12-26 06:08:33'),
(128, 12, 'Goal 2: Master Cloud Computing core concepts.', '2025-12-26 06:08:33', '2025-12-26 06:08:33'),
(129, 12, 'Goal 3: Master Cloud Computing core concepts.', '2025-12-26 06:08:33', '2025-12-26 06:08:33'),
(130, 13, 'Goal 1: Master Marketing core concepts.', '2025-12-26 06:09:53', '2025-12-26 06:09:53'),
(131, 13, 'Goal 2: Master Marketing core concepts.', '2025-12-26 06:09:53', '2025-12-26 06:09:53'),
(132, 13, 'Goal 3: Master Marketing core concepts.', '2025-12-26 06:09:53', '2025-12-26 06:09:53'),
(136, 14, 'Goal 1: Master UI/UX core concepts.', '2025-12-26 06:11:20', '2025-12-26 06:11:20'),
(137, 14, 'Goal 2: Master UI/UX core concepts.', '2025-12-26 06:11:20', '2025-12-26 06:11:20'),
(138, 14, 'Goal 3: Master UI/UX core concepts.', '2025-12-26 06:11:20', '2025-12-26 06:11:20'),
(139, 15, 'Goal 1: Master React Native core concepts.', '2025-12-26 06:12:42', '2025-12-26 06:12:42'),
(140, 15, 'Goal 2: Master React Native core concepts.', '2025-12-26 06:12:42', '2025-12-26 06:12:42'),
(141, 15, 'Goal 3: Master React Native core concepts.', '2025-12-26 06:12:42', '2025-12-26 06:12:42'),
(142, 6, 'Goal 1: Master Swift core concepts.', '2025-12-26 06:15:47', '2025-12-26 06:15:47'),
(143, 6, 'Goal 2: Master Swift core concepts.', '2025-12-26 06:15:47', '2025-12-26 06:15:47'),
(144, 6, 'Goal 3: Master Swift core concepts.', '2025-12-26 06:15:47', '2025-12-26 06:15:47'),
(145, 7, 'Goal 2: Master Node.js core concepts.', '2025-12-26 06:17:03', '2025-12-26 06:17:03'),
(146, 7, 'Goal 3: Master Node.js core concepts.', '2025-12-26 06:17:03', '2025-12-26 06:17:03'),
(147, 8, 'Goal 1: Master Finance core concepts.', '2025-12-26 06:18:30', '2025-12-26 06:18:30'),
(148, 8, 'Goal 2: Master Finance core concepts.', '2025-12-26 06:18:30', '2025-12-26 06:18:30'),
(149, 8, 'Goal 3: Master Finance core concepts.', '2025-12-26 06:18:30', '2025-12-26 06:18:30'),
(150, 9, 'Goal 1: Master Graphic Design core concepts.', '2025-12-26 06:19:37', '2025-12-26 06:19:37'),
(151, 9, 'Goal 2: Master Graphic Design core concepts.', '2025-12-26 06:19:37', '2025-12-26 06:19:37'),
(152, 9, 'Goal 3: Master Graphic Design core concepts.', '2025-12-26 06:19:37', '2025-12-26 06:19:37'),
(153, 10, 'Goal 1: Master Node.js core concepts.', '2025-12-26 06:20:49', '2025-12-26 06:20:49'),
(154, 10, 'Goal 2: Master Node.js core concepts.', '2025-12-26 06:20:49', '2025-12-26 06:20:49'),
(155, 10, 'Goal 3: Master Node.js core concepts.', '2025-12-26 06:20:49', '2025-12-26 06:20:49'),
(156, 16, 'Goal 1: Master Data Science core concepts.', '2025-12-26 06:26:15', '2025-12-26 06:26:15'),
(157, 16, 'Goal 2: Master Data Science core concepts.', '2025-12-26 06:26:15', '2025-12-26 06:26:15'),
(158, 16, 'Goal 3: Master Data Science core concepts.', '2025-12-26 06:26:15', '2025-12-26 06:26:15'),
(159, 17, 'Goal 1: Master Finance core concepts.', '2025-12-26 06:28:13', '2025-12-26 06:28:13'),
(160, 17, 'Goal 2: Master Finance core concepts.', '2025-12-26 06:28:13', '2025-12-26 06:28:13'),
(161, 17, 'Goal 3: Master Finance core concepts.', '2025-12-26 06:28:13', '2025-12-26 06:28:13'),
(162, 18, 'Goal 1: Master Cloud Computing core concepts.', '2025-12-26 06:29:34', '2025-12-26 06:29:34'),
(163, 18, 'Goal 2: Master Cloud Computing core concepts.', '2025-12-26 06:29:34', '2025-12-26 06:29:34'),
(164, 18, 'Goal 3: Master Cloud Computing core concepts.', '2025-12-26 06:29:34', '2025-12-26 06:29:34'),
(165, 19, 'Goal 1: Master Finance core concepts.', '2025-12-26 06:30:39', '2025-12-26 06:30:39'),
(166, 19, 'Goal 2: Master Finance core concepts.', '2025-12-26 06:30:39', '2025-12-26 06:30:39'),
(167, 19, 'Goal 3: Master Finance core concepts.', '2025-12-26 06:30:39', '2025-12-26 06:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `course_lectures`
--

CREATE TABLE `course_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_live` tinyint(1) NOT NULL DEFAULT 0,
  `live_link` varchar(255) DEFAULT NULL,
  `live_id` varchar(255) DEFAULT NULL,
  `live_password` varchar(255) DEFAULT NULL,
  `live_date` date DEFAULT NULL,
  `live_time` time DEFAULT NULL,
  `video_duration` decimal(8,2) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `drip_days` int(11) NOT NULL DEFAULT 0 COMMENT 'Days after enrollment to unlock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lectures`
--

INSERT INTO `course_lectures` (`id`, `course_id`, `section_id`, `lecture_title`, `url`, `content`, `is_live`, `live_link`, `live_id`, `live_password`, `live_date`, `live_time`, `video_duration`, `display_order`, `is_free`, `drip_days`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 1, 1, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 1, 1, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 1, 2, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 1, 2, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 1, 2, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 2, 3, 'Lecture 1 - Learning Management Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 2, 3, 'Lecture 2 - Learning Management Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 2, 3, 'Lecture 3 - Learning Management Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 2, 4, 'Lecture 1 - Learning Management Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 2, 4, 'Lecture 2 - Learning Management Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 2, 4, 'Lecture 3 - Learning Management Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 3, 5, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 3, 5, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 3, 5, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 3, 6, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 3, 6, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 3, 6, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 4, 7, 'Lecture 1 - Learning Python Step 1', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 4, 7, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 4, 7, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 4, 8, 'Lecture 1 - Learning Python Step 1', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 4, 8, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 4, 8, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 5, 9, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 5, 9, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 5, 9, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 5, 10, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 5, 10, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 5, 10, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 6, 11, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 6, 11, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 6, 11, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 6, 12, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 6, 12, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 6, 12, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 7, 13, 'Lecture 1 - Learning Node.js Step 1', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 7, 13, 'Lecture 2 - Learning Node.js Step 2', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 7, 13, 'Lecture 3 - Learning Node.js Step 3', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 7, 14, 'Lecture 1 - Learning Node.js Step 1', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 7, 14, 'Lecture 2 - Learning Node.js Step 2', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 7, 14, 'Lecture 3 - Learning Node.js Step 3', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 8, 15, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(44, 8, 15, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(45, 8, 15, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(46, 8, 16, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(47, 8, 16, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(48, 8, 16, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(49, 9, 17, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(50, 9, 17, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(51, 9, 17, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(52, 9, 18, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(53, 9, 18, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(54, 9, 18, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(55, 10, 19, 'Lecture 1 - Learning Node.js Step 1', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(56, 10, 19, 'Lecture 2 - Learning Node.js Step 2', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(57, 10, 19, 'Lecture 3 - Learning Node.js Step 3', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(58, 10, 20, 'Lecture 1 - Learning Node.js Step 1', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(59, 10, 20, 'Lecture 2 - Learning Node.js Step 2', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(60, 10, 20, 'Lecture 3 - Learning Node.js Step 3', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(61, 11, 21, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(62, 11, 21, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(63, 11, 21, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(64, 11, 22, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(65, 11, 22, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(66, 11, 22, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(67, 12, 23, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(68, 12, 23, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(69, 12, 23, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(70, 12, 24, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(71, 12, 24, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(72, 12, 24, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(73, 13, 25, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(74, 13, 25, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(75, 13, 25, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(76, 13, 26, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(77, 13, 26, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(78, 13, 26, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(79, 14, 27, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(80, 14, 27, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(81, 14, 27, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(82, 14, 28, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(83, 14, 28, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(84, 14, 28, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(85, 15, 29, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(86, 15, 29, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(87, 15, 29, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(88, 15, 30, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(89, 15, 30, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(90, 15, 30, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(91, 16, 31, 'Lecture 1 - Learning Data Science Step 1', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(92, 16, 31, 'Lecture 2 - Learning Data Science Step 2', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(93, 16, 31, 'Lecture 3 - Learning Data Science Step 3', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(94, 16, 32, 'Lecture 1 - Learning Data Science Step 1', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(95, 16, 32, 'Lecture 2 - Learning Data Science Step 2', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(96, 16, 32, 'Lecture 3 - Learning Data Science Step 3', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(97, 17, 33, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(98, 17, 33, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(99, 17, 33, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(100, 17, 34, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(101, 17, 34, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(102, 17, 34, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(103, 18, 35, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(104, 18, 35, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(105, 18, 35, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(106, 18, 36, 'Lecture 1 - Learning Cloud Computing Step 1', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(107, 18, 36, 'Lecture 2 - Learning Cloud Computing Step 2', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(108, 18, 36, 'Lecture 3 - Learning Cloud Computing Step 3', 'https://www.youtube.com/watch?v=M988_fsOSWo', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(109, 19, 37, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(110, 19, 37, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(111, 19, 37, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(112, 19, 38, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(113, 19, 38, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(114, 19, 38, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(121, 21, 41, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(122, 21, 41, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 2, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(123, 21, 41, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 3, 0, 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(124, 21, 42, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(125, 21, 42, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(126, 21, 42, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(127, 22, 43, 'Lecture 1 - Learning Entrepreneurship Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(128, 22, 43, 'Lecture 2 - Learning Entrepreneurship Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(129, 22, 43, 'Lecture 3 - Learning Entrepreneurship Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(130, 22, 44, 'Lecture 1 - Learning Entrepreneurship Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(131, 22, 44, 'Lecture 2 - Learning Entrepreneurship Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(132, 22, 44, 'Lecture 3 - Learning Entrepreneurship Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(133, 23, 45, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(134, 23, 45, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(135, 23, 45, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(136, 23, 46, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(137, 23, 46, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(138, 23, 46, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(139, 24, 47, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(140, 24, 47, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(141, 24, 47, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(142, 24, 48, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(143, 24, 48, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(144, 24, 48, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(145, 25, 49, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(146, 25, 49, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(147, 25, 49, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(148, 25, 50, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(149, 25, 50, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(150, 25, 50, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 3, 0, 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `material_title` varchar(255) NOT NULL,
  `type` enum('pdf','link','file','other') NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `external_url` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_materials`
--

INSERT INTO `course_materials` (`id`, `course_id`, `section_id`, `material_title`, `type`, `file_path`, `external_url`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Master Guide 1 - Swift', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 1, 1, 'Master Guide 2 - Swift', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 1, 1, 'Master Guide 3 - Swift', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 2, 3, 'Master Guide 1 - Management', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 2, 3, 'Master Guide 2 - Management', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 2, 3, 'Master Guide 3 - Management', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 3, 5, 'Master Guide 1 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 3, 5, 'Master Guide 2 - Kotlin', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 3, 5, 'Master Guide 3 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 4, 7, 'Master Guide 1 - Python', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 4, 7, 'Master Guide 2 - Python', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 5, 9, 'Master Guide 1 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 5, 9, 'Master Guide 2 - Figma', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 5, 10, 'Master Guide 3 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 6, 11, 'Master Guide 1 - Swift', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 6, 11, 'Master Guide 2 - Swift', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 7, 13, 'Master Guide 1 - Node.js', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 7, 13, 'Master Guide 2 - Node.js', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 7, 14, 'Master Guide 3 - Node.js', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 8, 15, 'Master Guide 1 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 8, 15, 'Master Guide 2 - Finance', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 8, 15, 'Master Guide 3 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 9, 17, 'Master Guide 1 - Graphic Design', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 9, 17, 'Master Guide 2 - Graphic Design', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 9, 18, 'Master Guide 3 - Graphic Design', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 10, 19, 'Master Guide 1 - Node.js', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 10, 19, 'Master Guide 2 - Node.js', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 10, 19, 'Master Guide 3 - Node.js', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 11, 21, 'Master Guide 1 - Cloud Computing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 11, 21, 'Master Guide 2 - Cloud Computing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 12, 23, 'Master Guide 1 - Cloud Computing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 12, 23, 'Master Guide 2 - Cloud Computing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 12, 23, 'Master Guide 3 - Cloud Computing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 13, 25, 'Master Guide 1 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 13, 25, 'Master Guide 2 - Marketing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 13, 25, 'Master Guide 3 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 14, 27, 'Master Guide 1 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 14, 27, 'Master Guide 2 - UI/UX', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 14, 27, 'Master Guide 3 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 15, 29, 'Master Guide 1 - React Native', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 15, 29, 'Master Guide 2 - React Native', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 15, 29, 'Master Guide 3 - React Native', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 16, 31, 'Master Guide 1 - Data Science', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(44, 16, 31, 'Master Guide 2 - Data Science', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(45, 16, 32, 'Master Guide 3 - Data Science', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(46, 17, 33, 'Master Guide 1 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(47, 17, 33, 'Master Guide 2 - Finance', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(48, 17, 33, 'Master Guide 3 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(49, 18, 35, 'Master Guide 1 - Cloud Computing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(50, 18, 35, 'Master Guide 2 - Cloud Computing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(51, 18, 35, 'Master Guide 3 - Cloud Computing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=M988_fsOSWo', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(52, 19, 37, 'Master Guide 1 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(53, 19, 37, 'Master Guide 2 - Finance', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(54, 19, 37, 'Master Guide 3 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(57, 21, 41, 'Master Guide 1 - Graphic Design', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(58, 21, 41, 'Master Guide 2 - Graphic Design', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(59, 21, 41, 'Master Guide 3 - Graphic Design', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(60, 22, 43, 'Master Guide 1 - Entrepreneurship', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(61, 22, 43, 'Master Guide 2 - Entrepreneurship', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(62, 22, 43, 'Master Guide 3 - Entrepreneurship', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(63, 23, 45, 'Master Guide 1 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(64, 23, 45, 'Master Guide 2 - UI/UX', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(65, 23, 45, 'Master Guide 3 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 3, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(66, 24, 47, 'Master Guide 1 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(67, 24, 47, 'Master Guide 2 - Figma', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(68, 24, 47, 'Master Guide 3 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 3, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(69, 25, 49, 'Master Guide 1 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(70, 25, 49, 'Master Guide 2 - UI/UX', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(71, 25, 50, 'Master Guide 3 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 3, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `course_notes`
--

CREATE TABLE `course_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL,
  `timestamp_seconds` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_progress`
--

CREATE TABLE `course_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_questions`
--

CREATE TABLE `course_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` text NOT NULL,
  `is_instructor_reply` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE `course_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `course_id`, `section_title`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Section 1: Introduction to Swift', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 1, 'Section 2: Advanced Swift', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 2, 'Section 1: Introduction to Management', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 2, 'Section 2: Advanced Management', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 3, 'Section 1: Introduction to Kotlin', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 3, 'Section 2: Advanced Kotlin', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 4, 'Section 1: Introduction to Python', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 4, 'Section 2: Advanced Python', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 5, 'Section 1: Introduction to Figma', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 5, 'Section 2: Advanced Figma', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 6, 'Section 1: Introduction to Swift', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 6, 'Section 2: Advanced Swift', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 7, 'Section 1: Introduction to Node.js', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 7, 'Section 2: Advanced Node.js', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 8, 'Section 1: Introduction to Finance', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 8, 'Section 2: Advanced Finance', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 9, 'Section 1: Introduction to Graphic Design', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 9, 'Section 2: Advanced Graphic Design', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 10, 'Section 1: Introduction to Node.js', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 10, 'Section 2: Advanced Node.js', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 11, 'Section 1: Introduction to Cloud Computing', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 11, 'Section 2: Advanced Cloud Computing', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 12, 'Section 1: Introduction to Cloud Computing', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 12, 'Section 2: Advanced Cloud Computing', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 13, 'Section 1: Introduction to Marketing', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 13, 'Section 2: Advanced Marketing', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 14, 'Section 1: Introduction to UI/UX', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 14, 'Section 2: Advanced UI/UX', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 15, 'Section 1: Introduction to React Native', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 15, 'Section 2: Advanced React Native', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 16, 'Section 1: Introduction to Data Science', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 16, 'Section 2: Advanced Data Science', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 17, 'Section 1: Introduction to Finance', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 17, 'Section 2: Advanced Finance', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 18, 'Section 1: Introduction to Cloud Computing', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 18, 'Section 2: Advanced Cloud Computing', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 19, 'Section 1: Introduction to Finance', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 19, 'Section 2: Advanced Finance', 2, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 21, 'Section 1: Introduction to Graphic Design', 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 21, 'Section 2: Advanced Graphic Design', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(43, 22, 'Section 1: Introduction to Entrepreneurship', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(44, 22, 'Section 2: Advanced Entrepreneurship', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(45, 23, 'Section 1: Introduction to UI/UX', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(46, 23, 'Section 2: Advanced UI/UX', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(47, 24, 'Section 1: Introduction to Figma', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(48, 24, 'Section 2: Advanced Figma', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(49, 25, 'Section 1: Introduction to UI/UX', 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(50, 25, 'Section 2: Advanced UI/UX', 2, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','expired','cancelled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `order_id`, `amount`, `enrolled_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 17, 1, NULL, 51.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 14, 2, NULL, 164.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 13, 2, NULL, 164.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 19, 3, NULL, 81.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 14, 4, NULL, 118.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 15, 4, NULL, 118.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 17, 5, NULL, 127.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 12, 5, NULL, 127.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 11, 6, NULL, 57.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 18, 6, NULL, 57.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 16, 7, NULL, 91.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 12, 7, NULL, 91.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 12, 8, NULL, 147.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 10, 8, NULL, 147.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 16, 9, NULL, 182.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 18, 10, NULL, 185.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 16, 11, NULL, 95.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 17, 11, NULL, 95.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 19, 12, NULL, 55.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 18, 12, NULL, 55.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 11, 13, NULL, 102.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 15, 13, NULL, 102.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 16, 14, NULL, 69.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 13, 14, NULL, 69.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 14, 15, NULL, 143.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 10, 15, NULL, 143.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 12, 16, NULL, 71.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 19, 16, NULL, 71.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 12, 17, NULL, 61.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 18, 17, NULL, 61.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 11, 18, NULL, 173.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 10, 18, NULL, 173.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 11, 19, NULL, 142.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 12, 21, NULL, 99.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 11, 21, NULL, 99.00, '2025-12-26 11:02:32', 'active', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 17, 22, NULL, 163.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(39, 16, 22, NULL, 163.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(40, 11, 23, NULL, 77.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(41, 10, 23, NULL, 77.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(42, 16, 24, NULL, 143.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(43, 13, 24, NULL, 143.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(44, 12, 25, NULL, 197.00, '2025-12-26 11:02:33', 'active', '2025-12-26 05:32:33', '2025-12-26 05:32:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `googles`
--

CREATE TABLE `googles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info_boxes`
--

CREATE TABLE `info_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_boxes`
--

INSERT INTO `info_boxes` (`id`, `icon`, `title`, `description`, `created_at`, `updated_at`) VALUES
(25, 'bi-people', 'Expert Instructors', 'We provide the best resources for your learning journey.', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(26, 'bi-mortarboard', 'Lifetime Access', 'We provide the best resources for your learning journey.', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(27, 'bi-play-circle', 'Quality Content', 'We provide the best resources for your learning journey.', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(28, 'bi-award', 'Certificate of Completion', 'We provide the best resources for your learning journey.', '2025-12-26 05:32:33', '2025-12-26 05:32:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1563df43-26fa-4212-96bf-f9be9732e8f6', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"19\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Regular User\"}', NULL, '2025-12-26 05:27:35', '2025-12-26 05:27:35'),
('42ba2ce6-eba1-41e3-91e5-f9b50308e66e', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"19\",\"course_title\":\"Data Science - Masterclass by Instructor 5 (Vol 3)\",\"amount\":\"15\",\"message\":\"Course Purchased: Data Science - Masterclass by Instructor 5 (Vol 3) by Regular User\"}', NULL, '2025-12-26 05:27:35', '2025-12-26 05:27:35'),
('8bb15ae2-1767-4201-89d2-ddba69a986c8', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 4, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2025-12-26 03:44:32', '2025-12-26 03:44:32'),
('9df9a2b4-4e61-4272-aa68-02b8e87da6a2', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":4,\"name\":\"krunal vegad\",\"photo\":null,\"email\":\"vegadkrunal111@gmail.com\",\"message\":\"New User Registered: krunal vegad\"}', NULL, '2025-12-26 03:44:14', '2025-12-26 03:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `user_id`, `course_id`, `instructor_id`, `course_title`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 5, 'Swift - Masterclass by Instructor 1 (Vol 1)', 51, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 2, 17, 1, 5, 'Swift - Masterclass by Instructor 1 (Vol 1)', 51, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 3, 14, 2, 5, 'Management - Masterclass by Instructor 1 (Vol 2)', 164, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 4, 13, 2, 5, 'Management - Masterclass by Instructor 1 (Vol 2)', 164, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 5, 19, 3, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 81, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 6, 19, 3, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 81, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 7, 14, 4, 5, 'Python - Masterclass by Instructor 1 (Vol 4)', 118, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 8, 15, 4, 5, 'Python - Masterclass by Instructor 1 (Vol 4)', 118, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 9, 17, 5, 5, 'Figma - Masterclass by Instructor 1 (Vol 5)', 127, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 10, 12, 5, 5, 'Figma - Masterclass by Instructor 1 (Vol 5)', 127, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 11, 11, 6, 6, 'Swift - Masterclass by Instructor 2 (Vol 1)', 57, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 12, 18, 6, 6, 'Swift - Masterclass by Instructor 2 (Vol 1)', 57, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 13, 16, 7, 6, 'Node.js - Masterclass by Instructor 2 (Vol 2)', 91, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 14, 12, 7, 6, 'Node.js - Masterclass by Instructor 2 (Vol 2)', 91, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 15, 12, 8, 6, 'Finance - Masterclass by Instructor 2 (Vol 3)', 147, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 16, 10, 8, 6, 'Finance - Masterclass by Instructor 2 (Vol 3)', 147, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 17, 16, 9, 6, 'Graphic Design - Masterclass by Instructor 2 (Vol 4)', 182, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 18, 16, 9, 6, 'Graphic Design - Masterclass by Instructor 2 (Vol 4)', 182, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 19, 18, 10, 6, 'Node.js - Masterclass by Instructor 2 (Vol 5)', 185, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 20, 18, 10, 6, 'Node.js - Masterclass by Instructor 2 (Vol 5)', 185, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 21, 16, 11, 7, 'Cloud Computing - Masterclass by Instructor 3 (Vol 1)', 95, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 22, 17, 11, 7, 'Cloud Computing - Masterclass by Instructor 3 (Vol 1)', 95, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 23, 19, 12, 7, 'Cloud Computing - Masterclass by Instructor 3 (Vol 2)', 55, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 24, 18, 12, 7, 'Cloud Computing - Masterclass by Instructor 3 (Vol 2)', 55, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 25, 11, 13, 7, 'Marketing - Masterclass by Instructor 3 (Vol 3)', 102, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 26, 15, 13, 7, 'Marketing - Masterclass by Instructor 3 (Vol 3)', 102, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 27, 16, 14, 7, 'UI/UX - Masterclass by Instructor 3 (Vol 4)', 69, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 28, 13, 14, 7, 'UI/UX - Masterclass by Instructor 3 (Vol 4)', 69, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 29, 14, 15, 7, 'React Native - Masterclass by Instructor 3 (Vol 5)', 143, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 30, 10, 15, 7, 'React Native - Masterclass by Instructor 3 (Vol 5)', 143, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 31, 12, 16, 8, 'Data Science - Masterclass by Instructor 4 (Vol 1)', 71, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 32, 19, 16, 8, 'Data Science - Masterclass by Instructor 4 (Vol 1)', 71, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 33, 12, 17, 8, 'Finance - Masterclass by Instructor 4 (Vol 2)', 61, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 34, 18, 17, 8, 'Finance - Masterclass by Instructor 4 (Vol 2)', 61, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 35, 11, 18, 8, 'Cloud Computing - Masterclass by Instructor 4 (Vol 3)', 173, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 36, 10, 18, 8, 'Cloud Computing - Masterclass by Instructor 4 (Vol 3)', 173, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 37, 11, 19, 8, 'Finance - Masterclass by Instructor 4 (Vol 4)', 142, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 38, 11, 19, 8, 'Finance - Masterclass by Instructor 4 (Vol 4)', 142, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 39, 12, 20, 8, 'UI/UX - Masterclass by Instructor 4 (Vol 5)', 164, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 40, 11, 20, 8, 'UI/UX - Masterclass by Instructor 4 (Vol 5)', 164, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 41, 12, 21, 9, 'Graphic Design - Masterclass by Instructor 5 (Vol 1)', 99, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 42, 11, 21, 9, 'Graphic Design - Masterclass by Instructor 5 (Vol 1)', 99, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 43, 17, 22, 9, 'Entrepreneurship - Masterclass by Instructor 5 (Vol 2)', 163, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(44, 44, 16, 22, 9, 'Entrepreneurship - Masterclass by Instructor 5 (Vol 2)', 163, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(45, 45, 11, 23, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 3)', 77, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(46, 46, 10, 23, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 3)', 77, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(47, 47, 16, 24, 9, 'Figma - Masterclass by Instructor 5 (Vol 4)', 143, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(48, 48, 13, 24, 9, 'Figma - Masterclass by Instructor 5 (Vol 4)', 143, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(49, 49, 12, 25, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 5)', 197, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(50, 50, 12, 25, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 5)', 197, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(37, 'Partner 1', 'upload/partner/partner_1.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(38, 'Partner 2', 'upload/partner/partner_2.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(39, 'Partner 3', 'upload/partner/partner_3.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(40, 'Partner 4', 'upload/partner/partner_4.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(41, 'Partner 5', 'upload/partner/partner_5.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(42, 'Partner 6', 'upload/partner/partner_6.png', '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cash_delivery` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_month` varchar(255) DEFAULT NULL,
  `order_year` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transaction_id`, `name`, `email`, `phone`, `address`, `cash_delivery`, `total_amount`, `payment_type`, `invoice_no`, `order_date`, `order_month`, `order_year`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TRANS_J1YONQWFGC', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '51', 'Razorpay', 'INV_1766746952507', '10 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 'TRANS_VIKMIPAKVD', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '51', 'Razorpay', 'INV_1766746952243', '06 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 'TRANS_HSVQLD9JMU', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '164', 'Razorpay', 'INV_1766746952786', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 'TRANS_0G13S1WJQ0', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '164', 'Razorpay', 'INV_1766746952939', '02 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 'TRANS_FQJMYT5WUX', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '81', 'Razorpay', 'INV_1766746952575', '23 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 'TRANS_52ICNG9BJC', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '81', 'Razorpay', 'INV_1766746952370', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 'TRANS_4GG5I13HCF', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '118', 'Razorpay', 'INV_1766746952764', '21 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 'TRANS_N77OLHLPXL', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '118', 'Razorpay', 'INV_1766746952403', '01 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 'TRANS_Z64PUNKYGA', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '127', 'Razorpay', 'INV_1766746952311', '10 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 'TRANS_GDJ9XSBIBI', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '127', 'Razorpay', 'INV_1766746952630', '01 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 'TRANS_NDI6LTRTZG', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '57', 'Razorpay', 'INV_1766746952533', '25 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 'TRANS_JIM5D4FADQ', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '57', 'Razorpay', 'INV_1766746952808', '27 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 'TRANS_7UZI1TUROU', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '91', 'Razorpay', 'INV_1766746952478', '10 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 'TRANS_YXWXXQRVSQ', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '91', 'Razorpay', 'INV_1766746952194', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 'TRANS_SGGVGWA32Y', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '147', 'Razorpay', 'INV_1766746952377', '07 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 'TRANS_WUYJ0P4ZFB', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '147', 'Razorpay', 'INV_1766746952487', '17 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 'TRANS_2FAHPPYGVM', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '182', 'Razorpay', 'INV_1766746952191', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 'TRANS_IWMJAMKIVT', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '182', 'Razorpay', 'INV_1766746952674', '14 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 'TRANS_8UQAUILIHW', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '185', 'Razorpay', 'INV_1766746952114', '10 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 'TRANS_13ADVFOKSD', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '185', 'Razorpay', 'INV_1766746952931', '16 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 'TRANS_PDUYGFFLSR', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '95', 'Razorpay', 'INV_1766746952622', '30 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 'TRANS_WK6ZAUBPFC', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '95', 'Razorpay', 'INV_1766746952375', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 'TRANS_5WVFQ6Q88Y', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766746952283', '19 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 'TRANS_SCETDWZMFR', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766746952666', '18 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 'TRANS_57HRQFIHH5', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '102', 'Razorpay', 'INV_1766746952834', '17 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 'TRANS_GRFO7LVQVV', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '102', 'Razorpay', 'INV_1766746952740', '16 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 'TRANS_FDA9BKXMSU', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '69', 'Razorpay', 'INV_1766746952335', '26 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 'TRANS_U5OFZY6RZQ', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '69', 'Razorpay', 'INV_1766746952200', '26 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 'TRANS_NACKB8MWV2', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '143', 'Razorpay', 'INV_1766746952465', '18 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 'TRANS_3OXRBUQNKS', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '143', 'Razorpay', 'INV_1766746952576', '24 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 'TRANS_MGDNX7UCR8', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '71', 'Razorpay', 'INV_1766746952115', '09 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 'TRANS_6D6WVMCY1Q', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '71', 'Razorpay', 'INV_1766746952571', '22 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 'TRANS_ROSJBJLQ4G', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '61', 'Razorpay', 'INV_1766746952792', '15 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 'TRANS_OU3Z3LK63Y', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '61', 'Razorpay', 'INV_1766746952752', '16 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 'TRANS_5JCY39SRAW', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '173', 'Razorpay', 'INV_1766746952169', '05 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 'TRANS_QSFMDATILP', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '173', 'Razorpay', 'INV_1766746952221', '26 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 'TRANS_IJC6KHZDHH', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '142', 'Razorpay', 'INV_1766746952425', '04 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 'TRANS_Z9LUPFCWQH', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '142', 'Razorpay', 'INV_1766746952745', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 'TRANS_QSI9WSQEDX', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '164', 'Razorpay', 'INV_1766746952473', '06 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 'TRANS_IMLB5P72W3', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '164', 'Razorpay', 'INV_1766746952921', '23 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 'TRANS_OGK4ZRFWPD', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '99', 'Razorpay', 'INV_1766746952797', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 'TRANS_BGUERHTJMS', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '99', 'Razorpay', 'INV_1766746952280', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 'TRANS_WDJZG1SIL6', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '163', 'Razorpay', 'INV_1766746953236', '07 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(44, 'TRANS_XIRESCERZG', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '163', 'Razorpay', 'INV_1766746953795', '30 November 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(45, 'TRANS_VPI6H5I2R9', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '77', 'Razorpay', 'INV_1766746953972', '17 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(46, 'TRANS_P3PHBWFBKE', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '77', 'Razorpay', 'INV_1766746953479', '20 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(47, 'TRANS_GS3FBQEKVZ', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '143', 'Razorpay', 'INV_1766746953884', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(48, 'TRANS_WR0OFLX8CC', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '143', 'Razorpay', 'INV_1766746953877', '05 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(49, 'TRANS_Z8NJWIEPJU', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '197', 'Razorpay', 'INV_1766746953215', '20 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(50, 'TRANS_SCHO6JUB2T', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '197', 'Razorpay', 'INV_1766746953367', '14 December 2025', NULL, NULL, 'confirmed', '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `group_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'View Users', 'view-users', 'User Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(2, 'Create User', 'create-user', 'User Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(3, 'Edit User', 'edit-user', 'User Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(4, 'Delete User', 'delete-user', 'User Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(5, 'View Roles', 'view-roles', 'Role Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(6, 'Create Role', 'create-role', 'Role Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(7, 'Edit Role', 'edit-role', 'Role Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(8, 'Delete Role', 'delete-role', 'Role Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(9, 'View Permissions', 'view-permissions', 'Permission Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(10, 'Create Permission', 'create-permission', 'Permission Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(11, 'Edit Permission', 'edit-permission', 'Permission Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(12, 'Delete Permission', 'delete-permission', 'Permission Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(13, 'View Courses', 'view-courses', 'Course Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(14, 'Create Course', 'create-course', 'Course Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(15, 'Edit Course', 'edit-course', 'Course Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(16, 'Delete Course', 'delete-course', 'Course Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(17, 'Approve Course', 'approve-course', 'Course Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(18, 'View Categories', 'view-categories', 'Category Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(19, 'Create Category', 'create-category', 'Category Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(20, 'Edit Category', 'edit-category', 'Category Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(21, 'Delete Category', 'delete-category', 'Category Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(22, 'View Orders', 'view-orders', 'Order Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(23, 'Edit Order', 'edit-order', 'Order Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(24, 'Delete Order', 'delete-order', 'Order Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(25, 'View Coupons', 'view-coupons', 'Coupon Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(26, 'Create Coupon', 'create-coupon', 'Coupon Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(27, 'Edit Coupon', 'edit-coupon', 'Coupon Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(28, 'Delete Coupon', 'delete-coupon', 'Coupon Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(29, 'View Settings', 'view-settings', 'Settings Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(30, 'Edit Settings', 'edit-settings', 'Settings Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(31, 'View Instructors', 'view-instructors', 'Instructor Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(32, 'Approve Instructor', 'approve-instructor', 'Instructor Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(33, 'Edit Instructor', 'edit-instructor', 'Instructor Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(34, 'Delete Instructor', 'delete-instructor', 'Instructor Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(35, 'View Quizzes', 'view-quizzes', 'Quiz Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(36, 'Create Quiz', 'create-quiz', 'Quiz Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(37, 'Edit Quiz', 'edit-quiz', 'Quiz Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(38, 'Delete Quiz', 'delete-quiz', 'Quiz Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(39, 'View Reviews', 'view-reviews', 'Review Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(40, 'Approve Review', 'approve-review', 'Review Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(41, 'Delete Review', 'delete-review', 'Review Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(42, 'View Materials', 'view-materials', 'Material Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(43, 'Create Material', 'create-material', 'Material Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(44, 'Delete Material', 'delete-material', 'Material Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(45, 'Manage Live Classes', 'manage-live-classes', 'Live Class Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(46, 'View Notifications', 'view-notifications', 'Notification Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(47, 'Send Notifications', 'send-notifications', 'Notification Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(48, 'View Subcategories', 'view-subcategories', 'Subcategory Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(49, 'Create Subcategory', 'create-subcategory', 'Subcategory Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(50, 'Edit Subcategory', 'edit-subcategory', 'Subcategory Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(51, 'Delete Subcategory', 'delete-subcategory', 'Subcategory Management', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(52, 'View Reports', 'view-reports', 'Reports', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44'),
(53, 'Export Reports', 'export-reports', 'Reports', NULL, 1, '2025-12-26 04:53:44', '2025-12-26 04:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_minutes` int(11) NOT NULL DEFAULT 0,
  `pass_mark` int(11) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `course_id`, `section_id`, `quiz_title`, `description`, `duration_minutes`, `pass_mark`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Quiz: Swift - Basics', 'Test your knowledge on Swift (Course ID: 1)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 2, 3, 'Quiz: Management - Basics', 'Test your knowledge on Management (Course ID: 2)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 3, 5, 'Quiz: Kotlin - Basics', 'Test your knowledge on Kotlin (Course ID: 3)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 4, 7, 'Quiz: Python - Basics', 'Test your knowledge on Python (Course ID: 4)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 4, 8, 'Quiz: Python - Advanced', 'Test your knowledge on Python (Course ID: 4)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 5, 9, 'Quiz: Figma - Basics', 'Test your knowledge on Figma (Course ID: 5)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 6, 11, 'Quiz: Swift - Basics', 'Test your knowledge on Swift (Course ID: 6)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 7, 13, 'Quiz: Node.js - Basics', 'Test your knowledge on Node.js (Course ID: 7)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 7, 14, 'Quiz: Node.js - Advanced', 'Test your knowledge on Node.js (Course ID: 7)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 8, 15, 'Quiz: Finance - Basics', 'Test your knowledge on Finance (Course ID: 8)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 9, 17, 'Quiz: Graphic Design - Basics', 'Test your knowledge on Graphic Design (Course ID: 9)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 10, 19, 'Quiz: Node.js - Basics', 'Test your knowledge on Node.js (Course ID: 10)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 11, 21, 'Quiz: Cloud Computing - Basics', 'Test your knowledge on Cloud Computing (Course ID: 11)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 12, 23, 'Quiz: Cloud Computing - Basics', 'Test your knowledge on Cloud Computing (Course ID: 12)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 13, 25, 'Quiz: Marketing - Basics', 'Test your knowledge on Marketing (Course ID: 13)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 14, 27, 'Quiz: UI/UX - Basics', 'Test your knowledge on UI/UX (Course ID: 14)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 15, 29, 'Quiz: React Native - Basics', 'Test your knowledge on React Native (Course ID: 15)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 16, 31, 'Quiz: Data Science - Basics', 'Test your knowledge on Data Science (Course ID: 16)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 17, 33, 'Quiz: Finance - Basics', 'Test your knowledge on Finance (Course ID: 17)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 18, 35, 'Quiz: Cloud Computing - Basics', 'Test your knowledge on Cloud Computing (Course ID: 18)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 19, 37, 'Quiz: Finance - Basics', 'Test your knowledge on Finance (Course ID: 19)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 19, 38, 'Quiz: Finance - Advanced', 'Test your knowledge on Finance (Course ID: 19)', 10, 80, 1, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 21, 41, 'Quiz: Graphic Design - Basics', 'Test your knowledge on Graphic Design (Course ID: 21)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(25, 21, 42, 'Quiz: Graphic Design - Advanced', 'Test your knowledge on Graphic Design (Course ID: 21)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(26, 22, 43, 'Quiz: Entrepreneurship - Basics', 'Test your knowledge on Entrepreneurship (Course ID: 22)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(27, 22, 44, 'Quiz: Entrepreneurship - Advanced', 'Test your knowledge on Entrepreneurship (Course ID: 22)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(28, 23, 45, 'Quiz: UI/UX - Basics', 'Test your knowledge on UI/UX (Course ID: 23)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(29, 24, 47, 'Quiz: Figma - Basics', 'Test your knowledge on Figma (Course ID: 24)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(30, 24, 48, 'Quiz: Figma - Advanced', 'Test your knowledge on Figma (Course ID: 24)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(31, 25, 49, 'Quiz: UI/UX - Basics', 'Test your knowledge on UI/UX (Course ID: 25)', 10, 80, 1, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `explanation` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `explanation`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'What is the primary role of Swift? (Sec 1 | ID 1)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 1, 'True or False: Swift is widely used in 2025. (Sec 1 | ID 1)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 1, 'Which feature is most important in Swift? (Sec 1 | ID 1)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 2, 'What is the primary role of Management? (Sec 1 | ID 2)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 2, 'True or False: Management is widely used in 2025. (Sec 1 | ID 2)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 2, 'Which feature is most important in Management? (Sec 1 | ID 2)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 3, 'What is the primary role of Kotlin? (Sec 1 | ID 3)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 3, 'True or False: Kotlin is widely used in 2025. (Sec 1 | ID 3)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 3, 'Which feature is most important in Kotlin? (Sec 1 | ID 3)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 4, 'What is the primary role of Python? (Sec 1 | ID 4)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 4, 'True or False: Python is widely used in 2025. (Sec 1 | ID 4)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 4, 'Which feature is most important in Python? (Sec 1 | ID 4)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 5, 'What is the primary role of Python? (Sec 2 | ID 4)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 5, 'True or False: Python is widely used in 2025. (Sec 2 | ID 4)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 5, 'Which feature is most important in Python? (Sec 2 | ID 4)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 6, 'What is the primary role of Figma? (Sec 1 | ID 5)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 6, 'True or False: Figma is widely used in 2025. (Sec 1 | ID 5)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 6, 'Which feature is most important in Figma? (Sec 1 | ID 5)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 7, 'What is the primary role of Swift? (Sec 1 | ID 6)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 7, 'True or False: Swift is widely used in 2025. (Sec 1 | ID 6)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 7, 'Which feature is most important in Swift? (Sec 1 | ID 6)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 8, 'What is the primary role of Node.js? (Sec 1 | ID 7)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 8, 'True or False: Node.js is widely used in 2025. (Sec 1 | ID 7)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 8, 'Which feature is most important in Node.js? (Sec 1 | ID 7)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 9, 'What is the primary role of Node.js? (Sec 2 | ID 7)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 9, 'True or False: Node.js is widely used in 2025. (Sec 2 | ID 7)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 9, 'Which feature is most important in Node.js? (Sec 2 | ID 7)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 10, 'What is the primary role of Finance? (Sec 1 | ID 8)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 10, 'True or False: Finance is widely used in 2025. (Sec 1 | ID 8)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 10, 'Which feature is most important in Finance? (Sec 1 | ID 8)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 11, 'What is the primary role of Graphic Design? (Sec 1 | ID 9)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 11, 'True or False: Graphic Design is widely used in 2025. (Sec 1 | ID 9)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 11, 'Which feature is most important in Graphic Design? (Sec 1 | ID 9)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 12, 'What is the primary role of Node.js? (Sec 1 | ID 10)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 12, 'True or False: Node.js is widely used in 2025. (Sec 1 | ID 10)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 12, 'Which feature is most important in Node.js? (Sec 1 | ID 10)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 13, 'What is the primary role of Cloud Computing? (Sec 1 | ID 11)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 13, 'True or False: Cloud Computing is widely used in 2025. (Sec 1 | ID 11)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 13, 'Which feature is most important in Cloud Computing? (Sec 1 | ID 11)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 14, 'What is the primary role of Cloud Computing? (Sec 1 | ID 12)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 14, 'True or False: Cloud Computing is widely used in 2025. (Sec 1 | ID 12)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 14, 'Which feature is most important in Cloud Computing? (Sec 1 | ID 12)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 15, 'What is the primary role of Marketing? (Sec 1 | ID 13)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(44, 15, 'True or False: Marketing is widely used in 2025. (Sec 1 | ID 13)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(45, 15, 'Which feature is most important in Marketing? (Sec 1 | ID 13)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(46, 16, 'What is the primary role of UI/UX? (Sec 1 | ID 14)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(47, 16, 'True or False: UI/UX is widely used in 2025. (Sec 1 | ID 14)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(48, 16, 'Which feature is most important in UI/UX? (Sec 1 | ID 14)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(49, 17, 'What is the primary role of React Native? (Sec 1 | ID 15)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(50, 17, 'True or False: React Native is widely used in 2025. (Sec 1 | ID 15)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(51, 17, 'Which feature is most important in React Native? (Sec 1 | ID 15)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(52, 18, 'What is the primary role of Data Science? (Sec 1 | ID 16)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(53, 18, 'True or False: Data Science is widely used in 2025. (Sec 1 | ID 16)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(54, 18, 'Which feature is most important in Data Science? (Sec 1 | ID 16)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(55, 19, 'What is the primary role of Finance? (Sec 1 | ID 17)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(56, 19, 'True or False: Finance is widely used in 2025. (Sec 1 | ID 17)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(57, 19, 'Which feature is most important in Finance? (Sec 1 | ID 17)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(58, 20, 'What is the primary role of Cloud Computing? (Sec 1 | ID 18)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(59, 20, 'True or False: Cloud Computing is widely used in 2025. (Sec 1 | ID 18)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(60, 20, 'Which feature is most important in Cloud Computing? (Sec 1 | ID 18)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(61, 21, 'What is the primary role of Finance? (Sec 1 | ID 19)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(62, 21, 'True or False: Finance is widely used in 2025. (Sec 1 | ID 19)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(63, 21, 'Which feature is most important in Finance? (Sec 1 | ID 19)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(64, 22, 'What is the primary role of Finance? (Sec 2 | ID 19)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(65, 22, 'True or False: Finance is widely used in 2025. (Sec 2 | ID 19)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(66, 22, 'Which feature is most important in Finance? (Sec 2 | ID 19)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(70, 24, 'What is the primary role of Graphic Design? (Sec 1 | ID 21)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(71, 24, 'True or False: Graphic Design is widely used in 2025. (Sec 1 | ID 21)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(72, 24, 'Which feature is most important in Graphic Design? (Sec 1 | ID 21)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(73, 25, 'What is the primary role of Graphic Design? (Sec 2 | ID 21)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(74, 25, 'True or False: Graphic Design is widely used in 2025. (Sec 2 | ID 21)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(75, 25, 'Which feature is most important in Graphic Design? (Sec 2 | ID 21)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(76, 26, 'What is the primary role of Entrepreneurship? (Sec 1 | ID 22)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(77, 26, 'True or False: Entrepreneurship is widely used in 2025. (Sec 1 | ID 22)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(78, 26, 'Which feature is most important in Entrepreneurship? (Sec 1 | ID 22)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(79, 27, 'What is the primary role of Entrepreneurship? (Sec 2 | ID 22)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(80, 27, 'True or False: Entrepreneurship is widely used in 2025. (Sec 2 | ID 22)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(81, 27, 'Which feature is most important in Entrepreneurship? (Sec 2 | ID 22)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(82, 28, 'What is the primary role of UI/UX? (Sec 1 | ID 23)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(83, 28, 'True or False: UI/UX is widely used in 2025. (Sec 1 | ID 23)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(84, 28, 'Which feature is most important in UI/UX? (Sec 1 | ID 23)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(85, 29, 'What is the primary role of Figma? (Sec 1 | ID 24)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(86, 29, 'True or False: Figma is widely used in 2025. (Sec 1 | ID 24)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(87, 29, 'Which feature is most important in Figma? (Sec 1 | ID 24)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(88, 30, 'What is the primary role of Figma? (Sec 2 | ID 24)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(89, 30, 'True or False: Figma is widely used in 2025. (Sec 2 | ID 24)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(90, 30, 'Which feature is most important in Figma? (Sec 2 | ID 24)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(91, 31, 'What is the primary role of UI/UX? (Sec 1 | ID 25)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(92, 31, 'True or False: UI/UX is widely used in 2025. (Sec 1 | ID 25)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(93, 31, 'Which feature is most important in UI/UX? (Sec 1 | ID 25)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `total_questions` int(11) NOT NULL,
  `correct_answers` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `is_pass` tinyint(1) NOT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `rating` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `course_id`, `user_id`, `comment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(2, 1, 12, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(3, 1, 12, 'I wish there were more advanced examples.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(4, 2, 13, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 2, 19, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 2, 13, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 3, 15, 'Clear explanations and very practical assignments.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 3, 18, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 3, 10, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 4, 15, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 4, 15, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 4, 11, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 5, 12, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 5, 19, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 5, 19, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 6, 17, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 6, 17, 'I wish there were more advanced examples.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 6, 10, 'Amazing quality. The production value is great.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 7, 17, 'The quiz questions were a bit confusing.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 7, 15, 'Clear explanations and very practical assignments.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(21, 7, 13, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(22, 8, 12, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(23, 8, 10, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(24, 8, 15, 'The audio quality could be improved in some sections.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(25, 9, 16, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(26, 9, 10, 'Loved the live sessions. They really helped clear my doubts.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(27, 9, 12, 'The pacing was a bit slow for me.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(28, 10, 15, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(29, 10, 12, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(30, 10, 17, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(31, 11, 19, 'Amazing quality. The production value is great.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(32, 11, 12, 'Excellent course! Very clear and easy to follow.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(33, 11, 16, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(34, 12, 17, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(35, 12, 13, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(36, 12, 18, 'Amazing quality. The production value is great.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(37, 13, 10, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(38, 13, 19, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(39, 13, 13, 'I wish there were more advanced examples.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(40, 14, 14, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(41, 14, 15, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(42, 14, 10, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(43, 15, 10, 'Amazing quality. The production value is great.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(44, 15, 17, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(45, 15, 15, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(46, 16, 14, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(47, 16, 15, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(48, 16, 14, 'Some topics felt a bit rushed.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(49, 17, 16, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(50, 17, 11, 'The pacing was a bit slow for me.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(51, 17, 14, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(52, 18, 18, 'I learned so much in just a few days. Great pace!', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(53, 18, 17, 'Loved the live sessions. They really helped clear my doubts.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(54, 18, 19, 'The pacing was a bit slow for me.', 2, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(55, 19, 15, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(56, 19, 15, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(57, 19, 17, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(61, 21, 19, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(62, 21, 15, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(63, 21, 18, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(64, 22, 17, 'Amazing quality. The production value is great.', 4, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(65, 22, 16, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(66, 22, 19, 'The pacing was a bit slow for me.', 2, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(67, 23, 19, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(68, 23, 17, 'The audio quality could be improved in some sections.', 2, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(69, 23, 12, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(70, 24, 19, 'I had some trouble accessing the materials at first.', 2, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(71, 24, 11, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(72, 24, 13, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(73, 25, 11, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(74, 25, 18, 'I wish there were more advanced examples.', 3, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(75, 25, 19, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', 'Full system access with all permissions', 1, '2025-12-26 04:53:44', '2025-12-26 04:54:59'),
(2, 'Instructor', 'instructor', 'Can create and manage their own courses', 1, '2025-12-26 04:53:44', '2025-12-26 04:54:59'),
(3, 'Student', 'user', 'Regular user who can enroll in courses', 1, '2025-12-26 04:53:44', '2025-12-26 04:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 1, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 1, 19, NULL, NULL),
(20, 1, 20, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(25, 1, 25, NULL, NULL),
(26, 1, 26, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 1, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 1, 30, NULL, NULL),
(31, 1, 31, NULL, NULL),
(32, 1, 32, NULL, NULL),
(33, 1, 33, NULL, NULL),
(34, 1, 34, NULL, NULL),
(35, 1, 35, NULL, NULL),
(36, 1, 36, NULL, NULL),
(37, 1, 37, NULL, NULL),
(38, 1, 38, NULL, NULL),
(39, 1, 39, NULL, NULL),
(40, 1, 40, NULL, NULL),
(41, 1, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 1, 43, NULL, NULL),
(44, 1, 44, NULL, NULL),
(45, 1, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 1, 47, NULL, NULL),
(48, 1, 48, NULL, NULL),
(49, 1, 49, NULL, NULL),
(50, 1, 50, NULL, NULL),
(51, 1, 51, NULL, NULL),
(52, 1, 52, NULL, NULL),
(53, 1, 53, NULL, NULL),
(54, 2, 26, NULL, NULL),
(55, 2, 14, NULL, NULL),
(56, 2, 43, NULL, NULL),
(57, 2, 36, NULL, NULL),
(58, 2, 28, NULL, NULL),
(59, 2, 44, NULL, NULL),
(60, 2, 38, NULL, NULL),
(61, 2, 27, NULL, NULL),
(62, 2, 15, NULL, NULL),
(63, 2, 37, NULL, NULL),
(64, 2, 45, NULL, NULL),
(65, 2, 25, NULL, NULL),
(66, 2, 13, NULL, NULL),
(67, 2, 42, NULL, NULL),
(68, 2, 35, NULL, NULL),
(69, 2, 39, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('36CxXoKNS1DsyxhFXVDCgRDdDJZ9z2W0S168IWYk', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibW1keVNwUmJHbnN0Nml0a1NmOHRXSTFzenIwdDllbTRBc3ZpbWVWYyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTE6InN0cmlwZV9kYXRhIjthOjEyOntzOjEwOiJmaXJzdF9uYW1lIjtzOjQ6InVzZXIiO3M6OToibGFzdF9uYW1lIjtzOjE6IjEiO3M6NToiZW1haWwiO3M6MTY6InVzZXJAZXhhbXBsZS5jb20iO3M6NToicGhvbmUiO3M6MTA6IjU1NTU1NTU1NTUiO3M6NzoiYWRkcmVzcyI7czoxMzoiNzg5IFVzZXIgTGFuZSI7czoxMjoicGF5bWVudF90eXBlIjtzOjg6InJhem9ycGF5IjtzOjk6ImNvdXJzZV9pZCI7YToyOntpOjA7czoyOiIxOSI7aToxO3M6MjoiMTkiO31zOjEzOiJpbnN0cnVjdG9yX2lkIjthOjI6e2k6MDtzOjE6IjkiO2k6MTtzOjE6IjkiO31zOjExOiJjb3Vyc2VfbmFtZSI7YToxOntpOjA7czo1MDoiRGF0YSBTY2llbmNlIC0gTWFzdGVyY2xhc3MgYnkgSW5zdHJ1Y3RvciA1IChWb2wgMykiO31zOjEyOiJjb3Vyc2VfaW1hZ2UiO2E6MTp7aTowO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWQvY291cnNlLzY5NGU2ODhhOGE1YTUuanBnIjt9czoxMjoiY291cnNlX3ByaWNlIjthOjE6e2k6MDtzOjI6IjE1Ijt9czoxMToidG90YWxfcHJpY2UiO3M6NToiMTUuMDAiO319', 1766751594),
('b4POdSUYMdHmgg4B6bdwNALKMZ7l3JGUEDpawLiN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR2ptMmJUT2FDUU1QTlhRN1YwQXI4dHI0bnBueDRwTURhMnhlaWxMOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnN0cnVjdG9yL3Byb2ZpbGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1766750662),
('vgb8XMUigoB3C8TDIyMTZwFWG017iUBY6RDeoFDt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia0xQTWdkU01TNXRxd25TN2ZlSUJLeFRrRWlUdzE5eFNqVlNzaGFBOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zdWJjYXRlZ29yeSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1766751564),
('XLBXCgA7XEKGvUHfSxpXeHpNstd4YavhnmnPbCh1', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEY4OG11RkF5TWJPUnMyOXJVUGdIT3NNUHpkU1RXdUJhZXl2SWc5diI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnN0cnVjdG9yL2xvZ2luIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODt9', 1766749946);

-- --------------------------------------------------------

--
-- Table structure for table `site_infos`
--

CREATE TABLE `site_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_infos`
--

INSERT INTO `site_infos` (`id`, `meta_title`, `copyright`, `meta_description`, `logo`, `favicon`, `address`, `phone`, `mail`, `facebook`, `twitter`, `instagram`, `linkedin`, `created_at`, `updated_at`) VALUES
(1, 'SkillPoint - Online Learning Management System', '© 2025 SkillPoint. All Rights Reserved.', 'Empower your future with quality online education.', 'http://127.0.0.1:8000/upload/site-info/694e7a2dca4da.png', 'http://127.0.0.1:8000/upload/site-info/694e7a2dca7da.png', '123 Learning Ave, Knowledge City', '+1 (555) 123-4567', 'info@skillpoint.com', 'https://facebook.com/skillpoint', 'https://twitter.com/skillpoint', 'https://instagram.com/skillpoint', 'https://linkedin.com/company/skillpoint', '2025-12-26 04:59:26', '2025-12-26 06:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `short_description`, `video_url`, `image`, `created_at`, `updated_at`) VALUES
(19, 'Unlock Your Potential with Our Expert Courses', 'Join over 10,000 students learning from top professionals.', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'http://127.0.0.1:8000/upload/slider/694e79f94a15e.jpg', '2025-12-26 05:32:33', '2025-12-26 06:35:13'),
(20, 'Unlock Your Potential with Our Expert Courses', 'Join over 10,000 students learning from top professionals.', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'upload/slider/slider_2.jpg', '2025-12-26 05:32:33', '2025-12-26 05:32:33'),
(21, 'Unlock Your Potential with Our Expert Courses', 'Join over 10,000 students learning from top professionals.', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'upload/slider/slider_3.jpg', '2025-12-26 05:32:33', '2025-12-26 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `smtps`
--

CREATE TABLE `smtps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailer` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtps`
--

INSERT INTO `smtps` (`id`, `mailer`, `host`, `port`, `username`, `password`, `encryption`, `from_address`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'smtp.gmail.com', '587', 'patelbhakti636@gmail.com', 'nply qovj jofm byjk', 'tls', 'patelbhakti636@gmail.com', '2025-12-26 06:38:37', '2025-12-26 06:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `stripes`
--

CREATE TABLE `stripes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publish_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'React', 'react', '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(2, 1, 'Laravel', 'laravel', '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(3, 1, 'Node.js', 'nodejs', '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(4, 1, 'Vue.js', 'vuejs', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(5, 2, 'Flutter', 'flutter', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(6, 2, 'React Native', 'react-native', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(7, 2, 'Swift', 'swift', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(8, 2, 'Kotlin', 'kotlin', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(9, 3, 'UI/UX', 'uiux', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(10, 3, 'Graphic Design', 'graphic-design', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(11, 3, 'Figma', 'figma', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(12, 3, 'Photoshop', 'photoshop', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(13, 4, 'Finance', 'finance', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(14, 4, 'Marketing', 'marketing', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(15, 4, 'Entrepreneurship', 'entrepreneurship', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(16, 4, 'Management', 'management', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(17, 5, 'Cyber Security', 'cyber-security', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(18, 5, 'Cloud Computing', 'cloud-computing', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(19, 5, 'Data Science', 'data-science', '2025-12-26 05:32:32', '2025-12-26 05:32:32'),
(20, 5, 'Python', 'python', '2025-12-26 05:32:32', '2025-12-26 05:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('user','instructor','admin') NOT NULL DEFAULT 'user',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `bio` longtext DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `experience` longtext DEFAULT NULL,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `bio`, `day`, `month`, `year`, `city`, `country`, `experience`, `gender`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Admin User', 'admin@example.com', NULL, '$2y$12$F5vILJtQT/03bGZD4rBmu.BN8lkcTuEWJfZZt7qB9wYI/T.9Wncoi', NULL, '1234567890', '123 Admin Street', 'admin', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 04:55:23', '2025-12-26 04:55:23'),
(2, NULL, NULL, 'Instructor User', 'instructor@example.com', NULL, '$2y$12$PIw65qxHU7l2p3oTDmwRDe/yjxJztgIK.2Cicxs/aDzeuM/xY59Ku', 'http://127.0.0.1:8000/upload/user/694e79c5dcd4b.jpg', '0987654321', '456 Instructor Avenue', 'instructor', '1', NULL, NULL, NULL, NULL, 'Chennai', 'Tamil Nadu', '5+ years experience in teaching University', 'male', NULL, '2025-12-26 04:55:24', '2025-12-26 06:34:21'),
(3, NULL, NULL, 'Regular User', 'user@example.com', NULL, '$2y$12$Gw73DZs0IVJxFynZLrlKRO9LsAtyheHFxJxDnUvuDVjylh68al8QO', NULL, '5555555555', '789 User Lane', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 04:55:24', '2025-12-26 04:55:24'),
(4, NULL, NULL, 'krunal vegad', 'vegadkrunal111@gmail.com', NULL, '$2y$12$TlURIyESok6.cv6/Awcefe3E1YXvO.m.I0SSVvhjt9Q.yNTS.wI8y', NULL, NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 03:44:10', '2025-12-26 03:44:10'),
(5, NULL, NULL, 'Instructor 1', 'instructor1@example.com', NULL, '$2y$12$kNvGb0vxunIpl.UxDzxmeOsg571w1TAehZPnmm.es6R07EmsbAUi.', 'http://127.0.0.1:8000/upload/user/694e7985841da.png', '931-730-4572', '80527 Murazik Circle Suite 573New Annieport, AZ 08246-9970', 'instructor', '1', 'Quia magni est ex voluptas consequatur. Qui similique perferendis odio aut. Tenetur qui consequatur rerum ut.', NULL, NULL, NULL, 'Bengaluru', 'Karnataka', '5+ years experience in teaching Furniture Finisher', 'female', NULL, '2025-12-26 05:32:27', '2025-12-26 06:33:17'),
(6, NULL, NULL, 'Instructor 2', 'instructor2@example.com', NULL, '$2y$12$s3f2sqB5f/k4Og0kZzLpBe/Eha.u5u6l4P0g89KB8bE3ddmcPqLe2', 'http://127.0.0.1:8000/upload/user/694e76dde30f6.jpg', '(808) 633-6032', '8585 Josiah Ridges Suite 953Lake Alizefort, SC 96979', 'instructor', '1', 'Sed ut quidem quisquam laudantium modi praesentium. Amet molestias vitae maiores. Praesentium suscipit et et ut. Vel repellat sapiente nam tempora nihil excepturi.', NULL, NULL, NULL, 'New Delhi', 'India', '5+ years experience in teaching Surveying Technician', 'female', NULL, '2025-12-26 05:32:28', '2025-12-26 06:21:57'),
(7, NULL, NULL, 'Instructor 3', 'instructor3@example.com', NULL, '$2y$12$AGcktuJtbS53H/v96I61N.vzbFkAFi0vpElL0YpFr2gCKW7Hhmw0K', 'http://127.0.0.1:8000/upload/user/694e74da1af37.jpg', '+1-843-224-1578', '6076 Valentina Square Suite 446South Izabella, UT 40207', 'instructor', '1', 'Est maiores dolorem illo aut. Maiores unde ipsum voluptas vero. Totam provident sed consequuntur est tempora odio libero.', NULL, NULL, NULL, 'Pune', 'India', '5+ years experience in teaching Substance Abuse Social Worker', 'female', NULL, '2025-12-26 05:32:28', '2025-12-26 06:13:22'),
(8, NULL, NULL, 'Instructor 4', 'instructor4@example.com', NULL, '$2y$12$l1Lwa1R6TvTCXlXjnU4DuePYpzsufAgKoO.eHKpa2nYjsDCtnGu7S', 'http://127.0.0.1:8000/upload/user/694e7748c5d45.jpg', '+15753200741', '243 Mills MillsDarianaside, WV 79940', 'instructor', '1', 'Qui ut est dolor. Molestias molestiae molestiae eius. Dolorum autem et aspernatur est nisi magnam enim. Id eos dolores sit porro consectetur.', NULL, NULL, NULL, 'Paris', 'France', '5+ years experience in teaching Computer Support Specialist', 'male', NULL, '2025-12-26 05:32:28', '2025-12-26 06:23:44'),
(9, NULL, NULL, 'Instructor 5', 'instructor5@example.com', NULL, '$2y$12$QoGaAuAT2u5/gHcBp5NTvedpOzgs0EJfeeAfQzzXK//LPycxEGHLW', 'http://127.0.0.1:8000/upload/user/694e6fcb3fe0a.jpg', '(928) 739-9234', '365 Nicolas RouteNorth Jordy, MT 77392', 'instructor', '1', 'Autem qui rerum impedit accusamus tempora porro et vel. Magnam facilis nemo facilis non nam voluptas. Suscipit non quisquam voluptatem placeat illo exercitationem. Amet rerum laboriosam ut neque laborum et et ut.', NULL, NULL, NULL, 'Rajkot', 'India', '5+ years experience in teaching University', 'male', NULL, '2025-12-26 05:32:29', '2025-12-26 05:51:47'),
(10, NULL, NULL, 'Student 1', 'student1@example.com', NULL, '$2y$12$SdhHW04z0UlSnwaFBY8dQeLNZML5w6TnW.HvrvbPt7CF8z/Xcpzw6', NULL, '865.795.5277', '5643 Cummings Haven Apt. 176\nPort Sophie, RI 12491', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:29', '2025-12-26 05:32:29'),
(11, NULL, NULL, 'Student 2', 'student2@example.com', NULL, '$2y$12$wQUSAyU1F/2KDMLCzxyxauEGfJRAHPdAUDWLTDziE1nD0U52lwpN6', NULL, '507.865.9194', '3891 Ronny Point Apt. 392\nRaumouth, KS 06094-6188', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:29', '2025-12-26 05:32:29'),
(12, NULL, NULL, 'Student 3', 'student3@example.com', NULL, '$2y$12$QWiHN.347oq2KKR7PO.X5OXLcDNFBq7bT5Ilmiv1VdSlwL2LVgB/2', NULL, '707.423.9399', '79846 Considine Trace\nRebekahborough, WA 03310-8438', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:29', '2025-12-26 05:32:29'),
(13, NULL, NULL, 'Student 4', 'student4@example.com', NULL, '$2y$12$UJ89u.DTN9Usoh4G5jBQ.OSRh/CCSdI3oSW5QtsHxAUrUwBSD22XW', NULL, '210-224-1407', '79167 Lakin Cove Suite 121\nNew Marquis, OH 28092', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:30', '2025-12-26 05:32:30'),
(14, NULL, NULL, 'Student 5', 'student5@example.com', NULL, '$2y$12$53ohyp.SeJV7CwK7k5fdv.9P4YKyjTrtPo.SkBmqIifrNPsG5VV0i', NULL, '218.385.8199', '33245 Kutch Spring\nWest Zaria, SD 49383', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:30', '2025-12-26 05:32:30'),
(15, NULL, NULL, 'Student 6', 'student6@example.com', NULL, '$2y$12$mF4zlrEHOOkXlFubCIumY.PnRteJiu5tvWgU9zwbG0JJ8Yl6VYMga', NULL, '1-480-384-6584', '27492 Wehner Club Suite 190\nWest Ramonamouth, NC 83201-0149', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:30', '2025-12-26 05:32:30'),
(16, NULL, NULL, 'Student 7', 'student7@example.com', NULL, '$2y$12$JnkExTXJyUSKDysJIb7q3eRUrkTmopGppfneaCa18bFkVfXCUiknm', NULL, '+1 (820) 434-9875', '2285 Freeda Circle\nLake Maxime, CA 08615', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(17, NULL, NULL, 'Student 8', 'student8@example.com', NULL, '$2y$12$Bkvy82Bw7OfoMAhGLor8/uT/bmSBXtHBQqGFB4QrAVV9moYhljpLa', NULL, '603.551.4437', '244 Dietrich Circles Apt. 395\nNorth Leta, NJ 01358-8625', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(18, NULL, NULL, 'Student 9', 'student9@example.com', NULL, '$2y$12$hsTOJ8bBjywcCu3jvE/m.OeQMWIz.9JZtMoIrjxVpsutO5FmAOIhG', NULL, '(725) 965-5338', '8432 Merl Manors\nNorth Immanueltown, ND 00729-0650', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:31', '2025-12-26 05:32:31'),
(19, NULL, NULL, 'Student 10', 'student10@example.com', NULL, '$2y$12$lY9pAXpzELFPDnMZ94C7YO2u.yqe/PaTIf0LfklFXnzYJokidD3BC', NULL, '+1-347-504-1609', '5041 Kamryn Vista Suite 100\nKennychester, VA 68250-1713', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 05:32:31', '2025-12-26 05:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 5, 2, NULL, NULL),
(5, 6, 2, NULL, NULL),
(6, 7, 2, NULL, NULL),
(7, 8, 2, NULL, NULL),
(8, 9, 2, NULL, NULL),
(9, 10, 3, NULL, NULL),
(10, 11, 3, NULL, NULL),
(11, 12, 3, NULL, NULL),
(12, 13, 3, NULL, NULL),
(13, 14, 3, NULL, NULL),
(14, 15, 3, NULL, NULL),
(15, 16, 3, NULL, NULL),
(16, 17, 3, NULL, NULL),
(17, 18, 3, NULL, NULL),
(18, 19, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 3, 19, '2025-12-26 05:23:21', '2025-12-26 05:23:21'),
(2, 3, 10, '2025-12-26 06:49:52', '2025-12-26 06:49:52');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_course_id_foreign` (`course_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificates_certificate_number_unique` (`certificate_number`),
  ADD KEY `certificates_user_id_foreign` (`user_id`),
  ADD KEY `certificates_course_id_foreign` (`course_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_goals`
--
ALTER TABLE `course_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_goals_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_lectures_section_id_foreign` (`section_id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_materials_course_id_foreign` (`course_id`),
  ADD KEY `course_materials_section_id_foreign` (`section_id`);

--
-- Indexes for table `course_notes`
--
ALTER TABLE `course_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_notes_user_id_foreign` (`user_id`),
  ADD KEY `course_notes_course_id_foreign` (`course_id`),
  ADD KEY `course_notes_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_course_content_unique` (`user_id`,`course_id`,`content_type`,`content_id`),
  ADD KEY `course_progress_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_questions`
--
ALTER TABLE `course_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_sections_course_id_foreign` (`course_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_user_id_course_id_unique` (`user_id`,`course_id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `googles`
--
ALTER TABLE `googles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_boxes`
--
ALTER TABLE `info_boxes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_course_id_foreign` (`course_id`),
  ADD KEY `quizzes_section_id_foreign` (`section_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_results_user_id_foreign` (`user_id`),
  ADD KEY `quiz_results_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission_role_id_permission_id_unique` (`role_id`,`permission_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_infos`
--
ALTER TABLE `site_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtps`
--
ALTER TABLE `smtps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripes`
--
ALTER TABLE `stripes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_role_user_id_role_id_unique` (`user_id`,`role_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `course_goals`
--
ALTER TABLE `course_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `course_lectures`
--
ALTER TABLE `course_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `course_notes`
--
ALTER TABLE `course_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_questions`
--
ALTER TABLE `course_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `googles`
--
ALTER TABLE `googles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_boxes`
--
ALTER TABLE `info_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `site_infos`
--
ALTER TABLE `site_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `smtps`
--
ALTER TABLE `smtps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stripes`
--
ALTER TABLE `stripes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_goals`
--
ALTER TABLE `course_goals`
  ADD CONSTRAINT `course_goals_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD CONSTRAINT `course_lectures_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD CONSTRAINT `course_materials_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_materials_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_notes`
--
ALTER TABLE `course_notes`
  ADD CONSTRAINT `course_notes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_notes_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `course_lectures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD CONSTRAINT `course_progress_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD CONSTRAINT `course_sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
