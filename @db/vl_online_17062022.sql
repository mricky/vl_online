-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2022 at 11:50 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vl_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_banks`
--

CREATE TABLE `account_banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_banks`
--

INSERT INTO `account_banks` (`id`, `account_name`, `bank_name`, `account_number`, `created_at`, `updated_at`) VALUES
(2, 'Defaut AP Account', 'BCA', 'xxxx', '2022-06-06 00:25:44', '2022-06-06 00:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coa_type_id` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `begining_balance` int(11) DEFAULT 0,
  `ending_balance` int(11) DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `report_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `code`, `coa_type_id`, `account`, `debit`, `credit`, `begining_balance`, `ending_balance`, `created_by`, `created_at`, `report_type`, `updated_at`) VALUES
(1, '101-1000', 1, 'Kas', 0, 0, 0, 0, NULL, '2022-06-10 22:24:26', 'N', '2022-06-11 09:50:32'),
(2, '101-1001', 1, 'Kas Besar', 0, 0, 0, 0, NULL, '2022-06-10 22:25:11', 'N', '2022-06-11 09:50:24'),
(3, '101-1002', 1, 'Kas Kecil', 0, 0, 0, 0, NULL, '2022-06-10 22:25:41', 'N', '2022-06-11 09:50:18'),
(4, '101-2000', 1, 'Bank', 0, 0, 0, 0, NULL, '2022-06-10 22:26:09', 'N', '2022-06-11 09:50:49'),
(5, '101-2001', 1, 'BCA', 0, 0, 0, 0, NULL, '2022-06-10 22:26:26', NULL, NULL),
(6, '102-1000', 1, 'Piutang', 0, 0, 0, 0, NULL, '2022-06-10 22:26:48', 'N', '2022-06-11 09:51:20'),
(7, '102-1001', 1, 'Piutang Dagang', 0, 0, 0, 0, NULL, '2022-06-10 22:27:07', 'N', '2022-06-11 09:51:30'),
(8, '102-1002', 2, 'Piutang Lain', 0, 0, 0, 0, NULL, '2022-06-10 22:27:37', 'N', '2022-06-11 09:51:41'),
(9, '103-1000', 3, 'Persediaan', 0, 0, 0, 0, NULL, '2022-06-10 22:28:13', 'N', '2022-06-12 06:14:00'),
(10, '103-1001', 3, 'Persediaan Dagang', 0, 0, 0, 0, NULL, '2022-06-10 22:28:41', 'N', '2022-06-12 06:13:54'),
(11, '104-1000', 4, 'Asset Lain', 0, 0, 0, 0, NULL, '2022-06-10 22:29:52', NULL, NULL),
(12, '104-1001', 4, 'Uang Muka Pembelian', 0, 0, 0, 0, NULL, '2022-06-10 22:30:32', 'N', '2022-06-12 06:16:25'),
(13, '201-1000', 5, 'Kewajiban', 0, 0, 0, 0, NULL, '2022-06-10 22:31:17', 'L', '2022-06-11 09:54:10'),
(14, '201-1001', 6, 'Hutang Dagang', 0, 0, 0, 0, NULL, '2022-06-10 22:31:58', 'L', '2022-06-11 09:54:03'),
(15, '201-1002', 6, 'Uang Muka Penjualan', 0, 0, 0, 0, NULL, '2022-06-10 22:32:22', 'L', '2022-06-11 09:53:49'),
(16, '301-1000', 7, 'Modal', 0, 0, 0, 0, NULL, '2022-06-10 22:32:46', 'L', '2022-06-11 09:53:57'),
(17, '301-1001', 7, 'Saldo Awal', 0, 0, 0, 0, NULL, '2022-06-10 22:33:13', 'L', '2022-06-11 09:53:43'),
(18, '301-1002', 7, 'Laba Ditahan', 0, 0, 0, 0, NULL, '2022-06-10 22:33:38', 'L', '2022-06-11 09:53:37'),
(19, '401-1000', 8, 'Pendapatan', 0, 0, 0, 0, NULL, '2022-06-10 22:34:08', 'L', '2022-06-11 09:53:31'),
(20, '401-1001', 8, 'Pendapatan Dagang', 0, 0, 0, 0, NULL, '2022-06-10 22:34:46', 'L', '2022-06-11 09:53:25'),
(21, '401-2001', 8, 'Pendapatan Ongkos Kirim', 0, 0, 0, 0, NULL, '2022-06-10 22:35:18', 'L', '2022-06-11 09:53:19'),
(22, '401-2002', 8, 'Pendapatan Lain', 0, 0, 0, 0, NULL, '2022-06-10 22:35:40', 'L', '2022-06-11 09:53:13'),
(23, '501-1000', 9, 'Harga Pokok Penjualan', 0, 0, 0, 0, NULL, '2022-06-10 22:36:12', 'L', '2022-06-11 09:53:06'),
(24, '501-1001', 9, 'Harga Pokok Penjualan', 0, 0, 0, 0, NULL, '2022-06-10 22:36:39', 'L', '2022-06-11 09:53:01'),
(25, '501-2001', 9, 'Diskon Penjualan', 0, 0, 0, 0, NULL, '2022-06-10 22:37:09', 'L', '2022-06-11 09:52:56'),
(26, '601-1000', 10, 'Biaya', 0, 0, 0, 0, NULL, '2022-06-10 22:37:39', 'L', '2022-06-11 09:52:50'),
(27, '601-1001', 10, 'Biaya Gaji', 0, 0, 0, 0, NULL, '2022-06-10 22:38:10', 'L', '2022-06-11 09:52:44'),
(28, '601-1002', 10, 'Biaya Listrik', 0, 0, 0, 0, NULL, '2022-06-10 22:38:26', 'L', '2022-06-11 09:52:38'),
(29, '601-1003', 10, 'Biaya Internet', 0, 0, 0, 0, NULL, '2022-06-10 22:38:49', 'L', '2022-06-11 09:52:31'),
(30, '601-1004', 10, 'Biaya Ongkos Kirim', 0, 0, 0, 0, NULL, '2022-06-10 22:39:14', 'L', '2022-06-11 09:52:25'),
(31, '601-1005', 10, 'Biaya Lain', 0, 0, 0, 0, NULL, '2022-06-10 22:39:34', 'L', '2022-06-11 09:52:19'),
(32, '601-1006', 10, 'Biaya Selisih Stok', 0, 0, 0, 0, NULL, '2022-06-10 22:39:53', 'N', '2022-06-11 09:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2022-05-17 20:24:11', NULL),
(2, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2022-06-04 09:11:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-17 20:45:19', NULL),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-20 21:45:23', NULL),
(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-20 21:53:05', NULL),
(4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-22 00:28:01', NULL),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-22 00:28:07', NULL),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-22 21:09:43', NULL),
(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-22 21:10:19', NULL),
(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-22 21:10:40', NULL),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-22 21:11:47', NULL),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-22 22:17:50', NULL),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Pembelian at Menu Management', '', 1, '2022-05-22 22:22:18', NULL),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/1', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2022-05-22 22:22:42', NULL),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Penjualan at Menu Management', '', 1, '2022-05-22 22:23:13', NULL),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/2', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2022-05-22 22:24:15', NULL),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Inventory at Menu Management', '', 1, '2022-05-22 22:25:10', NULL),
(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/3', 'Update data Inventory at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2022-05-22 22:25:27', NULL),
(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Setup Data at Menu Management', '', 1, '2022-05-22 22:26:12', NULL),
(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/4', 'Update data Setup Data at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2022-05-22 22:26:20', NULL),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/5', 'Update data Akun Bank at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-05-22 22:32:01', NULL),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/account_banks/add-save', 'Add New Data Test at Akun Bank', '', 1, '2022-05-22 22:32:24', NULL),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/6', 'Update data Tipe Pembayaran at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-05-22 22:37:06', NULL),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types/add-save', 'Add New Data Cash at Tipe Pembayaran', '', 1, '2022-05-22 22:37:19', NULL),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types/add-save', 'Add New Data Transfer at Tipe Pembayaran', '', 1, '2022-05-22 22:37:25', NULL),
(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Akunting at Menu Management', '', 1, '2022-05-22 22:38:13', NULL),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/7', 'Update data Akunting at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-05-22 22:38:26', NULL),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/8', 'Update data Vendor at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2022-05-22 22:43:25', NULL),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Keuangan at Menu Management', '', 1, '2022-05-22 22:52:10', NULL),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/11', 'Update data Keuangan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2022-05-22 22:52:24', NULL),
(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data CLUTCH at Kategori Produk', '', 1, '2022-05-22 22:53:34', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data POUCH at Kategori Produk', '', 1, '2022-05-22 22:53:46', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data FOOTWEAR at Kategori Produk', '', 1, '2022-05-22 22:53:53', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data BAG at Kategori Produk', '', 1, '2022-05-22 22:54:01', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data ACCESSORIES at Kategori Produk', '', 1, '2022-05-22 22:54:08', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data GLASSES at Kategori Produk', '', 1, '2022-05-22 22:54:19', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data WALLET at Kategori Produk', '', 1, '2022-05-22 22:54:30', NULL),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data OUTER at Kategori Produk', '', 1, '2022-05-22 22:54:44', NULL),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data PANTS at Kategori Produk', '', 1, '2022-05-22 22:54:49', NULL),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data TSHIRT at Kategori Produk', '', 1, '2022-05-22 22:55:19', NULL),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data JACKET at Kategori Produk', '', 1, '2022-05-22 22:55:25', NULL),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data SWEATSHIRT at Kategori Produk', '', 1, '2022-05-22 22:55:31', NULL),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data TOTEBAG at Kategori Produk', '', 1, '2022-05-22 22:55:45', NULL),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-22 23:03:45', NULL),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-22 23:04:08', NULL),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/users/add-save', 'Add New Data Admin at Users Management', '', 1, '2022-05-22 23:04:57', NULL),
(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-22 23:05:11', NULL),
(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-05-22 23:05:16', NULL),
(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/vendors', 'Try view the data :name at Vendor', '', 2, '2022-05-22 23:27:55', NULL),
(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types', 'Try view the data :name at Tipe Pembayaran', '', 2, '2022-05-22 23:29:28', NULL),
(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/account_banks', 'Try view the data :name at Akun Bank', '', 2, '2022-05-22 23:29:32', NULL),
(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-05-22 23:29:41', NULL),
(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-05-28 05:22:11', NULL),
(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-05-28 05:22:23', NULL),
(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-28 05:22:30', NULL),
(54, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/10', 'Update data Category Produk at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-05-28 05:24:30', NULL),
(55, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/12', 'Update data Ekspedisi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-05-28 05:24:37', NULL),
(56, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data JNE at Ekspedisi', '', 1, '2022-05-28 05:25:03', NULL),
(57, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data TIKI at Ekspedisi', '', 1, '2022-05-28 05:25:10', NULL),
(58, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data PAKEL at Ekspedisi', '', 1, '2022-05-28 05:25:17', NULL),
(59, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data Sicepat at Ekspedisi', '', 1, '2022-05-28 05:25:23', NULL),
(60, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/edit-save/3', 'Update data PAXEL at Ekspedisi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>PAKEL</td><td>PAXEL</td></tr></tbody></table>', 1, '2022-05-28 05:25:34', NULL),
(61, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data SLROOM at Vendor', '', 1, '2022-05-28 05:27:56', NULL),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data AULUX at Vendor', '', 1, '2022-05-28 05:28:16', NULL),
(63, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data LUXURAGE at Vendor', '', 1, '2022-05-28 05:28:35', NULL),
(64, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/13', 'Update data Brand at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2022-05-28 05:35:31', NULL),
(65, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data YVES SAINT LAURENT at Brand', '', 1, '2022-05-28 05:36:02', NULL),
(66, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data DIOR at Brand', '', 1, '2022-05-28 05:36:11', NULL),
(67, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data PRADA at Brand', '', 1, '2022-05-28 05:36:20', NULL),
(68, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BOTTEGA VENETA at Brand', '', 1, '2022-05-28 05:36:29', NULL),
(69, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data LONGCHAMP at Brand', '', 1, '2022-05-28 05:37:05', NULL),
(70, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data TORY BURCH at Brand', '', 1, '2022-05-28 05:37:13', NULL),
(71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data GUCCI at Brand', '', 1, '2022-05-28 05:37:20', NULL),
(72, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data HUGO BOSS at Brand', '', 1, '2022-05-28 05:37:34', NULL),
(73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BALENCIAGA at Brand', '', 1, '2022-05-28 05:37:40', NULL),
(74, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data JACQUEMUS at Brand', '', 1, '2022-05-28 05:37:48', NULL),
(75, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data FENDI at Brand', '', 1, '2022-05-28 05:37:55', NULL),
(76, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BURBERRY at Brand', '', 1, '2022-05-28 05:38:02', NULL),
(77, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data CHIARA FERRAGNI at Brand', '', 1, '2022-05-28 05:38:09', NULL),
(78, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data VALENTINO at Brand', '', 1, '2022-05-28 05:38:20', NULL),
(79, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/14', 'Update data Produk at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-05-28 06:01:28', NULL),
(80, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data GUCCI Women GG Espadrilles Mules in Black GHW [36,5] at Produk', '', 1, '2022-05-28 06:09:12', NULL),
(81, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data BOSS Small Logo Jogger Pants in Black [M] at Produk', '', 1, '2022-05-28 06:09:59', NULL),
(82, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/edit-save/1', 'Update data GUCCI Women GG Espadrilles Mules in Black GHW [36,5] at Produk', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>000001</td><td></td></tr><tr><td>brand_id</td><td>6</td><td>1</td></tr></tbody></table>', 1, '2022-05-28 06:10:13', NULL),
(83, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_photos/add-save', 'Add New Data  at Photo Produk', '', 1, '2022-05-28 06:52:50', NULL),
(84, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/16', 'Update data Pesanan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-05-28 07:00:05', NULL),
(85, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-05-28 16:52:53', NULL),
(86, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders', 'Try view the data :name at Pesanan', '', 2, '2022-05-28 16:53:02', NULL),
(87, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-05-28 16:53:12', NULL),
(88, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-28 16:53:21', NULL),
(89, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEst at Produk', '', 1, '2022-05-28 17:18:20', NULL),
(90, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABCD at Vendor', '', 1, '2022-05-28 17:51:50', NULL),
(91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/1', 'Delete data ABCD at Vendor', '', 1, '2022-05-28 17:52:25', NULL),
(92, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABC at Vendor', '', 1, '2022-05-28 17:52:38', NULL),
(93, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data DEFGHIJK at Vendor', '', 1, '2022-05-28 17:52:58', NULL),
(94, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data RTHI at Vendor', '', 1, '2022-05-28 17:53:47', NULL),
(95, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/2', 'Delete data ABC at Vendor', '', 1, '2022-05-28 17:54:22', NULL),
(96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/3', 'Delete data DEFGHIJK at Vendor', '', 1, '2022-05-28 17:54:25', NULL),
(97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/4', 'Delete data RTHI at Vendor', '', 1, '2022-05-28 17:54:28', NULL),
(98, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABCD TEST 123 at Vendor', '', 1, '2022-05-28 17:55:32', NULL),
(99, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/5', 'Delete data ABCD TEST 123 at Vendor', '', 1, '2022-05-28 17:56:19', NULL),
(100, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABC BCD at Vendor', '', 1, '2022-05-28 17:58:05', NULL),
(101, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data Fashion at Kategori Produk', '', 1, '2022-05-28 18:03:53', NULL),
(102, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data GLASSES at Kategori Produk', '', 1, '2022-05-28 18:05:19', NULL),
(103, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/delete/1', 'Delete data TEst at Produk', '', 1, '2022-05-28 18:05:42', NULL),
(104, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/delete/1', 'Delete data Fashion at Kategori Produk', '', 1, '2022-05-28 18:05:49', NULL),
(105, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data CHIARA FERRAGNI at Brand', '', 1, '2022-05-28 18:10:02', NULL),
(106, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data VALENTINO at Brand', '', 1, '2022-05-28 18:10:07', NULL),
(107, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/17', 'Update data Penerimaan Barang at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-05-28 18:50:28', NULL),
(108, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data GLASSES 01 at Produk', '', 1, '2022-05-28 21:32:28', NULL),
(109, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEST at Produk', '', 1, '2022-05-28 21:44:26', NULL),
(110, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/delete/1', 'Delete data TEST at Produk', '', 1, '2022-05-28 21:45:12', NULL),
(111, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEST 123 at Produk', '', 1, '2022-05-28 21:45:45', NULL),
(112, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-05-29 18:05:22', NULL),
(113, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/goods_receipt', 'Try view the data :name at Penerimaan Barang', '', 2, '2022-05-29 18:05:29', NULL),
(114, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-05-29 18:05:35', NULL),
(115, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-05-29 18:05:50', NULL),
(116, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-05-30 00:34:36', NULL),
(117, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-06-04 07:11:33', NULL),
(118, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors', 'Try view the data :name at Vendor', '', 2, '2022-06-04 07:11:36', NULL),
(119, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-06-04 07:11:40', NULL),
(120, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-04 07:11:52', NULL),
(121, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data Glass Kacamata Non Lot at Produk', '', 1, '2022-06-04 07:29:20', NULL),
(122, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data Glass Kacamata Lot Number at Produk', '', 1, '2022-06-04 07:29:36', NULL),
(123, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-04 09:11:17', NULL),
(124, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-06-04 09:11:23', NULL),
(125, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-06-04 09:11:28', NULL),
(126, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-04 09:11:35', NULL),
(127, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', 1, '2022-06-04 09:14:25', NULL),
(128, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data Tarjo at Vendor', '', 1, '2022-06-04 09:24:35', NULL),
(129, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', 1, '2022-06-04 09:25:07', NULL),
(130, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-06-04 20:54:02', NULL),
(131, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders', 'Try view the data :name at Pesanan', '', 2, '2022-06-04 20:54:08', NULL),
(132, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-06-04 20:54:12', NULL),
(133, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-04 20:54:21', NULL),
(134, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-05 03:34:44', NULL),
(135, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 03:34:52', NULL),
(136, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 03:36:35', NULL),
(137, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-05 03:41:09', NULL),
(138, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 03:41:17', NULL),
(139, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/edit-save/5', 'Update data  at Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060005</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>subtotal</td><td>100000</td><td>500000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', 1, '2022-06-05 04:32:46', NULL),
(140, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 05:22:01', NULL),
(141, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 05:23:05', NULL),
(142, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 05:24:56', NULL),
(143, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 06:36:02', NULL),
(144, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 06:41:18', NULL),
(145, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-05 06:58:21', NULL),
(146, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', 2, '2022-06-05 06:58:30', NULL),
(147, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', 2, '2022-06-05 06:58:34', NULL),
(148, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 06:58:42', NULL),
(149, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 06:59:51', NULL),
(150, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:00:40', NULL),
(151, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:05:20', NULL),
(152, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:06:42', NULL),
(153, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:07:09', NULL),
(154, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:08:06', NULL),
(155, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:18:26', NULL),
(156, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:28:39', NULL),
(157, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:33:28', NULL),
(158, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:34:46', NULL),
(159, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', 1, '2022-06-05 07:39:44', NULL),
(160, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/menu_management/edit-save/18', 'Update data Item List at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-06-05 19:15:24', NULL),
(161, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/menu_management/edit-save/19', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>2</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-06-05 20:41:46', NULL),
(162, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/customers/add-save', 'Add New Data Ricky at Customer', '', 1, '2022-06-05 20:44:14', NULL),
(163, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-05 22:39:40', NULL),
(164, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 22:39:50', NULL),
(165, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-05 23:29:55', NULL),
(166, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-05 23:30:03', NULL),
(167, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/add-save', 'Add New Data Bank Mandiri Rek at Akun Bank', '', 1, '2022-06-06 00:25:44', NULL),
(168, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/edit-save/2', 'Update data Defaut AP Account at Akun Bank', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>account_name</td><td>Bank Mandiri Rek</td><td>Defaut AP Account</td></tr><tr><td>bank_name</td><td>Mandiri</td><td>BCA</td></tr><tr><td>account_number</td><td>000x21</td><td>xxxx</td></tr></tbody></table>', 1, '2022-06-06 00:41:23', NULL),
(169, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/edit-save/1', 'Update data Test at Akun Bank', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-06-06 00:41:33', NULL),
(170, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/delete/1', 'Delete data Test at Akun Bank', '', 1, '2022-06-06 00:41:38', NULL),
(171, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-06 03:36:49', NULL),
(172, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-06 03:38:31', NULL),
(173, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-06 05:27:21', NULL),
(174, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-06 05:27:37', NULL),
(175, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-06 05:44:22', NULL),
(176, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-06 05:44:36', NULL),
(177, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', 1, '2022-06-06 05:52:06', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(178, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', 1, '2022-06-06 06:00:39', NULL),
(179, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/edit-save/9', 'Update data  at Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>200000</td><td>4000000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>3800000</td><td>0</td></tr></tbody></table>', 1, '2022-06-06 06:34:08', NULL),
(180, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-06 08:06:29', NULL),
(181, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-06 08:06:35', NULL),
(182, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', 1, '2022-06-06 08:09:29', NULL),
(183, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 00:43:16', NULL),
(184, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 00:51:59', NULL),
(185, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-07 01:07:32', NULL),
(186, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 01:07:39', NULL),
(187, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-07 19:32:06', NULL),
(188, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 19:32:16', NULL),
(189, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-07 19:48:42', NULL),
(190, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 19:48:51', NULL),
(191, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-07 19:49:52', NULL),
(192, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 19:51:20', NULL),
(193, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-07 19:59:13', NULL),
(194, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 19:59:25', NULL),
(195, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/edit-save/27', 'Update data  at Penerimaan Barang', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>GR-ABC-122060027</td><td></td></tr><tr><td>purchase_order_id</td><td>5</td><td>9</td></tr><tr><td>po_vendor</td><td></td><td></td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', 1, '2022-06-07 20:17:19', NULL),
(196, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-07 20:31:00', NULL),
(197, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-08 18:48:30', NULL),
(198, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-08 18:48:39', NULL),
(199, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-09 06:47:50', NULL),
(200, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-09 06:47:59', NULL),
(201, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-10 21:17:39', NULL),
(202, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/20', 'Update data Kelompok Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-10 21:55:32', NULL),
(203, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Asset at Kelompok Akun', '', 1, '2022-06-10 21:56:02', NULL),
(204, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/delete/1', 'Delete data Asset at Kelompok Akun', '', 1, '2022-06-10 21:57:41', NULL),
(205, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Asset at Kelompok Akun', '', 1, '2022-06-10 21:59:06', NULL),
(206, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Liability at Kelompok Akun', '', 1, '2022-06-10 21:59:11', NULL),
(207, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Equity at Kelompok Akun', '', 1, '2022-06-10 21:59:18', NULL),
(208, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Income at Kelompok Akun', '', 1, '2022-06-10 21:59:25', NULL),
(209, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Cost of Goods Sold at Kelompok Akun', '', 1, '2022-06-10 21:59:39', NULL),
(210, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Expense at Kelompok Akun', '', 1, '2022-06-10 21:59:47', NULL),
(211, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/21', 'Update data Tipe Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2022-06-10 22:02:10', NULL),
(212, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Cash/Bank at Tipe Akun', '', 1, '2022-06-10 22:05:52', NULL),
(213, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Account Receivable at Tipe Akun', '', 1, '2022-06-10 22:06:07', NULL),
(214, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Inventory at Tipe Akun', '', 1, '2022-06-10 22:06:17', NULL),
(215, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Other Current Asset at Tipe Akun', '', 1, '2022-06-10 22:06:27', NULL),
(216, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Other Current Liability at Tipe Akun', '', 1, '2022-06-10 22:06:41', NULL),
(217, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Account Payables at Tipe Akun', '', 1, '2022-06-10 22:06:54', NULL),
(218, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Equity at Tipe Akun', '', 1, '2022-06-10 22:07:12', NULL),
(219, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Income at Tipe Akun', '', 1, '2022-06-10 22:07:29', NULL),
(220, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Cost of Goods Sold at Tipe Akun', '', 1, '2022-06-10 22:08:14', NULL),
(221, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Expense at Tipe Akun', '', 1, '2022-06-10 22:08:25', NULL),
(222, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:24:26', NULL),
(223, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:25:11', NULL),
(224, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:25:41', NULL),
(225, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:26:09', NULL),
(226, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:26:26', NULL),
(227, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:26:48', NULL),
(228, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:27:07', NULL),
(229, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:27:37', NULL),
(230, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:28:13', NULL),
(231, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:28:41', NULL),
(232, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/22', 'Update data Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-10 22:29:10', NULL),
(233, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:29:52', NULL),
(234, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:30:32', NULL),
(235, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:31:17', NULL),
(236, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:31:58', NULL),
(237, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:32:22', NULL),
(238, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:32:46', NULL),
(239, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:33:13', NULL),
(240, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:33:38', NULL),
(241, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:34:08', NULL),
(242, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:34:46', NULL),
(243, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:35:18', NULL),
(244, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:35:40', NULL),
(245, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:36:13', NULL),
(246, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:36:39', NULL),
(247, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:37:09', NULL),
(248, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:37:39', NULL),
(249, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:38:10', NULL),
(250, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:38:26', NULL),
(251, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:38:49', NULL),
(252, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:39:14', NULL),
(253, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:39:34', NULL),
(254, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', 1, '2022-06-10 22:39:53', NULL),
(255, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-11 04:40:55', NULL),
(256, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/23', 'Update data Alasan Opname at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2022-06-11 04:53:44', NULL),
(257, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian Inventaris at Alasan Opname', '', 1, '2022-06-11 04:54:09', NULL),
(258, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian dari Penerimaan at Alasan Opname', '', 1, '2022-06-11 04:54:26', NULL),
(259, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-11 04:56:43', NULL),
(260, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian Inventaris at Alasan Opname', '', 1, '2022-06-11 04:57:38', NULL),
(261, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian dari Penerimaan at Alasan Opname', '', 1, '2022-06-11 04:57:45', NULL),
(262, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-11 04:58:40', NULL),
(263, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-11 04:59:35', NULL),
(264, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/24', 'Update data Stok Opname at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2022-06-11 05:01:02', NULL),
(265, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stock_opnames/add-save', 'Add New Data OP-22060004 at Stok Opname', '', 1, '2022-06-11 05:39:01', NULL),
(266, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/25', 'Update data Jenis Transaksi Jurnal at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-11 07:39:04', NULL),
(267, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Purchase Down Payment at Jenis Transaksi Jurnal', '', 1, '2022-06-11 07:39:54', NULL),
(268, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Goods Receipt at Jenis Transaksi Jurnal', '', 1, '2022-06-11 07:40:03', NULL),
(269, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Sales Down Payment at Jenis Transaksi Jurnal', '', 1, '2022-06-11 07:40:14', NULL),
(270, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Delivery Order at Jenis Transaksi Jurnal', '', 1, '2022-06-11 07:40:22', NULL),
(271, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Inventory Adjustment at Jenis Transaksi Jurnal', '', 1, '2022-06-11 07:40:30', NULL),
(272, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/11', 'Update data Keuangan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-06-11 07:49:19', NULL),
(273, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/26', 'Update data Transaksi Jurnal at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>7</td><td></td></tr></tbody></table>', 1, '2022-06-11 07:49:29', NULL),
(274, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', 1, '2022-06-11 08:23:12', NULL),
(275, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/1', 'Delete data 1 at Transaksi Jurnal', '', 1, '2022-06-11 08:23:26', NULL),
(276, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/2', 'Delete data 2 at Transaksi Jurnal', '', 1, '2022-06-11 08:23:29', NULL),
(277, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/3', 'Delete data 3 at Transaksi Jurnal', '', 1, '2022-06-11 08:23:31', NULL),
(278, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', 1, '2022-06-11 08:24:01', NULL),
(279, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', 1, '2022-06-11 08:24:53', NULL),
(280, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/32', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:47:18', NULL),
(281, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/3', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:50:18', NULL),
(282, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/2', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:50:24', NULL),
(283, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/1', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:50:32', NULL),
(284, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/4', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:50:49', NULL),
(285, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/6', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:51:20', NULL),
(286, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/7', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:51:30', NULL),
(287, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/8', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-11 09:51:41', NULL),
(288, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/31', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:19', NULL),
(289, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/30', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:25', NULL),
(290, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/29', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:31', NULL),
(291, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/28', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:38', NULL),
(292, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/27', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:44', NULL),
(293, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/26', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:50', NULL),
(294, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/25', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:52:56', NULL),
(295, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/24', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:01', NULL),
(296, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/23', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:06', NULL),
(297, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/22', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:13', NULL),
(298, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/21', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:19', NULL),
(299, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/20', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:25', NULL),
(300, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/19', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:31', NULL),
(301, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/18', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:37', NULL),
(302, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/17', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:43', NULL),
(303, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/15', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:49', NULL),
(304, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/16', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:53:57', NULL),
(305, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/14', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:54:03', NULL),
(306, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/13', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', 1, '2022-06-11 09:54:10', NULL),
(307, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Laporan at Menu Management', '', 1, '2022-06-12 05:32:31', NULL),
(308, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Neraca at Menu Management', '', 1, '2022-06-12 05:34:15', NULL),
(309, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/28', 'Update data Neraca at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', 1, '2022-06-12 05:34:39', NULL),
(310, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Laba Rugi at Menu Management', '', 1, '2022-06-12 05:34:58', NULL),
(311, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Pembelian at Menu Management', '', 1, '2022-06-12 05:37:07', NULL),
(312, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Penjualan at Menu Management', '', 1, '2022-06-12 05:38:02', NULL),
(313, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Stok at Menu Management', '', 1, '2022-06-12 05:39:55', NULL),
(314, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:02:52', NULL),
(315, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:03:13', NULL),
(316, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:03:37', NULL),
(317, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:05:50', NULL),
(318, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:06:33', NULL),
(319, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:06:56', NULL),
(320, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:08:47', NULL),
(321, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/7', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-12 06:08:55', NULL),
(322, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:09:17', NULL),
(323, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:09:58', NULL),
(324, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:10:23', NULL),
(325, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/10', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-12 06:11:06', NULL),
(326, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/10', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-12 06:11:26', NULL),
(327, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:12:03', NULL),
(328, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/10', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-12 06:13:54', NULL),
(329, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/9', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-12 06:14:00', NULL),
(330, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:14:27', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(331, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:14:53', NULL),
(332, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:15:20', NULL),
(333, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:15:42', NULL),
(334, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/12', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', 1, '2022-06-12 06:16:25', NULL),
(335, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:17:00', NULL),
(336, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:17:24', NULL),
(337, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:17:43', NULL),
(338, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-12 06:22:52', NULL),
(339, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/28', 'Update data Neraca at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminTableNeracaController@getFormNeraca</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2022-06-12 06:46:20', NULL),
(340, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>#</td><td>AdminTableNeracaController@getFormProfitLost</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-12 06:47:41', NULL),
(341, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-12 06:48:32', NULL),
(342, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-06-12 06:49:20', NULL),
(343, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminGoodsReceiptController@getFormStok</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:23:43', NULL),
(344, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/31', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminSalesOrdersController@getFormSales</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:24:23', NULL),
(345, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/30', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>#</td><td>AdminPurchaseOrdersController@getFormPurchase</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:25:04', NULL),
(346, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/30', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:25:25', NULL),
(347, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/31', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:25:35', NULL),
(348, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:25:41', NULL),
(349, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-06-12 09:26:45', NULL),
(350, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-13 07:35:15', NULL),
(351, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-13 07:35:37', NULL),
(352, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-06-13 07:48:36', NULL),
(353, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-13 07:49:40', NULL),
(354, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-14 01:54:56', NULL),
(355, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-14 06:43:24', NULL),
(356, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-14 21:12:38', NULL),
(357, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/19', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>padding_left</td><td></td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-14 21:48:54', NULL),
(358, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:50:10', NULL),
(359, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/20', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>account_id</td><td>5</td><td>11</td></tr><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>padding_left</td><td></td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-14 21:50:27', NULL),
(360, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/20', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>account_id</td><td>11</td><td>5</td></tr><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>padding_left</td><td></td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-14 21:50:42', NULL),
(361, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:52:26', NULL),
(362, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:52:47', NULL),
(363, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:55:17', NULL),
(364, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:55:44', NULL),
(365, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:56:07', NULL),
(366, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:56:32', NULL),
(367, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:56:58', NULL),
(368, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:57:28', NULL),
(369, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', 1, '2022-06-14 21:57:51', NULL),
(370, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', ' logout', '', NULL, '2022-06-15 02:10:34', NULL),
(371, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-15 02:10:46', NULL),
(372, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-06-15 06:27:00', NULL),
(373, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2022-06-16 15:15:40', NULL),
(374, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:26:42', NULL),
(375, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:27:09', NULL),
(376, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:27:28', NULL),
(377, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:27:55', NULL),
(378, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:28:07', NULL),
(379, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:28:20', NULL),
(380, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:28:37', NULL),
(381, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:28:52', NULL),
(382, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:29:07', NULL),
(383, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:29:26', NULL),
(384, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:29:35', NULL),
(385, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:30:15', NULL),
(386, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:30:43', NULL),
(387, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:31:12', NULL),
(388, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:31:28', NULL),
(389, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:31:45', NULL),
(390, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:31:57', NULL),
(391, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:32:09', NULL),
(392, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:32:28', NULL),
(393, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Tambah data baru  pada Tabel Neraca Laba Rugi', '', 1, '2022-06-16 15:32:50', NULL),
(394, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/33', 'Memperbaharui data  pada Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>account_id</td><td>19</td><td>21</td></tr><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>padding_left</td><td></td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', 1, '2022-06-16 15:33:16', NULL),
(395, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2022-06-16 16:06:45', NULL),
(396, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2022-06-16 16:06:57', NULL),
(397, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2022-06-17 09:27:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Pembelian', 'URL', '#', 'normal', 'fa fa-tag', 0, 1, 0, 1, 1, '2022-05-22 22:22:18', '2022-05-22 22:22:42'),
(2, 'Penjualan', 'URL', '#', 'normal', 'fa fa-tags', 0, 1, 0, 1, 2, '2022-05-22 22:23:13', '2022-05-22 22:24:14'),
(3, 'Inventory', 'URL', '#', 'normal', 'fa fa-dropbox', 0, 1, 0, 1, 3, '2022-05-22 22:25:10', '2022-05-22 22:25:27'),
(4, 'Setup Data', 'URL', '#', 'normal', 'fa fa-gears', 0, 1, 0, 1, 6, '2022-05-22 22:26:12', '2022-05-22 22:26:20'),
(5, 'Akun Bank', 'Route', 'AdminAccountBanksControllerGetIndex', 'normal', 'fa fa-money', 4, 1, 0, 1, 4, '2022-05-22 22:30:55', '2022-05-22 22:32:01'),
(6, 'Tipe Pembayaran', 'Route', 'AdminPaymentTypesControllerGetIndex', 'normal', 'fa fa-gear', 4, 1, 0, 1, 5, '2022-05-22 22:36:26', '2022-05-22 22:37:06'),
(7, 'Akunting', 'URL', '#', 'normal', 'fa fa-th-list', 0, 1, 0, 1, 4, '2022-05-22 22:38:13', '2022-05-22 22:38:26'),
(8, 'Vendor', 'Route', 'AdminVendorsControllerGetIndex', 'normal', 'fa fa-users', 1, 1, 0, 1, 1, '2022-05-22 22:42:13', '2022-05-22 22:43:25'),
(9, 'Customer', 'Route', 'AdminCustomersControllerGetIndex', NULL, 'fa fa-heart', 2, 1, 0, 1, 1, '2022-05-22 22:45:39', NULL),
(10, 'Category Produk', 'Route', 'AdminProductCategoriesControllerGetIndex', 'normal', 'fa fa-gear', 3, 1, 0, 1, 4, '2022-05-22 22:50:01', '2022-05-28 05:24:30'),
(11, 'Keuangan', 'URL', '#', 'normal', 'fa fa-money', 0, 0, 0, 1, 3, '2022-05-22 22:52:09', '2022-06-11 07:49:18'),
(12, 'Ekspedisi', 'Route', 'AdminExpeditionsControllerGetIndex', 'normal', 'fa fa-truck', 4, 1, 0, 1, 7, '2022-05-28 05:23:37', '2022-05-28 05:24:37'),
(13, 'Brand', 'Route', 'AdminProductBrandsControllerGetIndex', 'normal', 'fa fa-star', 3, 1, 0, 1, 5, '2022-05-28 05:34:44', '2022-05-28 05:35:31'),
(14, 'Produk', 'Route', 'AdminProductsControllerGetIndex', 'normal', 'fa fa-barcode', 3, 1, 0, 1, 2, '2022-05-28 05:57:28', '2022-05-28 06:01:28'),
(15, 'Photo Produk', 'Route', 'AdminProductPhotosControllerGetIndex', NULL, 'fa fa-image', 0, 0, 0, 1, 1, '2022-05-28 06:46:33', NULL),
(16, 'Pesanan', 'Route', 'AdminPurchaseOrdersControllerGetIndex', 'normal', 'fa fa-th', 1, 1, 0, 1, 2, '2022-05-28 06:57:54', '2022-05-28 07:00:05'),
(17, 'Penerimaan Barang', 'Route', 'AdminGoodsReceiptControllerGetIndex', 'normal', 'fa fa-arrow-right', 1, 1, 0, 1, 3, '2022-05-28 18:45:17', '2022-05-28 18:50:28'),
(18, 'Item List', 'Route', 'AdminProducts25ControllerGetIndex', 'normal', 'fa fa-th-list', 3, 1, 0, 1, 1, '2022-06-05 19:14:32', '2022-06-05 19:15:24'),
(19, 'Penjualan', 'Route', 'AdminSalesOrdersControllerGetIndex', 'normal', 'fa fa-th', 2, 1, 0, 1, 2, '2022-06-05 20:37:54', '2022-06-05 20:41:46'),
(20, 'Kelompok Akun', 'Route', 'AdminCoaClassControllerGetIndex', 'normal', 'fa fa-list-alt', 4, 1, 0, 1, 1, '2022-06-10 21:54:41', '2022-06-10 21:55:32'),
(21, 'Tipe Akun', 'Route', 'AdminCoaTypeControllerGetIndex', 'normal', 'fa fa-list-ul', 4, 1, 0, 1, 2, '2022-06-10 22:01:37', '2022-06-10 22:02:10'),
(22, 'Akun', 'Route', 'AdminChartOfAccountsControllerGetIndex', 'normal', 'fa fa-th-list', 7, 1, 0, 1, 2, '2022-06-10 22:18:03', '2022-06-10 22:29:10'),
(23, 'Alasan Opname', 'Route', 'AdminStokOpnameTypeControllerGetIndex', 'normal', 'fa fa-th-list', 4, 1, 0, 1, 6, '2022-06-11 04:49:01', '2022-06-11 04:53:44'),
(24, 'Stok Opname', 'Route', 'AdminStockOpnamesControllerGetIndex', 'normal', 'fa fa-check', 3, 1, 0, 1, 3, '2022-06-11 05:00:02', '2022-06-11 05:01:02'),
(25, 'Jenis Transaksi Jurnal', 'Route', 'AdminTransactionTypesControllerGetIndex', 'normal', 'fa fa-list-ol', 4, 1, 0, 1, 3, '2022-06-11 07:37:25', '2022-06-11 07:39:04'),
(26, 'Transaksi Jurnal', 'Route', 'AdminJournalTransactionsControllerGetIndex', 'normal', 'fa fa-money', 7, 1, 0, 1, 1, '2022-06-11 07:43:23', '2022-06-11 07:49:29'),
(27, 'Laporan', 'URL', '#', 'normal', 'fa fa-folder', 0, 1, 0, 1, 5, '2022-06-12 05:32:31', NULL),
(28, 'Neraca', 'Controller & Method', 'AdminTableNeracaController@getFormNeraca', 'normal', 'fa fa-file-text', 27, 1, 0, 1, 5, '2022-06-12 05:34:15', '2022-06-12 06:46:20'),
(29, 'Laba Rugi', 'Controller & Method', 'AdminTableNeracaController@getFormProfitLost', 'normal', 'fa fa-file-text-o', 27, 1, 0, 1, 4, '2022-06-12 05:34:58', '2022-06-12 06:49:20'),
(30, 'Pembelian', 'Controller & Method', 'AdminPurchaseOrdersController@getFormPurchase', 'normal', 'fa fa-file-text', 27, 1, 0, 1, 1, '2022-06-12 05:37:07', '2022-06-12 09:25:25'),
(31, 'Penjualan', 'Controller & Method', 'AdminSalesOrdersController@getFormSales', 'normal', 'fa fa-file-text', 27, 1, 0, 1, 2, '2022-06-12 05:38:02', '2022-06-12 09:25:34'),
(32, 'Stok', 'Controller & Method', 'AdminGoodsReceiptController@getFormStok', 'normal', 'fa fa-file-o', 27, 1, 0, 1, 3, '2022-06-12 05:39:55', '2022-06-12 09:26:45'),
(33, 'Tabel Neraca Laba Rugi', 'Route', 'AdminTableNeracaControllerGetIndex', NULL, 'fa fa-gear', 0, 1, 0, 1, 7, '2022-06-12 05:54:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(3, 1, 2),
(4, 1, 1),
(7, 2, 2),
(8, 2, 1),
(11, 3, 2),
(12, 3, 1),
(15, 4, 2),
(16, 4, 1),
(18, 5, 2),
(19, 5, 1),
(21, 6, 2),
(22, 6, 1),
(25, 7, 2),
(26, 7, 1),
(28, 8, 2),
(29, 8, 1),
(30, 9, 1),
(32, NULL, 2),
(33, NULL, 1),
(37, 10, 2),
(38, 10, 1),
(39, 12, 2),
(40, 12, 1),
(42, 13, 2),
(43, 13, 1),
(45, 14, 2),
(46, 14, 1),
(47, 15, 1),
(49, 16, 2),
(50, 16, 1),
(52, 17, 2),
(53, 17, 1),
(55, 18, 2),
(56, 18, 1),
(58, 19, 2),
(59, 19, 1),
(61, 20, 2),
(62, 20, 1),
(64, 21, 2),
(65, 21, 1),
(67, 22, 2),
(68, 22, 1),
(70, 23, 2),
(71, 23, 1),
(73, 24, 2),
(74, 24, 1),
(76, 25, 2),
(77, 25, 1),
(79, 11, 2),
(80, 11, 1),
(81, 26, 2),
(82, 26, 1),
(83, 27, 2),
(84, 27, 1),
(97, 33, 1),
(98, 28, 2),
(99, 28, 1),
(104, 29, 2),
(105, 29, 1),
(112, 30, 2),
(113, 30, 1),
(114, 31, 2),
(115, 31, 1),
(118, 32, 2),
(119, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2022-05-17 20:24:11', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2022-05-17 20:24:11', NULL, NULL),
(12, 'Akun Bank', 'fa fa-money', 'account_banks', 'account_banks', 'AdminAccountBanksController', 0, 0, '2022-05-22 22:30:55', NULL, NULL),
(13, 'Tipe Pembayaran', 'fa fa-gear', 'payment_types', 'payment_types', 'AdminPaymentTypesController', 0, 0, '2022-05-22 22:36:26', NULL, NULL),
(14, 'Vendor', 'fa fa-users', 'vendors', 'vendors', 'AdminVendorsController', 0, 0, '2022-05-22 22:42:13', NULL, NULL),
(15, 'Customer', 'fa fa-heart', 'customers', 'customers', 'AdminCustomersController', 0, 0, '2022-05-22 22:45:39', NULL, NULL),
(16, 'Kategori Produk', 'fa fa-envelope-o', 'product_categories', 'product_categories', 'AdminProductCategoriesController', 0, 0, '2022-05-22 22:50:01', NULL, NULL),
(17, 'Ekspedisi', 'fa fa-truck', 'expeditions', 'expeditions', 'AdminExpeditionsController', 0, 0, '2022-05-28 05:23:37', NULL, NULL),
(18, 'Brand', 'fa fa-star', 'product_brands', 'product_brands', 'AdminProductBrandsController', 0, 0, '2022-05-28 05:34:44', NULL, NULL),
(19, 'Produk', 'fa fa-barcode', 'products', 'products', 'AdminProductsController', 0, 0, '2022-05-28 05:57:28', NULL, NULL),
(20, 'Detail Pembelian', 'fa fa-th-list', 'purchase_order_details', 'purchase_order_details', 'AdminPurchaseOrderDetailsController', 0, 0, '2022-05-28 06:28:32', NULL, NULL),
(21, 'Photo Produk', 'fa fa-image', 'product_photos', 'product_photos', 'AdminProductPhotosController', 0, 0, '2022-05-28 06:46:33', NULL, NULL),
(22, 'Pesanan', 'fa fa-th', 'purchase_orders', 'purchase_orders', 'AdminPurchaseOrdersController', 0, 0, '2022-05-28 06:57:54', NULL, NULL),
(23, 'Detail Penerimaan', 'fa fa-arrow-right', 'goods_receipt_details', 'goods_receipt_details', 'AdminGoodsReceiptDetailsController', 0, 0, '2022-05-28 18:42:40', NULL, NULL),
(24, 'Penerimaan Barang', 'fa fa-arrow-right', 'goods_receipt', 'goods_receipt', 'AdminGoodsReceiptController', 0, 0, '2022-05-28 18:45:17', NULL, NULL),
(25, 'Item List', 'fa fa-th-list', 'products25', 'products', 'AdminProducts25Controller', 0, 0, '2022-06-05 19:14:32', NULL, NULL),
(26, 'Product Item', 'fa fa-barcode', 'product_items', 'product_items', 'AdminProductItemsController', 0, 0, '2022-06-05 19:24:43', NULL, NULL),
(27, 'Penjualan', 'fa fa-th', 'sales_orders', 'sales_orders', 'AdminSalesOrdersController', 0, 0, '2022-06-05 20:37:54', NULL, NULL),
(28, 'Kelompok Akun', 'fa fa-list-alt', 'coa_class', 'coa_class', 'AdminCoaClassController', 0, 0, '2022-06-10 21:54:41', NULL, NULL),
(29, 'Tipe Akun', 'fa fa-list-ul', 'coa_type', 'coa_type', 'AdminCoaTypeController', 0, 0, '2022-06-10 22:01:37', NULL, NULL),
(30, 'Akun', 'fa fa-th-list', 'chart_of_accounts', 'chart_of_accounts', 'AdminChartOfAccountsController', 0, 0, '2022-06-10 22:18:03', NULL, NULL),
(31, 'Alasan Opname', 'fa fa-th-list', 'stok_opname_type', 'stok_opname_type', 'AdminStokOpnameTypeController', 0, 0, '2022-06-11 04:49:01', NULL, NULL),
(32, 'Stok Opname', 'fa fa-check', 'stock_opnames', 'stock_opnames', 'AdminStockOpnamesController', 0, 0, '2022-06-11 05:00:02', NULL, NULL),
(33, 'Jenis Transaksi Jurnal', 'fa fa-list-ol', 'transaction_types', 'transaction_types', 'AdminTransactionTypesController', 0, 0, '2022-06-11 07:37:25', NULL, NULL),
(34, 'Transaksi Jurnal', 'fa fa-money', 'journal_transactions', 'journal_transactions', 'AdminJournalTransactionsController', 0, 0, '2022-06-11 07:43:23', NULL, NULL),
(35, 'Tabel Neraca Laba Rugi', 'fa fa-gear', 'table_neraca', 'table_neraca', 'AdminTableNeracaController', 0, 0, '2022-06-12 05:54:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-red', '2022-05-17 20:24:11', NULL),
(2, 'admin', 0, 'skin-blue-light', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 1, 1, '2022-05-17 20:24:11', NULL),
(2, 1, 1, 1, 1, 1, 1, 2, '2022-05-17 20:24:11', NULL),
(3, 0, 1, 1, 1, 1, 1, 3, '2022-05-17 20:24:11', NULL),
(4, 1, 1, 1, 1, 1, 1, 4, '2022-05-17 20:24:11', NULL),
(5, 1, 1, 1, 1, 1, 1, 5, '2022-05-17 20:24:11', NULL),
(6, 1, 1, 1, 1, 1, 1, 6, '2022-05-17 20:24:11', NULL),
(7, 1, 1, 1, 1, 1, 1, 7, '2022-05-17 20:24:11', NULL),
(8, 1, 1, 1, 1, 1, 1, 8, '2022-05-17 20:24:11', NULL),
(9, 1, 1, 1, 1, 1, 1, 9, '2022-05-17 20:24:11', NULL),
(10, 1, 1, 1, 1, 1, 1, 10, '2022-05-17 20:24:11', NULL),
(11, 1, 0, 1, 0, 1, 1, 11, '2022-05-17 20:24:11', NULL),
(12, 1, 1, 1, 1, 1, 2, 4, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(19, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(20, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(22, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(24, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(25, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(26, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(27, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(28, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(29, 1, 1, 1, 1, 1, 1, 28, NULL, NULL),
(30, 1, 1, 1, 1, 1, 1, 29, NULL, NULL),
(31, 1, 1, 1, 1, 1, 1, 30, NULL, NULL),
(32, 1, 1, 1, 1, 1, 1, 31, NULL, NULL),
(33, 1, 1, 1, 1, 1, 1, 32, NULL, NULL),
(34, 1, 1, 1, 1, 1, 1, 33, NULL, NULL),
(35, 1, 1, 1, 1, 1, 1, 34, NULL, NULL),
(36, 1, 1, 1, 1, 1, 1, 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', 'ffffff', 'text', NULL, 'Input hexacode', '2022-05-17 20:24:11', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2022-05-17 20:24:11', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', NULL, 'upload_image', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2022-05-17 20:24:11', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2022-05-17 20:24:11', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'VL Online', 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2022-05-17 20:24:11', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2022-05/4de9c388a82df6a27564ac8fa41fa841.png', 'upload_image', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2022-05-17 20:24:11', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', NULL, 'admin@crudbooster.com', '$2y$10$5Z/P177h9JK1.NB0Q1Z74uj5ILh2BuTxjNt.BmnEU4nP3Pch00Efa', 1, '2022-05-17 20:24:11', NULL, 'Active'),
(2, 'Admin', 'uploads/1/2022-05/img_146257.png', 'admin@vl.com', '$2y$10$.mF8ig1e0WrBb48K8RB8uuTzRPF0MgW7L3D/xEJtgiixOG5y/x.Wa', 2, '2022-05-22 23:04:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coa_class`
--

