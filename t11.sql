/*
 Navicat Premium Data Transfer

 Source Server         : db02_1.117.76.233
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 1.117.76.233:3306
 Source Schema         : stage

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 26/06/2021 13:54:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t11
-- ----------------------------
DROP TABLE IF EXISTS 't11';
CREATE TABLE 't11'  (
  `id` int(11) NULL DEFAULT NULL,
  `name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t11
-- ----------------------------
INSERT INTO `t11` VALUES (4, 'qqqq');
INSERT INTO `t11` VALUES (5, 'qqqq');
INSERT INTO `t11` VALUES (6, 'qqqq');
INSERT INTO `t11` VALUES (3, 'qqqq');
INSERT INTO `t11` VALUES (2, 'qqqq');
INSERT INTO `t11` VALUES (1, 'qqqq');

SET FOREIGN_KEY_CHECKS = 1;
