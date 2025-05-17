/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : certdb

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 17/05/2025 17:15:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warranty_certificates
-- ----------------------------
DROP TABLE IF EXISTS `warranty_certificates`;
CREATE TABLE `warranty_certificates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `purchase_order_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sales_order_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warranty_certificates
-- ----------------------------
INSERT INTO `warranty_certificates` VALUES (1, 'test', 'test', '12312312', '2312312', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (2, '3412312312312', '3123123123123', '12312', '3123123123', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (3, '34123123', '123123123', '12312312', '21312312', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (4, 'asdasd', '32131232', '123123123', '123123', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (5, 'zxczxczxc', 'zxczxczxc', '13123', '3123123', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (6, 'zxcxcxz', 'cxzcxzczxzc', '12312312', '312312', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (7, 'zxcxcxz22222', 'cxzcxzczxzc', '12312312', '312312', '2025-05-17');
INSERT INTO `warranty_certificates` VALUES (8, '23213saddasd', 'asdasdadsa', '3123', '312312', '2025-05-17');

-- ----------------------------
-- Table structure for warranty_products
-- ----------------------------
DROP TABLE IF EXISTS `warranty_products`;
CREATE TABLE `warranty_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `certificate_id` int NULL DEFAULT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `quantity` int NULL DEFAULT NULL,
  `serial_numbers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `warranty_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `certificate_id`(`certificate_id` ASC) USING BTREE,
  CONSTRAINT `warranty_products_ibfk_1` FOREIGN KEY (`certificate_id`) REFERENCES `warranty_certificates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warranty_products
-- ----------------------------
INSERT INTO `warranty_products` VALUES (1, 1, '3321', 12312312, '321312', '123123');
INSERT INTO `warranty_products` VALUES (2, 2, '213123', 12321312, '321312312', '312312');
INSERT INTO `warranty_products` VALUES (3, 2, '123123123', 123123123, '123123123', '123123');
INSERT INTO `warranty_products` VALUES (4, 3, '12312312', 312312312, '3213123123', '123123123');
INSERT INTO `warranty_products` VALUES (5, 4, 'asdsad', 2, 'asdasdasd', 'a');
INSERT INTO `warranty_products` VALUES (6, 5, 'dsa', 3123, 'asdasda', 'asdas');
INSERT INTO `warranty_products` VALUES (7, 5, 'asdasd', 321312, 'dasd', 'dasdas');
INSERT INTO `warranty_products` VALUES (8, 5, 'asdasd', 123123, 'asdasdasd', 'dasd');
INSERT INTO `warranty_products` VALUES (9, 6, '31233', 2147483647, '123123123', '213');
INSERT INTO `warranty_products` VALUES (10, 7, '31233', 2147483647, '123123123', '213');
INSERT INTO `warranty_products` VALUES (11, 8, '12312312', 312312, '23213123', '3123122');

SET FOREIGN_KEY_CHECKS = 1;