CREATE TABLE `coa_class` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coa_class`
--

INSERT INTO `coa_class` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Asset', NULL, '2022-06-10 21:59:06', NULL),
(2, 'Liability', NULL, '2022-06-10 21:59:11', NULL),
(3, 'Equity', NULL, '2022-06-10 21:59:18', NULL),
(4, 'Income', NULL, '2022-06-10 21:59:25', NULL),
(5, 'Cost of Goods Sold', NULL, '2022-06-10 21:59:39', NULL),
(6, 'Expense', NULL, '2022-06-10 21:59:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coa_type`
--

CREATE TABLE `coa_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `coa_class_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coa_type`
--

INSERT INTO `coa_type` (`id`, `coa_class_id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cash/Bank', NULL, '2022-06-10 22:05:52', NULL),
(2, 1, 'Account Receivable', NULL, '2022-06-10 22:06:07', NULL),
(3, 1, 'Inventory', NULL, '2022-06-10 22:06:17', NULL),
(4, 1, 'Other Current Asset', NULL, '2022-06-10 22:06:27', NULL),
(5, 2, 'Other Current Liability', NULL, '2022-06-10 22:06:41', NULL),
(6, 2, 'Account Payables', NULL, '2022-06-10 22:06:54', NULL),
(7, 3, 'Equity', NULL, '2022-06-10 22:07:12', NULL),
(8, 4, 'Income', NULL, '2022-06-10 22:07:29', NULL),
(9, 5, 'Cost of Goods Sold', NULL, '2022-06-10 22:08:14', NULL),
(10, 6, 'Expense', NULL, '2022-06-10 22:08:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `code`, `name`, `address`, `phone`, `facebook`, `instagram`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'RIC-1', 'Ricky', 'Jl Baru|Bandung|46321', '0999', 'facebook account', 'instagram account', '-', '1', '2022-06-05 20:44:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expeditions`
--

CREATE TABLE `expeditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expeditions`
--

INSERT INTO `expeditions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'JNE', '2022-05-28 05:25:03', NULL),
(2, 'TIKI', '2022-05-28 05:25:10', NULL),
(3, 'PAXEL', '2022-05-28 05:25:17', '2022-05-28 05:25:34'),
(4, 'Sicepat', '2022-05-28 05:25:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `goods_receipt`
--

CREATE TABLE `goods_receipt` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `purchase_order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po_vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goods_receipt_details`
--

CREATE TABLE `goods_receipt_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `good_receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_in` int(11) NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `is_store_vendor_location` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `goods_receipt_details`
--
DELIMITER $$
CREATE TRIGGER `lot_number_insert` AFTER INSERT ON `goods_receipt_details` FOR EACH ROW BEGIN
DECLARE vendorId INT;
DECLARE categoryID INT;
DECLARE brandID INT;
DECLARE productCost INT;
DECLARE productPrice INT;
DECLARE receiveCode VARCHAR(45);
DECLARE lotNumber VARCHAR(45);
DECLARE receiveDate DATE;
#puchase info
SET vendorId = (SELECT vendor_id from goods_receipt where id = NEW.good_receipt_id);
SET receiveCode = (SELECT code from goods_receipt where id = NEW.good_receipt_id);
SET receiveDate  =  (SELECT receipt_date from goods_receipt where id = NEW.good_receipt_id);

#barang info
IF NEW.lot_number IS NULL THEN 
INSERT INTO product_items (receive_code,receive_date,product_id,vendor_id,product_cost,product_price,qty,lot_number,description) 
VALUES (receiveCode,receiveDate,NEW.product_id,vendorId,NEW.price,1000,NEW.qty_in,NEW.lot_number,'-' );
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_stock_delete` AFTER DELETE ON `goods_receipt_details` FOR EACH ROW BEGIN
update products set qty_onhand = qty_onhand - OLD.qty_in where id = OLD.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_stock_insert` AFTER INSERT ON `goods_receipt_details` FOR EACH ROW BEGIN
update products set qty_onhand = qty_onhand + NEW.qty_in where id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journal_transactions`
--

CREATE TABLE `journal_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_no` int(11) NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `d_k` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_reverse_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_transactions`
--

INSERT INTO `journal_transactions` (`id`, `transaction_type_id`, `transaction_date`, `transaction_number`, `entry_no`, `ref_no`, `account_id`, `d_k`, `account_reverse_id`, `total`, `memo`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 1, '2022-06-11', '1022060001', 1, 'xxx', 1, 'K', 12, 20000, 'test', '1', '2022-06-11 08:24:01', NULL),
(5, 1, '2022-06-11', '1022060001', 1, 'xxx', 12, 'D', 1, 20000, 'test', '1', NULL, NULL),
(6, 4, '2022-06-11', '4022060006', 6, 'xxx', 21, 'D', 4, 2222, 'test', '1', '2022-06-11 08:24:53', NULL),
(7, 4, '2022-06-11', '4022060006', 6, 'xxx', 4, 'K', 21, 2222, 'test', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_08_07_145904_add_table_cms_apicustom', 1),
(2, '2016_08_07_150834_add_table_cms_dashboard', 1),
(3, '2016_08_07_151210_add_table_cms_logs', 1),
(4, '2016_08_07_151211_add_details_cms_logs', 1),
(5, '2016_08_07_152014_add_table_cms_privileges', 1),
(6, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(7, '2016_08_07_152320_add_table_cms_settings', 1),
(8, '2016_08_07_152421_add_table_cms_users', 1),
(9, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(10, '2016_08_07_154624_add_table_cms_moduls', 1),
(11, '2016_08_17_225409_add_status_cms_users', 1),
(12, '2016_08_20_125418_add_table_cms_notifications', 1),
(13, '2016_09_04_033706_add_table_cms_email_queues', 1),
(14, '2016_09_16_035347_add_group_setting', 1),
(15, '2016_09_16_045425_add_label_setting', 1),
(16, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(17, '2016_10_01_141740_add_method_type_apicustom', 1),
(18, '2016_10_01_141846_add_parameters_apicustom', 1),
(19, '2016_10_01_141934_add_responses_apicustom', 1),
(20, '2016_10_01_144826_add_table_apikey', 1),
(21, '2016_11_14_141657_create_cms_menus', 1),
(22, '2016_11_15_132350_create_cms_email_templates', 1),
(23, '2016_11_15_190410_create_cms_statistics', 1),
(24, '2016_11_17_102740_create_cms_statistic_components', 1),
(25, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
(26, '2022_05_23_052825_create_account_bank', 2),
(27, '2022_05_23_053417_create_payment_types', 3),
(34, '2022_05_28_122107_expeditions', 5),
(44, '2022_05_28_131529_create_purchase_order_details', 9),
(45, '2022_05_28_134246_create_product_photos', 9),
(50, '2022_05_23_053933_create_vendors', 12),
(51, '2022_05_23_054739_create_product_categories_table', 13),
(52, '2022_05_28_123234_create_product_brands', 14),
(53, '2022_05_23_054446_create_customer_table', 15),
(54, '2022_05_28_131451_create_purchase_orders_table', 16),
(58, '2022_05_29_012656_create_goods_receipt_table', 19),
(60, '2022_05_29_013112_create_goods_receipt_details_table', 20),
(66, '2022_05_23_060308_create_products_table', 21),
(67, '2022_05_29_002556_item_products', 21),
(68, '2022_05_30_011404_create_sales_orders_table', 21),
(70, '2022_06_11_041452_create_coa_class_table', 22),
(72, '2022_06_11_050041_create_coa_type_table', 23),
(78, '2022_06_11_114244_create_stok_opnames_table', 25),
(79, '2022_06_11_114416_create_stok_opname_type_table', 25),
(85, '2022_06_11_122007_create_stock_opname_details_table', 26),
(86, '2022_06_11_140323_create_journal_transactions', 27),
(87, '2022_06_11_142729_create_transaction_types', 27),
(88, '2022_06_11_050932_create_chart_of_accounts', 28),
(89, '2022_06_12_124404_create_table_neraca', 28);

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2022-05-22 22:37:19', NULL),
(2, 'Transfer', '2022-05-22 22:37:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_track_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_cost` double(8,2) NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `qty_onhand` int(11) NOT NULL DEFAULT 0,
  `qty_allocated` int(11) NOT NULL DEFAULT 0,
  `qty_received` int(11) DEFAULT 0,
  `qty_shipped` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `is_track_lot_number`, `category_id`, `brand_id`, `product_cost`, `product_price`, `qty_onhand`, `qty_allocated`, `qty_received`, `qty_shipped`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'GLA-CHI-1', 'Glass Kacamata Non Lot', 0, 2, 1, 0.00, 0.00, -26, 0, NULL, 0, 'TEst', '1', '2022-06-04 07:29:20', NULL),
