/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : vivoshop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 21/04/2020 01:02:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `lenth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片的长度',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片的宽度',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `type` int(255) NULL DEFAULT NULL COMMENT '广告类型',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES (34, '广告1', '/static/uploads/ad/banner/1580289731.png', NULL, NULL, '1', 1, 1, 1559782913, 1586670201, -1);
INSERT INTO `ad` VALUES (35, '广告212', '/static/uploads/ad/banner/1580289760.png', NULL, NULL, 'a/bb', 1, 2, 1559782993, 1586670196, -1);
INSERT INTO `ad` VALUES (36, '幻灯片3', '/static/uploads/ad/banner/1580289996.png', NULL, NULL, '', 1, 3, 1580289998, 1586670198, -1);
INSERT INTO `ad` VALUES (37, '幻灯片4', '/static/uploads/ad/banner/1580290047.png', NULL, NULL, '', 1, 4, 1580290049, 1586670203, -1);
INSERT INTO `ad` VALUES (38, '科比', '/static/uploads/ad/banner/1586581742.png', NULL, NULL, '', 1, 1, 1586581754, 1586670190, -1);
INSERT INTO `ad` VALUES (39, 'vivo', '/static/uploads/ad/banner/1586670183.png', NULL, NULL, '', 1, 1, 1586670185, 1586670185, 1);
INSERT INTO `ad` VALUES (40, 'vivo', '/static/uploads/ad/banner/1586670218.png', NULL, NULL, '', 1, 2, 1586670220, 1586670220, 1);
INSERT INTO `ad` VALUES (41, 'vivo', '/static/uploads/ad/banner/1586670236.png', NULL, NULL, '', 1, 3, 1586670237, 1586670237, 1);
INSERT INTO `ad` VALUES (42, 'vivo', '/static/uploads/ad/banner/1586670248.png', NULL, NULL, '', 1, 4, 1586670249, 1586670249, 1);
INSERT INTO `ad` VALUES (43, 'vivo', '/static/uploads/ad/banner/1586670261.png', NULL, NULL, '', 1, 5, 1586670263, 1586670309, -1);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `code` int(255) NULL DEFAULT NULL COMMENT '随机码',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `qq` int(255) NULL DEFAULT NULL COMMENT 'qq',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `last_login_time` int(255) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  `authid` int(11) NULL DEFAULT NULL COMMENT '角色',
  `yewuyuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (11, 'admin', 'a9bbdae3d66d7b8c6fb89853e4440029', 9686, '1357777', 63492473, 'sun@126.com', 1, 5, NULL, 1554169340, 1558078934, NULL, 19, NULL);
INSERT INTO `admin` VALUES (12, 'admin2', '4d42a7dc3d324356de9632f7af84ccf2', 9686, '1654444', NULL, '', 1, 5, NULL, 1554169340, 1569812472, NULL, 19, NULL);
INSERT INTO `admin` VALUES (13, 'admin3', '4d42a7dc3d324356de9632f7af84ccf2', 9686, '189666', NULL, '', 1, 5, NULL, 1554169340, 1587129774, NULL, 19, NULL);
INSERT INTO `admin` VALUES (36, 'admin1122', '9d8181a698f5826ef326faf7e9149755', 3459, '', 0, '', 1, NULL, NULL, 1556976403, 1587107562, NULL, 19, NULL);
INSERT INTO `admin` VALUES (35, 'admin89', 'fa36beb0d1fc485c1168de1765ac28ed', 3371, '', 0, '', 1, NULL, NULL, 1556976275, 1587129778, NULL, NULL, NULL);
INSERT INTO `admin` VALUES (37, 'zyumu', 'fd57c5b4bf3953f222703e7e70c20d12', 3779, '123456789', 123456789, 'admin', 1, NULL, NULL, 1586581680, 1587178895, NULL, 25, NULL);
INSERT INTO `admin` VALUES (38, 'william', '64fe00147e7dd834765bca20e0511238', 1241, '987654321', 987654321, 'admin', 1, NULL, NULL, 1586583814, 1587107557, NULL, 20, NULL);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `registerid` int(255) NULL DEFAULT NULL COMMENT '注册账号的id',
  `question1` int(255) NULL DEFAULT NULL COMMENT '第一个问题的id',
  `question2` int(255) NULL DEFAULT NULL COMMENT '第二个问题的id',
  `answer1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一个问题的答案',
  `answer2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二个问题的答案',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (40, 68, 7, 4, '魏老师', '123456', 1, 1577326550, 1577326550);

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单号',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商家的id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `bill_status` int(11) NULL DEFAULT NULL COMMENT '付款状态（0：未付款；1：已付款）',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (50, '1575084175266264', 1, 150.00, 1, 1, 1575084175, 1575084175);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `parent_id` int(255) NULL DEFAULT NULL COMMENT '父路径:根目录0',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `iconb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图标',
  `iconm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图标',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (27, '手机', 0, 0, 1558234841, 1587177080, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (28, 'IQOO专区', 27, 1, 1558247315, 1586926968, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (29, 'NEX系列', 27, 2, 1558247330, 1587108977, NULL, '', '', '', -1);
INSERT INTO `category` VALUES (30, 'X系列', 27, 10, 1558247343, 1569810503, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (31, '手机充电', 0, 2, 1558247389, 1586922527, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (32, '数据线', 31, 1, 1558247421, 1569812747, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (33, '充电器', 31, 2, 1558247435, 1558407297, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (34, '移动电源', 31, 3, 1558247451, 1586922814, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (35, '音乐设备', 0, 3, 1580180056, 1586922548, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (36, '智能硬件', 0, 4, 1580180077, 1586922578, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (37, '游戏摄影', 0, 5, 1580180089, 1580180089, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (38, '日常出行', 0, 6, 1580180100, 1580180100, NULL, '', '', '', 1);
INSERT INTO `category` VALUES (43, '其他的其他', 42, 1, 1587108898, 1587108898, NULL, '', '', '', 1);

-- ----------------------------
-- Table structure for category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute`;
CREATE TABLE `category_attribute`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键（分类属性）',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目属性名称',
  `category_id` int(255) NULL DEFAULT NULL COMMENT '分类的id',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_attribute
-- ----------------------------
INSERT INTO `category_attribute` VALUES (1, '服装版型', 28, 1, -1, NULL, 1586926874);
INSERT INTO `category_attribute` VALUES (35, '型号', 28, NULL, -1, 1562309551, 1586926879);
INSERT INTO `category_attribute` VALUES (36, '适合人群', 28, NULL, -1, 1562309601, 1586925961);
INSERT INTO `category_attribute` VALUES (53, '颜色', 28, NULL, 1, 1587179712, 1587179712);
INSERT INTO `category_attribute` VALUES (52, '内存', 34, NULL, 1, 1587176367, 1587176367);
INSERT INTO `category_attribute` VALUES (51, '颜色', 34, NULL, 1, 1587176338, 1587176338);
INSERT INTO `category_attribute` VALUES (49, '手机颜色', 32, NULL, 1, 1587109603, 1587109603);
INSERT INTO `category_attribute` VALUES (50, '手机内存', 28, NULL, 1, 1587130654, 1587130654);

-- ----------------------------
-- Table structure for category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute_value`;
CREATE TABLE `category_attribute_value`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键（分类属性的值）',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目属性值的名称',
  `category_attribute_id` int(255) NULL DEFAULT NULL COMMENT '类目属性的id',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_attribute_value
-- ----------------------------
INSERT INTO `category_attribute_value` VALUES (1, '宽松', 1, 1, -1, NULL, 1586925991);
INSERT INTO `category_attribute_value` VALUES (2, '直通', 1, 1, 1, NULL, NULL);
INSERT INTO `category_attribute_value` VALUES (3, '修身', 1, 1, 1, NULL, NULL);
INSERT INTO `category_attribute_value` VALUES (37, '大款式', 35, 0, -1, 1562311497, 1586925970);
INSERT INTO `category_attribute_value` VALUES (42, '小款式', 35, 0, -1, 1562314681, 1586925975);
INSERT INTO `category_attribute_value` VALUES (41, '修长', 1, 0, 1, 1562314514, 1562314514);
INSERT INTO `category_attribute_value` VALUES (43, '青年', 36, 0, 1, NULL, NULL);
INSERT INTO `category_attribute_value` VALUES (44, '老年', 36, 0, 1, NULL, NULL);
INSERT INTO `category_attribute_value` VALUES (48, '春季', 39, 0, 1, 1580369418, 1580369418);
INSERT INTO `category_attribute_value` VALUES (47, '四季', 39, 0, 1, 1580369398, 1580369398);
INSERT INTO `category_attribute_value` VALUES (49, '夏季', 39, 0, 1, 1580369435, 1580369435);
INSERT INTO `category_attribute_value` VALUES (50, '秋季', 39, 0, 1, 1580369461, 1580369461);
INSERT INTO `category_attribute_value` VALUES (51, '冬季', 39, 0, 1, 1580369474, 1580369474);
INSERT INTO `category_attribute_value` VALUES (52, '日常', 40, 0, 1, 1580369590, 1580369590);
INSERT INTO `category_attribute_value` VALUES (53, '商务', 40, 0, 1, 1580369603, 1580369603);
INSERT INTO `category_attribute_value` VALUES (54, '其他休闲', 40, 0, 1, 1580369630, 1580369630);
INSERT INTO `category_attribute_value` VALUES (55, '旅游', 40, 0, 1, 1580369648, 1580369648);
INSERT INTO `category_attribute_value` VALUES (56, '居家', 40, 0, 1, 1580369667, 1580369667);
INSERT INTO `category_attribute_value` VALUES (57, '加绒加厚', 41, 0, 1, 1580369772, 1580369772);
INSERT INTO `category_attribute_value` VALUES (58, '厚', 41, 0, 1, 1580369796, 1580369796);
INSERT INTO `category_attribute_value` VALUES (59, '常规', 41, 0, 1, 1580369809, 1580369809);
INSERT INTO `category_attribute_value` VALUES (60, '薄', 41, 0, 1, 1580369828, 1580369828);
INSERT INTO `category_attribute_value` VALUES (61, '少年', 42, 0, 1, 1580370839, 1580370839);
INSERT INTO `category_attribute_value` VALUES (62, '青年', 42, 0, 1, 1580370858, 1580370858);
INSERT INTO `category_attribute_value` VALUES (63, '中年', 42, 0, 1, 1580370877, 1580370877);
INSERT INTO `category_attribute_value` VALUES (64, '老年', 42, 0, 1, 1580370907, 1580370907);
INSERT INTO `category_attribute_value` VALUES (65, '男', 43, 0, 1, 1580370990, 1580370990);
INSERT INTO `category_attribute_value` VALUES (66, '女', 43, 0, 1, 1580371003, 1580371003);
INSERT INTO `category_attribute_value` VALUES (67, '超薄', 44, 0, 1, 1580371121, 1580371121);
INSERT INTO `category_attribute_value` VALUES (68, '薄款', 44, 0, 1, 1580371139, 1580371139);
INSERT INTO `category_attribute_value` VALUES (69, '常规', 44, 0, 1, 1580371152, 1580371152);
INSERT INTO `category_attribute_value` VALUES (70, '加厚', 44, 0, 1, 1580371171, 1580371171);
INSERT INTO `category_attribute_value` VALUES (71, '玫瑰红', 45, 0, 1, 1587107744, 1587107744);
INSERT INTO `category_attribute_value` VALUES (72, '玫瑰金', 46, 0, 1, 1587108421, 1587108421);
INSERT INTO `category_attribute_value` VALUES (73, '土豪红', 46, 0, -1, 1587108431, 1587108437);
INSERT INTO `category_attribute_value` VALUES (74, '红色', 46, 0, 1, 1587108450, 1587108450);
INSERT INTO `category_attribute_value` VALUES (75, '天空蓝', 46, 0, 1, 1587108457, 1587108457);
INSERT INTO `category_attribute_value` VALUES (76, '红色', 47, 0, 1, 1587108490, 1587108490);
INSERT INTO `category_attribute_value` VALUES (77, '非常大', 48, 0, 1, 1587108972, 1587108972);
INSERT INTO `category_attribute_value` VALUES (78, '天空蓝4', 49, 0, 1, 1587109621, 1587109621);
INSERT INTO `category_attribute_value` VALUES (79, '64G', 50, 0, 1, 1587130668, 1587130668);
INSERT INTO `category_attribute_value` VALUES (80, '天空蓝', 51, 0, 1, 1587176346, 1587176346);
INSERT INTO `category_attribute_value` VALUES (81, '土豪金', 51, 0, 1, 1587176355, 1587176355);
INSERT INTO `category_attribute_value` VALUES (82, '64G', 52, 0, 1, 1587176376, 1587176376);
INSERT INTO `category_attribute_value` VALUES (83, '128G', 52, 0, 1, 1587176386, 1587176386);
INSERT INTO `category_attribute_value` VALUES (84, '32G', 50, 0, 1, 1587179648, 1587179648);
INSERT INTO `category_attribute_value` VALUES (85, '靛青', 53, 0, 1, 1587179732, 1587179732);
INSERT INTO `category_attribute_value` VALUES (86, '小黄鸭黄', 53, 0, 1, 1587179748, 1587179748);

-- ----------------------------
-- Table structure for category_brand
-- ----------------------------
DROP TABLE IF EXISTS `category_brand`;
CREATE TABLE `category_brand`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目品牌名称',
  `category_id` int(255) NULL DEFAULT NULL COMMENT '类目的id',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_brand
-- ----------------------------
INSERT INTO `category_brand` VALUES (1, '爱美斯', 28, 1, -1, NULL, 1586925931);
INSERT INTO `category_brand` VALUES (2, '艾可儿', 28, 1, -1, NULL, 1586925925);
INSERT INTO `category_brand` VALUES (37, '爱莱菲', 28, NULL, -1, 1562399738, 1562399881);
INSERT INTO `category_brand` VALUES (38, NULL, NULL, NULL, 1, 1571564233, 1571564233);
INSERT INTO `category_brand` VALUES (39, NULL, NULL, NULL, 1, 1571564375, 1571564375);
INSERT INTO `category_brand` VALUES (40, NULL, NULL, NULL, 1, 1571564662, 1571564662);
INSERT INTO `category_brand` VALUES (41, '花花公子', 29, NULL, -1, 1580369494, 1587108062);
INSERT INTO `category_brand` VALUES (42, 'vivo测试专用', 28, NULL, 1, 1587181612, 1587181612);

-- ----------------------------
-- Table structure for category_sales_attribute
-- ----------------------------
DROP TABLE IF EXISTS `category_sales_attribute`;
CREATE TABLE `category_sales_attribute`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(255) NULL DEFAULT NULL COMMENT '类目的id',
  `sales_attribute_id` int(255) NULL DEFAULT NULL COMMENT '销售属性的id',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categorysalesattribute`(`category_id`, `sales_attribute_id`) USING BTREE COMMENT '中间表数据唯一索引'
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for category_small
-- ----------------------------
DROP TABLE IF EXISTS `category_small`;
CREATE TABLE `category_small`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目品牌名称',
  `category_id` int(255) NULL DEFAULT NULL COMMENT '类目的id',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_small
