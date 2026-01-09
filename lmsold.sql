-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2026 at 07:27 AM
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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_header_categories', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:5:{i:0;O:19:\"App\\Models\\Category\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:4;s:4:\"name\";s:8:\"Business\";s:4:\"slug\";s:8:\"business\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523f90ce0b8.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:04\";s:12:\"course_count\";i:5;}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:4;s:4:\"name\";s:8:\"Business\";s:4:\"slug\";s:8:\"business\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523f90ce0b8.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:04\";s:12:\"course_count\";i:5;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:11:\"subcategory\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:13;s:11:\"category_id\";i:4;s:4:\"name\";s:7:\"Finance\";s:4:\"slug\";s:7:\"finance\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:13;s:11:\"category_id\";i:4;s:4:\"name\";s:7:\"Finance\";s:4:\"slug\";s:7:\"finance\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:14;s:11:\"category_id\";i:4;s:4:\"name\";s:9:\"Marketing\";s:4:\"slug\";s:9:\"marketing\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:14;s:11:\"category_id\";i:4;s:4:\"name\";s:9:\"Marketing\";s:4:\"slug\";s:9:\"marketing\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:15;s:11:\"category_id\";i:4;s:4:\"name\";s:16:\"Entrepreneurship\";s:4:\"slug\";s:16:\"entrepreneurship\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:15;s:11:\"category_id\";i:4;s:4:\"name\";s:16:\"Entrepreneurship\";s:4:\"slug\";s:16:\"entrepreneurship\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:16;s:11:\"category_id\";i:4;s:4:\"name\";s:10:\"Management\";s:4:\"slug\";s:10:\"management\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:16;s:11:\"category_id\";i:4;s:4:\"name\";s:10:\"Management\";s:4:\"slug\";s:10:\"management\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:19:\"App\\Models\\Category\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"Design\";s:4:\"slug\";s:6:\"design\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fb0bb376.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:36\";s:12:\"course_count\";i:5;}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"Design\";s:4:\"slug\";s:6:\"design\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fb0bb376.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:36\";s:12:\"course_count\";i:5;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:11:\"subcategory\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:9;s:11:\"category_id\";i:3;s:4:\"name\";s:5:\"UI/UX\";s:4:\"slug\";s:4:\"uiux\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:9;s:11:\"category_id\";i:3;s:4:\"name\";s:5:\"UI/UX\";s:4:\"slug\";s:4:\"uiux\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:10;s:11:\"category_id\";i:3;s:4:\"name\";s:14:\"Graphic Design\";s:4:\"slug\";s:14:\"graphic-design\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:10;s:11:\"category_id\";i:3;s:4:\"name\";s:14:\"Graphic Design\";s:4:\"slug\";s:14:\"graphic-design\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:11;s:11:\"category_id\";i:3;s:4:\"name\";s:5:\"Figma\";s:4:\"slug\";s:5:\"figma\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:11;s:11:\"category_id\";i:3;s:4:\"name\";s:5:\"Figma\";s:4:\"slug\";s:5:\"figma\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:12;s:11:\"category_id\";i:3;s:4:\"name\";s:9:\"Photoshop\";s:4:\"slug\";s:9:\"photoshop\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:12;s:11:\"category_id\";i:3;s:4:\"name\";s:9:\"Photoshop\";s:4:\"slug\";s:9:\"photoshop\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:19:\"App\\Models\\Category\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:5;s:4:\"name\";s:2:\"IT\";s:4:\"slug\";s:11:\"it-software\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fc09c910.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:52\";s:12:\"course_count\";i:6;}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:5;s:4:\"name\";s:2:\"IT\";s:4:\"slug\";s:11:\"it-software\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fc09c910.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:45:52\";s:12:\"course_count\";i:6;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:11:\"subcategory\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:17;s:11:\"category_id\";i:5;s:4:\"name\";s:14:\"Cyber Security\";s:4:\"slug\";s:14:\"cyber-security\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:17;s:11:\"category_id\";i:5;s:4:\"name\";s:14:\"Cyber Security\";s:4:\"slug\";s:14:\"cyber-security\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:18;s:11:\"category_id\";i:5;s:4:\"name\";s:15:\"Cloud Computing\";s:4:\"slug\";s:15:\"cloud-computing\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:18;s:11:\"category_id\";i:5;s:4:\"name\";s:15:\"Cloud Computing\";s:4:\"slug\";s:15:\"cloud-computing\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:19;s:11:\"category_id\";i:5;s:4:\"name\";s:12:\"Data Science\";s:4:\"slug\";s:12:\"data-science\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:19;s:11:\"category_id\";i:5;s:4:\"name\";s:12:\"Data Science\";s:4:\"slug\";s:12:\"data-science\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:20;s:11:\"category_id\";i:5;s:4:\"name\";s:6:\"Python\";s:4:\"slug\";s:6:\"python\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:20;s:11:\"category_id\";i:5;s:4:\"name\";s:6:\"Python\";s:4:\"slug\";s:6:\"python\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:19:\"App\\Models\\Category\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:2;s:4:\"name\";s:6:\"Mobile\";s:4:\"slug\";s:18:\"mobile-development\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fcb571f3.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:46:03\";s:12:\"course_count\";i:4;}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:2;s:4:\"name\";s:6:\"Mobile\";s:4:\"slug\";s:18:\"mobile-development\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523fcb571f3.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:46:03\";s:12:\"course_count\";i:4;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:11:\"subcategory\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:5;s:11:\"category_id\";i:2;s:4:\"name\";s:7:\"Flutter\";s:4:\"slug\";s:7:\"flutter\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:5;s:11:\"category_id\";i:2;s:4:\"name\";s:7:\"Flutter\";s:4:\"slug\";s:7:\"flutter\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:6;s:11:\"category_id\";i:2;s:4:\"name\";s:12:\"React Native\";s:4:\"slug\";s:12:\"react-native\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:6;s:11:\"category_id\";i:2;s:4:\"name\";s:12:\"React Native\";s:4:\"slug\";s:12:\"react-native\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:7;s:11:\"category_id\";i:2;s:4:\"name\";s:5:\"Swift\";s:4:\"slug\";s:5:\"swift\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:7;s:11:\"category_id\";i:2;s:4:\"name\";s:5:\"Swift\";s:4:\"slug\";s:5:\"swift\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:8;s:11:\"category_id\";i:2;s:4:\"name\";s:6:\"Kotlin\";s:4:\"slug\";s:6:\"kotlin\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:8;s:11:\"category_id\";i:2;s:4:\"name\";s:6:\"Kotlin\";s:4:\"slug\";s:6:\"kotlin\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:4;O:19:\"App\\Models\\Category\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:1;s:4:\"name\";s:3:\"Web\";s:4:\"slug\";s:15:\"web-development\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523ffe9acf3.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:46:54\";s:12:\"course_count\";i:3;}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:1;s:4:\"name\";s:3:\"Web\";s:4:\"slug\";s:15:\"web-development\";s:5:\"image\";s:55:\"http://127.0.0.1:8000/upload/category/69523ffe9acf3.jpg\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:46:54\";s:12:\"course_count\";i:3;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:11:\"subcategory\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:4:\"name\";s:5:\"React\";s:4:\"slug\";s:5:\"react\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:44:18\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:4:\"name\";s:5:\"React\";s:4:\"slug\";s:5:\"react\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 08:44:18\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:1;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:2;s:11:\"category_id\";i:1;s:4:\"name\";s:7:\"Laravel\";s:4:\"slug\";s:7:\"laravel\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:2;s:11:\"category_id\";i:1;s:4:\"name\";s:7:\"Laravel\";s:4:\"slug\";s:7:\"laravel\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:2;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:11:\"category_id\";i:1;s:4:\"name\";s:7:\"Node.js\";s:4:\"slug\";s:6:\"nodejs\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:11:\"category_id\";i:1;s:4:\"name\";s:7:\"Node.js\";s:4:\"slug\";s:6:\"nodejs\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}i:3;O:22:\"App\\Models\\SubCategory\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"sub_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:4;s:11:\"category_id\";i:1;s:4:\"name\";s:6:\"Vue.js\";s:4:\"slug\";s:5:\"vuejs\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:4;s:11:\"category_id\";i:1;s:4:\"name\";s:6:\"Vue.js\";s:4:\"slug\";s:5:\"vuejs\";s:10:\"created_at\";s:19:\"2025-12-29 05:50:28\";s:10:\"updated_at\";s:19:\"2025-12-29 05:50:28\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1767597956),
('laravel_cache_smtp_settings', 'O:15:\"App\\Models\\Smtp\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"smtps\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:1;s:6:\"mailer\";s:4:\"smtp\";s:4:\"host\";s:14:\"smtp.gmail.com\";s:4:\"port\";s:3:\"587\";s:8:\"username\";s:24:\"patelbhakti636@gmail.com\";s:8:\"password\";s:19:\"nply qovj jofm byjk\";s:10:\"encryption\";s:3:\"tls\";s:12:\"from_address\";s:24:\"patelbhakti636@gmail.com\";s:10:\"created_at\";s:19:\"2025-12-26 12:08:37\";s:10:\"updated_at\";s:19:\"2025-12-26 12:08:37\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:1;s:6:\"mailer\";s:4:\"smtp\";s:4:\"host\";s:14:\"smtp.gmail.com\";s:4:\"port\";s:3:\"587\";s:8:\"username\";s:24:\"patelbhakti636@gmail.com\";s:8:\"password\";s:19:\"nply qovj jofm byjk\";s:10:\"encryption\";s:3:\"tls\";s:12:\"from_address\";s:24:\"patelbhakti636@gmail.com\";s:10:\"created_at\";s:19:\"2025-12-26 12:08:37\";s:10:\"updated_at\";s:19:\"2025-12-26 12:08:37\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}', 1767597801),
('laravel_cache_student6@example.com|127.0.0.1', 'i:1;', 1767269450),
('laravel_cache_student6@example.com|127.0.0.1:timer', 'i:1767269450;', 1767269450);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ;

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
(13, NULL, 'f16fde75-9142-4727-8f9e-33f15afa5ce0', 19, 1, '2025-12-26 05:23:40', '2025-12-26 05:23:40'),
(41, 22, NULL, 7, 1, '2025-12-29 22:55:08', '2025-12-29 22:55:08'),
(42, 22, NULL, 20, 1, '2025-12-29 23:09:45', '2025-12-29 23:09:45'),
(52, 16, NULL, 14, 1, '2025-12-31 00:25:33', '2025-12-31 00:25:33'),
(54, 12, NULL, 6, 1, '2025-12-31 00:35:55', '2025-12-31 00:35:55'),
(55, 12, NULL, 11, 1, '2025-12-31 04:50:01', '2025-12-31 04:50:01'),
(64, 17, NULL, 13, 1, '2026-01-01 05:13:50', '2026-01-01 05:13:50'),
(68, 17, NULL, 16, 1, '2026-01-01 07:11:20', '2026-01-01 07:11:20'),
(83, NULL, '3407ee73-6a66-4f03-aedb-0e6e046e9baf', 16, 1, '2026-01-02 22:55:49', '2026-01-02 22:55:49'),
(85, 24, NULL, 16, 1, '2026-01-03 01:20:16', '2026-01-03 01:20:16'),
(86, 5, NULL, 22, 1, '2026-01-03 02:58:50', '2026-01-03 02:58:50');

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
(1, 'Web', 'web-development', 'http://127.0.0.1:8000/upload/category/69523ffe9acf3.jpg', '2025-12-29 00:20:28', '2025-12-29 03:16:54'),
(2, 'Mobile', 'mobile-development', 'http://127.0.0.1:8000/upload/category/69523fcb571f3.jpg', '2025-12-29 00:20:28', '2025-12-29 03:16:03'),
(3, 'Design', 'design', 'http://127.0.0.1:8000/upload/category/69523fb0bb376.jpg', '2025-12-29 00:20:28', '2025-12-29 03:15:36'),
(4, 'Business', 'business', 'http://127.0.0.1:8000/upload/category/69523f90ce0b8.jpg', '2025-12-29 00:20:28', '2025-12-29 03:15:04'),
(5, 'IT', 'it-software', 'http://127.0.0.1:8000/upload/category/69523fc09c910.jpg', '2025-12-29 00:20:28', '2025-12-29 03:15:52');

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

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `course_id`, `certificate_number`, `file_path`, `issued_at`, `created_at`, `updated_at`) VALUES
(1, 12, 8, 'CERT-69537A8DA374F', NULL, '2025-12-30 01:39:01', '2025-12-30 01:39:01', '2025-12-30 01:39:01'),
(2, 18, 23, 'CERT-6953B6963A8EE', NULL, '2025-12-30 05:55:10', '2025-12-30 05:55:10', '2025-12-30 05:55:10'),
(3, 24, 11, 'CERT-69574BD5C0A6C', NULL, '2026-01-01 23:08:45', '2026-01-01 23:08:45', '2026-01-01 23:08:45'),
(4, 24, 2, 'CERT-6957620C8C492', NULL, '2026-01-02 00:43:32', '2026-01-02 00:43:32', '2026-01-02 00:43:32'),
(5, 25, 1, 'CERT-695776A80B94E', NULL, '2026-01-02 02:11:28', '2026-01-02 02:11:28', '2026-01-02 02:11:28'),
(6, 26, 22, 'CERT-6957959B8EF4F', NULL, '2026-01-02 04:23:31', '2026-01-02 04:23:31', '2026-01-02 04:23:31');

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
(1, 5, 'INS5OFF5', '5', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 5, 'INS5OFF10', '10', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 5, 'INS5OFF15', '15', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 6, 'INS6OFF5', '5', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 6, 'INS6OFF10', '10', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 6, 'INS6OFF15', '15', '2026-01-28', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 7, 'INS7OFF5', '1', '2026-01-28', 1, '2025-12-29 00:20:29', '2026-01-01 22:45:31'),
(8, 7, 'INS7OFF10', '10', '2027-01-28', 1, '2025-12-29 00:20:29', '2025-12-30 04:12:03'),
(9, 7, 'INS7OFF15', '15', '2026-01-01', 1, '2025-12-29 00:20:29', '2026-01-01 05:24:43'),
(10, 8, 'INS8OFF5', '5', '2026-01-28', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(11, 8, 'INS8OFF10', '10', '2026-01-28', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(12, 8, 'INS8OFF15', '15', '2026-01-28', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(13, 9, 'today50', '50', '2026-01-03', 1, '2025-12-29 00:20:29', '2026-01-03 02:59:32'),
(14, 9, 'abc100', '100', '2026-01-02', 1, '2025-12-29 00:20:29', '2026-01-02 05:47:21'),
(15, 9, 'old15', '15', '2026-01-01', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(16, 6, 'test', '10', '2026-01-30', 1, '2025-12-31 00:02:26', '2026-01-01 01:28:54'),
(17, 5, 'test%123', '10', '2027-01-10', 1, '2025-12-31 00:28:23', '2025-12-31 00:28:23'),
(18, 6, 'demo', '10', '2026-01-14', 1, '2025-12-31 00:50:28', '2026-01-02 00:15:50'),
(19, 6, 'test1', '10', '2026-01-15', 1, '2025-12-31 01:18:30', '2026-01-02 00:14:54'),
(20, 6, 'test3', '2', '2026-01-01', 1, '2025-12-31 01:50:11', '2025-12-31 01:50:11'),
(21, 7, 'test123', '10', '2026-01-10', 1, '2026-01-01 05:47:49', '2026-01-01 22:44:50');

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
(1, 5, 17, 5, 'http://127.0.0.1:8000/upload/course/69521889a443d.jpg', 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 'cyber-security-masterclass-by-instructor-1-vol-1', '<p>Exercitationem qui pariatur facere ut commodi. Tempore dignissimos et et quae inventore. Vel dolorem ducimus non quo omnis. Et voluptatibus amet asperiores incidunt aut quo. Laudantium neque sunt deserunt. Eligendi doloremque doloremque mollitia sed quia a similique. Praesentium velit quasi eum incidunt. Rerum consequatur quas nam qui. Sint quaerat et vero distinctio dolore. Aut nemo nihil rem et.</p>', 'https://www.youtube.com/watch?v=inWWhr5tnEA', 'medium', NULL, 'yes', 24.78, 90, 11, '<p>Basic knowledge of Cyber Security</p>', 'no', 'no', 'no', 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:28:33'),
(2, 2, 8, 5, 'http://127.0.0.1:8000/upload/course/695218b536f2b.jpg', 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 'kotlin-masterclass-by-instructor-1-vol-2', '<p>Nemo ea repudiandae nihil consequatur. Optio aliquid non omnis ratione cumque et. Fuga dolorum accusamus sit. Perspiciatis accusamus unde numquam. Officia veritatis et ab aut. Placeat eum praesentium provident est aut animi. Ullam nobis enim voluptas unde. Nemo itaque corporis enim dolorum veniam molestias. Error quos fuga dolores iusto labore praesentium quidem. Officia blanditiis pariatur atque inventore nam. Dolorem molestiae asperiores voluptatem dignissimos qui qui ducimus.</p>', 'https://www.youtube.com/watch?v=NosAkIKgA4Y&list=PLRKyZvuMYSIMW3-rSOGCkPlO1z_IYJy3G', 'advance', NULL, 'yes', 41.85, 64, 20, '<p>Basic knowledge of Kotlin</p>', 'no', 'no', 'no', 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:29:17'),
(4, 5, 19, 5, 'http://127.0.0.1:8000/upload/course/695218e699903.jpg', 'Data Science - Masterclass by Instructor 1 (Vol 4)', 'Data Science - Masterclass by Instructor 1 (Vol 4)', 'data-science-masterclass-by-instructor-1-vol-4', '<p>Rem laborum hic qui rem necessitatibus occaecati molestiae. Iure aspernatur ad numquam iste corporis rem omnis. Cupiditate velit vel atque consequatur omnis animi. Reiciendis harum beatae beatae quidem necessitatibus enim eveniet. Voluptas odio nihil voluptatem aut perspiciatis rerum atque. Praesentium enim maxime ratione dolorum. Ut vel dolore aliquid tempore iusto error. Corrupti iusto ut unde asperiores dolorem neque. Tenetur cum maiores iste vel. A ipsa hic velit voluptatum et enim voluptatum.</p>', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 'medium', NULL, 'yes', 20.33, 72, 31, '<p>Basic knowledge of Data Science</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:30:06'),
(6, 1, 2, 6, 'http://127.0.0.1:8000/upload/course/695245ed1c94e.jpg', 'Swift - Masterclass by Instructor 2 (Vol 1)', 'Swift - Masterclass by Instructor 2 (Vol 101)', 'swift---masterclass-by-instructor-2-vol-101', '<p>Error accusantium iste ipsa autem dolorem aliquam id. Sed est et pariatur libero minima minima et. Aut quod dolor eius sunt error. Id molestiae dolore unde excepturi tenetur. Non sunt iusto dolor odit. Unde dignissimos temporibus voluptas facere. Possimus id sed delectus eum veniam vel quis. Beatae adipisci dolores quam. Cumque est non provident expedita nobis quia sapiente. Optio voluptatem minima est cumque. Et rerum consectetur dolor qui. Aut qui provident id ea quia quod ut laboriosam.</p>', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 'medium', NULL, 'yes', 6.14, 149, 18, '<p>Basic knowledge of Swift</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:28', '2025-12-31 00:00:06'),
(7, 4, 13, 6, 'http://127.0.0.1:8000/upload/course/69524627be2a5.jpg', 'Finance - Masterclass by Instructor 2 (Vol 2)', 'Finance - Masterclass by Instructor 2 (Vol 2)', 'finance-masterclass-by-instructor-2-vol-2', '<p>Consequuntur quos nesciunt occaecati dolor. Ut rerum dicta deserunt dolorem rem. Quae exercitationem in qui ipsa perspiciatis culpa qui. Asperiores vitae explicabo qui enim recusandae nihil voluptate. Assumenda animi dolores dolorum. Minima vero et aut deserunt quam velit beatae dolorem. Omnis et accusamus ratione illum. Veniam repellat voluptatem minima ex asperiores voluptatem. Tempore consectetur ut voluptates sint. Veritatis autem provident incidunt omnis ducimus ut. Fugit alias est dolor ut quod qui itaque.</p>', 'https://www.youtube.com/watch?v=lpa8uy4DyMo&list=PL9ooVrP1hQOGPQVeapGsJCktzIO4DtI4_', 'beginer', NULL, 'yes', 41.98, 122, 32, '<p>Basic knowledge of Finance</p>', 'no', 'no', 'no', 1, 1, '2025-12-29 00:20:28', '2025-12-29 03:43:11'),
(8, 5, 17, 6, 'http://127.0.0.1:8000/upload/course/6952463f89cdb.jpg', 'Cyber Security - Masterclass by Instructor 2 (Vol 3)', 'Cyber Security - Masterclass by Instructor 2 (Vol 3)', 'cyber-security-masterclass-by-instructor-2-vol-3', '<p>Sit ut ipsam sunt voluptas. Sit sed doloremque eveniet quia voluptas eos rerum. Qui molestiae voluptatem nihil et ipsa beatae qui quisquam. Ut blanditiis quia quo odit. Est pariatur inventore non aut ea debitis quas. Deserunt nisi odit quos ut et molestiae inventore debitis. Dolores laboriosam optio sunt. Quidem sit ipsum eveniet totam. Consequatur accusamus qui alias. Expedita numquam esse id perspiciatis ipsa quia cum. Voluptatem iusto ut error labore.</p>', 'https://www.youtube.com/watch?v=lpa8uy4DyMo&list=PL9ooVrP1hQOGPQVeapGsJCktzIO4DtI4_', 'advance', NULL, 'yes', 20.83, 160, 36, '<p>Basic knowledge of Cyber Security</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:28', '2025-12-29 03:43:35'),
(9, 4, 14, 6, 'http://127.0.0.1:8000/upload/course/6952465a78f15.jpg', 'Marketing - Masterclass by Instructor 2 (Vol 4)', 'Marketing - Masterclass by Instructor 2 (Vol 4)', 'marketing-masterclass-by-instructor-2-vol-4', '<p>Eveniet qui quia aut dolorum sed qui sit. Qui suscipit aspernatur saepe consequatur ipsam impedit. Commodi unde excepturi ut veniam omnis et. Quam tenetur libero eaque quidem in delectus. Id eos animi dolores corporis. Vel perferendis iusto ipsa et. Sed quod voluptatem tempora id aut ut. Tenetur aut nam vitae dolorem illum aspernatur. Perspiciatis voluptates labore vel enim voluptate tempore. Expedita soluta similique non nemo beatae animi.</p>', 'https://www.youtube.com/watch?v=lpa8uy4DyMo&list=PL9ooVrP1hQOGPQVeapGsJCktzIO4DtI4_', 'medium', NULL, 'yes', 7.40, 136, 21, '<p>Basic knowledge of Marketing</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:28', '2025-12-29 03:44:02'),
(10, 5, 17, 6, 'http://127.0.0.1:8000/upload/course/6952467d407dd.jpg', 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 'cyber-security-masterclass-by-instructor-2-vol-5', '<p>Ducimus tenetur quaerat illo sunt sapiente debitis. Deleniti perspiciatis quisquam voluptas fugit quia quo. Non quia aut iusto laboriosam possimus. Qui omnis exercitationem rem sequi qui. Sunt et et officiis. Quasi non rem numquam debitis. Eum aliquid est expedita culpa quam soluta. Velit modi voluptatum autem est perferendis voluptas. Eveniet culpa harum molestiae fugit reprehenderit. Harum expedita aut atque quia occaecati sit. Nulla qui doloribus eos debitis.</p>', 'https://www.youtube.com/watch?v=lpa8uy4DyMo&list=PL9ooVrP1hQOGPQVeapGsJCktzIO4DtI4_', 'medium', NULL, 'yes', 42.85, 55, 34, '<p>Basic knowledge of Cyber Security</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:28', '2025-12-29 03:44:37'),
(11, 2, 6, 7, 'http://127.0.0.1:8000/upload/course/695247a00583a.jpg', 'React Native - Masterclass by Instructor 3 (Vol 1)', 'React Native - Masterclass by Instructor 3 (Vol 1)', 'react-native-masterclass-by-instructor-3-vol-1', '<p>Voluptatibus sunt rerum eum. Iusto dolor ipsa voluptas qui corporis sequi eius voluptas. Doloribus sequi qui officiis quaerat sed rerum. Sed qui modi nihil ut debitis. Similique alias et ullam hic et illum. Deserunt voluptas veritatis quos atque quis consectetur alias aut. Qui repellat perspiciatis aperiam est voluptate necessitatibus. Sint corrupti nesciunt deleniti dolor harum esse omnis. Minima dolores quis sunt. Dolor dolorem fugit eveniet exercitationem.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'advance', NULL, 'yes', 10.74, 108, 15, '<p>Basic knowledge of React Native</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 03:49:28'),
(12, 4, 14, 7, 'http://127.0.0.1:8000/upload/course/695247bacb8ea.jpg', 'Marketing - Masterclass by Instructor 3 (Vol 2)', 'Marketing - Masterclass by Instructor 3 (Vol 2)', 'marketing-masterclass-by-instructor-3-vol-2', '<p>Iure est minus quisquam nulla. Provident impedit nihil qui animi veniam laudantium. Odit tenetur incidunt sunt distinctio earum. Debitis cupiditate consequatur commodi. Est minima vel aliquam. Odit qui nihil ex aut. Perferendis maiores hic perspiciatis quaerat ipsum sequi quia. Voluptate et incidunt quaerat rerum maiores consequatur ut nostrum. Laborum et sed maxime debitis consequatur velit. Modi officia voluptatem dolorem mollitia et. Voluptatem voluptatem cumque labore architecto.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'beginer', NULL, 'yes', 38.07, 168, 35, '<p>Basic knowledge of Marketing</p>', 'yes', 'no', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 03:49:54'),
(13, 3, 10, 7, 'http://127.0.0.1:8000/upload/course/695247e1ae12f.jpg', 'Graphic Design - Masterclass by Instructor 3 (Vol 3)', 'Graphic Design - Masterclass by Instructor 3 (Vol 3)', 'graphic-design-masterclass-by-instructor-3-vol-3', '<p>Corrupti vel officiis voluptatem et eos dolor dolorem totam. Necessitatibus magni ut consectetur est totam quis. Qui quam voluptatibus enim. Nihil ipsam consequatur sint debitis quos eos delectus. Iste et cumque in repellat. Quas nihil quibusdam occaecati porro. Blanditiis ratione eum dignissimos nam aut. Voluptatem molestias velit cum est. Quam et distinctio odio fugiat est optio recusandae. Nihil ipsam recusandae hic in debitis aliquam quia ea. Rem sed nulla optio non.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'medium', NULL, 'no', 35.31, 55, 20, '<p>Basic knowledge of Graphic Design</p>', 'yes', 'no', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 03:50:33'),
(14, 4, 15, 7, 'http://127.0.0.1:8000/upload/course/695247fed8bc2.jpg', 'Entrepreneurship - Masterclass by Instructor 3 (Vol 4)', 'Entrepreneurship - Masterclass by Instructor 3 (Vol 4)', 'entrepreneurship-masterclass-by-instructor-3-vol-4', '<p>Odio id quibusdam assumenda quam eveniet fugit nulla eligendi. Voluptatem totam et eos aspernatur rerum. Voluptatem quia repudiandae ex qui. Beatae dolorem eum est atque modi. Fuga praesentium enim consequatur. Eaque voluptatum nihil esse hic asperiores quidem aut commodi. Voluptatem enim nemo ex quam voluptas officiis. Labore sed corrupti totam perferendis. In cupiditate et minima et. Dolorum dolorem enim hic voluptatem sit odio perspiciatis minus.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'medium', NULL, 'yes', 10.09, 88, 24, '<p>Basic knowledge of Entrepreneurship</p>', 'yes', 'no', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 03:51:02'),
(15, 3, 11, 7, 'http://127.0.0.1:8000/upload/course/69524813c9944.jpg', 'Figma - Masterclass by Instructor 3 (Vol 5)', 'Figma - Masterclass by Instructor 3 (Vol 5)', 'figma-masterclass-by-instructor-3-vol-5', '<p>Tenetur asperiores cumque tenetur commodi ut qui ut velit. Voluptatem rerum nisi quidem assumenda sit dolorem iusto. Et quae nam error itaque ea voluptatibus porro. Voluptates blanditiis corporis ullam dicta. Sunt alias recusandae asperiores dolore in. Quos qui impedit dolorum voluptates neque laborum et. Sed ratione atque ut velit sit quia in. Ea in dolorem nihil ullam neque qui.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'advance', NULL, 'yes', 13.87, 74, 14, '<p>Basic knowledge of Figma</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 03:51:23'),
(16, 2, 8, 8, 'http://127.0.0.1:8000/upload/course/69524bfce7634.jpg', 'Kotlin - Masterclass by Instructor 4 (Vol 1)', 'Kotlin - Masterclass by Instructor 4 (Vol 1)', 'kotlin-masterclass-by-instructor-4-vol-1', '<p>Temporibus atque voluptatem sint molestiae doloremque itaque. Voluptatem voluptatem molestiae minus earum eaque. Tenetur laboriosam ad illum dolores ut. Consequatur aliquid asperiores sint in voluptas laudantium. Assumenda blanditiis deserunt dolor magnam similique qui. Et voluptatum beatae omnis veniam facere ratione doloremque. Vitae atque quibusdam natus officiis rerum quod quos. Voluptatibus rerum distinctio sunt id recusandae omnis quae. Aperiam consequuntur qui ut assumenda.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'medium', NULL, 'yes', 18.46, 140, 32, '<p>Basic knowledge of Kotlin</p>', 'no', 'no', 'yes', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:08:04'),
(17, 1, 2, 8, 'http://127.0.0.1:8000/upload/course/69524c1495153.jpg', 'Laravel - Masterclass by Instructor 4 (Vol 2)', 'Laravel - Masterclass by Instructor 4 (Vol 2)', 'laravel-masterclass-by-instructor-4-vol-2', '<p>Ut et aspernatur aut voluptate quo quis sed. Doloribus quibusdam sapiente dolores qui. Voluptatibus tempore neque et reprehenderit eum. Saepe dolor distinctio corporis labore. Modi ut iste blanditiis voluptate dolorem aperiam. Blanditiis vel sit tempora. Sed vel amet iste et.</p>', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 'advance', NULL, 'yes', 48.69, 169, 35, '<p>Basic knowledge of Laravel</p>', 'no', 'no', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:08:28'),
(18, 3, 11, 8, 'http://127.0.0.1:8000/upload/course/69524c2d32905.jpg', 'Figma - Masterclass by Instructor 4 (Vol 3)', 'Figma - Masterclass by Instructor 4 (Vol 3)', 'figma-masterclass-by-instructor-4-vol-3', '<p>Saepe molestiae aut aut facere autem modi. Ut nesciunt aut et commodi. Quaerat id et laboriosam laudantium. Soluta distinctio voluptas non et et. Eos omnis omnis explicabo necessitatibus recusandae. Odio est quos rem accusantium doloremque sit ad aut. Harum et enim nihil exercitationem et ut architecto quis. Praesentium non veniam cupiditate. Inventore a ut sint. Laboriosam assumenda illo necessitatibus laborum aut inventore quos. Quo ipsam sint et eos nobis temporibus.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'medium', NULL, 'yes', 12.82, 190, 36, '<p>Basic knowledge of Figma</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:08:53'),
(19, 3, 12, 8, 'http://127.0.0.1:8000/upload/course/69524c632610c.jpg', 'Photoshop - Masterclass by Instructor 4 (Vol 4)', 'Photoshop - Masterclass by Instructor 4 (Vol 4)', 'photoshop-masterclass-by-instructor-4-vol-4', '<p>Eligendi minus et omnis recusandae. Aut velit sit ullam et ratione quia nihil. Ut voluptate assumenda dolores magni laboriosam qui quae. Quia dolores eaque blanditiis explicabo. Nihil magnam perferendis sed occaecati. Assumenda maxime quos inventore nisi necessitatibus consectetur possimus. Id consequatur atque possimus sit sit qui. Qui sed amet rerum. Qui quibusdam porro atque quidem libero. Commodi eius ea et rerum ex. Pariatur quidem corrupti non ut.</p>', 'https://www.youtube.com/watch?v=-mJFZp84TIY&list=PLu0W_9lII9agx66oZnT6IyhcMIbUMNMdt', 'advance', NULL, 'no', 44.06, 120, 23, '<p>Basic knowledge of Photoshop</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:09:47'),
(20, 5, 20, 8, 'http://127.0.0.1:8000/upload/course/69524c81d1058.jpg', 'Python - Masterclass by Instructor 4 (Vol 5)', 'Python - Masterclass by Instructor 4 (Vol 5)', 'python-masterclass-by-instructor-4-vol-5', '<p>Iste distinctio nihil voluptas. Consectetur sed et illum. Eum suscipit aut aut voluptatem et. Et numquam quidem incidunt atque quaerat et. Laborum ex odit omnis et aspernatur officiis quis. Repellat voluptas nemo magni facilis. Aut at libero repellendus veniam unde voluptatibus harum. Maiores odio est sint sed. Odit distinctio id porro veniam dignissimos in. Nesciunt qui consectetur dolorum sunt sed tenetur ut.</p>', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 'advance', NULL, 'yes', 42.16, 183, 31, '<p>Basic knowledge of Python</p>', 'no', 'no', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:10:17'),
(21, 3, 9, 9, 'http://127.0.0.1:8000/upload/course/69524dfa09d7b.jpg', 'UI/UX - Masterclass by Instructor 5 (Vol 1)', 'UI/UX - Masterclass by Instructor 5 (Vol 1)', 'uiux-masterclass-by-instructor-5-vol-1', '<p>Repellat recusandae fugiat laborum quia rerum nemo distinctio maiores. Ea minus molestiae nihil dolores et. Perspiciatis doloribus laborum ipsum dicta quia. Nesciunt veritatis qui illo. Fuga maiores dignissimos modi consequatur vitae tempore. Repellendus enim maxime voluptatibus. Ea voluptates voluptatem autem occaecati aut fugiat omnis. Magnam est est aut similique ab rem exercitationem. Aliquam et cum illo repellat distinctio quia. Accusamus in ab quia distinctio nostrum. Qui blanditiis praesentium distinctio exercitationem qui.</p>', 'https://www.youtube.com/watch?v=XAavYvVHb74', 'medium', NULL, 'yes', 41.71, 107, 12, '<p>Basic knowledge of UI/UX</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:16:34'),
(22, 2, 6, 9, 'http://127.0.0.1:8000/upload/course/69524e10b8262.jpg', 'React Native - Masterclass by Instructor 5 (Vol 2)', 'React Native - Masterclass by Instructor 5 (Vol 2)', 'react-native-masterclass-by-instructor-5-vol-2', '<p>Omnis numquam iusto amet quis in velit reprehenderit consequatur. Exercitationem non quis expedita nihil. Quia dolores quo vel ullam. Aspernatur ipsa reprehenderit et quo ratione consequuntur. Cupiditate incidunt nemo velit quam. Qui et voluptas aliquam animi est ipsa. Fuga doloremque officiis hic est dolor. Nisi tempora cum est. Repellat odio inventore enim quam ut. Tempore quo ad mollitia similique omnis dolor.</p>', 'https://www.youtube.com/watch?v=XAavYvVHb74', 'advance', NULL, 'yes', 24.76, 173, 12, '<p>Basic knowledge of React Native</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:16:56'),
(23, 5, 20, 9, 'http://127.0.0.1:8000/upload/course/69524e24787b6.jpg', 'Python - Masterclass by Instructor 5 (Vol 3)', 'Python - Masterclass by Instructor 5 (Vol 3)', 'python-masterclass-by-instructor-5-vol-3', '<p>Velit nostrum eos modi sit rerum. Sit minima amet aliquam sapiente vel sequi aut. Repellat perspiciatis dolor reprehenderit itaque deleniti nihil et. Aut rerum alias non non temporibus. Animi eius dicta ut qui occaecati. Aut error et fugiat aperiam cum. Impedit accusantium voluptatem quam unde cumque distinctio. Eum tempora beatae ut magni adipisci consectetur assumenda. Eos ut qui officia. Qui repellat quae fugit et et.</p>', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 'medium', NULL, 'yes', 31.26, 76, 23, '<p>Basic knowledge of Python</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:17:16'),
(24, 1, 2, 9, 'http://127.0.0.1:8000/upload/course/69524e42aa39e.jpg', 'Laravel - Masterclass by Instructor 5', 'Laravel - Masterclass by Instructor 5', 'laravel---masterclass-by-instructor-5-', '<p>Veniam natus omnis harum et omnis et non. Corporis et vel voluptas ipsum porro labore quas. In molestiae tenetur laudantium iure necessitatibus et ullam. Ut quo animi voluptatem qui. Ducimus aut a et omnis perferendis deserunt facere. Sit a consequuntur quo unde labore facilis. Tenetur vitae eveniet et fugiat sequi. Totam sunt illo quasi pariatur tempore. Est molestias debitis voluptatibus. Debitis ut eum aut rerum praesentium at. Impedit est consequatur perspiciatis rerum voluptatem aut.</p>', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 'medium', NULL, 'yes', 42.41, 77, 37, '<p>Basic knowledge of Laravel</p>', 'no', 'yes', 'yes', 1, 1, '2025-12-29 00:20:29', '2025-12-29 04:17:46'),
(25, 4, 16, 9, 'http://127.0.0.1:8000/upload/course/69524ddd216e9.jpg', 'Management - Masterclass by Instructor 5 (Vol 5)', 'Management - Masterclass by Instructor 5 (Vol 5)', 'management-masterclass-by-instructor-5-vol-5', '<p>Expedita laboriosam amet mollitia praesentium deleniti facilis. Error ratione at sint deserunt expedita eveniet. Perferendis quam nemo enim itaque. Qui quibusdam vero adipisci id ut tenetur quibusdam. Repudiandae ut beatae fuga facere voluptas. Sunt blanditiis aspernatur soluta quisquam animi quos. Rem illum molestias voluptatum suscipit. Repellat molestiae error dolorum qui. Exercitationem reprehenderit dolor natus.</p>', 'https://www.youtube.com/watch?v=XAavYvVHb74', 'medium', NULL, 'no', 19.74, 300, 150, '<p>Basic knowledge of Management</p>', 'no', 'yes', 'no', 1, 1, '2025-12-29 00:20:30', '2026-01-02 05:32:38');

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
(76, 1, 'Goal 1: Master Cyber Security core concepts.', '2025-12-29 00:28:33', '2025-12-29 00:28:33'),
(77, 1, 'Goal 2: Master Cyber Security core concepts.', '2025-12-29 00:28:33', '2025-12-29 00:28:33'),
(78, 1, 'Goal 3: Master Cyber Security core concepts.', '2025-12-29 00:28:33', '2025-12-29 00:28:33'),
(79, 2, 'Goal 1: Master Kotlin core concepts.', '2025-12-29 00:29:17', '2025-12-29 00:29:17'),
(80, 2, 'Goal 2: Master Kotlin core concepts.', '2025-12-29 00:29:17', '2025-12-29 00:29:17'),
(81, 2, 'Goal 3: Master Kotlin core concepts.', '2025-12-29 00:29:17', '2025-12-29 00:29:17'),
(82, 4, 'Goal 1: Master Data Science core concepts.', '2025-12-29 00:30:06', '2025-12-29 00:30:06'),
(83, 4, 'Goal 2: Master Data Science core concepts.', '2025-12-29 00:30:06', '2025-12-29 00:30:06'),
(84, 4, 'Goal 3: Master Data Science core concepts.', '2025-12-29 00:30:06', '2025-12-29 00:30:06'),
(88, 7, 'Goal 1: Master Finance core concepts.', '2025-12-29 03:43:11', '2025-12-29 03:43:11'),
(89, 7, 'Goal 2: Master Finance core concepts.', '2025-12-29 03:43:11', '2025-12-29 03:43:11'),
(90, 7, 'Goal 3: Master Finance core concepts.', '2025-12-29 03:43:11', '2025-12-29 03:43:11'),
(91, 8, 'Goal 1: Master Cyber Security core concepts.', '2025-12-29 03:43:35', '2025-12-29 03:43:35'),
(92, 8, 'Goal 2: Master Cyber Security core concepts.', '2025-12-29 03:43:35', '2025-12-29 03:43:35'),
(93, 8, 'Goal 3: Master Cyber Security core concepts.', '2025-12-29 03:43:35', '2025-12-29 03:43:35'),
(94, 9, 'Goal 1: Master Marketing core concepts.', '2025-12-29 03:44:02', '2025-12-29 03:44:02'),
(95, 9, 'Goal 2: Master Marketing core concepts.', '2025-12-29 03:44:02', '2025-12-29 03:44:02'),
(96, 9, 'Goal 3: Master Marketing core concepts.', '2025-12-29 03:44:02', '2025-12-29 03:44:02'),
(97, 10, 'Goal 1: Master Cyber Security core concepts.', '2025-12-29 03:44:37', '2025-12-29 03:44:37'),
(98, 10, 'Goal 2: Master Cyber Security core concepts.', '2025-12-29 03:44:37', '2025-12-29 03:44:37'),
(99, 10, 'Goal 3: Master Cyber Security core concepts.', '2025-12-29 03:44:37', '2025-12-29 03:44:37'),
(100, 11, 'Goal 1: Master React Native core concepts.', '2025-12-29 03:49:28', '2025-12-29 03:49:28'),
(101, 11, 'Goal 2: Master React Native core concepts.', '2025-12-29 03:49:28', '2025-12-29 03:49:28'),
(102, 11, 'Goal 3: Master React Native core concepts.', '2025-12-29 03:49:28', '2025-12-29 03:49:28'),
(103, 12, 'Goal 1: Master Marketing core concepts.', '2025-12-29 03:49:54', '2025-12-29 03:49:54'),
(104, 12, 'Goal 2: Master Marketing core concepts.', '2025-12-29 03:49:54', '2025-12-29 03:49:54'),
(105, 12, 'Goal 3: Master Marketing core concepts.', '2025-12-29 03:49:54', '2025-12-29 03:49:54'),
(106, 13, 'Goal 1: Master Graphic Design core concepts.', '2025-12-29 03:50:33', '2025-12-29 03:50:33'),
(107, 13, 'Goal 2: Master Graphic Design core concepts.', '2025-12-29 03:50:33', '2025-12-29 03:50:33'),
(108, 13, 'Goal 3: Master Graphic Design core concepts.', '2025-12-29 03:50:33', '2025-12-29 03:50:33'),
(109, 14, 'Goal 1: Master Entrepreneurship core concepts.', '2025-12-29 03:51:02', '2025-12-29 03:51:02'),
(110, 14, 'Goal 2: Master Entrepreneurship core concepts.', '2025-12-29 03:51:02', '2025-12-29 03:51:02'),
(111, 14, 'Goal 3: Master Entrepreneurship core concepts.', '2025-12-29 03:51:02', '2025-12-29 03:51:02'),
(112, 15, 'Goal 1: Master Figma core concepts.', '2025-12-29 03:51:23', '2025-12-29 03:51:23'),
(113, 15, 'Goal 2: Master Figma core concepts.', '2025-12-29 03:51:23', '2025-12-29 03:51:23'),
(114, 15, 'Goal 3: Master Figma core concepts.', '2025-12-29 03:51:23', '2025-12-29 03:51:23'),
(115, 16, 'Goal 1: Master Kotlin core concepts.', '2025-12-29 04:08:04', '2025-12-29 04:08:04'),
(116, 16, 'Goal 2: Master Kotlin core concepts.', '2025-12-29 04:08:04', '2025-12-29 04:08:04'),
(117, 16, 'Goal 3: Master Kotlin core concepts.', '2025-12-29 04:08:04', '2025-12-29 04:08:04'),
(118, 17, 'Goal 1: Master Laravel core concepts.', '2025-12-29 04:08:28', '2025-12-29 04:08:28'),
(119, 17, 'Goal 2: Master Laravel core concepts.', '2025-12-29 04:08:28', '2025-12-29 04:08:28'),
(120, 17, 'Goal 3: Master Laravel core concepts.', '2025-12-29 04:08:28', '2025-12-29 04:08:28'),
(124, 18, 'Goal 1: Master Figma core concepts.', '2025-12-29 04:09:20', '2025-12-29 04:09:20'),
(125, 18, 'Goal 2: Master Figma core concepts.', '2025-12-29 04:09:20', '2025-12-29 04:09:20'),
(126, 18, 'Goal 3: Master Figma core concepts.', '2025-12-29 04:09:20', '2025-12-29 04:09:20'),
(127, 19, 'Goal 1: Master Photoshop core concepts.', '2025-12-29 04:09:47', '2025-12-29 04:09:47'),
(128, 19, 'Goal 2: Master Photoshop core concepts.', '2025-12-29 04:09:47', '2025-12-29 04:09:47'),
(129, 19, 'Goal 3: Master Photoshop core concepts.', '2025-12-29 04:09:47', '2025-12-29 04:09:47'),
(130, 20, 'Goal 1: Master Python core concepts.', '2025-12-29 04:10:17', '2025-12-29 04:10:17'),
(131, 20, 'Goal 2: Master Python core concepts.', '2025-12-29 04:10:17', '2025-12-29 04:10:17'),
(132, 20, 'Goal 3: Master Python core concepts.', '2025-12-29 04:10:17', '2025-12-29 04:10:17'),
(139, 21, 'Goal 1: Master UI/UX core concepts.', '2025-12-29 04:16:34', '2025-12-29 04:16:34'),
(140, 21, 'Goal 2: Master UI/UX core concepts.', '2025-12-29 04:16:34', '2025-12-29 04:16:34'),
(141, 21, 'Goal 3: Master UI/UX core concepts.', '2025-12-29 04:16:34', '2025-12-29 04:16:34'),
(142, 22, 'Goal 1: Master React Native core concepts.', '2025-12-29 04:16:56', '2025-12-29 04:16:56'),
(143, 22, 'Goal 2: Master React Native core concepts.', '2025-12-29 04:16:56', '2025-12-29 04:16:56'),
(144, 22, 'Goal 3: Master React Native core concepts.', '2025-12-29 04:16:56', '2025-12-29 04:16:56'),
(145, 23, 'Goal 1: Master Python core concepts.', '2025-12-29 04:17:16', '2025-12-29 04:17:16'),
(146, 23, 'Goal 2: Master Python core concepts.', '2025-12-29 04:17:16', '2025-12-29 04:17:16'),
(147, 23, 'Goal 3: Master Python core concepts.', '2025-12-29 04:17:16', '2025-12-29 04:17:16'),
(148, 24, 'Goal 1: Master Laravel core concepts.', '2025-12-29 04:17:46', '2025-12-29 04:17:46'),
(149, 24, 'Goal 2: Master Laravel core concepts.', '2025-12-29 04:17:46', '2025-12-29 04:17:46'),
(150, 24, 'Goal 3: Master Laravel core concepts.', '2025-12-29 04:17:46', '2025-12-29 04:17:46'),
(151, 6, 'Goal 1: Master Swift core concepts.', '2025-12-31 00:00:06', '2025-12-31 00:00:06'),
(152, 6, 'Goal 2: Master Swift core concepts.', '2025-12-31 00:00:06', '2025-12-31 00:00:06'),
(153, 6, 'Goal 3: Master Swift core concepts.', '2025-12-31 00:00:06', '2025-12-31 00:00:06'),
(157, 25, 'Goal 1: Master Management core concepts.', '2026-01-02 05:32:38', '2026-01-02 05:32:38'),
(158, 25, 'Goal 2: Master Management core concepts.', '2026-01-02 05:32:38', '2026-01-02 05:32:38'),
(159, 25, 'Goal 3: Master Management core concepts.', '2026-01-02 05:32:38', '2026-01-02 05:32:38');

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
(1, 1, 1, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 12.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 1, 1, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 18.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 1, 1, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 11.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 1, 2, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 12.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 1, 2, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 17.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 1, 2, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 15.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 2, 3, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, '', '', NULL, '2026-12-01', '03:10:59', 17.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(8, 2, 3, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-12-11', '03:10:59', 15.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(9, 2, 3, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 21.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 2, 4, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 11.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 2, 4, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, 'aA8VmZ', '2027-12-11', '03:10:59', 27.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 2, 4, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 26.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 4, 7, 'Lecture 1 - Learning Data Science Step 1', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, 'aA8VmZ', '2027-12-11', '03:10:59', 17.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 4, 7, 'Lecture 2 - Learning Data Science Step 2', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 15.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 4, 7, 'Lecture 3 - Learning Data Science Step 3', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 13.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(22, 4, 8, 'Lecture 1 - Learning Data Science Step 1', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-12-11', '03:10:59', 26.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(23, 4, 8, 'Lecture 2 - Learning Data Science Step 2', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 0, NULL, NULL, NULL, '2026-12-01', '03:10:59', 11.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(24, 4, 8, 'Lecture 3 - Learning Data Science Step 3', 'https://www.youtube.com/watch?v=ua-CiDNNj30', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 29.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(31, 6, 11, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2026-12-01', '03:10:59', 10.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(32, 6, 11, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 18.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(33, 6, 11, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-12-11', '03:10:59', 26.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(34, 6, 12, 'Lecture 1 - Learning Swift Step 1', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 28.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(35, 6, 12, 'Lecture 2 - Learning Swift Step 2', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-01-10', '03:10:59', 18.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(36, 6, 12, 'Lecture 3 - Learning Swift Step 3', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-12-11', '03:10:59', 12.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(37, 7, 13, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 1, 'https://us05web.zoom.us/j/87533321435?pwd=wFz6ToGZ81o00QrbPwwz8SSvJRNaCV.1', '875 3332 1435', 'aA8VmZ', '2027-12-11', '03:10:59', 25.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(38, 7, 13, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(39, 7, 13, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(40, 7, 14, 'Lecture 1 - Learning Finance Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(41, 7, 14, 'Lecture 2 - Learning Finance Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(42, 7, 14, 'Lecture 3 - Learning Finance Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(43, 8, 15, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(44, 8, 15, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(45, 8, 15, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(46, 8, 16, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(47, 8, 16, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(48, 8, 16, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(49, 9, 17, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(50, 9, 17, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(51, 9, 17, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(52, 9, 18, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(53, 9, 18, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(54, 9, 18, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(55, 10, 19, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(56, 10, 19, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(57, 10, 19, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(58, 10, 20, 'Lecture 1 - Learning Cyber Security Step 1', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(59, 10, 20, 'Lecture 2 - Learning Cyber Security Step 2', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 2, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(60, 10, 20, 'Lecture 3 - Learning Cyber Security Step 3', 'https://www.youtube.com/watch?v=U_P2fR1S94s', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 3, 0, 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(61, 11, 21, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(62, 11, 21, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(63, 11, 21, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(64, 11, 22, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(65, 11, 22, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(66, 11, 22, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(67, 12, 23, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(68, 12, 23, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(69, 12, 23, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(70, 12, 24, 'Lecture 1 - Learning Marketing Step 1', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(71, 12, 24, 'Lecture 2 - Learning Marketing Step 2', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(72, 12, 24, 'Lecture 3 - Learning Marketing Step 3', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(73, 13, 25, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(74, 13, 25, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(75, 13, 25, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(76, 13, 26, 'Lecture 1 - Learning Graphic Design Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(77, 13, 26, 'Lecture 2 - Learning Graphic Design Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(78, 13, 26, 'Lecture 3 - Learning Graphic Design Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(79, 14, 27, 'Lecture 1 - Learning Entrepreneurship Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(80, 14, 27, 'Lecture 2 - Learning Entrepreneurship Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(81, 14, 27, 'Lecture 3 - Learning Entrepreneurship Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(82, 14, 28, 'Lecture 1 - Learning Entrepreneurship Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(83, 14, 28, 'Lecture 2 - Learning Entrepreneurship Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(84, 14, 28, 'Lecture 3 - Learning Entrepreneurship Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(85, 15, 29, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(86, 15, 29, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(87, 15, 29, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(88, 15, 30, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(89, 15, 30, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(90, 15, 30, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(91, 16, 31, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(92, 16, 31, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(93, 16, 31, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(94, 16, 32, 'Lecture 1 - Learning Kotlin Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(95, 16, 32, 'Lecture 2 - Learning Kotlin Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(96, 16, 32, 'Lecture 3 - Learning Kotlin Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(97, 17, 33, 'Lecture 1 - Learning Laravel Step 1', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(98, 17, 33, 'Lecture 2 - Learning Laravel Step 2', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(99, 17, 33, 'Lecture 3 - Learning Laravel Step 3', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(100, 17, 34, 'Lecture 1 - Learning Laravel Step 1', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(101, 17, 34, 'Lecture 2 - Learning Laravel Step 2', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(102, 17, 34, 'Lecture 3 - Learning Laravel Step 3', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(103, 18, 35, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(104, 18, 35, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(105, 18, 35, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(106, 18, 36, 'Lecture 1 - Learning Figma Step 1', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(107, 18, 36, 'Lecture 2 - Learning Figma Step 2', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(108, 18, 36, 'Lecture 3 - Learning Figma Step 3', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(109, 19, 37, 'Lecture 1 - Learning Photoshop Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(110, 19, 37, 'Lecture 2 - Learning Photoshop Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(111, 19, 37, 'Lecture 3 - Learning Photoshop Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(112, 19, 38, 'Lecture 1 - Learning Photoshop Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(113, 19, 38, 'Lecture 2 - Learning Photoshop Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(114, 19, 38, 'Lecture 3 - Learning Photoshop Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(115, 20, 39, 'Lecture 1 - Learning Python Step 1', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(116, 20, 39, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(117, 20, 39, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(118, 20, 40, 'Lecture 1 - Learning Python Step 1', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(119, 20, 40, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(120, 20, 40, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(121, 21, 41, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(122, 21, 41, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(123, 21, 41, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(124, 21, 42, 'Lecture 1 - Learning UI/UX Step 1', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(125, 21, 42, 'Lecture 2 - Learning UI/UX Step 2', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(126, 21, 42, 'Lecture 3 - Learning UI/UX Step 3', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(127, 22, 43, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(128, 22, 43, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(129, 22, 43, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(130, 22, 44, 'Lecture 1 - Learning React Native Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(131, 22, 44, 'Lecture 2 - Learning React Native Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(132, 22, 44, 'Lecture 3 - Learning React Native Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(133, 23, 45, 'Lecture 1 - Learning Python Step 1', NULL, NULL, 1, 'https://us05web.zoom.us/j/5550686311?pwd=mmSZwRZWvTbwsXc01H1jsmaJPNSPLo.1&omn=89264965359', '555 068 6311', 'xP4jX6', NULL, NULL, NULL, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-30 05:27:17'),
(134, 23, 45, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(135, 23, 45, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(136, 23, 46, 'Lecture 1 - Learning Python Step 1', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30.00, 1, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(137, 23, 46, 'Lecture 2 - Learning Python Step 2', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 2, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(138, 23, 46, 'Lecture 3 - Learning Python Step 3', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20.00, 3, 0, 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(139, 24, 47, 'Lecture 1 - Learning Laravel Step 1', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 1, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(140, 24, 47, 'Lecture 2 - Learning Laravel Step 2', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 2, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(141, 24, 47, 'Lecture 3 - Learning Laravel Step 3', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24.00, 3, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(142, 24, 48, 'Lecture 1 - Learning Laravel Step 1', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10.00, 1, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(143, 24, 48, 'Lecture 2 - Learning Laravel Step 2', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26.00, 2, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(144, 24, 48, 'Lecture 3 - Learning Laravel Step 3', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 3, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(145, 25, 49, 'Lecture 1 - Learning Management Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17.00, 1, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(146, 25, 49, 'Lecture 2 - Learning Management Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23.00, 2, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(147, 25, 49, 'Lecture 3 - Learning Management Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13.00, 3, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(148, 25, 50, 'Lecture 1 - Learning Management Step 1', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28.00, 1, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(149, 25, 50, 'Lecture 2 - Learning Management Step 2', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14.00, 2, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(150, 25, 50, 'Lecture 3 - Learning Management Step 3', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11.00, 3, 0, 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30');

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
(1, 1, 1, 'Master Guide 1 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 1, 1, 'Master Guide 2 - Cyber Security', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 1, 2, 'Master Guide 3 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 2, 3, 'Master Guide 1 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 2, 3, 'Master Guide 2 - Kotlin', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 2, 3, 'Master Guide 3 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 4, 7, 'Master Guide 1 - Data Science', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 4, 7, 'Master Guide 2 - Data Science', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 4, 8, 'Master Guide 3 - Data Science', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 6, 11, 'Master Guide 1 - Swift', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 6, 11, 'Master Guide 2 - Swift', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 6, 12, 'Master Guide 3 - Swift', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=FcsY1YPBwzQ', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 7, 13, 'Master Guide 1 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 7, 13, 'Master Guide 2 - Finance', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 7, 13, 'Master Guide 3 - Finance', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(22, 8, 15, 'Master Guide 1 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(23, 8, 15, 'Master Guide 2 - Cyber Security', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(24, 8, 15, 'Master Guide 3 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(25, 9, 17, 'Master Guide 1 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(26, 9, 17, 'Master Guide 2 - Marketing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(27, 9, 17, 'Master Guide 3 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(28, 10, 19, 'Master Guide 1 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(29, 10, 19, 'Master Guide 2 - Cyber Security', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(30, 10, 19, 'Master Guide 3 - Cyber Security', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=U_P2fR1S94s', 3, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(31, 11, 21, 'Master Guide 1 - React Native', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(32, 11, 21, 'Master Guide 2 - React Native', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(33, 12, 23, 'Master Guide 1 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(34, 12, 23, 'Master Guide 2 - Marketing', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(35, 12, 23, 'Master Guide 3 - Marketing', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=l_8p92w8z7Y', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(36, 13, 25, 'Master Guide 1 - Graphic Design', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(37, 13, 25, 'Master Guide 2 - Graphic Design', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(38, 14, 27, 'Master Guide 1 - Entrepreneurship', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(39, 14, 27, 'Master Guide 2 - Entrepreneurship', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(40, 14, 27, 'Master Guide 3 - Entrepreneurship', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(41, 15, 29, 'Master Guide 1 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 15, 29, 'Master Guide 2 - Figma', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 15, 29, 'Master Guide 3 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(44, 16, 31, 'Master Guide 1 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(45, 16, 31, 'Master Guide 2 - Kotlin', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(46, 16, 31, 'Master Guide 3 - Kotlin', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(47, 17, 33, 'Master Guide 1 - Laravel', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(48, 17, 33, 'Master Guide 2 - Laravel', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(49, 18, 35, 'Master Guide 1 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(50, 18, 35, 'Master Guide 2 - Figma', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(51, 18, 35, 'Master Guide 3 - Figma', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=jk1T6BaJiOE', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(52, 19, 37, 'Master Guide 1 - Photoshop', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(53, 19, 37, 'Master Guide 2 - Photoshop', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(54, 19, 38, 'Master Guide 3 - Photoshop', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(55, 20, 39, 'Master Guide 1 - Python', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(56, 20, 39, 'Master Guide 2 - Python', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(57, 21, 41, 'Master Guide 1 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(58, 21, 41, 'Master Guide 2 - UI/UX', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(59, 21, 41, 'Master Guide 3 - UI/UX', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=c9Wg6mBaeT8', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(60, 22, 43, 'Master Guide 1 - React Native', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(61, 22, 43, 'Master Guide 2 - React Native', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(62, 23, 45, 'Master Guide 1 - Python', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(63, 23, 45, 'Master Guide 2 - Python', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(64, 23, 45, 'Master Guide 3 - Python', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 3, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(65, 24, 47, 'Master Guide 1 - Laravel', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(66, 24, 47, 'Master Guide 2 - Laravel', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 2, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(67, 24, 47, 'Master Guide 3 - Laravel', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=MYyJ4PuL4pY', 3, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(68, 25, 49, 'Master Guide 1 - Management', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(69, 25, 49, 'Master Guide 2 - Management', 'pdf', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(70, 25, 50, 'Master Guide 3 - Management', 'link', 'upload/material/sample.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 3, '2025-12-29 00:20:30', '2025-12-29 00:20:30');

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

--
-- Dumping data for table `course_progress`
--

INSERT INTO `course_progress` (`id`, `user_id`, `course_id`, `content_type`, `content_id`, `is_completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 3, 10, 'lecture', 55, 1, '2025-12-26 07:18:53', '2025-12-26 07:18:53', '2025-12-26 07:18:53'),
(2, 3, 10, 'lecture', 56, 1, '2025-12-26 07:19:02', '2025-12-26 07:19:02', '2025-12-26 07:19:02'),
(3, 3, 10, 'material', 26, 1, '2025-12-26 07:19:10', '2025-12-26 07:19:06', '2025-12-26 07:19:10'),
(4, 11, 6, 'lecture', 33, 1, '2025-12-28 23:57:35', '2025-12-28 23:57:15', '2025-12-28 23:57:35'),
(5, 11, 6, 'lecture', 32, 1, '2025-12-28 23:57:31', '2025-12-28 23:57:31', '2025-12-28 23:57:31'),
(6, 11, 6, 'material', 15, 1, '2025-12-28 23:57:39', '2025-12-28 23:57:39', '2025-12-28 23:57:39'),
(7, 11, 6, 'material', 16, 1, '2025-12-28 23:57:43', '2025-12-28 23:57:41', '2025-12-28 23:57:43'),
(8, 11, 1, 'lecture', 1, 1, '2025-12-29 00:38:01', '2025-12-29 00:38:01', '2025-12-29 00:38:01'),
(9, 11, 1, 'material', 2, 1, '2025-12-29 00:38:13', '2025-12-29 00:38:13', '2025-12-29 00:38:13'),
(10, 11, 1, 'material', 1, 1, '2025-12-29 00:38:14', '2025-12-29 00:38:14', '2025-12-29 00:38:14'),
(11, 11, 1, 'material', 3, 1, '2025-12-29 00:39:14', '2025-12-29 00:39:14', '2025-12-29 00:39:14'),
(12, 22, 17, 'lecture', 97, 1, '2025-12-29 05:11:28', '2025-12-29 05:11:28', '2025-12-29 05:11:28'),
(13, 22, 17, 'lecture', 98, 1, '2025-12-29 05:11:33', '2025-12-29 05:11:33', '2025-12-29 05:11:33'),
(14, 22, 17, 'lecture', 99, 1, '2025-12-29 05:11:42', '2025-12-29 05:11:42', '2025-12-29 05:11:42'),
(15, 22, 17, 'material', 47, 1, '2025-12-29 12:32:43', '2025-12-29 05:11:54', '2025-12-29 12:32:43'),
(16, 22, 17, 'material', 48, 1, '2025-12-29 05:11:58', '2025-12-29 05:11:57', '2025-12-29 05:11:58'),
(17, 22, 17, 'lecture', 100, 1, '2025-12-29 05:12:02', '2025-12-29 05:12:02', '2025-12-29 05:12:02'),
(18, 22, 17, 'lecture', 101, 1, '2025-12-29 05:12:05', '2025-12-29 05:12:05', '2025-12-29 05:12:05'),
(19, 22, 17, 'lecture', 102, 1, '2025-12-29 05:12:08', '2025-12-29 05:12:08', '2025-12-29 05:12:08'),
(20, 12, 1, 'lecture', 1, 1, '2025-12-29 13:46:21', '2025-12-29 13:46:21', '2025-12-29 13:46:21'),
(21, 12, 8, 'lecture', 43, 1, '2025-12-30 01:34:43', '2025-12-30 01:34:43', '2025-12-30 01:34:43'),
(22, 12, 8, 'lecture', 44, 1, '2025-12-30 01:35:14', '2025-12-30 01:35:14', '2025-12-30 01:35:14'),
(23, 12, 8, 'lecture', 45, 1, '2025-12-30 01:35:20', '2025-12-30 01:35:20', '2025-12-30 01:35:20'),
(24, 12, 8, 'material', 1, 1, '2025-12-30 01:37:42', '2025-12-30 01:35:59', '2025-12-30 01:37:42'),
(25, 12, 8, 'material', 2, 1, '2025-12-30 01:37:46', '2025-12-30 01:37:44', '2025-12-30 01:37:46'),
(26, 12, 8, 'lecture', 4, 1, '2025-12-30 01:37:56', '2025-12-30 01:37:57', '2025-12-30 01:37:57'),
(27, 12, 8, 'lecture', 5, 1, '2025-12-30 01:38:15', '2025-12-30 01:38:15', '2025-12-30 01:38:15'),
(28, 12, 8, 'lecture', 6, 1, '2025-12-30 01:38:23', '2025-12-30 01:38:23', '2025-12-30 01:38:23'),
(29, 12, 8, 'material', 3, 1, '2025-12-30 01:38:39', '2025-12-30 01:38:26', '2025-12-30 01:38:39'),
(30, 12, 8, 'lecture', 3, 1, '2025-12-30 01:39:07', '2025-12-30 01:39:01', '2025-12-30 01:39:07'),
(31, 12, 1, 'lecture', 2, 1, '2025-12-30 01:44:31', '2025-12-30 01:44:31', '2025-12-30 01:44:31'),
(32, 15, 7, 'lecture', 37, 1, '2025-12-30 02:01:13', '2025-12-30 02:01:13', '2025-12-30 02:01:13'),
(33, 15, 7, 'lecture', 38, 1, '2025-12-30 02:02:24', '2025-12-30 02:02:04', '2025-12-30 02:02:24'),
(34, 15, 7, 'lecture', 39, 1, '2025-12-30 02:17:25', '2025-12-30 02:17:25', '2025-12-30 02:17:25'),
(35, 15, 7, 'material', 19, 1, '2025-12-30 02:21:45', '2025-12-30 02:17:28', '2025-12-30 02:21:45'),
(36, 15, 7, 'material', 20, 1, '2025-12-30 02:21:46', '2025-12-30 02:17:36', '2025-12-30 02:21:46'),
(37, 15, 7, 'material', 21, 1, '2025-12-30 02:22:08', '2025-12-30 02:17:45', '2025-12-30 02:22:08'),
(38, 15, 7, 'lecture', 42, 1, '2025-12-30 02:18:44', '2025-12-30 02:18:44', '2025-12-30 02:18:44'),
(39, 15, 7, 'lecture', 41, 1, '2025-12-30 02:18:48', '2025-12-30 02:18:48', '2025-12-30 02:18:48'),
(40, 15, 7, 'lecture', 40, 1, '2025-12-30 02:18:52', '2025-12-30 02:18:52', '2025-12-30 02:18:52'),
(41, 12, 6, 'lecture', 32, 1, '2025-12-30 03:13:47', '2025-12-30 03:13:43', '2025-12-30 03:13:47'),
(42, 12, 6, 'material', 17, 1, '2025-12-30 03:14:06', '2025-12-30 03:13:53', '2025-12-30 03:14:06'),
(43, 12, 6, 'material', 18, 1, '2025-12-30 03:14:08', '2025-12-30 03:13:56', '2025-12-30 03:14:08'),
(44, 12, 6, 'lecture', 35, 1, '2025-12-30 03:18:30', '2025-12-30 03:18:30', '2025-12-30 03:18:30'),
(45, 12, 6, 'lecture', 34, 1, '2025-12-30 03:19:03', '2025-12-30 03:19:03', '2025-12-30 03:19:03'),
(46, 12, 6, 'lecture', 36, 1, '2025-12-30 03:19:12', '2025-12-30 03:19:12', '2025-12-30 03:19:12'),
(47, 12, 6, 'lecture', 31, 1, '2025-12-30 03:19:23', '2025-12-30 03:19:23', '2025-12-30 03:19:23'),
(48, 12, 6, 'lecture', 33, 1, '2025-12-30 03:19:35', '2025-12-30 03:19:35', '2025-12-30 03:19:35'),
(49, 12, 6, 'material', 16, 1, '2025-12-30 03:20:30', '2025-12-30 03:20:30', '2025-12-30 03:20:30'),
(50, 12, 8, 'material', 22, 1, '2025-12-30 03:56:46', '2025-12-30 03:56:46', '2025-12-30 03:56:46'),
(51, 12, 8, 'material', 23, 1, '2025-12-30 03:56:55', '2025-12-30 03:56:55', '2025-12-30 03:56:55'),
(52, 12, 8, 'material', 24, 1, '2025-12-30 03:56:59', '2025-12-30 03:56:59', '2025-12-30 03:56:59'),
(53, 12, 8, 'lecture', 48, 1, '2025-12-30 03:57:06', '2025-12-30 03:57:06', '2025-12-30 03:57:06'),
(54, 12, 8, 'lecture', 47, 1, '2025-12-30 03:57:15', '2025-12-30 03:57:15', '2025-12-30 03:57:15'),
(55, 18, 11, 'lecture', 61, 1, '2025-12-30 04:16:07', '2025-12-30 04:16:07', '2025-12-30 04:16:07'),
(56, 18, 11, 'lecture', 62, 1, '2025-12-30 04:18:42', '2025-12-30 04:18:42', '2025-12-30 04:18:42'),
(57, 18, 11, 'lecture', 63, 1, '2025-12-30 04:18:55', '2025-12-30 04:18:55', '2025-12-30 04:18:55'),
(58, 18, 11, 'material', 32, 1, '2025-12-30 04:18:58', '2025-12-30 04:18:58', '2025-12-30 04:18:58'),
(59, 18, 11, 'material', 31, 1, '2025-12-30 04:58:47', '2025-12-30 04:19:08', '2025-12-30 04:58:47'),
(60, 18, 23, 'lecture', 133, 1, '2025-12-30 04:20:29', '2025-12-30 04:20:29', '2025-12-30 04:20:29'),
(61, 18, 23, 'lecture', 134, 1, '2025-12-30 04:20:40', '2025-12-30 04:20:40', '2025-12-30 04:20:40'),
(62, 18, 23, 'lecture', 135, 1, '2025-12-30 04:20:52', '2025-12-30 04:20:52', '2025-12-30 04:20:52'),
(63, 18, 23, 'material', 62, 1, '2025-12-30 04:21:27', '2025-12-30 04:21:27', '2025-12-30 04:21:27'),
(64, 18, 23, 'lecture', 137, 1, '2025-12-30 04:21:41', '2025-12-30 04:21:41', '2025-12-30 04:21:41'),
(65, 18, 23, 'lecture', 138, 1, '2025-12-30 04:21:58', '2025-12-30 04:21:58', '2025-12-30 04:21:58'),
(66, 18, 23, 'lecture', 136, 1, '2025-12-30 04:22:06', '2025-12-30 04:22:06', '2025-12-30 04:22:06'),
(67, 18, 23, 'material', 63, 1, '2025-12-30 04:22:11', '2025-12-30 04:22:11', '2025-12-30 04:22:11'),
(68, 18, 18, 'lecture', 103, 1, '2025-12-30 05:14:24', '2025-12-30 05:14:24', '2025-12-30 05:14:24'),
(69, 18, 18, 'material', 50, 1, '2025-12-30 05:14:36', '2025-12-30 05:14:36', '2025-12-30 05:14:36'),
(70, 18, 18, 'material', 51, 1, '2025-12-30 05:14:47', '2025-12-30 05:14:44', '2025-12-30 05:14:47'),
(71, 18, 23, 'material', 64, 1, '2025-12-30 05:15:58', '2025-12-30 05:15:55', '2025-12-30 05:15:58'),
(72, 18, 18, 'material', 49, 1, '2025-12-30 05:22:53', '2025-12-30 05:22:53', '2025-12-30 05:22:53'),
(73, 18, 23, 'quiz', 26, 1, '2025-12-30 05:55:10', '2025-12-30 05:55:10', '2025-12-30 05:55:10'),
(74, 18, 11, 'lecture', 66, 1, '2025-12-30 06:07:36', '2025-12-30 06:07:36', '2025-12-30 06:07:36'),
(75, 18, 11, 'lecture', 65, 1, '2025-12-30 06:07:50', '2025-12-30 06:07:50', '2025-12-30 06:07:50'),
(76, 17, 14, 'lecture', 79, 1, '2025-12-31 04:51:44', '2025-12-31 04:51:44', '2025-12-31 04:51:44'),
(77, 17, 14, 'lecture', 80, 1, '2025-12-31 04:51:58', '2025-12-31 04:51:58', '2025-12-31 04:51:58'),
(78, 17, 14, 'lecture', 81, 1, '2025-12-31 04:52:02', '2025-12-31 04:52:02', '2025-12-31 04:52:02'),
(79, 17, 14, 'material', 38, 1, '2025-12-31 04:52:16', '2025-12-31 04:52:16', '2025-12-31 04:52:16'),
(80, 17, 14, 'material', 39, 1, '2025-12-31 04:52:20', '2025-12-31 04:52:20', '2025-12-31 04:52:20'),
(81, 17, 14, 'material', 40, 1, '2025-12-31 04:52:23', '2025-12-31 04:52:23', '2025-12-31 04:52:23'),
(82, 17, 14, 'lecture', 82, 1, '2025-12-31 04:52:31', '2025-12-31 04:52:31', '2025-12-31 04:52:31'),
(83, 17, 14, 'lecture', 83, 1, '2025-12-31 04:52:36', '2025-12-31 04:52:36', '2025-12-31 04:52:36'),
(84, 17, 14, 'lecture', 84, 1, '2025-12-31 04:52:40', '2025-12-31 04:52:40', '2025-12-31 04:52:40'),
(85, 17, 9, 'lecture', 49, 1, '2026-01-01 02:51:26', '2026-01-01 02:51:26', '2026-01-01 02:51:26'),
(86, 17, 9, 'lecture', 50, 1, '2026-01-01 02:51:32', '2026-01-01 02:51:32', '2026-01-01 02:51:32'),
(87, 17, 9, 'lecture', 51, 1, '2026-01-01 02:51:36', '2026-01-01 02:51:36', '2026-01-01 02:51:36'),
(88, 17, 9, 'material', 25, 1, '2026-01-01 02:51:42', '2026-01-01 02:51:42', '2026-01-01 02:51:42'),
(89, 17, 9, 'material', 26, 1, '2026-01-01 02:51:45', '2026-01-01 02:51:45', '2026-01-01 02:51:45'),
(90, 17, 9, 'material', 27, 1, '2026-01-01 02:51:48', '2026-01-01 02:51:48', '2026-01-01 02:51:48'),
(91, 17, 9, 'lecture', 52, 1, '2026-01-01 02:51:56', '2026-01-01 02:51:56', '2026-01-01 02:51:56'),
(92, 17, 9, 'lecture', 53, 1, '2026-01-01 02:52:00', '2026-01-01 02:52:00', '2026-01-01 02:52:00'),
(93, 17, 9, 'lecture', 54, 1, '2026-01-01 02:52:03', '2026-01-01 02:52:03', '2026-01-01 02:52:03'),
(94, 17, 12, 'lecture', 67, 1, '2026-01-01 05:18:13', '2026-01-01 05:18:13', '2026-01-01 05:18:13'),
(95, 24, 11, 'lecture', 61, 1, '2026-01-02 00:06:19', '2026-01-01 22:53:07', '2026-01-02 00:06:19'),
(96, 24, 11, 'lecture', 62, 1, '2026-01-01 22:54:13', '2026-01-01 22:54:13', '2026-01-01 22:54:13'),
(97, 24, 11, 'lecture', 63, 1, '2026-01-01 22:54:51', '2026-01-01 22:54:41', '2026-01-01 22:54:51'),
(98, 24, 11, 'material', 31, 1, '2026-01-01 22:55:18', '2026-01-01 22:55:18', '2026-01-01 22:55:18'),
(99, 24, 11, 'material', 32, 1, '2026-01-01 22:55:35', '2026-01-01 22:55:35', '2026-01-01 22:55:35'),
(100, 24, 11, 'lecture', 64, 1, '2026-01-01 22:56:04', '2026-01-01 22:55:53', '2026-01-01 22:56:04'),
(101, 24, 11, 'lecture', 66, 1, '2026-01-01 22:57:22', '2026-01-01 22:57:01', '2026-01-01 22:57:22'),
(102, 24, 11, 'lecture', 65, 1, '2026-01-01 23:04:00', '2026-01-01 23:04:00', '2026-01-01 23:04:00'),
(103, 24, 11, 'quiz', 13, 1, '2026-01-01 23:04:30', '2026-01-01 23:04:30', '2026-01-01 23:04:30'),
(104, 24, 11, 'quiz', 12, 1, '2026-01-01 23:08:45', '2026-01-01 23:08:45', '2026-01-01 23:08:45'),
(105, 24, 10, 'lecture', 55, 1, '2026-01-02 00:21:41', '2026-01-02 00:21:41', '2026-01-02 00:21:41'),
(106, 24, 10, 'lecture', 56, 1, '2026-01-02 00:22:21', '2026-01-02 00:22:21', '2026-01-02 00:22:21'),
(107, 24, 2, 'lecture', 7, 1, '2026-01-02 01:12:35', '2026-01-02 00:31:55', '2026-01-02 01:12:35'),
(108, 24, 2, 'lecture', 8, 1, '2026-01-02 00:32:57', '2026-01-02 00:32:57', '2026-01-02 00:32:57'),
(109, 24, 2, 'lecture', 9, 1, '2026-01-02 00:33:05', '2026-01-02 00:33:05', '2026-01-02 00:33:05'),
(110, 24, 2, 'material', 4, 1, '2026-01-02 00:33:36', '2026-01-02 00:33:36', '2026-01-02 00:33:36'),
(111, 24, 2, 'material', 5, 1, '2026-01-02 00:33:40', '2026-01-02 00:33:40', '2026-01-02 00:33:40'),
(112, 24, 2, 'material', 6, 1, '2026-01-02 00:33:44', '2026-01-02 00:33:44', '2026-01-02 00:33:44'),
(113, 24, 2, 'lecture', 12, 1, '2026-01-02 00:33:51', '2026-01-02 00:33:51', '2026-01-02 00:33:51'),
(114, 24, 2, 'lecture', 11, 1, '2026-01-02 00:33:58', '2026-01-02 00:33:58', '2026-01-02 00:33:58'),
(115, 24, 2, 'lecture', 10, 1, '2026-01-02 00:34:09', '2026-01-02 00:34:09', '2026-01-02 00:34:09'),
(116, 24, 2, 'quiz', 2, 1, '2026-01-02 00:43:32', '2026-01-02 00:43:32', '2026-01-02 00:43:32'),
(117, 24, 10, 'lecture', 57, 1, '2026-01-02 01:00:08', '2026-01-02 01:00:08', '2026-01-02 01:00:08'),
(118, 24, 10, 'material', 28, 1, '2026-01-02 01:07:13', '2026-01-02 01:07:13', '2026-01-02 01:07:13'),
(119, 24, 10, 'material', 29, 1, '2026-01-02 01:07:21', '2026-01-02 01:07:20', '2026-01-02 01:07:21'),
(120, 24, 10, 'material', 30, 1, '2026-01-02 01:07:30', '2026-01-02 01:07:30', '2026-01-02 01:07:30'),
(121, 25, 1, 'lecture', 1, 1, '2026-01-02 02:09:57', '2026-01-02 02:09:57', '2026-01-02 02:09:57'),
(122, 25, 1, 'lecture', 2, 1, '2026-01-02 02:10:12', '2026-01-02 02:10:12', '2026-01-02 02:10:12'),
(123, 25, 1, 'lecture', 3, 1, '2026-01-02 02:10:29', '2026-01-02 02:10:29', '2026-01-02 02:10:29'),
(124, 25, 1, 'quiz', 1, 1, '2026-01-02 02:10:44', '2026-01-02 02:10:44', '2026-01-02 02:10:44'),
(125, 25, 1, 'material', 1, 1, '2026-01-02 02:10:58', '2026-01-02 02:10:58', '2026-01-02 02:10:58'),
(126, 25, 1, 'material', 2, 1, '2026-01-02 02:11:03', '2026-01-02 02:11:03', '2026-01-02 02:11:03'),
(127, 25, 1, 'lecture', 4, 1, '2026-01-02 02:11:11', '2026-01-02 02:11:11', '2026-01-02 02:11:11'),
(128, 25, 1, 'lecture', 5, 1, '2026-01-02 02:11:17', '2026-01-02 02:11:17', '2026-01-02 02:11:17'),
(129, 25, 1, 'lecture', 6, 1, '2026-01-02 02:11:23', '2026-01-02 02:11:23', '2026-01-02 02:11:23'),
(130, 25, 1, 'material', 3, 1, '2026-01-02 02:11:28', '2026-01-02 02:11:28', '2026-01-02 02:11:28'),
(131, 26, 22, 'lecture', 127, 1, '2026-01-02 04:19:07', '2026-01-02 04:19:07', '2026-01-02 04:19:07'),
(132, 26, 22, 'lecture', 128, 1, '2026-01-02 04:19:23', '2026-01-02 04:19:18', '2026-01-02 04:19:23'),
(133, 26, 22, 'lecture', 129, 1, '2026-01-02 04:19:39', '2026-01-02 04:19:39', '2026-01-02 04:19:39'),
(134, 26, 22, 'material', 60, 1, '2026-01-02 04:19:58', '2026-01-02 04:19:59', '2026-01-02 04:19:59'),
(135, 26, 22, 'material', 61, 1, '2026-01-02 04:20:02', '2026-01-02 04:20:02', '2026-01-02 04:20:02'),
(136, 26, 22, 'lecture', 130, 1, '2026-01-02 04:20:08', '2026-01-02 04:20:08', '2026-01-02 04:20:08'),
(137, 26, 22, 'lecture', 131, 1, '2026-01-02 04:20:14', '2026-01-02 04:20:14', '2026-01-02 04:20:14'),
(138, 26, 22, 'lecture', 132, 1, '2026-01-02 04:20:20', '2026-01-02 04:20:20', '2026-01-02 04:20:20'),
(139, 26, 22, 'quiz', 25, 1, '2026-01-02 04:23:31', '2026-01-02 04:23:31', '2026-01-02 04:23:31'),
(140, 18, 25, 'lecture', 145, 1, '2026-01-02 06:02:56', '2026-01-02 06:02:56', '2026-01-02 06:02:56'),
(141, 18, 25, 'lecture', 146, 1, '2026-01-02 06:03:02', '2026-01-02 06:03:02', '2026-01-02 06:03:02'),
(142, 18, 25, 'lecture', 147, 1, '2026-01-02 06:03:10', '2026-01-02 06:03:10', '2026-01-02 06:03:10'),
(143, 18, 25, 'quiz', 28, 1, '2026-01-02 06:41:48', '2026-01-02 06:06:01', '2026-01-02 06:41:48'),
(144, 18, 25, 'material', 68, 1, '2026-01-02 06:09:05', '2026-01-02 06:09:05', '2026-01-02 06:09:05'),
(145, 18, 25, 'material', 69, 1, '2026-01-02 06:09:09', '2026-01-02 06:09:09', '2026-01-02 06:09:09'),
(146, 18, 20, 'quiz', 23, 1, '2026-01-02 07:14:50', '2026-01-02 07:14:50', '2026-01-02 07:14:50'),
(147, 12, 15, 'material', 41, 1, '2026-01-05 00:42:41', '2026-01-05 00:42:41', '2026-01-05 00:42:41'),
(148, 12, 15, 'lecture', 85, 1, '2026-01-05 00:45:41', '2026-01-05 00:45:41', '2026-01-05 00:45:41'),
(149, 12, 15, 'material', 42, 1, '2026-01-05 00:45:47', '2026-01-05 00:45:47', '2026-01-05 00:45:47'),
(150, 12, 15, 'lecture', 86, 1, '2026-01-05 00:45:54', '2026-01-05 00:45:54', '2026-01-05 00:45:54'),
(151, 12, 15, 'lecture', 87, 1, '2026-01-05 00:46:00', '2026-01-05 00:46:00', '2026-01-05 00:46:00');

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

--
-- Dumping data for table `course_questions`
--

INSERT INTO `course_questions` (`id`, `course_id`, `user_id`, `lecture_id`, `parent_id`, `question`, `is_instructor_reply`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 4, NULL, 'I\'m having trouble understanding the core concepts of Cyber Security. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-19 00:20:28', '2025-12-17 00:20:28'),
(2, 1, 5, 4, 1, 'Great question! The fundamentals of Cyber Security are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-22 00:20:28', '2025-12-15 00:20:28'),
(3, 1, 11, 6, NULL, 'Are there any prerequisites I should know before diving deep into Cyber Security?', 0, '2025-12-23 00:20:28', '2025-12-22 00:20:28'),
(4, 1, 5, 6, 3, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-26 00:20:28', '2025-12-23 00:20:28'),
(5, 1, 16, 6, NULL, 'Can you recommend any additional resources or projects to practice Cyber Security?', 0, '2025-12-15 00:20:28', '2025-12-22 00:20:28'),
(6, 1, 5, 6, 5, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Cyber Security can be very beneficial for learning and networking.', 1, '2025-12-27 00:20:28', '2025-12-15 00:20:28'),
(7, 2, 11, 7, NULL, 'Are there any prerequisites I should know before diving deep into Kotlin?', 0, '2025-12-16 00:20:28', '2025-12-18 00:20:28'),
(8, 2, 5, 7, 7, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Mobile Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-22 00:20:28', '2025-12-24 00:20:28'),
(9, 2, 17, 9, NULL, 'How long will it take to master Kotlin with this course?', 0, '2025-12-14 00:20:28', '2025-12-18 00:20:28'),
(10, 2, 5, 9, 9, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-20 00:20:28', '2025-12-22 00:20:28'),
(11, 2, 16, 10, NULL, 'Can you recommend any additional resources or projects to practice Kotlin?', 0, '2025-12-17 00:20:28', '2025-12-22 00:20:28'),
(12, 2, 5, 10, 11, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Kotlin can be very beneficial for learning and networking.', 1, '2025-12-22 00:20:28', '2025-12-18 00:20:28'),
(13, 3, 18, 15, NULL, 'I\'m having trouble understanding the core concepts of Kotlin. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-21 00:20:28', '2025-12-21 00:20:28'),
(14, 3, 5, 15, 13, 'Great question! The fundamentals of Kotlin are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-29 00:20:28', '2025-12-28 00:20:28'),
(15, 3, 17, 15, NULL, 'Are there any prerequisites I should know before diving deep into Kotlin?', 0, '2025-12-14 00:20:28', '2025-12-28 00:20:28'),
(16, 3, 5, 15, 15, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Mobile Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-20 00:20:28', '2025-12-17 00:20:28'),
(17, 3, 16, 17, NULL, 'How long will it take to master Kotlin with this course?', 0, '2025-12-27 00:20:28', '2025-12-18 00:20:28'),
(18, 3, 5, 17, 17, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-19 00:20:28', '2025-12-19 00:20:28'),
(19, 3, 19, 17, NULL, 'Can you recommend any additional resources or projects to practice Kotlin?', 0, '2025-12-17 00:20:28', '2025-12-14 00:20:28'),
(20, 3, 5, 17, 19, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Kotlin can be very beneficial for learning and networking.', 1, '2025-12-24 00:20:28', '2025-12-17 00:20:28'),
(21, 4, 16, 19, NULL, 'I\'m having trouble understanding the core concepts of Data Science. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-22 00:20:28', '2025-12-27 00:20:28'),
(22, 4, 5, 19, 21, 'Great question! The fundamentals of Data Science are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-25 00:20:28', '2025-12-19 00:20:28'),
(23, 4, 12, 24, NULL, 'What are the best practices for implementing Data Science in real-world projects?', 0, '2025-12-26 00:20:28', '2025-12-23 00:20:28'),
(24, 4, 5, 24, 23, 'Excellent question! When implementing Data Science in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-18 00:20:28', '2025-12-27 00:20:28'),
(25, 4, 14, 22, NULL, 'Are there any prerequisites I should know before diving deep into Data Science?', 0, '2025-12-20 00:20:28', '2025-12-17 00:20:28'),
(26, 4, 5, 22, 25, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-18 00:20:28', '2025-12-22 00:20:28'),
(27, 5, 12, 26, NULL, 'What are the best practices for implementing Swift in real-world projects?', 0, '2025-12-27 00:20:28', '2025-12-17 00:20:28'),
(28, 5, 5, 26, 27, 'Excellent question! When implementing Swift in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-17 00:20:28', '2025-12-28 00:20:28'),
(29, 5, 14, 25, NULL, 'Are there any prerequisites I should know before diving deep into Swift?', 0, '2025-12-24 00:20:28', '2025-12-14 00:20:28'),
(30, 5, 5, 25, 29, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Mobile Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-17 00:20:28', '2025-12-20 00:20:28'),
(31, 5, 15, 29, NULL, 'Can you recommend any additional resources or projects to practice Swift?', 0, '2025-12-24 00:20:28', '2025-12-14 00:20:28'),
(32, 5, 5, 29, 31, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Swift can be very beneficial for learning and networking.', 1, '2025-12-17 00:20:28', '2025-12-17 00:20:28'),
(33, 6, 11, 36, NULL, 'I\'m having trouble understanding the core concepts of Swift. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-22 00:20:28', '2025-12-27 00:20:28'),
(34, 6, 6, 36, 33, 'Great question! The fundamentals of Swift are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-22 00:20:28', '2025-12-16 00:20:28'),
(35, 6, 11, 31, NULL, 'What are the best practices for implementing Swift in real-world projects?', 0, '2025-12-27 00:20:28', '2025-12-14 00:20:28'),
(36, 6, 6, 31, 35, 'Excellent question! When implementing Swift in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-18 00:20:28', '2025-12-19 00:20:28'),
(37, 6, 17, 33, NULL, 'Are there any prerequisites I should know before diving deep into Swift?', 0, '2025-12-26 00:20:28', '2025-12-22 00:20:28'),
(38, 6, 6, 33, 37, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Mobile Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-16 00:20:28', '2025-12-16 00:20:28'),
(39, 6, 15, 33, NULL, 'How long will it take to master Swift with this course?', 0, '2025-12-25 00:20:28', '2025-12-16 00:20:28'),
(40, 6, 6, 33, 39, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-19 00:20:28', '2025-12-23 00:20:28'),
(41, 7, 14, 40, NULL, 'I\'m having trouble understanding the core concepts of Finance. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-19 00:20:28', '2025-12-17 00:20:28'),
(42, 7, 6, 40, 41, 'Great question! The fundamentals of Finance are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-18 00:20:28', '2025-12-18 00:20:28'),
(43, 7, 12, 42, NULL, 'What are the best practices for implementing Finance in real-world projects?', 0, '2025-12-24 00:20:28', '2025-12-15 00:20:28'),
(44, 7, 6, 42, 43, 'Excellent question! When implementing Finance in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-24 00:20:28', '2025-12-20 00:20:28'),
(45, 7, 10, 37, NULL, 'Can you recommend any additional resources or projects to practice Finance?', 0, '2025-12-16 00:20:28', '2025-12-14 00:20:28'),
(46, 7, 6, 37, 45, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Finance can be very beneficial for learning and networking.', 1, '2025-12-24 00:20:28', '2025-12-22 00:20:28'),
(47, 8, 14, 45, NULL, 'What are the best practices for implementing Cyber Security in real-world projects?', 0, '2025-12-19 00:20:28', '2025-12-23 00:20:28'),
(48, 8, 6, 45, 47, 'Excellent question! When implementing Cyber Security in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-19 00:20:28', '2025-12-20 00:20:28'),
(49, 8, 12, 44, NULL, 'Are there any prerequisites I should know before diving deep into Cyber Security?', 0, '2025-12-28 00:20:28', '2025-12-16 00:20:28'),
(50, 8, 6, 44, 49, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-22 00:20:28', '2025-12-28 00:20:28'),
(51, 8, 19, 43, NULL, 'How long will it take to master Cyber Security with this course?', 0, '2025-12-17 00:20:28', '2025-12-21 00:20:28'),
(52, 8, 6, 43, 51, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-26 00:20:28', '2025-12-19 00:20:28'),
(53, 8, 16, 44, NULL, 'Can you recommend any additional resources or projects to practice Cyber Security?', 0, '2025-12-17 00:20:28', '2025-12-23 00:20:28'),
(54, 8, 6, 44, 53, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Cyber Security can be very beneficial for learning and networking.', 1, '2025-12-29 00:20:28', '2025-12-24 00:20:28'),
(55, 9, 14, 52, NULL, 'I\'m having trouble understanding the core concepts of Marketing. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-24 00:20:28', '2025-12-20 00:20:28'),
(56, 9, 6, 52, 55, 'Great question! The fundamentals of Marketing are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-26 00:20:28', '2025-12-18 00:20:28'),
(57, 9, 17, 49, NULL, 'What are the best practices for implementing Marketing in real-world projects?', 0, '2025-12-25 00:20:28', '2025-12-17 00:20:28'),
(58, 9, 6, 49, 57, 'Excellent question! When implementing Marketing in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-24 00:20:28', '2025-12-26 00:20:28'),
(59, 9, 16, 49, NULL, 'Are there any prerequisites I should know before diving deep into Marketing?', 0, '2025-12-20 00:20:28', '2025-12-18 00:20:28'),
(60, 9, 6, 49, 59, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Business will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-17 00:20:28', '2025-12-20 00:20:28'),
(61, 9, 19, 54, NULL, 'Can you recommend any additional resources or projects to practice Marketing?', 0, '2025-12-19 00:20:28', '2025-12-25 00:20:28'),
(62, 9, 6, 54, 61, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Marketing can be very beneficial for learning and networking.', 1, '2025-12-29 00:20:28', '2025-12-25 00:20:28'),
(63, 10, 17, 60, NULL, 'I\'m having trouble understanding the core concepts of Cyber Security. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-28 00:20:28', '2025-12-14 00:20:28'),
(64, 10, 6, 60, 63, 'Great question! The fundamentals of Cyber Security are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-24 00:20:28', '2025-12-18 00:20:28'),
(65, 10, 12, 58, NULL, 'Are there any prerequisites I should know before diving deep into Cyber Security?', 0, '2025-12-19 00:20:28', '2025-12-15 00:20:28'),
(66, 10, 6, 58, 65, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-15 00:20:28', '2025-12-23 00:20:28'),
(67, 10, 13, 58, NULL, 'How long will it take to master Cyber Security with this course?', 0, '2025-12-26 00:20:28', '2025-12-25 00:20:28'),
(68, 10, 6, 58, 67, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-21 00:20:28', '2025-12-26 00:20:28'),
(69, 10, 17, 56, NULL, 'Can you recommend any additional resources or projects to practice Cyber Security?', 0, '2025-12-24 00:20:29', '2025-12-26 00:20:29'),
(70, 10, 6, 56, 69, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Cyber Security can be very beneficial for learning and networking.', 1, '2025-12-18 00:20:29', '2025-12-22 00:20:29'),
(71, 11, 16, 64, NULL, 'I\'m having trouble understanding the core concepts of React Native. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-17 00:20:29', '2025-12-15 00:20:29'),
(72, 11, 7, 64, 71, 'Great question! The fundamentals of React Native are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-18 00:20:29', '2025-12-23 00:20:29'),
(73, 11, 10, 63, NULL, 'What are the best practices for implementing React Native in real-world projects?', 0, '2025-12-20 00:20:29', '2025-12-26 00:20:29'),
(74, 11, 7, 63, 73, 'Excellent question! When implementing React Native in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-15 00:20:29', '2025-12-25 00:20:29'),
(75, 11, 10, 65, NULL, 'How long will it take to master React Native with this course?', 0, '2025-12-26 00:20:29', '2025-12-17 00:20:29'),
(76, 11, 7, 65, 75, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-16 00:20:29', '2025-12-20 00:20:29'),
(77, 12, 11, 71, NULL, 'I\'m having trouble understanding the core concepts of Marketing. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-28 00:20:29', '2025-12-19 00:20:29'),
(78, 12, 7, 71, 77, 'Great question! The fundamentals of Marketing are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-16 00:20:29', '2025-12-25 00:20:29'),
(79, 12, 10, 72, NULL, 'Are there any prerequisites I should know before diving deep into Marketing?', 0, '2025-12-18 00:20:29', '2025-12-18 00:20:29'),
(80, 12, 7, 72, 79, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Business will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-16 00:20:29', '2025-12-29 00:20:29'),
(81, 12, 11, 70, NULL, 'How long will it take to master Marketing with this course?', 0, '2025-12-18 00:20:29', '2025-12-27 00:20:29'),
(82, 12, 7, 70, 81, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-26 00:20:29', '2025-12-24 00:20:29'),
(83, 13, 12, 76, NULL, 'I\'m having trouble understanding the core concepts of Graphic Design. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-23 00:20:29', '2025-12-16 00:20:29'),
(84, 13, 7, 76, 83, 'Great question! The fundamentals of Graphic Design are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-26 00:20:29', '2025-12-20 00:20:29'),
(85, 13, 13, 74, NULL, 'What are the best practices for implementing Graphic Design in real-world projects?', 0, '2025-12-25 00:20:29', '2025-12-20 00:20:29'),
(86, 13, 7, 74, 85, 'Excellent question! When implementing Graphic Design in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-26 00:20:29', '2025-12-18 00:20:29'),
(87, 13, 10, 76, NULL, 'Can you recommend any additional resources or projects to practice Graphic Design?', 0, '2025-12-27 00:20:29', '2025-12-25 00:20:29'),
(88, 13, 7, 76, 87, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Graphic Design can be very beneficial for learning and networking.', 1, '2025-12-24 00:20:29', '2025-12-28 00:20:29'),
(89, 14, 16, 80, NULL, 'I\'m having trouble understanding the core concepts of Entrepreneurship. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-19 00:20:29', '2025-12-28 00:20:29'),
(90, 14, 7, 80, 89, 'Great question! The fundamentals of Entrepreneurship are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-17 00:20:29', '2025-12-28 00:20:29'),
(91, 14, 18, 81, NULL, 'Are there any prerequisites I should know before diving deep into Entrepreneurship?', 0, '2025-12-17 00:20:29', '2025-12-23 00:20:29'),
(92, 14, 7, 81, 91, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Business will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-26 00:20:29', '2025-12-20 00:20:29'),
(93, 14, 14, 83, NULL, 'How long will it take to master Entrepreneurship with this course?', 0, '2025-12-25 00:20:29', '2025-12-19 00:20:29'),
(94, 14, 7, 83, 93, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-21 00:20:29', '2025-12-27 00:20:29'),
(95, 14, 15, 84, NULL, 'Can you recommend any additional resources or projects to practice Entrepreneurship?', 0, '2025-12-22 00:20:29', '2025-12-26 00:20:29'),
(96, 14, 7, 84, 95, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Entrepreneurship can be very beneficial for learning and networking.', 1, '2025-12-17 00:20:29', '2025-12-16 00:20:29'),
(97, 15, 18, 87, NULL, 'I\'m having trouble understanding the core concepts of Figma. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-18 00:20:29', '2025-12-14 00:20:29'),
(98, 15, 7, 87, 97, 'Great question! The fundamentals of Figma are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-20 00:20:29', '2025-12-15 00:20:29'),
(99, 15, 14, 88, NULL, 'What are the best practices for implementing Figma in real-world projects?', 0, '2025-12-18 00:20:29', '2025-12-18 00:20:29'),
(100, 15, 7, 88, 99, 'Excellent question! When implementing Figma in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-16 00:20:29', '2025-12-17 00:20:29'),
(101, 15, 19, 85, NULL, 'Can you recommend any additional resources or projects to practice Figma?', 0, '2025-12-18 00:20:29', '2025-12-14 00:20:29'),
(102, 15, 7, 85, 101, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Figma can be very beneficial for learning and networking.', 1, '2025-12-25 00:20:29', '2025-12-26 00:20:29'),
(103, 16, 11, 93, NULL, 'I\'m having trouble understanding the core concepts of Kotlin. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-25 00:20:29', '2025-12-22 00:20:29'),
(104, 16, 8, 93, 103, 'Great question! The fundamentals of Kotlin are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-27 00:20:29', '2025-12-28 00:20:29'),
(105, 16, 14, 92, NULL, 'What are the best practices for implementing Kotlin in real-world projects?', 0, '2025-12-20 00:20:29', '2025-12-19 00:20:29'),
(106, 16, 8, 92, 105, 'Excellent question! When implementing Kotlin in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-20 00:20:29', '2025-12-19 00:20:29'),
(107, 16, 15, 95, NULL, 'How long will it take to master Kotlin with this course?', 0, '2025-12-27 00:20:29', '2025-12-17 00:20:29'),
(108, 16, 8, 95, 107, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-16 00:20:29', '2025-12-19 00:20:29'),
(109, 16, 12, 94, NULL, 'Can you recommend any additional resources or projects to practice Kotlin?', 0, '2025-12-23 00:20:29', '2025-12-27 00:20:29'),
(110, 16, 8, 94, 109, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Kotlin can be very beneficial for learning and networking.', 1, '2025-12-27 00:20:29', '2025-12-17 00:20:29'),
(111, 17, 13, 97, NULL, 'I\'m having trouble understanding the core concepts of Laravel. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-19 00:20:29', '2025-12-17 00:20:29'),
(112, 17, 8, 97, 111, 'Great question! The fundamentals of Laravel are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-18 00:20:29', '2025-12-26 00:20:29'),
(113, 17, 15, 100, NULL, 'What are the best practices for implementing Laravel in real-world projects?', 0, '2025-12-16 00:20:29', '2025-12-16 00:20:29'),
(114, 17, 8, 100, 113, 'Excellent question! When implementing Laravel in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-29 00:20:29', '2025-12-23 00:20:29'),
(115, 17, 15, 100, NULL, 'How long will it take to master Laravel with this course?', 0, '2025-12-14 00:20:29', '2025-12-14 00:20:29'),
(116, 17, 8, 100, 115, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-25 00:20:29', '2025-12-27 00:20:29'),
(117, 18, 16, 105, NULL, 'I\'m having trouble understanding the core concepts of Figma. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-15 00:20:29', '2025-12-17 00:20:29'),
(118, 18, 8, 105, 117, 'Great question! The fundamentals of Figma are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-20 00:20:29', '2025-12-17 00:20:29'),
(119, 18, 17, 108, NULL, 'What are the best practices for implementing Figma in real-world projects?', 0, '2025-12-26 00:20:29', '2025-12-17 00:20:29'),
(120, 18, 8, 108, 119, 'Excellent question! When implementing Figma in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-22 00:20:29', '2025-12-27 00:20:29'),
(121, 18, 11, 106, NULL, 'Are there any prerequisites I should know before diving deep into Figma?', 0, '2025-12-27 00:20:29', '2025-12-24 00:20:29'),
(122, 18, 8, 106, 121, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Design will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-17 00:20:29', '2025-12-15 00:20:29'),
(123, 18, 15, 108, NULL, 'How long will it take to master Figma with this course?', 0, '2025-12-24 00:20:29', '2025-12-27 00:20:29'),
(124, 18, 8, 108, 123, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-24 00:20:29', '2025-12-24 00:20:29'),
(125, 19, 17, 114, NULL, 'What are the best practices for implementing Photoshop in real-world projects?', 0, '2025-12-26 00:20:29', '2025-12-21 00:20:29'),
(126, 19, 8, 114, 125, 'Excellent question! When implementing Photoshop in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-24 00:20:29', '2025-12-25 00:20:29'),
(127, 19, 13, 112, NULL, 'Are there any prerequisites I should know before diving deep into Photoshop?', 0, '2025-12-17 00:20:29', '2025-12-28 00:20:29'),
(128, 19, 8, 112, 127, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Design will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-18 00:20:29', '2025-12-19 00:20:29'),
(129, 19, 10, 110, NULL, 'How long will it take to master Photoshop with this course?', 0, '2025-12-27 00:20:29', '2025-12-16 00:20:29'),
(130, 19, 8, 110, 129, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-23 00:20:29', '2025-12-25 00:20:29'),
(131, 19, 19, 111, NULL, 'Can you recommend any additional resources or projects to practice Photoshop?', 0, '2025-12-26 00:20:29', '2025-12-24 00:20:29'),
(132, 19, 8, 111, 131, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Photoshop can be very beneficial for learning and networking.', 1, '2025-12-26 00:20:29', '2025-12-15 00:20:29'),
(133, 20, 17, 120, NULL, 'What are the best practices for implementing Python in real-world projects?', 0, '2025-12-20 00:20:29', '2025-12-25 00:20:29'),
(134, 20, 8, 120, 133, 'Excellent question! When implementing Python in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-20 00:20:29', '2025-12-29 00:20:29'),
(135, 20, 10, 120, NULL, 'Are there any prerequisites I should know before diving deep into Python?', 0, '2025-12-20 00:20:29', '2025-12-23 00:20:29'),
(136, 20, 8, 120, 135, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-24 00:20:29', '2025-12-15 00:20:29'),
(137, 20, 17, 119, NULL, 'How long will it take to master Python with this course?', 0, '2025-12-26 00:20:29', '2025-12-15 00:20:29'),
(138, 20, 8, 119, 137, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-28 00:20:29', '2025-12-21 00:20:29'),
(139, 20, 12, 118, NULL, 'Can you recommend any additional resources or projects to practice Python?', 0, '2025-12-24 00:20:29', '2025-12-20 00:20:29'),
(140, 20, 8, 118, 139, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Python can be very beneficial for learning and networking.', 1, '2025-12-23 00:20:29', '2025-12-19 00:20:29'),
(141, 21, 15, 124, NULL, 'I\'m having trouble understanding the core concepts of UI/UX. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-17 00:20:29', '2025-12-26 00:20:29'),
(142, 21, 9, 124, 141, 'Great question! The fundamentals of UI/UX are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-23 00:20:29', '2025-12-20 00:20:29'),
(143, 21, 10, 122, NULL, 'Are there any prerequisites I should know before diving deep into UI/UX?', 0, '2025-12-21 00:20:29', '2025-12-27 00:20:29'),
(144, 21, 9, 122, 143, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Design will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-21 00:20:29', '2025-12-22 00:20:29'),
(145, 21, 11, 125, NULL, 'Can you recommend any additional resources or projects to practice UI/UX?', 0, '2025-12-18 00:20:29', '2025-12-16 00:20:29'),
(146, 21, 9, 125, 145, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to UI/UX can be very beneficial for learning and networking.', 1, '2025-12-16 00:20:29', '2025-12-22 00:20:29'),
(147, 22, 17, 131, NULL, 'What are the best practices for implementing React Native in real-world projects?', 0, '2025-12-14 00:20:29', '2025-12-21 00:20:29'),
(148, 22, 9, 131, 147, 'Excellent question! When implementing React Native in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-29 00:20:29', '2025-12-17 00:20:29'),
(149, 22, 18, 131, NULL, 'Are there any prerequisites I should know before diving deep into React Native?', 0, '2025-12-18 00:20:29', '2025-12-25 00:20:29'),
(150, 22, 9, 131, 149, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Mobile Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-27 00:20:29', '2025-12-19 00:20:29'),
(151, 22, 11, 129, NULL, 'How long will it take to master React Native with this course?', 0, '2025-12-18 00:20:29', '2025-12-19 00:20:29'),
(152, 22, 9, 129, 151, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-22 00:20:29', '2025-12-18 00:20:29'),
(153, 22, 10, 127, NULL, 'Can you recommend any additional resources or projects to practice React Native?', 0, '2025-12-15 00:20:29', '2025-12-22 00:20:29'),
(154, 22, 9, 127, 153, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to React Native can be very beneficial for learning and networking.', 1, '2025-12-17 00:20:29', '2025-12-15 00:20:29'),
(155, 23, 15, 135, NULL, 'Are there any prerequisites I should know before diving deep into Python?', 0, '2025-12-21 00:20:29', '2025-12-17 00:20:29'),
(156, 23, 9, 135, 155, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of IT & Software will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-23 00:20:29', '2025-12-19 00:20:29'),
(157, 23, 15, 133, NULL, 'How long will it take to master Python with this course?', 0, '2025-12-17 00:20:29', '2025-12-15 00:20:29'),
(158, 23, 9, 133, 157, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-25 00:20:29', '2025-12-26 00:20:29'),
(159, 23, 15, 136, NULL, 'Can you recommend any additional resources or projects to practice Python?', 0, '2025-12-19 00:20:29', '2025-12-14 00:20:29'),
(160, 23, 9, 136, 159, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Python can be very beneficial for learning and networking.', 1, '2025-12-28 00:20:29', '2025-12-25 00:20:29'),
(161, 24, 16, 144, NULL, 'I\'m having trouble understanding the core concepts of Laravel. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-14 00:20:30', '2025-12-20 00:20:30'),
(162, 24, 9, 144, 161, 'Great question! The fundamentals of Laravel are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-16 00:20:30', '2025-12-19 00:20:30'),
(163, 24, 17, 142, NULL, 'Are there any prerequisites I should know before diving deep into Laravel?', 0, '2025-12-27 00:20:30', '2025-12-17 00:20:30'),
(164, 24, 9, 142, 163, 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of Web Development will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!', 1, '2025-12-25 00:20:30', '2025-12-20 00:20:30'),
(165, 24, 16, 141, NULL, 'How long will it take to master Laravel with this course?', 0, '2025-12-20 00:20:30', '2025-12-28 00:20:30'),
(166, 24, 9, 141, 165, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-22 00:20:30', '2025-12-16 00:20:30'),
(167, 24, 15, 142, NULL, 'Can you recommend any additional resources or projects to practice Laravel?', 0, '2025-12-23 00:20:30', '2025-12-16 00:20:30'),
(168, 24, 9, 142, 167, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Laravel can be very beneficial for learning and networking.', 1, '2025-12-28 00:20:30', '2025-12-18 00:20:30'),
(169, 25, 16, 149, NULL, 'I\'m having trouble understanding the core concepts of Management. Can you please explain the fundamentals in simpler terms?', 0, '2025-12-25 00:20:30', '2025-12-23 00:20:30'),
(170, 25, 9, 149, 169, 'Great question! The fundamentals of Management are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!', 1, '2025-12-25 00:20:30', '2025-12-29 00:20:30'),
(171, 25, 14, 148, NULL, 'What are the best practices for implementing Management in real-world projects?', 0, '2025-12-24 00:20:30', '2025-12-28 00:20:30'),
(172, 25, 9, 148, 171, 'Excellent question! When implementing Management in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.', 1, '2025-12-25 00:20:30', '2025-12-25 00:20:30'),
(173, 25, 18, 146, NULL, 'How long will it take to master Management with this course?', 0, '2025-12-24 00:20:30', '2025-12-20 00:20:30'),
(174, 25, 9, 146, 173, 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!', 1, '2025-12-28 00:20:30', '2025-12-18 00:20:30'),
(175, 25, 12, 148, NULL, 'Can you recommend any additional resources or projects to practice Management?', 0, '2025-12-23 00:20:30', '2025-12-28 00:20:30');
INSERT INTO `course_questions` (`id`, `course_id`, `user_id`, `lecture_id`, `parent_id`, `question`, `is_instructor_reply`, `created_at`, `updated_at`) VALUES
(176, 25, 9, 148, 175, 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to Management can be very beneficial for learning and networking.', 1, '2025-12-27 00:20:30', '2025-12-22 00:20:30'),
(177, 11, 24, 61, NULL, 'hello sir, i have some queries to ask you can you help ma?', 0, '2026-01-01 22:53:37', '2026-01-01 22:53:37');

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
(1, 1, 'Section 1: Introduction to Cyber Security', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 1, 'Section 2: Advanced Cyber Security', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 2, 'Section 1: Introduction to Kotlin', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 2, 'Section 2: Advanced Kotlin', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 4, 'Section 1: Introduction to Data Science', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(8, 4, 'Section 2: Advanced Data Science', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 6, 'Section 1: Introduction to Swift', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 6, 'Section 2: Advanced Swift', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(13, 7, 'Section 1: Introduction to Finance', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(14, 7, 'Section 2: Advanced Finance', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(15, 8, 'Section 1: Introduction to Cyber Security', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 8, 'Section 2: Advanced Cyber Security', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 9, 'Section 1: Introduction to Marketing', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 9, 'Section 2: Advanced Marketing', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 10, 'Section 1: Introduction to Cyber Security', 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 10, 'Section 2: Advanced Cyber Security', 2, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 11, 'Section 1: Introduction to React Native', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(22, 11, 'Section 2: Advanced React Native', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(23, 12, 'Section 1: Introduction to Marketing', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(24, 12, 'Section 2: Advanced Marketing', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(25, 13, 'Section 1: Introduction to Graphic Design', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(26, 13, 'Section 2: Advanced Graphic Design', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(27, 14, 'Section 1: Introduction to Entrepreneurship', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(28, 14, 'Section 2: Advanced Entrepreneurship', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(29, 15, 'Section 1: Introduction to Figma', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(30, 15, 'Section 2: Advanced Figma', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(31, 16, 'Section 1: Introduction to Kotlin', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(32, 16, 'Section 2: Advanced Kotlin', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(33, 17, 'Section 1: Introduction to Laravel', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(34, 17, 'Section 2: Advanced Laravel', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(35, 18, 'Section 1: Introduction to Figma', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(36, 18, 'Section 2: Advanced Figma', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(37, 19, 'Section 1: Introduction to Photoshop', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(38, 19, 'Section 2: Advanced Photoshop', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(39, 20, 'Section 1: Introduction to Python', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(40, 20, 'Section 2: Advanced Python', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(41, 21, 'Section 1: Introduction to UI/UX', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 21, 'Section 2: Advanced UI/UX', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 22, 'Section 1: Introduction to React Native', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(44, 22, 'Section 2: Advanced React Native', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(45, 23, 'Section 1: Introduction to Python', 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(46, 23, 'Section 2: Advanced Python', 2, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(47, 24, 'Section 1: Introduction to Laravel', 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(48, 24, 'Section 2: Advanced Laravel', 2, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(49, 25, 'Section 1: Introduction to Management', 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(50, 25, 'Section 2: Advanced Management', 2, '2025-12-29 00:20:30', '2025-12-29 00:20:30');

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
(3, 16, 2, NULL, 64.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 19, 2, NULL, 64.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 19, 4, NULL, 72.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 13, 6, NULL, 149.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 13, 7, NULL, 122.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(13, 15, 7, NULL, 122.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 15, 9, NULL, 136.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 15, 10, NULL, 55.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 16, 10, NULL, 55.00, '2025-12-29 05:50:28', 'active', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 13, 11, NULL, 108.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(21, 16, 11, NULL, 108.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(22, 16, 12, NULL, 168.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(23, 15, 13, NULL, 55.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(24, 13, 13, NULL, 55.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(26, 10, 15, NULL, 74.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(27, 13, 16, NULL, 140.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(29, 13, 17, NULL, 169.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(30, 19, 17, NULL, 169.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(31, 13, 18, NULL, 190.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(32, 18, 18, NULL, 190.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(33, 19, 19, NULL, 120.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(34, 13, 19, NULL, 120.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(36, 10, 20, NULL, 183.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(37, 13, 21, NULL, 107.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(38, 16, 22, NULL, 173.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(39, 11, 22, NULL, 173.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 11, 24, NULL, 77.00, '2025-12-29 05:50:29', 'active', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 10, 24, NULL, 77.00, '2025-12-29 05:50:30', 'active', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(44, 19, 25, NULL, 133.00, '2025-12-29 05:50:30', 'active', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(45, 13, 25, NULL, 133.00, '2025-12-29 05:50:30', 'active', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(46, 11, 1, NULL, 0.00, '2025-12-29 00:37:53', 'active', '2025-12-29 00:37:53', '2025-12-29 00:37:53'),
(47, 22, 17, NULL, 0.00, '2025-12-29 05:06:19', 'active', '2025-12-29 05:06:19', '2025-12-29 05:06:19'),
(48, 12, 15, NULL, 0.00, '2025-12-29 14:08:22', 'active', '2025-12-29 14:08:22', '2025-12-29 14:08:22'),
(50, 18, 11, NULL, 0.00, '2025-12-30 04:14:58', 'active', '2025-12-30 04:14:58', '2025-12-30 04:14:58'),
(55, 14, 17, NULL, 35.00, '2026-01-01 07:22:33', 'active', '2026-01-01 07:22:33', '2026-01-01 07:22:33'),
(56, 24, 11, NULL, 15.00, '2026-01-01 22:47:20', 'active', '2026-01-01 22:47:20', '2026-01-01 22:47:20'),
(57, 24, 10, NULL, 34.00, '2026-01-02 00:17:22', 'active', '2026-01-02 00:17:22', '2026-01-02 00:17:22'),
(58, 24, 2, NULL, 20.00, '2026-01-02 00:31:31', 'active', '2026-01-02 00:31:31', '2026-01-02 00:31:31'),
(59, 25, 1, NULL, 11.00, '2026-01-02 02:09:25', 'active', '2026-01-02 02:09:25', '2026-01-02 02:09:25'),
(60, 26, 22, NULL, 12.00, '2026-01-02 04:18:53', 'active', '2026-01-02 04:18:53', '2026-01-02 04:18:53'),
(61, 26, 4, NULL, 31.00, '2026-01-02 04:18:53', 'active', '2026-01-02 04:18:53', '2026-01-02 04:18:53'),
(62, 18, 21, NULL, 12.00, '2026-01-02 05:08:45', 'active', '2026-01-02 05:08:45', '2026-01-02 05:08:45'),
(64, 18, 20, NULL, 31.00, '2026-01-02 06:49:07', 'active', '2026-01-02 06:49:07', '2026-01-02 06:49:07'),
(65, 27, 16, NULL, 32.00, '2026-01-05 00:10:18', 'active', '2026-01-05 00:10:18', '2026-01-05 00:10:18'),
(66, 28, 6, NULL, 18.00, '2026-01-05 00:24:42', 'active', '2026-01-05 00:24:42', '2026-01-05 00:24:42');

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
(29, 'bi-people', 'Expert Instructors', 'We provide the best resources for your learning journey.', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(30, 'bi-mortarboard', 'Lifetime Access', 'We provide the best resources for your learning journey.', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(31, 'bi-play-circle', 'Quality Content', 'We provide the best resources for your learning journey.', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(32, 'bi-award', 'Certificate of Completion', 'We provide the best resources for your learning journey.', '2025-12-29 00:20:30', '2025-12-29 00:20:30');

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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"6a38b085-0b25-4185-b59d-f43caaea5318\",\"displayName\":\"App\\\\Notifications\\\\WelcomeNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:23;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:37:\\\"App\\\\Notifications\\\\WelcomeNotification\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"c5544df8-c407-4e5d-8ad7-104e54975f1d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1767073452, 1767073452),
(2, 'default', '{\"uuid\":\"e1535e6b-6bec-4796-a3cb-b8d147323d4a\",\"displayName\":\"App\\\\Notifications\\\\WelcomeNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:23;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:37:\\\"App\\\\Notifications\\\\WelcomeNotification\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"c5544df8-c407-4e5d-8ad7-104e54975f1d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1767073452, 1767073452);

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

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_01_01_000000_add_performance_indexes', 1),
(2, '2026_01_02_174000_add_negative_marking_to_quizzes_table', 2),
(3, '2026_01_03_090138_add_payment_hold_columns_to_orders_table', 3);

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
('01f4a7bc-acb4-4977-8e55-3cf6c30a8a99', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Course Completed! \\ud83c\\udf93\",\"message\":\"Congratulations! You have completed the full course: Python - Masterclass by Instructor 5 (Vol 3). Your certificate is ready!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"course\",\"icon\":\"bi-trophy-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:55:10', '2025-12-30 05:55:10'),
('021dbb1b-1538-4706-92fd-a812532c269d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: React Native - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 04:19:51', '2026-01-02 04:19:51'),
('023995ff-2e9e-4a54-87bd-6b31fb97ab30', 'App\\Notifications\\QuestionNotification', 'App\\Models\\User', 7, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"11\",\"course_title\":\"React Native - Masterclass by Instructor 3 (Vol 1)\",\"message\":\"New Question from kenil bhut for course: React Native - Masterclass by Instructor 3 (Vol 1)\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/instructor\\/questions\\/177\"}', NULL, '2026-01-01 22:53:37', '2026-01-01 22:53:37'),
('03fcd7ac-dfaa-4451-82da-e2fce7a89865', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"12\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 8\"}', '2026-01-01 22:33:11', '2026-01-01 05:05:24', '2026-01-01 22:33:11'),
('041e26a0-b533-4231-93a2-2a3264afdd98', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Python Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 04:22:06', '2025-12-30 04:22:06'),
('04f06f1c-0924-4209-b56e-d153041b05e6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Python Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:20:40', '2025-12-30 04:21:14'),
('05304831-8ba2-44ec-9375-c0d647412115', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 00:38:01', '2025-12-29 00:38:01'),
('05343b6f-33f0-4f4d-84e3-ca838af94b35', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:27:07', '2026-01-02 07:27:07'),
('06b52401-ceae-450a-a9b2-b87589463138', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Python Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 04:21:58', '2025-12-30 04:21:58'),
('07b2d506-c579-4703-bb98-033537dbd352', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning React Native Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:19:39', '2026-01-02 04:19:39'),
('07bc523b-c82e-4fe4-ad63-3dc49641d37f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Swift Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:19:35', '2025-12-30 04:06:13'),
('07d30347-af93-45e6-bff6-56ebb40b6fe7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:34:43', '2025-12-30 04:06:14'),
('07f450d9-8293-44e1-b547-88a17d8c67cd', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":14,\"name\":\"Student 5\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"10\",\"course_title\":\"Cyber Security - Masterclass by Instructor 2 (Vol 5)\",\"amount\":\"34\",\"message\":\"Course Purchased: Cyber Security - Masterclass by Instructor 2 (Vol 5) by Student 5\"}', NULL, '2026-01-01 07:22:33', '2026-01-01 07:22:33'),
('0ac12274-79a2-49e0-9f35-564fd424115a', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":27,\"name\":\"Hinal soni\",\"photo\":null,\"email\":\"24mca096@gardividyapith.ac.in\",\"message\":\"New User Registered: Hinal soni\"}', NULL, '2026-01-05 00:06:31', '2026-01-05 00:06:31'),
('0b513dd3-e189-4f2b-b63f-55c515d854cf', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":12,\"name\":\"Student 3\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"15\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 3\"}', NULL, '2025-12-29 14:08:22', '2025-12-29 14:08:22'),
('0cbf0fb9-57d4-4d6c-8002-b59bbffec9d0', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":25,\"name\":\"Hinal soni\",\"photo\":null,\"course_id\":\"1\",\"course_title\":\"Cyber Security - Masterclass by Instructor 1 (Vol 1)\",\"amount\":\"11\",\"message\":\"Course Purchased: Cyber Security - Masterclass by Instructor 1 (Vol 1) by Hinal soni\"}', NULL, '2026-01-02 02:09:25', '2026-01-02 02:09:25'),
('0d9e207f-4388-40b8-8b65-870fe8187aff', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":23,\"name\":\"kenil\",\"photo\":null,\"email\":\"kenilbhut789@gmail.com\",\"message\":\"New User Registered: kenil\"}', NULL, '2025-12-30 00:14:11', '2025-12-30 00:14:11'),
('0ddc7e90-546e-4dd2-84dc-dfa3a569d036', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 33.33% in Quiz: React Native - Advanced. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 05:18:51', '2026-01-02 05:18:51'),
('0eb81ada-d0f5-4bf5-93c3-61bb92795741', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Figma\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/18\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:22:53', '2025-12-30 05:22:53'),
('1002c51c-adf8-40f7-aeb5-525c1eadfbb5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Kotlin\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:36', '2026-01-02 00:33:36'),
('11a63bab-6767-4c5f-9402-9ad4a3886da5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 58.33% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 06:57:47', '2026-01-02 06:57:47'),
('11cf3b1f-0650-4fa3-bc72-b6c6b0770458', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Figma\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/18\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:14:36', '2025-12-30 05:14:36'),
('11d72f8e-6998-487b-b691-25df53bf2c30', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Finance - Advanced. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-30 02:19:20', '2025-12-30 02:19:20'),
('12a37871-2104-4c91-8306-dd2ef6c8e096', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 8, '{\"user_id\":14,\"name\":\"Student 5\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"17\",\"course_title\":\"Laravel - Masterclass by Instructor 4 (Vol 2)\",\"amount\":\"35\",\"message\":\"Course Purchased: Laravel - Masterclass by Instructor 4 (Vol 2) by Student 5\"}', NULL, '2026-01-01 07:22:33', '2026-01-01 07:22:33'),
('1302f595-ad4f-40fa-a7b4-d13c01b50621', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Laravel\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:11:54', '2025-12-29 05:11:54'),
('139b82c8-6d7d-47d5-b661-d6a5b6fbf7d9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 33.33% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:24:36', '2026-01-02 07:24:36'),
('1543510b-7b1d-46d5-a5d4-bca9be2f6baf', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning React Native Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:19:07', '2026-01-02 04:19:07'),
('1563df43-26fa-4212-96bf-f9be9732e8f6', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"19\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Regular User\"}', NULL, '2025-12-26 05:27:35', '2025-12-26 05:27:35'),
('15f89c52-e85a-4a1c-97fe-7e1b2bde5555', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:19:47', '2025-12-30 04:06:13'),
('1648fcb3-dd76-4ed7-bea5-1f2b12be0a44', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Management Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:03:02', '2026-01-02 06:03:02'),
('16b5c7e0-eabb-48a7-8512-4b9ee16be7e4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Finance Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:18:52', '2025-12-30 02:18:52'),
('16e79b25-b4e5-4cfd-9e99-decdeafe75b7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:36:21', '2025-12-30 04:06:13'),
('170c6819-d1b7-454f-8b06-cfbe5a6e8414', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Laravel Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:12:02', '2025-12-29 05:12:02'),
('187fa5f1-1eff-4cf2-93a0-f18d634d0946', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"2\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by kenil bhut\"}', NULL, '2025-12-30 00:38:54', '2025-12-30 00:38:54'),
('18ec3577-2c9f-4da1-a545-bbdbd193e0f2', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:37:57', '2025-12-30 04:06:14'),
('1974f63c-0608-4400-bb3e-d5cc9a351151', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 01:44:32', '2025-12-30 04:06:13'),
('197b64f7-7352-4f4a-882b-90aca7580491', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 01:07:30', '2026-01-02 01:07:30'),
('1c0f588a-2a57-4e7e-98c9-b80577332bfe', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 20, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2025-12-28 04:53:45', '2025-12-28 04:53:45'),
('1c33afdb-afb9-4f66-99a9-bd98f7992e69', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:28', '2026-01-02 02:11:28'),
('1c533b86-498c-48c1-aaee-74a99788a069', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - React Native\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:20:02', '2026-01-02 04:20:02'),
('20b65b21-24a9-4ace-9820-a21a549cce7c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Swift\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:13:53', '2025-12-30 04:06:13'),
('212d8a86-d516-48f4-aaac-024702f1f4cf', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"12\",\"course_title\":\"Marketing - Masterclass by Instructor 3 (Vol 2)\",\"amount\":\"35\",\"message\":\"Course Purchased: Marketing - Masterclass by Instructor 3 (Vol 2) by Student 8\"}', '2026-01-01 22:33:12', '2026-01-01 05:05:24', '2026-01-01 22:33:12'),
('23391794-966b-4a6f-83c0-3d07bb888a69', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Swift Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-28 23:57:31', '2025-12-28 23:57:31'),
('23bf47ea-bba7-4540-9380-acad0f7d65ea', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Figma Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-05 00:45:41', '2026-01-05 00:45:41'),
('25431116-f600-46ce-a907-a044f5863e73', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 01:00:30', '2026-01-02 01:00:30'),
('255f89be-9460-4fbb-8717-fcf6d0b6e57f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Finance\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:17:36', '2025-12-30 02:17:36'),
('26713f61-2f73-4e83-bba5-2174961d7bd1', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 33.33% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:12:33', '2026-01-02 07:12:33'),
('27e43283-dfbb-4c5d-948e-fd4e40ccc326', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Swift Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:19:23', '2025-12-30 04:06:13'),
('281570c0-57d5-4ae2-8507-97a3015c8ab9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: Cyber Security - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:10:44', '2026-01-02 02:10:44'),
('28aed2a4-4555-4b93-b899-4eac4b0dde48', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Laravel - Advanced. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-29 12:32:54', '2025-12-29 05:12:33', '2025-12-29 12:32:54'),
('2ac91335-9b84-413e-806a-a8957a3fb58a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Finance - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-30 02:19:03', '2025-12-30 02:19:03'),
('2b8c035d-1530-4f18-b5a5-03cba62dc3c6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Python Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:20:53', '2025-12-30 04:21:14'),
('2ba73943-4c70-438c-8c1a-455777e05c7a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Management\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:09:05', '2026-01-02 06:09:05'),
('2c678ac7-1976-472b-a58b-ff62b62951d8', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: React Native - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:23:31', '2026-01-02 04:23:31'),
('2e45c20e-7956-4f11-8040-3d1cf29071ac', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Swift Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:13:43', '2025-12-30 04:06:13'),
('303e98a0-7edd-4324-91bd-1126a7f74092', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"25\",\"course_title\":\"Management - Masterclass by Instructor 5 (Vol 5)\",\"amount\":\"150\",\"message\":\"Course Purchased: Management - Masterclass by Instructor 5 (Vol 5) by Student 9\"}', NULL, '2026-01-02 05:52:20', '2026-01-02 05:52:20'),
('33413df1-b0b7-4641-8611-3c2fa6c022d7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Finance Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:17:25', '2025-12-30 02:17:25'),
('34752a87-42f9-48c3-890a-12f5911c753d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:56:59', '2025-12-30 04:06:13'),
('38d07a57-b1b6-4609-adbb-d32661fe9a6f', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"10\",\"course_title\":\"Cyber Security - Masterclass by Instructor 2 (Vol 5)\",\"amount\":\"34\",\"message\":\"Course Purchased: Cyber Security - Masterclass by Instructor 2 (Vol 5) by kenil bhut\"}', NULL, '2026-01-02 00:17:22', '2026-01-02 00:17:22'),
('38e93a21-0eae-4abb-b624-e08e9b655e54', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Swift Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:18:32', '2025-12-30 04:06:13'),
('3b760c4e-e57a-4ee6-b840-71fbf2f10c21', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Swift\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-28 23:57:41', '2025-12-28 23:57:41'),
('3c954049-b639-441e-88fd-6f1cb3cf2f26', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":12,\"name\":\"Student 3\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"15\",\"course_title\":\"Figma - Masterclass by Instructor 3 (Vol 5)\",\"amount\":\"14\",\"message\":\"Course Purchased: Figma - Masterclass by Instructor 3 (Vol 5) by Student 3\"}', NULL, '2025-12-29 14:08:22', '2025-12-29 14:08:22'),
('3efa6b8e-62ea-4726-a9c6-02676d5985bd', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:02:38', '2026-01-02 07:02:38'),
('3f024bab-95c0-416f-9dcd-2b418aa66418', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"2\",\"course_title\":\"Kotlin - Masterclass by Instructor 1 (Vol 2)\",\"amount\":\"20\",\"message\":\"Course Purchased: Kotlin - Masterclass by Instructor 1 (Vol 2) by kenil bhut\"}', NULL, '2025-12-30 00:38:54', '2025-12-30 00:38:54'),
('3ff83465-be4a-41ad-9d44-d5eb693d01fd', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 28, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2026-01-05 00:13:37', '2026-01-05 00:13:37'),
('4282b463-3128-4cad-b135-bdccd7823442', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:10:17', '2025-12-30 04:06:13'),
('42a5a1c8-e011-4dd7-9b67-c57af220e8bc', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Laravel Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:11:33', '2025-12-29 05:11:33'),
('42ba2ce6-eba1-41e3-91e5-f9b50308e66e', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"19\",\"course_title\":\"Data Science - Masterclass by Instructor 5 (Vol 3)\",\"amount\":\"15\",\"message\":\"Course Purchased: Data Science - Masterclass by Instructor 5 (Vol 3) by Regular User\"}', NULL, '2025-12-26 05:27:35', '2025-12-26 05:27:35'),
('456a09af-8b4a-4233-932e-ab4ae99374c3', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Cyber Security Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 01:39:01', '2025-12-30 04:06:13'),
('461ad185-67dd-444c-88fe-6149ca3dd7f6', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":26,\"name\":\"kelvi\",\"photo\":null,\"course_id\":\"4\",\"course_title\":\"Data Science - Masterclass by Instructor 1 (Vol 4)\",\"amount\":\"31\",\"message\":\"Course Purchased: Data Science - Masterclass by Instructor 1 (Vol 4) by kelvi\"}', NULL, '2026-01-02 04:18:53', '2026-01-02 04:18:53'),
('4757864f-875f-4c63-bddf-82233e1e11b9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Course Completed! \\ud83c\\udf93\",\"message\":\"Congratulations! You have completed the full course: React Native - Masterclass by Instructor 5 (Vol 2). Your certificate is ready!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"course\",\"icon\":\"bi-trophy-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:23:31', '2026-01-02 04:23:31'),
('478d1114-e377-4cd3-bc0f-6680ca8f68d7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:14', '2025-12-30 01:35:32', '2025-12-30 04:06:14'),
('48775c94-9245-4899-bc0b-af86795d5b21', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning React Native Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 06:07:50', '2025-12-30 06:07:50'),
('4bc7c079-c4b5-424a-a334-3bcb4fcf6845', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 03:41:14', '2025-12-30 03:37:25', '2025-12-30 03:41:14'),
('4f2bbb29-b0ab-43aa-bd01-214921c4c7a9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning React Native Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:18:42', '2025-12-30 04:21:14'),
('51c9640a-0128-46b2-aabb-e186de64d5cd', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:17:19', '2026-01-02 07:17:19'),
('51e93e1c-597d-4fc4-978e-2aff2b1e6fdb', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"11\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 8\"}', NULL, '2026-01-01 05:05:24', '2026-01-01 05:05:24'),
('5423801d-888b-4358-bce6-a51dae65c9ff', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Finance Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:01:13', '2025-12-30 02:01:13'),
('54790f58-8594-4f9c-a9d9-f6d431fef5a5', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"11\",\"course_title\":\"React Native - Masterclass by Instructor 3 (Vol 1)\",\"amount\":\"15\",\"message\":\"Course Purchased: React Native - Masterclass by Instructor 3 (Vol 1) by kenil bhut\"}', NULL, '2026-01-01 22:47:20', '2026-01-01 22:47:20'),
('54bc0009-470a-4950-a652-2a2be5d46584', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"11\",\"course_title\":\"React Native - Masterclass by Instructor 3 (Vol 1)\",\"amount\":\"15\",\"message\":\"Course Purchased: React Native - Masterclass by Instructor 3 (Vol 1) by Student 9\"}', NULL, '2025-12-30 04:14:58', '2025-12-30 04:14:58'),
('561528f7-8570-4cff-a648-bfff2bf3c14d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 01:00:30', '2026-01-02 01:00:30'),
('56f4f4a2-9344-470f-ba56-db1ed34256f4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Figma\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-05 00:45:47', '2026-01-05 00:45:47'),
('57591b1e-1628-4dc1-944d-8d3f2e2c475e', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:10:58', '2026-01-02 02:10:58'),
('595930d4-25e5-48d7-841b-910a4c290e48', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Kotlin\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:44', '2026-01-02 00:33:44'),
('5b7180ed-edea-493c-a464-d280208045a6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Finance - Advanced. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-30 02:19:42', '2025-12-30 02:19:42'),
('5b96bc51-356c-4e28-9078-907cd1b018a6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Finance\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:17:29', '2025-12-30 02:17:29'),
('5c9cd1d2-59f4-479e-b00a-1b4ade3a4a3a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:56:46', '2025-12-30 04:06:13'),
('5e1f6eb8-2bf5-49e4-a526-3c7121e2f1d9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Finance Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:18:48', '2025-12-30 02:18:48'),
('5f49bce7-9b23-4f85-98c1-5095a17f4118', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":21,\"name\":\"yagnik patel\",\"photo\":null,\"email\":\"mr.yagnik11@gmail.com\",\"message\":\"New User Registered: yagnik patel\"}', '2025-12-29 04:47:25', '2025-12-28 05:06:06', '2025-12-29 04:47:25'),
('5fd99f6e-f5a0-41d3-85bb-e59c7108335b', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Course Completed! \\ud83c\\udf93\",\"message\":\"Congratulations! You have completed the full course: Cyber Security - Masterclass by Instructor 1 (Vol 1). Your certificate is ready!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"course\",\"icon\":\"bi-trophy-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:28', '2026-01-02 02:11:28'),
('600d19f2-7718-4d9a-8feb-e8dbd6cae99b', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:35:14', '2025-12-30 04:06:14'),
('6047dc24-a5b7-416a-ac5b-9421eaecbc22', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Laravel Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:11:42', '2025-12-29 05:11:42'),
('628ba867-40cf-41cd-9b0c-0fe0eb2cd5d4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: Management - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:06:01', '2026-01-02 06:06:01'),
('62f84337-1ecf-4687-a3ad-dab0a54621f5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Figma\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/18\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:14:44', '2025-12-30 05:14:44'),
('63e82ac7-944a-4dfb-a585-1cd88fb0b597', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":20,\"name\":\"yagnik desai\",\"photo\":null,\"email\":\"mr.yagnikpatel11@gmail.com\",\"message\":\"New User Registered: yagnik desai\"}', '2025-12-29 04:47:25', '2025-12-28 04:53:18', '2025-12-29 04:47:25'),
('64c7e8e6-2b9b-480f-82a5-5d846e0c7ccc', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Cyber Security Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 01:00:08', '2026-01-02 01:00:08'),
('685bd7ee-0fe9-4646-acf0-a4e1a3923b76', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Node.js - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-26 07:19:24', '2025-12-26 07:19:24'),
('6913d45d-af46-463b-8ebd-bf2aac17bdd0', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:42:20', '2025-12-30 04:06:13'),
('692be1a7-3cfa-4410-9b01-8e621c16a750', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - React Native\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:19:08', '2025-12-30 04:21:14'),
('6cc4f761-4dd1-4db6-babc-1c5962ab62ac', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 01:06:56', '2026-01-02 01:06:56'),
('6d01c3c9-cd7a-4a29-8c14-cc5eea766ac6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Course Completed! \\ud83c\\udf93\",\"message\":\"Congratulations! You have completed the full course: Kotlin - Masterclass by Instructor 1 (Vol 2). Your certificate is ready!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"course\",\"icon\":\"bi-trophy-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:43:32', '2026-01-02 00:43:32'),
('6e9f00e0-e23f-418b-a07a-a71c62350b87', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 8, '{\"user_id\":22,\"name\":\"diya patel\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/695258afcd836.png\",\"course_id\":\"17\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by diya patel\"}', NULL, '2025-12-29 05:06:19', '2025-12-29 05:06:19'),
('6f03968d-28ff-471e-85d9-cc5026e19d04', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 58.33% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 06:57:46', '2026-01-02 06:57:46'),
('6fa9c90d-4c46-4174-a0d7-02f2a48dfb4c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Figma Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-05 00:45:54', '2026-01-05 00:45:54'),
('71965802-a5bb-4eb3-9121-00f63ec61016', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:37:44', '2025-12-30 04:06:14'),
('72fbb13d-de61-49b5-b441-9ef58276d0c0', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Kotlin\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:40', '2026-01-02 00:33:40'),
('75d21d46-e967-477f-bbfd-f7a4cd441863', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Python Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:20:29', '2025-12-30 04:21:14'),
('76e1dba0-b09a-4477-bc1d-3cfb508101da', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 00:38:14', '2025-12-29 00:38:14'),
('777c37a6-61d2-4558-8158-880fa46cc86a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Cyber Security Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:23', '2026-01-02 02:11:23'),
('7934a29a-a9a3-4e69-a0d4-d3461c57d06f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning React Native Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:18:55', '2025-12-30 04:21:14'),
('79856c80-65f5-44e8-84d9-dfc095029e0f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Swift Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-28 23:57:16', '2025-12-28 23:57:16'),
('7a1d5663-7805-453b-905f-d794189de123', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Management Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:03:10', '2026-01-02 06:03:10'),
('7a9cd71c-f2bc-4a31-9c48-93b1f188c2d6', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning React Native Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:20:20', '2026-01-02 04:20:20'),
('7bcff1d4-f581-4b9e-997d-f18ce2542569', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Cyber Security Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:10:29', '2026-01-02 02:10:29');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('7e54311a-e77d-42c0-b919-f73a10fb0bbf', 'App\\Notifications\\UserReviewNotification', 'App\\Models\\User', 7, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"11\",\"course_title\":\"React Native - Masterclass by Instructor 3 (Vol 1)\",\"rating\":\"5\",\"message\":\"New Review from kenil bhut for course: React Native - Masterclass by Instructor 3 (Vol 1)\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/instructor\\/all-reviews\"}', NULL, '2026-01-01 22:54:00', '2026-01-01 22:54:00'),
('7f93473a-ff40-41b4-9710-dccedf5f83ec', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:19:47', '2025-12-30 04:06:13'),
('7fc7084a-63a6-4456-8137-c78296bffaac', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - React Native\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:18:58', '2025-12-30 04:21:14'),
('802c9b97-8b87-42d5-ad50-2fbddad3db82', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning React Native Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:20:15', '2026-01-02 04:20:15'),
('802e6ecb-a92c-4fce-ade0-36c6af813dae', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Swift\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-28 23:57:39', '2025-12-28 23:57:39'),
('80bc3cb3-0012-449d-a120-629c39c6d8ed', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:36:00', '2025-12-30 04:06:14'),
('80eb9473-4dfb-4878-8a4c-675e1a358516', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Management - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 06:03:21', '2026-01-02 06:03:21'),
('810ed868-34d7-4eda-970b-8770593914ce', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":11,\"name\":\"Student 2\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520e13778f5.jpg\",\"course_id\":\"1\",\"course_title\":\"Cyber Security - Masterclass by Instructor 1 (Vol 1)\",\"amount\":\"11\",\"message\":\"Course Purchased: Cyber Security - Masterclass by Instructor 1 (Vol 1) by Student 2\"}', NULL, '2025-12-29 00:37:53', '2025-12-29 00:37:53'),
('81248be5-6192-4eee-911e-ecabd78cad7c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning React Native Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:21:14', '2025-12-30 04:16:07', '2025-12-30 04:21:14'),
('815f45d7-84e8-4908-863d-df65d58c2921', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 03:42:21', '2025-12-30 04:06:13'),
('820d8bf4-8863-4131-a7d4-e6e98ffc2b7e', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: Python - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:55:10', '2025-12-30 05:55:10'),
('8222b5e9-28fa-4f64-b464-dddf8da63b27', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning React Native Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/11\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 06:07:37', '2025-12-30 06:07:37'),
('845f5a1c-0187-4e8e-a23c-9c91e64544e7', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":25,\"name\":\"Hinal soni\",\"photo\":null,\"email\":\"hinalsk2164@gmai.com\",\"message\":\"New User Registered: Hinal soni\"}', NULL, '2026-01-02 02:05:34', '2026-01-02 02:05:34'),
('85bda593-635c-454c-a670-035d7f9d9782', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":22,\"name\":\"diya patel\",\"photo\":null,\"email\":\"pateldiya3126@gmail.com\",\"message\":\"New User Registered: diya patel\"}', NULL, '2025-12-29 04:57:02', '2025-12-29 04:57:02'),
('8689583f-a5e1-4298-b0bd-d141e0d34ae1', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning React Native Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:20:09', '2026-01-02 04:20:09'),
('8812d67b-b022-41a1-9340-f0580a1348e8', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Kotlin Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:58', '2026-01-02 00:33:58'),
('88bc990f-2094-46d7-b109-063f0d3faaf3', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":11,\"name\":\"Student 2\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520e13778f5.jpg\",\"course_id\":\"1\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 2\"}', NULL, '2025-12-29 00:37:53', '2025-12-29 00:37:53'),
('8bb15ae2-1767-4201-89d2-ddba69a986c8', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 4, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2025-12-26 03:44:32', '2025-12-26 03:44:32'),
('8bd73d96-7196-45dc-82a6-253a8e42bdd3', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-30 05:51:18', '2025-12-30 05:51:18'),
('8cff6705-8432-4abe-a6d7-8856b13ff42a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning React Native Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:19:18', '2026-01-02 04:19:18'),
('9171464f-b8ab-4532-aee8-b81860f337db', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:22:21', '2026-01-02 00:22:21'),
('92a4a1a3-be99-42ee-9b65-d03cc4fc08fb', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"7\",\"course_title\":\"Finance - Masterclass by Instructor 2 (Vol 2)\",\"amount\":\"32\",\"message\":\"Course Purchased: Finance - Masterclass by Instructor 2 (Vol 2) by Student 8\"}', NULL, '2026-01-01 05:05:24', '2026-01-01 05:05:24'),
('94043960-1335-48da-b948-6cb629ace4a3', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Management Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:02:56', '2026-01-02 06:02:56'),
('94bb5b67-b3e7-4085-afd6-8ca8c970d0b7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Kotlin Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:32:57', '2026-01-02 00:32:57'),
('9545b2e8-f519-4ed6-8905-2647d20e0864', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 00:39:14', '2025-12-29 00:39:14'),
('96c1dfde-2344-432c-9f64-ce9dcf833ed7', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"11\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 9\"}', NULL, '2025-12-30 04:14:58', '2025-12-30 04:14:58'),
('977bac14-5fdf-4d4c-bf20-21b1f2a2600f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Laravel Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:12:05', '2025-12-29 05:12:05'),
('985bdfb8-7d13-4f62-b4e3-ae66b723c897', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:13', '2025-12-30 01:45:39', '2025-12-30 04:06:13'),
('98a14bae-176a-477f-96b1-b741c46bd9b7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Laravel - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-29 05:11:51', '2025-12-29 05:11:51'),
('9a232010-4005-4d03-95f3-5d5e5bc989c2', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 8, '{\"user_id\":27,\"name\":\"Hinal soni\",\"photo\":null,\"course_id\":\"16\",\"course_title\":\"Kotlin - Masterclass by Instructor 4 (Vol 1)\",\"amount\":\"32\",\"message\":\"Course Purchased: Kotlin - Masterclass by Instructor 4 (Vol 1) by Hinal soni\"}', NULL, '2026-01-05 00:10:06', '2026-01-05 00:10:06'),
('9c244867-0bd2-4105-bc51-dd36de4b5a81', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"21\",\"course_title\":\"UI\\/UX - Masterclass by Instructor 5 (Vol 1)\",\"amount\":\"12\",\"message\":\"Course Purchased: UI\\/UX - Masterclass by Instructor 5 (Vol 1) by Student 9\"}', NULL, '2026-01-02 05:08:45', '2026-01-02 05:08:45'),
('9dabb1d3-6e2b-45f1-b305-fbc04d32e1a1', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Swift - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 03:41:20', '2025-12-30 03:37:25', '2025-12-30 03:41:20'),
('9df9a2b4-4e61-4272-aa68-02b8e87da6a2', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":4,\"name\":\"krunal vegad\",\"photo\":null,\"email\":\"vegadkrunal111@gmail.com\",\"message\":\"New User Registered: krunal vegad\"}', '2025-12-29 04:47:25', '2025-12-26 03:44:14', '2025-12-29 04:47:25'),
('9f5f3bae-9c35-4f79-b685-f21d3229ac68', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Node.js Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-26 07:19:02', '2025-12-26 07:19:02'),
('9f68868a-81f3-4113-aaed-c37404091a7c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Node.js\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-26 07:19:06', '2025-12-26 07:19:06'),
('a14c91a0-a36a-4bcd-b510-24a4ce2fbfd2', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Finance Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:02:04', '2025-12-30 02:02:04'),
('a3273afa-ad1b-480b-b1fc-b94383c4a419', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 01:07:20', '2026-01-02 01:07:20'),
('a39f00a8-389f-4df2-ab83-16c1d3ff0b27', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Kotlin Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:52', '2026-01-02 00:33:52'),
('a79c5682-2815-4e39-b44a-a3ac9edfde80', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Laravel - Advanced. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2025-12-29 05:12:21', '2025-12-29 05:12:21'),
('aa97a3cf-0016-489b-8acc-c8b3f49d8bc5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Figma - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-05 00:42:29', '2026-01-05 00:42:29'),
('ab226eb6-991d-4325-99fd-1028aba50709', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:17', '2026-01-02 02:11:17'),
('acf3fa94-1e2a-49a5-80f2-a8cbfcff5321', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 5, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69536c272d0f3.png\",\"course_id\":\"2\",\"course_title\":\"Kotlin - Masterclass by Instructor 1 (Vol 2)\",\"amount\":\"20\",\"message\":\"Course Purchased: Kotlin - Masterclass by Instructor 1 (Vol 2) by kenil bhut\"}', NULL, '2026-01-02 00:31:31', '2026-01-02 00:31:31'),
('b0cfb9d8-5f7c-4707-a264-cc1478d05429', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Kotlin - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 00:35:04', '2026-01-02 00:35:04'),
('b1d30b9c-d6c0-411f-a810-ee4a155c1794', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Kotlin - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 00:33:20', '2026-01-02 00:33:20'),
('b2c417ad-833b-4bc0-a516-e1bd5705ec36', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 25% in Quiz: Python - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 07:30:29', '2026-01-02 07:30:29'),
('b4b10456-339b-44ff-9d07-031c96c64f25', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:03', '2026-01-02 02:11:03'),
('b4d9af74-1584-40a6-b122-3592e82407a9', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 8, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"20\",\"course_title\":\"Python - Masterclass by Instructor 4 (Vol 5)\",\"amount\":\"31\",\"message\":\"Course Purchased: Python - Masterclass by Instructor 4 (Vol 5) by Student 9\"}', NULL, '2026-01-02 06:49:07', '2026-01-02 06:49:07'),
('b75d5653-bb69-41c7-826b-1b82e714586f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:09:57', '2026-01-02 02:09:57'),
('b85585f6-cca6-4155-bc32-cb514e51be75', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"10\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Regular User\"}', NULL, '2025-12-26 07:17:53', '2025-12-26 07:17:53'),
('b8aa48b5-e655-484e-af0f-cfe1e42da115', 'App\\Notifications\\UserReviewNotification', 'App\\Models\\User', 9, '{\"user_id\":18,\"name\":\"Student 9\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"25\",\"course_title\":\"Management - Masterclass by Instructor 5 (Vol 5)\",\"rating\":\"5\",\"message\":\"New Review from Student 9 for course: Management - Masterclass by Instructor 5 (Vol 5)\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/instructor\\/all-reviews\"}', NULL, '2026-01-02 06:01:30', '2026-01-02 06:01:30'),
('b8cdf41e-0115-4aa8-bba3-f3cd0d21f2ad', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":26,\"name\":\"kelvi\",\"photo\":null,\"email\":\"kelvibarochiya@gmail.com\",\"message\":\"New User Registered: kelvi\"}', NULL, '2026-01-02 03:25:49', '2026-01-02 03:25:49'),
('ba09a7a3-dc91-45f4-b80a-6926c5aefc37', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Swift\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:13:56', '2025-12-30 04:06:13'),
('bbf9b38a-a100-4415-ba4d-8759c5cec53a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-29 13:46:24', '2025-12-30 04:06:14'),
('bc02d4b8-9edf-4764-a22c-aa5efbb72295', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 25, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2026-01-02 02:05:48', '2026-01-02 02:05:48'),
('be26d43e-c9e4-465c-b197-0e39eeff2f22', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Cyber Security Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 01:38:23', '2025-12-30 04:06:13'),
('bf26ef96-0dea-455c-9038-1f357e8e8af7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: Kotlin - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:43:32', '2026-01-02 00:43:32'),
('bfe67557-70b8-42ae-8a68-3c792731435f', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 27, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2026-01-05 00:06:59', '2026-01-05 00:06:59'),
('c1897337-6b12-4c61-aad5-e96a860e02dc', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Figma Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/18\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:14:24', '2025-12-30 05:14:24'),
('c196fb47-6753-42b4-9f0e-027c35de9d66', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Kotlin Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:34:09', '2026-01-02 00:34:09'),
('c42d2743-7de9-4ea1-8166-e3d1c3c3c441', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Swift\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:20:30', '2025-12-30 04:06:13'),
('c84769ff-88f0-493b-8e38-fec324081318', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 8, '{\"user_id\":22,\"name\":\"diya patel\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/695258afcd836.png\",\"course_id\":\"17\",\"course_title\":\"Laravel - Masterclass by Instructor 4 (Vol 2)\",\"amount\":\"35\",\"message\":\"Course Purchased: Laravel - Masterclass by Instructor 4 (Vol 2) by diya patel\"}', NULL, '2025-12-29 05:06:19', '2025-12-29 05:06:19'),
('c84b397f-9e02-4f44-8e6e-21f64de23743', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 26, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - React Native\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/22\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 04:19:59', '2026-01-02 04:19:59'),
('cb6126c8-7203-40a7-8b4d-56a196ab7bd7', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":28,\"name\":\"skill-sbt\",\"photo\":null,\"email\":\"skill-sbt@yopmail.com\",\"message\":\"New User Registered: skill-sbt\"}', NULL, '2026-01-05 00:13:30', '2026-01-05 00:13:30'),
('cbef001c-23af-4ece-9aa7-85e27316ae96', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:21:41', '2026-01-02 00:21:41'),
('cc13e228-e9fe-4424-a388-7600d28ca4b2', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Management\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/25\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 06:09:09', '2026-01-02 06:09:09'),
('ce467353-6364-4022-b226-a5e212c21155', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 9, '{\"user_id\":26,\"name\":\"kelvi\",\"photo\":null,\"course_id\":\"22\",\"course_title\":\"React Native - Masterclass by Instructor 5 (Vol 2)\",\"amount\":\"12\",\"message\":\"Course Purchased: React Native - Masterclass by Instructor 5 (Vol 2) by kelvi\"}', NULL, '2026-01-02 04:18:53', '2026-01-02 04:18:53'),
('cf096d1e-4944-4e8b-a27e-facf5ea5d0ec', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Course Completed! \\ud83c\\udf93\",\"message\":\"Congratulations! You have completed the full course: Cyber Security - Masterclass by Instructor 2 (Vol 3). Your certificate is ready!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"course\",\"icon\":\"bi-trophy-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 01:39:01', '2025-12-30 04:06:13'),
('d268268a-63e4-4c36-9b8c-cb93402f31c6', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 26, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2026-01-02 03:26:12', '2026-01-02 03:26:12'),
('d3684fd5-6210-46b7-bbc3-3d696937966f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Figma Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-05 00:46:00', '2026-01-05 00:46:00'),
('d3f79f10-a6e9-491f-8aae-d03d2a6df6c9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', '2025-12-30 04:06:14', '2025-12-30 01:36:12', '2025-12-30 04:06:14'),
('d4392f7f-21f9-4b87-b997-be616318b724', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 22, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Laravel Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/17\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 05:12:08', '2025-12-29 05:12:08'),
('d465bf1c-fbda-42f2-9b30-00e84bd3a482', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:10:12', '2026-01-02 02:10:12'),
('d49674eb-0a6a-4c7f-976a-f5651019963b', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":3,\"name\":\"Regular User\",\"photo\":null,\"course_id\":\"10\",\"course_title\":\"Node.js - Masterclass by Instructor 2 (Vol 5)\",\"amount\":\"29\",\"message\":\"Course Purchased: Node.js - Masterclass by Instructor 2 (Vol 5) by Regular User\"}', NULL, '2025-12-26 07:17:53', '2025-12-26 07:17:53'),
('d694f6f7-47b0-4d72-9fe4-e738bc7e9f5d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 01:07:13', '2026-01-02 01:07:13'),
('d792e6bf-8c2d-434d-ae39-5acb7dee6baa', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Kotlin - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 00:39:33', '2026-01-02 00:39:33'),
('da5f7ff3-b3ae-421e-b21e-27b8f31d30c9', 'App\\Notifications\\UserReviewNotification', 'App\\Models\\User', 9, '{\"user_id\":26,\"name\":\"kelvi\",\"photo\":null,\"course_id\":\"22\",\"course_title\":\"React Native - Masterclass by Instructor 5 (Vol 2)\",\"rating\":\"5\",\"message\":\"New Review from kelvi for course: React Native - Masterclass by Instructor 5 (Vol 2)\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/instructor\\/all-reviews\"}', NULL, '2026-01-02 04:31:00', '2026-01-02 04:31:00'),
('dc019a32-9f00-4131-beaa-d65fce803524', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-03 00:00:38', '2026-01-03 00:00:38'),
('dd8e48d3-39b4-4a4f-8517-8f2bbc303bad', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Kotlin Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:31:55', '2026-01-02 00:31:55'),
('dd92eccb-9898-44d2-8755-dbd30af1ca4a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Figma\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/15\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-05 00:42:41', '2026-01-05 00:42:41'),
('dde1b747-b7db-44c4-89c2-a99368a91cc7', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 22, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2025-12-29 04:57:16', '2025-12-29 04:57:16'),
('e21e9b9f-4343-4e85-9171-5aa376662d75', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Python\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 05:15:55', '2025-12-30 05:15:55'),
('e3fdf2df-6ca2-46c8-9b39-d3d2c2097ea4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Quiz: Python - Basics\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/20\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 07:14:50', '2026-01-02 07:14:50'),
('e528a4f8-cd65-49a8-8173-bb23e533bdf5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 01:38:26', '2025-12-30 04:06:13'),
('e5323676-ef81-4151-8c8e-1f6667205507', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Swift Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/6\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:13', '2025-12-30 03:19:13', '2025-12-30 04:06:13'),
('e63065c2-9250-4ef8-afa2-26cbe1bf5851', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Cyber Security\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-29 00:38:13', '2025-12-29 00:38:13'),
('e77e1149-9ccb-417b-a47c-22797ee5befc', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Kotlin - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 00:34:30', '2026-01-02 00:34:30'),
('e8a84ba5-641c-4107-802e-9127f9929637', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Kotlin Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/2\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 00:33:05', '2026-01-02 00:33:05'),
('e8af2b62-6098-408e-bc5e-2e82863d15f6', 'App\\Notifications\\WelcomeNotification', 'App\\Models\\User', 21, '{\"title\":\"Welcome to SkillPoint! \\ud83d\\udc4b\",\"message\":\"Your account has been created successfully. Welcome to our learning community!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/dashboard\",\"type\":\"general\",\"icon\":\"bi-stars\",\"color\":\"success\"}', NULL, '2025-12-28 05:06:18', '2025-12-28 05:06:18'),
('ebe81cc2-c752-4728-8768-2608a71605bc', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":28,\"name\":\"skill-sbt\",\"photo\":null,\"course_id\":\"6\",\"course_title\":\"Swift - Masterclass by Instructor 2 (Vol 101)\",\"amount\":\"18\",\"message\":\"Course Purchased: Swift - Masterclass by Instructor 2 (Vol 101) by skill-sbt\"}', NULL, '2026-01-05 00:24:33', '2026-01-05 00:24:33'),
('ee655de4-165b-4bc1-9962-02a095fe2a62', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 3 - Finance\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:17:45', '2025-12-30 02:17:45'),
('f13669eb-6080-485f-923d-a7a1cf0f20ce', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 6, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"7\",\"course_title\":\"Course\",\"amount\":0,\"message\":\"Course Purchased: Course by Student 8\"}', NULL, '2026-01-01 05:05:24', '2026-01-01 05:05:24'),
('f28ad239-ffa6-4029-bd9a-60d3fddbe134', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 24, '{\"title\":\"Low Quiz Score\",\"message\":\"You scored 0% in Quiz: Cyber Security - Basics. Revise the lessons and try again!\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"quiz\",\"icon\":\"bi-exclamation-triangle-fill\",\"color\":\"warning\"}', NULL, '2026-01-02 01:01:41', '2026-01-02 01:01:41'),
('f2b29814-a9f5-4821-b0bd-b0304914c39d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 2 - Python\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 04:22:11', '2025-12-30 04:22:11'),
('f35b686b-bafc-4594-a280-81a325c46c34', 'App\\Notifications\\CoursePurchaseNotification', 'App\\Models\\User', 7, '{\"user_id\":17,\"name\":\"Student 8\",\"photo\":\"http:\\/\\/127.0.0.1:8000\\/upload\\/user\\/69520d8e8418f.jpg\",\"course_id\":\"11\",\"course_title\":\"React Native - Masterclass by Instructor 3 (Vol 1)\",\"amount\":\"15\",\"message\":\"Course Purchased: React Native - Masterclass by Instructor 3 (Vol 1) by Student 8\"}', NULL, '2026-01-01 05:05:24', '2026-01-01 05:05:24'),
('f49a3f57-98cf-431e-9948-470b4f6fbe69', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Master Guide 1 - Python\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 04:21:27', '2025-12-30 04:21:27'),
('f4f1e731-5d14-4443-bd45-ae27af6a3fbd', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 12, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Cyber Security Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/8\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', '2025-12-30 04:06:14', '2025-12-30 01:38:16', '2025-12-30 04:06:14'),
('f63f3a1f-6ba5-44c8-a9c9-5ddcd540cabc', 'App\\Notifications\\InstructorRegistrationNotification', 'App\\Models\\User', 1, '{\"user_id\":24,\"name\":\"kenil bhut\",\"photo\":null,\"email\":\"kenilbhut789@gmail.com\",\"message\":\"New User Registered: kenil bhut\"}', NULL, '2025-12-30 00:16:49', '2025-12-30 00:16:49'),
('f7c1314b-e9e2-4047-9847-446eacdf7653', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 18, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 2 - Learning Python Step 2\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/23\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 04:21:41', '2025-12-30 04:21:41'),
('f7e3b7e5-e57b-43f4-8c01-25e2013c96e2', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Node.js Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/10\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-26 07:18:53', '2025-12-26 07:18:53'),
('fa383a99-f1b7-4921-b73f-271ddacddf8d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 25, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 1 - Learning Cyber Security Step 1\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/1\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2026-01-02 02:11:11', '2026-01-02 02:11:11'),
('fe9edac6-9994-46c4-a0d6-86ce54cbe3e9', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 15, '{\"title\":\"Lesson Completed! \\ud83c\\udf89\",\"message\":\"Great job! You completed: Lecture 3 - Learning Finance Step 3\",\"link\":\"http:\\/\\/127.0.0.1:8000\\/user\\/course-learn\\/7\",\"type\":\"course\",\"icon\":\"bi-check-circle-fill\",\"color\":\"success\"}', NULL, '2025-12-30 02:18:44', '2025-12-30 02:18:44');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_deadline` timestamp NULL DEFAULT NULL,
  `refunded` tinyint(1) NOT NULL DEFAULT 0,
  `instructor_payment_status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `user_id`, `course_id`, `instructor_id`, `course_title`, `price`, `created_at`, `updated_at`, `refund_deadline`, `refunded`, `instructor_payment_status`) VALUES
(1, 1, 12, 1, 5, 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 119, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(2, 2, 14, 1, 5, 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 119, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(3, 3, 16, 2, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 64, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(4, 4, 19, 2, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 64, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(5, 5, 16, 3, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 189, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(6, 6, 13, 3, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 3)', 189, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(7, 7, 19, 4, 5, 'Data Science - Masterclass by Instructor 1 (Vol 4)', 72, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(8, 8, 19, 4, 5, 'Data Science - Masterclass by Instructor 1 (Vol 4)', 72, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(9, 9, 16, 5, 5, 'Swift - Masterclass by Instructor 1 (Vol 5)', 88, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(10, 10, 19, 5, 5, 'Swift - Masterclass by Instructor 1 (Vol 5)', 88, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(11, 11, 13, 6, 6, 'Swift - Masterclass by Instructor 2 (Vol 1)', 149, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(12, 12, 12, 6, 6, 'Swift - Masterclass by Instructor 2 (Vol 1)', 149, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(13, 13, 13, 7, 6, 'Finance - Masterclass by Instructor 2 (Vol 2)', 122, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(14, 14, 15, 7, 6, 'Finance - Masterclass by Instructor 2 (Vol 2)', 122, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(15, 15, 12, 8, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 3)', 160, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(16, 16, 14, 8, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 3)', 160, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(17, 17, 15, 9, 6, 'Marketing - Masterclass by Instructor 2 (Vol 4)', 136, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(18, 18, 17, 9, 6, 'Marketing - Masterclass by Instructor 2 (Vol 4)', 136, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(19, 19, 15, 10, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 55, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(20, 20, 16, 10, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 55, '2025-12-29 00:20:28', '2025-12-29 00:20:28', NULL, 0, 0),
(21, 21, 13, 11, 7, 'React Native - Masterclass by Instructor 3 (Vol 1)', 108, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(22, 22, 16, 11, 7, 'React Native - Masterclass by Instructor 3 (Vol 1)', 108, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(23, 23, 16, 12, 7, 'Marketing - Masterclass by Instructor 3 (Vol 2)', 168, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(24, 24, 16, 12, 7, 'Marketing - Masterclass by Instructor 3 (Vol 2)', 168, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(25, 25, 15, 13, 7, 'Graphic Design - Masterclass by Instructor 3 (Vol 3)', 55, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(26, 26, 13, 13, 7, 'Graphic Design - Masterclass by Instructor 3 (Vol 3)', 55, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(27, 27, 17, 14, 7, 'Entrepreneurship - Masterclass by Instructor 3 (Vol 4)', 88, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(28, 28, 17, 14, 7, 'Entrepreneurship - Masterclass by Instructor 3 (Vol 4)', 88, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(29, 29, 10, 15, 7, 'Figma - Masterclass by Instructor 3 (Vol 5)', 74, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(30, 30, 10, 15, 7, 'Figma - Masterclass by Instructor 3 (Vol 5)', 74, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(31, 31, 13, 16, 8, 'Kotlin - Masterclass by Instructor 4 (Vol 1)', 140, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(32, 32, 17, 16, 8, 'Kotlin - Masterclass by Instructor 4 (Vol 1)', 140, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(33, 33, 13, 17, 8, 'Laravel - Masterclass by Instructor 4 (Vol 2)', 169, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(34, 34, 19, 17, 8, 'Laravel - Masterclass by Instructor 4 (Vol 2)', 169, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(35, 35, 13, 18, 8, 'Figma - Masterclass by Instructor 4 (Vol 3)', 190, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(36, 36, 18, 18, 8, 'Figma - Masterclass by Instructor 4 (Vol 3)', 190, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(37, 37, 19, 19, 8, 'Photoshop - Masterclass by Instructor 4 (Vol 4)', 120, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(38, 38, 13, 19, 8, 'Photoshop - Masterclass by Instructor 4 (Vol 4)', 120, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(39, 39, 12, 20, 8, 'Python - Masterclass by Instructor 4 (Vol 5)', 183, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(40, 40, 10, 20, 8, 'Python - Masterclass by Instructor 4 (Vol 5)', 183, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(41, 41, 13, 21, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 1)', 107, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(42, 42, 13, 21, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 1)', 107, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(43, 43, 16, 22, 9, 'React Native - Masterclass by Instructor 5 (Vol 2)', 173, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(44, 44, 11, 22, 9, 'React Native - Masterclass by Instructor 5 (Vol 2)', 173, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(45, 45, 18, 23, 9, 'Python - Masterclass by Instructor 5 (Vol 3)', 76, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(46, 46, 14, 23, 9, 'Python - Masterclass by Instructor 5 (Vol 3)', 76, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(47, 47, 11, 24, 9, 'Laravel - Masterclass by Instructor 5 (Vol 4)', 77, '2025-12-29 00:20:29', '2025-12-29 00:20:29', NULL, 0, 0),
(48, 48, 10, 24, 9, 'Laravel - Masterclass by Instructor 5 (Vol 4)', 77, '2025-12-29 00:20:30', '2025-12-29 00:20:30', NULL, 0, 0),
(49, 49, 19, 25, 9, 'Management - Masterclass by Instructor 5 (Vol 5)', 133, '2025-12-29 00:20:30', '2025-12-29 00:20:30', NULL, 0, 0),
(50, 50, 13, 25, 9, 'Management - Masterclass by Instructor 5 (Vol 5)', 133, '2025-12-29 00:20:30', '2025-12-29 00:20:30', NULL, 0, 0),
(51, 51, 11, 1, 5, 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 11, '2025-12-29 00:37:53', '2025-12-29 00:37:53', NULL, 0, 0),
(52, 51, 11, 1, 5, 'Course', 0, '2025-12-29 00:37:53', '2025-12-29 00:37:53', NULL, 0, 0),
(53, 52, 22, 17, 8, 'Laravel - Masterclass by Instructor 4 (Vol 2)', 35, '2025-12-29 05:06:19', '2025-12-29 05:06:19', NULL, 0, 0),
(54, 52, 22, 17, 8, 'Course', 0, '2025-12-29 05:06:19', '2025-12-29 05:06:19', NULL, 0, 0),
(55, 53, 12, 15, 7, 'Figma - Masterclass by Instructor 3 (Vol 5)', 14, '2025-12-29 14:08:21', '2025-12-29 14:08:21', NULL, 0, 0),
(56, 53, 12, 15, 7, 'Course', 0, '2025-12-29 14:08:22', '2025-12-29 14:08:22', NULL, 0, 0),
(57, 54, 24, 2, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 20, '2025-12-30 00:38:50', '2025-12-30 00:38:50', NULL, 0, 0),
(58, 54, 24, 2, 5, 'Course', 0, '2025-12-30 00:38:54', '2025-12-30 00:38:54', NULL, 0, 0),
(59, 55, 18, 11, 7, 'React Native - Masterclass by Instructor 3 (Vol 1)', 15, '2025-12-30 04:14:57', '2025-12-30 04:14:57', NULL, 0, 0),
(60, 55, 18, 11, 7, 'Course', 0, '2025-12-30 04:14:58', '2025-12-30 04:14:58', NULL, 0, 0),
(61, 56, 17, 12, 7, 'Marketing - Masterclass by Instructor 3 (Vol 2)', 35, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(62, 56, 17, 11, 7, 'React Native - Masterclass by Instructor 3 (Vol 1)', 15, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(63, 56, 17, 7, 6, 'Finance - Masterclass by Instructor 2 (Vol 2)', 32, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(64, 56, 17, 12, 7, 'Course', 0, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(65, 56, 17, 11, 7, 'Course', 0, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(66, 56, 17, 7, 6, 'Course', 0, '2026-01-01 05:05:24', '2026-01-01 05:05:24', NULL, 0, 0),
(67, 57, 14, 10, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 34, '2026-01-01 07:22:33', '2026-01-01 07:22:33', NULL, 0, 0),
(68, 57, 14, 17, 8, 'Laravel - Masterclass by Instructor 4 (Vol 2)', 35, '2026-01-01 07:22:33', '2026-01-01 07:22:33', NULL, 0, 0),
(69, 58, 24, 11, 7, 'React Native - Masterclass by Instructor 3 (Vol 1)', 15, '2026-01-01 22:47:18', '2026-01-01 22:47:18', NULL, 0, 0),
(70, 59, 24, 10, 6, 'Cyber Security - Masterclass by Instructor 2 (Vol 5)', 34, '2026-01-02 00:17:22', '2026-01-02 00:17:22', NULL, 0, 0),
(71, 60, 24, 2, 5, 'Kotlin - Masterclass by Instructor 1 (Vol 2)', 20, '2026-01-02 00:31:31', '2026-01-02 00:31:31', NULL, 0, 0),
(72, 61, 25, 1, 5, 'Cyber Security - Masterclass by Instructor 1 (Vol 1)', 11, '2026-01-02 02:09:25', '2026-01-02 02:09:25', NULL, 0, 0),
(73, 62, 26, 22, 9, 'React Native - Masterclass by Instructor 5 (Vol 2)', 12, '2026-01-02 04:18:50', '2026-01-02 04:18:50', NULL, 0, 0),
(74, 62, 26, 4, 5, 'Data Science - Masterclass by Instructor 1 (Vol 4)', 31, '2026-01-02 04:18:53', '2026-01-02 04:18:53', NULL, 0, 0),
(75, 63, 18, 21, 9, 'UI/UX - Masterclass by Instructor 5 (Vol 1)', 12, '2026-01-02 05:08:45', '2026-01-02 05:08:45', NULL, 0, 0),
(76, 64, 18, 25, 9, 'Management - Masterclass by Instructor 5 (Vol 5)', 150, '2026-01-02 05:52:20', '2026-01-02 05:52:20', NULL, 0, 0),
(77, 65, 18, 20, 8, 'Python - Masterclass by Instructor 4 (Vol 5)', 31, '2026-01-02 06:49:07', '2026-01-02 06:49:07', NULL, 0, 0),
(78, 66, 27, 16, 8, 'Kotlin - Masterclass by Instructor 4 (Vol 1)', 32, '2026-01-05 00:10:06', '2026-01-05 00:10:06', NULL, 0, 0),
(79, 67, 28, 6, 6, 'Swift - Masterclass by Instructor 2 (Vol 101)', 18, '2026-01-05 00:24:33', '2026-01-05 00:24:33', NULL, 0, 0);

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
(1, 'TRANS_ZXH5C44P22', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '119', 'Razorpay', 'INV_1766987428296', '04 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 'TRANS_VBAAOBDBK1', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '119', 'Razorpay', 'INV_1766987428348', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 'TRANS_OQZQKUL9TD', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '64', 'Razorpay', 'INV_1766987428114', '16 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 'TRANS_L53CVJ6VY8', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '64', 'Razorpay', 'INV_1766987428113', '09 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 'TRANS_RTHNOKUCHH', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '189', 'Razorpay', 'INV_1766987428429', '02 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 'TRANS_PT9JY8TFFE', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '189', 'Razorpay', 'INV_1766987428566', '23 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 'TRANS_FZR3OHZWCE', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '72', 'Razorpay', 'INV_1766987428588', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(8, 'TRANS_9RY1MC83EX', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '72', 'Razorpay', 'INV_1766987428547', '24 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(9, 'TRANS_XXZUZSW2SQ', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '88', 'Razorpay', 'INV_1766987428291', '27 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 'TRANS_EE38FL5UJL', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '88', 'Razorpay', 'INV_1766987428689', '21 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 'TRANS_GQEG6DCGT5', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '149', 'Razorpay', 'INV_1766987428211', '20 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 'TRANS_8TFGMGKHCZ', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '149', 'Razorpay', 'INV_1766987428528', '14 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(13, 'TRANS_Y7BNXZPFHE', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '122', 'Razorpay', 'INV_1766987428439', '23 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(14, 'TRANS_G9OPXA077H', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '122', 'Razorpay', 'INV_1766987428852', '17 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(15, 'TRANS_YWACYRDGFT', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '160', 'Razorpay', 'INV_1766987428357', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 'TRANS_EFOIYWAPM8', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '160', 'Razorpay', 'INV_1766987428395', '14 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 'TRANS_ZIK9XOKDZH', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '136', 'Razorpay', 'INV_1766987428799', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 'TRANS_NU8DUUWXEY', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '136', 'Razorpay', 'INV_1766987428122', '25 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 'TRANS_G59M2XOOMX', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766987428351', '21 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 'TRANS_6LFHVWCP4Q', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766987428612', '03 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 'TRANS_FHTNJPEBZV', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '108', 'Razorpay', 'INV_1766987429984', '03 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(22, 'TRANS_XIYK8MCNFD', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '108', 'Razorpay', 'INV_1766987429276', '14 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(23, 'TRANS_HX95B8ZFDM', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '168', 'Razorpay', 'INV_1766987429374', '06 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(24, 'TRANS_G7VA1WYAR9', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '168', 'Razorpay', 'INV_1766987429972', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(25, 'TRANS_Y0VWRLFXG9', 'Student 6', 'student6@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766987429835', '02 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(26, 'TRANS_HWVQLQMOYF', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '55', 'Razorpay', 'INV_1766987429269', '06 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(27, 'TRANS_8ADHHSNQXO', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '88', 'Razorpay', 'INV_1766987429918', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(28, 'TRANS_M4WVXN6HXX', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '88', 'Razorpay', 'INV_1766987429132', '15 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(29, 'TRANS_GBT9I4EUA5', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '74', 'Razorpay', 'INV_1766987429966', '01 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(30, 'TRANS_E67NDHU9XX', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '74', 'Razorpay', 'INV_1766987429477', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(31, 'TRANS_WOWR4MHXRL', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '140', 'Razorpay', 'INV_1766987429289', '21 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(32, 'TRANS_XOPOASE0KE', 'Student 8', 'student8@example.com', NULL, NULL, NULL, '140', 'Razorpay', 'INV_1766987429179', '28 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(33, 'TRANS_KS0DQFMKI2', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '169', 'Razorpay', 'INV_1766987429162', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(34, 'TRANS_HH3K087YQI', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '169', 'Razorpay', 'INV_1766987429169', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(35, 'TRANS_DF9IXMZOKQ', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '190', 'Razorpay', 'INV_1766987429260', '10 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(36, 'TRANS_RS9W9HRH2I', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '190', 'Razorpay', 'INV_1766987429766', '18 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(37, 'TRANS_KJIYCW9WLE', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '120', 'Razorpay', 'INV_1766987429598', '27 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(38, 'TRANS_EJNGPJDLQP', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '120', 'Razorpay', 'INV_1766987429352', '29 November 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(39, 'TRANS_0NBBRMSBOU', 'Student 3', 'student3@example.com', NULL, NULL, NULL, '183', 'Razorpay', 'INV_1766987429145', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(40, 'TRANS_VPPTT5YJMO', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '183', 'Razorpay', 'INV_1766987429187', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(41, 'TRANS_QFA5UNZKCZ', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '107', 'Razorpay', 'INV_1766987429431', '11 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 'TRANS_OMD9LUGIYT', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '107', 'Razorpay', 'INV_1766987429309', '19 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 'TRANS_CGN8LUULHV', 'Student 7', 'student7@example.com', NULL, NULL, NULL, '173', 'Razorpay', 'INV_1766987429945', '01 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(44, 'TRANS_LDV5J7RH7S', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '173', 'Razorpay', 'INV_1766987429229', '28 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(45, 'TRANS_YX9UOZKNTK', 'Student 9', 'student9@example.com', NULL, NULL, NULL, '76', 'Razorpay', 'INV_1766987429747', '13 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(46, 'TRANS_5ITDOJTRAE', 'Student 5', 'student5@example.com', NULL, NULL, NULL, '76', 'Razorpay', 'INV_1766987429516', '27 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(47, 'TRANS_4NZS63EUSM', 'Student 2', 'student2@example.com', NULL, NULL, NULL, '77', 'Razorpay', 'INV_1766987429502', '07 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(48, 'TRANS_G00MSQUWZX', 'Student 1', 'student1@example.com', NULL, NULL, NULL, '77', 'Razorpay', 'INV_1766987430210', '08 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(49, 'TRANS_AH7YEOPPLV', 'Student 10', 'student10@example.com', NULL, NULL, NULL, '133', 'Razorpay', 'INV_1766987430143', '24 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(50, 'TRANS_QCFG64WBII', 'Student 4', 'student4@example.com', NULL, NULL, NULL, '133', 'Razorpay', 'INV_1766987430257', '06 December 2025', NULL, NULL, 'confirmed', '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(51, 'pay_RxK403cYOoSOZx', 'demo user', 'student2@example.com', NULL, NULL, NULL, '11.00', 'razorpay', 'INV-69521AB999BDE', '2025-12-29', 'December', '2025', 'completed', '2025-12-29 00:37:53', '2025-12-29 00:37:53'),
(52, 'pay_RxOdXAfdBcl139', 'priya busa', 'pateldiya3126@gmail.com', NULL, NULL, NULL, '35.00', 'razorpay', 'INV-695259A3429F0', '2025-12-29', 'December', '2025', 'completed', '2025-12-29 05:06:19', '2025-12-29 05:06:19'),
(53, 'pay_RxXs99CjrsUHw3', 'priya busa', 'student3@example.com', NULL, NULL, NULL, '14.00', 'razorpay', 'INV-6952D8ADE5439', '2025-12-29', 'December', '2025', 'completed', '2025-12-29 14:08:21', '2025-12-29 14:08:21'),
(54, 'pay_Rxic9guZLjdUna', 'kenil bhut', 'kenilbhut789@gmail.com', NULL, NULL, NULL, '20', 'razorpay', 'INV-69536C72DD944', '2025-12-30', 'December', '2025', 'completed', '2025-12-30 00:38:50', '2025-12-30 00:38:50'),
(55, 'pay_RxmIJJYje5xNzn', 'student 9', 'student9@example.com', NULL, NULL, NULL, '15.00', 'razorpay', 'INV-69539F19DC913', '2025-12-30', 'December', '2025', 'completed', '2025-12-30 04:14:57', '2025-12-30 04:14:57'),
(56, 'pay_RyaE08vpgB8vgL', 'Bhakti Patel', 'student8@example.com', NULL, NULL, NULL, '82', 'razorpay', 'INV-69564DEC2572B', '2026-01-01', 'January', '2026', 'completed', '2026-01-01 05:05:24', '2026-01-01 05:05:24'),
(57, 'pay_RycYsTLwy7QZ8J', 'Bhakti Bhut', 'student5@example.com', NULL, NULL, NULL, '54', 'razorpay', 'INV-69566E1128F5F', '2026-01-01', 'January', '2026', 'completed', '2026-01-01 07:22:33', '2026-01-01 07:22:33'),
(58, 'pay_RysJij6X7gbysP', 'kenil bhut', 'kenilbhut789@gmail.com', NULL, NULL, NULL, '4', 'razorpay', 'INV-695746CDF3639', '2026-01-02', 'January', '2026', 'completed', '2026-01-01 22:47:17', '2026-01-01 22:47:17'),
(59, 'pay_RytqsotC6fubFi', 'kenil Bhut', 'kenilbhut789@gmail.com', NULL, NULL, NULL, '14', 'razorpay', 'INV-69575BEA944EA', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 00:17:22', '2026-01-02 00:17:22'),
(60, 'pay_Ryu5p4YnYdFSh9', 'Bhakti Bhut', 'kenilbhut789@gmail.com', NULL, NULL, NULL, '20', 'razorpay', 'INV-69575F3BB765F', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 00:31:31', '2026-01-02 00:31:31'),
(61, 'pay_RyvlG1zURsE4Tt', 'hinal soni', 'hinalsk2164@gmai.com', NULL, NULL, NULL, '11', 'razorpay', 'INV-6957762D9141F', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 02:09:25', '2026-01-02 02:09:25'),
(62, 'pay_RyxxxSNCaQYoNH', 'kelvi patel', 'kelvibarochiya@gmail.com', NULL, NULL, NULL, '28', 'razorpay', 'INV-69579482B09CF', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 04:18:50', '2026-01-02 04:18:50'),
(63, 'pay_RyyogjbAQ2kJDn', 'stud 9', 'student9@example.com', NULL, NULL, NULL, '2', 'razorpay', 'INV-6957A035B688B', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 05:08:45', '2026-01-02 05:08:45'),
(64, 'pay_RyzYibYwE47EHX', 'Bhakti Patel', 'student9@example.com', NULL, NULL, NULL, '100', 'razorpay', 'INV-6957AA6C0BE71', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 05:52:20', '2026-01-02 05:52:20'),
(65, 'pay_Rz0Whg7kLzYMxB', 'priya busa', 'student9@example.com', NULL, NULL, NULL, '31', 'razorpay', 'INV-6957B7BB52411', '2026-01-02', 'January', '2026', 'completed', '2026-01-02 06:49:07', '2026-01-02 06:49:07'),
(66, 'pay_S05KZZdGocCId5', 'hinal soni', '24mca096@gardividyapith.ac.in', NULL, NULL, NULL, '32', 'razorpay', 'INV-695B4EB650ECA', '2026-01-05', 'January', '2026', 'completed', '2026-01-05 00:10:06', '2026-01-05 00:10:06'),
(67, 'pay_S05ZqQUwJjLHuA', 'skill sb', 'skill-sbt@yopmail.com', NULL, NULL, NULL, '18', 'razorpay', 'INV-695B5219478ED', '2026-01-05', 'January', '2026', 'completed', '2026-01-05 00:24:33', '2026-01-05 00:24:33');

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
  `negative_marking_status` tinyint(1) NOT NULL DEFAULT 0,
  `negative_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `course_id`, `section_id`, `quiz_title`, `description`, `duration_minutes`, `pass_mark`, `negative_marking_status`, `negative_marks`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Quiz: Cyber Security - Basics', 'Test your knowledge on Cyber Security (Course ID: 1)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 2, 3, 'Quiz: Kotlin - Basics', 'Test your knowledge on Kotlin (Course ID: 2)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 4, 7, 'Quiz: Data Science - Basics', 'Test your knowledge on Data Science (Course ID: 4)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 6, 11, 'Quiz: Swift - Basics', 'Test your knowledge on Swift (Course ID: 6)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 7, 13, 'Quiz: Finance - Basics', 'Test your knowledge on Finance (Course ID: 7)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(8, 7, 14, 'Quiz: Finance - Advanced', 'Test your knowledge on Finance (Course ID: 7)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(9, 8, 15, 'Quiz: Cyber Security - Basics', 'Test your knowledge on Cyber Security (Course ID: 8)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 9, 17, 'Quiz: Marketing - Basics', 'Test your knowledge on Marketing (Course ID: 9)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 10, 19, 'Quiz: Cyber Security - Basics', 'Test your knowledge on Cyber Security (Course ID: 10)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 11, 21, 'Quiz: React Native - Basics', 'Test your knowledge on React Native (Course ID: 11)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(13, 11, 22, 'Quiz: React Native - Advanced', 'Test your knowledge on React Native (Course ID: 11)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(14, 12, 23, 'Quiz: Marketing - Basics', 'Test your knowledge on Marketing (Course ID: 12)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(15, 13, 25, 'Quiz: Graphic Design - Basics', 'Test your knowledge on Graphic Design (Course ID: 13)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(16, 14, 27, 'Quiz: Entrepreneurship - Basics', 'Test your knowledge on Entrepreneurship (Course ID: 14)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(17, 15, 29, 'Quiz: Figma - Basics', 'Test your knowledge on Figma (Course ID: 15)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(18, 16, 31, 'Quiz: Kotlin - Basics', 'Test your knowledge on Kotlin (Course ID: 16)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(19, 17, 33, 'Quiz: Laravel - Basics', 'Test your knowledge on Laravel (Course ID: 17)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(20, 17, 34, 'Quiz: Laravel - Advanced', 'Test your knowledge on Laravel (Course ID: 17)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(21, 18, 35, 'Quiz: Figma - Basics', 'Test your knowledge on Figma (Course ID: 18)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(22, 19, 37, 'Quiz: Photoshop - Basics', 'Test your knowledge on Photoshop (Course ID: 19)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(23, 20, 39, 'Quiz: Python - Basics', 'Test your knowledge on Python (Course ID: 20)', 10, 80, 1, 0.50, 1, 1, '2025-12-29 00:20:29', '2026-01-02 07:29:12'),
(24, 21, 41, 'Quiz: UI/UX - Basics', 'Test your knowledge on UI/UX (Course ID: 21)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(25, 22, 43, 'Quiz: React Native - Basics', 'Test your knowledge on React Native (Course ID: 22)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(26, 23, 45, 'Quiz: Python - Basics', 'Test your knowledge on Python (Course ID: 23)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(27, 24, 47, 'Quiz: Laravel - Basics', 'Test your knowledge on Laravel (Course ID: 24)', 10, 80, 0, 0.00, 1, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(28, 25, 49, 'Quiz: Management - Basics', 'Test your knowledge on Management (Course ID: 25)', 10, 80, 1, 1.00, 1, 1, '2025-12-29 00:20:30', '2026-01-02 06:43:44'),
(29, 25, 50, 'Quiz: Management - Advanced', 'Test your knowledge on Management (Course ID: 25)', 10, 80, 1, 0.25, 1, 1, '2025-12-29 00:20:30', '2026-01-02 06:40:30');

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
(1, 1, 'What is the primary role of Cyber Security? (Sec 1 | ID 1)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-29 00:20:28', '2026-01-02 00:42:25'),
(2, 1, 'True or False: Cyber Security is widely used in 2025. (Sec 1 | ID 1)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2026-01-02 00:42:29'),
(3, 1, 'Which feature is most important in Cyber Security? (Sec 1 | ID 1)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2026-01-02 00:42:33'),
(4, 2, 'What is the primary role of Kotlin? (Sec 1 | ID 2)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-29 00:20:28', '2026-01-02 00:41:39'),
(5, 2, 'True or False: Kotlin is widely used in 2025. (Sec 1 | ID 2)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2026-01-02 00:41:45'),
(6, 2, 'Which feature is most important in Kotlin? (Sec 1 | ID 2)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2026-01-02 00:41:50'),
(10, 4, 'What is the primary role of Data Science? (Sec 1 | ID 4)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-29 00:20:28', '2026-01-02 00:43:07'),
(11, 4, 'True or False: Data Science is widely used in 2025. (Sec 1 | ID 4)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2026-01-02 00:43:12'),
(12, 4, 'Which feature is most important in Data Science? (Sec 1 | ID 4)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2026-01-02 00:43:21'),
(16, 6, 'What is the primary role of Swift? (Sec 1 | ID 6)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 6, 'True or False: Swift is widely used in 2025. (Sec 1 | ID 6)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 6, 'Which feature is most important in Swift? (Sec 1 | ID 6)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 7, 'What is the primary role of Finance? (Sec 1 | ID 7)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 7, 'True or False: Finance is widely used in 2025. (Sec 1 | ID 7)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 7, 'Which feature is most important in Finance? (Sec 1 | ID 7)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(22, 8, 'What is the primary role of Finance? (Sec 2 | ID 7)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(23, 8, 'True or False: Finance is widely used in 2025. (Sec 2 | ID 7)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(24, 8, 'Which feature is most important in Finance? (Sec 2 | ID 7)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(25, 9, 'What is the primary role of Cyber Security? (Sec 1 | ID 8)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(26, 9, 'True or False: Cyber Security is widely used in 2025. (Sec 1 | ID 8)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(27, 9, 'Which feature is most important in Cyber Security? (Sec 1 | ID 8)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(28, 10, 'What is the primary role of Marketing? (Sec 1 | ID 9)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(29, 10, 'True or False: Marketing is widely used in 2025. (Sec 1 | ID 9)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(30, 10, 'Which feature is most important in Marketing? (Sec 1 | ID 9)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(31, 11, 'What is the primary role of Cyber Security? (Sec 1 | ID 10)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(32, 11, 'True or False: Cyber Security is widely used in 2025. (Sec 1 | ID 10)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(33, 11, 'Which feature is most important in Cyber Security? (Sec 1 | ID 10)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(34, 12, 'What is React Native mainly used for?', 'Web applications', 'Mobile applications', 'Desktop applications', 'Game engines', 'b', 'React Native is used to build mobile apps.', 0, '2025-12-29 00:20:29', '2026-01-01 23:06:42'),
(35, 12, 'Which language is used to write React Native components?', 'Java', 'Swift', 'JavaScript', 'Kotlin', 'c', 'React Native uses JavaScript.', 0, '2025-12-29 00:20:29', '2026-01-01 23:07:19'),
(36, 12, 'Which component is used to display text in React Native?', 'TextView', 'Label', 'Text', 'Span', 'c', 'Text is used to show text.', 0, '2025-12-29 00:20:29', '2026-01-01 23:08:12'),
(37, 13, 'In React Native, what is the main advantage of using useCallback()?', 'It memoizes the return value of a function', 'It prevents unnecessary re-renders by memoizing function references', 'It replaces useEffect()', 'It improves network request speed', 'b', 'useCallback() memoizes a function reference so that it doesn’t get recreated on every render, which helps prevent unnecessary re-renders—especially when passing functions as props.', 0, '2025-12-29 00:20:29', '2026-01-01 22:38:39'),
(38, 13, 'Which API is used in React Native to run heavy tasks off the main UI thread?', 'AsyncStorage', 'InteractionManager', 'NativeModules', 'WebWorker', 'c', 'NativeModules allows JavaScript to communicate with native code (Java/Kotlin/Swift), enabling heavy operations to run outside the main UI thread.', 0, '2025-12-29 00:20:29', '2026-01-01 22:39:30'),
(39, 13, 'What happens when key props are incorrectly assigned in a FlatList?', 'App crashes immediately', 'Performance improves', 'Incorrect item re-rendering may occur', 'List items are sorted automatically', 'c', 'Incorrect or duplicate key values confuse React’s reconciliation process, causing incorrect re-renders and performance issues in FlatList.', 0, '2025-12-29 00:20:29', '2026-01-01 22:40:14'),
(40, 14, 'What is the primary role of Marketing? (Sec 1 | ID 12)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(41, 14, 'True or False: Marketing is widely used in 2025. (Sec 1 | ID 12)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 14, 'Which feature is most important in Marketing? (Sec 1 | ID 12)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 15, 'What is the primary role of Graphic Design? (Sec 1 | ID 13)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(44, 15, 'True or False: Graphic Design is widely used in 2025. (Sec 1 | ID 13)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(45, 15, 'Which feature is most important in Graphic Design? (Sec 1 | ID 13)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(46, 16, 'What is the primary role of Entrepreneurship? (Sec 1 | ID 14)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(47, 16, 'True or False: Entrepreneurship is widely used in 2025. (Sec 1 | ID 14)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(48, 16, 'Which feature is most important in Entrepreneurship? (Sec 1 | ID 14)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(49, 17, 'What is the primary role of Figma? (Sec 1 | ID 15)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(50, 17, 'True or False: Figma is widely used in 2025. (Sec 1 | ID 15)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(51, 17, 'Which feature is most important in Figma? (Sec 1 | ID 15)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(52, 18, 'What is the primary role of Kotlin? (Sec 1 | ID 16)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(53, 18, 'True or False: Kotlin is widely used in 2025. (Sec 1 | ID 16)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(54, 18, 'Which feature is most important in Kotlin? (Sec 1 | ID 16)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(55, 19, 'What is the primary role of Laravel? (Sec 1 | ID 17)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(56, 19, 'True or False: Laravel is widely used in 2025. (Sec 1 | ID 17)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(57, 19, 'Which feature is most important in Laravel? (Sec 1 | ID 17)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(58, 20, 'What is the primary role of Laravel? (Sec 2 | ID 17)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(59, 20, 'True or False: Laravel is widely used in 2025. (Sec 2 | ID 17)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(60, 20, 'Which feature is most important in Laravel? (Sec 2 | ID 17)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(61, 21, 'What is the primary role of Figma? (Sec 1 | ID 18)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(62, 21, 'True or False: Figma is widely used in 2025. (Sec 1 | ID 18)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(63, 21, 'Which feature is most important in Figma? (Sec 1 | ID 18)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(64, 22, 'What is the primary role of Photoshop? (Sec 1 | ID 19)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(65, 22, 'True or False: Photoshop is widely used in 2025. (Sec 1 | ID 19)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(66, 22, 'Which feature is most important in Photoshop? (Sec 1 | ID 19)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(67, 23, 'What is the primary role of Python? (Sec 1 | ID 20)', 'Solving key problems in IT & Software', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in IT & Software', 0, '2025-12-29 00:20:29', '2026-01-02 06:50:35'),
(68, 23, 'True or False: Python is widely used in 2025. (Sec 1 | ID 20)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2026-01-02 06:50:39'),
(69, 23, 'Which feature is most important in Python? (Sec 1 | ID 20)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2026-01-02 06:50:43'),
(70, 24, 'What is the primary role of UI/UX? (Sec 1 | ID 21)', 'Solving key problems in Design', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in Design', 0, '2025-12-29 00:20:29', '2026-01-02 04:29:17'),
(71, 24, 'True or False: UI/UX is widely used in 2025. (Sec 1 | ID 21)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2026-01-02 04:29:20'),
(72, 24, 'Which feature is most important in UI/UX? (Sec 1 | ID 21)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2026-01-02 04:29:24'),
(73, 25, 'What is the primary role of React Native? (Sec 1 | ID 22)', 'Solving key problems in Mobile Development', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in Mobile Development', 0, '2025-12-29 00:20:29', '2026-01-02 04:23:02'),
(74, 25, 'True or False: React Native is widely used in 2025. (Sec 1 | ID 22)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:29', '2026-01-02 04:23:06'),
(75, 25, 'Which feature is most important in React Native? (Sec 1 | ID 22)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:29', '2026-01-02 04:23:11'),
(76, 26, 'What is Python?', 'Low-level language', 'High-level programming language', 'Machine language', 'Markup language', 'b', 'Python is easy to read and write, so it is high-level.', 0, '2025-12-29 00:20:29', '2025-12-30 05:53:02'),
(77, 26, 'Who developed Python?', 'Dennis Ritchie', 'James Gosling', 'Guido van Rossum', 'Bjarne Stroustrup', 'c', 'Guido van Rossum created Python.', 0, '2025-12-29 00:20:29', '2025-12-30 05:53:45'),
(78, 26, 'Is Python case-sensitive?', 'No', 'Yes', 'Sometimes', 'Depends on OS', 'b', 'name and Name are different.', 0, '2025-12-29 00:20:29', '2025-12-30 05:54:21'),
(79, 27, 'What is the primary role of Laravel? (Sec 1 | ID 24)', 'Solving key problems in Web Development', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in Web Development', 0, '2025-12-29 00:20:30', '2026-01-02 04:29:54'),
(80, 27, 'True or False: Laravel is widely used in 2025. (Sec 1 | ID 24)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:30', '2026-01-02 04:29:57'),
(81, 27, 'Which feature is most important in Laravel? (Sec 1 | ID 24)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:30', '2026-01-02 04:30:00'),
(82, 28, 'What is the primary role of Management? (Sec 1 | ID 25)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:30', '2026-01-02 06:03:45'),
(83, 28, 'True or False: Management is widely used in 2025. (Sec 1 | ID 25)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:30', '2026-01-02 06:03:49'),
(84, 28, 'Which feature is most important in Management? (Sec 1 | ID 25)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:30', '2026-01-02 06:03:52'),
(85, 29, 'What is the primary role of Management? (Sec 2 | ID 25)', 'Solving key problems in Business', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Solving key problems in Business', 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(86, 29, 'True or False: Management is widely used in 2025. (Sec 2 | ID 25)', 'True', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of True', 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(87, 29, 'Which feature is most important in Management? (Sec 2 | ID 25)', 'Flexibility', 'Alternative B', 'Alternative C', 'Alternative D', 'option_a', 'Conceptual explanation of Flexibility', 0, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(88, 28, 'que 4', 'ans a', 'ans b', 'ans c', 'ans d', 'a', NULL, 0, '2026-01-02 06:05:09', '2026-01-02 06:05:09'),
(89, 23, 'qua 4', 'a', 'b', 'c', 'd', 'a', NULL, 0, '2026-01-02 07:29:37', '2026-01-02 07:29:37');

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

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `user_id`, `quiz_id`, `total_questions`, `correct_answers`, `score`, `is_pass`, `started_at`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 3, 12, 3, 0, 0.00, 0, NULL, '2025-12-26 07:19:24', '2025-12-26 07:19:24', '2025-12-26 07:19:24'),
(2, 22, 19, 3, 0, 0.00, 0, NULL, '2025-12-29 05:11:51', '2025-12-29 05:11:51', '2025-12-29 05:11:51'),
(3, 22, 20, 3, 0, 0.00, 0, NULL, '2025-12-29 05:12:21', '2025-12-29 05:12:21', '2025-12-29 05:12:21'),
(4, 22, 20, 3, 0, 0.00, 0, NULL, '2025-12-29 05:12:33', '2025-12-29 05:12:33', '2025-12-29 05:12:33'),
(5, 22, 19, 3, 0, 0.00, 0, NULL, '2025-12-29 05:15:09', '2025-12-29 05:15:09', '2025-12-29 05:15:09'),
(6, 12, 9, 3, 0, 0.00, 0, NULL, '2025-12-30 01:35:32', '2025-12-30 01:35:32', '2025-12-30 01:35:32'),
(7, 12, 1, 3, 0, 0.00, 0, NULL, '2025-12-30 01:36:12', '2025-12-30 01:36:12', '2025-12-30 01:36:12'),
(8, 12, 1, 3, 0, 0.00, 0, NULL, '2025-12-30 01:45:39', '2025-12-30 01:45:39', '2025-12-30 01:45:39'),
(9, 15, 7, 3, 0, 0.00, 0, NULL, '2025-12-30 02:19:03', '2025-12-30 02:19:03', '2025-12-30 02:19:03'),
(10, 15, 8, 3, 0, 0.00, 0, NULL, '2025-12-30 02:19:20', '2025-12-30 02:19:20', '2025-12-30 02:19:20'),
(11, 15, 8, 3, 0, 0.00, 0, NULL, '2025-12-30 02:19:42', '2025-12-30 02:19:42', '2025-12-30 02:19:42'),
(12, 12, 1, 3, 0, 0.00, 0, NULL, '2025-12-30 03:10:15', '2025-12-30 03:10:15', '2025-12-30 03:10:15'),
(13, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:19:47', '2025-12-30 03:19:47', '2025-12-30 03:19:47'),
(14, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:19:47', '2025-12-30 03:19:47', '2025-12-30 03:19:47'),
(15, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:36:21', '2025-12-30 03:36:21', '2025-12-30 03:36:21'),
(16, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:37:25', '2025-12-30 03:37:25', '2025-12-30 03:37:25'),
(17, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:37:25', '2025-12-30 03:37:25', '2025-12-30 03:37:25'),
(18, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:42:20', '2025-12-30 03:42:20', '2025-12-30 03:42:20'),
(19, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:42:21', '2025-12-30 03:42:21', '2025-12-30 03:42:21'),
(20, 12, 6, 3, 0, 0.00, 0, NULL, '2025-12-30 03:42:22', '2025-12-30 03:42:22', '2025-12-30 03:42:22'),
(21, 18, 26, 3, 0, 0.00, 0, NULL, '2025-12-30 05:51:18', '2025-12-30 05:51:18', '2025-12-30 05:51:18'),
(22, 18, 26, 3, 3, 100.00, 1, NULL, '2025-12-30 05:55:10', '2025-12-30 05:55:10', '2025-12-30 05:55:10'),
(23, 17, 16, 3, 0, 0.00, 0, NULL, '2025-12-31 04:52:11', '2025-12-31 04:52:11', '2025-12-31 04:52:11'),
(24, 17, 16, 3, 0, 0.00, 0, NULL, '2025-12-31 04:55:32', '2025-12-31 04:55:32', '2025-12-31 04:55:32'),
(25, 17, 10, 3, 0, 0.00, 0, NULL, '2026-01-01 02:52:15', '2026-01-01 02:52:15', '2026-01-01 02:52:15'),
(26, 17, 14, 3, 0, 0.00, 0, NULL, '2026-01-01 05:18:52', '2026-01-01 05:18:52', '2026-01-01 05:18:52'),
(27, 24, 12, 3, 0, 0.00, 0, NULL, '2026-01-01 22:58:48', '2026-01-01 22:58:48', '2026-01-01 22:58:48'),
(28, 24, 13, 3, 2, 66.67, 0, NULL, '2026-01-01 23:03:33', '2026-01-01 23:03:33', '2026-01-01 23:03:33'),
(29, 24, 13, 3, 2, 66.67, 0, NULL, '2026-01-01 23:04:11', '2026-01-01 23:04:11', '2026-01-01 23:04:11'),
(30, 24, 13, 3, 3, 100.00, 1, NULL, '2026-01-01 23:04:30', '2026-01-01 23:04:30', '2026-01-01 23:04:30'),
(31, 24, 12, 3, 0, 0.00, 0, NULL, '2026-01-01 23:04:51', '2026-01-01 23:04:51', '2026-01-01 23:04:51'),
(32, 24, 12, 3, 3, 100.00, 1, NULL, '2026-01-01 23:08:45', '2026-01-01 23:08:45', '2026-01-01 23:08:45'),
(33, 24, 2, 3, 0, 0.00, 0, NULL, '2026-01-02 00:33:20', '2026-01-02 00:33:20', '2026-01-02 00:33:20'),
(34, 24, 2, 3, 0, 0.00, 0, NULL, '2026-01-02 00:34:30', '2026-01-02 00:34:30', '2026-01-02 00:34:30'),
(35, 24, 2, 3, 0, 0.00, 0, NULL, '2026-01-02 00:35:04', '2026-01-02 00:35:04', '2026-01-02 00:35:04'),
(36, 24, 2, 3, 0, 0.00, 0, NULL, '2026-01-02 00:39:33', '2026-01-02 00:39:33', '2026-01-02 00:39:33'),
(37, 24, 2, 3, 3, 100.00, 1, NULL, '2026-01-02 00:43:32', '2026-01-02 00:43:32', '2026-01-02 00:43:32'),
(38, 24, 11, 3, 0, 0.00, 0, NULL, '2026-01-02 01:00:30', '2026-01-02 01:00:30', '2026-01-02 01:00:30'),
(39, 24, 11, 3, 0, 0.00, 0, NULL, '2026-01-02 01:00:30', '2026-01-02 01:00:30', '2026-01-02 01:00:30'),
(40, 24, 11, 3, 0, 0.00, 0, NULL, '2026-01-02 01:01:41', '2026-01-02 01:01:41', '2026-01-02 01:01:41'),
(41, 24, 11, 3, 0, 0.00, 0, NULL, '2026-01-02 01:06:56', '2026-01-02 01:06:56', '2026-01-02 01:06:56'),
(42, 25, 1, 3, 3, 100.00, 1, NULL, '2026-01-02 02:10:44', '2026-01-02 02:10:44', '2026-01-02 02:10:44'),
(43, 26, 25, 3, 0, 0.00, 0, NULL, '2026-01-02 04:19:51', '2026-01-02 04:19:51', '2026-01-02 04:19:51'),
(44, 26, 25, 3, 3, 100.00, 1, NULL, '2026-01-02 04:23:31', '2026-01-02 04:23:31', '2026-01-02 04:23:31'),
(45, 18, 13, 3, 1, 33.33, 0, NULL, '2026-01-02 05:18:51', '2026-01-02 05:18:51', '2026-01-02 05:18:51'),
(46, 18, 28, 3, 0, 0.00, 0, NULL, '2026-01-02 06:03:21', '2026-01-02 06:03:21', '2026-01-02 06:03:21'),
(47, 18, 28, 4, 4, 100.00, 1, NULL, '2026-01-02 06:06:01', '2026-01-02 06:06:01', '2026-01-02 06:06:01'),
(48, 18, 28, 4, 4, 100.00, 1, NULL, '2026-01-02 06:41:48', '2026-01-02 06:41:48', '2026-01-02 06:41:48'),
(49, 18, 23, 3, 2, 58.33, 0, NULL, '2026-01-02 06:57:46', '2026-01-02 06:57:46', '2026-01-02 06:57:46'),
(50, 18, 23, 3, 2, 58.33, 0, NULL, '2026-01-02 06:57:47', '2026-01-02 06:57:47', '2026-01-02 06:57:47'),
(51, 18, 23, 3, 1, 0.00, 0, NULL, '2026-01-02 07:02:38', '2026-01-02 07:02:38', '2026-01-02 07:02:38'),
(52, 18, 23, 3, 2, 33.33, 0, NULL, '2026-01-02 07:12:33', '2026-01-02 07:12:33', '2026-01-02 07:12:33'),
(53, 18, 23, 3, 3, 100.00, 1, NULL, '2026-01-02 07:14:50', '2026-01-02 07:14:50', '2026-01-02 07:14:50'),
(54, 18, 23, 3, 1, 0.00, 0, NULL, '2026-01-02 07:17:19', '2026-01-02 07:17:19', '2026-01-02 07:17:19'),
(55, 18, 23, 3, 2, 33.33, 0, NULL, '2026-01-02 07:24:36', '2026-01-02 07:24:36', '2026-01-02 07:24:36'),
(56, 18, 23, 3, 1, 0.00, 0, NULL, '2026-01-02 07:27:07', '2026-01-02 07:27:07', '2026-01-02 07:27:07'),
(57, 18, 23, 4, 2, 25.00, 0, NULL, '2026-01-02 07:30:29', '2026-01-02 07:30:29', '2026-01-02 07:30:29'),
(58, 24, 11, 3, 0, 0.00, 0, NULL, '2026-01-03 00:00:37', '2026-01-03 00:00:37', '2026-01-03 00:00:37'),
(59, 12, 17, 3, 0, 0.00, 0, NULL, '2026-01-05 00:42:28', '2026-01-05 00:42:28', '2026-01-05 00:42:28');

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
(1, 1, 15, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(2, 1, 16, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 1, 11, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 2, 14, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 2, 13, 'Excellent course! Very clear and easy to follow.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 2, 18, 'Amazing quality. The production value is great.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 4, 17, 'The pacing was a bit slow for me.', 2, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 4, 13, 'I learned so much in just a few days. Great pace!', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 4, 13, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 6, 11, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 6, 11, 'Excellent course! Very clear and easy to follow.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 6, 12, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 7, 13, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 7, 16, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(21, 7, 17, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(22, 8, 15, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(23, 8, 15, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(24, 8, 19, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(25, 9, 12, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(26, 9, 17, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(27, 9, 11, 'Some topics felt a bit rushed.', 2, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(28, 10, 19, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(29, 10, 11, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(30, 10, 18, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(31, 11, 11, 'I had some trouble accessing the materials at first.', 2, 0, '2025-12-29 00:20:29', '2026-01-01 22:35:16'),
(32, 11, 18, 'Some topics felt a bit rushed.', 2, 0, '2025-12-29 00:20:29', '2026-01-01 22:35:23'),
(33, 11, 17, 'Some topics felt a bit rushed.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(34, 12, 10, 'Some topics felt a bit rushed.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(35, 12, 15, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(36, 12, 13, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(37, 13, 10, 'Loved the live sessions. They really helped clear my doubts.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(38, 13, 12, 'Some topics felt a bit rushed.', 2, 0, '2025-12-29 00:20:29', '2026-01-01 22:35:32'),
(39, 13, 10, 'The instructor is very knowledgeable and the content is top-notch.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(40, 14, 15, 'Perfect for beginners. The examples are very helpful.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(41, 14, 19, 'Amazing quality. The production value is great.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(42, 14, 10, 'I wish there were more advanced examples.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(43, 15, 19, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(44, 15, 14, 'I wish there were more advanced examples.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(45, 15, 11, 'Loved the live sessions. They really helped clear my doubts.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(46, 16, 18, 'Amazing quality. The production value is great.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(47, 16, 13, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(48, 16, 11, 'Excellent course! Very clear and easy to follow.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(49, 17, 18, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(50, 17, 17, 'Clear explanations and very practical assignments.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(51, 17, 13, 'Clear explanations and very practical assignments.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(52, 18, 10, 'The audio quality could be improved in some sections.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(53, 18, 10, 'Loved the live sessions. They really helped clear my doubts.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(54, 18, 17, 'I had some trouble accessing the materials at first.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(55, 19, 19, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(56, 19, 11, 'The instructor is very knowledgeable and the content is top-notch.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(57, 19, 13, 'I wish there were more advanced examples.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(58, 20, 11, 'I had some trouble accessing the materials at first.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(59, 20, 19, 'The audio quality could be improved in some sections.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(60, 20, 11, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(61, 21, 18, 'Best investment I have made this year. Highly recommended.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(62, 21, 14, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(63, 21, 13, 'The pacing was a bit slow for me.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(64, 22, 11, 'Best investment I have made this year. Highly recommended.', 4, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(65, 22, 17, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(66, 22, 12, 'Perfect for beginners. The examples are very helpful.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(67, 23, 13, 'Some topics felt a bit rushed.', 2, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(68, 23, 10, 'Loved the live sessions. They really helped clear my doubts.', 5, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(69, 23, 13, 'Some topics felt a bit rushed.', 3, 1, '2025-12-29 00:20:29', '2025-12-29 00:20:29'),
(70, 24, 12, 'I learned so much in just a few days. Great pace!', 4, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(71, 24, 11, 'I learned so much in just a few days. Great pace!', 4, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(72, 24, 10, 'I learned so much in just a few days. Great pace!', 5, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(73, 25, 17, 'Clear explanations and very practical assignments.', 4, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(74, 25, 15, 'Excellent course! Very clear and easy to follow.', 4, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(75, 25, 12, 'The quiz questions were a bit confusing.', 2, 1, '2025-12-29 00:20:30', '2025-12-29 00:20:30'),
(76, 11, 24, 'best teacher', 5, 0, '2026-01-01 22:54:00', '2026-01-01 22:54:00'),
(77, 22, 26, 'best cource', 5, 0, '2026-01-02 04:31:00', '2026-01-02 04:31:00'),
(78, 25, 18, 'best teacher', 5, 1, '2026-01-02 06:01:30', '2026-01-02 06:02:01');

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
('WAKmdDCErxWr9xqP1Xia1eaeSxEocj1XSzHz5mQR', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieXhWc29BNlpwMDdFWXhGWVB0U2ZFcVp6UWF2RklDNVlZdWZvS2dNUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEyO30=', 1767594358),
('WRd2U3ItcIEUn8gJlsvhCJz6j50SKpCMcnBlnIll', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTm1GWUpBNWRJUExDTEJQdERpeHJ6U3ExQ1N5c0lRVEJGbGp0RkxZbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnN0cnVjdG9yL2NvdXJzZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1767593452),
('Zpsyik25qWB248Jng3cZrDlsbKSXFk89SLONehox', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQTZKc2FSTjB3NFJEcmxnOWVaZ2hTb1I1RWdXWTdISldCc21VcjdvSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1767592798);

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
(1, 'SkillPoint - Online Learning Management System', '© 2025 SkillPoint. All Rights Reserved.', 'Empower your future with quality online education.', 'http://127.0.0.1:8000/upload/site-info/69525721718be.png', 'http://127.0.0.1:8000/upload/site-info/6952572171b81.png', '123 Learning Ave, Knowledge City', '7016370260', 'info@skillpoint.com', 'https://facebook.com/skillpoint', 'https://twitter.com/skillpoint', 'https://instagram.com/skillpoint', 'https://linkedin.com/company/skillpoint', '2025-12-26 04:59:26', '2026-01-04 23:41:56');

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
(22, 'Unlock Your Potential with Our Expert Courses', 'Join over 10,000 students learning from top professionals.', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'http://127.0.0.1:8000/upload/slider/6953529629fcd.jpg', '2025-12-29 00:20:30', '2025-12-29 22:48:30');

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
(1, 1, 'React', 'react', '2025-12-29 00:20:28', '2025-12-29 03:14:18'),
(2, 1, 'Laravel', 'laravel', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(3, 1, 'Node.js', 'nodejs', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(4, 1, 'Vue.js', 'vuejs', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(5, 2, 'Flutter', 'flutter', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(6, 2, 'React Native', 'react-native', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(7, 2, 'Swift', 'swift', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(8, 2, 'Kotlin', 'kotlin', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(9, 3, 'UI/UX', 'uiux', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(10, 3, 'Graphic Design', 'graphic-design', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(11, 3, 'Figma', 'figma', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(12, 3, 'Photoshop', 'photoshop', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(13, 4, 'Finance', 'finance', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(14, 4, 'Marketing', 'marketing', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(15, 4, 'Entrepreneurship', 'entrepreneurship', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(16, 4, 'Management', 'management', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(17, 5, 'Cyber Security', 'cyber-security', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(18, 5, 'Cloud Computing', 'cloud-computing', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(19, 5, 'Data Science', 'data-science', '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, 5, 'Python', 'python', '2025-12-29 00:20:28', '2025-12-29 00:20:28');

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
(2, NULL, NULL, 'Instructor User', 'instructor@example.com', NULL, '$2y$12$PIw65qxHU7l2p3oTDmwRDe/yjxJztgIK.2Cicxs/aDzeuM/xY59Ku', 'http://127.0.0.1:8000/upload/user/694e79c5dcd4b.jpg', '0987654321', '456 Instructor Avenue', 'instructor', '0', NULL, NULL, NULL, NULL, 'Chennai', 'Tamil Nadu', '5+ years experience in teaching University', 'male', NULL, '2025-12-26 04:55:24', '2025-12-30 05:11:29'),
(3, NULL, NULL, 'Regular User', 'user@example.com', NULL, '$2y$12$Gw73DZs0IVJxFynZLrlKRO9LsAtyheHFxJxDnUvuDVjylh68al8QO', NULL, '5555555555', '789 User Lane', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-26 04:55:24', '2025-12-26 04:55:24'),
(5, NULL, NULL, 'Instructor 1', 'instructor1@example.com', NULL, '$2y$12$B69yczX1TXWcxMD9rmgHIeh2JGeVBEaT/n6Is18csMxAGdB4DWppy', 'http://127.0.0.1:8000/upload/user/694e7985841da.png', '959-678-8904', '8327 Erna Route Apt. 088\nPort Sallystad, DE 52703-6256', 'instructor', '1', 'Id omnis sunt qui vero animi. Consectetur et aut laborum voluptatem nihil. Vitae delectus ab minima nihil. Tempore ut ipsam ipsam veniam soluta ut.', NULL, NULL, NULL, 'Bengaluru', 'Karnataka', '5+ years experience in teaching Corporate Trainer', 'female', NULL, '2025-12-29 00:20:24', '2025-12-29 00:20:24'),
(6, NULL, NULL, 'Instructor 2', 'instructor2@example.com', NULL, '$2y$12$fY9pQ2YG6x.s6JnNM7VzSe3/CgKc.aFMOUvJjCjRwWQtJZt8Y1sY.', 'http://127.0.0.1:8000/upload/user/6952470e8e628.jpg', '9998979695', '177 Kuhic StreetEverardoport, KY 48252', 'instructor', '1', 'Senior Instructor with master-level expertise, specializing in professional training and skill-based learning.', NULL, NULL, NULL, 'New Delhi', 'India', '5+ years experience in teaching Plating Operator', 'male', NULL, '2025-12-29 00:20:24', '2026-01-04 22:59:31'),
(7, NULL, NULL, 'Instructor 3', 'instructor3@example.com', NULL, '$2y$12$wlhv3ZZCsMuMRVzkKWTIdOru.7yYePhfS8hOJlyVnV1Dt68C.Z9P6', 'http://127.0.0.1:8000/upload/user/694e74da1af37.jpg', '+1-743-401-1988', '536 Smith Oval Apt. 458\nMaryammouth, MA 80904', 'instructor', '1', 'Velit aperiam cum incidunt et ab ut. Labore aperiam fuga labore fugiat accusamus totam.', NULL, NULL, NULL, 'Pune', 'India', '5+ years experience in teaching Landscaper', 'female', NULL, '2025-12-29 00:20:24', '2025-12-29 00:20:24'),
(8, NULL, NULL, 'Instructor 4', 'instructor4@example.com', NULL, '$2y$12$L4rKral2Wje4NvksYbenY.7sMx1Nsk5Ce6ZDERFMepuuiT2yZxb72', 'http://127.0.0.1:8000/upload/user/694e7748c5d45.jpg', '(530) 718-5049', '792 Justice Dam Suite 959\nKirlinshire, HI 48311', 'instructor', '1', 'Et minima sit animi repudiandae molestiae. Possimus at hic exercitationem fugit totam.', NULL, NULL, NULL, 'Paris', 'France', '5+ years experience in teaching Silversmith', 'male', NULL, '2025-12-29 00:20:25', '2026-01-04 22:57:30'),
(9, NULL, NULL, 'Instructor 5', 'instructor5@example.com', NULL, '$2y$12$2HQcBAdIVJTTEiHTPPI3f.qUcil2.FZApjjjoGKHwsLXDE5aVA7X2', 'http://127.0.0.1:8000/upload/user/694e6fcb3fe0a.jpg', '+1.539.489.4455', '49419 O\'Keefe Wells\nNew Lauryside, IN 89362-0796', 'instructor', '1', 'Esse qui natus molestias voluptatum. Quas vero in omnis est deleniti. Nihil eligendi libero voluptatum eum aut expedita.', NULL, NULL, NULL, 'Rajkot', 'India', '5+ years experience in teaching Financial Analyst', 'male', NULL, '2025-12-29 00:20:25', '2026-01-02 05:30:01'),
(10, NULL, NULL, 'Student 1', 'student1@example.com', NULL, '$2y$12$sSHO7E8CvL8VqwuvO361muwrhVswtfmaXe3jV.RO7otbmtUHL5ZnS', 'http://127.0.0.1:8000/upload/user/694e7985841da.png', '+1-901-682-7125', '45732 Dalton Mills\nSouth Magnus, AL 30704-4571', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:25', '2025-12-29 00:20:25'),
(11, NULL, NULL, 'Student 2', 'student2@example.com', NULL, '$2y$12$nGyZzqpqmD3VTF3.GGRl0uMhV73ieWf7XU383TSFIDVM0E68HC.Yy', 'http://127.0.0.1:8000/upload/user/69520e13778f5.jpg', '+1.425.452.8528', '4903 Cheyenne Place Apt. 874\nEast Madalinefurt, NY 13332', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:25', '2025-12-29 00:20:25'),
(12, NULL, NULL, 'Student 3', 'student3@example.com', NULL, '$2y$12$CDQARjMKOlPpNhaiUUyb3ewqFzmIw28n6L4f//ZguegUA0Qd6tU0O', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '+1-747-969-3609', '84371 Justice Haven\nPort Andre, AL 84952', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:26', '2025-12-29 00:20:26'),
(13, NULL, NULL, 'Student 4', 'student4@example.com', NULL, '$2y$12$MZ6/0dVgfetTtng3KGNNle3IUgIJq/YWAdtNsnE1/nHGN4YP9Laqi', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '1-586-722-1986', '6009 Irma Crescent Suite 568\nJanellebury, WY 96109-9062', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:26', '2025-12-29 00:20:26'),
(14, NULL, NULL, 'Student 5', 'student5@example.com', NULL, '$2y$12$ySJOJ5DFaOsTFMkgBLrQBeXcvSV8YNeypeJoI755o.caKUBmvIvmC', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '+1-352-471-8416', '709 Wilbert Square\nJacobsport, NJ 80631', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:26', '2025-12-29 00:20:26'),
(15, NULL, NULL, 'Student 6', 'student6@example.com', NULL, '$2y$12$uWQL3jkPinw7LkOIwhbPQOyWZ9AcI5L2z6mpD.lwuQ7cLVO6GhKDW', 'http://127.0.0.1:8000/upload/user/69520d32ae167.png', '1-870-515-1247', '48765 Koss Courts\nNorth Derrickville, NM 60552', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:27', '2025-12-29 00:20:27'),
(16, NULL, NULL, 'Student 7', 'student7@example.com', NULL, '$2y$12$WM20U3R98oxqFTX6K38I9u3t8gVbQC34ouGM9HkeXIcJxW2VMgcYy', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '1-321-843-5906', '9758 Margarete Stravenue\nPort Maye, AL 36442', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:27', '2025-12-29 00:20:27'),
(17, NULL, NULL, 'Student 8', 'student8@example.com', NULL, '$2y$12$3DsJjgESo5J9XcLyl82Eauj1Bugty980H8O2HNkgrwGPGH40XWWw.', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '205.696.7312', '1558 Austen Station\r\nCamillamouth, NY 38407-8039', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:27', '2026-01-01 02:45:10'),
(18, NULL, NULL, 'Student 9', 'student9@example.com', NULL, '$2y$12$YW4d6z08Jr1Or0qj.2OGSu56OfNP3nnCBLCyr6OayXlA50pdWjkim', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', '1-703-275-2118', '406 Breitenberg Light Suite 620\nNew Destin, PA 88388-8059', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:27', '2025-12-29 00:20:27'),
(19, NULL, NULL, 'Student 10', 'student10@example.com', NULL, '$2y$12$wp0yNNf9VVoWv3dG8mUx4e8m7bgj2RdkD1F1W5Ecwv4W4Bj/.9scy', 'http://127.0.0.1:8000/upload/user/69520dd4d4d1b.jpg', '(906) 999-4646', '703 Novella Cove Apt. 258\nErnestineland, GA 43251', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 00:20:28', '2025-12-29 00:20:28'),
(20, NULL, NULL, 'yagnik desai', 'mr.yagnikpatel11@gmail.com', NULL, '$2y$12$9EvluUBkmDV3XMpTWO241uyW/W4nPDNkgmLcz/EZmIZKurEpzDyAK', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-28 04:53:15', '2025-12-28 04:53:15'),
(21, NULL, NULL, 'yagnik patel', 'mr.yagnik11@gmail.com', NULL, '$2y$12$gHBBpJEbzfoEU18jQWJ0JOSQCZv2WrQYz9UcYIQSsVOcbJ..c.vfO', 'http://127.0.0.1:8000/upload/user/69520d8e8418f.jpg', NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-28 05:06:06', '2025-12-28 05:06:06'),
(22, NULL, NULL, 'diya patel', 'pateldiya3126@gmail.com', NULL, '$2y$12$fjcUcpAxkElOQRF9Mgc1dObAkKqjz2OmyJW8jLUYBP2euI0DDD0ja', 'http://127.0.0.1:8000/upload/user/695258afcd836.png', '9988776655', 'Kotecha chowk, kalavad road, Rajkot\r\noiudbhfdcvn c', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-29 04:57:02', '2025-12-29 05:02:15'),
(24, NULL, NULL, 'kenil bhut', 'kenilbhut789@gmail.com', NULL, '$2y$12$HW8vr8afvYODria1Z8geo.eJNdDGSqfQXPQnSAsc3FZG6AWbXbM9y', 'http://127.0.0.1:8000/upload/user/69536c272d0f3.png', '7575816690', '93 SUN TOWN STREET', 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2025-12-30 00:16:48', '2026-01-04 23:20:26'),
(25, NULL, NULL, 'Hinal soni', 'hinalsk2164@gmai.com', NULL, '$2y$12$KTyBhCiuNdrXw9PlXCs5oOc.1lf52GA8MmV5/ECEZ3yE/l9YO1say', NULL, NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2026-01-02 02:05:34', '2026-01-02 02:05:34'),
(26, NULL, NULL, 'kelvi', 'kelvibarochiya@gmail.com', NULL, '$2y$12$c.c8wpZ/arIWbzUCYZLSceD0omTSksWGhSZanJYboIcPwcl.UzfQq', 'http://127.0.0.1:8000/upload/user/6957984aaaaba.png', NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2026-01-02 03:25:48', '2026-01-02 04:34:58'),
(27, NULL, NULL, 'Hinal soni', '24mca096@gardividyapith.ac.in', NULL, '$2y$12$mm.wx4nZm6Rv4Bhx0F0k5eguMzn1zdieGTcVQ8MtO3GWUJqlQYhNC', NULL, NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2026-01-05 00:06:28', '2026-01-05 00:06:28'),
(28, NULL, NULL, 'skill-sbt', 'skill-sbt@yopmail.com', NULL, '$2y$12$quKt0ZSNG9OS/yC.0wpssOaFCDLx25nyh5SCv7oGkenmVrJ7c2nfe', NULL, NULL, NULL, 'user', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, '2026-01-05 00:13:30', '2026-01-05 00:13:30');

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
(5, 3, 2, '2025-12-26 07:34:20', '2025-12-26 07:34:20'),
(15, 12, 15, '2025-12-29 14:02:34', '2025-12-29 14:02:34'),
(17, 24, 2, '2025-12-30 00:37:57', '2025-12-30 00:37:57'),
(18, 12, 1, '2025-12-30 01:12:10', '2025-12-30 01:12:10'),
(19, 18, 20, '2025-12-30 04:09:47', '2025-12-30 04:09:47'),
(20, 17, 21, '2025-12-31 04:57:14', '2025-12-31 04:57:14'),
(21, 17, 12, '2025-12-31 04:59:05', '2025-12-31 04:59:05'),
(22, 17, 6, '2026-01-01 01:24:29', '2026-01-01 01:24:29'),
(23, 17, 9, '2026-01-01 02:50:02', '2026-01-01 02:50:02'),
(24, 17, 25, '2026-01-01 02:58:31', '2026-01-01 02:58:31'),
(25, 14, 6, '2026-01-01 06:41:07', '2026-01-01 06:41:07'),
(26, 26, 22, '2026-01-02 04:25:53', '2026-01-02 04:25:53'),
(28, 18, 9, '2026-01-02 05:20:47', '2026-01-02 05:20:47');

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
  ADD KEY `certificates_course_id_foreign` (`course_id`),
  ADD KEY `idx_certificates_user_course` (`user_id`,`course_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_courses_status` (`status`),
  ADD KEY `idx_courses_category` (`category_id`),
  ADD KEY `idx_courses_instructor` (`instructor_id`),
  ADD KEY `idx_courses_status_category` (`status`,`category_id`),
  ADD KEY `idx_courses_slug` (`course_name_slug`);

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
  ADD KEY `course_lectures_section_id_foreign` (`section_id`),
  ADD KEY `idx_lectures_section` (`section_id`),
  ADD KEY `idx_lectures_course` (`course_id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_materials_course_id_foreign` (`course_id`),
  ADD KEY `course_materials_section_id_foreign` (`section_id`),
  ADD KEY `idx_materials_section` (`section_id`),
  ADD KEY `idx_materials_course` (`course_id`);

--
-- Indexes for table `course_notes`
--
ALTER TABLE `course_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_notes_user_id_foreign` (`user_id`),
  ADD KEY `course_notes_course_id_foreign` (`course_id`),
  ADD KEY `course_notes_lecture_id_foreign` (`lecture_id`),
  ADD KEY `idx_notes_user_course` (`user_id`,`course_id`),
  ADD KEY `idx_notes_lecture` (`lecture_id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_course_content_unique` (`user_id`,`course_id`,`content_type`,`content_id`),
  ADD KEY `course_progress_course_id_foreign` (`course_id`),
  ADD KEY `idx_progress_user_course` (`user_id`,`course_id`),
  ADD KEY `idx_progress_completed` (`user_id`,`course_id`,`is_completed`),
  ADD KEY `idx_progress_content` (`content_type`,`content_id`);

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
  ADD KEY `course_sections_course_id_foreign` (`course_id`),
  ADD KEY `idx_sections_course` (`course_id`),
  ADD KEY `idx_sections_course_order` (`course_id`,`display_order`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_user_id_course_id_unique` (`user_id`,`course_id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`),
  ADD KEY `idx_enrollments_user_course` (`user_id`,`course_id`),
  ADD KEY `idx_enrollments_user_status` (`user_id`,`status`),
  ADD KEY `idx_enrollments_date` (`enrolled_at`);

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
  ADD KEY `quizzes_section_id_foreign` (`section_id`),
  ADD KEY `idx_quizzes_section` (`section_id`),
  ADD KEY `idx_quizzes_course` (`course_id`);

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
  ADD KEY `quiz_results_quiz_id_foreign` (`quiz_id`),
  ADD KEY `idx_quiz_results_user_quiz` (`user_id`,`quiz_id`),
  ADD KEY `idx_quiz_results_date` (`completed_at`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `idx_reviews_status` (`status`),
  ADD KEY `idx_reviews_status_rating` (`status`,`rating`),
  ADD KEY `idx_reviews_course` (`course_id`),
  ADD KEY `idx_reviews_user` (`user_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `idx_users_role` (`role`),
  ADD KEY `idx_users_role_status` (`role`,`status`),
  ADD KEY `idx_users_email` (`email`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `course_goals`
--
ALTER TABLE `course_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `course_lectures`
--
ALTER TABLE `course_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `course_notes`
--
ALTER TABLE `course_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `course_questions`
--
ALTER TABLE `course_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