(2, 'GLA-CHI-2', 'Glass Kacamata Lot Number', 1, 2, 1, 0.00, 0.00, -280, 0, NULL, 0, 'Test', '1', '2022-06-04 07:29:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

CREATE TABLE `product_brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_brands`
--

INSERT INTO `product_brands` (`id`, `code`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'CHI-1', 'CHIARA FERRAGNI', '1', '2022-05-28 18:10:02', NULL),
(2, 'VAL-2', 'VALENTINO', '1', '2022-05-28 18:10:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `code`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'GLA-2', 'GLASSES', '1', '2022-05-28 18:05:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

CREATE TABLE `product_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `receive_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_cost` double(8,2) NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`id`, `receive_code`, `receive_date`, `product_id`, `vendor_id`, `product_cost`, `product_price`, `qty`, `lot_number`, `description`, `created_at`, `updated_at`) VALUES
(13, 'GR-ABC-122060021', '2022-06-30', 2, 6, 20000.00, 1000.00, 20, 'ABC-1-20220630', '-', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_photos`
--

CREATE TABLE `product_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount_due` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `vendor_id`, `order_number`, `order_date`, `order_status_id`, `subtotal`, `discount`, `total`, `total_amount`, `description`, `created_by`, `created_at`, `updated_at`, `amount_due`) VALUES
(9, 6, 'PO-ABC-122060001', '2022-06-15', 1, 4000000, 0, 4000000, 4000000, 'oooo', '1', '2022-06-06 06:00:39', '2022-06-06 06:34:08', 0),
(10, 7, 'PO-TAR-722060010', '2022-06-15', 1, 4000000, 0, 4000000, 2000000, 'test Tarjo', '1', '2022-06-06 08:09:29', NULL, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `subtotal` int(11) NOT NULL DEFAULT 0,
  `downpayment` int(11) NOT NULL DEFAULT 0,
  `paid_off` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `qty`, `product_id`, `price`, `subtotal`, `downpayment`, `paid_off`, `total`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 8, 20, 2, 2000000, 40000000, 20000000, 0, 20000000, NULL, NULL, NULL),
(2, 9, 20, 2, 200000, 4000000, 4000000, 0, 0, NULL, NULL, NULL),
(7, 10, 20, 2, 200000, 4000000, 2000000, 0, 2000000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `expedition_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) NOT NULL,
  `subtotal` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `expedition_cost` double(8,2) DEFAULT NULL,
  `total` double(8,2) NOT NULL DEFAULT 0.00,
  `customer_receive_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_receive_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_details`
--

CREATE TABLE `sales_order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `lot_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opnames`
--

CREATE TABLE `stock_opnames` (
  `id` int(10) UNSIGNED NOT NULL,
  `opname_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opname_date` date NOT NULL,
  `opname_type_id` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_opnames`
--

INSERT INTO `stock_opnames` (`id`, `opname_number`, `opname_date`, `opname_type_id`, `document`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'OP-22060001', '2022-06-09', 2, 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 05:35:45', NULL),
(2, 'OP-22060002', '2022-06-09', 1, 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 05:36:52', NULL),
(3, 'OP-22060003', '2022-06-07', 2, 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 05:38:06', NULL),
(4, 'OP-22060004', '2022-06-16', 1, 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 05:39:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_details`
--

CREATE TABLE `stock_opname_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_opname_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adjust_qty` int(11) NOT NULL,
  `adjust_cost` int(11) NOT NULL,
  `adjust_price` int(11) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_opname_details`
--

INSERT INTO `stock_opname_details` (`id`, `stock_opname_id`, `product_id`, `adjust_qty`, `adjust_cost`, `adjust_price`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 500, 200, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_type`
--

CREATE TABLE `stock_opname_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_opname_type`
--

INSERT INTO `stock_opname_type` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Penyesuaian Inventaris', NULL, '2022-06-11 04:57:38', NULL),
(2, 'Penyesuaian dari Penerimaan', NULL, '2022-06-11 04:57:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_neraca`
--

CREATE TABLE `table_neraca` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `account_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `begining_balance` int(11) DEFAULT 0,
  `debit` int(11) DEFAULT 0,
  `credit` int(11) DEFAULT 0,
  `ending_balance` int(11) DEFAULT 0,
  `column_position` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `padding_left` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_neraca`
--

INSERT INTO `table_neraca` (`id`, `report_type`, `position`, `account_id`, `account_label`, `begining_balance`, `debit`, `credit`, `ending_balance`, `column_position`, `padding_left`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'N', '1', 0, 'ASSET', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-12 06:02:52', NULL),
(2, 'N', '2', 1, 'Kas', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:03:13', NULL),
(3, 'N', '3', 2, 'Kas Besar', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:03:37', NULL),
(4, 'N', '4', 3, 'Kas Kecil', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:05:50', NULL),
(5, 'N', '5', 0, 'Total Kas', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:06:33', NULL),
(6, 'N', '6', 0, 'Bank', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:06:56', NULL),
(7, 'N', '7', 0, 'BCA', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:08:47', '2022-06-12 06:08:55'),
(8, 'N', '8', 0, 'Total Bank', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:09:17', NULL),
(9, 'N', '9', 6, 'Piutang', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:09:58', NULL),
(10, 'N', '10', 7, 'Piutang Dagang', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:10:23', '2022-06-12 06:11:26'),
(11, 'N', '11', 0, 'Total Piutang', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:12:03', NULL),
(12, 'N', '12', 9, 'Persediaan', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:14:27', NULL),
(13, 'N', '13', 10, 'Persediaan Dagang', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:14:53', NULL),
(14, 'N', '14', 0, 'Total Persediaan', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:15:20', NULL),
(15, 'N', '15', 0, 'Asset Lain', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:15:42', NULL),
(16, 'N', '16', 12, 'Uang Muka Pembelian', 0, 20000, 0, 0, 'LEFT', '40px', NULL, '2022-06-12 06:17:00', NULL),
(17, 'N', '17', 0, 'Total Asset Lain', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-12 06:17:24', NULL),
(18, 'N', '18', 0, 'TOTAL ASSET', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-12 06:17:43', NULL),
(19, 'N', '19', 0, 'LIABILITY & EQUITY', 0, 0, 0, 0, 'RIGH', NULL, NULL, '2022-06-12 06:22:52', '2022-06-14 21:48:54'),
(20, 'N', '20', 0, 'LIABILITY', 0, 0, 0, 0, 'RIGH', '25px', NULL, '2022-06-14 21:50:10', '2022-06-14 21:50:42'),
(21, 'N', '21', 0, 'Total LIABILITY', 0, 0, 0, 0, 'RIGH', '25px', NULL, '2022-06-14 21:52:26', NULL),
(22, 'N', '22', 0, 'EQUITY', 0, 0, 0, 0, 'RIGH', '25px', NULL, '2022-06-14 21:52:47', NULL),
(23, 'N', '23', 0, 'Modal', 0, 0, 0, 0, 'RIGH', '40px', NULL, '2022-06-14 21:55:17', NULL),
(24, 'N', '24', 0, 'Modal Awal', 0, 0, 0, 0, 'RIGH', '60px', NULL, '2022-06-14 21:55:44', NULL),
(25, 'N', '25', 0, 'Total Modal', 0, 0, 0, 0, 'RIGH', '40px', NULL, '2022-06-14 21:56:07', NULL),
(26, 'N', '26', 0, 'Current Year Earnings', 0, 0, 0, 0, 'RIGH', '40px', NULL, '2022-06-14 21:56:32', NULL),
(27, 'N', '27', 0, 'Kas Kecil', 0, 0, 0, 0, 'RIGH', '40px', NULL, '2022-06-14 21:56:58', NULL),
(28, 'N', '28', 0, 'Total EQUITY', 0, 0, 0, 0, 'RIGH', '25px', NULL, '2022-06-14 21:57:28', NULL),
(29, 'N', '29', 0, 'Total LIABILITY & EQUITY', 0, 0, 0, 0, 'RIGH', NULL, NULL, '2022-06-14 21:57:51', NULL),
(30, 'L', '1', 0, 'Income', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:26:42', NULL),
(31, 'L', '2', 0, 'Pendapatan', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-16 15:27:09', NULL),
(32, 'L', '3', 19, 'Pendapatan Dagang', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:27:28', NULL),
(33, 'L', '4', 21, 'Pendapatan Ongkos Kirim', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:27:55', '2022-06-16 15:33:16'),
(34, 'L', '5', 0, 'Total Income', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:28:07', NULL),
(35, 'L', '6', 0, 'Cost of Goods Sold', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:28:20', NULL),
(36, 'L', '7', 0, 'Harga Pokok Penjualan', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-16 15:28:37', NULL),
(37, 'L', '8', 0, 'Harga Pokok Penjualan', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:28:52', NULL),
(38, 'L', '9', 0, 'GROSS PROFIT', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:29:07', NULL),
(39, 'L', '10', 0, 'Expense', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:29:26', NULL),
(40, 'L', '11', 0, 'Biaya', 0, 0, 0, 0, 'LEFT', '25px', NULL, '2022-06-16 15:29:35', NULL),
(41, 'L', '12', 27, 'Biaya Gaji', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:30:15', NULL),
(42, 'L', '13', 28, 'Biaya Listrik', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:30:43', NULL),
(43, 'L', '14', 29, 'Biaya Internet', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:31:12', NULL),
(44, 'L', '15', 30, 'Biaya Ongkos Kirim', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:31:28', NULL),
(45, 'L', '16', 31, 'Biaya Lain', 0, 0, 0, 0, 'LEFT', '40px', NULL, '2022-06-16 15:31:45', NULL),
(46, 'L', '17', 0, 'Total Expense', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:31:57', NULL),
(47, 'L', '18', 0, 'OPERATING PROFIT', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:32:09', NULL),
(48, 'L', '19', 0, 'NET PROFIT/LOSS (BEFORE TAX)', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:32:28', NULL),
(49, 'L', '20', 0, 'NET PROFIT/LOSS (AFTER TAX)', 0, 0, 0, 0, 'LEFT', NULL, NULL, '2022-06-16 15:32:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_barang`
--

CREATE TABLE `test_barang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_barang`
--

INSERT INTO `test_barang` (`id`, `name`) VALUES
(1, '6'),
(2, '6'),
(3, '6'),
(4, '6');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `code`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '10', 'Purchase Down Payment', NULL, '2022-06-11 07:39:54', NULL),
(2, '20', 'Goods Receipt', NULL, '2022-06-11 07:40:03', NULL),
(3, '30', 'Sales Down Payment', NULL, '2022-06-11 07:40:14', NULL),
(4, '40', 'Delivery Order', NULL, '2022-06-11 07:40:22', NULL),
(5, '50', 'Inventory Adjustment', NULL, '2022-06-11 07:40:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `code`, `name`, `address`, `phone`, `facebook`, `instagram`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'ABC-1', 'ABC', 'Jl. Pangandaran No 212', '022 72324234', 'fadf', 'asdfadf', 'sdasfads', '1', '2022-05-28 17:58:05', NULL),
(7, 'TAR-7', 'Tarjo', 'fadfa', '031023', 'fadfa', 'asdfasdf', 'adsfas', '1', '2022-06-04 09:24:35', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_list_products`
-- (See below for the actual view)
--
CREATE TABLE `view_list_products` (
`id` int(10) unsigned
,`code` varchar(255)
,`name` varchar(255)
,`category_name` varchar(255)
,`brand_name` varchar(255)
,`product_cost` double(8,2)
,`product_price` double(8,2)
,`qty_onhand` int(11)
,`description` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_list_product_sales`
-- (See below for the actual view)
--
CREATE TABLE `view_list_product_sales` (
`id` int(10) unsigned
,`name` varchar(255)
,`category_name` varchar(255)
,`brand_name` varchar(255)
,`product_cost` double(8,2)
,`product_price` double(8,2)
,`qty_onhand` int(11)
,`lot_number` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_orders` (
`id` int(10) unsigned
,`order_number` varchar(255)
,`order_date` date
,`description` varchar(255)
,`vendor_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_items`
-- (See below for the actual view)
--
CREATE TABLE `view_product_items` (
`id` int(10) unsigned
,`prod_id` int(11)
,`name` varchar(255)
,`category_name` varchar(255)
,`brand_name` varchar(255)
,`vendor_name` varchar(255)
,`product_cost` double(8,2)
,`product_price` double(8,2)
,`lot_number` varchar(255)
,`qty` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_list_products`
--
DROP TABLE IF EXISTS `view_list_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_list_products`  AS SELECT `products`.`id` AS `id`, `products`.`code` AS `code`, `products`.`name` AS `name`, `product_categories`.`name` AS `category_name`, `product_brands`.`name` AS `brand_name`, `products`.`product_cost` AS `product_cost`, `products`.`product_price` AS `product_price`, `products`.`qty_onhand` AS `qty_onhand`, `products`.`description` AS `description` FROM ((`products` join `product_categories` on(`product_categories`.`id` = `products`.`category_id`)) join `product_brands` on(`product_brands`.`id` = `products`.`brand_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_list_product_sales`
--
DROP TABLE IF EXISTS `view_list_product_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_list_product_sales`  AS SELECT `products`.`id` AS `id`, `products`.`name` AS `name`, `product_categories`.`name` AS `category_name`, `product_brands`.`name` AS `brand_name`, `products`.`product_cost` AS `product_cost`, `products`.`product_price` AS `product_price`, `products`.`qty_onhand` AS `qty_onhand`, '-' AS `lot_number` FROM ((`products` join `product_categories` on(`products`.`category_id` = `product_categories`.`id`)) join `product_brands` on(`products`.`brand_id` = `product_brands`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_orders`
--
DROP TABLE IF EXISTS `view_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders`  AS SELECT `purchase_orders`.`id` AS `id`, `purchase_orders`.`order_number` AS `order_number`, `purchase_orders`.`order_date` AS `order_date`, `purchase_orders`.`description` AS `description`, `vendors`.`name` AS `vendor_name` FROM (`purchase_orders` join `vendors` on(`vendors`.`id` = `purchase_orders`.`vendor_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_product_items`
--
DROP TABLE IF EXISTS `view_product_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_items`  AS SELECT `product_items`.`id` AS `id`, `product_items`.`product_id` AS `prod_id`, `products`.`name` AS `name`, `product_categories`.`name` AS `category_name`, `product_brands`.`name` AS `brand_name`, `vendors`.`name` AS `vendor_name`, `product_items`.`product_cost` AS `product_cost`, `product_items`.`product_price` AS `product_price`, `product_items`.`lot_number` AS `lot_number`, `product_items`.`qty` AS `qty` FROM ((((`product_items` join `products` on(`product_items`.`product_id` = `products`.`id`)) join `product_categories` on(`products`.`category_id` = `product_categories`.`id`)) join `product_brands` on(`products`.`brand_id` = `product_brands`.`id`)) join `vendors` on(`product_items`.`vendor_id` = `vendors`.`id`)) WHERE `product_items`.`qty` > 0 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_banks`
--
ALTER TABLE `account_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coa_class`
--
ALTER TABLE `coa_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coa_type`
--
ALTER TABLE `coa_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expeditions`
--
ALTER TABLE `expeditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods_receipt`
--
ALTER TABLE `goods_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_receipt_code_index` (`code`);

--
-- Indexes for table `goods_receipt_details`
--
ALTER TABLE `goods_receipt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_receipt_details_product_id_index` (`product_id`);

--
-- Indexes for table `journal_transactions`
--
ALTER TABLE `journal_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_code_index` (`code`),
  ADD KEY `products_name_index` (`name`);

--
-- Indexes for table `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_brands_code_index` (`code`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_code_index` (`code`);

--
-- Indexes for table `product_items`
--
ALTER TABLE `product_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_orders_order_number_index` (`order_number`);

--
-- Indexes for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_details_purchase_order_id_index` (`purchase_order_id`),
  ADD KEY `purchase_order_details_product_id_index` (`product_id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_orders_order_number_index` (`order_number`);

--
-- Indexes for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_details_purchase_order_id_index` (`sales_order_id`),
  ADD KEY `purchase_order_details_product_id_index` (`product_id`);

--
-- Indexes for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opnames_opname_number_index` (`opname_number`);

--
-- Indexes for table `stock_opname_details`
--
ALTER TABLE `stock_opname_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_opname_type`
--
ALTER TABLE `stock_opname_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_neraca`
--
ALTER TABLE `table_neraca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_barang`
--
ALTER TABLE `test_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_banks`
--
ALTER TABLE `account_banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coa_class`
--
ALTER TABLE `coa_class`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coa_type`
--
ALTER TABLE `coa_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expeditions`
--
ALTER TABLE `expeditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `goods_receipt`
--
ALTER TABLE `goods_receipt`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goods_receipt_details`
--
ALTER TABLE `goods_receipt_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_transactions`
--
ALTER TABLE `journal_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_items`
--
ALTER TABLE `product_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock_opname_details`
--
ALTER TABLE `stock_opname_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_opname_type`
--
ALTER TABLE `stock_opname_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_neraca`
--
ALTER TABLE `table_neraca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `test_barang`
--
ALTER TABLE `test_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
