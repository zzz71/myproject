/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : my_db

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 19/06/2022 22:41:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator_tb
-- ----------------------------
DROP TABLE IF EXISTS `administrator_tb`;
CREATE TABLE `administrator_tb`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `adname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adpassword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adrole` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`adname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator_tb
-- ----------------------------
INSERT INTO `administrator_tb` VALUES (1, 'root', '123456', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (2, 'admin01', '000000', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (3, 'addmin02', '$2a$10$XnBhkdED0pXduJPBObWPjOmYNCkahz5TLSCO9jPyqj28d6sJqGhYW', 'superadmin', 0);
INSERT INTO `administrator_tb` VALUES (4, 'admin11', '$2a$10$ddWSKNjkKVqXbopYx75CaOQKONn7vqKTNsVR9IbZpZaPUgvS4CO1a', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (5, 'admin18', '$2a$10$HmW1DmAuVOOFZk4EOD0aMureYtWaiODV6XLU2n64zxac5PAkqO3gS', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (16, 'admin77', '$2a$10$FnT/zmO9X4207XLeMJ.99OejO83wteb52eOONDHdm5rHqTNL2Kra2', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (17, 'aaaaa3', '$2a$10$.B42fgA71NJlOAYOkNMWhetduYFGEWjo4J/.PDfvupGQkLBCCKYPi', 'admin', 0);
INSERT INTO `administrator_tb` VALUES (18, 'roo', '$2a$10$3.q7fBBtO/Wa.HORrmZB/e9hq7j8nJhxDHMfK1sAc7/jhlRsA6v2W', 'admin', 0);
INSERT INTO `administrator_tb` VALUES (19, '77', '$2a$10$MFLyZ/MH2DutbPFVbMyz/OfthAaBG82K1l6C3eKC7oNZZRmIsUU.y', 'superadmin', 1);
INSERT INTO `administrator_tb` VALUES (20, '88', '$2a$10$SPpJMB6twFkFkBhxgFWHPuWXFspvJH.xNUFGL.1skJTkA5ApSnJta', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (21, 'roo77', '$2a$10$Jorcd6iJkjLD0YCN0QcSvO2tOvLi8kf4rEdppoN1xJTxt04.5hmY2', 'admin', 0);
INSERT INTO `administrator_tb` VALUES (22, '33', '$2a$10$QE5HdDQ6y08rFMlo50c92uW0oW/JhDaELVBReoRTkVJSdtx6hcfrq', 'admin', 0);
INSERT INTO `administrator_tb` VALUES (23, '66', '$2a$10$ps4n989Vp/yNowWO50grduk/Sz8pqFcBV.svj3pYdPHeJAPvKnyUa', 'admin', 1);
INSERT INTO `administrator_tb` VALUES (24, '99', '$2a$10$6.twk6p1McmdX9f0n3aJG.7bBBA4aLEoqNyYouGR77T0JqzOqnUfC', 'superadmin', 0);
INSERT INTO `administrator_tb` VALUES (25, 'zzz', '$2a$10$zSG8QNz3sLqe5/n.H65D4OD3Uk5.Nfi/SJ3DMYxZ55obWl30wkSn.', 'admin', 0);

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carID` int(0) NULL DEFAULT NULL COMMENT '车主ID',
  `carNum` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_car_carID`(`carID`) USING BTREE,
  CONSTRAINT `fk_car_carID` FOREIGN KEY (`carID`) REFERENCES `carmaster` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车辆' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, 2, '粤F11111', '2年', '这是车主号为2的第一辆车', 1);
INSERT INTO `car` VALUES (2, 2, '粤A123111', '1年', '这是车主号为2的第二辆车', 0);
INSERT INTO `car` VALUES (3, 3, '粤A56911', '3年', '这是车主号为3的第一辆车', 0);
INSERT INTO `car` VALUES (4, 3, '粤F34911', '2年', '这是车主号为3的第二辆车', 0);
INSERT INTO `car` VALUES (5, 1, '粤F31911', '2年', '这是车主号为1的第一辆车', 0);
INSERT INTO `car` VALUES (6, 5, '粤F121211', '2年', '这是车主号为5的第一辆车', 0);
INSERT INTO `car` VALUES (7, 6, '粤F11981', '4年', '这是车主号为6的第一辆车', 0);
INSERT INTO `car` VALUES (8, 4, '粤F11151', '1年', '这是车主号为4的第一辆车', 0);
INSERT INTO `car` VALUES (9, 7, '粤A13411', '7年', '这是车主号为7的第一辆车', 0);
INSERT INTO `car` VALUES (10, 8, '粤A31520', '2年', '这是车主号为8的第一辆车', 0);
INSERT INTO `car` VALUES (11, 9, '粤F113115', '3年', '这是车主号为2的第一辆车', 0);
INSERT INTO `car` VALUES (12, 10, '京A11451', '2年', '这是车主号为10的第一辆车', 0);
INSERT INTO `car` VALUES (13, 12, '粤H16511', '4年', '这是车主号为12的第一辆车', 0);
INSERT INTO `car` VALUES (14, 11, '粤A11231', '3年', '这是车主号为11的第一辆车', 0);
INSERT INTO `car` VALUES (15, 14, '粤B13151', '5年', '这是车主号为14的第一辆车', 0);
INSERT INTO `car` VALUES (16, 13, '粤F12311', '8年', '这是车主号为13的第一辆车', 0);
INSERT INTO `car` VALUES (17, 16, '粤C23111', '6年', '这是车主号为16的第一辆车', 0);

-- ----------------------------
-- Table structure for car_parkspace
-- ----------------------------
DROP TABLE IF EXISTS `car_parkspace`;
CREATE TABLE `car_parkspace`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carID` int(0) NULL DEFAULT NULL,
  `parkspaceID` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carID`(`carID`) USING BTREE,
  INDEX `parkspaceID`(`parkspaceID`) USING BTREE,
  CONSTRAINT `car_parkspace_ibfk_1` FOREIGN KEY (`carID`) REFERENCES `car` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_parkspace_ibfk_2` FOREIGN KEY (`parkspaceID`) REFERENCES `parking_space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carmaster
-- ----------------------------
DROP TABLE IF EXISTS `carmaster`;
CREATE TABLE `carmaster`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `number` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carmaster
-- ----------------------------
INSERT INTO `carmaster` VALUES (1, '李四', '123546789009876543', '17771902784', '韶关', 1);
INSERT INTO `carmaster` VALUES (2, '柳岩666', '123456789012345678', '13482345657', '广州', 1);
INSERT INTO `carmaster` VALUES (3, '张无忌', '123456789012345670', '14782345657', '韶关', 1);
INSERT INTO `carmaster` VALUES (4, '韦一笑', '123456789712345670', '16582345657', '韶关', 0);
INSERT INTO `carmaster` VALUES (5, '赵敏', '123456757123845670', '16232345657', '东莞', 0);
INSERT INTO `carmaster` VALUES (6, '杨逍', '12345678931234567X', '16782340657', '肇庆', 0);
INSERT INTO `carmaster` VALUES (7, '范瑶', '123456789212345670', '16982345657', '韶关', 0);
INSERT INTO `carmaster` VALUES (8, '黛绮丝', '123456157123645670', '19782345657', '韶关', 0);
INSERT INTO `carmaster` VALUES (9, '范凉凉', '123156789012345678', '16782345057', '广州', 0);
INSERT INTO `carmaster` VALUES (10, '陈友谅', '123456789012345670', '16782334657', '东莞', 0);
INSERT INTO `carmaster` VALUES (11, '张士诚', '123567897123465670', '16882345657', '湛江', 0);
INSERT INTO `carmaster` VALUES (12, '常遇春', '123446757152345670', '16785345657', '东莞', 0);
INSERT INTO `carmaster` VALUES (13, '张三丰', '123656789012345678', '16782345654', '广州', 0);
INSERT INTO `carmaster` VALUES (14, '灭绝', '123456719012345670', '12782345657', '广州', 0);
INSERT INTO `carmaster` VALUES (15, '胡青牛', '12345674971234567X', '16723345657', '韶关', 0);
INSERT INTO `carmaster` VALUES (16, '周芷若', '12354674971234567X', '16782345657', '韶关', 0);
INSERT INTO `carmaster` VALUES (17, '小昭', '123456769012345678', '16782345689', '上海', 0);

-- ----------------------------
-- Table structure for parking
-- ----------------------------
DROP TABLE IF EXISTS `parking`;
CREATE TABLE `parking`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parkId` int(0) NOT NULL COMMENT '停车场编号',
  `carNum` int(0) NULL DEFAULT NULL COMMENT '车辆数量',
  `latitudes` decimal(9, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitudes` decimal(9, 6) NULL DEFAULT NULL COMMENT '经度',
  `parkingLocation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '停车场位置',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '停车场' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parking
-- ----------------------------
INSERT INTO `parking` VALUES (1, 1, 200, 124.123456, 68.239876, '大润发地下停车场', NULL, 0);
INSERT INTO `parking` VALUES (2, 2, 500, 128.000000, 78.000000, '华润万家地下停车场', NULL, 1);

-- ----------------------------
-- Table structure for parking_space
-- ----------------------------
DROP TABLE IF EXISTS `parking_space`;
CREATE TABLE `parking_space`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parkID` int(0) NOT NULL DEFAULT 1 COMMENT '车位编号',
  `parkAdd` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '车位地址',
  `park_state` int(0) NOT NULL DEFAULT 0 COMMENT '车位状态',
  `lock_pass` int(0) NOT NULL COMMENT '锁密码',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parking_space
-- ----------------------------
INSERT INTO `parking_space` VALUES (1, 1, '大润发地下层A区0001', 0, 123456, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (2, 2, '华润万家002', 0, 123456, '这是一个停车位', 1);
INSERT INTO `parking_space` VALUES (3, 3, '华润玩家003', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (4, 4, '华润玩家004', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (5, 5, '华润玩家005', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (6, 6, '华润A001', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (7, 7, '华润003', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (8, 8, '华润004', 0, 555555, '这是一个停车位', 0);
INSERT INTO `parking_space` VALUES (12, 9, '华润A001', 0, 555555, '这是一个停车位', 0);

-- ----------------------------
-- Table structure for user_tb
-- ----------------------------
DROP TABLE IF EXISTS `user_tb`;
CREATE TABLE `user_tb`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号名',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `user_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `user_identity_id` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户身份证号',
  `user_tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户联系方式',
  `user_balance` decimal(6, 0) UNSIGNED ZEROFILL NOT NULL DEFAULT 000000 COMMENT '用户账户余额',
  `is_delete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_tb
-- ----------------------------
INSERT INTO `user_tb` VALUES (1, '用户13345', '张三', '123456', '123456789012345678', '12345678901', 000000, 1);
INSERT INTO `user_tb` VALUES (2, 'happ', '李四', '123456', '4445552221111', '13632652050', 001100, 0);
INSERT INTO `user_tb` VALUES (3, 'abc', '王五', '333333', '9999999999999', '55555555555', 000550, 1);
INSERT INTO `user_tb` VALUES (4, 'zzz', '', '$2a$10$Cr0v.ku.PuRooiSW1IwK7.O1pPh/yDsskcJH.9knzDesQsmHA1uZK', '', '', 000000, 1);

SET FOREIGN_KEY_CHECKS = 1;
