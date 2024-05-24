/*
 Navicat Premium Data Transfer

 Source Server         : 47.113.104.184
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 47.113.104.184:3306
 Source Schema         : tourist

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 28/04/2024 10:56:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_address_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2024-04-26 14:31:36', '2024-04-26 14:31:36', NULL, 1, '林', '18277923708', '辽宁省-鞍山市-立山区-海城区西南大道56号南国华城3幢0604号');
INSERT INTO `address` VALUES (2, '2024-04-27 11:05:26', '2024-04-27 11:05:26', NULL, 1, '林1653416', '18277923704', '山西省-朔州市-右玉县-海城区西');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password_digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_admin_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_carousel_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, '2024-03-24 11:34:09', '2024-03-24 11:34:11', NULL, 'https://images.unsplash.com/photo-1513267048331-5611cad62e41?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyNjI5NjF8MHwxfHNlYXJjaHw5fHxDb2ZmZWUlMjBTaG9wfGVufDB8fHx8MTcxMDgzMTgyNHww&ixlib=rb-4.0.3&q=80&w=1080', 24);
INSERT INTO `carousel` VALUES (2, '2024-03-24 11:34:49', '2024-03-24 11:34:51', NULL, 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyNjI5NjF8MHwxfHNlYXJjaHwxMHx8Q29mZmVlJTIwU2hvcHxlbnwwfHx8fDE3MTA4MzE4MjR8MA&ixlib=rb-4.0.3&q=80&w=1080', 26);
INSERT INTO `carousel` VALUES (3, '2024-04-19 08:49:40', '2024-04-19 08:49:45', NULL, 'https://images.unsplash.com/photo-1600093463592-8e36ae95ef56?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyNjI5NjF8MHwxfHNlYXJjaHw0fHxDb2ZmZWUlMjBTaG9wfGVufDB8fHx8MTcxMDgzMTgyNHww&ixlib=rb-4.0.3&q=80&w=1080', 24);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  `max_num` int(10) UNSIGNED NULL DEFAULT NULL,
  `check` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cart_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '2024-04-21 12:59:15', '2024-04-21 12:59:15', NULL, 1, 1, 1, 10, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 0, '推荐', 100);
INSERT INTO `category` VALUES (2, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 1, '食品', 100);
INSERT INTO `category` VALUES (3, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 2, '水果', 100);
INSERT INTO `category` VALUES (4, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 3, '男装', 100);
INSERT INTO `category` VALUES (5, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 4, '电脑', 100);
INSERT INTO `category` VALUES (6, '2024-04-17 20:29:02', '2024-04-17 20:29:06', NULL, 5, '医药', 100);

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_favorite_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, '2024-04-21 12:59:17', '2024-04-21 12:59:17', NULL, 1, 1);
INSERT INTO `favorite` VALUES (2, '2024-04-22 20:05:54', '2024-04-22 20:05:54', NULL, 1, 2);
INSERT INTO `favorite` VALUES (3, '2024-04-22 20:05:59', '2024-04-22 20:05:59', NULL, 1, 4);
INSERT INTO `favorite` VALUES (4, '2024-04-22 20:06:03', '2024-04-22 20:06:03', NULL, 1, 5);
INSERT INTO `favorite` VALUES (5, '2024-04-22 20:06:06', '2024-04-22 20:06:06', NULL, 1, 6);
INSERT INTO `favorite` VALUES (6, '2024-04-22 20:06:12', '2024-04-22 20:06:12', NULL, 1, 14);
INSERT INTO `favorite` VALUES (7, '2024-04-22 20:07:25', '2024-04-22 20:07:25', NULL, 1, 10);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notice_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  `order_num` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `address_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '2024-04-26 14:36:51', '2024-04-26 14:36:51', NULL, 1, 1, 3, 99463456811, '林', '18277923708', '辽宁省-鞍山市-立山区-海城区西南大道56号南国华城3幢0604号', 1);
INSERT INTO `order` VALUES (9, '2024-04-27 13:13:24', '2024-04-27 13:13:24', NULL, 1, 1, 1, 79555733711, '林1653416', '18277923704', '山西省-朔州市-右玉县-海城区西', 1);
INSERT INTO `order` VALUES (10, '2024-04-27 13:13:45', '2024-04-27 13:13:45', NULL, 1, 1, 1, 57830059111, '林1653416', '18277923704', '山西省-朔州市-右玉县-海城区西', 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `info` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '2001-01-25 12:52:54', '2007-02-17 00:43:26', NULL, '小石头奥尔良小鸡腿鸡肉辣味零食小吃充饥夜宵整箱休闲即食食品肉', 1, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', '41.41', '41.41');
INSERT INTO `product` VALUES (2, '2011-07-23 14:13:22', '2014-12-28 10:30:50', NULL, '燃鸭鸭腿爆大腿麻香辣酱香网红大鸭腿开袋即食休闲零食小包装小吃', 1, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '51.64', '51.64');
INSERT INTO `product` VALUES (3, '2005-03-19 09:39:15', '2020-03-14 15:28:44', NULL, '麻辣香辣八爪鱼爆头章鱼即食罐装小海鲜熟食扇贝生蚝鱿鱼须下饭菜', 1, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '21.87', '21.87');
INSERT INTO `product` VALUES (4, '2023-03-21 08:40:00', '2003-12-17 00:23:18', NULL, '【特价60包】香辣鸭翅中盐焗卤味麻辣零食批发麻辣解馋小零食2包', 1, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (5, '2013-05-31 11:24:51', '2001-07-09 17:22:40', NULL, '盐焗翅中零食批发一整箱香辣鸡鸭翅中开袋即食解馋卤味独立包装', 1, '食品', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (6, '2022-06-07 11:51:03', '2000-12-08 07:18:47', NULL, '膳食蔬菜鸡胸肉肠开袋即食减0低脂高蛋白无淀粉健身代餐烤肠香肠', 1, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', '99.99', '99.99');
INSERT INTO `product` VALUES (7, '2004-08-25 23:31:55', '2011-11-11 17:39:13', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 1, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (8, '2007-12-08 04:43:33', '2014-10-09 19:45:23', NULL, '白象五香卤蛋', 1, '食品', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (9, '2021-03-25 17:55:51', '2003-03-24 05:02:49', NULL, '0脂肪养麦方便面非油炸', 1, '食品', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (10, '2001-10-30 23:57:50', '2018-07-28 17:28:10', NULL, '【精品】正宗广西武鸣皇帝柑', 1, '水果', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (11, '2002-09-04 09:15:40', '2017-03-10 04:03:45', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 1, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (12, '2005-11-15 16:44:25', '2001-03-19 02:14:02', NULL, '养庆堂桑', 1, '水果', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (13, '2007-05-07 16:07:03', '2013-11-10 05:50:13', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 1, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (14, '2003-06-25 10:41:42', '2000-07-11 15:12:47', NULL, '正宗四川春见耙耙柑橘子10', 1, '水果', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (15, '2018-04-29 08:53:18', '2005-03-06 19:36:01', NULL, '正宗雪梨河', 1, '水果', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (16, '2007-09-03 02:54:21', '2020-11-12 15:10:47', NULL, '莲子心茶泡,水正品莲子芯干', 1, '水果', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (17, '2022-01-18 22:07:01', '2014-10-31 23:21:39', NULL, '三件套】2023春秋季ins港风,', 1, '男装', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (18, '2014-11-25 11:48:11', '2020-10-24 08:08:42', NULL, '日系复古夹克套装男春秋季', 1, '男装', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (19, '2015-09-05 19:21:24', '2011-12-21 09:38:03', NULL, '笔记本电脑支架', 1, '电脑', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (20, '2013-02-27 18:49:38', '2008-06-30 12:31:09', NULL, '笔记本电脑支架增高散热架', 1, '电脑', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (21, '2002-12-17 12:32:21', '2015-05-02 23:28:45', NULL, '北京同仁堂蓝莓', 1, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (22, '2007-04-30 11:12:08', '2012-05-17 20:17:01', NULL, '北京同仁堂正品人参黄精八', 1, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (23, '2005-01-18 21:02:45', '2018-12-18 06:25:25', NULL, '北京同仁堂正品人参黄精八', 1, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (24, '2010-07-06 12:03:14', '2005-11-13 00:01:34', NULL, '北京同仁堂正品人参黄精八', 2, '食品', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (25, '2011-05-11 04:29:09', '2009-12-05 17:32:40', NULL, '北京同仁堂正品人参黄精八', 2, '食品', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (26, '2022-07-01 03:20:46', '2010-08-07 03:18:46', NULL, '小石头奥尔良小鸡腿鸡肉辣味零食小吃充饥夜宵整箱休闲即食食品肉', 2, '食品', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (27, '2011-02-02 04:06:03', '2010-04-19 05:20:59', NULL, '燃鸭鸭腿爆大腿麻香辣酱香网红大鸭腿开袋即食休闲零食小包装小吃', 2, '食品', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (28, '2012-04-13 22:00:16', '2001-11-29 06:41:07', NULL, '麻辣香辣八爪鱼爆头章鱼即食罐装小海鲜熟食扇贝生蚝鱿鱼须下饭菜', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', '41.41', '41.41');
INSERT INTO `product` VALUES (29, '2001-02-11 13:08:10', '2004-01-17 20:07:04', NULL, '【特价60包】香辣鸭翅中盐焗卤味麻辣零食批发麻辣解馋小零食2包', 2, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '51.64', '51.64');
INSERT INTO `product` VALUES (30, '2019-05-11 01:21:56', '2003-11-06 09:10:00', NULL, '盐焗翅中零食批发一整箱香辣鸡鸭翅中开袋即食解馋卤味独立包装', 2, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '21.87', '21.87');
INSERT INTO `product` VALUES (31, '2003-08-13 02:09:22', '2010-05-21 14:26:04', NULL, '膳食蔬菜鸡胸肉肠开袋即食减0低脂高蛋白无淀粉健身代餐烤肠香肠', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (32, '2017-06-06 04:35:03', '2001-11-25 05:57:15', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (33, '2008-06-04 01:27:05', '2012-03-31 14:14:21', NULL, '白象五香卤蛋', 2, '水果', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', '99.99', '99.99');
INSERT INTO `product` VALUES (34, '2016-09-28 17:35:57', '2008-04-08 05:22:47', NULL, '0脂肪养麦方便面非油炸', 2, '水果', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (35, '2007-06-27 05:38:32', '2023-09-19 21:51:12', NULL, '【精品】正宗广西武鸣皇帝柑', 2, '水果', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (36, '2013-09-27 08:01:41', '2008-04-14 11:43:43', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 2, '水果', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (37, '2003-03-09 13:10:53', '2000-06-08 20:06:54', NULL, '养庆堂桑', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (38, '2022-01-14 15:11:43', '2016-05-24 14:42:38', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 2, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (39, '2016-04-26 14:50:10', '2009-12-07 15:01:16', NULL, '正宗四川春见耙耙柑橘子10', 2, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (40, '2003-08-13 11:12:41', '2014-01-04 04:42:45', NULL, '正宗雪梨河', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (41, '2004-11-02 12:09:37', '2013-05-06 09:20:58', NULL, '莲子心茶泡,水正品莲子芯干', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (42, '2008-07-05 00:55:49', '2021-09-28 13:24:30', NULL, '三件套】2023春秋季ins港风,', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (43, '2006-08-12 17:29:25', '2002-01-18 10:56:57', NULL, '日系复古夹克套装男春秋季', 2, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (44, '2019-08-11 19:25:52', '2007-12-01 18:26:24', NULL, '笔记本电脑支架', 2, '食品', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (45, '2013-06-25 04:37:26', '2013-12-14 21:17:32', NULL, '笔记本电脑支架增高散热架', 2, '食品', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (46, '2014-12-08 12:19:24', '2004-03-22 14:33:52', NULL, '北京同仁堂蓝莓', 2, '水果', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (47, '2003-11-07 05:53:12', '2001-07-14 10:12:01', NULL, '北京同仁堂正品人参黄精八', 2, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (48, '2015-07-06 14:52:32', '2006-04-03 15:24:43', NULL, '北京同仁堂正品人参黄精八', 2, '水果', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (49, '2019-08-04 12:14:54', '2006-12-05 00:37:15', NULL, '北京同仁堂正品人参黄精八', 2, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (50, '2020-08-30 10:37:31', '2022-11-19 09:03:59', NULL, '小石头奥尔良小鸡腿鸡肉辣味零食小吃充饥夜宵整箱休闲即食食品肉', 2, '水果', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (51, '2008-03-30 21:22:23', '2002-10-02 03:32:57', NULL, '燃鸭鸭腿爆大腿麻香辣酱香网红大鸭腿开袋即食休闲零食小包装小吃', 2, '水果', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (52, '2001-07-02 04:58:35', '2010-03-12 22:19:34', NULL, '麻辣香辣八爪鱼爆头章鱼即食罐装小海鲜熟食扇贝生蚝鱿鱼须下饭菜', 2, '水果', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (53, '2011-09-28 05:12:47', '2016-01-04 10:14:16', NULL, '【特价60包】香辣鸭翅中盐焗卤味麻辣零食批发麻辣解馋小零食2包', 2, '男装', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (54, '2006-12-09 04:38:05', '2004-01-08 21:23:13', NULL, '盐焗翅中零食批发一整箱香辣鸡鸭翅中开袋即食解馋卤味独立包装', 2, '男装', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (55, '2002-03-23 18:43:00', '2011-07-22 17:52:32', NULL, '膳食蔬菜鸡胸肉肠开袋即食减0低脂高蛋白无淀粉健身代餐烤肠香肠', 3, '电脑', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', '41.41', '41.41');
INSERT INTO `product` VALUES (56, '2016-02-28 19:26:48', '2016-07-24 15:51:51', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 3, '电脑', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '51.64', '51.64');
INSERT INTO `product` VALUES (57, '2013-10-01 19:27:38', '2011-10-21 20:27:55', NULL, '白象五香卤蛋', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '21.87', '21.87');
INSERT INTO `product` VALUES (58, '2009-07-13 16:49:25', '2013-09-13 01:10:40', NULL, '0脂肪养麦方便面非油炸', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (59, '2012-03-27 02:46:44', '2012-09-25 20:20:55', NULL, '【精品】正宗广西武鸣皇帝柑', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (60, '2001-07-29 18:47:16', '2013-06-25 06:28:27', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', '99.99', '99.99');
INSERT INTO `product` VALUES (61, '2017-07-09 01:42:35', '2010-03-04 20:12:14', NULL, '养庆堂桑', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (62, '2018-03-01 03:30:33', '2018-06-10 13:49:06', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (63, '2023-12-10 23:16:51', '2014-01-26 13:08:50', NULL, '正宗四川春见耙耙柑橘子10', 3, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (64, '2009-05-04 08:55:31', '2013-06-02 20:11:12', NULL, '正宗雪梨河', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (65, '2002-06-23 10:06:27', '2000-12-11 12:50:40', NULL, '莲子心茶泡,水正品莲子芯干', 3, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (66, '2015-09-06 07:51:54', '2018-11-25 11:23:02', NULL, '三件套】2023春秋季ins港风,', 3, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (67, '2001-08-25 03:15:58', '2005-06-04 03:35:18', NULL, '日系复古夹克套装男春秋季', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (68, '2009-11-21 21:03:42', '2009-09-30 10:34:51', NULL, '笔记本电脑支架', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (69, '2003-06-09 14:24:59', '2012-02-13 08:46:21', NULL, '笔记本电脑支架增高散热架', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (70, '2008-10-21 21:29:13', '2015-09-02 22:40:10', NULL, '北京同仁堂蓝莓', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (71, '2015-07-06 13:26:51', '2008-04-29 06:44:46', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (72, '2007-01-02 11:33:12', '2022-11-05 14:21:18', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (73, '2001-04-10 11:48:04', '2021-08-18 18:42:48', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (74, '2008-01-30 17:24:56', '2003-04-23 20:27:53', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (75, '2014-04-18 07:29:58', '2016-01-07 09:18:33', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (76, '2004-06-26 15:54:48', '2009-07-23 03:23:01', NULL, '北京同仁堂正品人参黄精八', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (77, '2020-01-22 01:24:36', '2024-02-18 11:51:40', NULL, '小石头奥尔良小鸡腿鸡肉辣味零食小吃充饥夜宵整箱休闲即食食品肉', 3, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (78, '2018-06-21 22:57:50', '2015-02-28 12:16:29', NULL, '燃鸭鸭腿爆大腿麻香辣酱香网红大鸭腿开袋即食休闲零食小包装小吃', 3, '食品', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (79, '2020-05-28 01:12:08', '2010-02-01 05:16:00', NULL, '麻辣香辣八爪鱼爆头章鱼即食罐装小海鲜熟食扇贝生蚝鱿鱼须下饭菜', 3, '水果', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (80, '2017-06-26 13:00:17', '2007-03-01 06:45:46', NULL, '【特价60包】香辣鸭翅中盐焗卤味麻辣零食批发麻辣解馋小零食2包', 3, '水果', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (81, '2006-12-26 08:33:09', '2005-03-08 10:36:00', NULL, '盐焗翅中零食批发一整箱香辣鸡鸭翅中开袋即食解馋卤味独立包装', 3, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (82, '2005-04-09 21:58:14', '2011-01-09 17:25:33', NULL, '膳食蔬菜鸡胸肉肠开袋即食减0低脂高蛋白无淀粉健身代餐烤肠香肠', 3, '水果', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', '41.41', '41.41');
INSERT INTO `product` VALUES (83, '2007-05-29 11:16:47', '2001-04-29 06:34:38', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 3, '水果', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '51.64', '51.64');
INSERT INTO `product` VALUES (84, '2008-06-02 14:21:37', '2012-10-27 01:37:16', NULL, '白象五香卤蛋', 4, '水果', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', '21.87', '21.87');
INSERT INTO `product` VALUES (85, '2002-07-14 03:30:56', '2011-07-30 06:41:14', NULL, '0脂肪养麦方便面非油炸', 4, '水果', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (86, '2017-05-14 12:15:51', '2016-03-21 15:09:09', NULL, '【精品】正宗广西武鸣皇帝柑', 4, '男装', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-07-11/569aff09-c33d-4852-9b97-ece71f106586.jpeg?imageView2/2/w/1300/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (87, '2010-04-18 00:07:27', '2015-02-21 12:18:04', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 4, '男装', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-11-28/338f8036-2335-4171-ae84-e6ecec6d1701.png?imageView2/2/w/1300/q/80', '99.99', '99.99');
INSERT INTO `product` VALUES (88, '2008-05-09 18:47:34', '2004-04-10 09:47:22', NULL, '养庆堂桑', 4, '电脑', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-05-17/876fabd5-2e29-4ea9-ab9f-3a2ffc3002dd.jpeg?imageView2/2/w/1300/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (89, '2003-01-08 16:03:09', '2006-09-26 15:08:55', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 4, '电脑', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2021-06-11/60d710d4-2714-4465-a33d-b3de114868a4.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (90, '2018-08-06 05:23:07', '2014-10-16 01:32:37', NULL, '正宗四川春见耙耙柑橘子10', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-07-04/588218d7-8e95-44bd-a058-aa3a047f005d.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2022-10-15/d5baa14a-1849-4e23-8b72-c135c066aea5.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (91, '2013-01-21 16:18:44', '2015-06-16 09:18:41', NULL, '正宗雪梨河', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-11-23/b8b7fc4f-d4eb-495a-90c9-5974f080af07.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://commimg-1.pddpic.com/ad-promotion/2023-10-18/78a1c4ab-5762-4d7a-b710-27b90774da1e.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (92, '2004-04-05 13:57:47', '2013-03-19 05:58:47', NULL, '莲子心茶泡,水正品莲子芯干', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '29.99', '29.99');
INSERT INTO `product` VALUES (93, '2023-11-12 13:46:21', '2013-03-28 06:49:48', NULL, '三件套】2023春秋季ins港风,', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-11-13/7cf71590-b8fc-4510-b153-ea463c01fe9e.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (94, '2002-02-23 17:53:44', '2021-06-02 19:12:44', NULL, '小石头奥尔良小鸡腿鸡肉辣味零食小吃充饥夜宵整箱休闲即食食品肉', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img.pddpic.com/mms-material-img/2023-10-13/b56fc122-03b1-4197-8a1c-3db9c5744cab.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80', '19.99', '19.99');
INSERT INTO `product` VALUES (95, '2023-07-25 04:57:30', '2022-04-28 21:28:22', NULL, '燃鸭鸭腿爆大腿麻香辣酱香网红大鸭腿开袋即食休闲零食小包装小吃', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2024-02-20/1b7a9ba0-d3a1-4539-b4a4-49b6c39186bb.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '29.99', '29.99');
INSERT INTO `product` VALUES (96, '2020-06-11 03:06:40', '2023-09-18 02:08:24', NULL, '麻辣香辣八爪鱼爆头章鱼即食罐装小海鲜熟食扇贝生蚝鱿鱼须下饭菜', 4, '医药', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2022-08-27/f417f856-f8fe-4a44-a002-d43fc74f1d47.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (97, '2003-09-19 18:53:54', '2005-02-20 20:18:05', NULL, '【特价60包】香辣鸭翅中盐焗卤味麻辣零食批发麻辣解馋小零食2包', 5, '食品', 'https://img-1.pddpic.com/mms-material-img/2023-09-27/c2a54d98-181c-45a6-9839-c6ee136ba009.png?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', 'https://img-1.pddpic.com/mms-material-img/2023-12-28/3282d4a0-964a-42d5-bc4b-6aa04a88ac1a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (98, '2004-04-01 23:24:30', '2009-06-13 20:06:49', NULL, '盐焗翅中零食批发一整箱香辣鸡鸭翅中开袋即食解馋卤味独立包装', 5, '食品', 'https://img.pddpic.com/mms-material-img/2023-05-08/90ab5d27-a788-404d-958d-31f376d93687.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/mms-material-img/2022-08-20/c752fbb3-94e0-4c28-bff4-589b9db40f01.jpeg.a.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '99.99', '99.99');
INSERT INTO `product` VALUES (99, '2022-07-17 00:48:56', '2014-03-14 02:21:00', NULL, '膳食蔬菜鸡胸肉肠开袋即食减0低脂高蛋白无淀粉健身代餐烤肠香肠', 5, '食品', 'https://img.pddpic.com/mms-material-img/2024-01-15/f8c21be2-6627-4177-9e11-a6716ca91355.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/open-gw/2023-12-03/7174d303-b6e2-44c0-ac5c-a344ed3688c2.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');
INSERT INTO `product` VALUES (100, '2011-10-05 10:31:44', '2022-06-01 02:26:49', NULL, '正宗沃柑橘子薄皮桔子孕妇新鲜水果批发包邮非广西武鸣沃柑礼盒装', 5, '食品', 'https://img.pddpic.com/mms-material-img/2020-11-24/1e0945db-1088-44fa-b822-5618628fb726.jpeg.a.jpeg?imageView2/2/w/1300/q/80', 'https://img-1.pddpic.com/open-gw/2023-09-06/288b59b5-6cf6-49ba-8c96-2c6bc715fbcc.jpeg?imageMogr2/thumbnail/400x%7CimageView2/2/w/400/q/80/format/webp', '19.99', '19.99');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_img_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES (1, '2012-08-27 21:51:04', '2023-03-29 06:39:34', NULL, 289, 'J1Wp6WVbtX');
INSERT INTO `product_img` VALUES (2, '2020-09-01 03:37:15', '2009-10-08 13:34:27', NULL, 7, 'MlmqjL5KTw');
INSERT INTO `product_img` VALUES (3, '2005-08-25 00:08:59', '2006-06-13 13:19:43', NULL, 788, 'h8oK8bFuxr');
INSERT INTO `product_img` VALUES (4, '2016-07-23 15:59:25', '2016-07-12 10:48:39', NULL, 295, 'JapSSJuQ1V');
INSERT INTO `product_img` VALUES (5, '2015-03-23 08:27:43', '2005-02-04 18:21:16', NULL, 487, 'ZcCBA7hAWm');
INSERT INTO `product_img` VALUES (6, '2007-07-26 15:53:20', '2002-11-01 14:39:50', NULL, 769, '7bFQPY483O');
INSERT INTO `product_img` VALUES (7, '2010-07-30 03:02:17', '2011-07-15 18:20:43', NULL, 259, 'qpLWfthXbH');
INSERT INTO `product_img` VALUES (8, '2016-08-04 15:15:41', '2011-09-23 11:59:00', NULL, 206, 'qODp9gpMV4');
INSERT INTO `product_img` VALUES (9, '2006-11-10 03:10:34', '2000-01-10 07:26:38', NULL, 119, '8V3Bnyt8Qf');
INSERT INTO `product_img` VALUES (10, '2022-10-15 10:13:41', '2007-03-25 06:36:51', NULL, 998, 'Ah5sdTGFjV');
INSERT INTO `product_img` VALUES (11, '2006-06-22 18:56:40', '2004-02-04 18:47:23', NULL, 695, 'rhjIDKCaxe');
INSERT INTO `product_img` VALUES (12, '2015-06-20 07:13:46', '2002-11-28 09:53:05', NULL, 890, '5794WH33mH');
INSERT INTO `product_img` VALUES (13, '2010-12-28 01:29:12', '2013-12-01 10:27:51', NULL, 614, 'SUsspewQXC');
INSERT INTO `product_img` VALUES (14, '2004-10-23 05:49:55', '2012-09-22 13:19:31', NULL, 488, 'eOY1MOGjPO');
INSERT INTO `product_img` VALUES (15, '2023-01-07 20:15:19', '2021-07-17 06:22:16', NULL, 594, '5HCWtM2nRc');
INSERT INTO `product_img` VALUES (16, '2011-10-02 06:59:40', '2007-12-12 19:51:49', NULL, 789, 'QTqmFwOLAU');
INSERT INTO `product_img` VALUES (17, '2017-09-01 09:31:33', '2017-09-14 07:06:22', NULL, 904, 'Lhqza85qfl');
INSERT INTO `product_img` VALUES (18, '2023-06-26 06:34:15', '2014-03-26 18:15:05', NULL, 398, 'iGpG1A7pWD');
INSERT INTO `product_img` VALUES (19, '2010-08-12 20:27:56', '2023-05-12 17:25:45', NULL, 385, 'JlLf9PrT2c');
INSERT INTO `product_img` VALUES (20, '2016-07-12 18:04:06', '2016-05-02 13:03:07', NULL, 819, '4IyS47f8Xs');
INSERT INTO `product_img` VALUES (21, '2009-08-08 04:15:58', '2010-11-28 22:09:15', NULL, 774, 'UkJ8bEPO1g');
INSERT INTO `product_img` VALUES (22, '2006-08-31 10:39:28', '2005-11-02 16:56:00', NULL, 491, 'oR1dpcgeA6');
INSERT INTO `product_img` VALUES (23, '2024-04-07 14:25:10', '2017-08-15 18:23:34', NULL, 30, '9rjrFTVj57');
INSERT INTO `product_img` VALUES (24, '2013-07-25 03:46:22', '2020-10-27 06:40:37', NULL, 995, '7RPc2TYT8x');
INSERT INTO `product_img` VALUES (25, '2018-05-15 01:48:38', '2009-11-01 05:41:05', NULL, 264, 'iGx8Jlvsxn');
INSERT INTO `product_img` VALUES (26, '2006-01-19 22:54:35', '2022-04-13 22:14:20', NULL, 836, 'k1Uqn4Xy4R');
INSERT INTO `product_img` VALUES (27, '2023-03-04 09:15:48', '2000-07-01 08:37:50', NULL, 310, 'lbW9t1b19j');
INSERT INTO `product_img` VALUES (28, '2006-04-11 14:56:48', '2012-11-25 05:43:45', NULL, 400, '7JuW4A9aTs');
INSERT INTO `product_img` VALUES (29, '2008-10-19 06:47:44', '2012-09-02 15:30:31', NULL, 468, 'c3rWkupP8G');
INSERT INTO `product_img` VALUES (30, '2006-01-11 12:48:27', '2003-01-06 20:33:27', NULL, 642, 'nfkM6dqTvM');
INSERT INTO `product_img` VALUES (31, '2006-12-11 01:17:06', '2018-01-12 15:51:45', NULL, 407, 'O3OrB1u7rr');
INSERT INTO `product_img` VALUES (32, '2011-09-01 18:34:26', '2001-09-11 18:50:34', NULL, 272, 'RNEvjaZkWw');
INSERT INTO `product_img` VALUES (33, '2016-09-07 14:13:49', '2000-01-31 14:30:31', NULL, 74, 'We9WjxZAkQ');
INSERT INTO `product_img` VALUES (34, '2008-08-18 05:27:50', '2004-11-21 14:36:27', NULL, 531, 'X8jVKkRazz');
INSERT INTO `product_img` VALUES (35, '2016-10-31 16:17:52', '2003-12-23 00:59:53', NULL, 132, 'Dev8Gk4Wmx');
INSERT INTO `product_img` VALUES (36, '2023-06-29 03:52:47', '2016-02-02 02:02:23', NULL, 155, 'i8kKofFEwG');
INSERT INTO `product_img` VALUES (37, '2017-01-07 19:53:09', '2007-05-20 08:27:00', NULL, 153, 'E2kVpw2SUW');
INSERT INTO `product_img` VALUES (38, '2004-11-02 10:29:59', '2007-04-07 23:37:34', NULL, 690, 'ZvSYXvKLAV');
INSERT INTO `product_img` VALUES (39, '2002-05-29 06:07:00', '2024-03-11 07:06:36', NULL, 626, 'RfFGCoDSa5');
INSERT INTO `product_img` VALUES (40, '2019-01-18 18:24:20', '2019-03-29 14:05:29', NULL, 496, 'ofMob4eLkK');
INSERT INTO `product_img` VALUES (41, '2012-03-25 18:13:30', '2021-10-06 02:43:05', NULL, 420, 'D23jHlXu7z');
INSERT INTO `product_img` VALUES (42, '2014-02-02 11:42:29', '2013-06-10 09:36:27', NULL, 971, 'TMDk7vNnbQ');
INSERT INTO `product_img` VALUES (43, '2006-04-07 23:33:46', '2011-01-07 04:55:25', NULL, 63, 'CIkyFm8Gln');
INSERT INTO `product_img` VALUES (44, '2004-10-12 22:28:55', '2024-01-08 05:34:23', NULL, 935, 'm5lq5UxB8w');
INSERT INTO `product_img` VALUES (45, '2006-05-05 12:10:17', '2006-05-01 15:10:57', NULL, 812, 'Gs78id3hII');
INSERT INTO `product_img` VALUES (46, '2008-07-22 18:22:36', '2020-02-18 10:01:50', NULL, 22, '4rmZbjoaA2');
INSERT INTO `product_img` VALUES (47, '2010-03-06 19:36:33', '2023-11-27 12:58:51', NULL, 557, 'ur1VBzw2DT');
INSERT INTO `product_img` VALUES (48, '2019-07-04 09:09:05', '2019-03-21 10:39:29', NULL, 266, 'Hlh0DPcwPw');
INSERT INTO `product_img` VALUES (49, '2010-07-29 07:24:17', '2005-05-07 17:23:41', NULL, 596, 'ZIoCkIs777');
INSERT INTO `product_img` VALUES (50, '2018-10-09 00:08:30', '2008-06-19 06:23:08', NULL, 175, 'o7357om953');
INSERT INTO `product_img` VALUES (51, '2014-02-11 06:10:23', '2012-10-24 20:18:39', NULL, 974, 'Ovi4abToXP');
INSERT INTO `product_img` VALUES (52, '2017-08-13 21:42:06', '2012-06-04 07:07:28', NULL, 926, 'A5yiTnTG2s');
INSERT INTO `product_img` VALUES (53, '2018-03-03 15:54:36', '2020-07-28 01:23:03', NULL, 536, 'KmGO4lGeea');
INSERT INTO `product_img` VALUES (54, '2015-12-18 08:08:24', '2000-06-15 10:58:41', NULL, 873, 'mkmLZqw1Zs');
INSERT INTO `product_img` VALUES (55, '2022-07-19 03:03:19', '2003-11-04 09:27:24', NULL, 931, 'DHitot7z0Y');
INSERT INTO `product_img` VALUES (56, '2009-06-12 20:33:39', '2014-01-19 06:47:27', NULL, 994, 'h59jrVWHKU');
INSERT INTO `product_img` VALUES (57, '2004-09-15 02:35:43', '2000-10-15 05:15:33', NULL, 4, 'sTj5XdNaQd');
INSERT INTO `product_img` VALUES (58, '2000-05-13 15:25:30', '2022-06-28 09:13:35', NULL, 549, 'PQUGVsfrcM');
INSERT INTO `product_img` VALUES (59, '2010-03-31 09:51:55', '2020-09-20 20:15:43', NULL, 836, 'CcOrWo5vTC');
INSERT INTO `product_img` VALUES (60, '2023-01-17 00:05:25', '2018-02-13 09:04:56', NULL, 398, 'gk7BEf7BdY');
INSERT INTO `product_img` VALUES (61, '2019-11-30 20:01:15', '2008-12-02 04:45:44', NULL, 708, 'yURQHFovTe');
INSERT INTO `product_img` VALUES (62, '2017-04-06 17:54:20', '2004-05-05 11:39:17', NULL, 174, 'aCN3lKQumf');
INSERT INTO `product_img` VALUES (63, '2017-04-08 16:49:15', '2020-01-16 00:23:07', NULL, 172, 'EItSUPGTiN');
INSERT INTO `product_img` VALUES (64, '2015-03-08 07:16:27', '2010-01-04 23:54:09', NULL, 944, 'tkFlkb3YYM');
INSERT INTO `product_img` VALUES (65, '2017-07-27 05:34:09', '2016-12-09 11:40:34', NULL, 147, '09bPUJkBfk');
INSERT INTO `product_img` VALUES (66, '2021-06-27 07:30:40', '2020-01-16 02:57:38', NULL, 561, 'XinsWj8k1g');
INSERT INTO `product_img` VALUES (67, '2002-06-03 13:54:32', '2003-12-11 00:54:42', NULL, 451, '5GjFiCdOBV');
INSERT INTO `product_img` VALUES (68, '2002-09-30 02:20:20', '2003-01-23 02:04:38', NULL, 484, '4boPIcCayQ');
INSERT INTO `product_img` VALUES (69, '2005-02-26 19:28:53', '2002-09-23 18:38:48', NULL, 992, '3MiayMIZCA');
INSERT INTO `product_img` VALUES (70, '2022-03-31 05:05:33', '2009-07-27 09:48:34', NULL, 882, 'pNTCncUzMt');
INSERT INTO `product_img` VALUES (71, '2014-05-09 10:49:24', '2008-06-14 06:07:55', NULL, 4, 'IauxQTm2RW');
INSERT INTO `product_img` VALUES (72, '2008-01-04 23:42:10', '2005-05-01 10:14:51', NULL, 378, 'KFXAjLD9mk');
INSERT INTO `product_img` VALUES (73, '2019-07-16 09:22:24', '2003-06-22 19:49:07', NULL, 885, 'tKnr4rohkX');
INSERT INTO `product_img` VALUES (74, '2009-07-14 21:14:07', '2015-05-31 21:29:14', NULL, 24, 'VHd2xQOEUO');
INSERT INTO `product_img` VALUES (75, '2020-01-31 08:02:49', '2010-02-20 08:49:55', NULL, 744, 'owRhBiNRyu');
INSERT INTO `product_img` VALUES (76, '2003-10-20 10:49:10', '2003-07-28 08:20:12', NULL, 547, 'L91MlZRk5n');
INSERT INTO `product_img` VALUES (77, '2020-01-29 00:32:11', '2009-04-10 10:20:11', NULL, 127, 'r7aPlUKimw');
INSERT INTO `product_img` VALUES (78, '2011-11-28 04:50:44', '2017-01-31 09:01:45', NULL, 732, 'V84fdVUU7B');
INSERT INTO `product_img` VALUES (79, '2002-08-20 07:21:38', '2020-03-25 20:01:16', NULL, 734, 'wCJbZEaOoF');
INSERT INTO `product_img` VALUES (80, '2014-01-01 01:08:14', '2022-04-22 15:55:29', NULL, 665, 'OO46pLHRb5');
INSERT INTO `product_img` VALUES (81, '2008-10-05 03:19:12', '2000-11-15 09:53:41', NULL, 324, 'bgBb7MBSk0');
INSERT INTO `product_img` VALUES (82, '2001-08-01 01:14:12', '2017-08-07 21:02:33', NULL, 241, 'ciRx98LtGB');
INSERT INTO `product_img` VALUES (83, '2011-01-17 08:06:04', '2021-04-04 08:37:44', NULL, 606, 'nRKPm2CrUe');
INSERT INTO `product_img` VALUES (84, '2000-03-01 06:37:38', '2021-01-09 23:19:47', NULL, 649, 'FPicVMXB1V');
INSERT INTO `product_img` VALUES (85, '2023-12-11 11:02:15', '2016-11-01 22:31:57', NULL, 975, 'NrrXgIMq4H');
INSERT INTO `product_img` VALUES (86, '2001-02-19 10:51:41', '2007-07-12 03:02:14', NULL, 10, 'nRUIKf3N1q');
INSERT INTO `product_img` VALUES (87, '2014-08-10 03:10:11', '2012-01-28 05:53:39', NULL, 923, 'TLiLtasjFl');
INSERT INTO `product_img` VALUES (88, '2014-03-15 18:08:49', '2019-11-28 00:06:16', NULL, 927, 'DQKmMtuZOx');
INSERT INTO `product_img` VALUES (89, '2019-12-21 18:06:19', '2014-02-03 10:13:43', NULL, 168, 'AlMcQxyFZy');
INSERT INTO `product_img` VALUES (90, '2006-12-04 00:48:27', '2018-09-12 15:53:17', NULL, 787, '9KB6KsWX0p');
INSERT INTO `product_img` VALUES (91, '2004-01-16 03:16:31', '2000-05-16 15:03:17', NULL, 807, 'FfBEl8xwOe');
INSERT INTO `product_img` VALUES (92, '2009-11-08 15:26:02', '2017-04-28 17:28:06', NULL, 28, 'x5BJcqn9tl');
INSERT INTO `product_img` VALUES (93, '2022-12-07 00:02:04', '2016-11-18 16:13:25', NULL, 520, 'j9zQw6ax0c');
INSERT INTO `product_img` VALUES (94, '2011-08-18 21:58:39', '2014-04-06 16:22:32', NULL, 922, '8ajFRFQG4V');
INSERT INTO `product_img` VALUES (95, '2023-03-28 16:41:01', '2002-04-16 05:21:00', NULL, 35, '8ifh1BARRz');
INSERT INTO `product_img` VALUES (96, '2002-08-21 20:15:20', '2012-01-28 12:47:50', NULL, 18, 'OMGGSTth94');
INSERT INTO `product_img` VALUES (97, '2011-01-11 03:52:12', '2010-07-16 15:23:50', NULL, 110, 'stzQj1FFPz');
INSERT INTO `product_img` VALUES (98, '2002-10-02 09:30:55', '2005-12-06 06:56:51', NULL, 642, 'Q3jKx6NMtA');
INSERT INTO `product_img` VALUES (99, '2011-08-17 04:15:13', '2019-01-12 11:08:26', NULL, 804, 'ANKuzoBvWg');
INSERT INTO `product_img` VALUES (100, '2011-06-18 05:14:20', '2006-04-27 11:39:30', NULL, 908, 'Og3s219LaH');

-- ----------------------------
-- Table structure for product_info_img
-- ----------------------------
DROP TABLE IF EXISTS `product_info_img`;
CREATE TABLE `product_info_img`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_info_img_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info_img
-- ----------------------------
INSERT INTO `product_info_img` VALUES (1, '2013-11-23 15:25:19', '2024-01-31 16:45:14', NULL, 261, 'psiYvdzv6O');
INSERT INTO `product_info_img` VALUES (2, '2000-03-29 11:10:43', '2007-03-10 06:13:01', NULL, 756, 'hWZqjuTaAL');
INSERT INTO `product_info_img` VALUES (3, '2018-09-21 10:32:58', '2019-11-05 09:03:23', NULL, 947, 'LKwWcTv7P1');
INSERT INTO `product_info_img` VALUES (4, '2021-04-02 17:30:02', '2021-05-31 14:01:25', NULL, 591, 'sKvFAHTShH');
INSERT INTO `product_info_img` VALUES (5, '2018-02-21 04:44:57', '2019-07-06 18:21:34', NULL, 907, 'Q3hrBfqvRd');
INSERT INTO `product_info_img` VALUES (6, '2021-04-02 01:46:11', '2009-09-21 11:16:37', NULL, 186, 'tiTDzskPfT');
INSERT INTO `product_info_img` VALUES (7, '2012-12-16 18:44:32', '2013-06-08 19:27:27', NULL, 983, 'xBt97DQ4kt');
INSERT INTO `product_info_img` VALUES (8, '2005-07-31 00:24:14', '2010-01-17 12:20:12', NULL, 894, 'BZS5FLddgR');
INSERT INTO `product_info_img` VALUES (9, '2015-06-14 17:25:39', '2006-08-09 20:22:37', NULL, 109, 'klu0fxkcgR');
INSERT INTO `product_info_img` VALUES (10, '2008-07-23 09:47:57', '2010-11-18 05:56:54', NULL, 379, '3rMdmygRoz');
INSERT INTO `product_info_img` VALUES (11, '2013-03-15 06:10:25', '2023-01-01 12:58:43', NULL, 960, 'nAIujcY28H');
INSERT INTO `product_info_img` VALUES (12, '2013-09-22 07:50:35', '2020-01-08 20:21:00', NULL, 86, 'lhN0y0EoZP');
INSERT INTO `product_info_img` VALUES (13, '2012-11-25 06:26:46', '2011-07-15 18:49:28', NULL, 445, 'tiDUgWJzgV');
INSERT INTO `product_info_img` VALUES (14, '2004-11-24 12:19:29', '2007-07-14 12:19:01', NULL, 16, 'PsGVQclXnf');
INSERT INTO `product_info_img` VALUES (15, '2023-07-20 14:16:05', '2000-07-02 01:19:56', NULL, 965, 'HjR07utrxg');
INSERT INTO `product_info_img` VALUES (16, '2018-09-28 13:20:19', '2000-11-03 14:13:53', NULL, 319, 'je9zGUgreM');
INSERT INTO `product_info_img` VALUES (17, '2005-07-14 17:22:38', '2013-03-26 11:08:35', NULL, 552, 'WmwXBZtCPf');
INSERT INTO `product_info_img` VALUES (18, '2016-04-22 19:21:44', '2001-02-02 06:04:26', NULL, 715, 'po2wFtBI2b');
INSERT INTO `product_info_img` VALUES (19, '2012-09-21 08:21:12', '2015-09-30 08:26:32', NULL, 262, 'HZcPGdBlpA');
INSERT INTO `product_info_img` VALUES (20, '2011-10-27 21:27:25', '2011-09-18 00:39:14', NULL, 910, 'i4sF8MYdiz');
INSERT INTO `product_info_img` VALUES (21, '2019-12-01 15:42:52', '2021-03-16 22:52:24', NULL, 733, 'ANXqWgCefp');
INSERT INTO `product_info_img` VALUES (22, '2003-03-09 10:07:35', '2004-09-27 12:16:39', NULL, 679, 'za2SnpDOKl');
INSERT INTO `product_info_img` VALUES (23, '2017-03-09 03:13:07', '2015-08-20 00:33:12', NULL, 447, 'KLFylXujd8');
INSERT INTO `product_info_img` VALUES (24, '2012-07-16 06:06:49', '2014-07-11 22:41:32', NULL, 252, 'axgNrJCofU');
INSERT INTO `product_info_img` VALUES (25, '2023-10-29 20:21:35', '2019-04-04 15:19:33', NULL, 143, 'LEK5zcNAXu');
INSERT INTO `product_info_img` VALUES (26, '2006-07-02 21:16:31', '2008-03-10 14:52:48', NULL, 772, 'acg7aKDGLq');
INSERT INTO `product_info_img` VALUES (27, '2016-02-25 11:36:31', '2005-11-02 10:44:37', NULL, 741, 'yVYu9fAlCa');
INSERT INTO `product_info_img` VALUES (28, '2021-05-19 00:39:26', '2016-11-19 17:23:47', NULL, 73, 'DQV3dlUdIe');
INSERT INTO `product_info_img` VALUES (29, '2006-02-21 23:24:23', '2004-05-07 03:32:22', NULL, 272, 'XBKswKbREJ');
INSERT INTO `product_info_img` VALUES (30, '2020-06-15 14:37:42', '2023-07-19 22:25:55', NULL, 364, '028gOIm6Oz');
INSERT INTO `product_info_img` VALUES (31, '2012-08-01 13:43:47', '2017-07-06 03:54:48', NULL, 402, 'FCWwLNWCmV');
INSERT INTO `product_info_img` VALUES (32, '2007-11-20 17:40:35', '2010-06-26 11:29:44', NULL, 386, 'hdfGtEKUh4');
INSERT INTO `product_info_img` VALUES (33, '2018-12-26 11:05:58', '2011-09-28 19:28:54', NULL, 792, 'pHGXtTUi1e');
INSERT INTO `product_info_img` VALUES (34, '2010-03-13 10:10:29', '2005-12-30 18:57:49', NULL, 837, 'qMkvDKq0rV');
INSERT INTO `product_info_img` VALUES (35, '2005-10-19 14:56:45', '2017-09-04 17:12:46', NULL, 535, 'plqGFpb3IF');
INSERT INTO `product_info_img` VALUES (36, '2010-10-24 21:57:35', '2023-12-31 18:15:57', NULL, 908, 'zqqS9JY8Vp');
INSERT INTO `product_info_img` VALUES (37, '2000-01-07 00:53:47', '2012-04-10 11:49:15', NULL, 201, 'FLjTtgbzEg');
INSERT INTO `product_info_img` VALUES (38, '2004-04-19 12:56:03', '2017-08-08 00:11:13', NULL, 368, '5Yesdi4rGe');
INSERT INTO `product_info_img` VALUES (39, '2004-01-09 04:36:17', '2016-07-23 12:17:42', NULL, 315, '3NxPTILQlf');
INSERT INTO `product_info_img` VALUES (40, '2016-10-11 06:53:06', '2009-12-02 04:12:43', NULL, 341, 'w97fXWIea3');
INSERT INTO `product_info_img` VALUES (41, '2002-09-05 03:20:40', '2001-10-07 17:37:21', NULL, 491, 'qnGqvWAm4f');
INSERT INTO `product_info_img` VALUES (42, '2006-08-04 02:26:47', '2014-01-19 13:31:37', NULL, 365, 'xGo65p0bll');
INSERT INTO `product_info_img` VALUES (43, '2019-03-28 18:41:13', '2016-03-17 08:58:01', NULL, 124, 'zyWcxOW93m');
INSERT INTO `product_info_img` VALUES (44, '2001-05-02 01:47:52', '2002-03-04 18:03:39', NULL, 767, 'CW7R4Zm1Uo');
INSERT INTO `product_info_img` VALUES (45, '2012-02-24 10:49:00', '2016-07-01 02:08:26', NULL, 425, 'CYuDRXGNZg');
INSERT INTO `product_info_img` VALUES (46, '2016-10-22 16:37:48', '2014-11-02 18:33:16', NULL, 805, 'vIhx0CYsat');
INSERT INTO `product_info_img` VALUES (47, '2006-07-02 12:35:36', '2014-10-08 23:41:31', NULL, 274, 'v4ovIy03YR');
INSERT INTO `product_info_img` VALUES (48, '2001-01-09 06:47:16', '2014-01-08 08:57:21', NULL, 338, 'aeKzxZdjMi');
INSERT INTO `product_info_img` VALUES (49, '2004-05-03 19:12:13', '2021-06-16 07:32:54', NULL, 827, 'ph8Nc4WON9');
INSERT INTO `product_info_img` VALUES (50, '2018-10-09 08:08:43', '2002-05-26 23:41:48', NULL, 330, 'YrpQzTP9vo');
INSERT INTO `product_info_img` VALUES (51, '2004-04-11 13:39:05', '2018-02-20 01:19:21', NULL, 735, '0iaQGfk4qV');
INSERT INTO `product_info_img` VALUES (52, '2000-07-04 09:39:30', '2002-01-19 11:19:24', NULL, 326, 'L2N4tZSVEU');
INSERT INTO `product_info_img` VALUES (53, '2008-05-30 16:00:20', '2020-08-07 15:39:25', NULL, 645, 'EpbgNFdDQY');
INSERT INTO `product_info_img` VALUES (54, '2013-06-25 14:51:54', '2023-06-29 00:36:34', NULL, 31, 'gJY8LXkywk');
INSERT INTO `product_info_img` VALUES (55, '2005-07-25 17:02:11', '2016-02-10 15:59:18', NULL, 1, '4W2KJ4Ai5Y');
INSERT INTO `product_info_img` VALUES (56, '2022-07-04 11:22:51', '2010-06-24 17:31:11', NULL, 53, 'rvOB2QPUx2');
INSERT INTO `product_info_img` VALUES (57, '2016-08-05 09:14:10', '2019-10-19 08:56:06', NULL, 223, '8Uw9OMq1Pv');
INSERT INTO `product_info_img` VALUES (58, '2023-10-31 08:54:20', '2003-05-31 13:42:03', NULL, 881, 'nOY634H1qr');
INSERT INTO `product_info_img` VALUES (59, '2010-06-21 19:45:54', '2010-10-15 20:02:19', NULL, 615, 'VbKJ1mQZDe');
INSERT INTO `product_info_img` VALUES (60, '2018-02-28 09:56:03', '2006-11-23 15:58:40', NULL, 701, 'rHRuTq91wJ');
INSERT INTO `product_info_img` VALUES (61, '2013-12-22 18:51:39', '2008-12-10 19:54:00', NULL, 569, 'FnlNfHGRMp');
INSERT INTO `product_info_img` VALUES (62, '2001-06-28 01:26:02', '2015-05-02 07:16:14', NULL, 790, 'aMxFQdQcLA');
INSERT INTO `product_info_img` VALUES (63, '2004-08-27 14:11:18', '2015-06-19 18:46:25', NULL, 709, 'zrkE6uZQ2z');
INSERT INTO `product_info_img` VALUES (64, '2010-11-08 11:24:42', '2005-05-26 09:10:15', NULL, 233, 'iDR9qFe3gE');
INSERT INTO `product_info_img` VALUES (65, '2000-05-05 16:05:30', '2013-02-11 00:38:20', NULL, 462, 'YtTuILHDOS');
INSERT INTO `product_info_img` VALUES (66, '2015-07-22 05:08:25', '2010-06-16 10:37:04', NULL, 458, '8lPy8Zd1Hq');
INSERT INTO `product_info_img` VALUES (67, '2019-05-07 12:53:59', '2020-10-21 10:56:22', NULL, 877, 'ZbZ9cty54n');
INSERT INTO `product_info_img` VALUES (68, '2008-03-25 06:57:56', '2006-06-15 02:33:52', NULL, 137, 'DPFY6Xxpf3');
INSERT INTO `product_info_img` VALUES (69, '2003-12-27 07:33:45', '2014-02-05 23:22:15', NULL, 123, 'inTGWUbESN');
INSERT INTO `product_info_img` VALUES (70, '2000-03-25 04:47:43', '2023-04-19 20:02:16', NULL, 119, '38jl9DTva1');
INSERT INTO `product_info_img` VALUES (71, '2002-03-08 18:17:30', '2018-04-06 16:45:13', NULL, 243, 'wXTKRdapB0');
INSERT INTO `product_info_img` VALUES (72, '2023-10-16 22:52:15', '2018-05-23 00:21:19', NULL, 20, 'OiNc90KESE');
INSERT INTO `product_info_img` VALUES (73, '2019-11-13 12:59:09', '2003-05-05 22:44:19', NULL, 669, 'MCpIVmajUJ');
INSERT INTO `product_info_img` VALUES (74, '2012-10-06 19:21:40', '2006-01-10 23:31:07', NULL, 776, '73ZMCwHogj');
INSERT INTO `product_info_img` VALUES (75, '2014-02-14 22:19:05', '2019-11-02 04:33:48', NULL, 60, '2XU0NfEjZg');
INSERT INTO `product_info_img` VALUES (76, '2008-06-05 14:12:33', '2005-05-18 18:57:28', NULL, 973, '5Ud3BAOIR0');
INSERT INTO `product_info_img` VALUES (77, '2009-03-20 13:47:04', '2002-03-19 07:14:34', NULL, 268, '746cy1JQIm');
INSERT INTO `product_info_img` VALUES (78, '2013-10-31 03:23:28', '2017-06-19 01:25:25', NULL, 753, 'IZyuTp0MdQ');
INSERT INTO `product_info_img` VALUES (79, '2020-02-02 06:29:56', '2000-01-20 11:46:48', NULL, 232, 'lOAyn5k1lj');
INSERT INTO `product_info_img` VALUES (80, '2013-01-29 04:12:44', '2000-08-20 09:57:18', NULL, 54, 'bC2Rec1agy');
INSERT INTO `product_info_img` VALUES (81, '2013-03-27 05:57:23', '2024-03-26 15:42:07', NULL, 735, 'tw5JOB30dA');
INSERT INTO `product_info_img` VALUES (82, '2019-11-27 08:22:33', '2018-05-24 20:42:12', NULL, 380, 'O3CATrYjhd');
INSERT INTO `product_info_img` VALUES (83, '2006-04-14 10:44:03', '2015-06-02 11:29:36', NULL, 610, 'RjMj3SIr10');
INSERT INTO `product_info_img` VALUES (84, '2018-08-21 11:01:58', '2007-03-19 18:31:37', NULL, 807, 'dZFDpoYFja');
INSERT INTO `product_info_img` VALUES (85, '2023-04-04 11:30:00', '2009-01-15 13:38:03', NULL, 162, 'ANv64p9ZU6');
INSERT INTO `product_info_img` VALUES (86, '2008-11-29 21:27:20', '2002-04-05 19:30:42', NULL, 763, 'rQAv15Yb9O');
INSERT INTO `product_info_img` VALUES (87, '2017-06-07 07:09:55', '2020-10-26 15:40:40', NULL, 183, 'GkKmjFg24m');
INSERT INTO `product_info_img` VALUES (88, '2017-05-11 13:52:31', '2011-06-08 16:22:33', NULL, 207, 'vqHZlcohkP');
INSERT INTO `product_info_img` VALUES (89, '2010-06-14 15:47:45', '2002-10-27 04:00:03', NULL, 14, 'dQVNqpWJaN');
INSERT INTO `product_info_img` VALUES (90, '2000-06-30 08:10:51', '2015-06-01 11:29:44', NULL, 164, 'H2XKt5oFXj');
INSERT INTO `product_info_img` VALUES (91, '2007-06-02 05:49:53', '2000-08-09 05:27:03', NULL, 27, 'zydu1hbEmQ');
INSERT INTO `product_info_img` VALUES (92, '2019-11-25 17:57:57', '2020-07-17 23:14:08', NULL, 372, 'nYeJzCqdzN');
INSERT INTO `product_info_img` VALUES (93, '2023-04-28 04:37:07', '2013-05-27 06:38:49', NULL, 711, 'AJRZbB8ouf');
INSERT INTO `product_info_img` VALUES (94, '2000-11-22 07:29:21', '2006-06-15 08:28:00', NULL, 137, '3yRRZxM48u');
INSERT INTO `product_info_img` VALUES (95, '2004-03-04 08:21:09', '2002-12-01 21:11:27', NULL, 710, 'vplpoMOw4q');
INSERT INTO `product_info_img` VALUES (96, '2000-10-21 11:27:03', '2020-02-04 02:17:09', NULL, 466, 'WDpA0R69XF');
INSERT INTO `product_info_img` VALUES (97, '2022-05-07 21:01:51', '2000-12-01 21:18:13', NULL, 81, 'x263QxTBjR');
INSERT INTO `product_info_img` VALUES (98, '2001-10-29 09:26:34', '2009-05-17 09:01:19', NULL, 990, '7Eq6zdG1mw');
INSERT INTO `product_info_img` VALUES (99, '2004-07-29 03:59:16', '2021-12-12 21:41:14', NULL, 546, 'XsFSS1l1dM');
INSERT INTO `product_info_img` VALUES (100, '2008-09-28 02:48:59', '2011-11-22 08:08:21', NULL, 249, 'aeDKqAQIPT');

-- ----------------------------
-- Table structure for product_param_img
-- ----------------------------
DROP TABLE IF EXISTS `product_param_img`;
CREATE TABLE `product_param_img`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_param_img_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_param_img
-- ----------------------------
INSERT INTO `product_param_img` VALUES (1, '2023-06-03 20:39:21', '2020-02-03 02:19:58', NULL, 315, 'qESasPnCS4');
INSERT INTO `product_param_img` VALUES (2, '2021-07-05 18:17:00', '2002-12-26 21:48:31', NULL, 548, 'z9N3B0hApI');
INSERT INTO `product_param_img` VALUES (3, '2000-07-30 00:59:15', '2002-09-16 03:53:48', NULL, 452, '3GvxLGhw8b');
INSERT INTO `product_param_img` VALUES (4, '2008-05-04 03:17:08', '2002-04-03 09:21:11', NULL, 41, 'tBeQeDtTkP');
INSERT INTO `product_param_img` VALUES (5, '2002-12-11 10:36:47', '2000-09-09 20:29:30', NULL, 193, 'JWsPcu5jWd');
INSERT INTO `product_param_img` VALUES (6, '2015-03-21 01:58:34', '2022-08-22 23:35:45', NULL, 774, 'eXIEF7d4U4');
INSERT INTO `product_param_img` VALUES (7, '2021-05-31 00:42:41', '2018-10-20 04:01:56', NULL, 396, 'lvwDzNu1cU');
INSERT INTO `product_param_img` VALUES (8, '2012-10-29 14:23:05', '2021-02-21 02:04:45', NULL, 776, 'sDwtoGcFxA');
INSERT INTO `product_param_img` VALUES (9, '2024-01-26 01:48:23', '2014-03-21 04:10:14', NULL, 209, 'lzjoqqEnhL');
INSERT INTO `product_param_img` VALUES (10, '2018-09-22 04:16:19', '2001-10-14 20:07:20', NULL, 170, 'tWChP2uw9y');
INSERT INTO `product_param_img` VALUES (11, '2012-07-16 01:33:41', '2013-12-20 11:45:39', NULL, 659, 'cLydkPgdwP');
INSERT INTO `product_param_img` VALUES (12, '2012-05-25 13:38:39', '2007-01-19 14:28:41', NULL, 543, 'MU4E7Artw3');
INSERT INTO `product_param_img` VALUES (13, '2012-11-16 19:48:54', '2020-12-21 12:17:31', NULL, 416, 'ZRctQcSs4o');
INSERT INTO `product_param_img` VALUES (14, '2019-09-26 11:40:27', '2004-08-09 15:02:22', NULL, 798, 'wZwmOVlfSg');
INSERT INTO `product_param_img` VALUES (15, '2013-01-17 20:04:21', '2018-10-04 12:13:34', NULL, 359, 'DXwjViNt4y');
INSERT INTO `product_param_img` VALUES (16, '2008-01-23 22:16:50', '2011-04-12 18:41:50', NULL, 139, 'ODh09bhnkM');
INSERT INTO `product_param_img` VALUES (17, '2016-09-01 21:46:42', '2019-08-29 23:14:14', NULL, 809, 'klYtY1eyYt');
INSERT INTO `product_param_img` VALUES (18, '2003-01-23 10:23:17', '2010-12-12 11:26:57', NULL, 235, 'kzB3KoTs0y');
INSERT INTO `product_param_img` VALUES (19, '2019-08-21 03:14:40', '2012-09-19 09:03:24', NULL, 922, 'nKwDwi57wG');
INSERT INTO `product_param_img` VALUES (20, '2018-04-30 04:06:10', '2023-05-30 06:02:06', NULL, 294, 'TBjVgifx1o');
INSERT INTO `product_param_img` VALUES (21, '2005-09-22 10:10:57', '2016-05-12 19:06:50', NULL, 462, 'sFbBIHycag');
INSERT INTO `product_param_img` VALUES (22, '2021-06-04 10:29:29', '2009-07-22 07:37:28', NULL, 115, 'iowLTcC3VM');
INSERT INTO `product_param_img` VALUES (23, '2014-04-05 17:17:34', '2003-05-15 10:38:32', NULL, 64, 'B4rV2znzyt');
INSERT INTO `product_param_img` VALUES (24, '2009-01-30 17:12:50', '2010-11-30 19:25:34', NULL, 558, 'EamtuofWRZ');
INSERT INTO `product_param_img` VALUES (25, '2022-03-05 20:30:28', '2017-09-22 18:12:16', NULL, 876, 'vLxFeaPlcc');
INSERT INTO `product_param_img` VALUES (26, '2020-09-06 02:46:16', '2022-06-11 22:37:26', NULL, 288, 'DVF9IP6cte');
INSERT INTO `product_param_img` VALUES (27, '2007-12-13 12:24:44', '2012-10-19 06:27:20', NULL, 426, 'rR1arYaEEo');
INSERT INTO `product_param_img` VALUES (28, '2006-12-19 20:54:55', '2017-09-07 11:55:13', NULL, 614, 'kveFH10ayl');
INSERT INTO `product_param_img` VALUES (29, '2002-04-24 16:25:43', '2007-07-23 01:14:11', NULL, 309, 'UDGIf24VlZ');
INSERT INTO `product_param_img` VALUES (30, '2021-08-05 04:11:01', '2008-11-04 17:49:38', NULL, 172, 'ARgJrwgH2z');
INSERT INTO `product_param_img` VALUES (31, '2000-05-16 17:55:09', '2015-04-14 03:56:00', NULL, 793, 'zkvyBAH9sH');
INSERT INTO `product_param_img` VALUES (32, '2014-07-14 19:03:22', '2001-09-20 16:56:17', NULL, 819, 'LFfp9RdeiD');
INSERT INTO `product_param_img` VALUES (33, '2019-02-22 19:55:00', '2009-06-16 00:51:25', NULL, 565, '438GZDaqFd');
INSERT INTO `product_param_img` VALUES (34, '2009-09-07 15:53:26', '2009-03-30 23:32:39', NULL, 744, 'pxt3UNZNzM');
INSERT INTO `product_param_img` VALUES (35, '2005-04-03 13:29:24', '2006-02-13 17:05:09', NULL, 823, 'zFxYE5Uehk');
INSERT INTO `product_param_img` VALUES (36, '2007-10-26 16:50:50', '2009-02-28 01:41:16', NULL, 635, 'ixUuNTfO9i');
INSERT INTO `product_param_img` VALUES (37, '2003-11-20 02:26:42', '2021-05-03 11:05:10', NULL, 339, 'ZdEZJTvrBi');
INSERT INTO `product_param_img` VALUES (38, '2016-04-08 11:00:08', '2009-03-03 10:44:59', NULL, 607, '53Nc3PEr1y');
INSERT INTO `product_param_img` VALUES (39, '2018-08-07 20:40:36', '2000-01-01 01:47:19', NULL, 447, 'qeA9IaUTrn');
INSERT INTO `product_param_img` VALUES (40, '2001-09-20 15:54:22', '2015-09-19 05:56:45', NULL, 520, 'rbaMBh7G4u');
INSERT INTO `product_param_img` VALUES (41, '2002-10-29 05:12:45', '2006-01-03 11:59:25', NULL, 937, 'oEPUb7a2td');
INSERT INTO `product_param_img` VALUES (42, '2004-12-05 23:48:16', '2015-04-19 07:23:56', NULL, 421, '5KolO5g4u1');
INSERT INTO `product_param_img` VALUES (43, '2020-02-01 09:30:11', '2021-08-14 11:00:51', NULL, 698, 'I3TieIEpGf');
INSERT INTO `product_param_img` VALUES (44, '2015-02-13 16:56:22', '2006-10-26 10:15:15', NULL, 388, 'nsQtrKbha8');
INSERT INTO `product_param_img` VALUES (45, '2001-07-22 21:15:00', '2009-07-26 06:59:17', NULL, 932, 'jqfXbottp4');
INSERT INTO `product_param_img` VALUES (46, '2004-07-23 23:14:04', '2004-07-20 20:39:53', NULL, 375, '2ZoM9tzlB1');
INSERT INTO `product_param_img` VALUES (47, '2019-08-22 18:54:48', '2006-10-19 07:55:36', NULL, 994, '8xQheNtscv');
INSERT INTO `product_param_img` VALUES (48, '2001-08-31 16:41:21', '2014-02-06 16:18:41', NULL, 81, 'w6jBTYUHrx');
INSERT INTO `product_param_img` VALUES (49, '2003-11-27 10:28:31', '2016-02-11 23:01:31', NULL, 811, 'wBxFybPpr3');
INSERT INTO `product_param_img` VALUES (50, '2015-08-16 12:14:35', '2006-05-19 00:52:41', NULL, 12, '8qGMMNTEnb');
INSERT INTO `product_param_img` VALUES (51, '2003-06-19 23:42:20', '2010-07-02 01:21:23', NULL, 686, 'ceAARak3kC');
INSERT INTO `product_param_img` VALUES (52, '2023-01-16 06:18:13', '2021-03-24 17:21:49', NULL, 268, 'SNgfIM0mW9');
INSERT INTO `product_param_img` VALUES (53, '2018-03-16 06:12:50', '2001-06-24 00:28:59', NULL, 281, 'oC0OPqzhLl');
INSERT INTO `product_param_img` VALUES (54, '2008-06-11 01:46:53', '2014-07-28 05:34:37', NULL, 222, '6PKdDCs2i2');
INSERT INTO `product_param_img` VALUES (55, '2004-09-23 05:02:58', '2006-05-18 14:46:06', NULL, 210, '1Tetgw1TBL');
INSERT INTO `product_param_img` VALUES (56, '2017-11-07 20:58:48', '2021-09-13 19:49:06', NULL, 709, 'mBTboDEdKp');
INSERT INTO `product_param_img` VALUES (57, '2018-06-27 04:14:32', '2008-05-02 13:49:42', NULL, 416, 'exzmjmsCXp');
INSERT INTO `product_param_img` VALUES (58, '2000-09-08 00:11:03', '2019-07-06 09:59:03', NULL, 432, '3uMIKhy5eM');
INSERT INTO `product_param_img` VALUES (59, '2012-03-27 23:55:03', '2023-02-25 14:03:09', NULL, 500, 'DJh6ccvNpe');
INSERT INTO `product_param_img` VALUES (60, '2001-10-15 21:42:54', '2015-07-18 00:57:23', NULL, 887, 'klwVHcB9Qc');
INSERT INTO `product_param_img` VALUES (61, '2003-11-15 10:33:41', '2000-01-24 16:10:08', NULL, 369, 'CUl0NElayy');
INSERT INTO `product_param_img` VALUES (62, '2019-09-22 05:51:40', '2013-12-03 06:06:23', NULL, 603, 'TmfmDv0lRv');
INSERT INTO `product_param_img` VALUES (63, '2017-02-16 00:16:57', '2006-03-15 17:20:08', NULL, 801, 'W343Ey0nGA');
INSERT INTO `product_param_img` VALUES (64, '2017-04-18 10:16:53', '2019-10-08 21:19:33', NULL, 270, 'CRxCN7BiRM');
INSERT INTO `product_param_img` VALUES (65, '2011-09-11 11:57:14', '2021-06-25 03:29:06', NULL, 652, 'SNThxLvSR3');
INSERT INTO `product_param_img` VALUES (66, '2019-07-31 23:06:16', '2009-12-29 09:53:05', NULL, 762, 'wIguyqLWar');
INSERT INTO `product_param_img` VALUES (67, '2008-12-30 17:24:50', '2009-06-08 02:00:05', NULL, 146, 'PgPvspHz2Q');
INSERT INTO `product_param_img` VALUES (68, '2014-09-14 20:14:28', '2000-07-05 22:07:57', NULL, 593, 'a1TTkOPPyC');
INSERT INTO `product_param_img` VALUES (69, '2021-06-16 00:12:32', '2022-06-10 00:20:46', NULL, 57, 'L0ikov4CmK');
INSERT INTO `product_param_img` VALUES (70, '2003-01-28 18:29:48', '2009-06-05 06:15:13', NULL, 104, 'EfaInKdSB0');
INSERT INTO `product_param_img` VALUES (71, '2002-02-28 15:18:46', '2013-07-24 14:43:27', NULL, 438, 'yRE0PBkIsn');
INSERT INTO `product_param_img` VALUES (72, '2004-06-01 14:32:32', '2023-06-22 21:08:13', NULL, 561, 'mw91BnMzfd');
INSERT INTO `product_param_img` VALUES (73, '2012-06-30 06:27:35', '2011-03-23 06:25:58', NULL, 504, 'xmeVHCyYfu');
INSERT INTO `product_param_img` VALUES (74, '2007-10-18 05:21:26', '2009-09-07 12:37:48', NULL, 802, 'ctYrX2RuNR');
INSERT INTO `product_param_img` VALUES (75, '2013-11-26 08:46:51', '2018-01-03 07:22:19', NULL, 832, 'oq42HhrRNM');
INSERT INTO `product_param_img` VALUES (76, '2018-09-11 04:45:12', '2002-05-10 00:45:20', NULL, 426, 'MTDsTLhjuv');
INSERT INTO `product_param_img` VALUES (77, '2005-01-12 01:02:54', '2015-06-20 16:18:06', NULL, 474, '77sZPrFA9d');
INSERT INTO `product_param_img` VALUES (78, '2010-04-07 13:29:35', '2007-02-13 14:50:04', NULL, 689, 'lvUA1rghPa');
INSERT INTO `product_param_img` VALUES (79, '2024-04-16 17:32:18', '2006-10-28 10:49:51', NULL, 517, '06bLpX6FJR');
INSERT INTO `product_param_img` VALUES (80, '2012-02-16 04:57:48', '2008-03-01 04:55:52', NULL, 984, 'jaY1pQYuuK');
INSERT INTO `product_param_img` VALUES (81, '2016-08-18 16:20:04', '2000-10-03 14:08:39', NULL, 108, 'ZDk8PyjxL5');
INSERT INTO `product_param_img` VALUES (82, '2009-01-03 12:21:34', '2013-03-26 13:14:18', NULL, 284, 'FpwWXpAiyf');
INSERT INTO `product_param_img` VALUES (83, '2023-11-22 21:58:22', '2004-08-11 04:47:11', NULL, 710, 'scrsfGEwYb');
INSERT INTO `product_param_img` VALUES (84, '2021-08-11 11:00:16', '2002-05-01 08:38:11', NULL, 998, 'wwi7Db7nWH');
INSERT INTO `product_param_img` VALUES (85, '2009-08-09 12:34:01', '2008-05-05 20:39:07', NULL, 212, 'ssgbd8xeOM');
INSERT INTO `product_param_img` VALUES (86, '2004-08-29 10:49:42', '2013-11-06 06:05:58', NULL, 512, 'kAJBiAhxFo');
INSERT INTO `product_param_img` VALUES (87, '2010-12-09 10:04:45', '2005-04-18 11:35:27', NULL, 707, '113hbKDpJi');
INSERT INTO `product_param_img` VALUES (88, '2005-03-09 17:11:37', '2009-06-08 09:19:32', NULL, 751, 'e1T4YL425e');
INSERT INTO `product_param_img` VALUES (89, '2020-07-27 02:11:13', '2010-05-24 01:04:41', NULL, 491, 'BRDyH5BTqR');
INSERT INTO `product_param_img` VALUES (90, '2016-01-24 02:36:05', '2003-07-28 06:07:46', NULL, 281, 'NPvweKOQtb');
INSERT INTO `product_param_img` VALUES (91, '2005-11-28 04:44:11', '2014-02-03 23:50:30', NULL, 366, 'efSDlmMXa9');
INSERT INTO `product_param_img` VALUES (92, '2022-07-31 16:48:15', '2007-02-14 19:48:52', NULL, 554, 'GdM1N9UX8I');
INSERT INTO `product_param_img` VALUES (93, '2014-09-15 09:03:06', '2016-11-05 07:06:51', NULL, 61, 'JZAO5Kw9xz');
INSERT INTO `product_param_img` VALUES (94, '2019-10-27 02:37:25', '2005-05-28 13:11:15', NULL, 510, 'gggCVbv3oD');
INSERT INTO `product_param_img` VALUES (95, '2013-01-31 08:59:53', '2024-03-05 19:36:31', NULL, 906, 'wii2PdlZuU');
INSERT INTO `product_param_img` VALUES (96, '2009-02-13 12:25:45', '2010-05-02 18:27:21', NULL, 367, 'qQdRcKGQmC');
INSERT INTO `product_param_img` VALUES (97, '2017-01-12 22:22:44', '2021-12-20 05:22:46', NULL, 153, 'txCEYnuX9c');
INSERT INTO `product_param_img` VALUES (98, '2020-10-07 15:48:16', '2018-12-26 22:27:26', NULL, 181, '5koUi24kSt');
INSERT INTO `product_param_img` VALUES (99, '2001-03-04 08:16:42', '2006-11-12 21:01:22', NULL, 986, 'mSziM5XEFD');
INSERT INTO `product_param_img` VALUES (100, '2020-05-20 01:17:31', '2001-08-21 22:36:01', NULL, 9, 'cjd6M2QYCe');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `limit` int(11) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `telephone`(`telephone`) USING BTREE,
  INDEX `idx_user_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2024-03-17 17:12:46', '2024-04-26 12:52:45', NULL, 'test123456', '2823531395@qq.com', '18277923708', '$2a$12$.C9.GSThr2XwcBS0p7pJGeIks1YlfhdTqPyIxR3bh/0k2ALZOefmW', 'test123456', 'active', 0, 'https://img.pddpic.com/mms-material-img/2023-11-11/ba525ab1-ea55-4345-8bee-aa64a20d6112.jpeg?imageView2/2/w/1300/q/80');
INSERT INTO `user` VALUES (2, '2024-04-27 21:06:25', '2024-04-27 21:06:25', NULL, '256498144', '', '', '$2a$12$IK38vo/dUP3yDYLoCP0dpe5ryPNSsn7lZUh9D23ZD4Uz..iDg4sVi', 'test2', 'active', 0, 'img/avatar/avatar1.jpg');

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `identity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE,
  INDEX `idx_user_auth_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_auth
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