-- ----------------------------
INSERT INTO `category_small` VALUES (60, 'IQOO3', 28, NULL, 1, 1587179499, 1587179499);

-- ----------------------------
-- Table structure for clientlist
-- ----------------------------
DROP TABLE IF EXISTS `clientlist`;
CREATE TABLE `clientlist`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `parent_id` int(255) NULL DEFAULT NULL COMMENT '父路径:根目录0',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `iconb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图标',
  `iconm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图标',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientlist
-- ----------------------------
INSERT INTO `clientlist` VALUES (4, '地址管理', 1, 2, 1568251330, 1570067171, NULL, 'Personal/address', '', '', 1);
INSERT INTO `clientlist` VALUES (6, '订单管理', 5, 0, 1568251330, 1568251330, NULL, 'Personal/order', NULL, NULL, 1);
INSERT INTO `clientlist` VALUES (7, '退款售后', 5, 1, 1568251330, 1568251330, NULL, 'Personal/change', NULL, NULL, 1);
INSERT INTO `clientlist` VALUES (8, '评价商品', 5, 2, 1568251330, 1568251330, NULL, 'Personal/comment', NULL, NULL, 1);
INSERT INTO `clientlist` VALUES (10, '账单明细', 9, 0, 1568251330, 1568251330, NULL, NULL, NULL, NULL, 1);
INSERT INTO `clientlist` VALUES (11, '我的收藏', 0, 3, 1568251330, 1568251330, NULL, NULL, NULL, 'am-icon-tags', 1);
INSERT INTO `clientlist` VALUES (12, '收藏', 11, 0, 1568251330, 1568251330, NULL, 'Personal/collection', NULL, NULL, 1);
INSERT INTO `clientlist` VALUES (13, '在线客服', 0, 4, 1568251330, 1587094100, NULL, NULL, NULL, 'am-icon-qq', -1);
INSERT INTO `clientlist` VALUES (14, '意见反馈', 13, 0, 1568251330, 1587094067, NULL, NULL, NULL, NULL, -1);
INSERT INTO `clientlist` VALUES (3, '安全设置', 1, 1, 1568251311, 1569381691, NULL, 'Personal/safety', '', '', 1);
INSERT INTO `clientlist` VALUES (2, '个人信息', 1, 0, 1568249949, 1568255322, NULL, 'Personal/information', '', '', 1);
INSERT INTO `clientlist` VALUES (1, '个人资料', 0, 0, 1568249719, 1587094364, NULL, '', '', 'am-icon-newspaper-o', 1);
INSERT INTO `clientlist` VALUES (5, '我的交易', 0, 2, NULL, NULL, NULL, NULL, NULL, 'am-icon-balance-scale', 1);
INSERT INTO `clientlist` VALUES (85, '测试', 0, 8, 1587093178, 1587093217, NULL, '', '', '', -1);
INSERT INTO `clientlist` VALUES (86, '4.17测试', 0, 44, 1587093206, 1587093222, NULL, '', '', '', -1);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (34, '1', '68', 1, 1559782913, 1569810132, 1);
INSERT INTO `collection` VALUES (35, '2', '68', 15, 1559782993, 1569813203, 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `orderform_id` int(255) NULL DEFAULT NULL COMMENT '订单的id',
  `client_id` int(255) NULL DEFAULT NULL COMMENT '客户的id',
  `client_type` int(255) NULL DEFAULT NULL COMMENT '客户的类型（1：微信；2：qq；3：注册）',
  `orderformattributes` int(255) NULL DEFAULT NULL COMMENT '订单的销售属性',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 4, 4, 68, 1, 0, 'hao', 1, 1, 1563026776, 1562400612);

-- ----------------------------
-- Table structure for couriercompany
-- ----------------------------
DROP TABLE IF EXISTS `couriercompany`;
CREATE TABLE `couriercompany`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `expcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司编码',
  `order` int(255) NULL DEFAULT 1 COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of couriercompany
-- ----------------------------
INSERT INTO `couriercompany` VALUES (1, '顺丰速运', 'shunfeng', 1, 1, 1563026776, 1562400612);
INSERT INTO `couriercompany` VALUES (2, '中通快递', 'zhongtong', 1, 1, 1563458776, 1);
INSERT INTO `couriercompany` VALUES (3, '申通快递', 'shentong', 1, 1, 1565445976, 1573981694);
INSERT INTO `couriercompany` VALUES (4, '圆通速递', 'yuantong', 1, 1, 1565618776, 1);
INSERT INTO `couriercompany` VALUES (5, '韵达速递', 'yunda', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for merchant_account
-- ----------------------------
DROP TABLE IF EXISTS `merchant_account`;
CREATE TABLE `merchant_account`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家登录账号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家登录邮箱',
  `verifycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱验证码',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家登录密码',
  `code` int(255) NULL DEFAULT NULL COMMENT '随机码',
  `status` int(255) NULL DEFAULT 0 COMMENT '状态；1为正常，0为异常',
  `last_login_time` int(255) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_account
-- ----------------------------
INSERT INTO `merchant_account` VALUES (2, 'admin2', '13573460296', '63492473@22.com', 'ef6ouev5', '0662c1adf75a827ba8bedf32ec2b7f01', 1022, 1, NULL, 1554169340, 1554169340, NULL);
INSERT INTO `merchant_account` VALUES (1, 'admin1', '13573460289', '963492473qqcom', 'ef6ouev5', '0662c1adf75a827ba8bedf32ec2b7f01', 1022, 1, NULL, 1567418982, 1576205714, NULL);
INSERT INTO `merchant_account` VALUES (57, NULL, NULL, '458675926@qq.com', 'ivqhr8hq', NULL, NULL, 1, NULL, 1586661349, 1586661349, NULL);
INSERT INTO `merchant_account` VALUES (58, NULL, NULL, '1941952725@qq.com', 'urgc459o', NULL, NULL, 1, NULL, 1586943932, 1586943932, NULL);

-- ----------------------------
-- Table structure for merchant_company
-- ----------------------------
DROP TABLE IF EXISTS `merchant_company`;
CREATE TABLE `merchant_company`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `infoid` int(255) NULL DEFAULT NULL COMMENT '商家基本信息的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `license` int(255) NULL DEFAULT NULL COMMENT '执照信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执照图片',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执照地址',
  `person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_company
-- ----------------------------
INSERT INTO `merchant_company` VALUES (2, 2, '易课培训学院', 123456, 'uploads/merchant/merchant1569639954.png', '山东德州', '李四', 1, 1569640039, 1569640039);
INSERT INTO `merchant_company` VALUES (1, 1, '易联科技有限公司', 2147483647, '/uploads/merchant/merchant1569639954.png', '山东德州', '张三', 1, 1569640039, 1569640039);

-- ----------------------------
-- Table structure for merchant_info
-- ----------------------------
DROP TABLE IF EXISTS `merchant_info`;
CREATE TABLE `merchant_info`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `accountid` int(255) NULL DEFAULT NULL COMMENT '商家账号的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺图标',
  `operating` int(255) NULL DEFAULT NULL COMMENT '经营项目',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `contant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `qq` int(255) NULL DEFAULT NULL COMMENT 'qq',
  `status` int(255) NULL DEFAULT 0 COMMENT '状态；1为正常，0为异常',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountid`(`accountid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_info
