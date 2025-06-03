-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 12:49 PM
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
-- Database: `client_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `id_number` varchar(191) NOT NULL,
  `date_of_birth` date NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email_address` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `uuid`, `id_number`, `date_of_birth`, `first_name`, `last_name`, `email_address`, `telephone`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, '20186371-4059-11f0-8548-d85ed3268ce0', '9001015009087', '1990-01-01', 'James', 'Johnson', 'james.smith@example.com', '27811234567', 'inactive', NULL, '2025-06-03 08:59:58', '2025-06-03 07:41:14'),
(3, '20186e99-4059-11f0-8548-d85ed3268ce0', '8502026008086', '1985-02-02', 'Sarah', 'Johnson', 'sarah.j@example.com', '27812345678', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(4, '20186f19-4059-11f0-8548-d85ed3268ce0', '9203034007085', '1992-03-03', 'Michael', 'Williams', 'michael.w@example.com', '27813456789', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(5, '201875be-4059-11f0-8548-d85ed3268ce0', '8804043006084', '1988-04-04', 'Emily', 'Brown', 'emily.b@example.com', '27814567890', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(6, '20187656-4059-11f0-8548-d85ed3268ce0', '9505052005083', '1995-05-05', 'David', 'Jones', 'david.j@example.com', '27815678901', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(7, '201876bf-4059-11f0-8548-d85ed3268ce0', '8906061004082', '1989-06-06', 'Jessica', 'Garcia', 'jessica.g@example.com', '27816789012', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(8, '2018772c-4059-11f0-8548-d85ed3268ce0', '9307070003081', '1993-07-07', 'Daniel', 'Miller', 'daniel.m@example.com', '27817890123', 'inactive', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(9, '2018778d-4059-11f0-8548-d85ed3268ce0', '8708089002080', '1987-08-08', 'Sophia', 'Davis', 'sophia.d@example.com', '27818901234', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(10, '201877e9-4059-11f0-8548-d85ed3268ce0', '9109098001079', '1991-09-09', 'Matthew', 'Rodriguez', 'matthew.r@example.com', '27819012345', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(11, '20187843-4059-11f0-8548-d85ed3268ce0', '9401017009078', '1994-01-10', 'Olivia', 'Martinez', 'olivia.m@example.com', '27820123456', 'inactive', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(12, '2018789e-4059-11f0-8548-d85ed3268ce0', '8602026008077', '1986-02-11', 'Andrew', 'Hernandez', 'andrew.h@example.com', '27821234567', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(13, '201878f5-4059-11f0-8548-d85ed3268ce0', '9703035007076', '1997-03-12', 'Isabella', 'Lopez', 'isabella.l@example.com', '27822345678', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(14, '2018794f-4059-11f0-8548-d85ed3268ce0', '9904044006075', '1999-04-13', 'Joseph', 'Gonzalez', 'joseph.g@example.com', '27823456789', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(15, '201879a8-4059-11f0-8548-d85ed3268ce0', '8105053005074', '1981-05-14', 'Mia', 'Wilson', 'mia.w@example.com', '27824567890', 'inactive', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(16, '20187a01-4059-11f0-8548-d85ed3268ce0', '8306062004073', '1983-06-15', 'Robert', 'Anderson', 'robert.a@example.com', '27825678901', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(17, '20187a5c-4059-11f0-8548-d85ed3268ce0', '8507071003072', '1985-07-16', 'Charlotte', 'Thomas', 'charlotte.t@example.com', '27826789012', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(18, '20187ab3-4059-11f0-8548-d85ed3268ce0', '9708080002071', '1997-08-17', 'William', 'Taylor', 'william.t@example.com', '27827890123', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(19, '20187b0e-4059-11f0-8548-d85ed3268ce0', '8909099001070', '1989-09-18', 'Amelia', 'Moore', 'amelia.m@example.com', '27828901234', 'inactive', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(20, '20187b64-4059-11f0-8548-d85ed3268ce0', '9201018009069', '1992-01-19', 'Benjamin', 'Jackson', 'benjamin.j@example.com', '27829012345', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58'),
(21, '20187bbb-4059-11f0-8548-d85ed3268ce0', '9402027008068', '1994-02-20', 'Evelyn', 'Martin', 'evelyn.m@example.com', '27830123456', 'active', NULL, '2025-06-03 08:59:58', '2025-06-03 08:59:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `clients_email_address_unique` (`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
