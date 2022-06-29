/*
Navicat MySQL Data Transfer

Source Server         : Local Server
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : vl_online

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-06-29 21:19:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_banks`
-- ----------------------------
DROP TABLE IF EXISTS `account_banks`;
CREATE TABLE `account_banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account_banks
-- ----------------------------
INSERT INTO `account_banks` VALUES ('2', 'Defaut AP Account', 'BCA', 'xxxx', '2022-06-06 07:25:44', '2022-06-06 07:41:23');

-- ----------------------------
-- Table structure for `chart_of_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `chart_of_accounts`;
CREATE TABLE `chart_of_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coa_type_id` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `begining_balance` int(11) DEFAULT '0',
  `ending_balance` int(11) DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `report_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of chart_of_accounts
-- ----------------------------
INSERT INTO `chart_of_accounts` VALUES ('1', '101-1000', '1', 'Kas', '0', '0', '0', '0', null, '2022-06-11 05:24:26', 'N', '2022-06-11 16:50:32');
INSERT INTO `chart_of_accounts` VALUES ('2', '101-1001', '1', 'Kas Besar', '0', '0', '0', '0', null, '2022-06-11 05:25:11', 'N', '2022-06-11 16:50:24');
INSERT INTO `chart_of_accounts` VALUES ('3', '101-1002', '1', 'Kas Kecil', '0', '0', '0', '0', null, '2022-06-11 05:25:41', 'N', '2022-06-11 16:50:18');
INSERT INTO `chart_of_accounts` VALUES ('4', '101-2000', '1', 'Bank', '0', '0', '0', '0', null, '2022-06-11 05:26:09', 'N', '2022-06-11 16:50:49');
INSERT INTO `chart_of_accounts` VALUES ('5', '101-2001', '1', 'BCA', '0', '0', '0', '0', null, '2022-06-11 05:26:26', null, null);
INSERT INTO `chart_of_accounts` VALUES ('6', '102-1000', '1', 'Piutang', '0', '0', '0', '0', null, '2022-06-11 05:26:48', 'N', '2022-06-11 16:51:20');
INSERT INTO `chart_of_accounts` VALUES ('7', '102-1001', '1', 'Piutang Dagang', '0', '0', '0', '0', null, '2022-06-11 05:27:07', 'N', '2022-06-11 16:51:30');
INSERT INTO `chart_of_accounts` VALUES ('8', '102-1002', '2', 'Piutang Lain', '0', '0', '0', '0', null, '2022-06-11 05:27:37', 'N', '2022-06-11 16:51:41');
INSERT INTO `chart_of_accounts` VALUES ('9', '103-1000', '3', 'Persediaan', '0', '0', '0', '0', null, '2022-06-11 05:28:13', 'N', '2022-06-12 13:14:00');
INSERT INTO `chart_of_accounts` VALUES ('10', '103-1001', '3', 'Persediaan Dagang', '0', '0', '0', '0', null, '2022-06-11 05:28:41', 'N', '2022-06-12 13:13:54');
INSERT INTO `chart_of_accounts` VALUES ('11', '104-1000', '4', 'Asset Lain', '0', '0', '0', '0', null, '2022-06-11 05:29:52', null, null);
INSERT INTO `chart_of_accounts` VALUES ('12', '104-1001', '4', 'Uang Muka Pembelian', '0', '0', '0', '0', null, '2022-06-11 05:30:32', 'N', '2022-06-12 13:16:25');
INSERT INTO `chart_of_accounts` VALUES ('13', '201-1000', '5', 'Kewajiban', '0', '0', '0', '0', null, '2022-06-11 05:31:17', 'L', '2022-06-11 16:54:10');
INSERT INTO `chart_of_accounts` VALUES ('14', '201-1001', '6', 'Hutang Dagang', '0', '0', '0', '0', null, '2022-06-11 05:31:58', 'L', '2022-06-11 16:54:03');
INSERT INTO `chart_of_accounts` VALUES ('15', '201-1002', '6', 'Uang Muka Penjualan', '0', '0', '0', '0', null, '2022-06-11 05:32:22', 'L', '2022-06-11 16:53:49');
INSERT INTO `chart_of_accounts` VALUES ('16', '301-1000', '7', 'Modal', '0', '0', '0', '0', null, '2022-06-11 05:32:46', 'L', '2022-06-11 16:53:57');
INSERT INTO `chart_of_accounts` VALUES ('17', '301-1001', '7', 'Saldo Awal', '0', '0', '0', '0', null, '2022-06-11 05:33:13', 'L', '2022-06-11 16:53:43');
INSERT INTO `chart_of_accounts` VALUES ('18', '301-1002', '7', 'Laba Ditahan', '0', '0', '0', '0', null, '2022-06-11 05:33:38', 'L', '2022-06-11 16:53:37');
INSERT INTO `chart_of_accounts` VALUES ('19', '401-1000', '8', 'Pendapatan', '0', '0', '0', '0', null, '2022-06-11 05:34:08', 'L', '2022-06-11 16:53:31');
INSERT INTO `chart_of_accounts` VALUES ('20', '401-1001', '8', 'Pendapatan Dagang', '0', '0', '0', '0', null, '2022-06-11 05:34:46', 'L', '2022-06-11 16:53:25');
INSERT INTO `chart_of_accounts` VALUES ('21', '401-2001', '8', 'Pendapatan Ongkos Kirim', '0', '0', '0', '0', null, '2022-06-11 05:35:18', 'L', '2022-06-11 16:53:19');
INSERT INTO `chart_of_accounts` VALUES ('22', '401-2002', '8', 'Pendapatan Lain', '0', '0', '0', '0', null, '2022-06-11 05:35:40', 'L', '2022-06-11 16:53:13');
INSERT INTO `chart_of_accounts` VALUES ('23', '501-1000', '9', 'Harga Pokok', '0', '0', '0', '0', null, '2022-06-11 05:36:12', 'L', '2022-06-11 16:53:06');
INSERT INTO `chart_of_accounts` VALUES ('24', '501-1001', '9', 'Harga Pokok Penjualan', '0', '0', '0', '0', null, '2022-06-11 05:36:39', 'L', '2022-06-11 16:53:01');
INSERT INTO `chart_of_accounts` VALUES ('25', '501-2001', '9', 'Diskon Penjualan', '0', '0', '0', '0', null, '2022-06-11 05:37:09', 'L', '2022-06-11 16:52:56');
INSERT INTO `chart_of_accounts` VALUES ('26', '601-1000', '10', 'Biaya', '0', '0', '0', '0', null, '2022-06-11 05:37:39', 'L', '2022-06-11 16:52:50');
INSERT INTO `chart_of_accounts` VALUES ('27', '601-1001', '10', 'Biaya Gaji', '0', '0', '0', '0', null, '2022-06-11 05:38:10', 'L', '2022-06-11 16:52:44');
INSERT INTO `chart_of_accounts` VALUES ('28', '601-1002', '10', 'Biaya Listrik', '0', '0', '0', '0', null, '2022-06-11 05:38:26', 'L', '2022-06-11 16:52:38');
INSERT INTO `chart_of_accounts` VALUES ('29', '601-1003', '10', 'Biaya Internet', '0', '0', '0', '0', null, '2022-06-11 05:38:49', 'L', '2022-06-11 16:52:31');
INSERT INTO `chart_of_accounts` VALUES ('30', '601-1004', '10', 'Biaya Ongkos Kirim', '0', '0', '0', '0', null, '2022-06-11 05:39:14', 'L', '2022-06-11 16:52:25');
INSERT INTO `chart_of_accounts` VALUES ('31', '601-1005', '10', 'Biaya Lain', '0', '0', '0', '0', null, '2022-06-11 05:39:34', 'L', '2022-06-11 16:52:19');
INSERT INTO `chart_of_accounts` VALUES ('32', '601-1006', '10', 'Biaya Selisih Stok', '0', '0', '0', '0', null, '2022-06-11 05:39:53', 'N', '2022-06-11 16:47:18');

-- ----------------------------
-- Table structure for `cms_apicustom`
-- ----------------------------
DROP TABLE IF EXISTS `cms_apicustom`;
CREATE TABLE `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_apicustom
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_apikey`
-- ----------------------------
DROP TABLE IF EXISTS `cms_apikey`;
CREATE TABLE `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_apikey
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_dashboard`
-- ----------------------------
DROP TABLE IF EXISTS `cms_dashboard`;
CREATE TABLE `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_dashboard
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_email_queues`
-- ----------------------------
DROP TABLE IF EXISTS `cms_email_queues`;
CREATE TABLE `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_email_queues
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `cms_email_templates`;
CREATE TABLE `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_email_templates
-- ----------------------------
INSERT INTO `cms_email_templates` VALUES ('1', 'Email Template Forgot Password Backend', 'forgot_password_backend', null, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', null, '2022-05-18 03:24:11', null);
INSERT INTO `cms_email_templates` VALUES ('2', 'Email Template Forgot Password Backend', 'forgot_password_backend', null, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', null, '2022-06-04 16:11:06', null);

-- ----------------------------
-- Table structure for `cms_logs`
-- ----------------------------
DROP TABLE IF EXISTS `cms_logs`;
CREATE TABLE `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_logs
-- ----------------------------
INSERT INTO `cms_logs` VALUES ('1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-18 03:45:19', null);
INSERT INTO `cms_logs` VALUES ('2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-21 04:45:23', null);
INSERT INTO `cms_logs` VALUES ('3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-21 04:53:05', null);
INSERT INTO `cms_logs` VALUES ('4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-22 07:28:01', null);
INSERT INTO `cms_logs` VALUES ('5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-22 07:28:07', null);
INSERT INTO `cms_logs` VALUES ('6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-23 04:09:43', null);
INSERT INTO `cms_logs` VALUES ('7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-23 04:10:19', null);
INSERT INTO `cms_logs` VALUES ('8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-23 04:10:40', null);
INSERT INTO `cms_logs` VALUES ('9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-23 04:11:47', null);
INSERT INTO `cms_logs` VALUES ('10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-23 05:17:50', null);
INSERT INTO `cms_logs` VALUES ('11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Pembelian at Menu Management', '', '1', '2022-05-23 05:22:18', null);
INSERT INTO `cms_logs` VALUES ('12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/1', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', '1', '2022-05-23 05:22:42', null);
INSERT INTO `cms_logs` VALUES ('13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Penjualan at Menu Management', '', '1', '2022-05-23 05:23:13', null);
INSERT INTO `cms_logs` VALUES ('14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/2', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', '1', '2022-05-23 05:24:15', null);
INSERT INTO `cms_logs` VALUES ('15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Inventory at Menu Management', '', '1', '2022-05-23 05:25:10', null);
INSERT INTO `cms_logs` VALUES ('16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/3', 'Update data Inventory at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', '1', '2022-05-23 05:25:27', null);
INSERT INTO `cms_logs` VALUES ('17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Setup Data at Menu Management', '', '1', '2022-05-23 05:26:12', null);
INSERT INTO `cms_logs` VALUES ('18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/4', 'Update data Setup Data at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', '1', '2022-05-23 05:26:20', null);
INSERT INTO `cms_logs` VALUES ('19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/5', 'Update data Akun Bank at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-05-23 05:32:01', null);
INSERT INTO `cms_logs` VALUES ('20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/account_banks/add-save', 'Add New Data Test at Akun Bank', '', '1', '2022-05-23 05:32:24', null);
INSERT INTO `cms_logs` VALUES ('21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/6', 'Update data Tipe Pembayaran at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-05-23 05:37:06', null);
INSERT INTO `cms_logs` VALUES ('22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types/add-save', 'Add New Data Cash at Tipe Pembayaran', '', '1', '2022-05-23 05:37:19', null);
INSERT INTO `cms_logs` VALUES ('23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types/add-save', 'Add New Data Transfer at Tipe Pembayaran', '', '1', '2022-05-23 05:37:25', null);
INSERT INTO `cms_logs` VALUES ('24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Akunting at Menu Management', '', '1', '2022-05-23 05:38:13', null);
INSERT INTO `cms_logs` VALUES ('25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/7', 'Update data Akunting at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-05-23 05:38:26', null);
INSERT INTO `cms_logs` VALUES ('26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/8', 'Update data Vendor at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', '1', '2022-05-23 05:43:25', null);
INSERT INTO `cms_logs` VALUES ('27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Keuangan at Menu Management', '', '1', '2022-05-23 05:52:10', null);
INSERT INTO `cms_logs` VALUES ('28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/11', 'Update data Keuangan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', '1', '2022-05-23 05:52:24', null);
INSERT INTO `cms_logs` VALUES ('29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data CLUTCH at Kategori Produk', '', '1', '2022-05-23 05:53:34', null);
INSERT INTO `cms_logs` VALUES ('30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data POUCH at Kategori Produk', '', '1', '2022-05-23 05:53:46', null);
INSERT INTO `cms_logs` VALUES ('31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data FOOTWEAR at Kategori Produk', '', '1', '2022-05-23 05:53:53', null);
INSERT INTO `cms_logs` VALUES ('32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data BAG at Kategori Produk', '', '1', '2022-05-23 05:54:01', null);
INSERT INTO `cms_logs` VALUES ('33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data ACCESSORIES at Kategori Produk', '', '1', '2022-05-23 05:54:08', null);
INSERT INTO `cms_logs` VALUES ('34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data GLASSES at Kategori Produk', '', '1', '2022-05-23 05:54:19', null);
INSERT INTO `cms_logs` VALUES ('35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data WALLET at Kategori Produk', '', '1', '2022-05-23 05:54:30', null);
INSERT INTO `cms_logs` VALUES ('36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data OUTER at Kategori Produk', '', '1', '2022-05-23 05:54:44', null);
INSERT INTO `cms_logs` VALUES ('37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data PANTS at Kategori Produk', '', '1', '2022-05-23 05:54:49', null);
INSERT INTO `cms_logs` VALUES ('38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data TSHIRT at Kategori Produk', '', '1', '2022-05-23 05:55:19', null);
INSERT INTO `cms_logs` VALUES ('39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data JACKET at Kategori Produk', '', '1', '2022-05-23 05:55:25', null);
INSERT INTO `cms_logs` VALUES ('40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data SWEATSHIRT at Kategori Produk', '', '1', '2022-05-23 05:55:31', null);
INSERT INTO `cms_logs` VALUES ('41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data TOTEBAG at Kategori Produk', '', '1', '2022-05-23 05:55:45', null);
INSERT INTO `cms_logs` VALUES ('42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-23 06:03:45', null);
INSERT INTO `cms_logs` VALUES ('43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-23 06:04:08', null);
INSERT INTO `cms_logs` VALUES ('44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/users/add-save', 'Add New Data Admin at Users Management', '', '1', '2022-05-23 06:04:57', null);
INSERT INTO `cms_logs` VALUES ('45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-23 06:05:11', null);
INSERT INTO `cms_logs` VALUES ('46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-05-23 06:05:16', null);
INSERT INTO `cms_logs` VALUES ('47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/vendors', 'Try view the data :name at Vendor', '', '2', '2022-05-23 06:27:55', null);
INSERT INTO `cms_logs` VALUES ('48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/payment_types', 'Try view the data :name at Tipe Pembayaran', '', '2', '2022-05-23 06:29:28', null);
INSERT INTO `cms_logs` VALUES ('49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/account_banks', 'Try view the data :name at Akun Bank', '', '2', '2022-05-23 06:29:32', null);
INSERT INTO `cms_logs` VALUES ('50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-05-23 06:29:41', null);
INSERT INTO `cms_logs` VALUES ('51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-05-28 12:22:11', null);
INSERT INTO `cms_logs` VALUES ('52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-05-28 12:22:23', null);
INSERT INTO `cms_logs` VALUES ('53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-28 12:22:30', null);
INSERT INTO `cms_logs` VALUES ('54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/10', 'Update data Category Produk at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-05-28 12:24:30', null);
INSERT INTO `cms_logs` VALUES ('55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/12', 'Update data Ekspedisi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-05-28 12:24:37', null);
INSERT INTO `cms_logs` VALUES ('56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data JNE at Ekspedisi', '', '1', '2022-05-28 12:25:03', null);
INSERT INTO `cms_logs` VALUES ('57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data TIKI at Ekspedisi', '', '1', '2022-05-28 12:25:10', null);
INSERT INTO `cms_logs` VALUES ('58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data PAKEL at Ekspedisi', '', '1', '2022-05-28 12:25:17', null);
INSERT INTO `cms_logs` VALUES ('59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/add-save', 'Add New Data Sicepat at Ekspedisi', '', '1', '2022-05-28 12:25:23', null);
INSERT INTO `cms_logs` VALUES ('60', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/expeditions/edit-save/3', 'Update data PAXEL at Ekspedisi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>PAKEL</td><td>PAXEL</td></tr></tbody></table>', '1', '2022-05-28 12:25:34', null);
INSERT INTO `cms_logs` VALUES ('61', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data SLROOM at Vendor', '', '1', '2022-05-28 12:27:56', null);
INSERT INTO `cms_logs` VALUES ('62', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data AULUX at Vendor', '', '1', '2022-05-28 12:28:16', null);
INSERT INTO `cms_logs` VALUES ('63', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data LUXURAGE at Vendor', '', '1', '2022-05-28 12:28:35', null);
INSERT INTO `cms_logs` VALUES ('64', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/13', 'Update data Brand at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', '1', '2022-05-28 12:35:31', null);
INSERT INTO `cms_logs` VALUES ('65', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data YVES SAINT LAURENT at Brand', '', '1', '2022-05-28 12:36:02', null);
INSERT INTO `cms_logs` VALUES ('66', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data DIOR at Brand', '', '1', '2022-05-28 12:36:11', null);
INSERT INTO `cms_logs` VALUES ('67', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data PRADA at Brand', '', '1', '2022-05-28 12:36:20', null);
INSERT INTO `cms_logs` VALUES ('68', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BOTTEGA VENETA at Brand', '', '1', '2022-05-28 12:36:29', null);
INSERT INTO `cms_logs` VALUES ('69', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data LONGCHAMP at Brand', '', '1', '2022-05-28 12:37:05', null);
INSERT INTO `cms_logs` VALUES ('70', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data TORY BURCH at Brand', '', '1', '2022-05-28 12:37:13', null);
INSERT INTO `cms_logs` VALUES ('71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data GUCCI at Brand', '', '1', '2022-05-28 12:37:20', null);
INSERT INTO `cms_logs` VALUES ('72', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data HUGO BOSS at Brand', '', '1', '2022-05-28 12:37:34', null);
INSERT INTO `cms_logs` VALUES ('73', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BALENCIAGA at Brand', '', '1', '2022-05-28 12:37:40', null);
INSERT INTO `cms_logs` VALUES ('74', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data JACQUEMUS at Brand', '', '1', '2022-05-28 12:37:48', null);
INSERT INTO `cms_logs` VALUES ('75', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data FENDI at Brand', '', '1', '2022-05-28 12:37:55', null);
INSERT INTO `cms_logs` VALUES ('76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data BURBERRY at Brand', '', '1', '2022-05-28 12:38:02', null);
INSERT INTO `cms_logs` VALUES ('77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data CHIARA FERRAGNI at Brand', '', '1', '2022-05-28 12:38:09', null);
INSERT INTO `cms_logs` VALUES ('78', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data VALENTINO at Brand', '', '1', '2022-05-28 12:38:20', null);
INSERT INTO `cms_logs` VALUES ('79', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/14', 'Update data Produk at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-05-28 13:01:28', null);
INSERT INTO `cms_logs` VALUES ('80', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data GUCCI Women GG Espadrilles Mules in Black GHW [36,5] at Produk', '', '1', '2022-05-28 13:09:12', null);
INSERT INTO `cms_logs` VALUES ('81', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data BOSS Small Logo Jogger Pants in Black [M] at Produk', '', '1', '2022-05-28 13:09:59', null);
INSERT INTO `cms_logs` VALUES ('82', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/edit-save/1', 'Update data GUCCI Women GG Espadrilles Mules in Black GHW [36,5] at Produk', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>000001</td><td></td></tr><tr><td>brand_id</td><td>6</td><td>1</td></tr></tbody></table>', '1', '2022-05-28 13:10:13', null);
INSERT INTO `cms_logs` VALUES ('83', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_photos/add-save', 'Add New Data  at Photo Produk', '', '1', '2022-05-28 13:52:50', null);
INSERT INTO `cms_logs` VALUES ('84', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/16', 'Update data Pesanan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-05-28 14:00:05', null);
INSERT INTO `cms_logs` VALUES ('85', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-05-28 23:52:53', null);
INSERT INTO `cms_logs` VALUES ('86', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders', 'Try view the data :name at Pesanan', '', '2', '2022-05-28 23:53:02', null);
INSERT INTO `cms_logs` VALUES ('87', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-05-28 23:53:12', null);
INSERT INTO `cms_logs` VALUES ('88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-28 23:53:21', null);
INSERT INTO `cms_logs` VALUES ('89', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEst at Produk', '', '1', '2022-05-29 00:18:20', null);
INSERT INTO `cms_logs` VALUES ('90', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABCD at Vendor', '', '1', '2022-05-29 00:51:50', null);
INSERT INTO `cms_logs` VALUES ('91', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/1', 'Delete data ABCD at Vendor', '', '1', '2022-05-29 00:52:25', null);
INSERT INTO `cms_logs` VALUES ('92', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABC at Vendor', '', '1', '2022-05-29 00:52:38', null);
INSERT INTO `cms_logs` VALUES ('93', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data DEFGHIJK at Vendor', '', '1', '2022-05-29 00:52:58', null);
INSERT INTO `cms_logs` VALUES ('94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data RTHI at Vendor', '', '1', '2022-05-29 00:53:47', null);
INSERT INTO `cms_logs` VALUES ('95', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/2', 'Delete data ABC at Vendor', '', '1', '2022-05-29 00:54:22', null);
INSERT INTO `cms_logs` VALUES ('96', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/3', 'Delete data DEFGHIJK at Vendor', '', '1', '2022-05-29 00:54:25', null);
INSERT INTO `cms_logs` VALUES ('97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/4', 'Delete data RTHI at Vendor', '', '1', '2022-05-29 00:54:28', null);
INSERT INTO `cms_logs` VALUES ('98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABCD TEST 123 at Vendor', '', '1', '2022-05-29 00:55:32', null);
INSERT INTO `cms_logs` VALUES ('99', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/delete/5', 'Delete data ABCD TEST 123 at Vendor', '', '1', '2022-05-29 00:56:19', null);
INSERT INTO `cms_logs` VALUES ('100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data ABC BCD at Vendor', '', '1', '2022-05-29 00:58:05', null);
INSERT INTO `cms_logs` VALUES ('101', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data Fashion at Kategori Produk', '', '1', '2022-05-29 01:03:53', null);
INSERT INTO `cms_logs` VALUES ('102', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/add-save', 'Add New Data GLASSES at Kategori Produk', '', '1', '2022-05-29 01:05:19', null);
INSERT INTO `cms_logs` VALUES ('103', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/delete/1', 'Delete data TEst at Produk', '', '1', '2022-05-29 01:05:42', null);
INSERT INTO `cms_logs` VALUES ('104', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_categories/delete/1', 'Delete data Fashion at Kategori Produk', '', '1', '2022-05-29 01:05:49', null);
INSERT INTO `cms_logs` VALUES ('105', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data CHIARA FERRAGNI at Brand', '', '1', '2022-05-29 01:10:02', null);
INSERT INTO `cms_logs` VALUES ('106', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/product_brands/add-save', 'Add New Data VALENTINO at Brand', '', '1', '2022-05-29 01:10:07', null);
INSERT INTO `cms_logs` VALUES ('107', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/17', 'Update data Penerimaan Barang at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-05-29 01:50:28', null);
INSERT INTO `cms_logs` VALUES ('108', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data GLASSES 01 at Produk', '', '1', '2022-05-29 04:32:28', null);
INSERT INTO `cms_logs` VALUES ('109', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEST at Produk', '', '1', '2022-05-29 04:44:26', null);
INSERT INTO `cms_logs` VALUES ('110', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/delete/1', 'Delete data TEST at Produk', '', '1', '2022-05-29 04:45:12', null);
INSERT INTO `cms_logs` VALUES ('111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data TEST 123 at Produk', '', '1', '2022-05-29 04:45:45', null);
INSERT INTO `cms_logs` VALUES ('112', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-05-30 01:05:22', null);
INSERT INTO `cms_logs` VALUES ('113', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/goods_receipt', 'Try view the data :name at Penerimaan Barang', '', '2', '2022-05-30 01:05:29', null);
INSERT INTO `cms_logs` VALUES ('114', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-05-30 01:05:35', null);
INSERT INTO `cms_logs` VALUES ('115', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-05-30 01:05:50', null);
INSERT INTO `cms_logs` VALUES ('116', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-05-30 07:34:36', null);
INSERT INTO `cms_logs` VALUES ('117', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-06-04 14:11:33', null);
INSERT INTO `cms_logs` VALUES ('118', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors', 'Try view the data :name at Vendor', '', '2', '2022-06-04 14:11:36', null);
INSERT INTO `cms_logs` VALUES ('119', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-06-04 14:11:40', null);
INSERT INTO `cms_logs` VALUES ('120', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-04 14:11:52', null);
INSERT INTO `cms_logs` VALUES ('121', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data Glass Kacamata Non Lot at Produk', '', '1', '2022-06-04 14:29:20', null);
INSERT INTO `cms_logs` VALUES ('122', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/products/add-save', 'Add New Data Glass Kacamata Lot Number at Produk', '', '1', '2022-06-04 14:29:36', null);
INSERT INTO `cms_logs` VALUES ('123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-04 16:11:17', null);
INSERT INTO `cms_logs` VALUES ('124', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-06-04 16:11:23', null);
INSERT INTO `cms_logs` VALUES ('125', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-06-04 16:11:28', null);
INSERT INTO `cms_logs` VALUES ('126', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-04 16:11:35', null);
INSERT INTO `cms_logs` VALUES ('127', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', '1', '2022-06-04 16:14:25', null);
INSERT INTO `cms_logs` VALUES ('128', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/vendors/add-save', 'Add New Data Tarjo at Vendor', '', '1', '2022-06-04 16:24:35', null);
INSERT INTO `cms_logs` VALUES ('129', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', '1', '2022-06-04 16:25:07', null);
INSERT INTO `cms_logs` VALUES ('130', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-06-05 03:54:02', null);
INSERT INTO `cms_logs` VALUES ('131', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/purchase_orders', 'Try view the data :name at Pesanan', '', '2', '2022-06-05 03:54:08', null);
INSERT INTO `cms_logs` VALUES ('132', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-06-05 03:54:12', null);
INSERT INTO `cms_logs` VALUES ('133', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-05 03:54:21', null);
INSERT INTO `cms_logs` VALUES ('134', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-05 10:34:44', null);
INSERT INTO `cms_logs` VALUES ('135', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-05 10:34:52', null);
INSERT INTO `cms_logs` VALUES ('136', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-05 10:36:35', null);
INSERT INTO `cms_logs` VALUES ('137', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-05 10:41:09', null);
INSERT INTO `cms_logs` VALUES ('138', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-05 10:41:17', null);
INSERT INTO `cms_logs` VALUES ('139', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/edit-save/5', 'Update data  at Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060005</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>subtotal</td><td>100000</td><td>500000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', '1', '2022-06-05 11:32:46', null);
INSERT INTO `cms_logs` VALUES ('140', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 12:22:01', null);
INSERT INTO `cms_logs` VALUES ('141', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 12:23:05', null);
INSERT INTO `cms_logs` VALUES ('142', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 12:24:56', null);
INSERT INTO `cms_logs` VALUES ('143', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 13:36:02', null);
INSERT INTO `cms_logs` VALUES ('144', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 13:41:18', null);
INSERT INTO `cms_logs` VALUES ('145', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-05 13:58:21', null);
INSERT INTO `cms_logs` VALUES ('146', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@vl.com login with IP Address 127.0.0.1', '', '2', '2022-06-05 13:58:30', null);
INSERT INTO `cms_logs` VALUES ('147', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@vl.com logout', '', '2', '2022-06-05 13:58:34', null);
INSERT INTO `cms_logs` VALUES ('148', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-05 13:58:42', null);
INSERT INTO `cms_logs` VALUES ('149', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 13:59:51', null);
INSERT INTO `cms_logs` VALUES ('150', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:00:40', null);
INSERT INTO `cms_logs` VALUES ('151', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:05:20', null);
INSERT INTO `cms_logs` VALUES ('152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:06:42', null);
INSERT INTO `cms_logs` VALUES ('153', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:07:09', null);
INSERT INTO `cms_logs` VALUES ('154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:08:06', null);
INSERT INTO `cms_logs` VALUES ('155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:18:26', null);
INSERT INTO `cms_logs` VALUES ('156', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:28:39', null);
INSERT INTO `cms_logs` VALUES ('157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:33:28', null);
INSERT INTO `cms_logs` VALUES ('158', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:34:46', null);
INSERT INTO `cms_logs` VALUES ('159', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/goods_receipt/add-save', 'Add New Data  at Penerimaan Barang', '', '1', '2022-06-05 14:39:44', null);
INSERT INTO `cms_logs` VALUES ('160', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/menu_management/edit-save/18', 'Update data Item List at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-06-06 02:15:24', null);
INSERT INTO `cms_logs` VALUES ('161', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/menu_management/edit-save/19', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>2</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-06-06 03:41:46', null);
INSERT INTO `cms_logs` VALUES ('162', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/customers/add-save', 'Add New Data Ricky at Customer', '', '1', '2022-06-06 03:44:14', null);
INSERT INTO `cms_logs` VALUES ('163', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 05:39:40', null);
INSERT INTO `cms_logs` VALUES ('164', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 05:39:50', null);
INSERT INTO `cms_logs` VALUES ('165', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 06:29:55', null);
INSERT INTO `cms_logs` VALUES ('166', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 06:30:03', null);
INSERT INTO `cms_logs` VALUES ('167', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/add-save', 'Add New Data Bank Mandiri Rek at Akun Bank', '', '1', '2022-06-06 07:25:44', null);
INSERT INTO `cms_logs` VALUES ('168', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/edit-save/2', 'Update data Defaut AP Account at Akun Bank', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>account_name</td><td>Bank Mandiri Rek</td><td>Defaut AP Account</td></tr><tr><td>bank_name</td><td>Mandiri</td><td>BCA</td></tr><tr><td>account_number</td><td>000x21</td><td>xxxx</td></tr></tbody></table>', '1', '2022-06-06 07:41:23', null);
INSERT INTO `cms_logs` VALUES ('169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/edit-save/1', 'Update data Test at Akun Bank', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', '1', '2022-06-06 07:41:33', null);
INSERT INTO `cms_logs` VALUES ('170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/account_banks/delete/1', 'Delete data Test at Akun Bank', '', '1', '2022-06-06 07:41:38', null);
INSERT INTO `cms_logs` VALUES ('171', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 10:36:49', null);
INSERT INTO `cms_logs` VALUES ('172', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 10:38:31', null);
INSERT INTO `cms_logs` VALUES ('173', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 12:27:21', null);
INSERT INTO `cms_logs` VALUES ('174', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 12:27:37', null);
INSERT INTO `cms_logs` VALUES ('175', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 12:44:22', null);
INSERT INTO `cms_logs` VALUES ('176', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 12:44:36', null);
INSERT INTO `cms_logs` VALUES ('177', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', '1', '2022-06-06 12:52:06', null);
INSERT INTO `cms_logs` VALUES ('178', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', '1', '2022-06-06 13:00:39', null);
INSERT INTO `cms_logs` VALUES ('179', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/edit-save/9', 'Update data  at Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>200000</td><td>4000000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>3800000</td><td>0</td></tr></tbody></table>', '1', '2022-06-06 13:34:08', null);
INSERT INTO `cms_logs` VALUES ('180', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-06 15:06:29', null);
INSERT INTO `cms_logs` VALUES ('181', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-06 15:06:35', null);
INSERT INTO `cms_logs` VALUES ('182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/purchase_orders/add-save', 'Add New Data  at Pesanan', '', '1', '2022-06-06 15:09:29', null);
INSERT INTO `cms_logs` VALUES ('183', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-07 07:43:16', null);
INSERT INTO `cms_logs` VALUES ('184', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-07 07:51:59', null);
INSERT INTO `cms_logs` VALUES ('185', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-07 08:07:32', null);
INSERT INTO `cms_logs` VALUES ('186', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-07 08:07:39', null);
INSERT INTO `cms_logs` VALUES ('187', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-08 02:32:06', null);
INSERT INTO `cms_logs` VALUES ('188', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-08 02:32:16', null);
INSERT INTO `cms_logs` VALUES ('189', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-08 02:48:42', null);
INSERT INTO `cms_logs` VALUES ('190', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-08 02:48:51', null);
INSERT INTO `cms_logs` VALUES ('191', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-08 02:49:52', null);
INSERT INTO `cms_logs` VALUES ('192', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-08 02:51:20', null);
INSERT INTO `cms_logs` VALUES ('193', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-08 02:59:13', null);
INSERT INTO `cms_logs` VALUES ('194', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-08 02:59:25', null);
INSERT INTO `cms_logs` VALUES ('195', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/edit-save/27', 'Update data  at Penerimaan Barang', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>GR-ABC-122060027</td><td></td></tr><tr><td>purchase_order_id</td><td>5</td><td>9</td></tr><tr><td>po_vendor</td><td></td><td></td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', '1', '2022-06-08 03:17:19', null);
INSERT INTO `cms_logs` VALUES ('196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-08 03:31:00', null);
INSERT INTO `cms_logs` VALUES ('197', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-09 01:48:30', null);
INSERT INTO `cms_logs` VALUES ('198', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-09 01:48:39', null);
INSERT INTO `cms_logs` VALUES ('199', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-09 13:47:50', null);
INSERT INTO `cms_logs` VALUES ('200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-09 13:47:59', null);
INSERT INTO `cms_logs` VALUES ('201', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-11 04:17:39', null);
INSERT INTO `cms_logs` VALUES ('202', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/20', 'Update data Kelompok Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-11 04:55:32', null);
INSERT INTO `cms_logs` VALUES ('203', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Asset at Kelompok Akun', '', '1', '2022-06-11 04:56:02', null);
INSERT INTO `cms_logs` VALUES ('204', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/delete/1', 'Delete data Asset at Kelompok Akun', '', '1', '2022-06-11 04:57:41', null);
INSERT INTO `cms_logs` VALUES ('205', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Asset at Kelompok Akun', '', '1', '2022-06-11 04:59:06', null);
INSERT INTO `cms_logs` VALUES ('206', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Liability at Kelompok Akun', '', '1', '2022-06-11 04:59:11', null);
INSERT INTO `cms_logs` VALUES ('207', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Equity at Kelompok Akun', '', '1', '2022-06-11 04:59:18', null);
INSERT INTO `cms_logs` VALUES ('208', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Income at Kelompok Akun', '', '1', '2022-06-11 04:59:25', null);
INSERT INTO `cms_logs` VALUES ('209', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Cost of Goods Sold at Kelompok Akun', '', '1', '2022-06-11 04:59:39', null);
INSERT INTO `cms_logs` VALUES ('210', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_class/add-save', 'Add New Data Expense at Kelompok Akun', '', '1', '2022-06-11 04:59:47', null);
INSERT INTO `cms_logs` VALUES ('211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/21', 'Update data Tipe Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', '1', '2022-06-11 05:02:10', null);
INSERT INTO `cms_logs` VALUES ('212', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Cash/Bank at Tipe Akun', '', '1', '2022-06-11 05:05:52', null);
INSERT INTO `cms_logs` VALUES ('213', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Account Receivable at Tipe Akun', '', '1', '2022-06-11 05:06:07', null);
INSERT INTO `cms_logs` VALUES ('214', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Inventory at Tipe Akun', '', '1', '2022-06-11 05:06:17', null);
INSERT INTO `cms_logs` VALUES ('215', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Other Current Asset at Tipe Akun', '', '1', '2022-06-11 05:06:27', null);
INSERT INTO `cms_logs` VALUES ('216', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Other Current Liability at Tipe Akun', '', '1', '2022-06-11 05:06:41', null);
INSERT INTO `cms_logs` VALUES ('217', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Account Payables at Tipe Akun', '', '1', '2022-06-11 05:06:54', null);
INSERT INTO `cms_logs` VALUES ('218', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Equity at Tipe Akun', '', '1', '2022-06-11 05:07:12', null);
INSERT INTO `cms_logs` VALUES ('219', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Income at Tipe Akun', '', '1', '2022-06-11 05:07:29', null);
INSERT INTO `cms_logs` VALUES ('220', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Cost of Goods Sold at Tipe Akun', '', '1', '2022-06-11 05:08:14', null);
INSERT INTO `cms_logs` VALUES ('221', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/coa_type/add-save', 'Add New Data Expense at Tipe Akun', '', '1', '2022-06-11 05:08:25', null);
INSERT INTO `cms_logs` VALUES ('222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:24:26', null);
INSERT INTO `cms_logs` VALUES ('223', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:25:11', null);
INSERT INTO `cms_logs` VALUES ('224', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:25:41', null);
INSERT INTO `cms_logs` VALUES ('225', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:26:09', null);
INSERT INTO `cms_logs` VALUES ('226', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:26:26', null);
INSERT INTO `cms_logs` VALUES ('227', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:26:48', null);
INSERT INTO `cms_logs` VALUES ('228', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:27:07', null);
INSERT INTO `cms_logs` VALUES ('229', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:27:37', null);
INSERT INTO `cms_logs` VALUES ('230', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:28:13', null);
INSERT INTO `cms_logs` VALUES ('231', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:28:41', null);
INSERT INTO `cms_logs` VALUES ('232', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/22', 'Update data Akun at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-11 05:29:10', null);
INSERT INTO `cms_logs` VALUES ('233', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:29:52', null);
INSERT INTO `cms_logs` VALUES ('234', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:30:32', null);
INSERT INTO `cms_logs` VALUES ('235', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:31:17', null);
INSERT INTO `cms_logs` VALUES ('236', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:31:58', null);
INSERT INTO `cms_logs` VALUES ('237', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:32:22', null);
INSERT INTO `cms_logs` VALUES ('238', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:32:46', null);
INSERT INTO `cms_logs` VALUES ('239', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:33:13', null);
INSERT INTO `cms_logs` VALUES ('240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:33:38', null);
INSERT INTO `cms_logs` VALUES ('241', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:34:08', null);
INSERT INTO `cms_logs` VALUES ('242', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:34:46', null);
INSERT INTO `cms_logs` VALUES ('243', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:35:18', null);
INSERT INTO `cms_logs` VALUES ('244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:35:40', null);
INSERT INTO `cms_logs` VALUES ('245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:36:13', null);
INSERT INTO `cms_logs` VALUES ('246', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:36:39', null);
INSERT INTO `cms_logs` VALUES ('247', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:37:09', null);
INSERT INTO `cms_logs` VALUES ('248', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:37:39', null);
INSERT INTO `cms_logs` VALUES ('249', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:38:10', null);
INSERT INTO `cms_logs` VALUES ('250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:38:26', null);
INSERT INTO `cms_logs` VALUES ('251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:38:49', null);
INSERT INTO `cms_logs` VALUES ('252', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:39:14', null);
INSERT INTO `cms_logs` VALUES ('253', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:39:34', null);
INSERT INTO `cms_logs` VALUES ('254', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/add-save', 'Add New Data  at Akun', '', '1', '2022-06-11 05:39:53', null);
INSERT INTO `cms_logs` VALUES ('255', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-11 11:40:55', null);
INSERT INTO `cms_logs` VALUES ('256', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/23', 'Update data Alasan Opname at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', '1', '2022-06-11 11:53:44', null);
INSERT INTO `cms_logs` VALUES ('257', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian Inventaris at Alasan Opname', '', '1', '2022-06-11 11:54:09', null);
INSERT INTO `cms_logs` VALUES ('258', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian dari Penerimaan at Alasan Opname', '', '1', '2022-06-11 11:54:26', null);
INSERT INTO `cms_logs` VALUES ('259', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-11 11:56:43', null);
INSERT INTO `cms_logs` VALUES ('260', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian Inventaris at Alasan Opname', '', '1', '2022-06-11 11:57:38', null);
INSERT INTO `cms_logs` VALUES ('261', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stok_opname_type/add-save', 'Add New Data Penyesuaian dari Penerimaan at Alasan Opname', '', '1', '2022-06-11 11:57:45', null);
INSERT INTO `cms_logs` VALUES ('262', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-11 11:58:40', null);
INSERT INTO `cms_logs` VALUES ('263', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-11 11:59:35', null);
INSERT INTO `cms_logs` VALUES ('264', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/24', 'Update data Stok Opname at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', '1', '2022-06-11 12:01:02', null);
INSERT INTO `cms_logs` VALUES ('265', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/stock_opnames/add-save', 'Add New Data OP-22060004 at Stok Opname', '', '1', '2022-06-11 12:39:01', null);
INSERT INTO `cms_logs` VALUES ('266', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/25', 'Update data Jenis Transaksi Jurnal at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-11 14:39:04', null);
INSERT INTO `cms_logs` VALUES ('267', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Purchase Down Payment at Jenis Transaksi Jurnal', '', '1', '2022-06-11 14:39:54', null);
INSERT INTO `cms_logs` VALUES ('268', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Goods Receipt at Jenis Transaksi Jurnal', '', '1', '2022-06-11 14:40:03', null);
INSERT INTO `cms_logs` VALUES ('269', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Sales Down Payment at Jenis Transaksi Jurnal', '', '1', '2022-06-11 14:40:14', null);
INSERT INTO `cms_logs` VALUES ('270', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Delivery Order at Jenis Transaksi Jurnal', '', '1', '2022-06-11 14:40:22', null);
INSERT INTO `cms_logs` VALUES ('271', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/transaction_types/add-save', 'Add New Data Inventory Adjustment at Jenis Transaksi Jurnal', '', '1', '2022-06-11 14:40:30', null);
INSERT INTO `cms_logs` VALUES ('272', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/11', 'Update data Keuangan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-06-11 14:49:19', null);
INSERT INTO `cms_logs` VALUES ('273', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/26', 'Update data Transaksi Jurnal at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>7</td><td></td></tr></tbody></table>', '1', '2022-06-11 14:49:29', null);
INSERT INTO `cms_logs` VALUES ('274', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-11 15:23:12', null);
INSERT INTO `cms_logs` VALUES ('275', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/1', 'Delete data 1 at Transaksi Jurnal', '', '1', '2022-06-11 15:23:26', null);
INSERT INTO `cms_logs` VALUES ('276', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/2', 'Delete data 2 at Transaksi Jurnal', '', '1', '2022-06-11 15:23:29', null);
INSERT INTO `cms_logs` VALUES ('277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/3', 'Delete data 3 at Transaksi Jurnal', '', '1', '2022-06-11 15:23:31', null);
INSERT INTO `cms_logs` VALUES ('278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-11 15:24:01', null);
INSERT INTO `cms_logs` VALUES ('279', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-11 15:24:53', null);
INSERT INTO `cms_logs` VALUES ('280', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/32', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:47:18', null);
INSERT INTO `cms_logs` VALUES ('281', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/3', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:50:18', null);
INSERT INTO `cms_logs` VALUES ('282', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/2', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:50:24', null);
INSERT INTO `cms_logs` VALUES ('283', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/1', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:50:32', null);
INSERT INTO `cms_logs` VALUES ('284', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/4', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:50:49', null);
INSERT INTO `cms_logs` VALUES ('285', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/6', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:51:20', null);
INSERT INTO `cms_logs` VALUES ('286', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/7', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:51:30', null);
INSERT INTO `cms_logs` VALUES ('287', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/8', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-11 16:51:41', null);
INSERT INTO `cms_logs` VALUES ('288', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/31', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:19', null);
INSERT INTO `cms_logs` VALUES ('289', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/30', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:25', null);
INSERT INTO `cms_logs` VALUES ('290', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/29', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:31', null);
INSERT INTO `cms_logs` VALUES ('291', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/28', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:38', null);
INSERT INTO `cms_logs` VALUES ('292', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/27', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:44', null);
INSERT INTO `cms_logs` VALUES ('293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/26', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:50', null);
INSERT INTO `cms_logs` VALUES ('294', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/25', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:52:56', null);
INSERT INTO `cms_logs` VALUES ('295', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/24', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:01', null);
INSERT INTO `cms_logs` VALUES ('296', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/23', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:06', null);
INSERT INTO `cms_logs` VALUES ('297', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/22', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:13', null);
INSERT INTO `cms_logs` VALUES ('298', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/21', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:19', null);
INSERT INTO `cms_logs` VALUES ('299', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/20', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:25', null);
INSERT INTO `cms_logs` VALUES ('300', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/19', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:31', null);
INSERT INTO `cms_logs` VALUES ('301', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/18', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:37', null);
INSERT INTO `cms_logs` VALUES ('302', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/17', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:43', null);
INSERT INTO `cms_logs` VALUES ('303', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/15', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:49', null);
INSERT INTO `cms_logs` VALUES ('304', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/16', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:53:57', null);
INSERT INTO `cms_logs` VALUES ('305', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/14', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:54:03', null);
INSERT INTO `cms_logs` VALUES ('306', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/13', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>L</td></tr></tbody></table>', '1', '2022-06-11 16:54:10', null);
INSERT INTO `cms_logs` VALUES ('307', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Laporan at Menu Management', '', '1', '2022-06-12 12:32:31', null);
INSERT INTO `cms_logs` VALUES ('308', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Neraca at Menu Management', '', '1', '2022-06-12 12:34:15', null);
INSERT INTO `cms_logs` VALUES ('309', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/28', 'Update data Neraca at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', '1', '2022-06-12 12:34:39', null);
INSERT INTO `cms_logs` VALUES ('310', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Laba Rugi at Menu Management', '', '1', '2022-06-12 12:34:58', null);
INSERT INTO `cms_logs` VALUES ('311', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Pembelian at Menu Management', '', '1', '2022-06-12 12:37:07', null);
INSERT INTO `cms_logs` VALUES ('312', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Penjualan at Menu Management', '', '1', '2022-06-12 12:38:02', null);
INSERT INTO `cms_logs` VALUES ('313', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/add-save', 'Add New Data Stok at Menu Management', '', '1', '2022-06-12 12:39:55', null);
INSERT INTO `cms_logs` VALUES ('314', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:02:52', null);
INSERT INTO `cms_logs` VALUES ('315', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:03:13', null);
INSERT INTO `cms_logs` VALUES ('316', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:03:37', null);
INSERT INTO `cms_logs` VALUES ('317', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:05:50', null);
INSERT INTO `cms_logs` VALUES ('318', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:06:33', null);
INSERT INTO `cms_logs` VALUES ('319', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:06:56', null);
INSERT INTO `cms_logs` VALUES ('320', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:08:47', null);
INSERT INTO `cms_logs` VALUES ('321', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/7', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', '1', '2022-06-12 13:08:55', null);
INSERT INTO `cms_logs` VALUES ('322', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:09:17', null);
INSERT INTO `cms_logs` VALUES ('323', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:09:58', null);
INSERT INTO `cms_logs` VALUES ('324', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:10:23', null);
INSERT INTO `cms_logs` VALUES ('325', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/10', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', '1', '2022-06-12 13:11:06', null);
INSERT INTO `cms_logs` VALUES ('326', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/edit-save/10', 'Update data  at Tabel Neraca Laba Rugi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>begining_balance</td><td>0</td><td></td></tr><tr><td>debit</td><td>0</td><td></td></tr><tr><td>credit</td><td>0</td><td></td></tr><tr><td>ending_balance</td><td>0</td><td></td></tr><tr><td>created_by</td><td></td><td></td></tr></tbody></table>', '1', '2022-06-12 13:11:26', null);
INSERT INTO `cms_logs` VALUES ('327', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:12:03', null);
INSERT INTO `cms_logs` VALUES ('328', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/10', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-12 13:13:54', null);
INSERT INTO `cms_logs` VALUES ('329', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/9', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-12 13:14:00', null);
INSERT INTO `cms_logs` VALUES ('330', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:14:27', null);
INSERT INTO `cms_logs` VALUES ('331', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:14:53', null);
INSERT INTO `cms_logs` VALUES ('332', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:15:20', null);
INSERT INTO `cms_logs` VALUES ('333', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:15:42', null);
INSERT INTO `cms_logs` VALUES ('334', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/chart_of_accounts/edit-save/12', 'Update data  at Akun', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>created_by</td><td></td><td></td></tr><tr><td>report_type</td><td></td><td>N</td></tr></tbody></table>', '1', '2022-06-12 13:16:25', null);
INSERT INTO `cms_logs` VALUES ('335', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:17:00', null);
INSERT INTO `cms_logs` VALUES ('336', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:17:24', null);
INSERT INTO `cms_logs` VALUES ('337', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:17:43', null);
INSERT INTO `cms_logs` VALUES ('338', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/table_neraca/add-save', 'Add New Data  at Tabel Neraca Laba Rugi', '', '1', '2022-06-12 13:22:52', null);
INSERT INTO `cms_logs` VALUES ('339', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/28', 'Update data Neraca at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminTableNeracaController@getFormNeraca</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', '1', '2022-06-12 13:46:20', null);
INSERT INTO `cms_logs` VALUES ('340', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>#</td><td>AdminTableNeracaController@getFormProfitLost</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-12 13:47:41', null);
INSERT INTO `cms_logs` VALUES ('341', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-12 13:48:32', null);
INSERT INTO `cms_logs` VALUES ('342', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/29', 'Update data Laba Rugi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', '1', '2022-06-12 13:49:20', null);
INSERT INTO `cms_logs` VALUES ('343', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminGoodsReceiptController@getFormStok</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:23:43', null);
INSERT INTO `cms_logs` VALUES ('344', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/31', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>path</td><td>#</td><td>AdminSalesOrdersController@getFormSales</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:24:23', null);
INSERT INTO `cms_logs` VALUES ('345', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/30', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>#</td><td>AdminPurchaseOrdersController@getFormPurchase</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:25:04', null);
INSERT INTO `cms_logs` VALUES ('346', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/30', 'Update data Pembelian at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>URL</td><td>Controller & Method</td></tr><tr><td>parent_id</td><td>27</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:25:25', null);
INSERT INTO `cms_logs` VALUES ('347', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/31', 'Update data Penjualan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:25:35', null);
INSERT INTO `cms_logs` VALUES ('348', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:25:41', null);
INSERT INTO `cms_logs` VALUES ('349', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/32', 'Update data Stok at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>27</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', '1', '2022-06-12 16:26:45', null);
INSERT INTO `cms_logs` VALUES ('350', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-13 14:35:15', null);
INSERT INTO `cms_logs` VALUES ('351', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-13 14:35:37', null);
INSERT INTO `cms_logs` VALUES ('352', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com logout', '', '1', '2022-06-13 14:48:36', null);
INSERT INTO `cms_logs` VALUES ('353', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-13 14:49:40', null);
INSERT INTO `cms_logs` VALUES ('354', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-13 16:05:16', null);
INSERT INTO `cms_logs` VALUES ('355', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-13 16:06:31', null);
INSERT INTO `cms_logs` VALUES ('356', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Add New Data  at Transaksi Jurnal', '', '1', '2022-06-13 16:08:15', null);
INSERT INTO `cms_logs` VALUES ('357', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', '1', '2022-06-16 16:07:29', null);
INSERT INTO `cms_logs` VALUES ('358', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', ' logout', '', null, '2022-06-18 11:35:26', null);
INSERT INTO `cms_logs` VALUES ('359', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-18 19:06:38', null);
INSERT INTO `cms_logs` VALUES ('360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:08:44', null);
INSERT INTO `cms_logs` VALUES ('361', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:10:03', null);
INSERT INTO `cms_logs` VALUES ('362', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:13:55', null);
INSERT INTO `cms_logs` VALUES ('363', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:14:45', null);
INSERT INTO `cms_logs` VALUES ('364', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:17:21', null);
INSERT INTO `cms_logs` VALUES ('365', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:19:12', null);
INSERT INTO `cms_logs` VALUES ('366', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 21:20:36', null);
INSERT INTO `cms_logs` VALUES ('367', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 23:26:53', null);
INSERT INTO `cms_logs` VALUES ('368', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/27', 'Menghapus data 27 pada Transaksi Jurnal', '', '1', '2022-06-18 23:27:04', null);
INSERT INTO `cms_logs` VALUES ('369', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/26', 'Menghapus data 26 pada Transaksi Jurnal', '', '1', '2022-06-18 23:27:08', null);
INSERT INTO `cms_logs` VALUES ('370', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-18 23:36:42', null);
INSERT INTO `cms_logs` VALUES ('371', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/29', 'Menghapus data 29 pada Transaksi Jurnal', '', '1', '2022-06-18 23:38:24', null);
INSERT INTO `cms_logs` VALUES ('372', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-19 18:01:07', null);
INSERT INTO `cms_logs` VALUES ('373', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 18:10:39', null);
INSERT INTO `cms_logs` VALUES ('374', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 18:33:05', null);
INSERT INTO `cms_logs` VALUES ('375', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/22', 'Mencoba menghapus 22 data pada Pesanan', '', '1', '2022-06-19 18:44:32', null);
INSERT INTO `cms_logs` VALUES ('376', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/22', 'Menghapus data 22 pada Pesanan', '', '1', '2022-06-19 18:45:02', null);
INSERT INTO `cms_logs` VALUES ('377', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/22', 'Menghapus data 22 pada Pesanan', '', '1', '2022-06-19 18:45:24', null);
INSERT INTO `cms_logs` VALUES ('378', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/21', 'Menghapus data 21 pada Pesanan', '', '1', '2022-06-19 18:45:27', null);
INSERT INTO `cms_logs` VALUES ('379', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/20', 'Menghapus data 20 pada Pesanan', '', '1', '2022-06-19 18:45:32', null);
INSERT INTO `cms_logs` VALUES ('380', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/19', 'Menghapus data 19 pada Pesanan', '', '1', '2022-06-19 18:45:35', null);
INSERT INTO `cms_logs` VALUES ('381', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/18', 'Menghapus data 18 pada Pesanan', '', '1', '2022-06-19 18:45:38', null);
INSERT INTO `cms_logs` VALUES ('382', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/17', 'Menghapus data 17 pada Pesanan', '', '1', '2022-06-19 18:45:40', null);
INSERT INTO `cms_logs` VALUES ('383', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/16', 'Menghapus data 16 pada Pesanan', '', '1', '2022-06-19 18:45:43', null);
INSERT INTO `cms_logs` VALUES ('384', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/15', 'Menghapus data 15 pada Pesanan', '', '1', '2022-06-19 18:45:46', null);
INSERT INTO `cms_logs` VALUES ('385', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/14', 'Menghapus data 14 pada Pesanan', '', '1', '2022-06-19 18:45:49', null);
INSERT INTO `cms_logs` VALUES ('386', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/13', 'Menghapus data 13 pada Pesanan', '', '1', '2022-06-19 18:45:53', null);
INSERT INTO `cms_logs` VALUES ('387', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/12', 'Menghapus data 12 pada Pesanan', '', '1', '2022-06-19 18:45:55', null);
INSERT INTO `cms_logs` VALUES ('388', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/11', 'Menghapus data 11 pada Pesanan', '', '1', '2022-06-19 18:45:58', null);
INSERT INTO `cms_logs` VALUES ('389', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/10', 'Menghapus data 10 pada Pesanan', '', '1', '2022-06-19 18:46:02', null);
INSERT INTO `cms_logs` VALUES ('390', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/9', 'Menghapus data 9 pada Pesanan', '', '1', '2022-06-19 18:46:05', null);
INSERT INTO `cms_logs` VALUES ('391', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 18:47:26', null);
INSERT INTO `cms_logs` VALUES ('392', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/23', 'Menghapus data 23 pada Pesanan', '', '1', '2022-06-19 18:48:37', null);
INSERT INTO `cms_logs` VALUES ('393', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-19 18:49:22', null);
INSERT INTO `cms_logs` VALUES ('394', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 18:49:55', null);
INSERT INTO `cms_logs` VALUES ('395', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', '1', '2022-06-19 19:41:43', null);
INSERT INTO `cms_logs` VALUES ('396', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>500000</td><td>600000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>99500000</td><td>99400000</td></tr></tbody></table>', '1', '2022-06-19 19:44:40', null);
INSERT INTO `cms_logs` VALUES ('397', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>600000</td><td>400000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>99400000</td><td>99600000</td></tr></tbody></table>', '1', '2022-06-19 19:55:17', null);
INSERT INTO `cms_logs` VALUES ('398', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>400000</td><td>700000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>99600000</td><td>99300000</td></tr></tbody></table>', '1', '2022-06-19 19:55:53', null);
INSERT INTO `cms_logs` VALUES ('399', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>700000</td><td>400000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>99300000</td><td>99600000</td></tr></tbody></table>', '1', '2022-06-19 19:57:57', null);
INSERT INTO `cms_logs` VALUES ('400', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/24', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>400000</td><td>100000000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>99600000</td><td>0</td></tr></tbody></table>', '1', '2022-06-19 19:58:22', null);
INSERT INTO `cms_logs` VALUES ('401', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 20:23:34', null);
INSERT INTO `cms_logs` VALUES ('402', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/24', 'Menghapus data 24 pada Pesanan', '', '1', '2022-06-19 20:44:05', null);
INSERT INTO `cms_logs` VALUES ('403', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/24', 'Menghapus data 24 pada Pesanan', '', '1', '2022-06-19 20:45:11', null);
INSERT INTO `cms_logs` VALUES ('404', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/24', 'Menghapus data 24 pada Pesanan', '', '1', '2022-06-19 20:46:50', null);
INSERT INTO `cms_logs` VALUES ('405', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/24', 'Menghapus data 24 pada Pesanan', '', '1', '2022-06-19 20:47:02', null);
INSERT INTO `cms_logs` VALUES ('406', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/25', 'Menghapus data 25 pada Pesanan', '', '1', '2022-06-19 20:47:06', null);
INSERT INTO `cms_logs` VALUES ('407', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 20:48:59', null);
INSERT INTO `cms_logs` VALUES ('408', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/27', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-TAR-722060027</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', '1', '2022-06-19 20:49:16', null);
INSERT INTO `cms_logs` VALUES ('409', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/add-save', 'Tambah data baru  pada Penerimaan Barang', '', '1', '2022-06-19 21:56:53', null);
INSERT INTO `cms_logs` VALUES ('410', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/1', 'Menghapus data 1 pada Penerimaan Barang', '', '1', '2022-06-19 21:58:34', null);
INSERT INTO `cms_logs` VALUES ('411', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/6', 'Menghapus data 6 pada Penerimaan Barang', '', '1', '2022-06-19 21:58:45', null);
INSERT INTO `cms_logs` VALUES ('412', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/1', 'Menghapus data 1 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:29', null);
INSERT INTO `cms_logs` VALUES ('413', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/2', 'Menghapus data 2 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:33', null);
INSERT INTO `cms_logs` VALUES ('414', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/3', 'Menghapus data 3 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:36', null);
INSERT INTO `cms_logs` VALUES ('415', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/4', 'Menghapus data 4 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:39', null);
INSERT INTO `cms_logs` VALUES ('416', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/5', 'Menghapus data 5 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:42', null);
INSERT INTO `cms_logs` VALUES ('417', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/6', 'Menghapus data 6 pada Penerimaan Barang', '', '1', '2022-06-19 22:00:45', null);
INSERT INTO `cms_logs` VALUES ('418', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/add-save', 'Tambah data baru  pada Penerimaan Barang', '', '1', '2022-06-19 22:02:43', null);
INSERT INTO `cms_logs` VALUES ('419', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/26', 'Menghapus data 26 pada Pesanan', '', '1', '2022-06-19 22:06:17', null);
INSERT INTO `cms_logs` VALUES ('420', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/27', 'Menghapus data 27 pada Pesanan', '', '1', '2022-06-19 22:06:21', null);
INSERT INTO `cms_logs` VALUES ('421', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-19 22:07:17', null);
INSERT INTO `cms_logs` VALUES ('422', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/28', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>500000</td><td>1000000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>500000</td><td>0</td></tr></tbody></table>', '1', '2022-06-19 22:08:19', null);
INSERT INTO `cms_logs` VALUES ('423', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/28', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>created_by</td><td>1</td><td></td></tr></tbody></table>', '1', '2022-06-19 22:10:11', null);
INSERT INTO `cms_logs` VALUES ('424', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/edit-save/28', 'Memperbaharui data  pada Pesanan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>PO-ABC-122060001</td><td></td></tr><tr><td>order_status_id</td><td>1</td><td></td></tr><tr><td>total_amount</td><td>500000</td><td>1000000</td></tr><tr><td>created_by</td><td>1</td><td></td></tr><tr><td>amount_due</td><td>500000</td><td>0</td></tr></tbody></table>', '1', '2022-06-19 22:10:52', null);
INSERT INTO `cms_logs` VALUES ('425', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/add-save', 'Tambah data baru  pada Penerimaan Barang', '', '1', '2022-06-19 22:12:56', null);
INSERT INTO `cms_logs` VALUES ('426', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/8', 'Menghapus data 8 pada Penerimaan Barang', '', '1', '2022-06-19 22:13:43', null);
INSERT INTO `cms_logs` VALUES ('427', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/delete/7', 'Menghapus data 7 pada Penerimaan Barang', '', '1', '2022-06-19 22:13:47', null);
INSERT INTO `cms_logs` VALUES ('428', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-19 22:21:28', null);
INSERT INTO `cms_logs` VALUES ('429', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com keluar', '', '1', '2022-06-19 22:28:36', null);
INSERT INTO `cms_logs` VALUES ('430', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-19 22:45:24', null);
INSERT INTO `cms_logs` VALUES ('431', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-19 23:10:13', null);
INSERT INTO `cms_logs` VALUES ('432', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/1', 'Menghapus data 1 pada Penjualan', '', '1', '2022-06-19 23:13:58', null);
INSERT INTO `cms_logs` VALUES ('433', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/2', 'Menghapus data 2 pada Penjualan', '', '1', '2022-06-19 23:14:01', null);
INSERT INTO `cms_logs` VALUES ('434', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/3', 'Menghapus data 3 pada Penjualan', '', '1', '2022-06-19 23:14:04', null);
INSERT INTO `cms_logs` VALUES ('435', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/4', 'Menghapus data 4 pada Penjualan', '', '1', '2022-06-19 23:14:07', null);
INSERT INTO `cms_logs` VALUES ('436', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-19 23:14:40', null);
INSERT INTO `cms_logs` VALUES ('437', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/edit-save/5', 'Memperbaharui data  pada Penjualan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_number</td><td>SO-RIC-122060001</td><td></td></tr><tr><td>subtotal</td><td>500000</td><td>100000</td></tr><tr><td>total</td><td>500000</td><td>100000</td></tr></tbody></table>', '1', '2022-06-19 23:15:19', null);
INSERT INTO `cms_logs` VALUES ('438', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/5', 'Menghapus data 5 pada Penjualan', '', '1', '2022-06-19 23:15:36', null);
INSERT INTO `cms_logs` VALUES ('439', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/34', 'Memperbaharui data Buku Besar pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>7</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-06-19 23:26:29', null);
INSERT INTO `cms_logs` VALUES ('440', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/38', 'Menghapus data 38 pada Transaksi Jurnal', '', '1', '2022-06-19 23:29:05', null);
INSERT INTO `cms_logs` VALUES ('441', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/46', 'Menghapus data 46 pada Transaksi Jurnal', '', '1', '2022-06-19 23:29:09', null);
INSERT INTO `cms_logs` VALUES ('442', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 20:00:49', null);
INSERT INTO `cms_logs` VALUES ('443', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-22 20:02:29', null);
INSERT INTO `cms_logs` VALUES ('444', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 20:05:34', null);
INSERT INTO `cms_logs` VALUES ('445', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 20:51:38', null);
INSERT INTO `cms_logs` VALUES ('446', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 20:53:36', null);
INSERT INTO `cms_logs` VALUES ('447', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 20:58:00', null);
INSERT INTO `cms_logs` VALUES ('448', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:09:15', null);
INSERT INTO `cms_logs` VALUES ('449', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:14:35', null);
INSERT INTO `cms_logs` VALUES ('450', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:17:50', null);
INSERT INTO `cms_logs` VALUES ('451', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com keluar', '', '1', '2022-06-22 21:19:47', null);
INSERT INTO `cms_logs` VALUES ('452', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:19:56', null);
INSERT INTO `cms_logs` VALUES ('453', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:24:10', null);
INSERT INTO `cms_logs` VALUES ('454', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:24:50', null);
INSERT INTO `cms_logs` VALUES ('455', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:32:04', null);
INSERT INTO `cms_logs` VALUES ('456', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:36:04', null);
INSERT INTO `cms_logs` VALUES ('457', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 21:39:24', null);
INSERT INTO `cms_logs` VALUES ('458', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-22 21:52:06', null);
INSERT INTO `cms_logs` VALUES ('459', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-22 21:53:25', null);
INSERT INTO `cms_logs` VALUES ('460', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/6', 'Menghapus data 6 pada Penjualan', '', '1', '2022-06-22 22:05:18', null);
INSERT INTO `cms_logs` VALUES ('461', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/7', 'Menghapus data 7 pada Penjualan', '', '1', '2022-06-22 22:05:28', null);
INSERT INTO `cms_logs` VALUES ('462', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com keluar', '', '1', '2022-06-22 22:05:45', null);
INSERT INTO `cms_logs` VALUES ('463', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-22 22:55:35', null);
INSERT INTO `cms_logs` VALUES ('464', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-22 23:01:07', null);
INSERT INTO `cms_logs` VALUES ('465', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-22 23:03:47', null);
INSERT INTO `cms_logs` VALUES ('466', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/logout', 'admin@crudbooster.com keluar', '', '1', '2022-06-22 23:33:32', null);
INSERT INTO `cms_logs` VALUES ('467', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-26 14:20:33', null);
INSERT INTO `cms_logs` VALUES ('468', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-26 18:12:37', null);
INSERT INTO `cms_logs` VALUES ('469', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/28', 'Menghapus data 28 pada Pesanan', '', '1', '2022-06-26 20:02:38', null);
INSERT INTO `cms_logs` VALUES ('470', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/29', 'Menghapus data 29 pada Pesanan', '', '1', '2022-06-26 20:02:41', null);
INSERT INTO `cms_logs` VALUES ('471', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/delete/51', 'Menghapus data 51 pada Transaksi Jurnal', '', '1', '2022-06-26 20:05:04', null);
INSERT INTO `cms_logs` VALUES ('472', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/9', 'Menghapus data 9 pada Penjualan', '', '1', '2022-06-26 20:13:02', null);
INSERT INTO `cms_logs` VALUES ('473', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/8', 'Menghapus data 8 pada Penjualan', '', '1', '2022-06-26 20:13:06', null);
INSERT INTO `cms_logs` VALUES ('474', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/menu_management/edit-save/34', 'Memperbaharui data Buku Besar pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>AdminJournalTransactions36ControllerGetIndex</td><td>AdminJournalDetailsControllerGetIndex</td></tr><tr><td>parent_id</td><td>7</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', '1', '2022-06-26 20:50:38', null);
INSERT INTO `cms_logs` VALUES ('475', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-26 20:52:01', null);
INSERT INTO `cms_logs` VALUES ('476', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/delete/30', 'Menghapus data 30 pada Pesanan', '', '1', '2022-06-26 20:54:28', null);
INSERT INTO `cms_logs` VALUES ('477', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-26 20:55:19', null);
INSERT INTO `cms_logs` VALUES ('478', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/add-save', 'Tambah data baru  pada Penerimaan Barang', '', '1', '2022-06-26 22:31:10', null);
INSERT INTO `cms_logs` VALUES ('479', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-27 22:50:06', null);
INSERT INTO `cms_logs` VALUES ('480', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/11', 'Menghapus data 11 pada Penjualan', '', '1', '2022-06-27 22:51:02', null);
INSERT INTO `cms_logs` VALUES ('481', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/10', 'Menghapus data 10 pada Penjualan', '', '1', '2022-06-27 22:51:06', null);
INSERT INTO `cms_logs` VALUES ('482', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-27 22:51:43', null);
INSERT INTO `cms_logs` VALUES ('483', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-27 22:55:39', null);
INSERT INTO `cms_logs` VALUES ('484', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/12', 'Menghapus data 12 pada Penjualan', '', '1', '2022-06-27 23:26:58', null);
INSERT INTO `cms_logs` VALUES ('485', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/delete/13', 'Menghapus data 13 pada Penjualan', '', '1', '2022-06-27 23:27:01', null);
INSERT INTO `cms_logs` VALUES ('486', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-27 23:28:27', null);
INSERT INTO `cms_logs` VALUES ('487', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-27 23:37:53', null);
INSERT INTO `cms_logs` VALUES ('488', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', '1', '2022-06-28 13:04:47', null);
INSERT INTO `cms_logs` VALUES ('489', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-28 13:13:04', null);
INSERT INTO `cms_logs` VALUES ('490', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/goods_receipt/add-save', 'Tambah data baru  pada Penerimaan Barang', '', '1', '2022-06-28 13:23:28', null);
INSERT INTO `cms_logs` VALUES ('491', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/purchase_orders/add-save', 'Tambah data baru  pada Pesanan', '', '1', '2022-06-28 13:42:37', null);
INSERT INTO `cms_logs` VALUES ('492', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/sales_orders/add-save', 'Tambah data baru  pada Penjualan', '', '1', '2022-06-28 14:03:45', null);
INSERT INTO `cms_logs` VALUES ('493', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'http://vl_online.test/admin/journal_transactions/add-save', 'Tambah data baru  pada Transaksi Jurnal', '', '1', '2022-06-28 14:31:13', null);

-- ----------------------------
-- Table structure for `cms_menus`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menus`;
CREATE TABLE `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_menus
-- ----------------------------
INSERT INTO `cms_menus` VALUES ('1', 'Pembelian', 'URL', '#', 'normal', 'fa fa-tag', '0', '1', '0', '1', '1', '2022-05-23 05:22:18', '2022-05-23 05:22:42');
INSERT INTO `cms_menus` VALUES ('2', 'Penjualan', 'URL', '#', 'normal', 'fa fa-tags', '0', '1', '0', '1', '2', '2022-05-23 05:23:13', '2022-05-23 05:24:14');
INSERT INTO `cms_menus` VALUES ('3', 'Inventory', 'URL', '#', 'normal', 'fa fa-dropbox', '0', '1', '0', '1', '3', '2022-05-23 05:25:10', '2022-05-23 05:25:27');
INSERT INTO `cms_menus` VALUES ('4', 'Setup Data', 'URL', '#', 'normal', 'fa fa-gears', '0', '1', '0', '1', '6', '2022-05-23 05:26:12', '2022-05-23 05:26:20');
INSERT INTO `cms_menus` VALUES ('5', 'Akun Bank', 'Route', 'AdminAccountBanksControllerGetIndex', 'normal', 'fa fa-money', '4', '1', '0', '1', '4', '2022-05-23 05:30:55', '2022-05-23 05:32:01');
INSERT INTO `cms_menus` VALUES ('6', 'Tipe Pembayaran', 'Route', 'AdminPaymentTypesControllerGetIndex', 'normal', 'fa fa-gear', '4', '1', '0', '1', '5', '2022-05-23 05:36:26', '2022-05-23 05:37:06');
INSERT INTO `cms_menus` VALUES ('7', 'Akunting', 'URL', '#', 'normal', 'fa fa-th-list', '0', '1', '0', '1', '4', '2022-05-23 05:38:13', '2022-05-23 05:38:26');
INSERT INTO `cms_menus` VALUES ('8', 'Vendor', 'Route', 'AdminVendorsControllerGetIndex', 'normal', 'fa fa-users', '1', '1', '0', '1', '1', '2022-05-23 05:42:13', '2022-05-23 05:43:25');
INSERT INTO `cms_menus` VALUES ('9', 'Customer', 'Route', 'AdminCustomersControllerGetIndex', null, 'fa fa-heart', '2', '1', '0', '1', '1', '2022-05-23 05:45:39', null);
INSERT INTO `cms_menus` VALUES ('10', 'Category Produk', 'Route', 'AdminProductCategoriesControllerGetIndex', 'normal', 'fa fa-gear', '3', '1', '0', '1', '4', '2022-05-23 05:50:01', '2022-05-28 12:24:30');
INSERT INTO `cms_menus` VALUES ('11', 'Keuangan', 'URL', '#', 'normal', 'fa fa-money', '0', '0', '0', '1', '3', '2022-05-23 05:52:09', '2022-06-11 14:49:18');
INSERT INTO `cms_menus` VALUES ('12', 'Ekspedisi', 'Route', 'AdminExpeditionsControllerGetIndex', 'normal', 'fa fa-truck', '4', '1', '0', '1', '7', '2022-05-28 12:23:37', '2022-05-28 12:24:37');
INSERT INTO `cms_menus` VALUES ('13', 'Brand', 'Route', 'AdminProductBrandsControllerGetIndex', 'normal', 'fa fa-star', '3', '1', '0', '1', '5', '2022-05-28 12:34:44', '2022-05-28 12:35:31');
INSERT INTO `cms_menus` VALUES ('14', 'Produk', 'Route', 'AdminProductsControllerGetIndex', 'normal', 'fa fa-barcode', '3', '1', '0', '1', '2', '2022-05-28 12:57:28', '2022-05-28 13:01:28');
INSERT INTO `cms_menus` VALUES ('15', 'Photo Produk', 'Route', 'AdminProductPhotosControllerGetIndex', null, 'fa fa-image', '0', '0', '0', '1', '1', '2022-05-28 13:46:33', null);
INSERT INTO `cms_menus` VALUES ('16', 'Pesanan', 'Route', 'AdminPurchaseOrdersControllerGetIndex', 'normal', 'fa fa-th', '1', '1', '0', '1', '2', '2022-05-28 13:57:54', '2022-05-28 14:00:05');
INSERT INTO `cms_menus` VALUES ('17', 'Penerimaan Barang', 'Route', 'AdminGoodsReceiptControllerGetIndex', 'normal', 'fa fa-arrow-right', '1', '1', '0', '1', '3', '2022-05-29 01:45:17', '2022-05-29 01:50:28');
INSERT INTO `cms_menus` VALUES ('18', 'Item List', 'Route', 'AdminProducts25ControllerGetIndex', 'normal', 'fa fa-th-list', '3', '1', '0', '1', '1', '2022-06-06 02:14:32', '2022-06-06 02:15:24');
INSERT INTO `cms_menus` VALUES ('19', 'Penjualan', 'Route', 'AdminSalesOrdersControllerGetIndex', 'normal', 'fa fa-th', '2', '1', '0', '1', '2', '2022-06-06 03:37:54', '2022-06-06 03:41:46');
INSERT INTO `cms_menus` VALUES ('20', 'Kelompok Akun', 'Route', 'AdminCoaClassControllerGetIndex', 'normal', 'fa fa-list-alt', '4', '1', '0', '1', '1', '2022-06-11 04:54:41', '2022-06-11 04:55:32');
INSERT INTO `cms_menus` VALUES ('21', 'Tipe Akun', 'Route', 'AdminCoaTypeControllerGetIndex', 'normal', 'fa fa-list-ul', '4', '1', '0', '1', '2', '2022-06-11 05:01:37', '2022-06-11 05:02:10');
INSERT INTO `cms_menus` VALUES ('22', 'Akun', 'Route', 'AdminChartOfAccountsControllerGetIndex', 'normal', 'fa fa-th-list', '7', '1', '0', '1', '3', '2022-06-11 05:18:03', '2022-06-11 05:29:10');
INSERT INTO `cms_menus` VALUES ('23', 'Alasan Opname', 'Route', 'AdminStokOpnameTypeControllerGetIndex', 'normal', 'fa fa-th-list', '4', '1', '0', '1', '6', '2022-06-11 11:49:01', '2022-06-11 11:53:44');
INSERT INTO `cms_menus` VALUES ('24', 'Stok Opname', 'Route', 'AdminStockOpnamesControllerGetIndex', 'normal', 'fa fa-check', '3', '1', '0', '1', '3', '2022-06-11 12:00:02', '2022-06-11 12:01:02');
INSERT INTO `cms_menus` VALUES ('25', 'Jenis Transaksi Jurnal', 'Route', 'AdminTransactionTypesControllerGetIndex', 'normal', 'fa fa-list-ol', '4', '1', '0', '1', '3', '2022-06-11 14:37:25', '2022-06-11 14:39:04');
INSERT INTO `cms_menus` VALUES ('26', 'Transaksi Jurnal', 'Route', 'AdminJournalTransactionsControllerGetIndex', 'normal', 'fa fa-money', '7', '1', '0', '1', '1', '2022-06-11 14:43:23', '2022-06-11 14:49:29');
INSERT INTO `cms_menus` VALUES ('27', 'Laporan', 'URL', '#', 'normal', 'fa fa-folder', '0', '1', '0', '1', '5', '2022-06-12 12:32:31', null);
INSERT INTO `cms_menus` VALUES ('28', 'Neraca', 'Controller & Method', 'AdminTableNeracaController@getFormNeraca', 'normal', 'fa fa-file-text', '27', '1', '0', '1', '5', '2022-06-12 12:34:15', '2022-06-12 13:46:20');
INSERT INTO `cms_menus` VALUES ('29', 'Laba Rugi', 'Controller & Method', 'AdminTableNeracaController@getFormProfitLost', 'normal', 'fa fa-file-text-o', '27', '1', '0', '1', '4', '2022-06-12 12:34:58', '2022-06-12 13:49:20');
INSERT INTO `cms_menus` VALUES ('30', 'Pembelian', 'Controller & Method', 'AdminPurchaseOrdersController@getFormPurchase', 'normal', 'fa fa-file-text', '27', '1', '0', '1', '1', '2022-06-12 12:37:07', '2022-06-12 16:25:25');
INSERT INTO `cms_menus` VALUES ('31', 'Penjualan', 'Controller & Method', 'AdminSalesOrdersController@getFormSales', 'normal', 'fa fa-file-text', '27', '1', '0', '1', '2', '2022-06-12 12:38:02', '2022-06-12 16:25:34');
INSERT INTO `cms_menus` VALUES ('32', 'Stok', 'Controller & Method', 'AdminGoodsReceiptController@getFormStok', 'normal', 'fa fa-file-o', '27', '1', '0', '1', '3', '2022-06-12 12:39:55', '2022-06-12 16:26:45');
INSERT INTO `cms_menus` VALUES ('33', 'Tabel Neraca Laba Rugi', 'Route', 'AdminTableNeracaControllerGetIndex', null, 'fa fa-gear', '0', '1', '0', '1', '7', '2022-06-12 12:54:10', null);
INSERT INTO `cms_menus` VALUES ('34', 'Buku Besar', 'Route', 'AdminJournalDetailsControllerGetIndex', 'normal', 'fa fa-book', '7', '1', '0', '1', '2', '2022-06-19 23:24:52', '2022-06-26 20:50:38');

-- ----------------------------
-- Table structure for `cms_menus_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menus_privileges`;
CREATE TABLE `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_menus_privileges
-- ----------------------------
INSERT INTO `cms_menus_privileges` VALUES ('3', '1', '2');
INSERT INTO `cms_menus_privileges` VALUES ('4', '1', '1');
INSERT INTO `cms_menus_privileges` VALUES ('7', '2', '2');
INSERT INTO `cms_menus_privileges` VALUES ('8', '2', '1');
INSERT INTO `cms_menus_privileges` VALUES ('11', '3', '2');
INSERT INTO `cms_menus_privileges` VALUES ('12', '3', '1');
INSERT INTO `cms_menus_privileges` VALUES ('15', '4', '2');
INSERT INTO `cms_menus_privileges` VALUES ('16', '4', '1');
INSERT INTO `cms_menus_privileges` VALUES ('18', '5', '2');
INSERT INTO `cms_menus_privileges` VALUES ('19', '5', '1');
INSERT INTO `cms_menus_privileges` VALUES ('21', '6', '2');
INSERT INTO `cms_menus_privileges` VALUES ('22', '6', '1');
INSERT INTO `cms_menus_privileges` VALUES ('25', '7', '2');
INSERT INTO `cms_menus_privileges` VALUES ('26', '7', '1');
INSERT INTO `cms_menus_privileges` VALUES ('28', '8', '2');
INSERT INTO `cms_menus_privileges` VALUES ('29', '8', '1');
INSERT INTO `cms_menus_privileges` VALUES ('30', '9', '1');
INSERT INTO `cms_menus_privileges` VALUES ('32', null, '2');
INSERT INTO `cms_menus_privileges` VALUES ('33', null, '1');
INSERT INTO `cms_menus_privileges` VALUES ('37', '10', '2');
INSERT INTO `cms_menus_privileges` VALUES ('38', '10', '1');
INSERT INTO `cms_menus_privileges` VALUES ('39', '12', '2');
INSERT INTO `cms_menus_privileges` VALUES ('40', '12', '1');
INSERT INTO `cms_menus_privileges` VALUES ('42', '13', '2');
INSERT INTO `cms_menus_privileges` VALUES ('43', '13', '1');
INSERT INTO `cms_menus_privileges` VALUES ('45', '14', '2');
INSERT INTO `cms_menus_privileges` VALUES ('46', '14', '1');
INSERT INTO `cms_menus_privileges` VALUES ('47', '15', '1');
INSERT INTO `cms_menus_privileges` VALUES ('49', '16', '2');
INSERT INTO `cms_menus_privileges` VALUES ('50', '16', '1');
INSERT INTO `cms_menus_privileges` VALUES ('52', '17', '2');
INSERT INTO `cms_menus_privileges` VALUES ('53', '17', '1');
INSERT INTO `cms_menus_privileges` VALUES ('55', '18', '2');
INSERT INTO `cms_menus_privileges` VALUES ('56', '18', '1');
INSERT INTO `cms_menus_privileges` VALUES ('58', '19', '2');
INSERT INTO `cms_menus_privileges` VALUES ('59', '19', '1');
INSERT INTO `cms_menus_privileges` VALUES ('61', '20', '2');
INSERT INTO `cms_menus_privileges` VALUES ('62', '20', '1');
INSERT INTO `cms_menus_privileges` VALUES ('64', '21', '2');
INSERT INTO `cms_menus_privileges` VALUES ('65', '21', '1');
INSERT INTO `cms_menus_privileges` VALUES ('67', '22', '2');
INSERT INTO `cms_menus_privileges` VALUES ('68', '22', '1');
INSERT INTO `cms_menus_privileges` VALUES ('70', '23', '2');
INSERT INTO `cms_menus_privileges` VALUES ('71', '23', '1');
INSERT INTO `cms_menus_privileges` VALUES ('73', '24', '2');
INSERT INTO `cms_menus_privileges` VALUES ('74', '24', '1');
INSERT INTO `cms_menus_privileges` VALUES ('76', '25', '2');
INSERT INTO `cms_menus_privileges` VALUES ('77', '25', '1');
INSERT INTO `cms_menus_privileges` VALUES ('79', '11', '2');
INSERT INTO `cms_menus_privileges` VALUES ('80', '11', '1');
INSERT INTO `cms_menus_privileges` VALUES ('81', '26', '2');
INSERT INTO `cms_menus_privileges` VALUES ('82', '26', '1');
INSERT INTO `cms_menus_privileges` VALUES ('83', '27', '2');
INSERT INTO `cms_menus_privileges` VALUES ('84', '27', '1');
INSERT INTO `cms_menus_privileges` VALUES ('97', '33', '1');
INSERT INTO `cms_menus_privileges` VALUES ('98', '28', '2');
INSERT INTO `cms_menus_privileges` VALUES ('99', '28', '1');
INSERT INTO `cms_menus_privileges` VALUES ('104', '29', '2');
INSERT INTO `cms_menus_privileges` VALUES ('105', '29', '1');
INSERT INTO `cms_menus_privileges` VALUES ('112', '30', '2');
INSERT INTO `cms_menus_privileges` VALUES ('113', '30', '1');
INSERT INTO `cms_menus_privileges` VALUES ('114', '31', '2');
INSERT INTO `cms_menus_privileges` VALUES ('115', '31', '1');
INSERT INTO `cms_menus_privileges` VALUES ('118', '32', '2');
INSERT INTO `cms_menus_privileges` VALUES ('119', '32', '1');
INSERT INTO `cms_menus_privileges` VALUES ('123', '34', '2');
INSERT INTO `cms_menus_privileges` VALUES ('124', '34', '1');

-- ----------------------------
-- Table structure for `cms_moduls`
-- ----------------------------
DROP TABLE IF EXISTS `cms_moduls`;
CREATE TABLE `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_moduls
-- ----------------------------
INSERT INTO `cms_moduls` VALUES ('1', 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('2', 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('3', 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('4', 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', '0', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('5', 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('6', 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('7', 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('8', 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('9', 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('10', 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('11', 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', '1', '1', '2022-05-18 03:24:11', null, null);
INSERT INTO `cms_moduls` VALUES ('12', 'Akun Bank', 'fa fa-money', 'account_banks', 'account_banks', 'AdminAccountBanksController', '0', '0', '2022-05-23 05:30:55', null, null);
INSERT INTO `cms_moduls` VALUES ('13', 'Tipe Pembayaran', 'fa fa-gear', 'payment_types', 'payment_types', 'AdminPaymentTypesController', '0', '0', '2022-05-23 05:36:26', null, null);
INSERT INTO `cms_moduls` VALUES ('14', 'Vendor', 'fa fa-users', 'vendors', 'vendors', 'AdminVendorsController', '0', '0', '2022-05-23 05:42:13', null, null);
INSERT INTO `cms_moduls` VALUES ('15', 'Customer', 'fa fa-heart', 'customers', 'customers', 'AdminCustomersController', '0', '0', '2022-05-23 05:45:39', null, null);
INSERT INTO `cms_moduls` VALUES ('16', 'Kategori Produk', 'fa fa-envelope-o', 'product_categories', 'product_categories', 'AdminProductCategoriesController', '0', '0', '2022-05-23 05:50:01', null, null);
INSERT INTO `cms_moduls` VALUES ('17', 'Ekspedisi', 'fa fa-truck', 'expeditions', 'expeditions', 'AdminExpeditionsController', '0', '0', '2022-05-28 12:23:37', null, null);
INSERT INTO `cms_moduls` VALUES ('18', 'Brand', 'fa fa-star', 'product_brands', 'product_brands', 'AdminProductBrandsController', '0', '0', '2022-05-28 12:34:44', null, null);
INSERT INTO `cms_moduls` VALUES ('19', 'Produk', 'fa fa-barcode', 'products', 'products', 'AdminProductsController', '0', '0', '2022-05-28 12:57:28', null, null);
INSERT INTO `cms_moduls` VALUES ('20', 'Detail Pembelian', 'fa fa-th-list', 'purchase_order_details', 'purchase_order_details', 'AdminPurchaseOrderDetailsController', '0', '0', '2022-05-28 13:28:32', null, null);
INSERT INTO `cms_moduls` VALUES ('21', 'Photo Produk', 'fa fa-image', 'product_photos', 'product_photos', 'AdminProductPhotosController', '0', '0', '2022-05-28 13:46:33', null, null);
INSERT INTO `cms_moduls` VALUES ('22', 'Pesanan', 'fa fa-th', 'purchase_orders', 'purchase_orders', 'AdminPurchaseOrdersController', '0', '0', '2022-05-28 13:57:54', null, null);
INSERT INTO `cms_moduls` VALUES ('23', 'Detail Penerimaan', 'fa fa-arrow-right', 'goods_receipt_details', 'goods_receipt_details', 'AdminGoodsReceiptDetailsController', '0', '0', '2022-05-29 01:42:40', null, null);
INSERT INTO `cms_moduls` VALUES ('24', 'Penerimaan Barang', 'fa fa-arrow-right', 'goods_receipt', 'goods_receipt', 'AdminGoodsReceiptController', '0', '0', '2022-05-29 01:45:17', null, null);
INSERT INTO `cms_moduls` VALUES ('25', 'Item List', 'fa fa-th-list', 'products25', 'products', 'AdminProducts25Controller', '0', '0', '2022-06-06 02:14:32', null, null);
INSERT INTO `cms_moduls` VALUES ('26', 'Product Item', 'fa fa-barcode', 'product_items', 'product_items', 'AdminProductItemsController', '0', '0', '2022-06-06 02:24:43', null, null);
INSERT INTO `cms_moduls` VALUES ('27', 'Penjualan', 'fa fa-th', 'sales_orders', 'sales_orders', 'AdminSalesOrdersController', '0', '0', '2022-06-06 03:37:54', null, null);
INSERT INTO `cms_moduls` VALUES ('28', 'Kelompok Akun', 'fa fa-list-alt', 'coa_class', 'coa_class', 'AdminCoaClassController', '0', '0', '2022-06-11 04:54:41', null, null);
INSERT INTO `cms_moduls` VALUES ('29', 'Tipe Akun', 'fa fa-list-ul', 'coa_type', 'coa_type', 'AdminCoaTypeController', '0', '0', '2022-06-11 05:01:37', null, null);
INSERT INTO `cms_moduls` VALUES ('30', 'Akun', 'fa fa-th-list', 'chart_of_accounts', 'chart_of_accounts', 'AdminChartOfAccountsController', '0', '0', '2022-06-11 05:18:03', null, null);
INSERT INTO `cms_moduls` VALUES ('31', 'Alasan Opname', 'fa fa-th-list', 'stok_opname_type', 'stok_opname_type', 'AdminStokOpnameTypeController', '0', '0', '2022-06-11 11:49:01', null, null);
INSERT INTO `cms_moduls` VALUES ('32', 'Stok Opname', 'fa fa-check', 'stock_opnames', 'stock_opnames', 'AdminStockOpnamesController', '0', '0', '2022-06-11 12:00:02', null, null);
INSERT INTO `cms_moduls` VALUES ('33', 'Jenis Transaksi Jurnal', 'fa fa-list-ol', 'transaction_types', 'transaction_types', 'AdminTransactionTypesController', '0', '0', '2022-06-11 14:37:25', null, null);
INSERT INTO `cms_moduls` VALUES ('34', 'Transaksi Jurnal', 'fa fa-money', 'journal_transactions', 'journal_transactions', 'AdminJournalTransactionsController', '0', '0', '2022-06-11 14:43:23', null, null);
INSERT INTO `cms_moduls` VALUES ('35', 'Tabel Neraca Laba Rugi', 'fa fa-gear', 'table_neraca', 'table_neraca', 'AdminTableNeracaController', '0', '0', '2022-06-12 12:54:10', null, null);
INSERT INTO `cms_moduls` VALUES ('36', 'Buku Besar', 'fa fa-book', 'journal_transactions36', 'journal_transactions', 'AdminJournalTransactions36Controller', '0', '0', '2022-06-19 23:24:52', null, null);
INSERT INTO `cms_moduls` VALUES ('37', 'Buku Besar', 'fa fa-book', 'journal_details', 'journal_details', 'AdminJournalDetailsController', '0', '0', '2022-06-26 20:48:28', null, null);

-- ----------------------------
-- Table structure for `cms_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `cms_notifications`;
CREATE TABLE `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `cms_privileges`;
CREATE TABLE `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_privileges
-- ----------------------------
INSERT INTO `cms_privileges` VALUES ('1', 'Super Administrator', '1', 'skin-red', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges` VALUES ('2', 'admin', '0', 'skin-blue-light', null, null);

-- ----------------------------
-- Table structure for `cms_privileges_roles`
-- ----------------------------
DROP TABLE IF EXISTS `cms_privileges_roles`;
CREATE TABLE `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_privileges_roles
-- ----------------------------
INSERT INTO `cms_privileges_roles` VALUES ('1', '1', '0', '0', '0', '0', '1', '1', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('2', '1', '1', '1', '1', '1', '1', '2', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('3', '0', '1', '1', '1', '1', '1', '3', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('4', '1', '1', '1', '1', '1', '1', '4', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('5', '1', '1', '1', '1', '1', '1', '5', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('6', '1', '1', '1', '1', '1', '1', '6', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('7', '1', '1', '1', '1', '1', '1', '7', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('8', '1', '1', '1', '1', '1', '1', '8', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('9', '1', '1', '1', '1', '1', '1', '9', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('10', '1', '1', '1', '1', '1', '1', '10', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('11', '1', '0', '1', '0', '1', '1', '11', '2022-05-18 03:24:11', null);
INSERT INTO `cms_privileges_roles` VALUES ('12', '1', '1', '1', '1', '1', '2', '4', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('13', '1', '1', '1', '1', '1', '1', '12', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('14', '1', '1', '1', '1', '1', '1', '13', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('15', '1', '1', '1', '1', '1', '1', '14', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('16', '1', '1', '1', '1', '1', '1', '15', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('17', '1', '1', '1', '1', '1', '1', '16', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('18', '1', '1', '1', '1', '1', '1', '17', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('19', '1', '1', '1', '1', '1', '1', '18', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('20', '1', '1', '1', '1', '1', '1', '19', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('21', '1', '1', '1', '1', '1', '1', '20', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('22', '1', '1', '1', '1', '1', '1', '21', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('23', '1', '1', '1', '1', '1', '1', '22', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('24', '1', '1', '1', '1', '1', '1', '23', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('25', '1', '1', '1', '1', '1', '1', '24', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('26', '1', '1', '1', '1', '1', '1', '25', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('27', '1', '1', '1', '1', '1', '1', '26', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('28', '1', '1', '1', '1', '1', '1', '27', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('29', '1', '1', '1', '1', '1', '1', '28', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('30', '1', '1', '1', '1', '1', '1', '29', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('31', '1', '1', '1', '1', '1', '1', '30', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('32', '1', '1', '1', '1', '1', '1', '31', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('33', '1', '1', '1', '1', '1', '1', '32', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('34', '1', '1', '1', '1', '1', '1', '33', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('35', '1', '1', '1', '1', '1', '1', '34', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('36', '1', '1', '1', '1', '1', '1', '35', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('37', '1', '1', '1', '1', '1', '1', '36', null, null);
INSERT INTO `cms_privileges_roles` VALUES ('38', '1', '1', '1', '1', '1', '1', '37', null, null);

-- ----------------------------
-- Table structure for `cms_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_settings
-- ----------------------------
INSERT INTO `cms_settings` VALUES ('1', 'login_background_color', 'ffffff', 'text', null, 'Input hexacode', '2022-05-18 03:24:11', null, 'Login Register Style', 'Login Background Color');
INSERT INTO `cms_settings` VALUES ('2', 'login_font_color', null, 'text', null, 'Input hexacode', '2022-05-18 03:24:11', null, 'Login Register Style', 'Login Font Color');
INSERT INTO `cms_settings` VALUES ('3', 'login_background_image', null, 'upload_image', null, null, '2022-05-18 03:24:11', null, 'Login Register Style', 'Login Background Image');
INSERT INTO `cms_settings` VALUES ('4', 'email_sender', 'support@crudbooster.com', 'text', null, null, '2022-05-18 03:24:11', null, 'Email Setting', 'Email Sender');
INSERT INTO `cms_settings` VALUES ('5', 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', null, '2022-05-18 03:24:11', null, 'Email Setting', 'Mail Driver');
INSERT INTO `cms_settings` VALUES ('6', 'smtp_host', '', 'text', null, null, '2022-05-18 03:24:11', null, 'Email Setting', 'SMTP Host');
INSERT INTO `cms_settings` VALUES ('7', 'smtp_port', '25', 'text', null, 'default 25', '2022-05-18 03:24:11', null, 'Email Setting', 'SMTP Port');
INSERT INTO `cms_settings` VALUES ('8', 'smtp_username', '', 'text', null, null, '2022-05-18 03:24:11', null, 'Email Setting', 'SMTP Username');
INSERT INTO `cms_settings` VALUES ('9', 'smtp_password', '', 'text', null, null, '2022-05-18 03:24:11', null, 'Email Setting', 'SMTP Password');
INSERT INTO `cms_settings` VALUES ('10', 'appname', 'VL Online', 'text', null, null, '2022-05-18 03:24:11', null, 'Application Setting', 'Application Name');
INSERT INTO `cms_settings` VALUES ('11', 'default_paper_size', 'Legal', 'text', null, 'Paper size, ex : A4, Legal, etc', '2022-05-18 03:24:11', null, 'Application Setting', 'Default Paper Print Size');
INSERT INTO `cms_settings` VALUES ('12', 'logo', 'uploads/2022-05/4de9c388a82df6a27564ac8fa41fa841.png', 'upload_image', null, null, '2022-05-18 03:24:11', null, 'Application Setting', 'Logo');
INSERT INTO `cms_settings` VALUES ('13', 'favicon', null, 'upload_image', null, null, '2022-05-18 03:24:11', null, 'Application Setting', 'Favicon');
INSERT INTO `cms_settings` VALUES ('14', 'api_debug_mode', 'true', 'select', 'true,false', null, '2022-05-18 03:24:11', null, 'Application Setting', 'API Debug Mode');
INSERT INTO `cms_settings` VALUES ('15', 'google_api_key', null, 'text', null, null, '2022-05-18 03:24:11', null, 'Application Setting', 'Google API Key');
INSERT INTO `cms_settings` VALUES ('16', 'google_fcm_key', null, 'text', null, null, '2022-05-18 03:24:11', null, 'Application Setting', 'Google FCM Key');

-- ----------------------------
-- Table structure for `cms_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `cms_statistics`;
CREATE TABLE `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_statistic_components`
-- ----------------------------
DROP TABLE IF EXISTS `cms_statistic_components`;
CREATE TABLE `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_statistic_components
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_users`
-- ----------------------------
DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_users
-- ----------------------------
INSERT INTO `cms_users` VALUES ('1', 'Super Admin', null, 'admin@crudbooster.com', '$2y$10$5Z/P177h9JK1.NB0Q1Z74uj5ILh2BuTxjNt.BmnEU4nP3Pch00Efa', '1', '2022-05-18 03:24:11', null, 'Active');
INSERT INTO `cms_users` VALUES ('2', 'Admin', 'uploads/1/2022-05/img_146257.png', 'admin@vl.com', '$2y$10$.mF8ig1e0WrBb48K8RB8uuTzRPF0MgW7L3D/xEJtgiixOG5y/x.Wa', '2', '2022-05-23 06:04:57', null, null);

-- ----------------------------
-- Table structure for `coa_class`
-- ----------------------------
DROP TABLE IF EXISTS `coa_class`;
CREATE TABLE `coa_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coa_class
-- ----------------------------
INSERT INTO `coa_class` VALUES ('1', 'Asset', null, '2022-06-11 04:59:06', null);
INSERT INTO `coa_class` VALUES ('2', 'Liability', null, '2022-06-11 04:59:11', null);
INSERT INTO `coa_class` VALUES ('3', 'Equity', null, '2022-06-11 04:59:18', null);
INSERT INTO `coa_class` VALUES ('4', 'Income', null, '2022-06-11 04:59:25', null);
INSERT INTO `coa_class` VALUES ('5', 'Cost of Goods Sold', null, '2022-06-11 04:59:39', null);
INSERT INTO `coa_class` VALUES ('6', 'Expense', null, '2022-06-11 04:59:47', null);

-- ----------------------------
-- Table structure for `coa_type`
-- ----------------------------
DROP TABLE IF EXISTS `coa_type`;
CREATE TABLE `coa_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coa_class_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coa_type
-- ----------------------------
INSERT INTO `coa_type` VALUES ('1', '1', 'Cash/Bank', null, '2022-06-11 05:05:52', null);
INSERT INTO `coa_type` VALUES ('2', '1', 'Account Receivable', null, '2022-06-11 05:06:07', null);
INSERT INTO `coa_type` VALUES ('3', '1', 'Inventory', null, '2022-06-11 05:06:17', null);
INSERT INTO `coa_type` VALUES ('4', '1', 'Other Current Asset', null, '2022-06-11 05:06:27', null);
INSERT INTO `coa_type` VALUES ('5', '2', 'Other Current Liability', null, '2022-06-11 05:06:41', null);
INSERT INTO `coa_type` VALUES ('6', '2', 'Account Payables', null, '2022-06-11 05:06:54', null);
INSERT INTO `coa_type` VALUES ('7', '3', 'Equity', null, '2022-06-11 05:07:12', null);
INSERT INTO `coa_type` VALUES ('8', '4', 'Income', null, '2022-06-11 05:07:29', null);
INSERT INTO `coa_type` VALUES ('9', '5', 'Cost of Goods Sold', null, '2022-06-11 05:08:14', null);
INSERT INTO `coa_type` VALUES ('10', '6', 'Expense', null, '2022-06-11 05:08:25', null);

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'RIC-1', 'Ricky', 'Jl Baru|Bandung|46321', '0999', 'facebook account', 'instagram account', '-', '1', '2022-06-06 03:44:14', null);

-- ----------------------------
-- Table structure for `expeditions`
-- ----------------------------
DROP TABLE IF EXISTS `expeditions`;
CREATE TABLE `expeditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of expeditions
-- ----------------------------
INSERT INTO `expeditions` VALUES ('1', 'JNE', '2022-05-28 12:25:03', null);
INSERT INTO `expeditions` VALUES ('2', 'TIKI', '2022-05-28 12:25:10', null);
INSERT INTO `expeditions` VALUES ('3', 'PAXEL', '2022-05-28 12:25:17', '2022-05-28 12:25:34');
INSERT INTO `expeditions` VALUES ('4', 'Sicepat', '2022-05-28 12:25:23', null);

-- ----------------------------
-- Table structure for `goods_receipt`
-- ----------------------------
DROP TABLE IF EXISTS `goods_receipt`;
CREATE TABLE `goods_receipt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `purchase_order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po_vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_receipt_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_receipt
-- ----------------------------
INSERT INTO `goods_receipt` VALUES ('1', 'GR-TAR-722060001', '6', '31', null, '2022-06-01', null, '1', '2022-06-26 22:27:33', null);
INSERT INTO `goods_receipt` VALUES ('2', 'GR-ABC-122060002', '6', '31', null, '2022-06-09', 'test', '1', '2022-06-26 22:28:29', null);
INSERT INTO `goods_receipt` VALUES ('3', 'GR-TAR-722060003', '6', '31', null, '2022-06-18', 'test', '1', '2022-06-26 22:29:03', null);
INSERT INTO `goods_receipt` VALUES ('4', 'GR-ABC-122060004', '6', '31', null, '2022-06-08', 'test', '1', '2022-06-26 22:29:45', null);
INSERT INTO `goods_receipt` VALUES ('5', 'GR-ABC-122060005', '6', '31', null, '2022-06-15', 'test', '1', '2022-06-26 22:31:10', null);
INSERT INTO `goods_receipt` VALUES ('6', 'GR-ABC-122060006', '6', '31', null, '2022-06-17', 'ok', '1', '2022-06-28 13:23:28', null);

-- ----------------------------
-- Table structure for `goods_receipt_details`
-- ----------------------------
DROP TABLE IF EXISTS `goods_receipt_details`;
CREATE TABLE `goods_receipt_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_in` int(11) NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `is_store_vendor_location` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_receipt_details_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_receipt_details
-- ----------------------------
INSERT INTO `goods_receipt_details` VALUES ('1', '1', '2', 'ABC-1-20220601', '20', '200000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('2', '2', '2', 'ABC-1-20220609', '20', '200000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('3', '3', '2', 'ABC-1-20220618', '20', '200000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('4', '4', '2', 'ABC-1-20220608', '20', '200000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('5', '5', '2', 'ABC-1-20220615', '20', '200000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('6', '6', '2', 'ABC-1-20220617', '20', '200000.00', '0', null, null, null);

-- ----------------------------
-- Table structure for `journal_details`
-- ----------------------------
DROP TABLE IF EXISTS `journal_details`;
CREATE TABLE `journal_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `debit` int(11) NOT NULL DEFAULT '0',
  `credit` int(11) NOT NULL DEFAULT '0',
  `is_manual` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of journal_details
-- ----------------------------
INSERT INTO `journal_details` VALUES ('68', '73', '5', '25000', '0', '0', '2022-06-27 23:28:27', null);
INSERT INTO `journal_details` VALUES ('69', '73', '15', '0', '25000', '0', '2022-06-27 23:28:27', null);
INSERT INTO `journal_details` VALUES ('70', '74', '15', '25000', '0', '0', '2022-06-27 23:33:05', null);
INSERT INTO `journal_details` VALUES ('71', '74', '10', '0', '20000', '0', '2022-06-27 23:33:05', null);
INSERT INTO `journal_details` VALUES ('72', '74', '24', '20000', '0', '0', '2022-06-27 23:33:05', null);
INSERT INTO `journal_details` VALUES ('73', '74', '20', '0', '20000', '0', '2022-06-27 23:33:05', null);
INSERT INTO `journal_details` VALUES ('74', '74', '21', '0', '5000', '0', '2022-06-27 23:33:05', null);
INSERT INTO `journal_details` VALUES ('75', '75', '15', '25000', '0', '0', '2022-06-27 23:36:22', null);
INSERT INTO `journal_details` VALUES ('76', '75', '10', '0', '20000', '0', '2022-06-27 23:36:22', null);
INSERT INTO `journal_details` VALUES ('77', '75', '24', '20000', '0', '0', '2022-06-27 23:36:22', null);
INSERT INTO `journal_details` VALUES ('78', '75', '20', '0', '20000', '0', '2022-06-27 23:36:22', null);
INSERT INTO `journal_details` VALUES ('79', '75', '21', '0', '5000', '0', '2022-06-27 23:36:22', null);
INSERT INTO `journal_details` VALUES ('80', '76', '5', '20000', '0', '0', '2022-06-27 23:37:53', null);
INSERT INTO `journal_details` VALUES ('81', '76', '15', '0', '20000', '0', '2022-06-27 23:37:53', null);
INSERT INTO `journal_details` VALUES ('82', '77', '15', '20000', '0', '0', '2022-06-28 13:11:02', null);
INSERT INTO `journal_details` VALUES ('83', '77', '10', '0', '20000', '0', '2022-06-28 13:11:02', null);
INSERT INTO `journal_details` VALUES ('84', '77', '24', '20000', '0', '0', '2022-06-28 13:11:02', null);
INSERT INTO `journal_details` VALUES ('85', '77', '20', '0', '20000', '0', '2022-06-28 13:11:02', null);
INSERT INTO `journal_details` VALUES ('86', '77', '21', '0', '0', '0', '2022-06-28 13:11:02', null);
INSERT INTO `journal_details` VALUES ('87', '78', '5', '55000', '0', '0', '2022-06-28 13:13:04', null);
INSERT INTO `journal_details` VALUES ('88', '78', '15', '0', '55000', '0', '2022-06-28 13:13:04', null);
INSERT INTO `journal_details` VALUES ('89', '79', '15', '55000', '0', '0', '2022-06-28 13:14:03', null);
INSERT INTO `journal_details` VALUES ('90', '79', '10', '0', '50000', '0', '2022-06-28 13:14:03', null);
INSERT INTO `journal_details` VALUES ('91', '79', '24', '50000', '0', '0', '2022-06-28 13:14:03', null);
INSERT INTO `journal_details` VALUES ('92', '79', '20', '0', '50000', '0', '2022-06-28 13:14:03', null);
INSERT INTO `journal_details` VALUES ('93', '79', '21', '0', '5000', '0', '2022-06-28 13:14:03', null);
INSERT INTO `journal_details` VALUES ('94', '80', '10', '2000000', '0', '0', '2022-06-28 13:23:28', null);
INSERT INTO `journal_details` VALUES ('95', '80', '12', '0', '2000000', '0', '2022-06-28 13:23:28', null);
INSERT INTO `journal_details` VALUES ('96', '81', '12', '25000', '0', '0', '2022-06-28 13:42:37', null);
INSERT INTO `journal_details` VALUES ('97', '81', '5', '0', '25000', '0', '2022-06-28 13:42:37', null);
INSERT INTO `journal_details` VALUES ('98', '82', '5', '20000', '0', '0', '2022-06-28 14:03:45', null);
INSERT INTO `journal_details` VALUES ('99', '82', '15', '0', '20000', '0', '2022-06-28 14:03:45', null);
INSERT INTO `journal_details` VALUES ('100', '83', '15', '20000', '0', '0', '2022-06-28 14:11:03', null);
INSERT INTO `journal_details` VALUES ('101', '83', '10', '0', '20000', '0', '2022-06-28 14:11:03', null);
INSERT INTO `journal_details` VALUES ('102', '83', '24', '20000', '0', '0', '2022-06-28 14:11:03', null);
INSERT INTO `journal_details` VALUES ('103', '83', '20', '0', '20000', '0', '2022-06-28 14:11:03', null);
INSERT INTO `journal_details` VALUES ('104', '83', '21', '0', '0', '0', '2022-06-28 14:11:03', null);
INSERT INTO `journal_details` VALUES ('105', '84', '15', '55000', '0', '0', '2022-06-28 14:15:18', null);
INSERT INTO `journal_details` VALUES ('106', '84', '10', '0', '50000', '0', '2022-06-28 14:15:18', null);
INSERT INTO `journal_details` VALUES ('107', '84', '24', '50000', '0', '0', '2022-06-28 14:15:18', null);
INSERT INTO `journal_details` VALUES ('108', '84', '20', '0', '50000', '0', '2022-06-28 14:15:18', null);
INSERT INTO `journal_details` VALUES ('109', '84', '21', '0', '5000', '0', '2022-06-28 14:15:18', null);
INSERT INTO `journal_details` VALUES ('110', '85', '15', '20000', '0', '0', '2022-06-28 14:27:29', null);
INSERT INTO `journal_details` VALUES ('111', '85', '10', '0', '20000', '0', '2022-06-28 14:27:29', null);
INSERT INTO `journal_details` VALUES ('112', '85', '24', '20000', '0', '0', '2022-06-28 14:27:29', null);
INSERT INTO `journal_details` VALUES ('113', '85', '20', '0', '20000', '0', '2022-06-28 14:27:29', null);
INSERT INTO `journal_details` VALUES ('114', '85', '21', '0', '0', '0', '2022-06-28 14:27:29', null);
INSERT INTO `journal_details` VALUES ('115', '86', '15', '25000', '0', '0', '2022-06-28 14:28:56', null);
INSERT INTO `journal_details` VALUES ('116', '86', '10', '0', '20000', '0', '2022-06-28 14:28:56', null);
INSERT INTO `journal_details` VALUES ('117', '86', '24', '20000', '0', '0', '2022-06-28 14:28:56', null);
INSERT INTO `journal_details` VALUES ('118', '86', '20', '0', '20000', '0', '2022-06-28 14:28:56', null);
INSERT INTO `journal_details` VALUES ('119', '86', '21', '0', '5000', '0', '2022-06-28 14:28:56', null);
INSERT INTO `journal_details` VALUES ('120', '87', '4', '0', '9000', '0', null, null);
INSERT INTO `journal_details` VALUES ('121', '87', '11', '9000', '0', '0', null, null);
INSERT INTO `journal_details` VALUES ('122', '88', '15', '55000', '0', '0', '2022-06-28 22:18:12', null);
INSERT INTO `journal_details` VALUES ('123', '88', '10', '0', '50000', '0', '2022-06-28 22:18:12', null);
INSERT INTO `journal_details` VALUES ('124', '88', '24', '50000', '0', '0', '2022-06-28 22:18:12', null);
INSERT INTO `journal_details` VALUES ('125', '88', '20', '0', '50000', '0', '2022-06-28 22:18:12', null);
INSERT INTO `journal_details` VALUES ('126', '88', '21', '0', '5000', '0', '2022-06-28 22:18:12', null);
INSERT INTO `journal_details` VALUES ('127', '89', '15', '20000', '0', '0', '2022-06-28 22:20:04', null);
INSERT INTO `journal_details` VALUES ('128', '89', '10', '0', '20000', '0', '2022-06-28 22:20:04', null);
INSERT INTO `journal_details` VALUES ('129', '89', '24', '20000', '0', '0', '2022-06-28 22:20:04', null);
INSERT INTO `journal_details` VALUES ('130', '89', '20', '0', '20000', '0', '2022-06-28 22:20:04', null);
INSERT INTO `journal_details` VALUES ('131', '89', '21', '0', '0', '0', '2022-06-28 22:20:04', null);
INSERT INTO `journal_details` VALUES ('132', '90', '15', '20000', '0', '0', '2022-06-28 22:26:03', null);
INSERT INTO `journal_details` VALUES ('133', '90', '10', '0', '20000', '0', '2022-06-28 22:26:03', null);
INSERT INTO `journal_details` VALUES ('134', '90', '24', '20000', '0', '0', '2022-06-28 22:26:03', null);
INSERT INTO `journal_details` VALUES ('135', '90', '20', '0', '20000', '0', '2022-06-28 22:26:03', null);
INSERT INTO `journal_details` VALUES ('136', '90', '21', '0', '0', '0', '2022-06-28 22:26:03', null);
INSERT INTO `journal_details` VALUES ('137', '91', '15', '25000', '0', '0', '2022-06-28 22:26:16', null);
INSERT INTO `journal_details` VALUES ('138', '91', '10', '0', '20000', '0', '2022-06-28 22:26:16', null);
INSERT INTO `journal_details` VALUES ('139', '91', '24', '20000', '0', '0', '2022-06-28 22:26:16', null);
INSERT INTO `journal_details` VALUES ('140', '91', '20', '0', '20000', '0', '2022-06-28 22:26:16', null);
INSERT INTO `journal_details` VALUES ('141', '91', '21', '0', '5000', '0', '2022-06-28 22:26:16', null);
INSERT INTO `journal_details` VALUES ('142', '92', '15', '20000', '0', '0', '2022-06-28 22:28:11', null);
INSERT INTO `journal_details` VALUES ('143', '92', '10', '0', '20000', '0', '2022-06-28 22:28:11', null);
INSERT INTO `journal_details` VALUES ('144', '92', '24', '20000', '0', '0', '2022-06-28 22:28:11', null);
INSERT INTO `journal_details` VALUES ('145', '92', '20', '0', '20000', '0', '2022-06-28 22:28:11', null);
INSERT INTO `journal_details` VALUES ('146', '92', '21', '0', '0', '0', '2022-06-28 22:28:11', null);
INSERT INTO `journal_details` VALUES ('147', '93', '15', '55000', '0', '0', '2022-06-28 22:28:29', null);
INSERT INTO `journal_details` VALUES ('148', '93', '10', '0', '50000', '0', '2022-06-28 22:28:29', null);
INSERT INTO `journal_details` VALUES ('149', '93', '24', '50000', '0', '0', '2022-06-28 22:28:29', null);
INSERT INTO `journal_details` VALUES ('150', '93', '20', '0', '50000', '0', '2022-06-28 22:28:29', null);
INSERT INTO `journal_details` VALUES ('151', '93', '21', '0', '5000', '0', '2022-06-28 22:28:29', null);
INSERT INTO `journal_details` VALUES ('152', '94', '15', '20000', '0', '0', '2022-06-28 22:29:00', null);
INSERT INTO `journal_details` VALUES ('153', '94', '10', '0', '20000', '0', '2022-06-28 22:29:00', null);
INSERT INTO `journal_details` VALUES ('154', '94', '24', '20000', '0', '0', '2022-06-28 22:29:00', null);
INSERT INTO `journal_details` VALUES ('155', '94', '20', '0', '20000', '0', '2022-06-28 22:29:00', null);
INSERT INTO `journal_details` VALUES ('156', '94', '21', '0', '0', '0', '2022-06-28 22:29:00', null);
INSERT INTO `journal_details` VALUES ('157', '95', '15', '25000', '0', '0', '2022-06-28 23:05:54', null);
INSERT INTO `journal_details` VALUES ('158', '95', '10', '0', '20000', '0', '2022-06-28 23:05:54', null);
INSERT INTO `journal_details` VALUES ('159', '95', '24', '20000', '0', '0', '2022-06-28 23:05:54', null);
INSERT INTO `journal_details` VALUES ('160', '95', '20', '0', '20000', '0', '2022-06-28 23:05:54', null);
INSERT INTO `journal_details` VALUES ('161', '95', '21', '0', '5000', '0', '2022-06-28 23:05:54', null);
INSERT INTO `journal_details` VALUES ('162', '96', '15', '20000', '0', '0', '2022-06-28 23:10:55', null);
INSERT INTO `journal_details` VALUES ('163', '96', '10', '0', '20000', '0', '2022-06-28 23:10:55', null);
INSERT INTO `journal_details` VALUES ('164', '96', '24', '20000', '0', '0', '2022-06-28 23:10:55', null);
INSERT INTO `journal_details` VALUES ('165', '96', '20', '0', '20000', '0', '2022-06-28 23:10:55', null);
INSERT INTO `journal_details` VALUES ('166', '96', '21', '0', '0', '0', '2022-06-28 23:10:55', null);
INSERT INTO `journal_details` VALUES ('167', '97', '15', '55000', '0', '0', '2022-06-28 23:18:40', null);
INSERT INTO `journal_details` VALUES ('168', '97', '10', '0', '50000', '0', '2022-06-28 23:18:40', null);
INSERT INTO `journal_details` VALUES ('169', '97', '24', '50000', '0', '0', '2022-06-28 23:18:40', null);
INSERT INTO `journal_details` VALUES ('170', '97', '20', '0', '50000', '0', '2022-06-28 23:18:40', null);
INSERT INTO `journal_details` VALUES ('171', '97', '21', '0', '5000', '0', '2022-06-28 23:18:40', null);

-- ----------------------------
-- Table structure for `journal_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `journal_transactions`;
CREATE TABLE `journal_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `transaction_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_no` int(11) NOT NULL,
  `ref_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_debit` int(11) NOT NULL,
  `total_credit` int(11) DEFAULT NULL,
  `is_manual` tinyint(1) DEFAULT '0' COMMENT '0 Buku besar, 1 Journal Manual',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of journal_transactions
-- ----------------------------
INSERT INTO `journal_transactions` VALUES ('73', '2022-06-09', 'GL-2206-0001', '1', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('74', '2022-06-09', 'GL-2206-0074', '74', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('75', '2022-06-09', 'GL-2206-0075', '75', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('76', '2022-06-16', 'GL-2206-0076', '76', 'SO-RIC-122060015', '-', '20000', '20000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('77', '2022-06-16', 'GL-2206-0077', '77', 'SO-RIC-122060015', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('78', '2022-06-16', 'GL-2206-0078', '78', 'SO-RIC-122060016', '-', '55000', '55000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('79', '2022-06-16', 'GL-2206-0079', '79', 'SO-RIC-122060016', '-', '40000', '40000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('80', '2022-06-17', 'GL-2206-0080', '80', 'GR-ABC-122060006', '-', '2000000', '2000000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('81', '2022-06-09', 'GL-2206-0081', '81', 'PO-ABC-122060032', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('82', '2022-06-24', 'GL-2206-0082', '82', 'SO-RIC-122060017', '-', '20000', '20000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('83', '2022-06-24', 'GL-2206-0083', '83', 'SO-RIC-122060017', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('84', '2022-06-16', 'GL-2206-0084', '84', 'SO-RIC-122060016', '-', '40000', '40000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('85', '2022-06-16', 'GL-2206-0085', '85', 'SO-RIC-122060015', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('86', '2022-06-09', 'GL-2206-0086', '86', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('87', '2022-06-28', 'GL-2206-0087', '87', null, 'ok', '9000', '9000', '1', '1', '2022-06-28 14:31:13', null);
INSERT INTO `journal_transactions` VALUES ('88', '2022-06-16', 'GL-2206-0088', '88', 'SO-RIC-122060016', '-', '40000', '40000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('89', '2022-06-24', 'GL-2206-0089', '89', 'SO-RIC-122060017', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('90', '2022-06-16', 'GL-2206-0090', '90', 'SO-RIC-122060015', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('91', '2022-06-09', 'GL-2206-0091', '91', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('92', '2022-06-24', 'GL-2206-0092', '92', 'SO-RIC-122060017', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('93', '2022-06-16', 'GL-2206-0093', '93', 'SO-RIC-122060016', '-', '40000', '40000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('94', '2022-06-16', 'GL-2206-0094', '94', 'SO-RIC-122060015', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('95', '2022-06-09', 'GL-2206-0095', '95', 'SO-RIC-122060001', '-', '25000', '25000', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('96', '2022-06-24', 'GL-2206-0096', '96', 'SO-RIC-122060017', '-', '0', '0', '0', null, null, null);
INSERT INTO `journal_transactions` VALUES ('97', '2022-06-16', 'GL-2206-0097', '97', 'SO-RIC-122060016', '-', '40000', '40000', '0', null, null, null);

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2016_08_07_145904_add_table_cms_apicustom', '1');
INSERT INTO `migrations` VALUES ('2', '2016_08_07_150834_add_table_cms_dashboard', '1');
INSERT INTO `migrations` VALUES ('3', '2016_08_07_151210_add_table_cms_logs', '1');
INSERT INTO `migrations` VALUES ('4', '2016_08_07_151211_add_details_cms_logs', '1');
INSERT INTO `migrations` VALUES ('5', '2016_08_07_152014_add_table_cms_privileges', '1');
INSERT INTO `migrations` VALUES ('6', '2016_08_07_152214_add_table_cms_privileges_roles', '1');
INSERT INTO `migrations` VALUES ('7', '2016_08_07_152320_add_table_cms_settings', '1');
INSERT INTO `migrations` VALUES ('8', '2016_08_07_152421_add_table_cms_users', '1');
INSERT INTO `migrations` VALUES ('9', '2016_08_07_154624_add_table_cms_menus_privileges', '1');
INSERT INTO `migrations` VALUES ('10', '2016_08_07_154624_add_table_cms_moduls', '1');
INSERT INTO `migrations` VALUES ('11', '2016_08_17_225409_add_status_cms_users', '1');
INSERT INTO `migrations` VALUES ('12', '2016_08_20_125418_add_table_cms_notifications', '1');
INSERT INTO `migrations` VALUES ('13', '2016_09_04_033706_add_table_cms_email_queues', '1');
INSERT INTO `migrations` VALUES ('14', '2016_09_16_035347_add_group_setting', '1');
INSERT INTO `migrations` VALUES ('15', '2016_09_16_045425_add_label_setting', '1');
INSERT INTO `migrations` VALUES ('16', '2016_09_17_104728_create_nullable_cms_apicustom', '1');
INSERT INTO `migrations` VALUES ('17', '2016_10_01_141740_add_method_type_apicustom', '1');
INSERT INTO `migrations` VALUES ('18', '2016_10_01_141846_add_parameters_apicustom', '1');
INSERT INTO `migrations` VALUES ('19', '2016_10_01_141934_add_responses_apicustom', '1');
INSERT INTO `migrations` VALUES ('20', '2016_10_01_144826_add_table_apikey', '1');
INSERT INTO `migrations` VALUES ('21', '2016_11_14_141657_create_cms_menus', '1');
INSERT INTO `migrations` VALUES ('22', '2016_11_15_132350_create_cms_email_templates', '1');
INSERT INTO `migrations` VALUES ('23', '2016_11_15_190410_create_cms_statistics', '1');
INSERT INTO `migrations` VALUES ('24', '2016_11_17_102740_create_cms_statistic_components', '1');
INSERT INTO `migrations` VALUES ('25', '2017_06_06_164501_add_deleted_at_cms_moduls', '1');
INSERT INTO `migrations` VALUES ('26', '2022_05_23_052825_create_account_bank', '2');
INSERT INTO `migrations` VALUES ('27', '2022_05_23_053417_create_payment_types', '3');
INSERT INTO `migrations` VALUES ('34', '2022_05_28_122107_expeditions', '5');
INSERT INTO `migrations` VALUES ('44', '2022_05_28_131529_create_purchase_order_details', '9');
INSERT INTO `migrations` VALUES ('45', '2022_05_28_134246_create_product_photos', '9');
INSERT INTO `migrations` VALUES ('50', '2022_05_23_053933_create_vendors', '12');
INSERT INTO `migrations` VALUES ('51', '2022_05_23_054739_create_product_categories_table', '13');
INSERT INTO `migrations` VALUES ('52', '2022_05_28_123234_create_product_brands', '14');
INSERT INTO `migrations` VALUES ('53', '2022_05_23_054446_create_customer_table', '15');
INSERT INTO `migrations` VALUES ('54', '2022_05_28_131451_create_purchase_orders_table', '16');
INSERT INTO `migrations` VALUES ('58', '2022_05_29_012656_create_goods_receipt_table', '19');
INSERT INTO `migrations` VALUES ('60', '2022_05_29_013112_create_goods_receipt_details_table', '20');
INSERT INTO `migrations` VALUES ('66', '2022_05_23_060308_create_products_table', '21');
INSERT INTO `migrations` VALUES ('67', '2022_05_29_002556_item_products', '21');
INSERT INTO `migrations` VALUES ('68', '2022_05_30_011404_create_sales_orders_table', '21');
INSERT INTO `migrations` VALUES ('70', '2022_06_11_041452_create_coa_class_table', '22');
INSERT INTO `migrations` VALUES ('72', '2022_06_11_050041_create_coa_type_table', '23');
INSERT INTO `migrations` VALUES ('78', '2022_06_11_114244_create_stok_opnames_table', '25');
INSERT INTO `migrations` VALUES ('79', '2022_06_11_114416_create_stok_opname_type_table', '25');
INSERT INTO `migrations` VALUES ('85', '2022_06_11_122007_create_stock_opname_details_table', '26');
INSERT INTO `migrations` VALUES ('86', '2022_06_11_140323_create_journal_transactions', '27');
INSERT INTO `migrations` VALUES ('87', '2022_06_11_142729_create_transaction_types', '27');
INSERT INTO `migrations` VALUES ('88', '2022_06_11_050932_create_chart_of_accounts', '28');
INSERT INTO `migrations` VALUES ('89', '2022_06_12_124404_create_table_neraca', '28');
INSERT INTO `migrations` VALUES ('90', '2022_06_18_230510_create_journal_details', '29');

-- ----------------------------
-- Table structure for `payment_types`
-- ----------------------------
DROP TABLE IF EXISTS `payment_types`;
CREATE TABLE `payment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_types
-- ----------------------------
INSERT INTO `payment_types` VALUES ('1', 'Cash', '2022-05-23 05:37:19', null);
INSERT INTO `payment_types` VALUES ('2', 'Transfer', '2022-05-23 05:37:25', null);

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_track_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_cost` double(8,2) NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `qty_onhand` int(11) NOT NULL DEFAULT '0',
  `qty_allocated` int(11) NOT NULL DEFAULT '0',
  `qty_received` int(11) DEFAULT '0',
  `qty_shipped` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_code_index` (`code`),
  KEY `products_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'GLA-CHI-1', 'Glass Kacamata Non Lot', '0', '2', '1', '0.00', '0.00', '-26', '0', null, '0', 'TEst', '1', '2022-06-04 14:29:20', null);
INSERT INTO `products` VALUES ('2', 'GLA-CHI-2', 'Glass Kacamata Lot Number', '1', '2', '1', '0.00', '0.00', '-160', '0', null, '0', 'Test', '1', '2022-06-04 14:29:36', null);

-- ----------------------------
-- Table structure for `product_brands`
-- ----------------------------
DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE `product_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_brands_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_brands
-- ----------------------------
INSERT INTO `product_brands` VALUES ('1', 'CHI-1', 'CHIARA FERRAGNI', '1', '2022-05-29 01:10:02', null);
INSERT INTO `product_brands` VALUES ('2', 'VAL-2', 'VALENTINO', '1', '2022-05-29 01:10:07', null);

-- ----------------------------
-- Table structure for `product_categories`
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('2', 'GLA-2', 'GLASSES', '1', '2022-05-29 01:05:19', null);

-- ----------------------------
-- Table structure for `product_items`
-- ----------------------------
DROP TABLE IF EXISTS `product_items`;
CREATE TABLE `product_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receive_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_cost` double(10,2) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_items
-- ----------------------------
INSERT INTO `product_items` VALUES ('13', 'GR-ABC-122060021', '2022-06-30', '2', '6', '200000.00', '20000.00', '20', 'ABC-1-20220630', '-', null, null);

-- ----------------------------
-- Table structure for `product_photos`
-- ----------------------------
DROP TABLE IF EXISTS `product_photos`;
CREATE TABLE `product_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_photos
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_orders`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE `purchase_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount_due` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_orders_order_number_index` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_orders
-- ----------------------------
INSERT INTO `purchase_orders` VALUES ('31', '6', 'PO-ABC-122060001', '2022-06-16', '1', '4000000', '0', '4000000', '2000000', 'sdasfads', '1', '2022-06-26 20:55:19', null, '2000000');
INSERT INTO `purchase_orders` VALUES ('32', '6', 'PO-ABC-122060032', '2022-06-09', '1', '40000', '0', '40000', '25000', 'TEST ORDER', '1', '2022-06-28 13:42:37', null, '15000');

-- ----------------------------
-- Table structure for `purchase_order_details`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_details`;
CREATE TABLE `purchase_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `subtotal` int(11) NOT NULL DEFAULT '0',
  `downpayment` int(11) NOT NULL DEFAULT '0',
  `paid_off` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_details_purchase_order_id_index` (`purchase_order_id`),
  KEY `purchase_order_details_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_order_details
-- ----------------------------
INSERT INTO `purchase_order_details` VALUES ('4', '31', '20', '2', '200000', '4000000', '2000000', '0', '2000000', null, null, null);
INSERT INTO `purchase_order_details` VALUES ('5', '32', '5', '1', '4000', '20000', '20000', '0', '0', null, null, null);
INSERT INTO `purchase_order_details` VALUES ('6', '32', '2', '2', '10000', '20000', '5000', '0', '15000', null, null, null);

-- ----------------------------
-- Table structure for `sales_orders`
-- ----------------------------
DROP TABLE IF EXISTS `sales_orders`;
CREATE TABLE `sales_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `expedition_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) NOT NULL,
  `subtotal` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `expedition_cost` double(8,2) DEFAULT NULL,
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `total_amount` double(8,0) DEFAULT NULL,
  `amount_due` double(8,2) DEFAULT NULL,
  `customer_receive_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_order` tinyint(1) DEFAULT '0',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_receive_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_orders_order_number_index` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sales_orders
-- ----------------------------
INSERT INTO `sales_orders` VALUES ('14', '1', 'SO-RIC-122060001', '2022-06-09', '1', '1', '20000.00', '0.00', '5000.00', '25000.00', '25000', '0.00', null, 'sdasfads', '0', '', null, '1', '2022-06-27 23:28:27', null);
INSERT INTO `sales_orders` VALUES ('15', '1', 'SO-RIC-122060015', '2022-06-16', '3', '1', '20000.00', '0.00', '0.00', '20000.00', '0', '20000.00', '2022-06-30', 'teTST', '0', '', null, '1', '2022-06-27 23:37:53', null);
INSERT INTO `sales_orders` VALUES ('16', '1', 'SO-RIC-122060016', '2022-06-16', '3', '1', '50000.00', '0.00', '5000.00', '55000.00', '40000', '15000.00', null, 'Test Line', '1', 'ok', null, '1', '2022-06-28 13:13:04', null);
INSERT INTO `sales_orders` VALUES ('17', '1', 'SO-RIC-122060017', '2022-06-24', '4', '1', '20000.00', '0.00', '0.00', '20000.00', '0', '20000.00', null, '-', '1', 'belum bayar 2000 lagi', null, '1', '2022-06-28 14:03:45', null);

-- ----------------------------
-- Table structure for `sales_order_details`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_details`;
CREATE TABLE `sales_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `lot_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_details_purchase_order_id_index` (`sales_order_id`),
  KEY `purchase_order_details_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sales_order_details
-- ----------------------------
INSERT INTO `sales_order_details` VALUES ('14', '14', '20', '2', 'ABC-1-20220630', '1000.00', '20000.00', null, null, null);
INSERT INTO `sales_order_details` VALUES ('15', '15', '20', '2', 'ABC-1-20220630', '1000.00', '20000.00', null, null, null);
INSERT INTO `sales_order_details` VALUES ('16', '16', '50', '2', 'ABC-1-20220630', '1000.00', '50000.00', null, null, null);
INSERT INTO `sales_order_details` VALUES ('17', '17', '20', '2', 'ABC-1-20220630', '1000.00', '20000.00', null, null, null);

-- ----------------------------
-- Table structure for `stock_opnames`
-- ----------------------------
DROP TABLE IF EXISTS `stock_opnames`;
CREATE TABLE `stock_opnames` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opname_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opname_date` date NOT NULL,
  `opname_type_id` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_opnames_opname_number_index` (`opname_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stock_opnames
-- ----------------------------
INSERT INTO `stock_opnames` VALUES ('1', 'OP-22060001', '2022-06-09', '2', 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 12:35:45', null);
INSERT INTO `stock_opnames` VALUES ('2', 'OP-22060002', '2022-06-09', '1', 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 12:36:52', null);
INSERT INTO `stock_opnames` VALUES ('3', 'OP-22060003', '2022-06-07', '2', 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 12:38:06', null);
INSERT INTO `stock_opnames` VALUES ('4', 'OP-22060004', '2022-06-16', '1', 'uploads/1/2022-06/report_11_jun_2022.pdf', '1', '2022-06-11 12:39:01', null);

-- ----------------------------
-- Table structure for `stock_opname_details`
-- ----------------------------
DROP TABLE IF EXISTS `stock_opname_details`;
CREATE TABLE `stock_opname_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_opname_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adjust_qty` int(11) NOT NULL,
  `adjust_cost` int(11) NOT NULL,
  `adjust_price` int(11) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stock_opname_details
-- ----------------------------
INSERT INTO `stock_opname_details` VALUES ('1', '4', '2', '500', '200', '2', null, null, null);

-- ----------------------------
-- Table structure for `stock_opname_type`
-- ----------------------------
DROP TABLE IF EXISTS `stock_opname_type`;
CREATE TABLE `stock_opname_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stock_opname_type
-- ----------------------------
INSERT INTO `stock_opname_type` VALUES ('1', 'Penyesuaian Inventaris', null, '2022-06-11 11:57:38', null);
INSERT INTO `stock_opname_type` VALUES ('2', 'Penyesuaian dari Penerimaan', null, '2022-06-11 11:57:45', null);

-- ----------------------------
-- Table structure for `table_neraca`
-- ----------------------------
DROP TABLE IF EXISTS `table_neraca`;
CREATE TABLE `table_neraca` (
  `id` int(10) unsigned NOT NULL,
  `report_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `account_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `begining_balance` int(11) DEFAULT '0',
  `debit` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `ending_balance` int(11) DEFAULT '0',
  `column_position` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `padding_left` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of table_neraca
-- ----------------------------
INSERT INTO `table_neraca` VALUES ('1', 'N', '1', '0', 'ASSET', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-12 06:02:52', null);
INSERT INTO `table_neraca` VALUES ('2', 'N', '2', '1', 'Kas', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:03:13', null);
INSERT INTO `table_neraca` VALUES ('3', 'N', '3', '2', 'Kas Besar', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:03:37', null);
INSERT INTO `table_neraca` VALUES ('4', 'N', '4', '3', 'Kas Kecil', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:05:50', null);
INSERT INTO `table_neraca` VALUES ('5', 'N', '5', '0', 'Total Kas', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:06:33', null);
INSERT INTO `table_neraca` VALUES ('6', 'N', '6', '0', 'Bank', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:06:56', null);
INSERT INTO `table_neraca` VALUES ('7', 'N', '7', '0', 'BCA', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:08:47', '2022-06-12 06:08:55');
INSERT INTO `table_neraca` VALUES ('8', 'N', '8', '0', 'Total Bank', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:09:17', null);
INSERT INTO `table_neraca` VALUES ('9', 'N', '9', '6', 'Piutang', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:09:58', null);
INSERT INTO `table_neraca` VALUES ('10', 'N', '10', '7', 'Piutang Dagang', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:10:23', '2022-06-12 06:11:26');
INSERT INTO `table_neraca` VALUES ('11', 'N', '11', '0', 'Total Piutang', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:12:03', null);
INSERT INTO `table_neraca` VALUES ('12', 'N', '12', '9', 'Persediaan', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:14:27', null);
INSERT INTO `table_neraca` VALUES ('13', 'N', '13', '10', 'Persediaan Dagang', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:14:53', null);
INSERT INTO `table_neraca` VALUES ('14', 'N', '14', '0', 'Total Persediaan', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:15:20', null);
INSERT INTO `table_neraca` VALUES ('15', 'N', '15', '0', 'Asset Lain', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:15:42', null);
INSERT INTO `table_neraca` VALUES ('16', 'N', '16', '12', 'Uang Muka Pembelian', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-12 06:17:00', null);
INSERT INTO `table_neraca` VALUES ('17', 'N', '17', '0', 'Total Asset Lain', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-12 06:17:24', null);
INSERT INTO `table_neraca` VALUES ('18', 'N', '18', '0', 'TOTAL ASSET', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-12 06:17:43', null);
INSERT INTO `table_neraca` VALUES ('19', 'N', '19', '0', 'LIABILITY & EQUITY', '0', '0', '0', '0', 'RIGH', null, null, '2022-06-12 06:22:52', '2022-06-14 21:48:54');
INSERT INTO `table_neraca` VALUES ('20', 'N', '20', '0', 'LIABILITY', '0', '0', '0', '0', 'RIGH', '25px', null, '2022-06-14 21:50:10', '2022-06-14 21:50:42');
INSERT INTO `table_neraca` VALUES ('21', 'N', '21', '0', 'Total LIABILITY', '0', '0', '0', '0', 'RIGH', '25px', null, '2022-06-14 21:52:26', null);
INSERT INTO `table_neraca` VALUES ('22', 'N', '22', '0', 'EQUITY', '0', '0', '0', '0', 'RIGH', '25px', null, '2022-06-14 21:52:47', null);
INSERT INTO `table_neraca` VALUES ('23', 'N', '23', '0', 'Modal', '0', '0', '0', '0', 'RIGH', '40px', null, '2022-06-14 21:55:17', null);
INSERT INTO `table_neraca` VALUES ('24', 'N', '24', '0', 'Modal Awal', '0', '0', '0', '0', 'RIGH', '60px', null, '2022-06-14 21:55:44', null);
INSERT INTO `table_neraca` VALUES ('25', 'N', '25', '0', 'Total Modal', '0', '0', '0', '0', 'RIGH', '40px', null, '2022-06-14 21:56:07', null);
INSERT INTO `table_neraca` VALUES ('26', 'N', '26', '0', 'Current Year Earnings', '0', '0', '0', '0', 'RIGH', '40px', null, '2022-06-14 21:56:32', null);
INSERT INTO `table_neraca` VALUES ('27', 'N', '27', '0', 'Kas Kecil', '0', '0', '0', '0', 'RIGH', '40px', null, '2022-06-14 21:56:58', null);
INSERT INTO `table_neraca` VALUES ('28', 'N', '28', '0', 'Total EQUITY', '0', '0', '0', '0', 'RIGH', '25px', null, '2022-06-14 21:57:28', null);
INSERT INTO `table_neraca` VALUES ('29', 'N', '29', '0', 'Total LIABILITY & EQUITY', '0', '0', '0', '0', 'RIGH', null, null, '2022-06-14 21:57:51', null);
INSERT INTO `table_neraca` VALUES ('30', 'L', '1', '0', 'Income', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:26:42', null);
INSERT INTO `table_neraca` VALUES ('31', 'L', '2', '0', 'Pendapatan', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-16 15:27:09', null);
INSERT INTO `table_neraca` VALUES ('32', 'L', '3', '19', 'Pendapatan Dagang', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:27:28', null);
INSERT INTO `table_neraca` VALUES ('33', 'L', '4', '21', 'Pendapatan Ongkos Kirim', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:27:55', '2022-06-16 15:33:16');
INSERT INTO `table_neraca` VALUES ('34', 'L', '5', '0', 'Total Income', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:28:07', null);
INSERT INTO `table_neraca` VALUES ('35', 'L', '6', '0', 'Cost of Goods Sold', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:28:20', null);
INSERT INTO `table_neraca` VALUES ('36', 'L', '7', '0', 'Harga Pokok Penjualan', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-16 15:28:37', null);
INSERT INTO `table_neraca` VALUES ('37', 'L', '8', '0', 'Harga Pokok Penjualan', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:28:52', null);
INSERT INTO `table_neraca` VALUES ('38', 'L', '9', '0', 'GROSS PROFIT', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:29:07', null);
INSERT INTO `table_neraca` VALUES ('39', 'L', '10', '0', 'Expense', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:29:26', null);
INSERT INTO `table_neraca` VALUES ('40', 'L', '11', '0', 'Biaya', '0', '0', '0', '0', 'LEFT', '25px', null, '2022-06-16 15:29:35', null);
INSERT INTO `table_neraca` VALUES ('41', 'L', '12', '27', 'Biaya Gaji', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:30:15', null);
INSERT INTO `table_neraca` VALUES ('42', 'L', '13', '28', 'Biaya Listrik', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:30:43', null);
INSERT INTO `table_neraca` VALUES ('43', 'L', '14', '29', 'Biaya Internet', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:31:12', null);
INSERT INTO `table_neraca` VALUES ('44', 'L', '15', '30', 'Biaya Ongkos Kirim', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:31:28', null);
INSERT INTO `table_neraca` VALUES ('45', 'L', '16', '31', 'Biaya Lain', '0', '0', '0', '0', 'LEFT', '40px', null, '2022-06-16 15:31:45', null);
INSERT INTO `table_neraca` VALUES ('46', 'L', '17', '0', 'Total Expense', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:31:57', null);
INSERT INTO `table_neraca` VALUES ('47', 'L', '18', '0', 'OPERATING PROFIT', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:32:09', null);
INSERT INTO `table_neraca` VALUES ('48', 'L', '19', '0', 'NET PROFIT/LOSS (BEFORE TAX)', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:32:28', null);
INSERT INTO `table_neraca` VALUES ('49', 'L', '20', '0', 'NET PROFIT/LOSS (AFTER TAX)', '0', '0', '0', '0', 'LEFT', null, null, '2022-06-16 15:32:50', null);

-- ----------------------------
-- Table structure for `test_barang`
-- ----------------------------
DROP TABLE IF EXISTS `test_barang`;
CREATE TABLE `test_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of test_barang
-- ----------------------------
INSERT INTO `test_barang` VALUES ('1', '6');
INSERT INTO `test_barang` VALUES ('2', '6');
INSERT INTO `test_barang` VALUES ('3', '6');
INSERT INTO `test_barang` VALUES ('4', '6');

-- ----------------------------
-- Table structure for `transaction_types`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_types`;
CREATE TABLE `transaction_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transaction_types
-- ----------------------------
INSERT INTO `transaction_types` VALUES ('1', '10', 'Purchase Down Payment', null, '2022-06-11 14:39:54', null);
INSERT INTO `transaction_types` VALUES ('2', '20', 'Goods Receipt', null, '2022-06-11 14:40:03', null);
INSERT INTO `transaction_types` VALUES ('3', '30', 'Sales Down Payment', null, '2022-06-11 14:40:14', null);
INSERT INTO `transaction_types` VALUES ('4', '40', 'Delivery Order', null, '2022-06-11 14:40:22', null);
INSERT INTO `transaction_types` VALUES ('5', '50', 'Inventory Adjustment', null, '2022-06-11 14:40:30', null);

-- ----------------------------
-- Table structure for `vendors`
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of vendors
-- ----------------------------
INSERT INTO `vendors` VALUES ('6', 'ABC-1', 'ABC', 'Jl. Pangandaran No 212', '022 72324234', 'fadf', 'asdfadf', 'sdasfads', '1', '2022-05-29 00:58:05', null);
INSERT INTO `vendors` VALUES ('7', 'TAR-7', 'Tarjo', 'fadfa', '031023', 'fadfa', 'asdfasdf', 'adsfas', '1', '2022-06-04 16:24:35', null);

-- ----------------------------
-- View structure for `view_list_products`
-- ----------------------------
DROP VIEW IF EXISTS `view_list_products`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_list_products` AS select `products`.`id` AS `id`,`products`.`code` AS `code`,`products`.`name` AS `name`,`product_categories`.`name` AS `category_name`,`product_brands`.`name` AS `brand_name`,`products`.`product_cost` AS `product_cost`,`products`.`product_price` AS `product_price`,`products`.`qty_onhand` AS `qty_onhand`,`products`.`description` AS `description` from ((`products` join `product_categories` on((`product_categories`.`id` = `products`.`category_id`))) join `product_brands` on((`product_brands`.`id` = `products`.`brand_id`))) ;

-- ----------------------------
-- View structure for `view_list_product_sales`
-- ----------------------------
DROP VIEW IF EXISTS `view_list_product_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_list_product_sales` AS select `products`.`id` AS `id`,`products`.`name` AS `name`,`product_categories`.`name` AS `category_name`,`product_brands`.`name` AS `brand_name`,format(`products`.`product_cost`,2) AS `product_cost`,format(`products`.`product_price`,2) AS `product_price`,`products`.`qty_onhand` AS `qty_onhand`,'-' AS `lot_number` from ((`products` join `product_categories` on((`products`.`category_id` = `product_categories`.`id`))) join `product_brands` on((`products`.`brand_id` = `product_brands`.`id`))) union all select `products`.`id` AS `id`,`products`.`name` AS `name`,`product_categories`.`name` AS `category_name`,`product_brands`.`name` AS `brand_name`,`product_items`.`product_cost` AS `product_cost`,`product_items`.`product_price` AS `product_price`,`product_items`.`qty` AS `qty`,`product_items`.`lot_number` AS `lot_number` from (((`product_items` join `products` on((`product_items`.`product_id` = `products`.`id`))) join `product_categories` on((`products`.`category_id` = `product_categories`.`id`))) join `product_brands` on((`products`.`brand_id` = `product_brands`.`id`))) ;

-- ----------------------------
-- View structure for `view_orders`
-- ----------------------------
DROP VIEW IF EXISTS `view_orders`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders` AS select `purchase_orders`.`id` AS `id`,`purchase_orders`.`order_number` AS `order_number`,`purchase_orders`.`order_date` AS `order_date`,`purchase_orders`.`description` AS `description`,`vendors`.`name` AS `vendor_name` from (`purchase_orders` join `vendors` on((`vendors`.`id` = `purchase_orders`.`vendor_id`))) ;

-- ----------------------------
-- View structure for `view_product_items`
-- ----------------------------
DROP VIEW IF EXISTS `view_product_items`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_items` AS select `product_items`.`id` AS `id`,`product_items`.`product_id` AS `prod_id`,`products`.`name` AS `name`,`product_categories`.`name` AS `category_name`,`product_brands`.`name` AS `brand_name`,`vendors`.`name` AS `vendor_name`,`product_items`.`product_cost` AS `product_cost`,`product_items`.`product_price` AS `product_price`,`product_items`.`lot_number` AS `lot_number`,`product_items`.`qty` AS `qty` from ((((`product_items` join `products` on((`product_items`.`product_id` = `products`.`id`))) join `product_categories` on((`products`.`category_id` = `product_categories`.`id`))) join `product_brands` on((`products`.`brand_id` = `product_brands`.`id`))) join `vendors` on((`product_items`.`vendor_id` = `vendors`.`id`))) where (`product_items`.`qty` > 0) ;
DROP TRIGGER IF EXISTS `lot_number_insert`;
DELIMITER ;;
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `product_stock_insert`;
DELIMITER ;;
CREATE TRIGGER `product_stock_insert` AFTER INSERT ON `goods_receipt_details` FOR EACH ROW BEGIN
update products set qty_onhand = qty_onhand + NEW.qty_in where id = NEW.product_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `product_stock_delete`;
DELIMITER ;;
CREATE TRIGGER `product_stock_delete` AFTER DELETE ON `goods_receipt_details` FOR EACH ROW BEGIN
update products set qty_onhand = qty_onhand - OLD.qty_in where id = OLD.product_id;
END
;;
DELIMITER ;