-- ----------------------------
INSERT INTO `merchant_info` VALUES (1, 1, '于木2019', '/uploads/merchant/merchant1569805208.png', 31, '3', '0', '0', '重庆市-重庆市-渝中区', '张三2019', '18888888890', 888890, 1, 10, 1569640039, 1569813401);
INSERT INTO `merchant_info` VALUES (2, 2, '于木', '/uploads/merchant/merchant1569805208.png', 31, '3', '0', '0', '重庆市-重庆市-渝中区', '张三2019', '18888888890', 888890, 1, 10, 1569640039, 1586930330);
INSERT INTO `merchant_info` VALUES (4, 4, '6666', '6666', 666, '666', '0', '0', '666', '6666', '66', 6, 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for merchant_settlement
-- ----------------------------
DROP TABLE IF EXISTS `merchant_settlement`;
CREATE TABLE `merchant_settlement`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `infoid` int(255) NULL DEFAULT NULL COMMENT '商家基本信息的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户名',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行市',
  `branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户网点',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_settlement
-- ----------------------------
INSERT INTO `merchant_settlement` VALUES (1, 1, '易联科技99', '89854566455666652499', '中国建设银行99', '15', '3', '中国建设银行德州分行99', 1);
INSERT INTO `merchant_settlement` VALUES (2, 2, '于木', '5556665', '工商银行', '0', '', '6666', 1);

-- ----------------------------
-- Table structure for merchantlist
-- ----------------------------
DROP TABLE IF EXISTS `merchantlist`;
CREATE TABLE `merchantlist`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `parent_id` int(255) NULL DEFAULT NULL COMMENT '父路径:根目录0',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `iconb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图标',
  `iconm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图标',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchantlist
-- ----------------------------
INSERT INTO `merchantlist` VALUES (67, '修改登录密码', 58, 3, 1569724068, 1569724068, NULL, 'Shop/password', '', '', 1);
INSERT INTO `merchantlist` VALUES (59, '财务管理', 0, 2, 1568251330, 1570067171, NULL, '', '', '', -1);
INSERT INTO `merchantlist` VALUES (84, '银行账号', 79, 4, 1574824054, 1574824054, NULL, 'Bill/bank', NULL, NULL, 1);
INSERT INTO `merchantlist` VALUES (83, '已结算表', 79, 3, 1574824054, 1574824054, NULL, 'Bill/billsuccesslist', NULL, NULL, 1);
INSERT INTO `merchantlist` VALUES (81, '订单明细', 79, 1, 1574824054, 1574824392, NULL, 'Bill/paylist', '', '', 1);
INSERT INTO `merchantlist` VALUES (82, '结算中表', 79, 2, 1574824054, 1574824054, NULL, 'Bill/bill', NULL, NULL, 1);
INSERT INTO `merchantlist` VALUES (79, '结算中心', 0, 10, 1574386869, 1574386869, NULL, '', 'glyphicon', 'glyphicon-usd', 1);
INSERT INTO `merchantlist` VALUES (77, '物流列表', 76, 1, 1574045422, 1574238416, NULL, 'Logistics/logisticlist', '', '', 1);
INSERT INTO `merchantlist` VALUES (76, '物流管理', 0, 5, 1574043539, 1574213253, NULL, '', 'fa', 'fa-globe', 1);
INSERT INTO `merchantlist` VALUES (75, '订单列表', 74, 1, 1573786234, 1573786234, NULL, 'Orderform/orderlist', '', '', 1);
INSERT INTO `merchantlist` VALUES (74, '订单管理', 0, 4, 1573786155, 1573786155, NULL, '', 'glyphicon', 'glyphicon-barcode', 1);
INSERT INTO `merchantlist` VALUES (73, '活动列表', 72, 1, 1573263593, 1573263695, NULL, 'Productactivity/index', '', '', 1);
INSERT INTO `merchantlist` VALUES (72, '活动管理', 0, 3, 1573263431, 1573263475, NULL, '', ' fa', ' fa-gift', 1);
INSERT INTO `merchantlist` VALUES (71, '产品列表', 69, 2, 1571730315, 1571730315, NULL, 'Product/index', '', '', 1);
INSERT INTO `merchantlist` VALUES (70, '添加产品', 69, 0, 1570067247, 1570067247, NULL, 'Product/categorylist', '', '', 1);
INSERT INTO `merchantlist` VALUES (69, '产品管理', 0, 2, 1570067141, 1570067223, NULL, '', 'glyphicon', 'glyphicon-th-large', 1);
INSERT INTO `merchantlist` VALUES (68, '修改基本信息', 58, 4, 1569725094, 1569725094, NULL, 'Shop/info', '', '', 1);
INSERT INTO `merchantlist` VALUES (66, '修改登录邮箱', 58, 1, 1569723397, 1569723397, NULL, 'Shop/email', '', '', 1);
INSERT INTO `merchantlist` VALUES (64, '修改账户信息', 58, 5, 1569397412, 1569397412, NULL, 'Shop/settlement', '', '', 1);
INSERT INTO `merchantlist` VALUES (65, '修改登录手机', 58, 0, 1569397435, 1569397435, NULL, 'Shop/mobile', '', '', 1);
INSERT INTO `merchantlist` VALUES (58, '个人中心', 0, 1, 1568251311, 1586921322, NULL, '', ' glyphicon', ' glyphicon-home', 1);
INSERT INTO `merchantlist` VALUES (57, '账户信息221', 56, 0, 1568249949, 1568255322, NULL, '11', '', '', 1);
INSERT INTO `merchantlist` VALUES (56, '测试基本信息55', 0, 3, 1568249719, 1587090082, NULL, '', '', '', 0);
INSERT INTO `merchantlist` VALUES (85, '4.17测试', 0, 6, 1587091465, 1587176009, NULL, '', '', '', -1);
INSERT INTO `merchantlist` VALUES (86, '666', 0, 99, 1587092792, 1587092820, NULL, '', '', '', -1);

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超级练级',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navigation
-- ----------------------------
INSERT INTO `navigation` VALUES (27, '团购123', '团购的信息', 'Tuan/gou', 2, 1, 1558942711, 1558926822);
INSERT INTO `navigation` VALUES (26, '首页', '主站的首页', NULL, 1, 1, 1569813159, 1558926724);

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部订单号',
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部订单号（微信或支付宝）',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商家的id',
  `client_id` int(255) NULL DEFAULT NULL COMMENT '客户的id',
  `client_type` int(255) NULL DEFAULT NULL COMMENT '客户的类型（1：微信；2：qq；3：注册）',
  `shippingaddress_id` int(11) NULL DEFAULT NULL COMMENT '客户收货地址的id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `pay_status` int(11) NULL DEFAULT 0 COMMENT '付款状态（0：未付款；1：已付款）',
  `logistics_status` int(11) NULL DEFAULT 0 COMMENT '物流状态（0：未发货；1：已发货；2：已收货）',
  `buy_count` int(255) NULL DEFAULT NULL COMMENT '销售数量',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `attributes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性：0无',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES (1, 7, '20190813001', '8888001', 2, 68, 1, NULL, 230.00, 0, 0, 1, 1, '0', 1, 1563026776, 1562400612);
INSERT INTO `orderform` VALUES (2, 4, '20190813002', '8888002', 1, 68, 1, NULL, 300.00, 1, 0, 1, 1, '0', 1, 1575077929, 1575077929);
INSERT INTO `orderform` VALUES (3, 4, '20190813003', '8888003', 1, 68, 1, NULL, 200.00, -2, 0, 1, 1, '0', 1, 1575077929, 1575077929);
INSERT INTO `orderform` VALUES (4, 4, '20190813004', '8888004', 1, 68, 1, NULL, 100.00, 0, 0, 1, 1, '1', 1, 1572146106, 1572146106);
INSERT INTO `orderform` VALUES (5, 4, '20190813005', '8888005', 1, 68, 1, 1, 50.00, 1, 1, 1, 1, '1', 1, 1572146106, 1572146106);
INSERT INTO `orderform` VALUES (66, 17, '44541585992449', NULL, 2, 68, 3, 1, 34.90, 0, 0, 1, NULL, '48,41', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (65, 12, '44541585992449', NULL, 2, 68, 3, 1, 228.30, 0, 0, 1, NULL, '49,41', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (64, 19, '44541585992449', NULL, 2, 68, 3, 1, 48.00, 0, 0, 4, NULL, '1,41', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (63, 15, '44541585992449', NULL, 2, 68, 3, 1, 89.10, 0, 0, 1, NULL, '51,41', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (62, 18, '63761585992302', NULL, 2, 68, 3, 1, 38.00, 0, 0, 1, NULL, '37,41', 1, 1585992302, 1585992302);
INSERT INTO `orderform` VALUES (61, 15, '54131585991860', NULL, 2, 68, 3, 1, 89.40, 0, 0, 2, NULL, '52,42', 1, 1585991860, 1585991860);
INSERT INTO `orderform` VALUES (58, 13, '28051585991192', NULL, 1, 68, 3, 1, 388.00, 0, 0, 3, NULL, '49,41', 1, 1585991192, 1585991192);
INSERT INTO `orderform` VALUES (60, 15, '54131585991860', NULL, 2, 68, 3, 1, 89.20, 0, 0, 2, NULL, '51,42', 1, 1585991860, 1585991860);
INSERT INTO `orderform` VALUES (59, 13, '54131585991860', NULL, 1, 68, 3, 1, 388.00, 0, 0, 3, NULL, '49,41', 1, 1585991860, 1585991860);
INSERT INTO `orderform` VALUES (67, 12, '44541585992449', NULL, 2, 68, 3, 1, 228.40, 0, 0, 1, NULL, '49,42', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (68, 15, '44541585992449', NULL, 2, 68, 3, 1, 89.20, 0, 0, 2, NULL, '51,42', 1, 1585992449, 1585992449);
INSERT INTO `orderform` VALUES (69, 20, '44541585992449', NULL, 1, 68, 3, 1, 19.90, 0, 0, 2, NULL, '0', 1, 1585992449, 1585992449);

-- ----------------------------
-- Table structure for orderform_logistics
-- ----------------------------
DROP TABLE IF EXISTS `orderform_logistics`;
CREATE TABLE `orderform_logistics`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderform_id` int(11) NULL DEFAULT 0 COMMENT '订单的id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品id',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商家id',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `salesattribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人所在地区',
  `addressname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货详细地址',
  `addressmobilephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `expcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `expno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司运单号',
  `order` int(255) NULL DEFAULT 1 COMMENT '排序',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform_logistics
-- ----------------------------
INSERT INTO `orderform_logistics` VALUES (41, 5, 4, 1, '20190813005', '尺码：170/84A;颜色：红色;', '山东省-德州市-德城区', '孙先生', '德兴北大道1966号', '135', 'yuantong', 'YT4173627736799', 1, 1, 1574237753, 1574237753);

-- ----------------------------
-- Table structure for orderform_sales_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `orderform_sales_attribute_value`;
CREATE TABLE `orderform_sales_attribute_value`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderform_id` int(255) NULL DEFAULT NULL COMMENT '订单id',
  `sales_attribute_value_id` int(255) NULL DEFAULT 1 COMMENT '销售属性值的id',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of orderform_sales_attribute_value
-- ----------------------------
INSERT INTO `orderform_sales_attribute_value` VALUES (3, 4, 41, NULL, NULL);
INSERT INTO `orderform_sales_attribute_value` VALUES (2, 4, 1, 1563676181, 1563799850);
INSERT INTO `orderform_sales_attribute_value` VALUES (5, 5, 42, NULL, NULL);
INSERT INTO `orderform_sales_attribute_value` VALUES (4, 5, 1, NULL, NULL);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单号',
  `orderform_id` int(255) NULL DEFAULT NULL COMMENT '订单号',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部订单号',
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部订单号（微信或支付宝）',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商家的id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `bill_status` int(255) NULL DEFAULT NULL COMMENT '结算状态（0：未结算；1:已结算）',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '付款状态（0：未付款；1：已付款）',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (3, NULL, 2, 4, '20190813002', '8888002', 1, 300.00, 0, 1, 1, 1575077929, 1575077929);
INSERT INTO `pay` VALUES (4, NULL, 3, 4, '20190813003', '8888003', 1, 200.00, 0, 1, 1, 1575077929, 1575077929);
INSERT INTO `pay` VALUES (2, '1575084175266264', 4, 4, '20190813004', '8888004', 1, 100.00, 1, 1, 1, 1572146106, 1572146106);
INSERT INTO `pay` VALUES (1, '1575084175266264', 5, 4, '20190813005', '8888005', 1, 50.00, 1, 1, 1, 1572146106, 1572146106);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '商品大类的id',
  `se_category_id` int(11) NULL DEFAULT NULL COMMENT '商品小类的id',
  `categorysmall_id` int(11) NULL DEFAULT NULL COMMENT '产品子类',
  `merchantinfoid` int(255) NULL DEFAULT NULL COMMENT '商家基本信息的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的名称',
  `categorybrand` int(11) NULL DEFAULT NULL COMMENT '是否有所属品牌：1有，0无',
  `categoryattribute` int(11) NULL DEFAULT NULL COMMENT '是否有类目属性：1有，0无',
  `salesattribute` int(11) NULL DEFAULT NULL COMMENT '是否有销售属性：1有，0无',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `total_count` int(255) NULL DEFAULT NULL COMMENT '总数量',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品的详细信息',
  `rebate_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣价',
  `buy_count` int(255) NULL DEFAULT 0 COMMENT '销售数量',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `indextop` int(11) NULL DEFAULT NULL COMMENT '是否在首页显示：1显示；0不显示',
  `server` int(11) NULL DEFAULT NULL COMMENT '是否有服务：1有，0无',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 27, 28, NULL, 1, '测试产品1', 1, 1, 1, 3.00, 33, '&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 0, 2, 1571728903, 1571728903);
INSERT INTO `product` VALUES (2, 27, 28, NULL, 1, '测试产品2', 0, 1, 0, 1.00, 0, '&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 0, 2, 1571715167, 1571715167);
INSERT INTO `product` VALUES (3, 27, 28, NULL, 1, '测试产品3', 0, 1, 0, 1.00, 1, '&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 0, 2, 1571714986, 1571714986);
INSERT INTO `product` VALUES (4, 27, 28, NULL, 1, '测试产品4', 1, 1, 1, 4.00, 23, '&amp;lt;p&amp;gt;1&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 1, 2, 1571729962, 1571729962);
INSERT INTO `product` VALUES (5, 27, 28, NULL, 2, '女装测试', 1, 1, 1, 3.00, 3, '&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 1, 2, 1571814711, 1571814711);
INSERT INTO `product` VALUES (6, 27, 28, NULL, 2, '风光', 0, 0, 0, 1.00, 1, '&amp;lt;p&amp;gt;1&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 0, 2, 1571877466, 1571877466);
INSERT INTO `product` VALUES (7, 27, 28, NULL, 2, '产品测试更新测试', 1, 1, 1, 15.00, 66, '&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;产品测试&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 1, 2, 1572223816, 1572400882);
INSERT INTO `product` VALUES (12, 27, 28, 41, 2, 'vivo', 0, 1, 1, 9999.00, 6000, '&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586953090349788.jpeg&amp;quot; title=&amp;quot;1586953090349788.jpeg&amp;quot; alt=&amp;quot;46b76542621545ec8116fbb419631188.jpeg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586953093822378.jpeg&amp;quot; title=&amp;quot;1586953093822378.jpeg&amp;quot; alt=&amp;quot;058c3c2fc0ff730cf05ad2d001d9181d.jpeg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586953095171058.jpg&amp;quot; title=&amp;quot;1586953095171058.jpg&amp;quot; alt=&amp;quot;407a28542cbbe8a13d2389ce2c2f54c0.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586953099850601.jpg&amp;quot; title=&amp;quot;1586953099850601.jpg&amp;quot; alt=&amp;quot;539d7a79ff714fcc67aa7a06fb2dc580.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 12, 0, 1, 1, 1, 1580301395, 1586953118);
INSERT INTO `product` VALUES (13, 27, 28, 41, 1, '短款羽绒服2019年新款女爆款时尚韩版小个子白鸭绒女装冬装短', 0, 1, 1, 388.00, 3000, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580301994.jpg&amp;quot; title=&amp;quot;1580301994.jpg&amp;quot; alt=&amp;quot;s1.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580301999.jpg&amp;quot; title=&amp;quot;1580301999.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302003.jpg&amp;quot; title=&amp;quot;1580302003.jpg&amp;quot; alt=&amp;quot;s3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302007.jpg&amp;quot; title=&amp;quot;1580302007.jpg&amp;quot; alt=&amp;quot;s4.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302012.jpg&amp;quot; title=&amp;quot;1580302012.jpg&amp;quot; alt=&amp;quot;s5.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302017.jpg&amp;quot; title=&amp;quot;1580302017.jpg&amp;quot; alt=&amp;quot;s6.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302022.jpg&amp;quot; title=&amp;quot;1580302022.jpg&amp;quot; alt=&amp;quot;s7.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302026.jpg&amp;quot; title=&amp;quot;1580302026.jpg&amp;quot; alt=&amp;quot;s8.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302030.jpg&amp;quot; title=&amp;quot;1580302030.jpg&amp;quot; alt=&amp;quot;s9.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302035.jpg&amp;quot; title=&amp;quot;1580302035.jpg&amp;quot; alt=&amp;quot;s10.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302039.jpg&amp;quot; title=&amp;quot;1580302039.jpg&amp;quot; alt=&amp;quot;s11.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302045.jpg&amp;quot; title=&amp;quot;1580302045.jpg&amp;quot; alt=&amp;quot;s12.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302051.jpg&amp;quot; title=&amp;quot;1580302051.jpg&amp;quot; alt=&amp;quot;s13.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 21, 0, 1, 1, 1, 1580302084, 1580350614);
INSERT INTO `product` VALUES (14, 27, 28, 41, 2, '羽绒棉服女短款冬季2019新款韩版ins面包服棉袄宽松加厚棉', 0, 1, 1, 69.90, 6000, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302531.jpg&amp;quot; title=&amp;quot;1580302531.jpg&amp;quot; alt=&amp;quot;s1.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302539.jpg&amp;quot; title=&amp;quot;1580302539.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302544.jpg&amp;quot; title=&amp;quot;1580302544.jpg&amp;quot; alt=&amp;quot;s3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302549.jpg&amp;quot; title=&amp;quot;1580302549.jpg&amp;quot; alt=&amp;quot;s4.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302553.jpg&amp;quot; title=&amp;quot;1580302553.jpg&amp;quot; alt=&amp;quot;s5.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302558.jpg&amp;quot; title=&amp;quot;1580302558.jpg&amp;quot; alt=&amp;quot;s6.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302562.jpg&amp;quot; title=&amp;quot;1580302562.jpg&amp;quot; alt=&amp;quot;s7.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302566.jpg&amp;quot; title=&amp;quot;1580302566.jpg&amp;quot; alt=&amp;quot;s8.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302571.jpg&amp;quot; title=&amp;quot;1580302571.jpg&amp;quot; alt=&amp;quot;s9.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580302575.jpg&amp;quot; title=&amp;quot;1580302575.jpg&amp;quot; alt=&amp;quot;s10.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 1, 1, 1580302600, 1580350608);
INSERT INTO `product` VALUES (15, 27, 28, 43, 2, '格子毛呢外套女中长款2019秋冬新款流行韩版小个子粗花呢子大', 0, 1, 1, 89.80, 4000, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580303057.png&amp;quot; title=&amp;quot;1580303057.png&amp;quot; alt=&amp;quot;s1.png&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580303063.jpg&amp;quot; title=&amp;quot;1580303063.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200129/1580303068.png&amp;quot; title=&amp;quot;1580303068.png&amp;quot; alt=&amp;quot;s3.png&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 20, 0, 1, 1, 1, 1580303085, 1580350601);
INSERT INTO `product` VALUES (16, 27, 29, 48, 2, '花花公子秋冬款卫衣男加绒长袖t恤圆领宽松加厚打底衫潮上衣男装', 1, 1, 1, 59.00, 2000, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580370238.jpg&amp;quot; title=&amp;quot;1580370238.jpg&amp;quot; alt=&amp;quot;s1.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580370245.jpg&amp;quot; title=&amp;quot;1580370245.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580370250.jpg&amp;quot; title=&amp;quot;1580370250.jpg&amp;quot; alt=&amp;quot;s3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580370257.jpg&amp;quot; title=&amp;quot;1580370257.jpg&amp;quot; alt=&amp;quot;s4.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580370269.jpg&amp;quot; title=&amp;quot;1580370269.jpg&amp;quot; alt=&amp;quot;s5.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 1, 1, 1580370320, 1580373422);
INSERT INTO `product` VALUES (17, 27, 30, 53, 2, '内裤女纯棉蕾丝抗菌无痕都市100%全棉中腰收腹性感丽人莫代尔', 0, 1, 1, 34.90, 400, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372112.jpg&amp;quot; title=&amp;quot;1580372112.jpg&amp;quot; alt=&amp;quot;s1.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372117.jpg&amp;quot; title=&amp;quot;1580372117.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372122.jpg&amp;quot; title=&amp;quot;1580372122.jpg&amp;quot; alt=&amp;quot;s3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372127.jpg&amp;quot; title=&amp;quot;1580372127.jpg&amp;quot; alt=&amp;quot;s4.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372131.jpg&amp;quot; title=&amp;quot;1580372131.jpg&amp;quot; alt=&amp;quot;s5.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372136.jpg&amp;quot; title=&amp;quot;1580372136.jpg&amp;quot; alt=&amp;quot;s6.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372141.jpg&amp;quot; title=&amp;quot;1580372141.jpg&amp;quot; alt=&amp;quot;s7.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372145.jpg&amp;quot; title=&amp;quot;1580372145.jpg&amp;quot; alt=&amp;quot;s8.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372150.jpg&amp;quot; title=&amp;quot;1580372150.jpg&amp;quot; alt=&amp;quot;s9.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372154.jpg&amp;quot; title=&amp;quot;1580372154.jpg&amp;quot; alt=&amp;quot;s10.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200130/1580372165.jpg&amp;quot; title=&amp;quot;1580372165.jpg&amp;quot; alt=&amp;quot;s11.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 1, 1, 1580372195, 1580373439);
INSERT INTO `product` VALUES (18, 27, 30, 54, 2, 'IQOO pro', 0, 1, 1, 9999.00, 400, '&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp;超级好用的手机&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200418/1587176122759785.jpg&amp;quot; title=&amp;quot;1587176122759785.jpg&amp;quot; alt=&amp;quot;d9c3f3db40d9cdb0c810b905231c6c76.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 1, 1, 1580372930, 1587176221);
INSERT INTO `product` VALUES (24, 27, 28, 60, 2, 'IQOO3', 0, 0, 0, 4444.00, 0, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200418/1587180848838006.jpg&amp;quot; title=&amp;quot;1587180848838006.jpg&amp;quot; alt=&amp;quot;IQOO3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200418/1587180852789672.jpg&amp;quot; title=&amp;quot;1587180852789672.jpg&amp;quot; alt=&amp;quot;d9c3f3db40d9cdb0c810b905231c6c76.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 1, 1, 0, 1, 1587180873, 1587221460);
INSERT INTO `product` VALUES (19, 27, 30, 54, 2, 'IQOO3', 0, 1, 1, 5000.00, 400, '&amp;lt;p&amp;gt;									&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586951396366919.jpeg&amp;quot; title=&amp;quot;1586951396366919.jpeg&amp;quot; alt=&amp;quot;46b76542621545ec8116fbb419631188.jpeg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586951404212001.jpeg&amp;quot; title=&amp;quot;1586951404212001.jpeg&amp;quot; alt=&amp;quot;058c3c2fc0ff730cf05ad2d001d9181d.jpeg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200415/1586951410590656.jpg&amp;quot; title=&amp;quot;1586951410590656.jpg&amp;quot; alt=&amp;quot;407a28542cbbe8a13d2389ce2c2f54c0.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 1, 1, 1580373407, 1586951414);
INSERT INTO `product` VALUES (20, 27, 28, 58, 1, '超火cec纯棉黄色t恤女短袖2020新款潮白色宽松体恤上衣春', 0, 0, 0, 19.90, 0, '&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990449.jpg&amp;quot; title=&amp;quot;1581990449.jpg&amp;quot; alt=&amp;quot;s1.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990454.jpg&amp;quot; title=&amp;quot;1581990454.jpg&amp;quot; alt=&amp;quot;s2.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990463.jpg&amp;quot; title=&amp;quot;1581990463.jpg&amp;quot; alt=&amp;quot;s3.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990473.jpg&amp;quot; title=&amp;quot;1581990473.jpg&amp;quot; alt=&amp;quot;s4.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990479.jpg&amp;quot; title=&amp;quot;1581990479.jpg&amp;quot; alt=&amp;quot;s5.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990485.jpg&amp;quot; title=&amp;quot;1581990485.jpg&amp;quot; alt=&amp;quot;s6.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990490.jpg&amp;quot; title=&amp;quot;1581990490.jpg&amp;quot; alt=&amp;quot;s7.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990495.jpg&amp;quot; title=&amp;quot;1581990495.jpg&amp;quot; alt=&amp;quot;s8.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990500.jpg&amp;quot; title=&amp;quot;1581990500.jpg&amp;quot; alt=&amp;quot;s9.jpg&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200218/1581990504.jpg&amp;quot; title=&amp;quot;1581990504.jpg&amp;quot; alt=&amp;quot;s10.jpg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', NULL, 0, 0, NULL, 1, 1, 1581990526, 1581990579);
INSERT INTO `product` VALUES (22, 31, 32, 0, 1, '李宁鞋子', 0, 0, 0, 999.00, 0, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200407/1586229570145722.jpg&amp;quot; title=&amp;quot;1586229570145722.jpg&amp;quot; alt=&amp;quot;test_sneaker.jpg&amp;quot;/&amp;gt;									 &amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666&amp;lt;/p&amp;gt;', NULL, 0, 0, 1, 0, 1, 1586229388, 1587221127);
INSERT INTO `product` VALUES (23, 27, 28, 0, 1, 'vivo测试手机', 0, 0, 1, 999.00, 300, '&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;/ueditor/php/upload/image/20200412/1586671837467570.jpeg&amp;quot; title=&amp;quot;1586671837467570.jpeg&amp;quot; alt=&amp;quot;46b76542621545ec8116fbb419631188.jpeg&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;测试&amp;lt;/p&amp;gt;', NULL, 0, 1, NULL, 0, 1, 1586671880, 1586671942);

-- ----------------------------
-- Table structure for product_activity
-- ----------------------------
DROP TABLE IF EXISTS `product_activity`;
CREATE TABLE `product_activity`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchantinfoid` int(11) NULL DEFAULT NULL COMMENT '商家id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品的id',
  `total` int(11) NULL DEFAULT NULL COMMENT '活动商品的限制数量',
  `sold_quantity` int(255) NULL DEFAULT 0 COMMENT '活动商品的已销售数量',
  `activity_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '活动价格',
  `start_time` int(255) NULL DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(255) NULL DEFAULT NULL COMMENT '活动结束时间',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `indextop` int(11) NULL DEFAULT 0 COMMENT '是否在首页显示：1显示；0不显示',
  `status` int(255) NULL DEFAULT 2 COMMENT '状态；1为正常，0为禁用，-1是删除，2是待审核，3是不通过',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of product_activity
-- ----------------------------
INSERT INTO `product_activity` VALUES (1, 1, 1, 55, 0, 114.00, 1573401600, 1575648000, 0, 0, 2, 1573263294, 1573268764);
INSERT INTO `product_activity` VALUES (2, 2, 5, 20, 0, 1.00, 1573228800, 1576512000, 0, 0, 2, 1573263117, 1573263117);
INSERT INTO `product_activity` VALUES (42, 2, 15, 100, 0, 51.00, 1580313600, 1582732800, 0, 0, 1, 1580351279, 1580351494);
INSERT INTO `product_activity` VALUES (43, 2, 14, 100, 0, 61.00, 1580313600, 1582646400, 0, 0, 1, 1580351538, 1580353246);
INSERT INTO `product_activity` VALUES (44, 2, 13, 100, 0, 88.00, 1580313600, 1579708800, 0, 0, 1, 1580353286, 1580353303);
INSERT INTO `product_activity` VALUES (45, 2, 12, 100, 0, 99.00, 1577635200, 1588649050, 0, 0, 1, 1580353351, 1580353366);

-- ----------------------------
-- Table structure for product_address
-- ----------------------------
DROP TABLE IF EXISTS `product_address`;
CREATE TABLE `product_address`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_address
-- ----------------------------
INSERT INTO `product_address` VALUES (1, 1, '0', '0', '0', 1571713188, 1571713188);
INSERT INTO `product_address` VALUES (2, 2, '0', '0', '0', 1571729963, 1571729963);
INSERT INTO `product_address` VALUES (3, 3, '0', '0', '0', 1571814711, 1571814711);
INSERT INTO `product_address` VALUES (4, 4, '0', '0', '0', 1571877466, 1571877466);
INSERT INTO `product_address` VALUES (5, 11, '15', '1', '0', 1572223816, 1572420491);
INSERT INTO `product_address` VALUES (6, 12, '15', '3', '0', 1580301396, 1580301396);
INSERT INTO `product_address` VALUES (7, 13, '15', '3', '0', 1580302085, 1580302085);
INSERT INTO `product_address` VALUES (8, 14, '15', '3', '0', 1580302600, 1580302600);
INSERT INTO `product_address` VALUES (9, 15, '15', '3', '0', 1580303085, 1580303085);
INSERT INTO `product_address` VALUES (10, 16, '15', '3', '0', 1580370321, 1580370321);
INSERT INTO `product_address` VALUES (11, 17, '15', '3', '0', 1580372196, 1580372196);
INSERT INTO `product_address` VALUES (12, 18, '0', '0', '1', 1580372931, 1587176172);
INSERT INTO `product_address` VALUES (13, 19, '15', '3', '0', 1580373407, 1580373407);
INSERT INTO `product_address` VALUES (14, 20, '15', '3', '0', 1581990527, 1581990527);
INSERT INTO `product_address` VALUES (15, 21, '0', '0', '0', 1582894828, 1582894828);
INSERT INTO `product_address` VALUES (16, 22, '15', '1', '1', 1586229388, 1586229388);
INSERT INTO `product_address` VALUES (17, 23, '3', '0', '2', 1586671880, 1586671880);
INSERT INTO `product_address` VALUES (18, 24, '1', '0', '2', 1587180873, 1587180873);

-- ----------------------------
-- Table structure for product_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `product_category_attribute_value`;
CREATE TABLE `product_category_attribute_value`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `category_attribute_id` int(11) NULL DEFAULT NULL COMMENT '类目属性的id',
  `category_attribute_value_id` int(11) NULL DEFAULT NULL COMMENT '类目属性值的id',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category_attribute_value
-- ----------------------------
INSERT INTO `product_category_attribute_value` VALUES (43, 4, 1, 1, 1573892268, 1573892268);
INSERT INTO `product_category_attribute_value` VALUES (44, 4, 35, 37, 1573892268, 1573892268);
INSERT INTO `product_category_attribute_value` VALUES (45, 4, 36, 43, 1573892268, 1573892268);
INSERT INTO `product_category_attribute_value` VALUES (46, 1, 1, 1, 1573892938, 1573892938);
INSERT INTO `product_category_attribute_value` VALUES (47, 1, 35, 37, 1573892938, 1573892938);
INSERT INTO `product_category_attribute_value` VALUES (48, 1, 36, 43, 1573892938, 1573892938);
INSERT INTO `product_category_attribute_value` VALUES (49, 12, 1, 3, 1580301395, 1580301395);
INSERT INTO `product_category_attribute_value` VALUES (50, 12, 35, 37, 1580301395, 1580301395);
INSERT INTO `product_category_attribute_value` VALUES (51, 12, 36, 43, 1580301395, 1580301395);
INSERT INTO `product_category_attribute_value` VALUES (52, 13, 1, 41, 1580302084, 1580302084);
INSERT INTO `product_category_attribute_value` VALUES (53, 13, 35, 42, 1580302085, 1580302085);
INSERT INTO `product_category_attribute_value` VALUES (54, 13, 36, 43, 1580302085, 1580302085);
INSERT INTO `product_category_attribute_value` VALUES (55, 14, 1, 41, 1580302600, 1580302600);
INSERT INTO `product_category_attribute_value` VALUES (56, 14, 35, 42, 1580302600, 1580302600);
INSERT INTO `product_category_attribute_value` VALUES (57, 14, 36, 43, 1580302600, 1580302600);
INSERT INTO `product_category_attribute_value` VALUES (58, 15, 1, 41, 1580303085, 1580303085);
INSERT INTO `product_category_attribute_value` VALUES (59, 15, 35, 37, 1580303085, 1580303085);
INSERT INTO `product_category_attribute_value` VALUES (60, 15, 36, 43, 1580303085, 1580303085);
INSERT INTO `product_category_attribute_value` VALUES (61, 16, 39, 51, 1580370321, 1580370321);
INSERT INTO `product_category_attribute_value` VALUES (62, 16, 40, 54, 1580370321, 1580370321);
INSERT INTO `product_category_attribute_value` VALUES (63, 16, 41, 57, 1580370321, 1580370321);
INSERT INTO `product_category_attribute_value` VALUES (64, 17, 42, 62, 1580372195, 1580372195);
INSERT INTO `product_category_attribute_value` VALUES (65, 17, 43, 66, 1580372195, 1580372195);
INSERT INTO `product_category_attribute_value` VALUES (66, 17, 44, 68, 1580372195, 1580372195);
INSERT INTO `product_category_attribute_value` VALUES (67, 18, 42, 62, 1580372930, 1580372930);
INSERT INTO `product_category_attribute_value` VALUES (68, 18, 43, 66, 1580372930, 1580372930);
INSERT INTO `product_category_attribute_value` VALUES (69, 18, 44, 69, 1580372930, 1580372930);
INSERT INTO `product_category_attribute_value` VALUES (70, 19, 42, 62, 1580373407, 1580373407);
INSERT INTO `product_category_attribute_value` VALUES (71, 19, 43, 66, 1580373407, 1580373407);
INSERT INTO `product_category_attribute_value` VALUES (72, 19, 44, 69, 1580373407, 1580373407);

-- ----------------------------
-- Table structure for product_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_category_brand`;
CREATE TABLE `product_category_brand`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `category_brand_id` int(11) NULL DEFAULT NULL COMMENT '类目品牌的id',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建日期',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category_brand
-- ----------------------------
INSERT INTO `product_category_brand` VALUES (2, 8, 1, 1571729962, 1571729962);
INSERT INTO `product_category_brand` VALUES (3, 9, 1, 1571814711, 1571814711);
INSERT INTO `product_category_brand` VALUES (26, 11, 1, 1572401397, 1572401397);
INSERT INTO `product_category_brand` VALUES (27, 4, 1, 1573892268, 1573892268);
INSERT INTO `product_category_brand` VALUES (28, 1, 1, 1573892938, 1573892938);
INSERT INTO `product_category_brand` VALUES (29, 16, 41, 1580370321, 1580370321);

-- ----------------------------
-- Table structure for product_extract
-- ----------------------------
DROP TABLE IF EXISTS `product_extract`;
CREATE TABLE `product_extract`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `extract` int(255) NULL DEFAULT NULL COMMENT '提取方式：0上门取货，1物流配送',
  `transportfree` int(255) NULL DEFAULT NULL COMMENT '是否包邮：1包邮；0不包邮',
  `fare` decimal(20, 2) NULL DEFAULT NULL COMMENT '运费',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of product_extract
-- ----------------------------
INSERT INTO `product_extract` VALUES (1, 1, 1, 0, 1.00, 1571713188, 1571713188);
INSERT INTO `product_extract` VALUES (2, 2, 1, 0, 1.00, 1571729963, 1571729963);
INSERT INTO `product_extract` VALUES (3, 3, 1, 0, 1.00, 1571814711, 1571814711);
INSERT INTO `product_extract` VALUES (4, 4, 1, 0, 1.00, 1571877466, 1571877466);
INSERT INTO `product_extract` VALUES (5, 11, 0, 1, 0.00, 1572223816, 1572420491);
INSERT INTO `product_extract` VALUES (6, 12, 1, 0, 10.00, 1580301396, 1580301396);
INSERT INTO `product_extract` VALUES (7, 13, 1, 0, 10.00, 1580302085, 1580302085);
INSERT INTO `product_extract` VALUES (8, 14, 1, 0, 10.00, 1580302600, 1580302600);
INSERT INTO `product_extract` VALUES (9, 15, 1, 0, 10.00, 1580303085, 1580303085);
INSERT INTO `product_extract` VALUES (10, 16, 1, 0, 10.00, 1580370321, 1580370321);
INSERT INTO `product_extract` VALUES (11, 17, 1, 0, 10.00, 1580372196, 1580372196);
INSERT INTO `product_extract` VALUES (12, 18, 1, 0, 12.00, 1580372931, 1587176172);
INSERT INTO `product_extract` VALUES (13, 19, 1, 0, 10.00, 1580373407, 1580373407);
INSERT INTO `product_extract` VALUES (14, 20, 1, 0, 10.00, 1581990527, 1581990527);
INSERT INTO `product_extract` VALUES (15, 21, 1, 0, 10.00, 1582894828, 1582894828);
INSERT INTO `product_extract` VALUES (16, 22, 1, 0, 12.00, 1586229388, 1586229388);
INSERT INTO `product_extract` VALUES (17, 23, 1, 0, 10.00, 1586671880, 1586671880);
INSERT INTO `product_extract` VALUES (18, 24, 1, 0, 10.00, 1587180873, 1587180873);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品的id',
  `picturebig` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标准图片地址',
  `picturesmall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图片地址',
  `picturefang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '放大镜图片地址',
  `pictureindex` int(255) NULL DEFAULT 0 COMMENT '1为主图',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 2, '/static/uploads/product/big/big1571713158.png', '/static/uploads/product/small/small1571713158.png', '/static/uploads/product/fang/fang1571713158.png', 1, 1571713188, 1571713188);
INSERT INTO `product_picture` VALUES (3, 10, '/static/uploads/product/big/big1571877441.png', '/static/uploads/product/small/small1571877441.png', '/static/uploads/product/fang/fang1571877441.png', 0, 1571877466, 1571877466);
INSERT INTO `product_picture` VALUES (15, 11, '/static/uploads/product/big/big1572223776.png', '/static/uploads/product/small/small1572223776.png', '/static/uploads/product/fang/fang1572223776.png', 1, 1572419471, 1572419471);
INSERT INTO `product_picture` VALUES (16, 11, '/static/uploads/product/big/big1572419424.png', '/static/uploads/product/small/small1572419424.png', '/static/uploads/product/fang/fang1572419424.png', 0, 1572419471, 1572419471);
INSERT INTO `product_picture` VALUES (17, 11, '/static/uploads/product/big/big1572419431.png', '/static/uploads/product/small/small1572419431.png', '/static/uploads/product/fang/fang1572419431.png', 0, 1572419471, 1572419471);
INSERT INTO `product_picture` VALUES (18, 11, '/static/uploads/product/big/big1572223776.png', '/static/uploads/product/small/small1572223776.png', '/static/uploads/product/fang/fang1572223776.png', 0, 1572419471, 1572419471);
INSERT INTO `product_picture` VALUES (19, 11, '/static/uploads/product/big/big1572223776.png', '/static/uploads/product/small/small1572223776.png', '/static/uploads/product/fang/fang1572223776.png', 0, 1572419471, 1572419471);
INSERT INTO `product_picture` VALUES (24, 13, '/static/uploads/product/big/big1580301786.png', '/static/uploads/product/small/small1580301786.png', '/static/uploads/product/fang/fang1580301786.png', 1, 1580302085, 1580302085);
INSERT INTO `product_picture` VALUES (25, 13, '/static/uploads/product/big/big1580301790.png', '/static/uploads/product/small/small1580301790.png', '/static/uploads/product/fang/fang1580301790.png', 0, 1580302085, 1580302085);
INSERT INTO `product_picture` VALUES (26, 13, '/static/uploads/product/big/big1580301793.png', '/static/uploads/product/small/small1580301793.png', '/static/uploads/product/fang/fang1580301793.png', 0, 1580302085, 1580302085);
INSERT INTO `product_picture` VALUES (27, 13, '/static/uploads/product/big/big1580301796.png', '/static/uploads/product/small/small1580301796.png', '/static/uploads/product/fang/fang1580301796.png', 0, 1580302085, 1580302085);
INSERT INTO `product_picture` VALUES (28, 13, '/static/uploads/product/big/big1580301799.png', '/static/uploads/product/small/small1580301799.png', '/static/uploads/product/fang/fang1580301799.png', 0, 1580302085, 1580302085);
INSERT INTO `product_picture` VALUES (29, 14, '/static/uploads/product/big/big1580302502.png', '/static/uploads/product/small/small1580302502.png', '/static/uploads/product/fang/fang1580302502.png', 1, 1580302600, 1580302600);
INSERT INTO `product_picture` VALUES (30, 14, '/static/uploads/product/big/big1580302506.png', '/static/uploads/product/small/small1580302506.png', '/static/uploads/product/fang/fang1580302506.png', 0, 1580302600, 1580302600);
INSERT INTO `product_picture` VALUES (31, 14, '/static/uploads/product/big/big1580302509.png', '/static/uploads/product/small/small1580302509.png', '/static/uploads/product/fang/fang1580302509.png', 0, 1580302600, 1580302600);
INSERT INTO `product_picture` VALUES (32, 14, '/static/uploads/product/big/big1580302513.png', '/static/uploads/product/small/small1580302513.png', '/static/uploads/product/fang/fang1580302513.png', 0, 1580302600, 1580302600);
INSERT INTO `product_picture` VALUES (33, 14, '/static/uploads/product/big/big1580302517.png', '/static/uploads/product/small/small1580302517.png', '/static/uploads/product/fang/fang1580302517.png', 0, 1580302600, 1580302600);
INSERT INTO `product_picture` VALUES (34, 15, '/static/uploads/product/big/big1580303016.png', '/static/uploads/product/small/small1580303016.png', '/static/uploads/product/fang/fang1580303016.png', 1, 1580303085, 1580303085);
INSERT INTO `product_picture` VALUES (35, 15, '/static/uploads/product/big/big1580303020.png', '/static/uploads/product/small/small1580303020.png', '/static/uploads/product/fang/fang1580303020.png', 0, 1580303085, 1580303085);
INSERT INTO `product_picture` VALUES (36, 15, '/static/uploads/product/big/big1580303025.png', '/static/uploads/product/small/small1580303025.png', '/static/uploads/product/fang/fang1580303025.png', 0, 1580303085, 1580303085);
INSERT INTO `product_picture` VALUES (37, 15, '/static/uploads/product/big/big1580303031.png', '/static/uploads/product/small/small1580303031.png', '/static/uploads/product/fang/fang1580303031.png', 0, 1580303085, 1580303085);
INSERT INTO `product_picture` VALUES (38, 15, '/static/uploads/product/big/big1580303035.png', '/static/uploads/product/small/small1580303035.png', '/static/uploads/product/fang/fang1580303035.png', 0, 1580303085, 1580303085);
INSERT INTO `product_picture` VALUES (39, 16, '/static/uploads/product/big/big1580370212.png', '/static/uploads/product/small/small1580370212.png', '/static/uploads/product/fang/fang1580370212.png', 1, 1580370321, 1580370321);
INSERT INTO `product_picture` VALUES (40, 16, '/static/uploads/product/big/big1580370219.png', '/static/uploads/product/small/small1580370219.png', '/static/uploads/product/fang/fang1580370219.png', 0, 1580370321, 1580370321);
INSERT INTO `product_picture` VALUES (41, 16, '/static/uploads/product/big/big1580370223.png', '/static/uploads/product/small/small1580370223.png', '/static/uploads/product/fang/fang1580370223.png', 0, 1580370321, 1580370321);
INSERT INTO `product_picture` VALUES (42, 16, '/static/uploads/product/big/big1580370228.png', '/static/uploads/product/small/small1580370228.png', '/static/uploads/product/fang/fang1580370228.png', 0, 1580370321, 1580370321);
INSERT INTO `product_picture` VALUES (43, 17, '/static/uploads/product/big/big1580372083.png', '/static/uploads/product/small/small1580372083.png', '/static/uploads/product/fang/fang1580372083.png', 1, 1580372196, 1580372196);
INSERT INTO `product_picture` VALUES (44, 17, '/static/uploads/product/big/big1580372088.png', '/static/uploads/product/small/small1580372088.png', '/static/uploads/product/fang/fang1580372088.png', 0, 1580372196, 1580372196);
INSERT INTO `product_picture` VALUES (45, 17, '/static/uploads/product/big/big1580372092.png', '/static/uploads/product/small/small1580372092.png', '/static/uploads/product/fang/fang1580372092.png', 0, 1580372196, 1580372196);
INSERT INTO `product_picture` VALUES (46, 17, '/static/uploads/product/big/big1580372096.png', '/static/uploads/product/small/small1580372096.png', '/static/uploads/product/fang/fang1580372096.png', 0, 1580372196, 1580372196);
INSERT INTO `product_picture` VALUES (47, 17, '/static/uploads/product/big/big1580372100.png', '/static/uploads/product/small/small1580372100.png', '/static/uploads/product/fang/fang1580372100.png', 0, 1580372196, 1580372196);
INSERT INTO `product_picture` VALUES (62, 20, '/static/uploads/product/big/big1581990278.png', '/static/uploads/product/small/small1581990278.png', '/static/uploads/product/fang/fang1581990278.png', 1, 1581990622, 1581990622);
INSERT INTO `product_picture` VALUES (63, 20, '/static/uploads/product/big/big1581990282.png', '/static/uploads/product/small/small1581990282.png', '/static/uploads/product/fang/fang1581990282.png', 0, 1581990622, 1581990622);
INSERT INTO `product_picture` VALUES (64, 20, '/static/uploads/product/big/big1581990286.png', '/static/uploads/product/small/small1581990286.png', '/static/uploads/product/fang/fang1581990286.png', 0, 1581990622, 1581990622);
INSERT INTO `product_picture` VALUES (65, 20, '/static/uploads/product/big/big1581990290.png', '/static/uploads/product/small/small1581990290.png', '/static/uploads/product/fang/fang1581990290.png', 0, 1581990622, 1581990622);
INSERT INTO `product_picture` VALUES (66, 21, '/static/uploads/product/big/big1582894810.png', '/static/uploads/product/small/small1582894810.png', '/static/uploads/product/fang/fang1582894810.png', 0, 1582894828, 1582894828);
INSERT INTO `product_picture` VALUES (67, 21, '/static/uploads/product/big/big1582894815.png', '/static/uploads/product/small/small1582894815.png', '/static/uploads/product/fang/fang1582894815.png', 1, 1582894828, 1582894828);
INSERT INTO `product_picture` VALUES (68, 22, '/static/uploads/product/big/big1586229362.png', '/static/uploads/product/small/small1586229362.png', '/static/uploads/product/fang/fang1586229362.png', 1, 1586229388, 1586229388);
INSERT INTO `product_picture` VALUES (69, 22, '/static/uploads/product/big/big1586229366.png', '/static/uploads/product/small/small1586229366.png', '/static/uploads/product/fang/fang1586229366.png', 0, 1586229388, 1586229388);
INSERT INTO `product_picture` VALUES (70, 22, '/static/uploads/product/big/big1586229369.png', '/static/uploads/product/small/small1586229369.png', '/static/uploads/product/fang/fang1586229369.png', 0, 1586229388, 1586229388);
INSERT INTO `product_picture` VALUES (71, 23, '/static/uploads/product/big/big1586671808.png', '/static/uploads/product/small/small1586671808.png', '/static/uploads/product/fang/fang1586671808.png', 1, 1586671880, 1586671880);
INSERT INTO `product_picture` VALUES (73, 12, '/static/uploads/product/big/big1586953131.png', '/static/uploads/product/small/small1586953131.png', '/static/uploads/product/fang/fang1586953131.png', 1, 1586953133, 1586953133);
INSERT INTO `product_picture` VALUES (74, 24, '/static/uploads/product/big/big1587180843.png', '/static/uploads/product/small/small1587180843.png', '/static/uploads/product/fang/fang1587180843.png', 1, 1587180873, 1587180873);

-- ----------------------------
-- Table structure for product_sales_attribute
-- ----------------------------
DROP TABLE IF EXISTS `product_sales_attribute`;
CREATE TABLE `product_sales_attribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `sales_attribute_id` int(11) NULL DEFAULT NULL COMMENT '销售属性的id',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '创建日期',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_sales_attribute
-- ----------------------------
INSERT INTO `product_sales_attribute` VALUES (19, 4, 36, 1573892300, 1573892300);
INSERT INTO `product_sales_attribute` VALUES (20, 4, 38, 1573892300, 1573892300);
INSERT INTO `product_sales_attribute` VALUES (21, 1, 36, 1573892965, 1573892965);
INSERT INTO `product_sales_attribute` VALUES (22, 1, 38, 1573892965, 1573892965);
INSERT INTO `product_sales_attribute` VALUES (23, 12, 36, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute` VALUES (24, 12, 38, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute` VALUES (25, 13, 36, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute` VALUES (26, 13, 38, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute` VALUES (27, 14, 36, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute` VALUES (28, 14, 38, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute` VALUES (29, 15, 36, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute` VALUES (30, 15, 38, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute` VALUES (31, 16, 36, 1580370321, 1580370321);
INSERT INTO `product_sales_attribute` VALUES (32, 16, 38, 1580370321, 1580370321);
INSERT INTO `product_sales_attribute` VALUES (33, 17, 36, 1580372195, 1580372195);
INSERT INTO `product_sales_attribute` VALUES (34, 17, 38, 1580372196, 1580372196);
INSERT INTO `product_sales_attribute` VALUES (35, 18, 36, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute` VALUES (36, 18, 38, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute` VALUES (37, 19, 36, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute` VALUES (38, 19, 38, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute` VALUES (39, 23, 36, 1586671880, 1586671880);
INSERT INTO `product_sales_attribute` VALUES (40, 23, 38, 1586671880, 1586671880);

-- ----------------------------
-- Table structure for product_sales_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `product_sales_attribute_value`;
CREATE TABLE `product_sales_attribute_value`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `sales_attribute_id` int(11) NULL DEFAULT NULL COMMENT '销售属性的id',
  `sales_attribute_value_id` int(11) NULL DEFAULT NULL COMMENT '销售属性值的id',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建日期',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_sales_attribute_value
-- ----------------------------
INSERT INTO `product_sales_attribute_value` VALUES (29, 4, 36, 1, 1573892300, 1573892300);
INSERT INTO `product_sales_attribute_value` VALUES (30, 4, 38, 41, 1573892300, 1573892300);
INSERT INTO `product_sales_attribute_value` VALUES (31, 4, 38, 42, 1573892300, 1573892300);
INSERT INTO `product_sales_attribute_value` VALUES (32, 1, 36, 1, 1573892965, 1573892965);
INSERT INTO `product_sales_attribute_value` VALUES (33, 1, 36, 37, 1573892965, 1573892965);
INSERT INTO `product_sales_attribute_value` VALUES (34, 1, 38, 41, 1573892965, 1573892965);
INSERT INTO `product_sales_attribute_value` VALUES (35, 12, 36, 48, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute_value` VALUES (36, 12, 36, 49, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute_value` VALUES (37, 12, 36, 50, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute_value` VALUES (38, 12, 38, 41, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute_value` VALUES (39, 12, 38, 42, 1580301396, 1580301396);
INSERT INTO `product_sales_attribute_value` VALUES (40, 13, 36, 48, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute_value` VALUES (41, 13, 36, 49, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute_value` VALUES (42, 13, 36, 50, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute_value` VALUES (43, 13, 38, 41, 1580302085, 1580302085);
INSERT INTO `product_sales_attribute_value` VALUES (44, 14, 36, 48, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute_value` VALUES (45, 14, 36, 49, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute_value` VALUES (46, 14, 36, 50, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute_value` VALUES (47, 14, 38, 41, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute_value` VALUES (48, 14, 38, 42, 1580302600, 1580302600);
INSERT INTO `product_sales_attribute_value` VALUES (49, 15, 36, 51, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute_value` VALUES (50, 15, 36, 52, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute_value` VALUES (51, 15, 38, 41, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute_value` VALUES (52, 15, 38, 42, 1580303085, 1580303085);
INSERT INTO `product_sales_attribute_value` VALUES (53, 16, 36, 48, 1580370321, 1580370321);
INSERT INTO `product_sales_attribute_value` VALUES (54, 16, 38, 41, 1580370321, 1580370321);
INSERT INTO `product_sales_attribute_value` VALUES (55, 16, 38, 42, 1580370321, 1580370321);
INSERT INTO `product_sales_attribute_value` VALUES (56, 17, 36, 48, 1580372196, 1580372196);
INSERT INTO `product_sales_attribute_value` VALUES (57, 17, 36, 50, 1580372196, 1580372196);
INSERT INTO `product_sales_attribute_value` VALUES (58, 17, 38, 41, 1580372196, 1580372196);
INSERT INTO `product_sales_attribute_value` VALUES (59, 17, 38, 42, 1580372196, 1580372196);
INSERT INTO `product_sales_attribute_value` VALUES (60, 18, 36, 37, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute_value` VALUES (61, 18, 36, 52, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute_value` VALUES (62, 18, 38, 41, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute_value` VALUES (63, 18, 38, 42, 1580372931, 1580372931);
INSERT INTO `product_sales_attribute_value` VALUES (64, 19, 36, 1, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute_value` VALUES (65, 19, 36, 50, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute_value` VALUES (66, 19, 38, 41, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute_value` VALUES (67, 19, 38, 42, 1580373407, 1580373407);
INSERT INTO `product_sales_attribute_value` VALUES (68, 23, 36, 37, 1586671880, 1586671880);
INSERT INTO `product_sales_attribute_value` VALUES (69, 23, 36, 38, 1586671880, 1586671880);
INSERT INTO `product_sales_attribute_value` VALUES (70, 23, 36, 50, 1586671880, 1586671880);
INSERT INTO `product_sales_attribute_value` VALUES (71, 23, 38, 42, 1586671880, 1586671880);

-- ----------------------------
-- Table structure for product_service
-- ----------------------------
DROP TABLE IF EXISTS `product_service`;
CREATE TABLE `product_service`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_service
-- ----------------------------
INSERT INTO `product_service` VALUES (1, 8, '1', 1571729963, 1571729963);
INSERT INTO `product_service` VALUES (2, 8, '2', 1571729963, 1571729963);
INSERT INTO `product_service` VALUES (3, 8, '3', 1571729963, 1571729963);
INSERT INTO `product_service` VALUES (4, 9, '1', 1571814711, 1571814711);
INSERT INTO `product_service` VALUES (11, 11, '2', 1572421224, 1572421224);
INSERT INTO `product_service` VALUES (10, 11, '1', 1572421224, 1572421224);
INSERT INTO `product_service` VALUES (12, 12, '1', 1580301396, 1580301396);
INSERT INTO `product_service` VALUES (13, 13, '1', 1580302085, 1580302085);
INSERT INTO `product_service` VALUES (14, 13, '2', 1580302085, 1580302085);
INSERT INTO `product_service` VALUES (15, 14, '1', 1580302600, 1580302600);
INSERT INTO `product_service` VALUES (16, 14, '2', 1580302600, 1580302600);
INSERT INTO `product_service` VALUES (17, 14, '3', 1580302600, 1580302600);
INSERT INTO `product_service` VALUES (18, 15, '1', 1580303085, 1580303085);
INSERT INTO `product_service` VALUES (19, 16, '1', 1580370321, 1580370321);
INSERT INTO `product_service` VALUES (20, 17, '1', 1580372196, 1580372196);
INSERT INTO `product_service` VALUES (21, 18, '1', 1580372931, 1580372931);
INSERT INTO `product_service` VALUES (22, 18, '2', 1580372931, 1580372931);
INSERT INTO `product_service` VALUES (23, 18, '3', 1580372931, 1580372931);
INSERT INTO `product_service` VALUES (24, 19, '1', 1580373407, 1580373407);
INSERT INTO `product_service` VALUES (25, 20, '1', 1581990527, 1581990527);
INSERT INTO `product_service` VALUES (26, 21, '1', 1582894828, 1582894828);

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品属性值id组合',
  `price` decimal(20, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `nums` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建日期',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES (20, 4, '1,41', 1.10, 11, 1, 1573892300, 1573892300);
INSERT INTO `product_sku` VALUES (21, 4, '1,42', 1.20, 12, 1, 1573892300, 1573892300);
INSERT INTO `product_sku` VALUES (22, 1, '1,41', 1.10, 11, 1, 1573892965, 1573892965);
INSERT INTO `product_sku` VALUES (23, 1, '37,41', 1.20, 22, 1, 1573892965, 1573892965);
INSERT INTO `product_sku` VALUES (24, 12, '48,41', 228.10, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (25, 12, '48,42', 228.20, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (26, 12, '49,41', 228.30, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (27, 12, '49,42', 228.40, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (28, 12, '50,41', 228.50, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (29, 12, '50,42', 228.60, 1000, 1, 1580301396, 1580301396);
INSERT INTO `product_sku` VALUES (30, 13, '48,41', 388.00, 1000, 1, 1580302085, 1580302085);
INSERT INTO `product_sku` VALUES (31, 13, '49,41', 388.00, 1000, 1, 1580302085, 1580302085);
INSERT INTO `product_sku` VALUES (32, 13, '50,41', 388.00, 1000, 1, 1580302085, 1580302085);
INSERT INTO `product_sku` VALUES (33, 14, '48,41', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (34, 14, '48,42', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (35, 14, '49,41', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (36, 14, '49,42', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (37, 14, '50,41', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (38, 14, '50,42', 69.90, 1000, 1, 1580302600, 1580302600);
INSERT INTO `product_sku` VALUES (39, 15, '51,41', 89.10, 1000, 1, 1580303085, 1580303085);
INSERT INTO `product_sku` VALUES (40, 15, '51,42', 89.20, 1000, 1, 1580303085, 1580303085);
INSERT INTO `product_sku` VALUES (41, 15, '52,41', 89.30, 1000, 1, 1580303085, 1580303085);
INSERT INTO `product_sku` VALUES (42, 15, '52,42', 89.40, 1000, 1, 1580303085, 1580303085);
INSERT INTO `product_sku` VALUES (43, 16, '48,41', 59.00, 1000, 1, 1580370321, 1580370321);
INSERT INTO `product_sku` VALUES (44, 16, '48,42', 59.00, 1000, 1, 1580370321, 1580370321);
INSERT INTO `product_sku` VALUES (45, 17, '48,41', 34.90, 100, 1, 1580372196, 1580372196);
INSERT INTO `product_sku` VALUES (46, 17, '48,42', 34.90, 100, 1, 1580372196, 1580372196);
INSERT INTO `product_sku` VALUES (47, 17, '50,41', 34.90, 100, 1, 1580372196, 1580372196);
INSERT INTO `product_sku` VALUES (48, 17, '50,42', 34.90, 100, 1, 1580372196, 1580372196);
INSERT INTO `product_sku` VALUES (49, 18, '37,41', 38.00, 100, 1, 1580372931, 1580372931);
INSERT INTO `product_sku` VALUES (50, 18, '37,42', 38.00, 100, 1, 1580372931, 1580372931);
INSERT INTO `product_sku` VALUES (51, 18, '52,41', 38.00, 100, 1, 1580372931, 1580372931);
INSERT INTO `product_sku` VALUES (52, 18, '52,42', 38.00, 100, 1, 1580372931, 1580372931);
INSERT INTO `product_sku` VALUES (53, 19, '1,41', 48.00, 100, 1, 1580373407, 1580373407);
INSERT INTO `product_sku` VALUES (54, 19, '1,42', 48.00, 100, 1, 1580373407, 1580373407);
INSERT INTO `product_sku` VALUES (55, 19, '50,41', 48.00, 100, 1, 1580373407, 1580373407);
INSERT INTO `product_sku` VALUES (56, 19, '50,42', 48.00, 100, 1, 1580373407, 1580373407);
INSERT INTO `product_sku` VALUES (57, 23, '37,42', 888.00, 100, 1, 1586671880, 1586671880);
INSERT INTO `product_sku` VALUES (58, 23, '38,42', 888.00, 100, 1, 1586671880, 1586671880);
INSERT INTO `product_sku` VALUES (59, 23, '50,42', 888.00, 100, 1, 1586671880, 1586671880);

-- ----------------------------
-- Table structure for qq_account
-- ----------------------------
DROP TABLE IF EXISTS `qq_account`;
CREATE TABLE `qq_account`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq标识',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq昵称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq头像',
  `type` int(255) NULL DEFAULT 2 COMMENT '登录类型：1微信；2qq；3注册客户',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qq_account
-- ----------------------------
INSERT INTO `qq_account` VALUES (11, NULL, 'admin', NULL, NULL, 1, 1554169340, 1558078934);
INSERT INTO `qq_account` VALUES (12, NULL, 'admin2', NULL, NULL, 1, 1554169340, 1554169340);
INSERT INTO `qq_account` VALUES (13, NULL, 'admin3', NULL, NULL, -1, 1554169340, 1554169340);
INSERT INTO `qq_account` VALUES (36, NULL, 'admin1122', NULL, NULL, 1, 1556976403, 1556976403);
INSERT INTO `qq_account` VALUES (35, NULL, 'admin89', NULL, NULL, -1, 1556976275, 1557025564);

-- ----------------------------
-- Table structure for qq_info
-- ----------------------------
DROP TABLE IF EXISTS `qq_info`;
CREATE TABLE `qq_info`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qqid` int(255) NULL DEFAULT NULL COMMENT 'qq账号的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户的姓名',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `contant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `qq` int(255) NULL DEFAULT NULL COMMENT 'qq',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qq_info
-- ----------------------------
INSERT INTO `qq_info` VALUES (11, 11, '易联科技', NULL, NULL, NULL, NULL, NULL, '1357777', 63492473, 1, 1554169340, 1560675868);
INSERT INTO `qq_info` VALUES (12, 12, '张三店铺', NULL, NULL, NULL, NULL, NULL, '1654444', NULL, 1, 1554169340, 1554169340);
INSERT INTO `qq_info` VALUES (13, 13, '张三店铺', NULL, NULL, NULL, NULL, NULL, '189666', NULL, -1, 1554169340, 1554169340);
INSERT INTO `qq_info` VALUES (36, 36, '王五店铺', NULL, NULL, NULL, NULL, NULL, '', 0, 0, 1556976403, 1560676629);
INSERT INTO `qq_info` VALUES (35, 35, '赵六店铺', NULL, NULL, NULL, NULL, NULL, '', 0, -1, 1556976275, 1557025564);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '您父亲的名字？', 1, 1576567960, 1576717838);
INSERT INTO `question` VALUES (2, '您母亲的名字?', 1, NULL, NULL);
INSERT INTO `question` VALUES (3, '您配偶的名字？', 1, NULL, NULL);
INSERT INTO `question` VALUES (4, '您的车牌号？', 1, NULL, NULL);
INSERT INTO `question` VALUES (5, '您喜欢的颜色？', 1, NULL, NULL);
INSERT INTO `question` VALUES (6, '你家宝宝的小名？', 1, NULL, NULL);
INSERT INTO `question` VALUES (7, '你最尊敬的老师的名字？', 1, NULL, NULL);

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderform_id` int(255) NULL DEFAULT NULL COMMENT '订单id',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商户id',
  `client_id` int(255) NULL DEFAULT NULL COMMENT '客户id',
  `refundtype` int(255) NULL DEFAULT NULL COMMENT '退款类型：0为退款；1为退款退货',
  `refundreason` int(255) NULL DEFAULT NULL COMMENT '退款原因',
  `refundmoney` decimal(2, 0) NULL DEFAULT NULL COMMENT '退款金额',
  `refundinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款详情',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `orderformattributes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单的销售属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refund
-- ----------------------------
INSERT INTO `refund` VALUES (41, 3, 1, 68, 1, 0, 99, '', 1579078696, 1579078696, 1, 4, '0');

-- ----------------------------
-- Table structure for register_account
-- ----------------------------
DROP TABLE IF EXISTS `register_account`;
CREATE TABLE `register_account`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录邮箱',
  `verifycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱验证码',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家登录密码',
  `code` int(255) NULL DEFAULT NULL COMMENT '随机码',
  `status` int(255) NULL DEFAULT 0 COMMENT '状态；1为正常，0为异常',
  `last_login_time` int(255) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register_account
-- ----------------------------
INSERT INTO `register_account` VALUES (68, '孙培超', '13573460296', '63492473@qq.com', 'mpuhbwll', '4ff5e28c51ebc8cb6e4a639aab1af18a', 3580, 1, NULL, 1576567893, 1587278078, NULL);
INSERT INTO `register_account` VALUES (69, '孙培超2', '13573460297', '63492474@qq.com', 'mpuhbwll', '4ff5e28c51ebc8cb6e4a639aab1af18a', 3580, 1, NULL, NULL, 1587278072, NULL);

-- ----------------------------
-- Table structure for register_info
-- ----------------------------
DROP TABLE IF EXISTS `register_info`;
CREATE TABLE `register_info`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `registerid` int(255) NULL DEFAULT NULL COMMENT '注册账号的id',
  `nicename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` int(255) NULL DEFAULT NULL COMMENT '手机',
  `qq` int(255) NULL DEFAULT NULL COMMENT 'qq',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register_info
-- ----------------------------
INSERT INTO `register_info` VALUES (39, 68, '测试2020', '于木', 2147483647, 63492473, '63492473@qq.com', 1, 1576567960, 1586932998);
INSERT INTO `register_info` VALUES (40, 69, '天道酬勤2', '孙培超2', NULL, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `auth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (19, '管理员', '管理员', '18,3,7,45,48', 1, 1587026311, 1555297655, NULL);
INSERT INTO `role` VALUES (25, '录入员', '录入信息', '7,18,3', 1, 1556974859, 1556974859, 0);
INSERT INTO `role` VALUES (27, '商品查看员', '666666', '22,23,20,24,25,26', 1, 1587028145, 1587028107, 0);

-- ----------------------------
-- Table structure for sales_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sales_attribute`;
CREATE TABLE `sales_attribute`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性名称',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_attribute
-- ----------------------------
INSERT INTO `sales_attribute` VALUES (34, '广告1', 1, 1, 1559782913, 1559782913);
INSERT INTO `sales_attribute` VALUES (35, '广告212', 1, 5, 1559782993, 1559787597);
INSERT INTO `sales_attribute` VALUES (36, '颜色', 1, 0, NULL, NULL);
INSERT INTO `sales_attribute` VALUES (37, '管理员', 1, 0, NULL, NULL);
INSERT INTO `sales_attribute` VALUES (38, '尺码', 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sales_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `sales_attribute_value`;
CREATE TABLE `sales_attribute_value`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性值名称',
  `sales_attribute_id` int(255) NULL DEFAULT NULL COMMENT '销售属性的id',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `order` int(255) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_attribute_value
-- ----------------------------
INSERT INTO `sales_attribute_value` VALUES (1, '红色', 36, -1, 0, NULL, 1587130449);
INSERT INTO `sales_attribute_value` VALUES (36, '蓝色', 36, -1, 0, 1563676181, 1563799850);
INSERT INTO `sales_attribute_value` VALUES (37, '橙色', 36, 1, 0, 1570093794, 1570093794);
INSERT INTO `sales_attribute_value` VALUES (38, '黄色', 36, 1, 0, 1570093818, 1570093818);
INSERT INTO `sales_attribute_value` VALUES (39, '绿色', 36, 1, 0, 1570093837, 1570093837);
INSERT INTO `sales_attribute_value` VALUES (40, '紫色', 36, 1, 0, 1570093848, 1570093848);
INSERT INTO `sales_attribute_value` VALUES (41, '165/80A', 38, 1, 0, 1570094470, 1570094470);
INSERT INTO `sales_attribute_value` VALUES (42, '170/84A', 38, 1, 0, 1570094487, 1570094487);
INSERT INTO `sales_attribute_value` VALUES (43, '175/88A', 38, 1, 0, 1570094501, 1570094501);
INSERT INTO `sales_attribute_value` VALUES (44, '180/92A', 38, 1, 0, 1570094524, 1570094524);
INSERT INTO `sales_attribute_value` VALUES (45, '185/96A', 38, 1, 0, 1570094544, 1570094544);
INSERT INTO `sales_attribute_value` VALUES (46, '测试', 34, 1, 0, 1570355472, 1570355472);
INSERT INTO `sales_attribute_value` VALUES (47, '使用', 34, 1, 0, 1570355494, 1570355494);
INSERT INTO `sales_attribute_value` VALUES (48, '黑色', 36, 1, 0, 1580300554, 1580300554);
INSERT INTO `sales_attribute_value` VALUES (49, '米白色', 36, 1, 0, 1580300591, 1580300591);
INSERT INTO `sales_attribute_value` VALUES (50, '豆绿色', 36, 1, 0, 1580300603, 1580300603);
INSERT INTO `sales_attribute_value` VALUES (51, '墨绿色', 36, 1, 0, 1580302921, 1580302921);
INSERT INTO `sales_attribute_value` VALUES (52, '咖色', 36, 1, 0, 1580302941, 1580302941);

-- ----------------------------
-- Table structure for shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE `shipping_address`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` int(255) NULL DEFAULT NULL COMMENT '客户的id',
  `client_type` int(255) NULL DEFAULT NULL COMMENT '客户的类型（1：微信；2：qq；3：注册）',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zipcode` int(11) NULL DEFAULT 0 COMMENT '邮政编码',
  `mobilephone` int(255) NULL DEFAULT NULL COMMENT '手机号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `default` int(255) NULL DEFAULT 0 COMMENT '是否默认',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipping_address
-- ----------------------------
INSERT INTO `shipping_address` VALUES (1, 68, 1, '4', '0', '14', '德兴北大道1966号11', 555555, 1358888, '张先生6', 1, 1, 1, 1577928855);
INSERT INTO `shipping_address` VALUES (2, 68, 1, '15', '3', '0', '德兴北大道1966号1', 253000, 1351, '孙先生1', 0, 1, 1, 1577928570);

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(255) NULL DEFAULT NULL COMMENT '产品的id',
  `merchant_id` int(255) NULL DEFAULT NULL COMMENT '商家的id',
  `client_id` int(255) NULL DEFAULT NULL COMMENT '客户的id',
  `client_type` int(255) NULL DEFAULT 3 COMMENT '客户的类型（1：微信；2：qq；3：注册）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '购买价格',
  `buy_count` int(255) NULL DEFAULT NULL COMMENT '购买数量',
  `attributes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES (91, 13, 1, 68, 3, 388.00, 1, '49,41', 1, 1584756575, 1584756575);
INSERT INTO `shopcart` VALUES (87, 15, 2, 68, 3, 89.40, 2, '52,42', 1, 1584753843, 1584753843);
INSERT INTO `shopcart` VALUES (97, 13, 1, 70, 3, 388.00, 1, '48,41', 1, 1586168463, 1586168463);
INSERT INTO `shopcart` VALUES (98, 22, 1, 68, 3, 999.00, 1, '0', 1, 1586230390, 1586230390);
INSERT INTO `shopcart` VALUES (99, 17, 2, 68, 3, 34.90, 1, '50,42', 1, 1586231870, 1586231870);
INSERT INTO `shopcart` VALUES (100, 24, 2, 68, 3, 4444.00, 1, '0', 1, 1587181966, 1587181966);
INSERT INTO `shopcart` VALUES (101, 12, 2, 68, 3, 228.60, 1, '50,42', 1, 1587181989, 1587181989);

-- ----------------------------
-- Table structure for systeminfo
-- ----------------------------
DROP TABLE IF EXISTS `systeminfo`;
CREATE TABLE `systeminfo`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systeminfo
-- ----------------------------
INSERT INTO `systeminfo` VALUES (1, 'Vivo商城', '钦州', '13577777777', '458675926@126.com', '123456', 1, 1587024499, 1553647850);

-- ----------------------------
-- Table structure for systemlist
-- ----------------------------
DROP TABLE IF EXISTS `systemlist`;
CREATE TABLE `systemlist`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `parent_id` int(255) NULL DEFAULT NULL COMMENT '父路径:根目录0',
  `order` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(255) NULL DEFAULT NULL COMMENT '删除时间',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `iconb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图标',
  `iconm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图标',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemlist
-- ----------------------------
INSERT INTO `systemlist` VALUES (11, 'wertret', 12, 5, NULL, 1554169340, NULL, '', NULL, NULL, 1);
INSERT INTO `systemlist` VALUES (10, '王五45555', 18, 5, NULL, 1554170552, 1554170552, '', '', '', 1);
INSERT INTO `systemlist` VALUES (3, '管理员列表', 18, 5, NULL, 1569811806, NULL, 'admin/list', '', '', 1);
INSERT INTO `systemlist` VALUES (9, '王五33333', 18, 5, NULL, 1554170541, 1554170541, '', '', '', 1);
INSERT INTO `systemlist` VALUES (5, '周七', 12, 5, NULL, 1554169464, NULL, '', NULL, NULL, 0);
INSERT INTO `systemlist` VALUES (6, '黎明', 0, 3, NULL, 1554170559, 1554170559, '', NULL, NULL, 1);
INSERT INTO `systemlist` VALUES (7, '产品分类', 0, 2, NULL, 1555918096, NULL, '', 'glyphicon', 'glyphicon-th-large', 1);
INSERT INTO `systemlist` VALUES (12, '会员管理', 0, 2, NULL, 1587024860, NULL, '2', '3', '4', -1);
INSERT INTO `systemlist` VALUES (18, '系统管理员', 0, 1, 1553647850, 1569811378, NULL, '2', 'fa', 'fa-cogs', 1);
INSERT INTO `systemlist` VALUES (32, '添加导航', 31, 0, 1558926156, 1558926156, NULL, 'Navigation/add', '', '', 1);
INSERT INTO `systemlist` VALUES (20, '添加管理员', 22, 1, 1556936784, 1569811840, NULL, 'admin/adminadd', '', '', 1);
INSERT INTO `systemlist` VALUES (22, '我的信息', 0, 0, 1558055573, 1569811694, NULL, '', 'glyphicon', 'glyphicon-user', 1);
INSERT INTO `systemlist` VALUES (23, '基本信息', 22, 0, 1558055920, 1569811828, NULL, 'Admin/info', '', '', 1);
INSERT INTO `systemlist` VALUES (24, '修改登录名', 22, 1, 1558060146, 1558060146, NULL, 'Admin/adminname', '', '', 1);
INSERT INTO `systemlist` VALUES (25, '修改信息', 22, 2, 1558077919, 1558077919, NULL, 'Admin/infomation', '', '', 1);
INSERT INTO `systemlist` VALUES (26, '修改密码', 22, 3, 1558078873, 1558078873, NULL, 'Admin/adminspassword', '', '', 1);
INSERT INTO `systemlist` VALUES (29, '分类列表', 7, 2, 1558246818, 1558246818, NULL, 'Category/categorylist', '', '', 1);
INSERT INTO `systemlist` VALUES (30, '添加分类', 7, 1, 1558248887, 1569811817, NULL, 'Category/add', '', '', 1);
INSERT INTO `systemlist` VALUES (31, '主页导航', 0, 4, 1558926002, 1586920244, NULL, '', 'glyphicon', 'glyphicon-list', 0);
INSERT INTO `systemlist` VALUES (33, '导航列表', 31, 2, 1558940339, 1558940339, NULL, 'Navigation/list', '', '', 1);
INSERT INTO `systemlist` VALUES (34, '广告管理', 0, 5, 1559185424, 1559185424, NULL, '', 'glyphicon', 'glyphicon-picture', 1);
INSERT INTO `systemlist` VALUES (35, '添加广告', 34, 1, 1559185461, 1559185461, NULL, 'Ad/add', '', '', 1);
INSERT INTO `systemlist` VALUES (36, '广告列表', 34, 2, 1559783176, 1559783176, NULL, 'Ad/list', '', '', 1);
INSERT INTO `systemlist` VALUES (37, '员工管理', 0, 6, 1560671509, 1586921090, NULL, '', ' glyphicon', ' glyphicon-home', 1);
INSERT INTO `systemlist` VALUES (38, '员工列表', 37, 1, 1560671777, 1586921114, NULL, 'Merchant/index', '', '', 1);
INSERT INTO `systemlist` VALUES (39, '商品管理', 0, 7, 1561603566, 1561603566, NULL, '', 'glyphicon', 'glyphicon-barcode', 1);
INSERT INTO `systemlist` VALUES (40, '商品列表', 39, 1, 1561603626, 1561603819, NULL, 'Product/index', '', '', 1);
INSERT INTO `systemlist` VALUES (41, '销售属性', 39, 2, 1563367449, 1587130820, NULL, 'product/categorylist', '', '', 0);
INSERT INTO `systemlist` VALUES (42, '活动管理', 0, 8, 1564231705, 1564231705, NULL, '', 'fa', ' fa-gift', 1);
INSERT INTO `systemlist` VALUES (43, '活动商品列表', 42, 1, 1564231772, 1564231772, NULL, 'productactivity/index', '', '', 1);
INSERT INTO `systemlist` VALUES (45, '客户管理', 0, 10, 1564889770, 1564889770, NULL, '', 'fa', 'fa-users', 1);
INSERT INTO `systemlist` VALUES (46, '微信客户', 45, 1, 1564889948, 1587090031, NULL, 'User/weixinlist', '', '', 0);
INSERT INTO `systemlist` VALUES (47, 'QQ客户', 45, 2, 1564890019, 1587090043, NULL, 'User/qqlist', '', '', 0);
INSERT INTO `systemlist` VALUES (48, '注册客户', 45, 3, 1564890054, 1564890054, NULL, 'User/registerlist', '', '', 1);
INSERT INTO `systemlist` VALUES (49, '结算中心', 0, 12, 1565702533, 1565702533, NULL, '', 'glyphicon', 'glyphicon-usd', 1);
INSERT INTO `systemlist` VALUES (50, '订单列表', 49, 1, 1565702606, 1565702606, NULL, 'Orderform/orderlist', '', '', 1);
INSERT INTO `systemlist` VALUES (52, '结算表单', 49, 2, 1565957551, 1565957551, NULL, 'Bill/bill', '', '', 1);
INSERT INTO `systemlist` VALUES (53, '已结算表', 49, 3, 1566051690, 1566051690, NULL, 'Bill/paysuccesslist', '', '', 1);
INSERT INTO `systemlist` VALUES (56, '4.17测试', 0, 15, 1587090180, 1587092060, NULL, '', '', '', -1);
INSERT INTO `systemlist` VALUES (57, '666666666', 56, 1, 1587092046, 1587092046, NULL, '', '', '', 1);

-- ----------------------------
-- Table structure for systemseo
-- ----------------------------
DROP TABLE IF EXISTS `systemseo`;
CREATE TABLE `systemseo`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城描述',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemseo
-- ----------------------------
INSERT INTO `systemseo` VALUES (1, 'Vivo商城', '商城、购物', 'vivo商城平台', 1, 1587278507, 1553647850);

-- ----------------------------
-- Table structure for systemsite
-- ----------------------------
DROP TABLE IF EXISTS `systemsite`;
CREATE TABLE `systemsite`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of systemsite
-- ----------------------------
INSERT INTO `systemsite` VALUES (1, 1, 1586168180, 1553647850);

-- ----------------------------
-- Table structure for weixin_account
-- ----------------------------
DROP TABLE IF EXISTS `weixin_account`;
CREATE TABLE `weixin_account`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信的统一标识',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信标识',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信头像',
  `type` int(255) NULL DEFAULT 1 COMMENT '登录类型：1微信；2qq；3注册客户',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_account
-- ----------------------------
INSERT INTO `weixin_account` VALUES (11, '1111', '22222', '天道酬勤', NULL, 1, 0, 1554169340, 1586750398);

-- ----------------------------
-- Table structure for weixin_info
-- ----------------------------
DROP TABLE IF EXISTS `weixin_info`;
CREATE TABLE `weixin_info`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `weixinid` int(255) NULL DEFAULT NULL COMMENT '微信账号的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户的姓名',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `contant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `qq` int(255) NULL DEFAULT NULL COMMENT 'qq',
  `status` int(255) NULL DEFAULT 1 COMMENT '状态；1为正常，0为异常',
  `create_time` int(255) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(255) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_info
-- ----------------------------
INSERT INTO `weixin_info` VALUES (11, 11, '天道酬勤', NULL, NULL, NULL, NULL, NULL, '1357777', 63492473, 1, 1554169340, 1560675868);
INSERT INTO `weixin_info` VALUES (12, 12, '张三店铺', NULL, NULL, NULL, NULL, NULL, '1654444', NULL, 1, 1554169340, 1554169340);
INSERT INTO `weixin_info` VALUES (13, 13, '张三店铺', NULL, NULL, NULL, NULL, NULL, '189666', NULL, -1, 1554169340, 1554169340);
INSERT INTO `weixin_info` VALUES (36, 36, '王五店铺', NULL, NULL, NULL, NULL, NULL, '', 0, 0, 1556976403, 1560676629);
INSERT INTO `weixin_info` VALUES (35, 35, '赵六店铺', NULL, NULL, NULL, NULL, NULL, '', 0, -1, 1556976275, 1557025564);

SET FOREIGN_KEY_CHECKS = 1;
