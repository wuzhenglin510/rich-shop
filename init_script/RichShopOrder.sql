/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql_docker
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : RichShopOrder

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 29/01/2019 17:35:00
*/

CREATE DATABASE IF NOT EXISTS  RichShopOrder DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Order
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderNumber` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `totalPrice` int(11) NOT NULL COMMENT '原始总金额',
  `discount` int(10) NOT NULL COMMENT '折扣金额',
  `realPrice` int(11) NOT NULL COMMENT '实际金额',
  `memberId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员id',
  `status` int(11) NOT NULL COMMENT '订单状态',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for OrderItem
-- ----------------------------
DROP TABLE IF EXISTS `OrderItem`;
CREATE TABLE `OrderItem` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `goodsId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品id',
  `purchasePrice` int(11) NOT NULL COMMENT '进货价',
  `salesPrice` int(11) NOT NULL COMMENT '销售价',
  `discount` int(11) NOT NULL COMMENT '优惠金额',
  `amount` int(11) NOT NULL COMMENT '数量',
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for OrderUsedCoupon
-- ----------------------------
DROP TABLE IF EXISTS `OrderUsedCoupon`;
CREATE TABLE `OrderUsedCoupon` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `coupon` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用优惠券',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for PayRecord
-- ----------------------------
DROP TABLE IF EXISTS `PayRecord`;
CREATE TABLE `PayRecord` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `orderNumber` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `transactionNumber` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易号',
  `money` int(11) NOT NULL COMMENT '支付金额',
  `status` int(11) NOT NULL COMMENT '支付状态',
  `method` int(11) NOT NULL COMMENT '支付方式',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
