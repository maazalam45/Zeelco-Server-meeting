-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2021 at 09:42 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zeelco`
--

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `admin`, `time`, `status`) VALUES
(1, 1, '2021-08-05 16:21:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `peer_id` varchar(500) NOT NULL,
  `Screen_share_peer` text DEFAULT NULL,
  `socket_id` text DEFAULT NULL,
  `Sharing_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `meeting_id`, `time`, `status`, `peer_id`, `Screen_share_peer`, `socket_id`, `Sharing_status`) VALUES
(54, 1, 1, '2021-09-07 12:58:57', 1, '0bccedd7-e83f-45f1-9737-f2c16a0cd260', 'e47c703c-d525-47c2-b2fc-bb8f5c5c9ac9', 'KG6_AQRIt-3w5GtOAAAF', 0),
(55, 2, 1, '2021-09-07 13:07:37', 0, 'd0ebddad-3182-4fd0-bc33-599572214ad4', 'd9e542e9-39aa-4ee7-b53b-4bf89b92c911', 'w3hPLIOrXmY7Rx89AAAQ', 0),
(56, 12, 1, '2021-09-11 09:37:48', 0, '9624468c-86c0-4f2a-8320-e528d62753b1', '6ad86e62-5a8e-4397-a875-78889b7a090b', 'P21ZEvh6HfD_qMbmAAAb', 0),
(57, 2, 2, '2021-09-21 12:54:09', 0, 'd0ebddad-3182-4fd0-bc33-599572214ad4', 'd9e542e9-39aa-4ee7-b53b-4bf89b92c911', 'w3hPLIOrXmY7Rx89AAAQ', 0),
(58, 3, 1, '2021-09-21 14:36:57', 0, 'd0693434-a66e-4534-9802-7318ac52f310', '1611df6b-434c-4e44-892e-9ad0c49dd25b', '00H71WfINKROzFftAACr', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` bigint(20) DEFAULT 1,
  `app_language` bigint(20) NOT NULL DEFAULT 1,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizard_is_complete` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `profile_pic`, `account_type`, `currency`, `app_language`, `email`, `client_id`, `wizard_is_complete`, `email_verified_at`, `password`, `remember_token`, `account_status`, `created_at`, `updated_at`) VALUES
