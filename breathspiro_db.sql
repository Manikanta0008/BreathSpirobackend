-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2026 at 07:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `breathspiro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_trainingsession`
--

CREATE TABLE `api_trainingsession` (
  `id` bigint(20) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `session_duration_sec` int(11) NOT NULL,
  `breath_count` int(11) NOT NULL,
  `completed_cycles` int(11) NOT NULL,
  `total_cycles` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `notes` longtext DEFAULT NULL,
  `exhale_accuracy` int(11) NOT NULL,
  `hold_accuracy` int(11) NOT NULL,
  `inhale_accuracy` int(11) NOT NULL,
  `overall_accuracy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_trainingsession`
--

INSERT INTO `api_trainingsession` (`id`, `device_id`, `username`, `session_duration_sec`, `breath_count`, `completed_cycles`, `total_cycles`, `created_at`, `notes`, `exhale_accuracy`, `hold_accuracy`, `inhale_accuracy`, `overall_accuracy`) VALUES
(1, 'web_rahul', 'rahul', 120, 30, 10, 10, '2026-02-20 09:00:00.000000', NULL, 0, 0, 0, 0),
(2, 'web_rahul', 'rahul', 115, 28, 9, 10, '2026-02-22 10:30:00.000000', NULL, 0, 0, 0, 0),
(3, 'web_rahul', 'rahul', 118, 29, 10, 10, '2026-02-25 08:15:00.000000', NULL, 0, 0, 0, 0),
(4, 'web_rahul', 'rahul', 122, 31, 10, 10, '2026-03-01 09:45:00.000000', NULL, 0, 0, 0, 0),
(31, 'web_ananya', 'ananya', 120, 30, 10, 10, '2026-02-22 18:00:00.000000', NULL, 0, 0, 0, 0),
(32, 'web_ananya', 'ananya', 120, 30, 10, 10, '2026-02-26 18:30:00.000000', NULL, 0, 0, 0, 0),
(33, 'web_ananya', 'ananya', 122, 31, 10, 10, '2026-03-01 19:00:00.000000', NULL, 0, 0, 0, 0),
(34, 'web_arjun', 'arjun', 72, 18, 6, 10, '2026-02-19 11:00:00.000000', NULL, 0, 0, 0, 0),
(35, 'web_arjun', 'arjun', 84, 20, 7, 10, '2026-02-23 10:00:00.000000', NULL, 0, 0, 0, 0),
(36, 'web_deepak', 'deepak', 96, 24, 8, 10, '2026-02-21 07:00:00.000000', NULL, 0, 0, 0, 0),
(37, 'web_deepak', 'deepak', 108, 27, 9, 10, '2026-02-25 07:30:00.000000', NULL, 0, 0, 0, 0),
(38, 'web_deepak', 'deepak', 120, 30, 10, 10, '2026-03-02 08:00:00.000000', NULL, 0, 0, 0, 0),
(39, 'web_vikram', 'vikram', 60, 14, 5, 10, '2026-02-20 12:00:00.000000', NULL, 0, 0, 0, 0),
(40, 'web_vikram', 'vikram', 72, 16, 6, 10, '2026-02-25 12:30:00.000000', NULL, 0, 0, 0, 0),
(41, 'web_priya', 'priya', 96, 22, 8, 10, '2026-02-18 14:00:00.000000', NULL, 0, 0, 0, 0),
(42, 'web_meera', 'meera', 84, 20, 7, 10, '2026-02-24 17:30:00.000000', NULL, 0, 0, 0, 0),
(43, 'web_sanjay', 'sanjay', 96, 24, 8, 10, '2026-02-27 10:30:00.000000', NULL, 0, 0, 0, 0),
(44, 'web_kavitha', 'kavitha', 84, 20, 7, 10, '2026-02-24 16:30:00.000000', NULL, 0, 0, 0, 0),
(45, 'web_lakshmi', 'lakshmi', 108, 26, 9, 10, '2026-02-26 15:30:00.000000', NULL, 0, 0, 0, 0),
(46, '8588d247f22672bb', 'puran', 120, 30, 10, 10, '2026-03-07 11:04:26.660969', NULL, 0, 0, 0, 0),
(47, 'web-m4qmu0vb', 'demopatient2', 0, 0, 5, 10, '2026-03-10 04:41:31.655710', NULL, 0, 0, 0, 0),
(48, 'web-iu2gvz81', 'lalli123', 0, 0, 10, 10, '2026-03-10 04:47:18.707685', NULL, 0, 0, 0, 0),
(49, 'web-iu2gvz81', 'lalli123', 0, 0, 0, 10, '2026-03-10 04:47:37.357113', NULL, 0, 0, 0, 0),
(50, 'web-iu2gvz81', 'lalli123', 0, 0, 1, 10, '2026-03-10 04:57:56.890933', NULL, 0, 0, 0, 0),
(51, 'web-jspkips7', 'lalli123', 0, 0, 10, 10, '2026-03-11 09:17:36.927180', NULL, 0, 0, 0, 0),
(52, '8588d247f22672bb', 'mani90', 150, 30, 10, 10, '2026-03-15 11:49:37.291523', NULL, 0, 0, 0, 0),
(53, 'web-ue1grs0v', 'thala123', 0, 0, 1, 10, '2026-03-16 03:17:21.598119', NULL, 0, 0, 0, 0),
(54, '8588d247f22672bb', 'chennai', 46, 9, 3, 3, '2026-03-16 03:20:40.483523', NULL, 0, 0, 0, 0),
(55, '8588d247f22672bb', 'malik', 18, 3, 3, 3, '2026-03-18 07:30:27.899789', NULL, 0, 0, 0, 0),
(56, 'web-w0d1q3vc', 'Rushi123', 0, 0, 4, 10, '2026-03-19 03:09:31.123979', NULL, 0, 0, 0, 0),
(57, '8588d247f22672bb', 'lalith', 60, 10, 10, 10, '2026-03-26 08:40:24.688614', NULL, 0, 0, 0, 0),
(58, '8588d247f22672bb', 'lalith', 18, 3, 3, 3, '2026-03-26 08:47:47.769464', NULL, 0, 0, 0, 0),
(59, '8588d247f22672bb', 'lalith', 0, 0, 0, 10, '2026-03-26 09:09:49.574237', NULL, 0, 0, 0, 0),
(60, '8588d247f22672bb', 'lallinaidu', 0, 0, 4, 10, '2026-03-26 10:29:31.976671', NULL, 0, 0, 0, 0),
(61, '8588d247f22672bb', 'lallinaidu', 0, 0, 10, 10, '2026-03-26 14:01:57.486530', NULL, 0, 0, 0, 0),
(62, '8588d247f22672bb', 'lallinaidu', 10, 3, 3, 3, '2026-03-26 14:03:27.083488', NULL, 0, 0, 0, 0),
(63, '8588d247f22672bb', 'lallinaidu', 8, 1, 1, 3, '2026-03-26 14:38:00.587897', NULL, 0, 0, 0, 0),
(64, '8588d247f22672bb', 'lallinaidu', 9, 3, 3, 3, '2026-03-26 14:38:20.045466', NULL, 0, 0, 0, 0),
(65, 'android_device', 'jacky', 4, 3, 3, 3, '2026-03-27 05:13:42.274853', NULL, 73, 25, 13, 37);

-- --------------------------------------------------------

--
-- Table structure for table `api_userprofile`
--

CREATE TABLE `api_userprofile` (
  `id` bigint(20) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `condition` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `baseline_hold_time_sec` int(11) DEFAULT NULL,
  `dyspnea_description` varchar(200) DEFAULT NULL,
  `dyspnea_score` varchar(20) DEFAULT NULL,
  `mep_value` double DEFAULT NULL,
  `mip_value` double DEFAULT NULL,
  `muscle_strength_level` varchar(20) DEFAULT NULL,
  `muscle_strength_title` varchar(50) DEFAULT NULL,
  `pack_years` varchar(50) DEFAULT NULL,
  `respiratory_rate` int(11) DEFAULT NULL,
  `smoking_status` varchar(50) DEFAULT NULL,
  `spo2_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_userprofile`
--

INSERT INTO `api_userprofile` (`id`, `device_id`, `age`, `gender`, `height`, `weight`, `condition`, `created_at`, `updated_at`, `name`, `password`, `username`, `baseline_hold_time_sec`, `dyspnea_description`, `dyspnea_score`, `mep_value`, `mip_value`, `muscle_strength_level`, `muscle_strength_title`, `pack_years`, `respiratory_rate`, `smoking_status`, `spo2_level`) VALUES
(1, 'web_rahul', 28, 'Male', 175, 72.5, 'Asthma', '2026-03-04 14:02:05.000000', '2026-03-04 14:02:05.000000', 'Rahul Sharma', 'pass123', 'rahul', 25, 'Breathless when hurrying', '1', 105, 85, 'Normal', 'Normal Strength', NULL, 18, 'Never', 97),
(12, '8588d247f22672bb', 23, 'Other', 234, 94, 'Post-COVID', '2026-03-04 08:49:10.831020', '2026-03-07 10:24:50.925376', 'sujatharao', '123456', 'sujatharao', 0, 'Moderate', '3', 0, 0, '2', 'Weak', '', 17, 'Never', 97),
(13, 'web_cheta', 23, 'Male', 157.6, 56, 'Asthma', '2026-03-05 07:19:00.616794', '2026-03-05 07:20:53.382929', '', 'user32', 'cheta', 0, 'Stops after walking 100 meters or a few minutes', '3', 0, 0, '', '', '0', 20, 'Never', 97),
(14, 'web_arjun', 45, 'Male', 170, 80, 'COPD', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Arjun Reddy', 'pass123', 'arjun', 12, 'Stops after walking 100 meters or a few minutes on level ground', '3', 64, 52, 'Moderate Weakness', 'Moderate', '15 pack-years', 24, 'Current', 91),
(15, 'web_priya', 34, 'Female', 162, 58, 'COPD', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Priya Nair', 'pass123', 'priya', 18, 'Walks slower than most people on the level, or stops after 15 minutes', '2', 82, 68, 'Mild Weakness', 'Mild', '5 pack-years', 22, 'Former', 94),
(16, 'web_kavitha', 52, 'Female', 158, 65, 'ILD', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Kavitha Balaji', 'pass123', 'kavitha', 15, 'Walks slower than most people on the level', '2', 76, 62, 'Mild Weakness', 'Mild', NULL, 20, 'Never', 93),
(17, 'web_deepak', 38, 'Male', 180, 85, 'Post-COVID', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Deepak Kumar', 'pass123', 'deepak', 22, 'Breathless when hurrying or walking up a slight hill', '1', 98, 78, 'Normal', 'Normal Strength', '3 pack-years', 19, 'Former', 96),
(18, 'web_ananya', 29, 'Female', 165, 55, 'Asthma', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Ananya Iyer', 'pass123', 'ananya', 30, 'No breathlessness except on strenuous exercise', '0', 112, 88, 'Normal', 'Normal Strength', NULL, 16, 'Never', 98),
(19, 'web_vikram', 60, 'Male', 168, 75, 'Bronchiectasis', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Vikram Singh', 'pass123', 'vikram', 8, 'Stops after walking 100 meters or a few minutes', '3', 42, 38, 'Severe Weakness', 'Severe', '20 pack-years', 26, 'Former', 89),
(20, 'web_meera', 42, 'Female', 160, 62, 'COPD', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Meera Joshi', 'pass123', 'meera', 14, 'Walks slower than most people', '2', 66, 54, 'Moderate Weakness', 'Moderate', '10 pack-years', 23, 'Current', 92),
(21, 'web_sanjay', 50, 'Male', 172, 78, 'ILD', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Sanjay Patel', 'pass123', 'sanjay', 16, 'Walks slower than most people on the level', '2', 80, 65, 'Mild Weakness', 'Mild', NULL, 21, 'Never', 94),
(22, 'web_lakshmi', 55, 'Female', 155, 68, 'Post-COVID', '2026-03-06 08:42:05.000000', '2026-03-06 08:42:05.000000', 'Lakshmi Devi', 'pass123', 'lakshmi', 20, 'Breathless when hurrying or walking up a slight hill', '1', 88, 72, 'Normal', 'Normal Strength', NULL, 20, 'Never', 95),
(23, '8588d247f22672bb', 32, 'Male', 235, 56, 'Post-COVID', '2026-03-07 10:56:37.228886', '2026-03-07 11:08:42.208376', 'puran', '901234', 'puran', 0, 'Very slight', '1', 0, 0, '2', 'Weak', '', 25, 'Never', 97),
(24, '8588d247f22672bb', 23, 'Other', 2135, 123, 'Asthma', '2026-03-07 11:19:53.699592', '2026-03-07 11:34:47.709364', 'shetty', '123456', 'shetty', 0, 'Slight', '2', 0, 0, '2', 'Weak', '', 19, 'Never', 97),
(25, 'web-woecyilm', NULL, NULL, NULL, NULL, NULL, '2026-03-10 04:07:12.717962', '2026-03-10 04:07:12.718049', 'Test User', 'password123', 'testwebuser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'web-mgqfliji', NULL, NULL, NULL, NULL, NULL, '2026-03-10 04:12:00.881570', '2026-03-10 04:12:00.881608', 'lalith', '123456789', 'lalli123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'web-iu2gvz81', 34, 'Female', 160, 60.9, 'COPD', '2026-03-10 04:14:30.941924', '2026-03-10 07:40:30.719644', 'lalli', '123456', 'lalli123', 9, 'Short of breath when hurrying or walking up a slight hill.', '1', 120, 120, 'strong', NULL, '0', 24, 'Never Smoked', 98),
(28, 'web-m4qmu0vb', 45, 'Male', 175, 80, 'COPD', '2026-03-10 04:22:04.265785', '2026-03-10 04:25:52.252825', 'Demo Patient', 'password123', 'demopatient2', 2, 'Walks slower than people of similar age on level ground because of breathlessness.', '2', 90, 70, 'moderate', NULL, '15', 16, 'Former Smoker', 94),
(29, '8588d247f22672bb', 26, 'Female', 165, 76, 'General Wellness', '2026-03-11 04:12:37.418486', '2026-03-11 04:23:49.633977', 'ranchi', '123456789', 'ranchi', 0, 'Slight', '2', 0, 0, '3', 'Moderate', '', 18, 'Never', 97),
(30, 'web-15mt4z37', NULL, NULL, NULL, NULL, NULL, '2026-03-11 07:52:11.920211', '2026-03-11 07:52:11.920261', 'lalith', '123456', 'mahi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'web-212h6cta', 24, 'Male', 169.5, 79, 'COPD', '2026-03-12 08:22:15.968449', '2026-03-12 15:20:13.332996', 'rajudanger', '0987654', 'smily01', 63, 'Stops for breath after walking about 100 yards or after a few minutes.', '3', 120, 90, 'strong', NULL, '0', 20, 'Never Smoked', 98),
(35, '8588d247f22672bb', 24, 'Male', 156.5, 57, 'COPD', '2026-03-15 05:00:12.815610', '2026-03-15 05:03:28.159865', 'mani', 'manikanta', 'mani', 0, 'Very severe', '7', 0, 0, '1', 'Very Weak', '', 18, 'Never', 97),
(36, '8588d247f22672bb', NULL, NULL, NULL, NULL, NULL, '2026-03-15 05:08:12.803571', '2026-03-15 05:08:12.803629', 'lalith', 'manicg', 'manicg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '8588d247f22672bb', NULL, NULL, NULL, NULL, NULL, '2026-03-15 05:14:18.782678', '2026-03-15 05:14:18.782733', 'sujatha', 'sujatharao', 'subbarao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '8588d247f22672bb', 23, 'Other', 235, 56, 'Post-Surgery', '2026-03-15 05:21:38.435595', '2026-03-15 11:59:13.831992', 'mani90', 'mani90', 'mani90', 1, 'Very slight', '1', 0, 0, '1', 'Very Weak', '', 17, 'Never', 97),
(39, '8588d247f22672bb', 36, 'Male', 2456, 23, 'Post-COVID', '2026-03-16 02:55:51.178880', '2026-03-16 05:03:44.177806', 'chennai', 'thala00', 'chennai', 1, 'Very slight', '1', 0, 0, '2', 'Weak', '', 18, 'Never', 97),
(40, 'web-ue1grs0v', 34, 'Male', 169, 90, 'Cystic Fibrosis', '2026-03-16 03:15:14.858236', '2026-03-16 03:16:37.040993', 'mahibhaiii', '123456789', 'thala123', 6, 'Stops for breath after walking about 100 yards or after a few minutes.', '3', 110, 90, 'strong', NULL, '0', 18, 'Never Smoked', 98),
(41, 'web-50yvq9fy', 32, 'Male', 179, 70, 'Cystic Fibrosis', '2026-03-16 04:53:14.417622', '2026-03-16 04:54:38.172362', 'manikanta', '1234567890', 'mani910', 20, 'Too breathless to leave the house, or breathless when dressing/undressing.', '4', 100, 90, 'moderate', NULL, '0', 4, 'Never Smoked', 98),
(42, '8588d247f22672bb', 23, 'Other', 24, 24, 'COPD', '2026-03-16 07:31:07.644530', '2026-03-16 07:33:14.592162', 'suhas31', 'suhas31', 'suhas31', 1, 'Very slight', '1', 0, 0, '1', 'Very Weak', '', 17, 'Never', 97),
(43, '8588d247f22672bb', 21, 'Male', 23, 123, 'Post-COVID', '2026-03-16 08:36:48.475936', '2026-03-16 09:21:51.435883', 'loku90', 'loku90', 'loku90', 1, 'Slight', '2', 0, 0, '3', 'Moderate', '', 19, 'Never', 97),
(44, '8588d247f22672bb', 232, 'Female', 56, 23, 'Asthma', '2026-03-17 03:02:20.874566', '2026-03-17 07:00:21.373801', 'cgsrao', 'cgsrao', 'cgsrao', 1, 'Moderate', '3', 0, 0, '2', 'Weak', '', 19, 'Never', 97),
(45, '8588d247f22672bb', 23, 'Female', 156, 50, 'COPD', '2026-03-17 07:25:53.452228', '2026-03-17 07:26:55.205704', 'rushitha', 'rushitha', 'rushitha', 1, 'Slight', '2', 0, 0, '2', 'Weak', '', 18, 'Never', 97),
(46, 'web-9rn46qhb', NULL, NULL, NULL, NULL, NULL, '2026-03-18 05:06:11.297796', '2026-03-18 05:06:11.298026', 'lalith', '123456789', 'lalli123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '8588d247f22672bb', NULL, NULL, NULL, NULL, NULL, '2026-03-18 07:10:44.949397', '2026-03-18 07:10:44.949490', 'lallii', '123446789', 'lallii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '8588d247f22672bb', NULL, NULL, NULL, NULL, NULL, '2026-03-18 07:16:55.921430', '2026-03-18 07:16:55.921492', 'manoj', 'giddalur', 'giddalur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '8588d247f22672bb', 23, 'Male', 179, 56, 'Asthma', '2026-03-18 07:28:12.489645', '2026-03-18 07:28:46.194080', 'malik', 'malik10', 'malik', 1, 'Slight', '2', 0, 0, '2', 'Weak', '', 18, 'Never', 97),
(50, 'web-w0d1q3vc', 24, 'Female', 156, 65, 'Healthy / None', '2026-03-19 03:07:04.001431', '2026-03-19 03:08:22.523793', 'Rushitha CG', '2001', 'Rushi123', 10, 'Walks slower than people of similar age on level ground because of breathlessness.', '2', 110, 110, 'strong', NULL, '0', 6, 'Never Smoked', 98),
(51, '8588d247f22672bb', 23, 'Male', 156, 56, 'Asthma', '2026-03-19 03:20:41.075233', '2026-03-19 03:25:14.064199', 'mohanlal', 'laluncle', 'mohanlal', 1, 'Moderate', '3', 0, 0, '2', 'Weak', '', 19, 'Never', 97),
(52, '8588d247f22672bb', 26, 'Male', 176, 74, 'Post-COVID', '2026-03-26 04:45:05.837244', '2026-03-26 07:39:27.632244', 'manikanta', 'manikanta', 'manikanta', 1, 'Slight', '2', 120, 200, '1', 'Very Weak', '123456', 17, 'Former', 97),
(53, '8588d247f22672bb', 26, 'Male', 176, 74, 'Post-COVID', '2026-03-26 08:26:43.646091', '2026-03-26 08:28:53.639939', 'manikanta', 'lalilali', 'manikanta', 1, 'Slight', '2', 120, 200, '1', 'Very Weak', '123456', 17, 'Former', 97),
(54, '8588d247f22672bb', 23, 'Female', 123, 45, 'Asthma', '2026-03-26 08:29:50.003510', '2026-03-26 08:30:15.759235', 'lalith', 'lalith', 'lalith', 1, 'Slight', '2', 0, 0, '2', 'Weak', '', 18, 'Never', 97),
(55, '8588d247f22672bb', NULL, NULL, NULL, NULL, NULL, '2026-03-26 09:13:55.958615', '2026-03-26 09:13:55.958682', 'rajesh', 'rajesh', 'rajesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '8588d247f22672bb', 23, 'Male', 323, 56, 'Asthma', '2026-03-26 10:20:39.842368', '2026-03-26 14:37:30.277179', 'lallinaidu', 'lallinaidu', 'lallinaidu', 1, 'Nothing at all', '0', 0, 0, '1', 'Very Weak', '', 26, 'Never', 97),
(57, 'android_e62bff51', NULL, NULL, NULL, NULL, NULL, '2026-03-27 05:12:17.471544', '2026-03-27 05:12:17.471575', 'jacky', 'kacky0', 'jacky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'android_e62bff51', NULL, NULL, NULL, NULL, NULL, '2026-03-27 07:32:33.346776', '2026-03-27 07:32:33.346987', 'mukesg', 'monish', 'monish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'android_e62bff51', 25, 'Male', 165, 69, 'COPD', '2026-03-27 07:40:01.741048', '2026-03-27 07:41:51.894553', 'lalith', 'lalith', 'lalith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 6, 'Never Smoked', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add training session', 8, 'add_trainingsession'),
(30, 'Can change training session', 8, 'change_trainingsession'),
(31, 'Can delete training session', 8, 'delete_trainingsession'),
(32, 'Can view training session', 8, 'view_trainingsession');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'api', 'trainingsession'),
(7, 'api', 'userprofile'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-03-04 08:20:04.452165'),
(2, 'auth', '0001_initial', '2026-03-04 08:20:05.366143'),
(3, 'admin', '0001_initial', '2026-03-04 08:20:05.582325'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-03-04 08:20:05.588736'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-04 08:20:05.598809'),
(6, 'api', '0001_initial', '2026-03-04 08:20:05.656803'),
(7, 'api', '0002_userprofile_email_userprofile_name_and_more', '2026-03-04 08:20:06.206435'),
(8, 'api', '0003_alter_userprofile_password_and_more', '2026-03-04 08:20:06.352576'),
(9, 'api', '0004_alter_userprofile_device_id', '2026-03-04 08:20:06.374003'),
(10, 'api', '0005_remove_userprofile_email_remove_userprofile_phone_and_more', '2026-03-04 08:20:06.516873'),
(11, 'api', '0006_alter_userprofile_device_id_and_more', '2026-03-04 08:20:06.926855'),
(12, 'api', '0007_trainingsession', '2026-03-04 08:20:06.950614'),
(13, 'contenttypes', '0002_remove_content_type_name', '2026-03-04 08:20:07.078660'),
(14, 'auth', '0002_alter_permission_name_max_length', '2026-03-04 08:20:07.177353'),
(15, 'auth', '0003_alter_user_email_max_length', '2026-03-04 08:20:07.192599'),
(16, 'auth', '0004_alter_user_username_opts', '2026-03-04 08:20:07.198631'),
(17, 'auth', '0005_alter_user_last_login_null', '2026-03-04 08:20:07.274718'),
(18, 'auth', '0006_require_contenttypes_0002', '2026-03-04 08:20:07.278371'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2026-03-04 08:20:07.286013'),
(20, 'auth', '0008_alter_user_username_max_length', '2026-03-04 08:20:07.301119'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2026-03-04 08:20:07.316573'),
(22, 'auth', '0010_alter_group_name_max_length', '2026-03-04 08:20:07.331918'),
(23, 'auth', '0011_update_proxy_permissions', '2026-03-04 08:20:07.340354'),
(24, 'auth', '0012_alter_user_first_name_max_length', '2026-03-04 08:20:07.357941'),
(25, 'sessions', '0001_initial', '2026-03-04 08:20:07.414669'),
(26, 'api', '0008_trainingsession_notes', '2026-03-12 07:20:45.394941'),
(27, 'api', '0009_trainingsession_exhale_accuracy_and_more', '2026-03-27 04:23:26.063876');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ctqm2f2uc2o6zcjrh0p43bfh0y8tywck', 'eyJpc19sb2dnZWRfaW4iOnRydWUsImxvZ2dlZF9pbl91c2VyIjoiY2hldGEifQ:1vy2zO:u6YzgPcE1YyG4XnSfUNkZM2VFodCNbN8h_UzGT-NVbY', '2026-03-19 07:19:18.709336'),
('tz6886ye216od30vzt14oxoij0d3rokj', 'eyJpc19sb2dnZWRfaW4iOnRydWUsImxvZ2dlZF9pbl91c2VyIjoicmFodWwifQ:1vy3lb:PxyXRJjKeuPxoP60MQM-WaNjilzO1X7keVd42EbiNjs', '2026-03-19 08:09:07.464633');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_trainingsession`
--
ALTER TABLE `api_trainingsession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_userprofile`
--
ALTER TABLE `api_userprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_trainingsession`
--
ALTER TABLE `api_trainingsession`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `api_userprofile`
--
ALTER TABLE `api_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
