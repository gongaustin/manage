/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : manage

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 18/01/2019 15:27:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父菜单id',
  `zindex` int(2) NULL DEFAULT NULL COMMENT '菜单排序',
  `istype` int(1) NULL DEFAULT NULL COMMENT '权限分类（0 菜单；1 功能）',
  `descpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标名称',
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单url',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`id`, `name`, `pid`, `zindex`, `istype`, `descpt`, `code`, `icon`, `page`, `insert_time`, `update_time`) VALUES (1, '系统管理', 0, 100, 0, '系统管理', 'system', '', '/', '2017-12-20 16:22:43', '2018-01-09 19:26:36'), (2, '用户管理', 1, 1100, 0, '用户管理', 'usermanage', '', '/user/userList', '2017-12-20 16:27:03', '2018-01-09 19:26:30'), (3, '角色管理', 1, 1200, 0, '角色管理', 'rolemanage', '', '/auth/roleManage', '2017-12-20 16:27:03', '2018-01-09 19:26:42'), (4, '权限管理', 1, 1300, 0, '权限管理', 'permmanage', NULL, '/auth/permList', '2017-12-30 19:17:32', '2018-01-09 19:26:48'), (5, '商品管理', 0, 300, 0, '商品管理', 'shops', NULL, '/', '2017-12-30 19:17:50', '2018-01-09 19:20:11'), (6, '渠道管理', 0, 200, 0, '渠道管理', 'channel', NULL, '/', '2018-01-01 11:07:17', '2018-01-09 19:05:42'), (8, '订单管理', 0, 400, 0, '订单管理', 'orders', NULL, '/', '2018-01-09 09:26:53', '2018-01-09 19:20:40'), (10, '渠道信息列表', 6, 2200, 0, '渠道信息列表', 'channelPage', NULL, '/channel/channelListPage', '2018-01-09 19:07:05', '2018-01-09 19:31:13'), (11, '渠道会员列表', 6, 2300, 0, '渠道会员列表', 'channelUsers', NULL, '/channel/channelUserListPage', '2018-01-09 19:07:52', '2018-01-18 14:08:08'), (13, '商品列表', 5, 3100, 0, '商品列表', 'shopPage', NULL, '/shop/shopPage', '2018-01-09 19:33:53', '2018-04-22 21:18:11'), (14, '商品订单列表', 8, 4100, 0, '商品订单列表', 'orderPage', NULL, '/order/orderPage', '2018-01-09 19:34:33', '2018-04-22 21:17:58');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `descpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `insert_uid` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '添加数据时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `role_name`, `descpt`, `code`, `insert_uid`, `insert_time`, `update_time`) VALUES (1, '超级管理', '超级管理员', 'superman', NULL, '2018-01-09 19:28:53', '2018-01-09 19:34:56'), (2, '高级管理员', '高级管理员', 'highmanage', NULL, '2018-01-17 13:53:23', '2018-01-18 13:39:29'), (3, '经理', '经理', 'bdmanage', NULL, '2018-01-18 13:41:47', '2018-04-22 21:15:38'), (4, '质检员', '质检员', 'checkmanage', NULL, '2018-01-18 14:03:00', '2018-04-22 21:15:59'), (5, '客维员', '客维员', 'guestmanage', NULL, '2018-01-18 14:06:48', '2018-04-22 21:16:07');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permit_id` int(5) NOT NULL AUTO_INCREMENT,
  `role_id` int(5) NOT NULL,
  PRIMARY KEY (`permit_id`, `role_id`) USING BTREE,
  INDEX `perimitid`(`permit_id`) USING BTREE,
  INDEX `roleid`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` (`permit_id`, `role_id`) VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (5, 1), (5, 2), (5, 3), (5, 5), (6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (7, 1), (8, 1), (8, 2), (8, 3), (8, 5), (10, 1), (10, 2), (10, 3), (10, 4), (11, 1), (11, 2), (11, 3), (11, 5), (12, 1), (12, 2), (12, 3), (13, 1), (13, 2), (13, 3), (13, 5), (14, 1), (14, 2), (14, 3), (14, 5);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `insert_uid` int(11) NULL DEFAULT NULL COMMENT '添加该用户的用户id',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0：正常；1：已删）',
  `is_job` tinyint(1) NULL DEFAULT 0 COMMENT '是否在职（0：正常；1，离职）',
  `mcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '短信验证码',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '短信发送时间',
  `version` int(10) NULL DEFAULT 0 COMMENT '更新版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `mobile`, `email`, `password`, `insert_uid`, `insert_time`, `update_time`, `is_del`, `is_job`, `mcode`, `send_time`, `version`) VALUES (1, 'admin', '15881051721', 'aaa', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2017-12-29 17:27:23', '2018-01-09 13:34:33', 0, 0, '181907', '2018-01-17 13:42:45', 0), (3, 'wy1', '11155556667', 'a11', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-01 15:17:19', '2018-04-22 21:14:58', 0, 0, NULL, NULL, 0), (5, 'wy23', '11155552233', 'a', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-02 13:41:29', '2018-01-10 15:55:37', 0, 1, NULL, NULL, 0), (6, 'wyyyy', '12356456542', 'afdfd123', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-02 13:44:04', '2018-01-02 16:56:05', 0, 1, NULL, NULL, 0), (7, 'wwwww', '11155623232', '123456', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-02 13:44:23', NULL, 1, 0, NULL, NULL, 0), (8, 'wwwy', '15881051720', '359818226@.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2018-01-04 16:51:21', '2018-01-08 21:02:38', 0, 0, NULL, NULL, 0), (10, 'b', '12345678977', 'a', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-09 10:30:56', '2018-04-22 21:27:53', 0, 0, NULL, NULL, 0), (11, 'e', '12345678911', 'e', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 10:31:08', NULL, 0, 0, NULL, NULL, 0), (12, 'ee', '12345678919', 'a', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-09 10:31:33', '2018-04-22 21:28:01', 0, 0, NULL, NULL, 0), (13, '456', '12345678888', 'e', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 10:31:46', NULL, 0, 0, NULL, NULL, 0), (14, '89', '12345612222', 'a', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 10:31:58', NULL, 0, 0, NULL, NULL, 0), (15, 'aa', '12345678915', 'ee1', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 10:32:12', '2018-01-09 13:29:12', 0, 0, NULL, NULL, 0), (16, 'tty', '12345678521', 'aa', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 13:32:17', '2018-01-09 13:45:58', 0, 0, NULL, NULL, 0), (17, 'oo', '12345666666', 'qq', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-09 13:51:01', '2018-04-24 19:30:01', 0, 0, NULL, NULL, 0), (18, 'iik', '12345678920', 'aaaa120', 'c33367701511b4f6020ec61ded352059', NULL, '2018-01-09 16:31:03', '2018-01-09 16:41:28', 0, 0, NULL, NULL, 0), (19, '123456', '12321727724', '24319@qq.com', 'c33367701511b4f6020ec61ded352059', 1, '2018-01-17 09:24:27', '2018-04-28 19:21:59', 0, 0, '386614', '2018-01-18 09:45:41', 0), (20, 'xiaoqiabng1', '11111111212', '1213@qq.com', 'c33367701511b4f6020ec61ded352059', 19, '2018-01-17 13:54:08', '2018-04-26 14:09:23', 0, 0, '353427', '2018-01-17 13:56:59', 0), (21, 'aaaacc2', '10123235656', '', 'c33367701511b4f6020ec61ded352059', 1, '2018-04-22 21:14:48', '2018-05-02 16:55:12', 0, 0, NULL, NULL, 8), (22, '11232323232', '23233223322', '', 'c33367701511b4f6020ec61ded352059', 19, '2018-04-26 13:30:44', '2018-04-28 19:22:11', 1, 0, NULL, NULL, 0), (23, 'bbb1', '10222224564', '', 'c33367701511b4f6020ec61ded352059', 19, '2018-04-26 14:36:30', '2018-04-28 15:43:21', 1, 0, NULL, NULL, 0), (24, 'eee', '12536369898', '', 'c33367701511b4f6020ec61ded352059', 19, '2018-04-26 18:37:34', '2018-04-28 15:36:12', 1, 0, NULL, NULL, 0), (25, 'fast', '12312312312', '', 'c33367701511b4f6020ec61ded352059', 1, '2018-04-28 09:37:32', '2018-04-28 09:37:48', 1, 0, NULL, NULL, 0), (26, 'xxx', '12923235959', '', 'c33367701511b4f6020ec61ded352059', 1, '2018-05-02 16:55:35', '2018-05-02 19:35:51', 1, 0, NULL, NULL, 5), (27, 'ppp12', '12826265353', '', 'c33367701511b4f6020ec61ded352059', 1, '2018-05-02 16:56:41', '2018-05-02 19:30:05', 1, 0, NULL, NULL, 19);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(5) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE,
  INDEX `roleid`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES (1, 1), (3, 5), (12, 5), (19, 3), (20, 2), (21, 4), (22, 5), (23, 3), (24, 5), (25, 2), (26, 5), (27, 5);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