(1, 'Akshay kumar', 'avatar.png', 'tutor', 1, 1, 'maazkaalam@gmail.com', NULL, 'no', NULL, '$2y$10$fv4X4tDCr5PfgFM65qjjveZJKLm4n473UalntjETIVX3MC0fbuNb2', NULL, 'not_approved', '2021-08-11 18:26:58', '2021-08-11 18:26:58'),
(2, 'Rohit sharma', 'avatar.png', 'student', 1, 1, 'maazalam@gmail.com', NULL, 'no', NULL, '$2y$10$yRGHAbHnGH05wYtcy0YSq.4WcBKFdlYf4HjKZn0fw6BvdUF7RuGve', NULL, 'not_approved', '2021-08-11 18:31:15', '2021-08-11 18:31:15'),
(74, 'Hassan', '603878b6904355b483110205ab7cd49b.jpg', 'student', 1, 2, 'zain@gmail.com', NULL, 'no', NULL, '$2y$10$VRmJW8.zQalF2gt/UG9YNuLKSKc1BYJ/StPVW99b5HwxPejfPlWaC', NULL, 'approved', '2021-06-05 08:09:07', '2021-08-12 16:11:02'),
(75, 'zainmalik', 'avatar.jpg', 'super_admin', 1, 1, 'zain1000@gmail.com', NULL, 'no', NULL, '$2y$10$GVWamy64tzp9qN9F1PNC/uISADE4sBvcVrzHwX1Tmh4XF5eY8iQNe', NULL, 'approved', '2021-06-07 01:22:22', '2021-06-07 01:23:27'),
(76, 'nmam', 'avatar.jpg', 'tutor', 1, 1, 'demo_iaaanstructor@gmail.com', NULL, 'no', NULL, '$2y$10$e3ul398q.804iNSa6JIAiefqQ8qOc5pfoY2HQI9rDZBeFwfVq9jlC', NULL, 'approved', '2021-06-07 01:38:32', '2021-08-03 03:50:26'),
(77, 'mnxmnmx', 'avatar.jpg', 'tutor', 1, 1, 'demo_instructor@gmail.com', NULL, 'yes', NULL, '$2y$10$XsVkANjH90vgwPwfqf8CyexSgTmouGpHlSqIyjmRJv2062YZfblVu', NULL, 'approved', '2021-06-07 03:27:03', '2021-08-03 03:50:25'),
(78, 'xnmxnxm', 'avatar.jpg', 'tutor', 1, 1, 'demssso_instructor@gmail.com', NULL, 'yes', NULL, '$2y$10$7P5ATzhDscnjhHEjyWPdoOZKRh82qD5ZwmBaYWDX1Y3oOgPTcH23K', NULL, 'approved', '2021-06-07 03:27:31', '2021-08-03 03:50:28'),
(79, 'bznbznb', 'avatar.jpg', 'tutor', 1, 1, 'hjjdemo_instructor@gmail.com', NULL, 'no', NULL, '$2y$10$f9R/zi5031aya2EZzG4uuevk69x9FoOdaVL.d7.LNM9oHJQh1BepS', NULL, 'approved', '2021-06-08 01:28:10', '2021-06-08 01:28:10'),
(80, 'bxbnx', 'avatar.jpg', 'tutor', 1, 1, 'demo_ssinstructor@gmail.com', NULL, 'no', NULL, '$2y$10$HoZZVAEjZz1RqkbzxGUS8ew/W1w28XrK4ZjCshkob.AxII9dc36mW', NULL, 'approved', '2021-06-08 04:51:10', '2021-06-08 08:11:42'),
(81, 'znmznm', 'avatar.jpg', 'tutor', 1, 1, 'demo_xxxinstructor@gmail.com', NULL, 'no', NULL, '$2y$10$0wF6MZytBQ0QFGkloTFE2O.X92HgRg6znigbbRld8tDdRJ5HQFEBW', NULL, 'approved', '2021-06-09 01:33:59', '2021-06-09 05:27:15'),
(82, 'xnmx', 'avatar.jpg', 'tutor', 1, 1, 'demo_ixxxnstructor@gmail.com', NULL, 'no', NULL, '$2y$10$ymNpdIysyF12XsPM9Quy1.jr.TIyfahaHrDbtIcY6AFzGDM.1CIw6', NULL, 'approved', '2021-06-09 08:55:16', '2021-08-03 03:50:38'),
(83, 'demo', 'avatar.jpg', 'tutor', 1, 1, 'ddd@gmail.com', NULL, 'yes', NULL, '$2y$10$G/tdxb.zdLujmigbIn6TmeOVzQ53bvwmrgQ58dC2KIPneFTrM9ILO', NULL, 'approved', '2021-06-30 06:06:57', '2021-06-30 06:39:05'),
(84, 'nxmnxm', '16256800411624710270original_logo.jpeg', 'tutor', 1, 1, 'agent@agent.com', NULL, 'no', NULL, '$2y$10$16Z27GC4xwBZ816TVLV02ezPPYG3hheZGm9PeMPnRshzsMkMNaST6', NULL, 'approved', '2021-07-07 12:46:43', '2021-08-03 03:50:40'),
(85, 'zrurui', '16257258401624712947original_logo-removebg-preview.png', 'tutor', 1, 1, 'cbnbn@gmail.com', NULL, 'no', NULL, '$2y$10$P4wdQeEciOZ7zPJCd5Qg.OQRq5SknOWSDQkC4nGRoo2ZsGuCfhBvq', NULL, 'approved', '2021-07-08 01:30:02', '2021-08-03 03:50:42'),
(86, 'nmznm', '16258135711624710270original_logo.jpeg', 'tutor', 1, 1, 'sjkj@gmail.com', NULL, 'yes', NULL, '$2y$10$npM4jvGgwgLahzDY1tcmj.VxSQjU01vVvjHFTxef7ciaMUJbBfcp.', NULL, 'approved', '2021-07-09 01:29:07', '2021-07-09 02:16:30'),
(87, 'Emad Akbar', '6948bbfcb3e5d1d286a8153d2ef3adaf.jpg', 'student', 1, 1, 'emad@gmail.com', NULL, 'no', NULL, '$2y$10$Qs5wpdgPW5lgSDa/sq/ktOis6vtPKmJ.iKdBQxckj/xNBAmXtOX3u', NULL, 'approved', '2021-07-28 01:20:05', '2021-08-31 18:34:29'),
(88, 'emadakbar', '16274536590_U6SDa-3SH6O_vyGW_.png', 'tutor', 1, 1, 'emadakbar@gmail.com', NULL, 'yes', NULL, '$2y$10$6ZI.1PRm4Cy67VBWtRB1N.8P0bgDV6jpJU3XsB8Yn2zFWww3Ykvzm', NULL, 'approved', '2021-07-28 01:24:51', '2021-07-28 01:27:39'),
(91, 'emad', 'avatar.png', 'student', 1, 1, 'hassan@gmail.com', NULL, 'no', NULL, NULL, NULL, 'approved', '2021-08-05 05:21:36', '2021-08-06 02:58:54'),
(92, 'emad', 'avatar.png', 'student', 1, 1, 'assdd@gmail.com', NULL, 'no', NULL, '$2y$10$agJyQa0XOBNLLGtrkOJ1QOVClV15v67MpinPb0DZsH2rCPx7FlKSm', NULL, 'not_approved', '2021-08-10 02:53:47', '2021-08-10 02:53:47'),
(93, 'emad', 'avatar.png', 'student', 1, 1, 'lllsss@gmail.com', NULL, 'no', NULL, '$2y$10$qh6sCgQPJc2GN6GFNLlfKetGH6uKF30cwACc3qe4/aIz.zj8SxSae', NULL, 'not_approved', '2021-08-10 03:06:45', '2021-08-10 03:06:45'),
(94, 'emad', 'avatar.png', 'student', 1, 1, 'llosss@gmail.com', NULL, 'no', NULL, '$2y$10$9A6O68N2bFh1wuMl67S8cebhCOxJnOQQndeKH7dOfIB0Dkl0dIwLC', NULL, 'not_approved', '2021-08-10 03:07:29', '2021-08-10 03:07:29'),
(95, 'emad', 'avatar.png', 'student', 1, 1, 'juniad@gmail.com', NULL, 'no', NULL, '$2y$10$LNI3ZPHKacBde8msm49I1uBMxLtikNb5PrB1hN59jry0SFBidt3P2', NULL, 'not_approved', '2021-08-11 01:25:32', '2021-08-11 01:25:32'),
(98, 'emad', 'avatar.png', 'student', 1, 1, 'kamran@gmail.com', NULL, 'no', NULL, '$2y$10$CEMiQ24HLmp3R1hTp17TierPWXK.gIzt4LHtRP5lzOuYLZG9iBQnG', NULL, 'not_approved', '2021-08-11 19:21:54', '2021-08-11 19:21:54'),
(99, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk8127368@gmail.com', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 15:57:02', '2021-08-14 15:57:02'),
(100, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk8134527368@gmail.com', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:29:31', '2021-08-14 16:29:31'),
(101, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk813452368@gmail.comm', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:30:39', '2021-08-14 16:30:39'),
(102, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk813452368@gmalil.comm', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:31:21', '2021-08-14 16:31:21'),
(105, 'Syed Maisam Ali', 'https://lh3.googleusercontent.com/a-/AOh14GjVg4PkkSKTCaJ09OYWeLQbWtgCpqARgrYy6B29=s96-c', 'student', 1, 1, 'syedmaisam97@gmail.com', 'facebook_id', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:55:05', '2021-08-14 17:55:05'),
(106, 'Meh Sam naQvi', 'https://lh3.googleusercontent.com/a-/AOh14GhbyyAvp8iDnYW-5GbShc_7WChwZ6B0oGsBo1Xuaw=s96-c', 'student', 1, 1, 'iambrainless100@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:57:26', '2021-08-14 17:57:26'),
(107, 'Texerect', 'https://lh3.googleusercontent.com/a-/AOh14Gg1aAtBpVSPULfYbw7iwN_mhJidoZREftepc_iB=s96-c', 'student', 1, 2, 'texerect@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:59:10', '2021-08-14 18:23:49'),
(108, 'newuser', 'avatar.png', 'student', 1, 1, 'usman@gmail.com', NULL, 'no', NULL, '$2y$10$yO35bNdUWJQPHhGEQYqB4ONIjplV4bNpnNF6eyrial4pK6RSKrUDK', NULL, 'not_approved', '2021-08-16 10:18:07', '2021-08-16 10:18:07'),
(109, 'newtutor', '16291049643.jpg', 'tutor', 1, 1, 'newtutor@gmail.com', NULL, 'no', NULL, '$2y$10$XkbgCmhP4tOEk7rRJggCaOSTZPOplGWaAkg5V.iBuym.h7wewiJvW', NULL, 'approved', '2021-08-16 13:07:16', '2021-08-16 13:09:24'),
(110, 'abc', '162945962901-prometeo-business-financial-consulting.__large_preview.jpg', 'tutor', 1, 1, 'abc@gmail.com', NULL, 'yes', NULL, '$2y$10$gfeVbuJdUcQepkcUwBUgO.ZniBPVGI/6seASTX5w85rswvhF0VUFm', NULL, 'not_approved', '2021-08-20 15:37:53', '2021-08-20 15:40:29'),
(111, 'fd', '162970945101-prometeo-business-financial-consulting.__large_preview.jpg', 'tutor', 1, 1, 'fdddd@gmail.com', NULL, 'yes', NULL, '$2y$10$ODlahuVUE24qTybriMLObuN6fiQ9Mimkl9n3TTab8mQ0EacBsLusK', NULL, 'approved', '2021-08-23 13:02:54', '2021-08-23 13:04:11'),
(113, 'abcd', '1630063880590_coffee.__large_preview.jpg.jpg', 'tutor', 1, 1, 'abcd@gmail.com', NULL, 'yes', NULL, '$2y$10$DrDLb2vKDt8/U/Q9rgY3FOl/gjM8UOQQfKW4C8aWGKqicA01vY4QW', NULL, 'not_approved', '2021-08-27 14:58:19', '2021-08-27 15:31:20'),
(114, 'junaid', '1630063978590_coffee.__large_preview.jpg.jpg', 'tutor', 1, 1, 'junaid@gmail.com', NULL, 'yes', NULL, '$2y$10$BoalZS9SHOpix2YTT4u6P.AG1Ce7n6SsgSFT6hM4sW0PN4HsY1sd2', NULL, 'approved', '2021-08-27 15:32:17', '2021-08-27 15:32:58'),
(115, 'sudo bee', 'https://lh3.googleusercontent.com/a/AATXAJyCkkbQMAnCp2793zDtSw2j3PAZ7FC2_OOB5I9I=s96-c', 'student', 1, 1, 'sudobee7@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-31 19:27:47', '2021-08-31 19:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `users_new`
--

CREATE TABLE `users_new` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` bigint(20) DEFAULT 1,
  `app_language` bigint(20) NOT NULL DEFAULT 1,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizard_is_complete` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_new`
--

INSERT INTO `users_new` (`id`, `name`, `profile_pic`, `account_type`, `currency`, `app_language`, `email`, `client_id`, `wizard_is_complete`, `email_verified_at`, `password`, `remember_token`, `account_status`, `created_at`, `updated_at`) VALUES
(74, 'Hassan', '603878b6904355b483110205ab7cd49b.jpg', 'student', 1, 2, 'zain@gmail.com', NULL, 'no', NULL, '$2y$10$VRmJW8.zQalF2gt/UG9YNuLKSKc1BYJ/StPVW99b5HwxPejfPlWaC', NULL, 'approved', '2021-06-05 08:09:07', '2021-08-12 16:11:02'),
(75, 'zainmalik', 'avatar.jpg', 'super_admin', 1, 1, 'zain1000@gmail.com', NULL, 'no', NULL, '$2y$10$GVWamy64tzp9qN9F1PNC/uISADE4sBvcVrzHwX1Tmh4XF5eY8iQNe', NULL, 'approved', '2021-06-07 01:22:22', '2021-06-07 01:23:27'),
(76, 'nmam', 'avatar.jpg', 'tutor', 1, 1, 'demo_iaaanstructor@gmail.com', NULL, 'no', NULL, '$2y$10$e3ul398q.804iNSa6JIAiefqQ8qOc5pfoY2HQI9rDZBeFwfVq9jlC', NULL, 'approved', '2021-06-07 01:38:32', '2021-08-03 03:50:26'),
(77, 'mnxmnmx', 'avatar.jpg', 'tutor', 1, 1, 'demo_instructor@gmail.com', NULL, 'yes', NULL, '$2y$10$XsVkANjH90vgwPwfqf8CyexSgTmouGpHlSqIyjmRJv2062YZfblVu', NULL, 'approved', '2021-06-07 03:27:03', '2021-08-03 03:50:25'),
(78, 'xnmxnxm', 'avatar.jpg', 'tutor', 1, 1, 'demssso_instructor@gmail.com', NULL, 'yes', NULL, '$2y$10$7P5ATzhDscnjhHEjyWPdoOZKRh82qD5ZwmBaYWDX1Y3oOgPTcH23K', NULL, 'approved', '2021-06-07 03:27:31', '2021-08-03 03:50:28'),
(79, 'bznbznb', 'avatar.jpg', 'tutor', 1, 1, 'hjjdemo_instructor@gmail.com', NULL, 'no', NULL, '$2y$10$f9R/zi5031aya2EZzG4uuevk69x9FoOdaVL.d7.LNM9oHJQh1BepS', NULL, 'approved', '2021-06-08 01:28:10', '2021-06-08 01:28:10'),
(80, 'bxbnx', 'avatar.jpg', 'tutor', 1, 1, 'demo_ssinstructor@gmail.com', NULL, 'no', NULL, '$2y$10$HoZZVAEjZz1RqkbzxGUS8ew/W1w28XrK4ZjCshkob.AxII9dc36mW', NULL, 'approved', '2021-06-08 04:51:10', '2021-06-08 08:11:42'),
(81, 'znmznm', 'avatar.jpg', 'tutor', 1, 1, 'demo_xxxinstructor@gmail.com', NULL, 'no', NULL, '$2y$10$0wF6MZytBQ0QFGkloTFE2O.X92HgRg6znigbbRld8tDdRJ5HQFEBW', NULL, 'approved', '2021-06-09 01:33:59', '2021-06-09 05:27:15'),
(82, 'xnmx', 'avatar.jpg', 'tutor', 1, 1, 'demo_ixxxnstructor@gmail.com', NULL, 'no', NULL, '$2y$10$ymNpdIysyF12XsPM9Quy1.jr.TIyfahaHrDbtIcY6AFzGDM.1CIw6', NULL, 'approved', '2021-06-09 08:55:16', '2021-08-03 03:50:38'),
(83, 'demo', 'avatar.jpg', 'tutor', 1, 1, 'ddd@gmail.com', NULL, 'yes', NULL, '$2y$10$G/tdxb.zdLujmigbIn6TmeOVzQ53bvwmrgQ58dC2KIPneFTrM9ILO', NULL, 'approved', '2021-06-30 06:06:57', '2021-06-30 06:39:05'),
(84, 'nxmnxm', '16256800411624710270original_logo.jpeg', 'tutor', 1, 1, 'agent@agent.com', NULL, 'no', NULL, '$2y$10$16Z27GC4xwBZ816TVLV02ezPPYG3hheZGm9PeMPnRshzsMkMNaST6', NULL, 'approved', '2021-07-07 12:46:43', '2021-08-03 03:50:40'),
(85, 'zrurui', '16257258401624712947original_logo-removebg-preview.png', 'tutor', 1, 1, 'cbnbn@gmail.com', NULL, 'no', NULL, '$2y$10$P4wdQeEciOZ7zPJCd5Qg.OQRq5SknOWSDQkC4nGRoo2ZsGuCfhBvq', NULL, 'approved', '2021-07-08 01:30:02', '2021-08-03 03:50:42'),
(86, 'nmznm', '16258135711624710270original_logo.jpeg', 'tutor', 1, 1, 'sjkj@gmail.com', NULL, 'yes', NULL, '$2y$10$npM4jvGgwgLahzDY1tcmj.VxSQjU01vVvjHFTxef7ciaMUJbBfcp.', NULL, 'approved', '2021-07-09 01:29:07', '2021-07-09 02:16:30'),
(87, 'Emad Akbar', '6948bbfcb3e5d1d286a8153d2ef3adaf.jpg', 'student', 1, 1, 'emad@gmail.com', NULL, 'no', NULL, '$2y$10$Qs5wpdgPW5lgSDa/sq/ktOis6vtPKmJ.iKdBQxckj/xNBAmXtOX3u', NULL, 'approved', '2021-07-28 01:20:05', '2021-08-31 18:34:29'),
(88, 'emadakbar', '16274536590_U6SDa-3SH6O_vyGW_.png', 'tutor', 1, 1, 'emadakbar@gmail.com', NULL, 'yes', NULL, '$2y$10$6ZI.1PRm4Cy67VBWtRB1N.8P0bgDV6jpJU3XsB8Yn2zFWww3Ykvzm', NULL, 'approved', '2021-07-28 01:24:51', '2021-07-28 01:27:39'),
(91, 'emad', 'avatar.png', 'student', 1, 1, 'hassan@gmail.com', NULL, 'no', NULL, NULL, NULL, 'approved', '2021-08-05 05:21:36', '2021-08-06 02:58:54'),
(92, 'emad', 'avatar.png', 'student', 1, 1, 'assdd@gmail.com', NULL, 'no', NULL, '$2y$10$agJyQa0XOBNLLGtrkOJ1QOVClV15v67MpinPb0DZsH2rCPx7FlKSm', NULL, 'not_approved', '2021-08-10 02:53:47', '2021-08-10 02:53:47'),
(93, 'emad', 'avatar.png', 'student', 1, 1, 'lllsss@gmail.com', NULL, 'no', NULL, '$2y$10$qh6sCgQPJc2GN6GFNLlfKetGH6uKF30cwACc3qe4/aIz.zj8SxSae', NULL, 'not_approved', '2021-08-10 03:06:45', '2021-08-10 03:06:45'),
(94, 'emad', 'avatar.png', 'student', 1, 1, 'llosss@gmail.com', NULL, 'no', NULL, '$2y$10$9A6O68N2bFh1wuMl67S8cebhCOxJnOQQndeKH7dOfIB0Dkl0dIwLC', NULL, 'not_approved', '2021-08-10 03:07:29', '2021-08-10 03:07:29'),
(95, 'emad', 'avatar.png', 'student', 1, 1, 'juniad@gmail.com', NULL, 'no', NULL, '$2y$10$LNI3ZPHKacBde8msm49I1uBMxLtikNb5PrB1hN59jry0SFBidt3P2', NULL, 'not_approved', '2021-08-11 01:25:32', '2021-08-11 01:25:32'),
(96, 'Maaz', 'avatar.png', 'student', 1, 1, 'maazkaalam@gmail.com', NULL, 'no', NULL, '$2y$10$fv4X4tDCr5PfgFM65qjjveZJKLm4n473UalntjETIVX3MC0fbuNb2', NULL, 'not_approved', '2021-08-11 18:26:58', '2021-08-11 18:26:58'),
(97, 'Maazalam', 'avatar.png', 'student', 1, 1, 'maazalam@gmail.com', NULL, 'no', NULL, '$2y$10$yRGHAbHnGH05wYtcy0YSq.4WcBKFdlYf4HjKZn0fw6BvdUF7RuGve', NULL, 'not_approved', '2021-08-11 18:31:15', '2021-08-11 18:31:15'),
(98, 'emad', 'avatar.png', 'student', 1, 1, 'kamran@gmail.com', NULL, 'no', NULL, '$2y$10$CEMiQ24HLmp3R1hTp17TierPWXK.gIzt4LHtRP5lzOuYLZG9iBQnG', NULL, 'not_approved', '2021-08-11 19:21:54', '2021-08-11 19:21:54'),
(99, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk8127368@gmail.com', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 15:57:02', '2021-08-14 15:57:02'),
(100, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk8134527368@gmail.com', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:29:31', '2021-08-14 16:29:31'),
(101, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk813452368@gmail.comm', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:30:39', '2021-08-14 16:30:39'),
(102, 'junaid khan', 'https://lh3.googleusercontent.com/a/AATXAJzvMVPkpOBb7ZRmj56Pi1McYT4Wj5jh10o8cUTa=s96-c', 'student', 1, 1, 'jk813452368@gmalil.comm', NULL, 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 16:31:21', '2021-08-14 16:31:21'),
(105, 'Syed Maisam Ali', 'https://lh3.googleusercontent.com/a-/AOh14GjVg4PkkSKTCaJ09OYWeLQbWtgCpqARgrYy6B29=s96-c', 'student', 1, 1, 'syedmaisam97@gmail.com', 'facebook_id', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:55:05', '2021-08-14 17:55:05'),
(106, 'Meh Sam naQvi', 'https://lh3.googleusercontent.com/a-/AOh14GhbyyAvp8iDnYW-5GbShc_7WChwZ6B0oGsBo1Xuaw=s96-c', 'student', 1, 1, 'iambrainless100@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:57:26', '2021-08-14 17:57:26'),
(107, 'Texerect', 'https://lh3.googleusercontent.com/a-/AOh14Gg1aAtBpVSPULfYbw7iwN_mhJidoZREftepc_iB=s96-c', 'student', 1, 2, 'texerect@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-14 17:59:10', '2021-08-14 18:23:49'),
(108, 'newuser', 'avatar.png', 'student', 1, 1, 'usman@gmail.com', NULL, 'no', NULL, '$2y$10$yO35bNdUWJQPHhGEQYqB4ONIjplV4bNpnNF6eyrial4pK6RSKrUDK', NULL, 'not_approved', '2021-08-16 10:18:07', '2021-08-16 10:18:07'),
(109, 'newtutor', '16291049643.jpg', 'tutor', 1, 1, 'newtutor@gmail.com', NULL, 'no', NULL, '$2y$10$XkbgCmhP4tOEk7rRJggCaOSTZPOplGWaAkg5V.iBuym.h7wewiJvW', NULL, 'approved', '2021-08-16 13:07:16', '2021-08-16 13:09:24'),
(110, 'abc', '162945962901-prometeo-business-financial-consulting.__large_preview.jpg', 'tutor', 1, 1, 'abc@gmail.com', NULL, 'yes', NULL, '$2y$10$gfeVbuJdUcQepkcUwBUgO.ZniBPVGI/6seASTX5w85rswvhF0VUFm', NULL, 'not_approved', '2021-08-20 15:37:53', '2021-08-20 15:40:29'),
(111, 'fd', '162970945101-prometeo-business-financial-consulting.__large_preview.jpg', 'tutor', 1, 1, 'fdddd@gmail.com', NULL, 'yes', NULL, '$2y$10$ODlahuVUE24qTybriMLObuN6fiQ9Mimkl9n3TTab8mQ0EacBsLusK', NULL, 'approved', '2021-08-23 13:02:54', '2021-08-23 13:04:11'),
(113, 'abcd', '1630063880590_coffee.__large_preview.jpg.jpg', 'tutor', 1, 1, 'abcd@gmail.com', NULL, 'yes', NULL, '$2y$10$DrDLb2vKDt8/U/Q9rgY3FOl/gjM8UOQQfKW4C8aWGKqicA01vY4QW', NULL, 'not_approved', '2021-08-27 14:58:19', '2021-08-27 15:31:20'),
(114, 'junaid', '1630063978590_coffee.__large_preview.jpg.jpg', 'tutor', 1, 1, 'junaid@gmail.com', NULL, 'yes', NULL, '$2y$10$BoalZS9SHOpix2YTT4u6P.AG1Ce7n6SsgSFT6hM4sW0PN4HsY1sd2', NULL, 'approved', '2021-08-27 15:32:17', '2021-08-27 15:32:58'),
(115, 'sudo bee', 'https://lh3.googleusercontent.com/a/AATXAJyCkkbQMAnCp2793zDtSw2j3PAZ7FC2_OOB5I9I=s96-c', 'student', 1, 1, 'sudobee7@gmail.com', 'Google', 'no', NULL, NULL, NULL, 'not_approved', '2021-08-31 19:27:47', '2021-08-31 19:28:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_new`
--
ALTER TABLE `users_new`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `users_new`
--
ALTER TABLE `users_new`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
