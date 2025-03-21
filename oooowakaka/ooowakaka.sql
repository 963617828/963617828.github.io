/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ooowakaka

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 21/03/2025 09:59:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `isbn` char(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `book_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `book_price` decimal(10, 2) NULL DEFAULT NULL,
  `press_id` int(0) NULL DEFAULT NULL,
  `book_copy` int(0) NULL DEFAULT NULL,
  `book_inventory` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`isbn`) USING BTREE,
  INDEX `book_fk_press`(`press_id`) USING BTREE,
  CONSTRAINT `book_fk_press` FOREIGN KEY (`press_id`) REFERENCES `t_press` (`press_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`press_id`) REFERENCES `t_press` (`press_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '2', '3', 4.00, NULL, 111, 7);

-- ----------------------------
-- Table structure for p1
-- ----------------------------
DROP TABLE IF EXISTS `p1`;
CREATE TABLE `p1`  (
  `press_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p1
-- ----------------------------

-- ----------------------------
-- Table structure for p2
-- ----------------------------
DROP TABLE IF EXISTS `p2`;
CREATE TABLE `p2`  (
  `press_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postcode` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '11111'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p2
-- ----------------------------
INSERT INTO `p2` VALUES ('1', '11111');
INSERT INTO `p2` VALUES ('', '11111');

-- ----------------------------
-- Table structure for p3
-- ----------------------------
DROP TABLE IF EXISTS `p3`;
CREATE TABLE `p3`  (
  `press_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postcode` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '11111',
  `press_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `press_tel`(`press_tel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p3
-- ----------------------------

-- ----------------------------
-- Table structure for p4
-- ----------------------------
DROP TABLE IF EXISTS `p4`;
CREATE TABLE `p4`  (
  `pid` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p4
-- ----------------------------

-- ----------------------------
-- Table structure for p5
-- ----------------------------
DROP TABLE IF EXISTS `p5`;
CREATE TABLE `p5`  (
  `pid1` int(0) NOT NULL,
  `pid2` int(0) NOT NULL,
  PRIMARY KEY (`pid1`, `pid2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p5
-- ----------------------------
INSERT INTO `p5` VALUES (1, 2);

-- ----------------------------
-- Table structure for p6
-- ----------------------------
DROP TABLE IF EXISTS `p6`;
CREATE TABLE `p6`  (
  `pid6` int(0) NOT NULL,
  `pid4` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pid6`) USING BTREE,
  INDEX `pid4`(`pid4`) USING BTREE,
  CONSTRAINT `p6_ibfk_1` FOREIGN KEY (`pid4`) REFERENCES `p4` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p6
-- ----------------------------

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `reader_id` int(0) NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reader_sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reader_birthday` date NULL DEFAULT NULL,
  `reader_borrow` float NULL DEFAULT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (1, 'ad', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_press
-- ----------------------------
DROP TABLE IF EXISTS `t_press`;
CREATE TABLE `t_press`  (
  `press_id` int(0) NOT NULL,
  `press_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postcode` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`press_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_press
-- ----------------------------
INSERT INTO `t_press` VALUES (1, 'dfg', 'ada', 'dsad', 'wasd', '11@qq.com', '123asd');
INSERT INTO `t_press` VALUES (2, 'asda', 'sdawsd', 'wasda', 'zxc', '22@qq.com', '123asd');
INSERT INTO `t_press` VALUES (3, 'dfg', 'ada3', '111111', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
