/*
Navicat MySQL Data Transfer

Source Server         : Local Server
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : vl_online

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-07-29 08:59:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `product_brands`
-- ----------------------------
DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE `product_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_brands_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_brands
-- ----------------------------
INSERT INTO `product_brands` VALUES ('1', null, 'ALAIA', null, null, null);
INSERT INTO `product_brands` VALUES ('2', null, 'AMINA MAUDDI', null, null, null);
INSERT INTO `product_brands` VALUES ('3', null, 'BALENCIAGA', null, null, null);
INSERT INTO `product_brands` VALUES ('4', null, 'BALLY', null, null, null);
INSERT INTO `product_brands` VALUES ('5', null, 'BAO BAO', null, null, null);
INSERT INTO `product_brands` VALUES ('6', null, 'BOTTEGA VENETA', null, null, null);
INSERT INTO `product_brands` VALUES ('7', null, 'BOYY BOBBY', null, null, null);
INSERT INTO `product_brands` VALUES ('8', null, 'BURBERRY', null, null, null);
INSERT INTO `product_brands` VALUES ('9', null, 'CELINE', null, null, null);
INSERT INTO `product_brands` VALUES ('10', null, 'CHANEL', null, null, null);
INSERT INTO `product_brands` VALUES ('11', null, 'CHIARA FERRAGNI', null, null, null);
INSERT INTO `product_brands` VALUES ('12', null, 'CHRISTIAN LOUBOUTIN', null, null, null);
INSERT INTO `product_brands` VALUES ('13', null, 'COACH', null, null, null);
INSERT INTO `product_brands` VALUES ('14', null, 'COMME', null, null, null);
INSERT INTO `product_brands` VALUES ('15', null, 'DIOR', null, null, null);
INSERT INTO `product_brands` VALUES ('16', null, 'FAURE LE PAGE', null, null, null);
INSERT INTO `product_brands` VALUES ('17', null, 'FENDI', null, null, null);
INSERT INTO `product_brands` VALUES ('18', null, 'FURLA', null, null, null);
INSERT INTO `product_brands` VALUES ('19', null, 'GIVENCHY', null, null, null);
INSERT INTO `product_brands` VALUES ('20', null, 'GOYARD', null, null, null);
INSERT INTO `product_brands` VALUES ('21', null, 'GUCCI', null, null, null);
INSERT INTO `product_brands` VALUES ('22', null, 'HERMES', null, null, null);
INSERT INTO `product_brands` VALUES ('23', null, 'HUGO BOSS', null, null, null);
INSERT INTO `product_brands` VALUES ('24', null, 'JACQUEMUS', null, null, null);
INSERT INTO `product_brands` VALUES ('25', null, 'JIMMY CHOO', null, null, null);
INSERT INTO `product_brands` VALUES ('26', null, 'KARL LAGERFELD', null, null, null);
INSERT INTO `product_brands` VALUES ('27', null, 'KENZO', null, null, null);
INSERT INTO `product_brands` VALUES ('28', null, 'LOEWE', null, null, null);
INSERT INTO `product_brands` VALUES ('29', null, 'LONGCHAMP', null, null, null);
INSERT INTO `product_brands` VALUES ('30', null, 'MALONESOULIERS', null, null, null);
INSERT INTO `product_brands` VALUES ('31', null, 'MANOLO BLAHNIK', null, null, null);
INSERT INTO `product_brands` VALUES ('32', null, 'MARC JACOBS', null, null, null);
INSERT INTO `product_brands` VALUES ('33', null, 'MCM', null, null, null);
INSERT INTO `product_brands` VALUES ('34', null, 'MIU MIU', null, null, null);
INSERT INTO `product_brands` VALUES ('35', null, 'MLB', null, null, null);
INSERT INTO `product_brands` VALUES ('36', null, 'MOSCHINO', null, null, null);
INSERT INTO `product_brands` VALUES ('37', null, 'PHILIP LIM', null, null, null);
INSERT INTO `product_brands` VALUES ('38', null, 'PRADA', null, null, null);
INSERT INTO `product_brands` VALUES ('39', null, 'SALVATORE FERAGAMO', null, null, null);
INSERT INTO `product_brands` VALUES ('40', null, 'SOPHIA WEBSTER', null, null, null);
INSERT INTO `product_brands` VALUES ('41', null, 'STELLA MCCARTNEY', null, null, null);
INSERT INTO `product_brands` VALUES ('42', null, 'TORY BURCH', null, null, null);
INSERT INTO `product_brands` VALUES ('43', null, 'VALENTINO', null, null, null);
INSERT INTO `product_brands` VALUES ('44', null, 'YVES SAINT LAURENT', null, null, null);

-- ----------------------------
-- Table structure for `product_categories`
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('1', null, 'ACCESSORIES', null, null, null);
INSERT INTO `product_categories` VALUES ('2', null, 'BAG', null, null, null);
INSERT INTO `product_categories` VALUES ('3', null, 'CAP/HAT', null, null, null);
INSERT INTO `product_categories` VALUES ('4', null, 'CLUTCH', null, null, null);
INSERT INTO `product_categories` VALUES ('5', null, 'DRESS', null, null, null);
INSERT INTO `product_categories` VALUES ('6', null, 'FOOTWEAR', null, null, null);
INSERT INTO `product_categories` VALUES ('7', null, 'GLASSES', null, null, null);
INSERT INTO `product_categories` VALUES ('8', null, 'JACKET', null, null, null);
INSERT INTO `product_categories` VALUES ('9', null, 'OUTER', null, null, null);
INSERT INTO `product_categories` VALUES ('10', null, 'PANTS', null, null, null);
INSERT INTO `product_categories` VALUES ('11', null, 'POUCH', null, null, null);
INSERT INTO `product_categories` VALUES ('12', null, 'SHIRT', null, null, null);
INSERT INTO `product_categories` VALUES ('13', null, 'SWEATSHIRT', null, null, null);
INSERT INTO `product_categories` VALUES ('14', null, 'TOTEBAG', null, null, null);
INSERT INTO `product_categories` VALUES ('15', null, 'TSHIRT', null, null, null);
INSERT INTO `product_categories` VALUES ('16', null, 'WALLET', null, null, null);
