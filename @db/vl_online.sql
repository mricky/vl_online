/*
Navicat MySQL Data Transfer

Source Server         : Local Server
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : vl_online

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-06-07 14:22:10
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_menus
-- ----------------------------
INSERT INTO `cms_menus` VALUES ('1', 'Pembelian', 'URL', '#', 'normal', 'fa fa-tag', '0', '1', '0', '1', '1', '2022-05-23 05:22:18', '2022-05-23 05:22:42');
INSERT INTO `cms_menus` VALUES ('2', 'Penjualan', 'URL', '#', 'normal', 'fa fa-tags', '0', '1', '0', '1', '2', '2022-05-23 05:23:13', '2022-05-23 05:24:14');
INSERT INTO `cms_menus` VALUES ('3', 'Inventory', 'URL', '#', 'normal', 'fa fa-dropbox', '0', '1', '0', '1', '4', '2022-05-23 05:25:10', '2022-05-23 05:25:27');
INSERT INTO `cms_menus` VALUES ('4', 'Setup Data', 'URL', '#', 'normal', 'fa fa-gears', '0', '1', '0', '1', '6', '2022-05-23 05:26:12', '2022-05-23 05:26:20');
INSERT INTO `cms_menus` VALUES ('5', 'Akun Bank', 'Route', 'AdminAccountBanksControllerGetIndex', 'normal', 'fa fa-money', '4', '1', '0', '1', '1', '2022-05-23 05:30:55', '2022-05-23 05:32:01');
INSERT INTO `cms_menus` VALUES ('6', 'Tipe Pembayaran', 'Route', 'AdminPaymentTypesControllerGetIndex', 'normal', 'fa fa-gear', '4', '1', '0', '1', '2', '2022-05-23 05:36:26', '2022-05-23 05:37:06');
INSERT INTO `cms_menus` VALUES ('7', 'Akunting', 'URL', '#', 'normal', 'fa fa-th-list', '0', '1', '0', '1', '5', '2022-05-23 05:38:13', '2022-05-23 05:38:26');
INSERT INTO `cms_menus` VALUES ('8', 'Vendor', 'Route', 'AdminVendorsControllerGetIndex', 'normal', 'fa fa-users', '1', '1', '0', '1', '1', '2022-05-23 05:42:13', '2022-05-23 05:43:25');
INSERT INTO `cms_menus` VALUES ('9', 'Customer', 'Route', 'AdminCustomersControllerGetIndex', null, 'fa fa-heart', '2', '1', '0', '1', '1', '2022-05-23 05:45:39', null);
INSERT INTO `cms_menus` VALUES ('10', 'Category Produk', 'Route', 'AdminProductCategoriesControllerGetIndex', 'normal', 'fa fa-gear', '3', '1', '0', '1', '3', '2022-05-23 05:50:01', '2022-05-28 12:24:30');
INSERT INTO `cms_menus` VALUES ('11', 'Keuangan', 'URL', '#', 'normal', 'fa fa-money', '0', '1', '0', '1', '3', '2022-05-23 05:52:09', '2022-05-23 05:52:24');
INSERT INTO `cms_menus` VALUES ('12', 'Ekspedisi', 'Route', 'AdminExpeditionsControllerGetIndex', 'normal', 'fa fa-truck', '4', '1', '0', '1', '3', '2022-05-28 12:23:37', '2022-05-28 12:24:37');
INSERT INTO `cms_menus` VALUES ('13', 'Brand', 'Route', 'AdminProductBrandsControllerGetIndex', 'normal', 'fa fa-star', '3', '1', '0', '1', '4', '2022-05-28 12:34:44', '2022-05-28 12:35:31');
INSERT INTO `cms_menus` VALUES ('14', 'Produk', 'Route', 'AdminProductsControllerGetIndex', 'normal', 'fa fa-barcode', '3', '1', '0', '1', '2', '2022-05-28 12:57:28', '2022-05-28 13:01:28');
INSERT INTO `cms_menus` VALUES ('15', 'Photo Produk', 'Route', 'AdminProductPhotosControllerGetIndex', null, 'fa fa-image', '0', '0', '0', '1', '1', '2022-05-28 13:46:33', null);
INSERT INTO `cms_menus` VALUES ('16', 'Pesanan', 'Route', 'AdminPurchaseOrdersControllerGetIndex', 'normal', 'fa fa-th', '1', '1', '0', '1', '2', '2022-05-28 13:57:54', '2022-05-28 14:00:05');
INSERT INTO `cms_menus` VALUES ('17', 'Penerimaan Barang', 'Route', 'AdminGoodsReceiptControllerGetIndex', 'normal', 'fa fa-arrow-right', '1', '1', '0', '1', '3', '2022-05-29 01:45:17', '2022-05-29 01:50:28');
INSERT INTO `cms_menus` VALUES ('18', 'Item List', 'Route', 'AdminProducts25ControllerGetIndex', 'normal', 'fa fa-th-list', '3', '1', '0', '1', '1', '2022-06-06 02:14:32', '2022-06-06 02:15:24');
INSERT INTO `cms_menus` VALUES ('19', 'Penjualan', 'Route', 'AdminSalesOrdersControllerGetIndex', 'normal', 'fa fa-th', '2', '1', '0', '1', '2', '2022-06-06 03:37:54', '2022-06-06 03:41:46');

-- ----------------------------
-- Table structure for `cms_menus_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menus_privileges`;
CREATE TABLE `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `cms_menus_privileges` VALUES ('34', '11', '2');
INSERT INTO `cms_menus_privileges` VALUES ('35', '11', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_receipt
-- ----------------------------
INSERT INTO `goods_receipt` VALUES ('6', 'GR-ABC-122060001', '6', '5', null, '2022-06-22', 'receive ok', '1', '2022-06-05 12:23:05', null);
INSERT INTO `goods_receipt` VALUES ('7', 'GR-ABC-122060007', '6', '5', null, '2022-06-22', 'test ok', '1', '2022-06-05 12:24:56', null);
INSERT INTO `goods_receipt` VALUES ('8', 'GR-ABC-122060008', '6', '5', null, '2022-06-21', 'test', '1', '2022-06-05 13:35:25', null);
INSERT INTO `goods_receipt` VALUES ('9', 'GR-ABC-122060009', '6', '5', null, '2022-06-21', 'test', '1', '2022-06-05 13:36:01', null);
INSERT INTO `goods_receipt` VALUES ('10', 'GR-ABC-122060010', '6', '5', null, '2022-06-22', 'test', '1', '2022-06-05 13:41:18', null);
INSERT INTO `goods_receipt` VALUES ('11', 'GR-ABC-122060011', '6', '5', null, '2022-06-21', 'test ok', '1', '2022-06-05 13:53:44', null);
INSERT INTO `goods_receipt` VALUES ('12', 'GR-ABC-122060012', '6', '5', null, '2022-06-22', 'test', '1', '2022-06-05 13:55:31', null);
INSERT INTO `goods_receipt` VALUES ('13', 'GR-ABC-122060013', '6', '5', null, '2022-06-22', 'test', '1', '2022-06-05 13:58:07', null);
INSERT INTO `goods_receipt` VALUES ('14', 'GR-ABC-122060014', '6', '5', null, '2022-06-15', 'test', '1', '2022-06-05 13:58:59', null);
INSERT INTO `goods_receipt` VALUES ('15', 'GR-ABC-122060015', '6', '5', null, '2022-06-15', 'test', '1', '2022-06-05 13:59:51', null);
INSERT INTO `goods_receipt` VALUES ('16', 'GR-ABC-122060016', '6', '5', null, '2022-06-28', 'tests', '1', '2022-06-05 14:00:40', null);
INSERT INTO `goods_receipt` VALUES ('17', 'GR-ABC-122060017', '6', '5', null, '2022-06-28', 'test lot', '1', '2022-06-05 14:05:20', null);
INSERT INTO `goods_receipt` VALUES ('18', 'GR-ABC-122060018', '6', '5', null, '2022-06-22', 'test ok', '1', '2022-06-05 14:06:42', null);
INSERT INTO `goods_receipt` VALUES ('19', 'GR-ABC-122060019', '6', '5', null, '2022-06-22', 'yyyy', '1', '2022-06-05 14:07:09', null);
INSERT INTO `goods_receipt` VALUES ('20', 'GR-ABC-122060020', '6', '5', null, '2022-06-15', 'test', '1', '2022-06-05 14:08:06', null);
INSERT INTO `goods_receipt` VALUES ('21', 'GR-ABC-122060021', '6', '5', null, '2022-06-30', 'test ok', '1', '2022-06-05 14:18:26', null);
INSERT INTO `goods_receipt` VALUES ('22', 'GR-ABC-122060022', '6', '5', null, '2022-06-22', 'test', '1', '2022-06-05 14:28:39', null);
INSERT INTO `goods_receipt` VALUES ('23', 'GR-ABC-122060023', '6', '5', null, '2022-06-22', '2', '1', '2022-06-05 14:33:04', null);
INSERT INTO `goods_receipt` VALUES ('24', 'GR-ABC-122060024', '6', '5', null, '2022-06-22', 'teatadad', '1', '2022-06-05 14:33:16', null);
INSERT INTO `goods_receipt` VALUES ('25', 'GR-ABC-122060025', '6', '5', null, '2022-06-22', 'teatadad', '1', '2022-06-05 14:33:28', null);
INSERT INTO `goods_receipt` VALUES ('26', 'GR-ABC-122060026', '6', '5', null, '2022-06-23', 'test', '1', '2022-06-05 14:34:46', null);
INSERT INTO `goods_receipt` VALUES ('27', 'GR-ABC-122060027', '6', '5', null, '2022-06-15', 'test', '1', '2022-06-05 14:39:44', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_receipt_details
-- ----------------------------
INSERT INTO `goods_receipt_details` VALUES ('5', '6', '2', 'ABC-1-20220622', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('6', '6', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('7', '7', '2', 'ABC-1-20220622', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('8', '7', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('11', '9', '2', 'ABC-1-20220621', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('12', '9', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('13', '10', '2', 'ABC-1-', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('14', '10', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('23', '15', '2', 'ABC-1-20220615', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('24', '15', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('25', '16', '2', 'ABC-1-20220628', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('26', '16', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('27', '17', '2', 'ABC-1-', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('28', '17', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('29', '18', '2', 'ABC-1-20220622', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('30', '18', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('31', '19', '2', 'ABC-1-20220622', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('32', '19', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('33', '20', '2', 'ABC-1-20220615', '20', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('34', '20', '1', null, '2', null, '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('35', '21', '2', 'ABC-1-20220630', '20', '20000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('36', '21', '1', null, '2', '50000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('37', '22', '2', 'ABC-1-20220622', '20', '20000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('38', '22', '1', null, '2', '50000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('43', '25', '2', 'ABC-1-20220622', '20', '20000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('44', '25', '1', null, '2', '50000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('45', '26', '2', 'ABC-1-20220623', '20', '20000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('46', '26', '1', null, '2', '50000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('47', '27', '2', 'ABC-1-20220615', '20', '20000.00', '0', null, null, null);
INSERT INTO `goods_receipt_details` VALUES ('48', '27', '1', null, '2', '50000.00', '0', null, null, null);

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `products` VALUES ('1', 'GLA-CHI-1', 'Glass Kacamata Non Lot', '0', '2', '1', '0.00', '0.00', '4', '0', null, '0', 'TEst', '1', '2022-06-04 14:29:20', null);
INSERT INTO `products` VALUES ('2', 'GLA-CHI-2', 'Glass Kacamata Lot Number', '1', '2', '1', '0.00', '0.00', '20', '0', null, '0', 'Test', '1', '2022-06-04 14:29:36', null);

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
  `product_cost` double(8,2) NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_items
-- ----------------------------
INSERT INTO `product_items` VALUES ('13', 'GR-ABC-122060021', '2022-06-30', '2', '6', '20000.00', '1000.00', '20', 'ABC-1-20220630', '-', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_orders
-- ----------------------------
INSERT INTO `purchase_orders` VALUES ('9', '6', 'PO-ABC-122060001', '2022-06-15', '1', '4000000', '0', '4000000', '4000000', 'oooo', '1', '2022-06-06 13:00:39', '2022-06-06 13:34:08', '0');
INSERT INTO `purchase_orders` VALUES ('10', '7', 'PO-TAR-722060010', '2022-06-15', '1', '4000000', '0', '4000000', '2000000', 'test Tarjo', '1', '2022-06-06 15:09:29', null, '2000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_order_details
-- ----------------------------
INSERT INTO `purchase_order_details` VALUES ('1', '8', '20', '2', '2000000', '40000000', '20000000', '0', '20000000', null, null, null);
INSERT INTO `purchase_order_details` VALUES ('2', '9', '20', '2', '200000', '4000000', '4000000', '0', '0', null, null, null);
INSERT INTO `purchase_order_details` VALUES ('7', '10', '20', '2', '200000', '4000000', '2000000', '0', '2000000', null, null, null);

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
  `customer_receive_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_receive_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_orders_order_number_index` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sales_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `sales_order_details`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_details`;
CREATE TABLE `sales_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_item_id` int(11) DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_details_purchase_order_id_index` (`sales_order_id`),
  KEY `purchase_order_details_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sales_order_details
-- ----------------------------

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
