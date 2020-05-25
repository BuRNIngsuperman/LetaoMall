/*
 Navicat Premium Data Transfer

 Source Server         : letao
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 39.98.59.185:3306
 Source Schema         : letaomall

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 24/04/2020 15:10:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for om_address
-- ----------------------------
DROP TABLE IF EXISTS `om_address`;
CREATE TABLE `om_address`  (
  `aid` int(0) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `acco_id` int(0) NULL DEFAULT NULL COMMENT '账号id',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_address
-- ----------------------------
INSERT INTO `om_address` VALUES (1, 2, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (2, 3, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (3, 4, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (4, 5, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (5, 1, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (6, 2, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (7, 3, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (8, 4, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (9, 5, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');
INSERT INTO `om_address` VALUES (10, 1, '收货人姓名', '18812345678', '223700', '江苏', '苏州', '工业园区', '文荟人才公寓');

-- ----------------------------
-- Table structure for om_cart
-- ----------------------------
DROP TABLE IF EXISTS `om_cart`;
CREATE TABLE `om_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `comm_id` int(0) NULL DEFAULT NULL COMMENT '商品的id',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '账户id',
  `quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(0) NULL DEFAULT 0 COMMENT '是否删除',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_cart
-- ----------------------------
INSERT INTO `om_cart` VALUES (1, 1, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (2, 2, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (3, 3, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (4, 4, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (5, 5, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (6, 6, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (7, 7, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (8, 8, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (9, 9, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (10, 10, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (11, 11, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (12, 12, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (13, 13, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (14, 14, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (15, 15, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (16, 16, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (17, 17, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (18, 18, 1, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (19, 19, 2, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (20, 20, 3, 1, 10.00, '优惠', '2020-03-26 00:00:00', '2020-03-26 00:00:00', 0, '商品属性');
INSERT INTO `om_cart` VALUES (86, 18, 14, 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `om_cart` VALUES (90, 8, 23, 3, NULL, NULL, '2020-04-08 17:36:22', '2020-04-08 17:36:33', 0, NULL);
INSERT INTO `om_cart` VALUES (92, 496, 22, 1, NULL, NULL, '2020-04-09 16:07:43', NULL, 0, NULL);
INSERT INTO `om_cart` VALUES (93, 7, 22, 1, NULL, NULL, '2020-04-09 16:07:50', NULL, 0, NULL);
INSERT INTO `om_cart` VALUES (94, 13, 22, 1, NULL, NULL, '2020-04-09 16:08:26', NULL, 0, NULL);
INSERT INTO `om_cart` VALUES (103, 14, 18, 1, NULL, NULL, '2020-04-12 09:32:24', '2020-04-12 09:37:07', 1, NULL);
INSERT INTO `om_cart` VALUES (104, 169, 18, 1, NULL, NULL, '2020-04-12 09:33:00', NULL, 1, NULL);
INSERT INTO `om_cart` VALUES (105, 9, 18, 1, NULL, NULL, '2020-04-12 09:37:21', NULL, 1, NULL);
INSERT INTO `om_cart` VALUES (114, 20, 13, 1, NULL, NULL, '2020-04-12 16:27:27', NULL, 1, NULL);
INSERT INTO `om_cart` VALUES (115, 13, 13, 1, NULL, NULL, '2020-04-12 16:27:33', NULL, 1, NULL);

-- ----------------------------
-- Table structure for om_order
-- ----------------------------
DROP TABLE IF EXISTS `om_order`;
CREATE TABLE `om_order`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(0) NOT NULL COMMENT '账户id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `status` int(0) NULL DEFAULT 0 COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `pay_type` int(0) NULL DEFAULT 0 COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本单收获地址',
  `pay_status` int(0) NULL DEFAULT 0 COMMENT '支付状态：0未支付，1支付成功，-1支付失败',
  `pay_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_order
-- ----------------------------
INSERT INTO `om_order` VALUES (82, 14, '15858327084156413', 4, 214.00, '2020-04-01 19:12:53', '2020-04-01 19:12:53', NULL, NULL, NULL, '2020-04-03 10:38:20', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (83, 14, '15858339724675188', 2, 70.00, '2020-04-02 21:43:22', '2020-04-02 21:43:22', '2020-04-03 10:13:26', NULL, NULL, '2020-04-02 21:43:22', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (85, 11, '15858353565114327', 1, 5.00, '2020-04-02 21:49:41', '2020-04-02 21:49:41', NULL, NULL, NULL, '2020-04-02 21:49:41', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '张文的大于10的收获地址', 0, '0');
INSERT INTO `om_order` VALUES (86, 14, '15858356970134703', 1, 70.00, '2020-04-05 20:27:17', '2020-04-05 21:55:08', NULL, NULL, NULL, '2020-04-02 21:55:08', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (87, 14, '15858359072165151', 1, 127.00, '2020-04-05 20:27:30', '2020-04-05 21:58:42', NULL, NULL, NULL, '2020-04-02 21:58:42', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (88, 14, '15858359072165151', 2, 127.00, '2020-04-06 20:27:30', '2020-04-06 21:58:42', NULL, NULL, NULL, '2020-04-07 10:48:02', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (99, 14, '15863224869886062', 1, 4.00, '2020-04-08 13:08:07', '2020-04-08 13:08:35', NULL, NULL, NULL, '2020-04-08 13:08:35', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (101, 14, '15863245212894659', 1, 4.00, '2020-04-08 13:42:01', '2020-04-08 13:42:12', NULL, NULL, NULL, '2020-04-08 13:42:12', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (102, 14, '15863254232216002', 1, 4.00, '2020-04-08 13:57:03', '2020-04-08 13:57:17', NULL, NULL, NULL, '2020-04-08 13:57:17', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省南京xx小区28栋838', 0, '0');
INSERT INTO `om_order` VALUES (103, 18, '15863309509247489', 1, 22.00, '2020-04-08 15:29:11', '2020-04-08 15:30:32', NULL, NULL, NULL, '2020-04-08 15:30:32', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏-苏州-工业园区-文荟人才公寓-9栋', 0, '0');
INSERT INTO `om_order` VALUES (104, 21, '15863368994101574', 1, 1999.00, '2020-04-08 17:08:19', '2020-04-08 17:09:47', NULL, NULL, NULL, '2020-04-08 17:09:47', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省苏州市工业园区', 0, '0');
INSERT INTO `om_order` VALUES (105, 18, '15863387132294655', 1, 1799.00, '2020-04-08 17:38:33', '2020-04-08 17:39:02', NULL, NULL, NULL, '2020-04-08 17:39:02', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏-苏州-工业园区-文荟人才公寓-9栋', 0, '0');
INSERT INTO `om_order` VALUES (106, 18, '15864200419988340', 0, 297.00, '2020-04-09 16:14:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏-苏州-工业园区-文荟人才公寓-9栋', 0, '0');
INSERT INTO `om_order` VALUES (107, 18, '15864796532396363', 0, 2.00, '2020-04-10 08:47:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0x123456asdfg', 0, '0');
INSERT INTO `om_order` VALUES (108, 13, '15864940968782579', 0, 301.00, '2020-04-10 12:48:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省苏州市独墅湖高教区林泉街', 0, '0');
INSERT INTO `om_order` VALUES (111, 18, '15866569355077109', 0, 10165.00, '2020-04-12 10:02:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏-苏州-工业园区-文荟人才公寓-9栋', 0, '0');
INSERT INTO `om_order` VALUES (112, 13, '15866802809981004', 0, 365.00, '2020-04-12 16:31:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '江苏省苏州市独墅湖高教区林泉街399号', 0, '0');

-- ----------------------------
-- Table structure for om_order_item
-- ----------------------------
DROP TABLE IF EXISTS `om_order_item`;
CREATE TABLE `om_order_item`  (
  `item_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `order_id` int(0) NULL DEFAULT NULL COMMENT '订单id',
  `comm_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单项目价格',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性1',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_order_item
-- ----------------------------
INSERT INTO `om_order_item` VALUES (120, 70, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (121, 71, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (122, 72, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (123, 73, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (124, 74, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (125, 75, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (126, 76, 4, 1, 100.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/ef75879d-3d3e-4bab-888d-1e4036491e11.jpg');
INSERT INTO `om_order_item` VALUES (127, 82, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (128, 82, 5, 1, 127.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg');
INSERT INTO `om_order_item` VALUES (129, 82, 3, 1, 83.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg');
INSERT INTO `om_order_item` VALUES (130, 83, 6, 1, 70.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/89660409-78b7-4d47-ae12-f94b3ce9664b.png');
INSERT INTO `om_order_item` VALUES (131, 84, 5, 1, 127.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg');
INSERT INTO `om_order_item` VALUES (132, 85, 10, 1, 5.00, NULL, '无印良品 MUJI 凝胶墨水圆珠笔', '/goods-img/a952ecce-32e7-474e-9c1b-943962e0a580.jpg');
INSERT INTO `om_order_item` VALUES (133, 86, 6, 1, 70.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/89660409-78b7-4d47-ae12-f94b3ce9664b.png');
INSERT INTO `om_order_item` VALUES (134, 87, 5, 1, 127.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg');
INSERT INTO `om_order_item` VALUES (135, 89, 3, 1, 83.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg');
INSERT INTO `om_order_item` VALUES (136, 89, 13, 1, 42.00, NULL, '无印良品 MUJI 平衡洁面泡沫', '/goods-img/d0d8f6d1-1f2d-49f8-9099-0cdd94833581.jpg');
INSERT INTO `om_order_item` VALUES (137, 90, 7, 1, 199.00, NULL, '无印良品 MUJI 男式', '/goods-img/f172c500-21d0-42e3-95ce-aa9b84a2ef49.jpg');
INSERT INTO `om_order_item` VALUES (138, 91, 7, 1, 199.00, NULL, '无印良品 MUJI 男式', '/goods-img/f172c500-21d0-42e3-95ce-aa9b84a2ef49.jpg');
INSERT INTO `om_order_item` VALUES (139, 92, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (140, 93, 3, 1, 83.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg');
INSERT INTO `om_order_item` VALUES (141, 94, 4, 1, 100.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/ef75879d-3d3e-4bab-888d-1e4036491e11.jpg');
INSERT INTO `om_order_item` VALUES (142, 95, 12, 1, 70.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/d66b6e0e-48d4-4503-8dd6-43b3c71f52a4.png');
INSERT INTO `om_order_item` VALUES (143, 96, 9, 1, 65.00, NULL, '无印良品 MUJI 平衡高保湿化妆水', '/goods-img/16230038-bf86-4d4e-a11f-954b9ee4bab2.jpg');
INSERT INTO `om_order_item` VALUES (144, 97, 8, 2, 83.00, NULL, '无印良品 MUJI 基础润肤洁面泡沫', '/goods-img/f87bdee1-ed48-4b49-b701-cc44f26a2699.jpg');
INSERT INTO `om_order_item` VALUES (145, 98, 6, 1, 70.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/89660409-78b7-4d47-ae12-f94b3ce9664b.png');
INSERT INTO `om_order_item` VALUES (146, 99, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (147, 100, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (148, 101, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (149, 102, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (150, 103, 20, 1, 4.00, NULL, '无印良品 MUJI 塑料橡皮', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg');
INSERT INTO `om_order_item` VALUES (151, 103, 18, 1, 18.00, NULL, '无印良品 MUJI 聚丙烯', '/goods-img/6c7f7a0d-4d73-406e-adcc-6f666ce4e2c9.jpg');
INSERT INTO `om_order_item` VALUES (152, 104, 506, 1, 1999.00, NULL, '小米CC9 3200万美颜自拍 索尼4800万超清三摄 ...', '/goods-img/4c148e8e-7e26-4c74-a3d3-f5f37ae9248d.jpg');
INSERT INTO `om_order_item` VALUES (153, 105, 496, 1, 1799.00, NULL, '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面...', '/goods-img/9a554cae-5bec-4964-992f-e2f4de192e2c.jpg');
INSERT INTO `om_order_item` VALUES (154, 106, 6, 2, 70.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/89660409-78b7-4d47-ae12-f94b3ce9664b.png');
INSERT INTO `om_order_item` VALUES (155, 106, 17, 1, 30.00, NULL, '无印良品（MUJI） 聚丙烯化妆盒 1/2', '/goods-img/f6832ed7-cb01-48ab-987f-cd437b21be80.jpg');
INSERT INTO `om_order_item` VALUES (156, 106, 5, 1, 127.00, NULL, '无印良品 MUJI 基础润肤化妆水', '/goods-img/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg');
INSERT INTO `om_order_item` VALUES (157, 107, 511, 1, 1899.00, NULL, '小米9SE 骁龙712 索尼4800万超广角三摄 5.9...', '/goods-img/b28f3eac-0091-442f-90f3-68914bf947c7.jpg');
INSERT INTO `om_order_item` VALUES (158, 107, 179, 1, 129.00, NULL, '小米 Redmi AirDots', '/goods-img/36d0fe8f-aa28-423c-81e7-82cab31b7598.jpg');
INSERT INTO `om_order_item` VALUES (159, 108, 12, 1, 70.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/d66b6e0e-48d4-4503-8dd6-43b3c71f52a4.png');
INSERT INTO `om_order_item` VALUES (160, 108, 11, 1, 65.00, NULL, '无印良品 MUJI 平衡保湿乳霜', '/goods-img/904c8aa1-0257-49e8-ad89-f48d2462db21.jpg');
INSERT INTO `om_order_item` VALUES (161, 108, 3, 2, 83.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg');
INSERT INTO `om_order_item` VALUES (162, 109, 8, 3, 83.00, NULL, '无印良品 MUJI 基础润肤洁面泡沫', '/goods-img/f87bdee1-ed48-4b49-b701-cc44f26a2699.jpg');
INSERT INTO `om_order_item` VALUES (163, 109, 474, 1, 9999.00, NULL, '小米9 Pro 5G 全面屏游戏拍照新品手机', '/goods-img/d5fc8bec-0add-48d3-b73b-349a0375e8dc.jpg');
INSERT INTO `om_order_item` VALUES (164, 110, 14, 2, 61.00, NULL, '无印良品 MUJI 基础润肤乳液', '/goods-img/e553f566-5dc4-4648-be58-fd7112a47b10.jpg');
INSERT INTO `om_order_item` VALUES (165, 110, 169, 1, 149.00, NULL, '小米耳机 圈铁Pro 入耳式有线运动音乐耳机耳麦', '/goods-img/f3d269a4-5317-4b30-b164-1311f6c1f058.jpg');
INSERT INTO `om_order_item` VALUES (166, 110, 13, 2, 42.00, NULL, '无印良品 MUJI 平衡洁面泡沫', '/goods-img/d0d8f6d1-1f2d-49f8-9099-0cdd94833581.jpg');
INSERT INTO `om_order_item` VALUES (167, 110, 478, 1, 1099.00, NULL, 'Redmi Note7 4800万双摄千元机 满血骁龙6...', '/goods-img/30ef1f51-f958-486f-8d79-f48f6d8293dd.jpg');
INSERT INTO `om_order_item` VALUES (168, 111, 8, 2, 83.00, NULL, '无印良品 MUJI 基础润肤洁面泡沫', '/goods-img/f87bdee1-ed48-4b49-b701-cc44f26a2699.jpg');
INSERT INTO `om_order_item` VALUES (169, 111, 474, 1, 9999.00, NULL, '小米9 Pro 5G 全面屏游戏拍照新品手机', '/goods-img/d5fc8bec-0add-48d3-b73b-349a0375e8dc.jpg');
INSERT INTO `om_order_item` VALUES (170, 112, 8, 2, 83.00, NULL, '无印良品 MUJI 基础润肤洁面泡沫', '/goods-img/f87bdee1-ed48-4b49-b701-cc44f26a2699.jpg');
INSERT INTO `om_order_item` VALUES (171, 112, 7, 1, 199.00, NULL, '无印良品 MUJI 男式', '/goods-img/f172c500-21d0-42e3-95ce-aa9b84a2ef49.jpg');

-- ----------------------------
-- Table structure for om_return
-- ----------------------------
DROP TABLE IF EXISTS `om_return`;
CREATE TABLE `om_return`  (
  `return_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '申请创建时间',
  `return_count` int(0) NULL DEFAULT NULL COMMENT '退货数量',
  `return_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(0) NULL DEFAULT 0 COMMENT '申请状态',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `product_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货商品条码',
  PRIMARY KEY (`return_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_return
-- ----------------------------
INSERT INTO `om_return` VALUES (1, '15862500752261711', '2020-04-07 18:10:43', 1, '李佳', '18806210404', 0, '不想要了', '77482');
INSERT INTO `om_return` VALUES (13, '15862500752261711', '2020-04-08 01:33:19', 2, '佳佳', '13236134997', 0, '不想要了', '77483');
INSERT INTO `om_return` VALUES (14, '15858356970134703', '2020-04-08 01:37:43', 3, '张三', '13396145216', 0, '拍错了', '77484');
INSERT INTO `om_return` VALUES (15, '15858359072165151', '2020-04-08 01:41:01', 1, '李四', '13303214891', 1, '拍错了', '77485');

-- ----------------------------
-- Table structure for pm_brand
-- ----------------------------
DROP TABLE IF EXISTS `pm_brand`;
CREATE TABLE `pm_brand`  (
  `brand_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `factory_status` int(0) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(0) NULL DEFAULT NULL COMMENT '是否显示',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(0) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_brand
-- ----------------------------
INSERT INTO `pm_brand` VALUES (1, '品牌1', 'p', 1, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (2, '品牌2', 'p', 2, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (3, '品牌3', 'p', 3, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (4, '品牌4', 'p', 4, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (5, '品牌5', 'p', 5, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (6, '品牌6', 'p', 6, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (7, '品牌7', 'p', 7, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (8, '品牌8', 'p', 8, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (9, '品牌9', 'p', 9, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (10, '品牌10', 'p', 10, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (11, '品牌11', 'p', 11, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (12, '品牌12', 'p', 12, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (13, '品牌13', 'p', 13, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (14, '品牌14', 'p', 14, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (15, '品牌15', 'p', 15, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (16, '品牌16', 'p', 16, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (17, '品牌17', 'p', 17, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (18, '品牌18', 'p', 18, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (19, '品牌19', 'p', 19, 1, 1, 100, 788, NULL, NULL, '品牌故事');
INSERT INTO `pm_brand` VALUES (20, '品牌20', 'p', 0, 1, 1, 100, 788, NULL, NULL, '品牌故事');

-- ----------------------------
-- Table structure for pm_comm_category
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_category`;
CREATE TABLE `pm_comm_category`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
  `cname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  `level` int(0) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '商品数量',
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `nav_status` int(0) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(0) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_comm_category
-- ----------------------------
INSERT INTO `pm_comm_category` VALUES (1, 0, '家电 数码 手机', 1, 100, '件', 0, 0, 100, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (2, 0, '女装 男装 穿搭', 1, 100, '件', 0, 0, 2, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (3, 0, '运动 户外 乐器', 1, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (4, 0, '游戏 动漫 影视', 1, 100, '件', 0, 0, 46, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (5, 0, '家具 家饰 家纺', 1, 100, '件', 0, 0, 47, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (6, 0, '美妆 清洁 宠物', 1, 100, '件', 0, 0, 48, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (7, 0, '工具 装修 建材', 1, 100, '件', 0, 0, 49, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (8, 0, '珠宝 金饰 眼镜', 1, 100, '件', 0, 0, 50, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (9, 0, '鞋靴 箱包 配件', 1, 100, '件', 0, 0, 52, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (10, 0, '玩具 孕产 用品', 1, 100, '件', 0, 0, 51, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (11, 1, '家电', 2, 100, '件', 0, 0, 3, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (12, 1, '数码', 2, 100, '件', 0, 0, 4, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (13, 1, '手机', 2, 100, '件', 0, 0, 5, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (14, 2, '女装', 2, 100, '件', 0, 0, 53, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (15, 2, '男装', 2, 100, '件', 0, 0, 54, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (16, 2, '穿搭', 2, 100, '件', 0, 0, 55, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (17, 3, '运动', 2, 100, '件', 0, 0, 59, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (18, 3, '户外', 2, 100, '件', 0, 0, 60, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (19, 3, '乐器', 2, 100, '件', 0, 0, 61, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (20, 4, '游戏', 2, 100, '件', 0, 0, 65, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (21, 4, '动漫', 2, 100, '件', 0, 0, 66, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (22, 4, '影视', 2, 100, '件', 0, 0, 67, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (23, 5, '家具', 2, 100, '件', 0, 0, 56, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (24, 5, '家饰', 2, 100, '件', 0, 0, 57, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (25, 5, '家纺', 2, 100, '件', 0, 0, 58, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (26, 6, '美妆', 2, 100, '件', 0, 0, 69, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (27, 6, '宠物', 2, 100, '件', 0, 0, 70, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (28, 6, '清洁', 2, 100, '件', 0, 0, 71, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (29, 7, '工具', 2, 100, '件', 0, 0, 73, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (30, 7, '装修', 2, 100, '件', 0, 0, 74, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (31, 7, '建材', 2, 100, '件', 0, 0, 75, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (32, 8, '珠宝', 2, 100, '件', 0, 0, 77, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (33, 8, '金饰', 2, 100, '件', 0, 0, 78, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (34, 8, '眼镜', 2, 100, '件', 0, 0, 79, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (35, 9, '鞋靴', 2, 100, '件', 0, 0, 81, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (36, 9, '箱包', 2, 100, '件', 0, 0, 82, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (37, 9, '配件', 2, 100, '件', 0, 0, 83, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (38, 11, '生活电器', 3, 100, '件', 0, 0, 6, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (39, 11, '厨房电器', 3, 100, '件', 0, 0, 7, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (40, 11, '扫地机器人', 3, 100, '件', 0, 0, 8, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (41, 11, '吸尘器', 3, 100, '件', 0, 0, 9, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (42, 11, '取暖器', 3, 100, '件', 0, 0, 10, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (43, 11, '豆浆机', 3, 100, '件', 0, 0, 11, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (44, 11, '暖风机', 3, 100, '件', 0, 0, 12, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (45, 11, '加湿器', 3, 100, '件', 0, 0, 13, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (46, 12, '蓝牙音箱', 3, 100, '件', 0, 0, 14, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (47, 11, '烤箱', 3, 100, '件', 0, 0, 15, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (48, 11, '卷发器', 3, 100, '件', 0, 0, 16, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (49, 11, '空气净化器', 3, 100, '件', 0, 0, 17, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (50, 12, '游戏主机', 3, 100, '件', 0, 0, 18, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (51, 12, '数码精选', 3, 100, '件', 0, 0, 19, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (52, 12, '平板电脑', 3, 100, '件', 0, 0, 20, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (53, 12, '苹果 Apple', 3, 100, '件', 0, 0, 21, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (54, 12, '电脑主机', 3, 100, '件', 0, 0, 22, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (55, 12, '数码相机', 3, 100, '件', 0, 0, 23, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (56, 12, '电玩动漫', 3, 100, '件', 0, 0, 24, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (57, 12, '单反相机', 3, 100, '件', 0, 0, 25, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (58, 12, '键盘鼠标', 3, 100, '件', 0, 0, 26, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (59, 12, '无人机', 3, 100, '件', 0, 0, 27, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (60, 12, '二手电脑', 3, 100, '件', 0, 0, 28, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (61, 12, '二手手机', 3, 100, '件', 0, 0, 29, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (62, 13, 'iPhone 11', 3, 100, '件', 0, 0, 30, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (63, 13, '荣耀手机', 3, 100, '件', 0, 0, 31, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (64, 13, '华为手机', 3, 100, '件', 0, 0, 32, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (65, 13, 'iPhone', 3, 100, '件', 0, 0, 33, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (66, 13, '华为 Mate 20', 3, 100, '件', 0, 0, 34, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (67, 13, '华为 P30', 3, 100, '件', 0, 0, 35, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (68, 13, '华为 P30 Pro', 3, 100, '件', 0, 0, 36, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (69, 13, '小米手机', 3, 100, '件', 0, 0, 37, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (70, 13, '红米', 3, 100, '件', 0, 0, 38, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (71, 13, 'OPPO', 3, 100, '件', 0, 0, 39, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (72, 13, '一加', 3, 100, '件', 0, 0, 40, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (73, 13, '小米 MIX', 3, 100, '件', 0, 0, 41, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (74, 13, 'Reno', 3, 100, '件', 0, 0, 42, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (75, 13, 'vivo', 3, 100, '件', 0, 0, 43, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (76, 13, '手机以旧换新', 3, 100, '件', 0, 0, 44, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (94, 14, '短袖', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (95, 15, '长袖', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (96, 16, '七分裤', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (97, 17, '跑鞋', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (98, 18, '自行车', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (99, 19, '吉他', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (100, 20, '英雄联盟', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (101, 21, '海贼王', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (102, 22, '电影', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (103, 23, '衣柜', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (104, 24, '壁纸', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (105, 25, '家纺', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (106, 26, '口红', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (107, 27, '阿拉斯加犬', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (108, 28, '洗洁精', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (109, 29, '梯子', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (110, 30, '油漆', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (111, 31, '水泥', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (112, 32, '项链', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (113, 33, '戒指', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (114, 34, '太阳镜', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (115, 35, '男鞋', 3, 100, '件', 0, 0, 45, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (116, 36, '旅行箱', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pm_comm_category` VALUES (117, 37, '充电宝', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pm_comm_comment
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_comment`;
CREATE TABLE `pm_comm_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comm_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顾客名称',
  `star` int(0) NULL DEFAULT NULL COMMENT '评论星数',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '评论创建时间',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_comm_comment
-- ----------------------------
INSERT INTO `pm_comm_comment` VALUES (1, 2, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (2, 3, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (3, 4, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (4, 5, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (5, 6, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (6, 7, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (7, 8, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (8, 9, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (9, 10, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (10, 11, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (11, 12, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (12, 13, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (13, 14, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (14, 15, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (15, 16, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (16, 17, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (17, 18, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (18, 19, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (19, 20, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (20, 1, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (21, 2, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (22, 3, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (23, 4, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (24, 5, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (25, 6, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (26, 7, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (27, 8, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (28, 9, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (29, 10, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (30, 11, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (31, 12, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (32, 13, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (33, 14, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (34, 15, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (35, 16, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (36, 17, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (37, 18, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (38, 19, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (39, 20, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (40, 1, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (41, 2, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (42, 3, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (43, 4, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (44, 5, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (45, 6, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (46, 7, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (47, 8, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (48, 9, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (49, 10, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (50, 11, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (51, 12, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (52, 13, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (53, 14, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (54, 15, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (55, 16, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (56, 17, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (57, 18, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (58, 19, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (59, 20, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (60, 1, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (61, 2, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (62, 3, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (63, 4, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (64, 5, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (65, 6, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (66, 7, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (67, 8, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (68, 9, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (69, 10, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (70, 11, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (71, 12, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (72, 13, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (73, 14, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (74, 15, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (75, 16, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (76, 17, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (77, 18, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (78, 19, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (79, 20, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (80, 1, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (81, 2, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (82, 3, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (83, 4, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (84, 5, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (85, 6, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (86, 7, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (87, 8, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (88, 9, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (89, 10, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (90, 11, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (91, 12, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (92, 13, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (93, 14, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (94, 15, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (95, 16, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (96, 17, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (97, 18, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (98, 19, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (99, 20, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');
INSERT INTO `pm_comm_comment` VALUES (100, 1, '路人甲', 5, '2020-03-26 00:00:00', '商品很好');

-- ----------------------------
-- Table structure for pm_comm_images
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_images`;
CREATE TABLE `pm_comm_images`  (
  `imageId` int(0) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `comm_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片位置',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`imageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_comm_images
-- ----------------------------

-- ----------------------------
-- Table structure for pm_commodity
-- ----------------------------
DROP TABLE IF EXISTS `pm_commodity`;
CREATE TABLE `pm_commodity`  (
  `comm_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `commodity_category_id` int(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的条码',
  `delete_status` int(0) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(0) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(0) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(0) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->导航推荐；2->热门 3->新品 4推荐',
  `verify_status` int(0) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sale_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出货地址',
  `make_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造地址',
  `brand_id` int(0) NULL DEFAULT NULL COMMENT '品牌id',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `low_stock` int(0) NULL DEFAULT NULL COMMENT '库存预警值',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情标题',
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情描述',
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `health_status` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 577 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_commodity
-- ----------------------------
INSERT INTO `pm_commodity` VALUES (1, '无印良品 MUJI 基础润肤化妆水', 100.00, '滋润型 400ml', 58, 20, '件', '77481', 0, 1, 0, 0, 0, '出货地址', '收获地址', 2, 1, 20, 100.00, '副标题', 100.00, 30, 1000.00, '关键字', '备注', 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (2, '无印良品 MUJI 柔和洁面泡沫', 45.00, '120g', 58, 100, '件', '77482', 0, 1, 0, 0, 0, '出货地址', '收获地址', 3, 2, 20, 45.00, '副标题', 45.00, 10, 1000.00, '关键字', '备注', 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (3, '无印良品 MUJI 基础润肤乳液', 83.00, '高保湿型 200ml', 58, 16, '件', '77483', 0, 0, 0, 2, 0, '出货地址', '收获地址', 4, 3, 20, 83.00, '副标题', 83.00, 30, 1000.00, '关键字', '备注', '/goods-img/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (4, '无印良品 MUJI 基础润肤乳液', 100.00, '滋润型 400ml', 58, 98, '件', '77484', 0, 1, 0, 2, 0, '出货地址', '收获地址', 5, 4, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/ef75879d-3d3e-4bab-888d-1e4036491e11.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (5, '无印良品 MUJI 基础润肤化妆水', 127.00, '高保湿型 400ml', 58, 95, '件', '77485', 0, 0, 0, 2, 0, '出货地址', '收获地址', 6, 5, 20, 127.00, '副标题', 127.00, 10, 1000.00, '关键字', '备注', '/goods-img/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (6, '无印良品 MUJI 基础润肤化妆水', 70.00, '清爽型 200ml', 58, 95, '件', '77486', 0, 0, 0, 2, 0, '出货地址', '收获地址', 7, 6, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/89660409-78b7-4d47-ae12-f94b3ce9664b.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (7, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 海军蓝 L', 58, 93, '件', '77487', 0, 0, 0, 3, 0, '出货地址', '收获地址', 8, 7, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/f172c500-21d0-42e3-95ce-aa9b84a2ef49.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (8, '无印良品 MUJI 基础润肤洁面泡沫', 83.00, '200ml', 58, 91, '件', '77488', 0, 0, 0, 3, 0, '出货地址', '收获地址', 9, 8, 20, 83.00, '副标题', 83.00, 10, 1000.00, '关键字', '备注', '/goods-img/f87bdee1-ed48-4b49-b701-cc44f26a2699.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (9, '无印良品 MUJI 平衡高保湿化妆水', 65.00, '新蜂精选', 58, 99, '件', '77489', 0, 0, 0, 3, 0, '出货地址', '收获地址', 10, 9, 20, 130.00, '副标题', 130.00, 10, 1000.00, '关键字', '备注', '/goods-img/16230038-bf86-4d4e-a11f-954b9ee4bab2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (10, '无印良品 MUJI 凝胶墨水圆珠笔', 5.00, '蓝黑色', 58, 99, '件', '774810', 0, 0, 0, 3, 0, '出货地址', '收获地址', 1, 10, 20, 8.00, '副标题', 8.00, 10, 1000.00, '关键字', '备注', '/goods-img/a952ecce-32e7-474e-9c1b-943962e0a580.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (11, '无印良品 MUJI 平衡保湿乳霜', 65.00, '50g', 58, 97, '件', '774811', 0, 0, 0, 4, 0, '出货地址', '收获地址', 2, 11, 20, 130.00, '副标题', 130.00, 10, 1000.00, '关键字', '备注', '/goods-img/904c8aa1-0257-49e8-ad89-f48d2462db21.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (12, '无印良品 MUJI 基础润肤乳液', 70.00, '清爽型 200ml', 58, 93, '件', '774812', 0, 0, 0, 4, 0, '出货地址', '收获地址', 3, 12, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/d66b6e0e-48d4-4503-8dd6-43b3c71f52a4.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (13, '无印良品 MUJI 平衡洁面泡沫', 42.00, '100g', 58, 94, '件', '774813', 0, 0, 0, 4, 0, '出货地址', '收获地址', 4, 13, 20, 85.00, '副标题', 85.00, 10, 1000.00, '关键字', '备注', '/goods-img/d0d8f6d1-1f2d-49f8-9099-0cdd94833581.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (14, '无印良品 MUJI 基础润肤乳液', 61.00, '滋润型 200ml', 58, 98, '件', '774814', 0, 0, 0, 4, 0, '出货地址', '收获地址', 5, 14, 20, 61.00, '副标题', 61.00, 10, 1000.00, '关键字', '备注', '/goods-img/e553f566-5dc4-4648-be58-fd7112a47b10.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (15, '无印良品 MUJI 便携式香薰机', 200.00, '新蜂精选', 58, 98, '件', '774815', 0, 0, 0, 4, 0, '出货地址', '收获地址', 6, 15, 20, 200.00, '副标题', 200.00, 10, 1000.00, '关键字', '备注', '/goods-img/a9c0d929-6f0b-4bc7-819c-e5015f447a9e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (16, '无印良品 MUJI 女式', 70.00, '粗棉线条纹长袖T恤 白色*横条 L', 58, 99, '件', '774816', 0, 0, 0, 4, 0, '出货地址', '收获地址', 7, 16, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/38d5f694-2236-415d-80c8-4a1695e92d4e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (17, '无印良品（MUJI） 聚丙烯化妆盒 1/2', 30.00, '半透明约150x220x86mm', 58, 98, '件', '774817', 0, 0, 0, 4, 0, '出货地址', '收获地址', 8, 17, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/f6832ed7-cb01-48ab-987f-cd437b21be80.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (18, '无印良品 MUJI 聚丙烯', 18.00, '笔盒 大/约184*64*25㎜', 58, 98, '件', '774818', 0, 0, 0, 4, 0, '出货地址', '收获地址', 9, 18, 20, 18.00, '副标题', 18.00, 10, 1000.00, '关键字', '备注', '/goods-img/6c7f7a0d-4d73-406e-adcc-6f666ce4e2c9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (19, '无印良品（MUJI） 无针订书机 其他', 52.00, '新蜂精选', 58, 99, '件', '774819', 0, 0, 0, 4, 0, '出货地址', '收获地址', 10, 19, 20, 52.00, '副标题', 52.00, 10, 1000.00, '关键字', '备注', '/goods-img/cf19de8b-e94e-4513-aecd-a0b5c976b738.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (20, '无印良品 MUJI 塑料橡皮', 4.00, '黑色 小', 58, 82, '件', '774820', 0, 0, 0, 4, 0, '出货地址', '收获地址', 1, 20, 20, 4.00, '副标题', 4.00, 10, 1000.00, '关键字', '备注', '/goods-img/d4f3299d-d526-4a81-ae9f-3b53e735075e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (21, '无印良品 MUJI 大容量基础乳液/高保湿型', 140.00, '400ml', 58, 100, '件', '774821', 0, 0, 0, 4, 0, '出货地址', '收获地址', 2, 21, 20, 140.00, '副标题', 140.00, 10, 1000.00, '关键字', '备注', '/goods-img/ea92b50a-67ba-4279-a71a-4e52e6a3219c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (22, '无印良品 MUJI 基础润肤化妆水', 100.00, '滋润型 400ml', 58, 100, '件', '774822', 0, 1, 0, 0, 0, '出货地址', '收获地址', 3, 22, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/beb26b1b-7a73-48c2-a9f7-727ad92401f6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (23, '无印良品 MUJI 柔和洁面泡沫', 45.00, '120g', 58, 100, '件', '774823', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 23, 20, 45.00, '副标题', 45.00, 10, 1000.00, '关键字', '备注', '/goods-img/bf1dc4d1-acc2-40c8-8091-1c6f35988643.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (24, '无印良品 MUJI 基础润肤乳液', 83.00, '高保湿型 200ml', 58, 100, '件', '774824', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 24, 20, 83.00, '副标题', 83.00, 10, 1000.00, '关键字', '备注', '/goods-img/4059caa9-e0b3-4ac3-a494-b9e4c47e0185.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (25, '无印良品 MUJI 基础润肤乳液', 100.00, '滋润型 400ml', 58, 100, '件', '774825', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 25, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/a4a4c981-da0f-4228-bcc7-97d970dc619c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (26, '无印良品 MUJI 基础润肤化妆水', 127.00, '高保湿型 400ml', 58, 100, '件', '774826', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 26, 20, 127.00, '副标题', 127.00, 10, 1000.00, '关键字', '备注', '/goods-img/98b5c5b5-cc75-4dfb-8ec4-0a7f42af6183.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (27, '无印良品 MUJI 基础润肤化妆水', 70.00, '清爽型 200ml', 58, 100, '件', '774827', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 27, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/71d1f469-b77b-473a-a31a-78fc97859b3a.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (28, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 海军蓝 L', 58, 100, '件', '774828', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 28, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/68bfbfd9-bc28-429a-ab2c-7fa62205ed7e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (29, '无印良品 MUJI 基础润肤洁面泡沫', 83.00, '200ml', 58, 100, '件', '774829', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 29, 20, 83.00, '副标题', 83.00, 10, 1000.00, '关键字', '备注', '/goods-img/679eb5a8-7689-4620-b072-63daeb8eb73a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (30, '无印良品 MUJI 平衡高保湿化妆水', 65.00, '新蜂精选', 58, 100, '件', '774830', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 30, 20, 130.00, '副标题', 130.00, 10, 1000.00, '关键字', '备注', '/goods-img/eb13afc6-8898-4a50-9f93-06dd2593c313.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (31, '无印良品 MUJI 凝胶墨水圆珠笔', 5.00, '蓝黑色', 58, 100, '件', '774831', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 31, 20, 8.00, '副标题', 8.00, 10, 1000.00, '关键字', '备注', '/goods-img/85a893fe-c971-4f0b-aa0f-4c24b65b1c75.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (32, '无印良品 MUJI 平衡保湿乳霜', 65.00, '50g', 58, 100, '件', '774832', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 32, 20, 130.00, '副标题', 130.00, 10, 1000.00, '关键字', '备注', '/goods-img/65aed381-cde0-44ed-b345-5ebf1d74a13b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (33, '无印良品 MUJI 基础润肤乳液', 70.00, '清爽型 200ml', 58, 100, '件', '774833', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 33, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/1e09e1ed-435b-4f08-84d0-d88308a315ee.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (34, '无印良品 MUJI 平衡洁面泡沫', 42.00, '100g', 58, 100, '件', '774834', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 34, 20, 85.00, '副标题', 85.00, 10, 1000.00, '关键字', '备注', '/goods-img/dbc2ea2a-ee03-4366-a35e-6ebe66d02399.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (35, '无印良品 MUJI 基础润肤乳液', 61.00, '滋润型 200ml', 58, 100, '件', '774835', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 35, 20, 61.00, '副标题', 61.00, 10, 1000.00, '关键字', '备注', '/goods-img/9389914c-2860-4a75-b603-53ed5a4e0509.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (36, '无印良品 MUJI 便携式香薰机', 200.00, '新蜂精选', 58, 100, '件', '774836', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 36, 20, 200.00, '副标题', 200.00, 10, 1000.00, '关键字', '备注', '/goods-img/6ab010e2-5f1e-4512-bd22-4c2550915d4c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (37, '无印良品 MUJI 女式', 70.00, '粗棉线条纹长袖T恤 白色*横条 L', 58, 100, '件', '774837', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 37, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/fab00903-7ff6-40ee-a9bc-3fbc2f0f0ffc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (38, '无印良品（MUJI） 聚丙烯化妆盒 1/2', 30.00, '半透明约150x220x86mm', 58, 100, '件', '774838', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 38, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/ab725751-adb8-452a-86dd-cb3d21da794e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (39, '无印良品 MUJI 聚丙烯', 18.00, '笔盒 大/约184*64*25㎜', 58, 100, '件', '774839', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 39, 20, 18.00, '副标题', 18.00, 10, 1000.00, '关键字', '备注', '/goods-img/9f623290-928c-498f-89e6-171372b394f2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (40, '无印良品（MUJI） 无针订书机 其他', 52.00, '新蜂精选', 58, 100, '件', '774840', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 40, 20, 52.00, '副标题', 52.00, 10, 1000.00, '关键字', '备注', '/goods-img/a7221688-3c37-4ac0-b07e-d8bde1525d1e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (41, '无印良品 MUJI 塑料橡皮', 4.00, '黑色 小', 58, 100, '件', '774841', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 41, 20, 4.00, '副标题', 4.00, 10, 1000.00, '关键字', '备注', '/goods-img/75e26af4-8f15-43f2-9407-50d641f82acb.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (42, '无印良品 MUJI 大容量基础乳液/高保湿型', 140.00, '400ml', 58, 100, '件', '774842', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 42, 20, 140.00, '副标题', 140.00, 10, 1000.00, '关键字', '备注', '/goods-img/69d55773-1b43-497b-af18-90f2cec7c93a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (43, '无印良品 MUJI 毛笔', 20.00, '黑色', 58, 100, '件', '774843', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 43, 20, 20.00, '副标题', 20.00, 10, 1000.00, '关键字', '备注', '/goods-img/419ddb3c-1793-49c1-8953-77409a5d5bce.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (44, '无印良品 MUJI 塑料橡皮', 4.00, '白色 小', 58, 100, '件', '774844', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 44, 20, 4.00, '副标题', 4.00, 10, 1000.00, '关键字', '备注', '/goods-img/e53cc7af-f81c-4752-aec8-007e807b2fc1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (45, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 深海军蓝X格子 L', 58, 100, '件', '774845', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 45, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/481e8994-20cb-4f6c-8b77-4eb8509eb3b9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (46, '无印良品 MUJI 荧光笔', 10.00, '蓝色', 58, 100, '件', '774846', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 46, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/012ebf2d-8c96-4641-8782-eab01c85d98f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (47, '无印良品（MUJI） 钢制指甲刀 小', 42.00, '新蜂精选', 58, 100, '件', '774847', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 47, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/2c150720-4b3a-4d9e-9ce6-77eb4998e1f1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (48, '无印良品 MUJI 长条诗笺型笔记表格', 10.00, '白色 40枚 14行', 58, 100, '件', '774848', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 48, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/e7d2ea3f-6703-4fcc-bbb4-ad9ef43a0ae2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (49, '无印良品 MUJI PET喷雾小分装瓶100ml', 30.00, '新蜂精选', 58, 100, '件', '774849', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 49, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/0ec8c4a7-aedc-464d-9e23-d3e4acafdc73.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (50, '无印良品 MUJI 塑料橡皮', 7.00, '黑色 大', 58, 100, '件', '774850', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 50, 20, 7.00, '副标题', 7.00, 10, 1000.00, '关键字', '备注', '/goods-img/ce8ff43c-e8b4-4c52-9de1-c983c97068f6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (51, '无印良品 MUJI 荧光笔', 10.00, '黄色', 58, 100, '件', '774851', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 51, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/79b38a89-b02a-4fd1-80c4-5cb426028536.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (52, '无印良品 MUJI 遮瑕膏', 42.00, '棒状 自然色', 58, 100, '件', '774852', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 52, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/ffa69c8e-f57f-4ef4-a2a0-3695d538d6c5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (53, '无印良品 MUJI 马桶刷/附盒子', 70.00, '白色', 58, 100, '件', '774853', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 53, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/9dd1cdfb-e7f9-4d3c-98df-933e2bc3f9a8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (54, '无印良品 MUJI 耐热玻璃_壶_大', 150.00, '透明', 58, 100, '件', '774854', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 54, 20, 150.00, '副标题', 150.00, 10, 1000.00, '关键字', '备注', '/goods-img/0bc4f5ac-d601-421d-8131-81958a195705.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (55, '无印良品 MUJI 女式', 59.00, '平纹短袖衬衫 藏青色 M', 58, 100, '件', '774855', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 55, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/76b6a573-12a0-4c63-b2ae-e7193aff0fc8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (56, '无印良品 MUJI 基础润肤化妆水', 22.00, '清爽型 50ml', 58, 100, '件', '774856', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 56, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/af7f9b21-d782-4bad-8b1a-d86bbc4d224e.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (57, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 炭灰色 M', 58, 100, '件', '774857', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 57, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/26e0c424-f22d-4d3d-9bd6-a7958a346ff9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (58, '无印良品（MUJI） PET分裝瓶', 15.00, '新蜂精选', 58, 100, '件', '774858', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 58, 20, 15.00, '副标题', 15.00, 10, 1000.00, '关键字', '备注', '/goods-img/24bf1630-0339-4c22-ad19-37152c561e71.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (59, '无印良品 MUJI 女式', 199.00, '无侧缝法兰绒 睡衣 灰色 M', 58, 100, '件', '774859', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 59, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/e8e26306-0521-4843-9e07-70ebd2fa6405.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (60, '无印良品（MUJI） PE分裝瓶', 10.00, '新蜂精选', 58, 100, '件', '774860', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 60, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/9b3af7c2-57f5-48a7-bea5-603b2d145000.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (61, '无印良品 MUJI 基础润肤化妆水', 70.00, '滋润型 200ml', 58, 100, '件', '774861', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 61, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/7577f3e0-f48b-47a9-96b7-de405a6aaf95.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (62, '无印良品 MUJI 男式', 29.00, '干爽 凉感珠地网眼编织V领短袖T恤 黑色 L', 58, 100, '件', '774862', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 62, 20, 98.00, '副标题', 98.00, 10, 1000.00, '关键字', '备注', '/goods-img/cce2af31-07ea-4744-8d01-16dd01d68e5b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (63, '无印良品（MUJI） 聚丙烯化妆盒 半透明约150x220x169mm', 40.00, '新蜂精选', 58, 100, '件', '774863', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 63, 20, 40.00, '副标题', 40.00, 10, 1000.00, '关键字', '备注', '/goods-img/6dc279ac-fef0-401c-8604-b18dc9a9f7ab.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (64, '无印良品（MUJI） 散粉小 自然色', 60.00, '新蜂精选', 58, 100, '件', '774864', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 64, 20, 60.00, '副标题', 60.00, 10, 1000.00, '关键字', '备注', '/goods-img/94764fac-f4ad-4ee8-8d26-21af0c09ea76.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (65, '无印良品 MUJI 毛笔', 20.00, '黑色', 58, 100, '件', '774865', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 65, 20, 20.00, '副标题', 20.00, 10, 1000.00, '关键字', '备注', '/goods-img/9cd07460-8c0b-49e5-9741-5015a3576e8e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (66, '无印良品 MUJI 塑料橡皮', 4.00, '白色 小', 58, 100, '件', '774866', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 66, 20, 4.00, '副标题', 4.00, 10, 1000.00, '关键字', '备注', '/goods-img/70529ced-527a-4b46-aafa-874107ff9ea5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (67, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 深海军蓝X格子 L', 58, 100, '件', '774867', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 67, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/174ec60d-7d2b-4043-a7a6-7383c3de1a11.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (68, '无印良品 MUJI 荧光笔', 10.00, '蓝色', 58, 100, '件', '774868', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 68, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/eef29d44-17f5-41dd-b0ba-c6f63d7bdac3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (69, '无印良品（MUJI） 钢制指甲刀 小', 42.00, '新蜂精选', 58, 100, '件', '774869', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 69, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/f9964432-a9b7-45c2-ac6d-680130c2d7a7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (70, '无印良品 MUJI 长条诗笺型笔记表格', 10.00, '白色 40枚 14行', 58, 100, '件', '774870', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 70, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/da1e4523-adb4-48e4-afa5-313346187690.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (71, '无印良品 MUJI PET喷雾小分装瓶100ml', 30.00, '新蜂精选', 58, 100, '件', '774871', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 71, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/7f1eec3d-d8e5-4a18-a1a9-b81876dcaaf5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (72, '无印良品 MUJI 塑料橡皮', 7.00, '黑色 大', 58, 100, '件', '774872', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 72, 20, 7.00, '副标题', 7.00, 10, 1000.00, '关键字', '备注', '/goods-img/1ca16211-2b80-4006-ab60-e1a3cab4218c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (73, '无印良品 MUJI 荧光笔', 10.00, '黄色', 58, 100, '件', '774873', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 73, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/56eec806-2af3-4136-a9bf-2333455339e7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (74, '无印良品 MUJI 遮瑕膏', 42.00, '棒状 自然色', 58, 100, '件', '774874', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 74, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/593b65a7-feae-45aa-837e-47d58bb27474.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (75, '无印良品 MUJI 马桶刷/附盒子', 70.00, '白色', 58, 100, '件', '774875', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 75, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/a9983f71-d818-459d-ad59-bbdd26bb533b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (76, '无印良品 MUJI 耐热玻璃_壶_大', 150.00, '透明', 58, 100, '件', '774876', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 76, 20, 150.00, '副标题', 150.00, 10, 1000.00, '关键字', '备注', '/goods-img/7f89c29e-d888-4ee0-92af-ca713a7871a4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (77, '无印良品 MUJI 女式', 59.00, '平纹短袖衬衫 藏青色 M', 58, 100, '件', '774877', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 77, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/0b1e57bf-b4fd-40df-9832-4749d7d69db9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (78, '无印良品 MUJI 基础润肤化妆水', 22.00, '清爽型 50ml', 58, 100, '件', '774878', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 78, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/9b4af7cf-235a-4742-bdc3-9e8e656f245c.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (79, '无印良品 MUJI 男式', 199.00, '无侧缝法兰绒 睡衣 炭灰色 M', 58, 100, '件', '774879', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 79, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/8ddfc2de-3da3-4fad-86aa-7c570cb55212.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (80, '无印良品（MUJI） PET分裝瓶', 15.00, '新蜂精选', 58, 100, '件', '774880', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 80, 20, 15.00, '副标题', 15.00, 10, 1000.00, '关键字', '备注', '/goods-img/e62d04e9-3ae2-431c-8538-becda89e0e84.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (81, '无印良品 MUJI 女式', 199.00, '无侧缝法兰绒 睡衣 灰色 M', 58, 100, '件', '774881', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 81, 20, 398.00, '副标题', 398.00, 10, 1000.00, '关键字', '备注', '/goods-img/3078143f-1cdd-4f66-951b-2cf08af8c826.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (82, '无印良品（MUJI） PE分裝瓶', 10.00, '新蜂精选', 58, 100, '件', '774882', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 82, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/97aa8872-26df-473a-b0d7-f5021776cb52.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (83, '无印良品 MUJI 基础润肤化妆水', 70.00, '滋润型 200ml', 58, 100, '件', '774883', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 83, 20, 70.00, '副标题', 70.00, 10, 1000.00, '关键字', '备注', '/goods-img/954da201-0cbb-45d1-9cd1-17ce4d24cfb4.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (84, '无印良品 MUJI 男式', 29.00, '干爽 凉感珠地网眼编织V领短袖T恤 黑色 L', 58, 100, '件', '774884', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 84, 20, 98.00, '副标题', 98.00, 10, 1000.00, '关键字', '备注', '/goods-img/b584ea09-7aae-422e-8435-fdc38c948434.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (85, '无印良品（MUJI） 聚丙烯化妆盒 半透明约150x220x169mm', 40.00, '新蜂精选', 58, 100, '件', '774885', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 85, 20, 40.00, '副标题', 40.00, 10, 1000.00, '关键字', '备注', '/goods-img/a0a45b44-82c9-4a58-a972-304bed0632bb.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (86, '无印良品（MUJI） 散粉小 自然色', 60.00, '新蜂精选', 58, 100, '件', '774886', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 86, 20, 60.00, '副标题', 60.00, 10, 1000.00, '关键字', '备注', '/goods-img/a1b8ff33-ec01-494e-a1db-fb5158f3c168.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (87, '无印良品 MUJI 荧光笔', 10.00, '粉红色', 58, 100, '件', '774887', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 87, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/c5d6d952-c81b-436a-a345-feb4c5a20a7d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (88, '无印良品（MUJI） PET小分装瓶100ml', 30.00, '新蜂精选', 58, 100, '件', '774888', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 88, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/2ffe59f3-559f-4e6f-810d-1b6fa4ac04e1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (89, '无印良品 MUJI 基础润肤洁面乳', 74.00, '150ml', 58, 100, '件', '774889', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 89, 20, 74.00, '副标题', 74.00, 10, 1000.00, '关键字', '备注', '/goods-img/1f24d75a-0468-471a-a608-bd6788f4c1a1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (90, '无印良品 MUJI 基础润肤乳霜', 100.00, '其他 50g', 58, 100, '件', '774890', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 90, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/86e027b3-8868-4fa5-971b-49e827027e3e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (91, '无印良品 MUJI 基础润肤洁面泡沫(替换装)', 69.00, '180ml', 58, 100, '件', '774891', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 91, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/1aea34fa-f45e-4c3c-b73c-da1f92492c95.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (92, '无印良品 MUJI 保湿洁面啫喱', 50.00, '100g', 58, 100, '件', '774892', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 92, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/838fc0cb-b98f-4dca-bd68-581138b21a30.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (93, '无印良品 MUJI 小型超声波香薰机', 250.00, '其他', 58, 100, '件', '774893', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 93, 20, 250.00, '副标题', 250.00, 10, 1000.00, '关键字', '备注', '/goods-img/30f05c92-a303-4b94-bb5e-22f3c65f3c37.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (94, '无印良品 MUJI 修正带', 25.00, '其他', 58, 100, '件', '774894', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 94, 20, 25.00, '副标题', 25.00, 10, 1000.00, '关键字', '备注', '/goods-img/759427b3-b723-4917-b565-c0ae2003bf02.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (95, '无印良品 MUJI 聚丙烯', 12.00, '笔盒 小/约170*51*20㎜', 58, 100, '件', '774895', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 95, 20, 12.00, '副标题', 12.00, 10, 1000.00, '关键字', '备注', '/goods-img/734f1604-e687-4cd1-8573-bb00e680e94e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (96, '无印良品 MUJI 乳液', 27.00, '50ml', 58, 100, '件', '774896', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 96, 20, 55.00, '副标题', 55.00, 10, 1000.00, '关键字', '备注', '/goods-img/4eed1033-7728-477c-a29d-589bfd3ae3ce.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (97, '无印良品 MUJI 男式', 89.00, '棉水洗 平纹短袖衬衫 白色 L', 58, 100, '件', '774897', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 97, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/d3fa11f3-6cfa-4958-b09c-584a62137b4b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (98, '无印良品 MUJI 香/绿意', 32.00, '12支装/棒状', 58, 100, '件', '774898', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 98, 20, 32.00, '副标题', 32.00, 10, 1000.00, '关键字', '备注', '/goods-img/829f2d09-1589-4f63-8376-d347c3cec620.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (99, '无印良品 MUJI 润肤乳霜(高保湿型)50g', 159.00, '50g', 58, 100, '件', '774899', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 99, 20, 159.00, '副标题', 159.00, 10, 1000.00, '关键字', '备注', '/goods-img/1c70ddcb-ca69-40ed-a263-30880b2e2cac.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (100, '无印良品 MUJI 柔滑笔芯', 19.00, '黑色', 58, 100, '件', '7748100', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 100, 20, 19.00, '副标题', 19.00, 10, 1000.00, '关键字', '备注', '/goods-img/1db10d7c-3429-4ef2-ac41-2991af57f442.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (101, '无印良品 MUJI 铝制', 25.00, '挂钩/吸盘式_2个装 大/约宽4.5x高6cm 2个装', 58, 100, '件', '7748101', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 101, 20, 25.00, '副标题', 25.00, 10, 1000.00, '关键字', '备注', '/goods-img/bd0b92b4-c8ca-453a-b572-b3447083bddf.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (102, '无印良品 MUJI 修正带', 15.00, 'POM材质 替芯', 58, 100, '件', '7748102', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 102, 20, 15.00, '副标题', 15.00, 10, 1000.00, '关键字', '备注', '/goods-img/98ce17e1-890e-4eaf-856a-7fce8ffebc4c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (103, '无印良品 MUJI 压克力记录板夹', 35.00, 'Ａ4用/220×310ｍｍ', 58, 100, '件', '7748103', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 103, 20, 35.00, '副标题', 35.00, 10, 1000.00, '关键字', '备注', '/goods-img/64d4e0b7-cd01-47f6-9081-4c2e7625e4f9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (104, '无印良品（MUJI） 自然亲肤粉底液 自然透亮色', 75.00, '新蜂精选', 58, 100, '件', '7748104', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 104, 20, 75.00, '副标题', 75.00, 10, 1000.00, '关键字', '备注', '/goods-img/09576fcd-ea01-4b1d-bed4-be96b71f2c4e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (105, '无印良品 MUJI 荧光笔', 10.00, '粉红色', 58, 100, '件', '7748105', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 105, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/04a8c325-d296-4f0e-ac6d-8cccba4dc90e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (106, '无印良品（MUJI） PET小分装瓶100ml', 30.00, '新蜂精选', 58, 100, '件', '7748106', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 106, 20, 30.00, '副标题', 30.00, 10, 1000.00, '关键字', '备注', '/goods-img/755a34a3-bc3e-4f04-8943-f79860012e78.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (107, '无印良品 MUJI 基础润肤洁面乳', 74.00, '150ml', 58, 100, '件', '7748107', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 107, 20, 74.00, '副标题', 74.00, 10, 1000.00, '关键字', '备注', '/goods-img/e6a986ed-9b83-4649-9e72-3cf676c1f90e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (108, '无印良品 MUJI 基础润肤乳霜', 100.00, '其他 50g', 58, 100, '件', '7748108', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 108, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/30036561-a150-4ea7-9106-29bbea278909.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (109, '无印良品 MUJI 基础润肤洁面泡沫(替换装)', 69.00, '180ml', 58, 100, '件', '7748109', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 109, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/aa37202c-68eb-4c84-b02c-171b3d11c0e8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (110, '无印良品 MUJI 保湿洁面啫喱', 50.00, '100g', 58, 100, '件', '7748110', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 110, 20, 100.00, '副标题', 100.00, 10, 1000.00, '关键字', '备注', '/goods-img/0f724c0f-8888-4b75-8fe1-dc7dd8f2b7bd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (111, '无印良品 MUJI 小型超声波香薰机', 250.00, '其他', 58, 100, '件', '7748111', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 111, 20, 250.00, '副标题', 250.00, 10, 1000.00, '关键字', '备注', '/goods-img/9608b59d-cbca-4b70-9f05-226fde41c51c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (112, '无印良品 MUJI 修正带', 25.00, '其他', 58, 100, '件', '7748112', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 112, 20, 25.00, '副标题', 25.00, 10, 1000.00, '关键字', '备注', '/goods-img/d91a71e7-aada-4770-91c5-4da21e4b7ed9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (113, '无印良品 MUJI 聚丙烯', 12.00, '笔盒 小/约170*51*20㎜', 58, 100, '件', '7748113', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 113, 20, 12.00, '副标题', 12.00, 10, 1000.00, '关键字', '备注', '/goods-img/d543ba0d-18d8-427a-87ea-99968b319440.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (114, '无印良品 MUJI 乳液', 27.00, '50ml', 58, 100, '件', '7748114', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 114, 20, 55.00, '副标题', 55.00, 10, 1000.00, '关键字', '备注', '/goods-img/cd6d91b0-69b2-4415-8560-4cbd2690cb50.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (115, '无印良品 MUJI 男式', 89.00, '棉水洗 平纹短袖衬衫 白色 L', 58, 100, '件', '7748115', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 115, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/b08c94ac-cba2-4468-b3d0-03d9447f5bf2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (116, '无印良品 MUJI 香/绿意', 32.00, '12支装/棒状', 58, 100, '件', '7748116', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 116, 20, 32.00, '副标题', 32.00, 10, 1000.00, '关键字', '备注', '/goods-img/5a65f952-4141-47f8-8f8e-84120bbf74ea.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (117, '无印良品 MUJI 润肤乳霜(高保湿型)50g', 159.00, '50g', 58, 100, '件', '7748117', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 117, 20, 159.00, '副标题', 159.00, 10, 1000.00, '关键字', '备注', '/goods-img/503ef53e-d4ac-4c4e-83a7-8a03ead0ecc8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (118, '无印良品 MUJI 柔滑笔芯', 19.00, '黑色', 58, 100, '件', '7748118', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 118, 20, 19.00, '副标题', 19.00, 10, 1000.00, '关键字', '备注', '/goods-img/aa83ce5b-2db1-4ecf-bc4f-f43c437894d7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (119, '无印良品 MUJI 铝制', 25.00, '挂钩/吸盘式_2个装 大/约宽4.5x高6cm 2个装', 58, 100, '件', '7748119', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 119, 20, 25.00, '副标题', 25.00, 10, 1000.00, '关键字', '备注', '/goods-img/5c590548-9de3-47a3-8cb9-4d8f040a9635.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (120, '无印良品 MUJI 修正带', 15.00, 'POM材质 替芯', 58, 100, '件', '7748120', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 120, 20, 15.00, '副标题', 15.00, 10, 1000.00, '关键字', '备注', '/goods-img/93181f0b-c069-4542-be91-a63856cd12d1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (121, '无印良品 MUJI 压克力记录板夹', 35.00, 'Ａ4用/220×310ｍｍ', 58, 100, '件', '7748121', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 121, 20, 35.00, '副标题', 35.00, 10, 1000.00, '关键字', '备注', '/goods-img/45be1de3-447b-404b-9df8-ddf07fdc8647.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (122, '无印良品（MUJI） 自然亲肤粉底液 自然透亮色', 75.00, '新蜂精选', 58, 100, '件', '7748122', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 122, 20, 75.00, '副标题', 75.00, 10, 1000.00, '关键字', '备注', '/goods-img/7f905827-5765-40bc-a1b8-bedd9f407ced.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (123, '无印良品 MUJI PE小分装盒', 10.00, '透明 30g', 58, 100, '件', '7748123', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 123, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/1d7f28bb-6597-48de-a6bb-2561697db883.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (124, '无印良品 MUJI 保湿化妆液', 80.00, '新蜂精选', 58, 100, '件', '7748124', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 124, 20, 160.00, '副标题', 160.00, 10, 1000.00, '关键字', '备注', '/goods-img/53a089a9-e1d1-487e-974e-18bb4df41cf3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (125, '无印良品 MUJI 女式', 40.00, '棉弹力 高领T恤 深灰色 M', 58, 100, '件', '7748125', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 125, 20, 128.00, '副标题', 128.00, 10, 1000.00, '关键字', '备注', '/goods-img/53a6478b-4fd5-4add-b095-9fd4ad983a7b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (126, '无印良品 MUJI 男式', 89.00, '棉水洗 牛津纽扣领短袖衬衫 白色 L', 58, 100, '件', '7748126', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 126, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/561e9e6d-b130-468d-8328-36a5ff70cdfa.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (127, '无印良品 MUJI 基础润肤乳液', 29.00, '高保湿型 50ml', 58, 100, '件', '7748127', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 127, 20, 37.00, '副标题', 37.00, 10, 1000.00, '关键字', '备注', '/goods-img/01514263-83b4-4ac7-aee3-5e5a2448414f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (128, 'MUJI 羽毛 靠垫', 65.00, '白色', 58, 100, '件', '7748128', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 128, 20, 65.00, '副标题', 65.00, 10, 1000.00, '关键字', '备注', '/goods-img/23e5ee1d-5bb7-4f2a-b4b5-4fbc9ca3c163.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (129, '无印良品（MUJI） 可携带用小卷尺 白色', 28.00, '新蜂精选', 58, 100, '件', '7748129', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 129, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/a4d3a61e-b0d3-4c58-85d6-fddf1de85f66.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (130, '无印良品 MUJI 笔记本/5mm方格', 9.00, '暗灰色 B5/30张/线装', 58, 100, '件', '7748130', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 130, 20, 9.00, '副标题', 9.00, 10, 1000.00, '关键字', '备注', '/goods-img/38c25b00-a4fb-4893-aa8e-34ff76963397.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (131, '无印良品 MUJI 低重心铅笔', 47.00, '白色', 58, 100, '件', '7748131', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 131, 20, 47.00, '副标题', 47.00, 10, 1000.00, '关键字', '备注', '/goods-img/dc497882-61ea-4d4f-98fe-d2b2500eda01.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (132, '无印良品（MUJI） 手动碎纸机', 75.00, '新蜂精选', 58, 100, '件', '7748132', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 132, 20, 75.00, '副标题', 75.00, 10, 1000.00, '关键字', '备注', '/goods-img/f6e1ce14-a590-4736-9d36-df5628bc4188.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (133, '无印良品 MUJI 女式', 53.00, '无袖衫 燕麦色 XL', 58, 100, '件', '7748133', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 133, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/c2e30c9b-ce49-4824-824a-b7d3ae173340.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (134, '无印良品 MUJI 女式', 70.00, '粗棉线长袖T恤 生成色 L', 58, 100, '件', '7748134', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 134, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/4b1b98d5-359f-4025-85e3-f357b6e9724a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (135, '无印良品 MUJI 塑料浴室座椅/小', 85.00, '原色', 58, 100, '件', '7748135', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 135, 20, 85.00, '副标题', 85.00, 10, 1000.00, '关键字', '备注', '/goods-img/37053615-750d-486e-b218-358a7c1adb21.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (136, '无印良品（MUJI） 树脂携带型订书机 白色', 42.00, '新蜂精选', 58, 100, '件', '7748136', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 136, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/21dd6bd9-c4bc-4e17-8fed-23775cebf361.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (137, '无印良品 MUJI 基础润肤乳液', 22.00, '滋润型', 58, 100, '件', '7748137', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 137, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/b8978340-ff72-4b5a-a9d3-4b5610982764.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (138, '无印良品（MUJI） 控色隔离霜30g 浅蓝色', 65.00, '新蜂精选', 58, 100, '件', '7748138', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 138, 20, 65.00, '副标题', 65.00, 10, 1000.00, '关键字', '备注', '/goods-img/b2969d29-b073-48f3-aa9a-b8aeb08a98d6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (139, '无印良品 MUJI 女式', 70.00, '粗棉线条纹长袖T恤 黑*横条 L', 58, 100, '件', '7748139', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 139, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/a905c374-3411-4ddd-9b84-7ecbc9b50620.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (140, '无印良品 MUJI PE小分装盒', 10.00, '透明 30g', 58, 100, '件', '7748140', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 140, 20, 10.00, '副标题', 10.00, 10, 1000.00, '关键字', '备注', '/goods-img/2750405a-2e01-463d-a059-54644c67f7cc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (141, '无印良品 MUJI 保湿化妆液', 80.00, '新蜂精选', 58, 100, '件', '7748141', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 141, 20, 160.00, '副标题', 160.00, 10, 1000.00, '关键字', '备注', '/goods-img/17656dd7-c0fb-431d-810a-5eb29d07c011.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (142, '无印良品 MUJI 女式', 40.00, '棉弹力 高领T恤 深灰色 M', 58, 100, '件', '7748142', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 142, 20, 128.00, '副标题', 128.00, 10, 1000.00, '关键字', '备注', '/goods-img/780e716a-7be8-4d94-b8b6-833b4d97e148.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (143, '无印良品 MUJI 男式', 89.00, '棉水洗 牛津纽扣领短袖衬衫 白色 L', 58, 100, '件', '7748143', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 143, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/94f5b471-1148-4320-aa8a-68573706fd91.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (144, '无印良品 MUJI 基础润肤乳液', 29.00, '高保湿型 50ml', 58, 100, '件', '7748144', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 144, 20, 37.00, '副标题', 37.00, 10, 1000.00, '关键字', '备注', '/goods-img/a12dcb9c-bb36-4df9-b517-1578a03fe062.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (145, 'MUJI 羽毛 靠垫', 65.00, '白色', 58, 100, '件', '7748145', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 145, 20, 65.00, '副标题', 65.00, 10, 1000.00, '关键字', '备注', '/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (146, '无印良品（MUJI） 可携带用小卷尺 白色', 28.00, '新蜂精选', 58, 100, '件', '7748146', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 146, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/737afa41-1905-4dbc-ab33-95f8489dde5b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (147, '无印良品 MUJI 笔记本/5mm方格', 9.00, '暗灰色 B5/30张/线装', 58, 100, '件', '7748147', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 147, 20, 9.00, '副标题', 9.00, 10, 1000.00, '关键字', '备注', '/goods-img/c6632420-ad7e-451b-a2a9-b02299653db1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (148, '无印良品 MUJI 低重心铅笔', 47.00, '白色', 58, 100, '件', '7748148', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 148, 20, 47.00, '副标题', 47.00, 10, 1000.00, '关键字', '备注', '/goods-img/060e3ace-71ca-44a2-9ded-73a05f186fcf.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (149, '无印良品（MUJI） 手动碎纸机', 75.00, '新蜂精选', 58, 100, '件', '7748149', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 149, 20, 75.00, '副标题', 75.00, 10, 1000.00, '关键字', '备注', '/goods-img/58d831e4-07f4-44e2-a994-1a7d585452a1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (150, '无印良品 MUJI 女式', 53.00, '无袖衫 燕麦色 XL', 58, 100, '件', '7748150', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 150, 20, 178.00, '副标题', 178.00, 10, 1000.00, '关键字', '备注', '/goods-img/f2aaadc0-ddda-4736-9826-2dbb2c533ea0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (151, '无印良品 MUJI 女式', 70.00, '粗棉线长袖T恤 生成色 L', 58, 100, '件', '7748151', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 151, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/09c87218-d645-48e7-bbd5-54af5e77bf4b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (152, '无印良品 MUJI 塑料浴室座椅', 85.00, '原色', 58, 100, '件', '7748152', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 152, 20, 85.00, '副标题', 85.00, 10, 1000.00, '关键字', '备注', '/goods-img/15395057-94e9-4545-a8ee-8aee025f40c5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (153, '无印良品（MUJI） 树脂携带型订书机 白色', 42.00, '新蜂精选', 58, 100, '件', '7748153', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 153, 20, 42.00, '副标题', 42.00, 10, 1000.00, '关键字', '备注', '/goods-img/3b40971a-3f32-45cf-a99a-aada90ee8e33.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (154, '无印良品 MUJI 基础润肤乳液', 22.00, '滋润型', 58, 100, '件', '7748154', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 154, 20, 28.00, '副标题', 28.00, 10, 1000.00, '关键字', '备注', '/goods-img/f65ef709-8fa8-4a3f-8abd-75a9b0492b14.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (155, '无印良品（MUJI） 控色隔离霜30g 浅蓝色', 65.00, '新蜂精选', 58, 100, '件', '7748155', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 155, 20, 65.00, '副标题', 65.00, 10, 1000.00, '关键字', '备注', '/goods-img/66311489-b28b-41c3-ac34-540293df6e42.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (156, '无印良品 女式粗棉线条纹长袖T恤', 70.00, '黑*横条 L', 58, 100, '件', '7748156', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 156, 20, 198.00, '副标题', 198.00, 10, 1000.00, '关键字', '备注', '/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (157, 'Apple AirPods 配充电盒', 1246.00, '苹果蓝牙耳机', 58, 100, '件', '7748157', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 157, 20, 1246.00, '副标题', 1246.00, 10, 1000.00, '关键字', '备注', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (158, '小米 Redmi AirDots', 129.00, '真无线蓝牙耳机|分体式耳机 |收纳充电盒 |蓝牙5.0 |按键防触控操作', 58, 100, '件', '7748158', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 158, 20, 129.00, '副标题', 129.00, 10, 1000.00, '关键字', '备注', '/goods-img/c47403f1-b706-453b-88d8-2bfdee0316be.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (159, '荣耀原装三键线控带麦半入耳式耳机AM116(尊爵版)适用于华为荣耀手机', 49.00, '新蜂精选', 58, 100, '件', '7748159', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 159, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/183481c3-47ff-4b2e-926f-b02b926ac02c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (160, '诺基亚（NOKIA）BH-705 银白色 5.0真无线蓝牙耳机迷你运动跑步音乐商务入耳式安卓苹果手机蓝牙耳机', 499.00, '新蜂精选', 58, 100, '件', '7748160', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 160, 20, 499.00, '副标题', 499.00, 10, 1000.00, '关键字', '备注', '/goods-img/5e0d089b-fa91-410d-8ff2-9534eb6f627f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (161, '华为耳机原装半入耳式有线mate9p10plus8x荣耀v20v10nova2s9iv9p9play 【标准版】华为AM115 白色-热卖款', 39.00, '新蜂精选', 58, 100, '件', '7748161', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 161, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/79e2b467-a075-46ef-ab43-aa0535f8e4c9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (162, 'Beats X 蓝牙无线', 799.00, '入耳式耳机 带麦可通话 -桀骜黑红（十周年版） MRQA2PA/A', 58, 100, '件', '7748162', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 162, 20, 1168.00, '副标题', 1168.00, 10, 1000.00, '关键字', '备注', '/goods-img/911531a4-39a6-4771-b26e-2ba4db1ebcda.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (163, '华为（ HUAWEI） 华为无线耳机', 799.00, '真无线蓝牙耳机 双耳蓝牙音乐耳机 Freebuds 2 无线耳机 陶瓷白', 58, 100, '件', '7748163', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 163, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/e70a4f29-2269-466a-984e-01e018206c2e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (164, '【自营仓次日达】moloke真无线蓝牙耳机双耳适用于苹果华为小米 运动跑步入耳式oppo迷你商务耳机 【1:1尊享版】自动弹窗+无线充电+可触控（热卖）', 199.00, '新蜂精选', 58, 100, '件', '7748164', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 164, 20, 359.00, '副标题', 359.00, 10, 1000.00, '关键字', '备注', '/goods-img/70dc1586-13bd-4b4c-92a9-fe20aa1d531f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (165, 'Beats Powerbeats Pro', 1888.00, '完全无线高性能耳机 真无线蓝牙运动耳机 象牙白', 58, 100, '件', '7748165', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 165, 20, 1888.00, '副标题', 1888.00, 10, 1000.00, '关键字', '备注', '/goods-img/04441cd4-81c8-4ad9-a067-9d15422e508f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (166, '纽曼（Newmine）NM-LK06 全兼容线控音乐手机耳机 白色', 9.00, '新蜂精选', 58, 100, '件', '7748166', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 166, 20, 9.00, '副标题', 9.00, 10, 1000.00, '关键字', '备注', '/goods-img/ad53ea23-6974-4e44-b62d-eab498ce1d63.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (167, '索尼（SONY）重低音立体声耳机MDR-XB55AP 黑色', 185.00, '新蜂精选', 58, 100, '件', '7748167', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 167, 20, 229.00, '副标题', 229.00, 10, 1000.00, '关键字', '备注', '/goods-img/01e1998d-f183-4e99-b8ba-7715727cf90b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (168, '索尼（SONY）WI-1000X Hi-Res颈挂式 入耳式', 1499.00, '无线蓝牙耳机 高音质降噪耳机 手机通话 黑色', 58, 100, '件', '7748168', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 168, 20, 2399.00, '副标题', 2399.00, 10, 1000.00, '关键字', '备注', '/goods-img/1631a30b-287c-41da-bbbe-1a9b1b8d1552.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (169, '小米耳机 圈铁Pro 入耳式有线运动音乐耳机耳麦', 149.00, '新蜂精选', 58, 99, '件', '7748169', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 169, 20, 149.00, '副标题', 149.00, 10, 1000.00, '关键字', '备注', '/goods-img/f3d269a4-5317-4b30-b164-1311f6c1f058.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (170, 'Bose QuietControl 30', 2498.00, '无线耳机 QC30耳塞式蓝牙降噪耳麦', 58, 100, '件', '7748170', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 170, 20, 2498.00, '副标题', 2498.00, 10, 1000.00, '关键字', '备注', '/goods-img/966a8b32-f547-457c-9161-009d3113d584.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (171, 'Beats Solo3 Wireless', 1698.00, '头戴式 蓝牙无线耳机 手机耳机 游戏耳机 - 桀骜黑红（十周年版） MRQC2PA/A', 58, 100, '件', '7748171', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 171, 20, 2268.00, '副标题', 2268.00, 10, 1000.00, '关键字', '备注', '/goods-img/72218e28-fc58-4aa0-b3cd-c1f2c764d25e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (172, '索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪 头戴式耳机（触控面板', 2599.00, '智能降噪 长久续航）黑色', 58, 100, '件', '7748172', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 172, 20, 2899.00, '副标题', 2899.00, 10, 1000.00, '关键字', '备注', '/goods-img/4cc6c606-4d69-4f49-b10c-01cedeef813f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (173, '雷蛇 Razer 北海巨妖标准版X', 299.00, '北海巨妖标准版升级款 头戴式游戏耳机 电竞耳麦 7.1 电脑手机耳机 黑色', 58, 100, '件', '7748173', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 173, 20, 349.00, '副标题', 349.00, 10, 1000.00, '关键字', '备注', '/goods-img/7345c467-6c2d-4f30-a73d-83d675d5208c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (174, '森海塞尔（Sennheiser）MomentumTrueWireless 真无线蓝牙hifi发烧入耳式耳机 蓝牙5.0', 2399.00, '黑色', 58, 100, '件', '7748174', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 174, 20, 2399.00, '副标题', 2399.00, 10, 1000.00, '关键字', '备注', '/goods-img/efea018e-8ab0-47f9-a3d4-260c8cd2de5f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (175, 'Bose SoundSport Free', 1699.00, '真无线蓝牙耳机--黑色 运动耳机 防掉落耳塞', 58, 100, '件', '7748175', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 175, 20, 1699.00, '副标题', 1699.00, 10, 1000.00, '关键字', '备注', '/goods-img/b3de8a39-e33c-432f-872f-46f4a1662498.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (176, '华为原装降噪有线手机耳机Mate9 10P9P10Plus荣耀V9V10PlayNova2s9i8x 【送耳机收纳包】AM115半入耳式耳机-经典热卖款', 39.00, '新蜂精选', 58, 100, '件', '7748176', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 176, 20, 99.00, '副标题', 99.00, 10, 1000.00, '关键字', '备注', '/goods-img/d6565a7e-473b-4933-93c5-e646495c8c4c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (177, 'Apple 采用Lightning/闪电接头的 EarPods', 223.00, '耳机', 58, 100, '件', '7748177', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 177, 20, 223.00, '副标题', 223.00, 10, 1000.00, '关键字', '备注', '/goods-img/bf6ccbc4-d0d0-4fbb-b975-4becb9cb38f4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (178, 'Apple AirPods 配充电盒', 1246.00, '苹果蓝牙耳机', 58, 100, '件', '7748178', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 178, 20, 1246.00, '副标题', 1246.00, 10, 1000.00, '关键字', '备注', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (179, '小米 Redmi AirDots', 129.00, '真无线蓝牙耳机|分体式耳机 |收纳充电盒 |蓝牙5.0 |按键防触控操作', 58, 99, '件', '7748179', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 179, 20, 129.00, '副标题', 129.00, 10, 1000.00, '关键字', '备注', '/goods-img/36d0fe8f-aa28-423c-81e7-82cab31b7598.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (180, '荣耀原装三键线控带麦半入耳式耳机AM116(尊爵版)适用于华为荣耀手机', 49.00, '新蜂精选', 58, 100, '件', '7748180', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 180, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/6113a562-f3f1-408c-9b0d-78a84407caf7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (181, '诺基亚（NOKIA）BH-705 银白色 5.0真无线蓝牙耳机迷你运动跑步音乐商务入耳式安卓苹果手机蓝牙耳机', 499.00, '新蜂精选', 58, 100, '件', '7748181', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 181, 20, 499.00, '副标题', 499.00, 10, 1000.00, '关键字', '备注', '/goods-img/abb13d3a-3445-4b26-b8e9-44cbec227b5d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (182, '华为耳机原装半入耳式有线mate9p10plus8x荣耀v20v10nova2s9iv9p9play 【标准版】华为AM115 白色-热卖款', 39.00, '新蜂精选', 58, 100, '件', '7748182', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 182, 20, 69.00, '副标题', 69.00, 10, 1000.00, '关键字', '备注', '/goods-img/fac9c3e9-4843-46d1-8668-7e2eac17ccf2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (183, 'Beats X 蓝牙无线', 799.00, '入耳式耳机 带麦可通话 -桀骜黑红（十周年版） MRQA2PA/A', 58, 100, '件', '7748183', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 183, 20, 1168.00, '副标题', 1168.00, 10, 1000.00, '关键字', '备注', '/goods-img/25910a34-e026-4954-87b0-c379999e1dd0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (184, '华为（ HUAWEI） 华为无线耳机', 799.00, '真无线蓝牙耳机 双耳蓝牙音乐耳机 Freebuds 2 无线耳机 陶瓷白', 58, 100, '件', '7748184', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 184, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/adf8cbc2-ccb9-408a-96d0-553848e111e9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (185, '【自营仓次日达】moloke真无线蓝牙耳机双耳适用于苹果华为小米 运动跑步入耳式oppo迷你商务耳机 【1:1尊享版】自动弹窗+无线充电+可触控（热卖）', 199.00, '新蜂精选', 58, 100, '件', '7748185', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 185, 20, 359.00, '副标题', 359.00, 10, 1000.00, '关键字', '备注', '/goods-img/1e5645d1-24cb-48eb-9aaa-f729fa0db195.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (186, 'Beats Powerbeats Pro', 1888.00, '完全无线高性能耳机 真无线蓝牙运动耳机 象牙白', 58, 100, '件', '7748186', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 186, 20, 1888.00, '副标题', 1888.00, 10, 1000.00, '关键字', '备注', '/goods-img/e028c016-6793-49a3-8b0f-d0102a415d21.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (187, '纽曼（Newmine）NM-LK06 全兼容线控音乐手机耳机 白色', 9.00, '新蜂精选', 58, 100, '件', '7748187', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 187, 20, 9.00, '副标题', 9.00, 10, 1000.00, '关键字', '备注', '/goods-img/0b02244f-6908-4ccb-a9d2-ccb5a462e30e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (188, '索尼（SONY）重低音立体声耳机MDR-XB55AP 黑色', 185.00, '新蜂精选', 58, 100, '件', '7748188', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 188, 20, 229.00, '副标题', 229.00, 10, 1000.00, '关键字', '备注', '/goods-img/eec7b009-a9ff-45cd-a7be-4051eb7b3c22.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (189, '索尼（SONY）WI-1000X Hi-Res颈挂式 入耳式', 1499.00, '无线蓝牙耳机 高音质降噪耳机 手机通话 黑色', 58, 100, '件', '7748189', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 189, 20, 2399.00, '副标题', 2399.00, 10, 1000.00, '关键字', '备注', '/goods-img/1c4adfba-f2f4-4ab3-8520-c28b0a437b7b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (190, '小米耳机 圈铁Pro 入耳式有线运动音乐耳机耳麦', 149.00, '新蜂精选', 58, 100, '件', '7748190', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 190, 20, 149.00, '副标题', 149.00, 10, 1000.00, '关键字', '备注', '/goods-img/b1530f7f-d286-4eb1-8d2b-3c2a74fa9f06.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (191, 'Bose QuietControl 30', 2498.00, '无线耳机 QC30耳塞式蓝牙降噪耳麦', 58, 100, '件', '7748191', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 191, 20, 2498.00, '副标题', 2498.00, 10, 1000.00, '关键字', '备注', '/goods-img/02cf272e-9062-4d4b-8b7f-7058f0472efa.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (192, 'Beats Solo3 Wireless', 1698.00, '头戴式 蓝牙无线耳机 手机耳机 游戏耳机 - 桀骜黑红（十周年版） MRQC2PA/A', 58, 100, '件', '7748192', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 192, 20, 2268.00, '副标题', 2268.00, 10, 1000.00, '关键字', '备注', '/goods-img/af77eaba-fd00-4ec8-b0e6-928372a0741d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (193, '索尼 WH-1000XM3 头戴式耳机', 2599.00, '高解析度无线蓝牙降噪（触控面板 智能降噪 长久续航）黑色', 58, 100, '件', '7748193', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 193, 20, 2899.00, '副标题', 2899.00, 10, 1000.00, '关键字', '备注', '/goods-img/0dc503b2-90a2-4971-9723-c085a1844b76.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (194, '雷蛇 Razer 北海巨妖标准版X', 299.00, '北海巨妖标准版升级款 头戴式游戏耳机 电竞耳麦 7.1 电脑手机耳机 黑色', 58, 100, '件', '7748194', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 194, 20, 349.00, '副标题', 349.00, 10, 1000.00, '关键字', '备注', '/goods-img/0cc81546-1408-4140-af95-0341a7778b6c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (195, '森海塞尔（Sennheiser）MomentumTrueWireless 真无线蓝牙hifi发烧入耳式耳机 蓝牙5.0', 2399.00, '黑色', 58, 100, '件', '7748195', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 195, 20, 2399.00, '副标题', 2399.00, 10, 1000.00, '关键字', '备注', '/goods-img/768e79e1-e875-4691-855d-262346451d22.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (196, 'Bose SoundSport Free', 1699.00, '真无线蓝牙耳机--黑色 运动耳机 防掉落耳塞', 58, 100, '件', '7748196', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 196, 20, 1699.00, '副标题', 1699.00, 10, 1000.00, '关键字', '备注', '/goods-img/d3370c50-e853-4546-a032-35073eb192ff.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (197, '华为原装降噪有线手机耳机Mate9 10P9P10Plus荣耀V9V10PlayNova2s9i8x 【送耳机收纳包】AM115半入耳式耳机-经典热卖款', 39.00, '新蜂精选', 58, 100, '件', '7748197', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 197, 20, 99.00, '副标题', 99.00, 10, 1000.00, '关键字', '备注', '/goods-img/0cff5ace-7ab9-43a7-91fe-fb3550829577.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (198, 'Apple 采用Lightning/闪电接头的 EarPods', 223.00, '耳机', 58, 100, '件', '7748198', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 198, 20, 223.00, '副标题', 223.00, 10, 1000.00, '关键字', '备注', '/goods-img/7b8bcf01-0abe-4155-b1f4-e57a6b8fc36a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (199, '迪奥（Dior）烈艳蓝金唇膏滋润999# 3.5g 经典正红色', 315.00, '(口红 保湿滋润 气质显白 不挑皮) （新老包装随机）', 58, 100, '件', '7748199', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 199, 20, 500.00, '副标题', 500.00, 10, 1000.00, '关键字', '备注', '/goods-img/6b0bd268-40b1-4abf-a19b-95df7cb4d722.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (200, '迪奥（Dior）烈艳蓝金唇膏-哑光999# 3.5g 传奇红（口红', 315.00, '雾面质地 显色持久 显白 正红色 李佳琦推荐）', 58, 100, '件', '7748200', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 200, 20, 400.00, '副标题', 400.00, 10, 1000.00, '关键字', '备注', '/goods-img/d8d4ac7e-7189-459a-aef2-7116f723cb0b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (201, '海囤全球 魅可（MAC)经典唇膏 子弹头口红3g', 155.00, 'Chili 秀智色/小辣椒色', 58, 100, '件', '7748201', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 201, 20, 170.00, '副标题', 170.00, 10, 1000.00, '关键字', '备注', '/goods-img/18aca3b8-d024-47d3-a971-fb51d374b1ae.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (202, '卡姿兰（Carslan）轻甜唇爱随心盒1.4g*4(13#暧昧 16#炽烈 18#嫉妒', 89.00, '19#欲望 唇盒 口红 七夕礼物 情人节礼物)', 58, 100, '件', '7748202', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 202, 20, 99.00, '副标题', 99.00, 10, 1000.00, '关键字', '备注', '/goods-img/44c8198e-f63a-45e0-8eff-789338de65f8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (203, '【联名限量版】MANSLY口红套装中国风口红情人节女朋友生日礼物唇釉彩妆女磁扣锦绣红妆口红礼盒彩妆 锦绣红妆口红礼盒（6支）', 295.00, '新蜂精选', 58, 100, '件', '7748203', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 203, 20, 295.00, '副标题', 295.00, 10, 1000.00, '关键字', '备注', '/goods-img/c081314e-8f67-44f9-a27e-aad6c3f29343.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (204, '迪奥（Dior）滋润999礼盒套装（烈艳蓝金999#3.5g 经典正红色+香氛小样1ml*3+礼盒）（小样和礼盒款式随机）', 379.00, '新蜂精选', 58, 100, '件', '7748204', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 204, 20, 379.00, '副标题', 379.00, 10, 1000.00, '关键字', '备注', '/goods-img/39c69481-6d13-4d84-bc1e-7dca612667f0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (205, '圣罗兰（YSL）莹亮纯魅唇膏12#（圆管口红）4.5g 斩男色', 320.00, '新蜂精选', 58, 100, '件', '7748205', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 205, 20, 320.00, '副标题', 320.00, 10, 1000.00, '关键字', '备注', '/goods-img/b4335e82-c9e1-4264-92e4-e324a601fedb.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (206, '圣罗兰（YSL）纯口红1#（正红色）3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748206', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 206, 20, 350.00, '副标题', 350.00, 10, 1000.00, '关键字', '备注', '/goods-img/57d0bf26-0a0c-4027-8a2b-deeaa29905ee.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (207, '纪梵希高定香榭天鹅绒唇膏306#(小羊皮口红 法式红 雾面哑光', 355.00, '持久锁色）新老包装随机发货', 58, 100, '件', '7748207', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 207, 20, 355.00, '副标题', 355.00, 10, 1000.00, '关键字', '备注', '/goods-img/f30bd8cb-aadd-43aa-8615-2c4795ee7f5f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (208, '【联名款】MANSLY口红套装红鸾心动口红礼盒中国风开运红情人节女朋友生日礼物唇釉颐和园同款彩妆口红 红鸾心动口红礼盒（6支）', 195.00, '新蜂精选', 58, 100, '件', '7748208', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 208, 20, 195.00, '副标题', 195.00, 10, 1000.00, '关键字', '备注', '/goods-img/f128ad98-fe4d-4264-96e3-6393b6cc98f1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (209, '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 258.00, '3.5g 999号 正红色', 58, 100, '件', '7748209', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 209, 20, 410.00, '副标题', 410.00, 10, 1000.00, '关键字', '备注', '/goods-img/8fcdb86b-e826-4c1b-af3c-33a9d590c4b0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (210, '圣罗兰（YSL）纯口红13#（正橘色）3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748210', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 210, 20, 320.00, '副标题', 320.00, 10, 1000.00, '关键字', '备注', '/goods-img/53a4a428-8ca2-4d19-937d-15d18f324237.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (211, '海囤全球 魅可（MAC)磨砂系列 雾面丝绒哑光子弹头口红', 165.00, '3g 316 devoted to chili 泫雅色', 58, 100, '件', '7748211', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 211, 20, 249.00, '副标题', 249.00, 10, 1000.00, '关键字', '备注', '/goods-img/2da55bd1-046f-4ac2-b1b9-56ab00bb9db1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (212, '【情人礼物】香奈儿Chanel 口红/唇膏可可小姐水亮/丝绒系列润唇保湿口红配玫瑰花礼盒 丝绒系列', 298.00, '43#斩男色', 58, 100, '件', '7748212', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 212, 20, 299.00, '副标题', 299.00, 10, 1000.00, '关键字', '备注', '/goods-img/247722ea-c87a-4283-806c-bc9fe57f2253.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (213, '迪奥（Dior）口红礼盒套装（烈艳蓝金唇膏哑光#999 3.5g正红色+香氛小样1ml*3随机+随机礼盒样式）', 379.00, '新蜂精选', 58, 100, '件', '7748213', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 213, 20, 379.00, '副标题', 379.00, 10, 1000.00, '关键字', '备注', '/goods-img/ab1a0ced-954c-4857-92f4-f7c833d9d54a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (214, '圣罗兰（YSL）纯口红52# 3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748214', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 214, 20, 340.00, '副标题', 340.00, 10, 1000.00, '关键字', '备注', '/goods-img/1eefadae-5f62-4abd-b283-077e7b6d9193.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (215, '海囤全球 汤姆福特 TOM', 375.00, 'FORD TF口红 经典黑金唇膏 3g 16 SCARLET ROUGE 复古番茄红', 58, 100, '件', '7748215', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 215, 20, 429.00, '副标题', 429.00, 10, 1000.00, '关键字', '备注', '/goods-img/da12f5cf-2728-446a-a3bd-b78baf7056ff.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (216, '迪奥（Dior）烈艳蓝金口红唇膏 028# 3.5g', 315.00, '珊瑚红 (滋润保湿 持久显色 粉嫩少女 摩洛哥王妃 幸运色)', 58, 100, '件', '7748216', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 216, 20, 400.00, '副标题', 400.00, 10, 1000.00, '关键字', '备注', '/goods-img/7030b9b6-b650-4d9d-9446-e27dab8afa1f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (217, '迪奥（Dior）烈艳蓝金唇膏520# 3.5g 玫瑰红(口红', 315.00, '缎光 滋润保湿 长效持妆 玫红色 斩男色 告白色 粉红色)', 58, 100, '件', '7748217', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 217, 20, 360.00, '副标题', 360.00, 10, 1000.00, '关键字', '备注', '/goods-img/96a91f11-e634-4e28-be13-db8b4732463e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (218, '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 255.00, '3.5g 999号 哑光-经典正红', 58, 100, '件', '7748218', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 218, 20, 410.00, '副标题', 410.00, 10, 1000.00, '关键字', '备注', '/goods-img/fe048831-384d-46b2-beec-5549f7902c11.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (219, '欧莱雅（LOREAL）纷泽滋润唇膏RC301复古魅红3.7g（金管 口红女 滋润显色）', 99.00, '新蜂精选', 58, 100, '件', '7748219', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 219, 20, 135.00, '副标题', 135.00, 10, 1000.00, '关键字', '备注', '/goods-img/b7495e02-fc4c-417a-8101-ccfc75a5a475.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (220, '阿玛尼(Armani) 口红女士唇釉 生日礼物/表白礼物', 285.00, '红管#405番茄红 【李佳琪推荐omg】', 58, 100, '件', '7748220', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 220, 20, 366.00, '副标题', 366.00, 10, 1000.00, '关键字', '备注', '/goods-img/75fdac25-1cfa-4a9b-957d-805ac706f32c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (221, '美宝莲（MAYBELLINE）绝色持久唇膏雾感哑光系列R09PM 3.9g（女皇色口红新老包装）', 106.00, '新蜂精选', 58, 100, '件', '7748221', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 221, 20, 122.00, '副标题', 122.00, 10, 1000.00, '关键字', '备注', '/goods-img/1055e30e-3d98-4dca-8b79-8d0b5a09a37b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (222, '【专柜正品】迪奥999Dior口红唇膏烈艳蓝金 哑光滋润520/888/999送礼礼品套装 烈艳蓝金', 260.00, '844#橘红色赠礼盒礼袋', 58, 100, '件', '7748222', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 222, 20, 339.00, '副标题', 339.00, 10, 1000.00, '关键字', '备注', '/goods-img/7b52a7bc-0ecf-41c4-b079-d162511c9530.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (223, '迪奥（Dior）烈艳蓝金唇膏滋润999# 3.5g 经典正红色', 315.00, '(口红 保湿滋润 气质显白 不挑皮) （新老包装随机）', 58, 100, '件', '7748223', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 223, 20, 500.00, '副标题', 500.00, 10, 1000.00, '关键字', '备注', '/goods-img/bb05b83f-bb91-4300-b78f-23986ba8c0dd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (224, '迪奥（Dior）烈艳蓝金唇膏-哑光999# 3.5g 传奇红（口红', 315.00, '雾面质地 显色持久 显白 正红色 李佳琦推荐）', 58, 100, '件', '7748224', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 224, 20, 400.00, '副标题', 400.00, 10, 1000.00, '关键字', '备注', '/goods-img/67280dcf-bf32-49c1-b99b-9d86bb2ffaac.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (225, '海囤全球 魅可（MAC)经典唇膏 子弹头口红3g', 155.00, 'Chili 秀智色/小辣椒色', 58, 100, '件', '7748225', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 225, 20, 170.00, '副标题', 170.00, 10, 1000.00, '关键字', '备注', '/goods-img/2b678c5d-820c-4174-bc0c-5a65ff9501b6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (226, '卡姿兰（Carslan）轻甜唇爱随心盒1.4g*4(13#暧昧 16#炽烈 18#嫉妒', 89.00, '19#欲望 唇盒 口红 七夕礼物 情人节礼物)', 58, 100, '件', '7748226', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 226, 20, 99.00, '副标题', 99.00, 10, 1000.00, '关键字', '备注', '/goods-img/3f513cd6-bb5f-407d-8550-24550873d83b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (227, '【联名限量版】MANSLY口红套装中国风口红情人节女朋友生日礼物唇釉彩妆女磁扣锦绣红妆口红礼盒彩妆 锦绣红妆口红礼盒（6支）', 295.00, '新蜂精选', 58, 100, '件', '7748227', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 227, 20, 295.00, '副标题', 295.00, 10, 1000.00, '关键字', '备注', '/goods-img/d82ba7f0-6c92-4254-bfb2-71b3f8b1dfda.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (228, '迪奥（Dior）滋润999礼盒套装（烈艳蓝金999#3.5g 经典正红色+香氛小样1ml*3+礼盒）（小样和礼盒款式随机）', 379.00, '新蜂精选', 58, 100, '件', '7748228', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 228, 20, 379.00, '副标题', 379.00, 10, 1000.00, '关键字', '备注', '/goods-img/f6b1195a-3231-4e81-a676-866ee838748f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (229, '圣罗兰（YSL）莹亮纯魅唇膏12#（圆管口红）4.5g 斩男色', 320.00, '新蜂精选', 58, 100, '件', '7748229', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 229, 20, 320.00, '副标题', 320.00, 10, 1000.00, '关键字', '备注', '/goods-img/359bb052-5fea-4390-bbe6-4cb9e1c19273.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (230, '圣罗兰（YSL）纯口红1#（正红色）3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748230', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 230, 20, 350.00, '副标题', 350.00, 10, 1000.00, '关键字', '备注', '/goods-img/a42498e5-d912-447b-9360-0659d2d55c42.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (231, '纪梵希高定香榭天鹅绒唇膏306#', 355.00, '(小羊皮口红 法式红 雾面哑光 持久锁色）新老包装随机发货', 58, 100, '件', '7748231', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 231, 20, 355.00, '副标题', 355.00, 10, 1000.00, '关键字', '备注', '/goods-img/04949c0e-87df-445b-96dd-29e7fc69f734.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (232, '【联名款】MANSLY口红套装红鸾心动口红礼盒中国风开运红情人节女朋友生日礼物唇釉颐和园同款彩妆口红 红鸾心动口红礼盒（6支）', 195.00, '新蜂精选', 58, 100, '件', '7748232', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 232, 20, 195.00, '副标题', 195.00, 10, 1000.00, '关键字', '备注', '/goods-img/a9cd71ad-2db0-4876-9ead-c51233040220.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (233, '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 258.00, '3.5g 999号 正红色', 58, 100, '件', '7748233', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 233, 20, 410.00, '副标题', 410.00, 10, 1000.00, '关键字', '备注', '/goods-img/49d2acf7-55e5-4293-a7da-5929740e1168.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (234, '圣罗兰（YSL）纯口红13#（正橘色）3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748234', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 234, 20, 320.00, '副标题', 320.00, 10, 1000.00, '关键字', '备注', '/goods-img/b0142d40-6adb-4d64-b5b2-6e4a34656990.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (235, 'MAC 雾面丝绒哑光子弹头口红', 165.00, '磨砂系列 3g 316 devoted to chili 泫雅色', 58, 100, '件', '7748235', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 235, 20, 249.00, '副标题', 249.00, 10, 1000.00, '关键字', '备注', '/goods-img/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (236, '【情人礼物】香奈儿Chanel 口红/唇膏可可小姐水亮/丝绒系列润唇保湿口红配玫瑰花礼盒 丝绒系列', 298.00, '43#斩男色', 58, 100, '件', '7748236', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 236, 20, 299.00, '副标题', 299.00, 10, 1000.00, '关键字', '备注', '/goods-img/70219912-838c-487b-8c3c-761b00de80e9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (237, '迪奥（Dior）口红礼盒套装（烈艳蓝金唇膏哑光#999 3.5g正红色+香氛小样1ml*3随机+随机礼盒样式）', 379.00, '新蜂精选', 58, 100, '件', '7748237', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 237, 20, 379.00, '副标题', 379.00, 10, 1000.00, '关键字', '备注', '/goods-img/cbce65ee-28b3-4822-895a-38243ee506e7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (238, '圣罗兰（YSL）纯口红52# 3.8g', 320.00, '新蜂精选', 58, 100, '件', '7748238', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 238, 20, 340.00, '副标题', 340.00, 10, 1000.00, '关键字', '备注', '/goods-img/abff57bf-247b-4881-9589-e1336049c3ba.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (239, '海囤全球 汤姆福特 TOM', 375.00, 'FORD TF口红 经典黑金唇膏 3g 16 SCARLET ROUGE 复古番茄红', 58, 100, '件', '7748239', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 239, 20, 429.00, '副标题', 429.00, 10, 1000.00, '关键字', '备注', '/goods-img/ba0cd1e9-cded-427b-8692-e8e2a0d00e9f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (240, '迪奥（Dior）烈艳蓝金口红唇膏 028# 3.5g', 315.00, '珊瑚红 (滋润保湿 持久显色 粉嫩少女 摩洛哥王妃 幸运色)', 58, 100, '件', '7748240', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 240, 20, 400.00, '副标题', 400.00, 10, 1000.00, '关键字', '备注', '/goods-img/ea87e780-ed4c-447d-bd22-e88e4742721e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (241, '迪奥（Dior）烈艳蓝金唇膏520# 3.5g 玫瑰红(口红', 315.00, '缎光 滋润保湿 长效持妆 玫红色 斩男色 告白色 粉红色)', 58, 100, '件', '7748241', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 241, 20, 360.00, '副标题', 360.00, 10, 1000.00, '关键字', '备注', '/goods-img/dde0b711-58b0-49fb-972c-7a71d6ec30f1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (242, '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 255.00, '3.5g 999号 哑光-经典正红', 58, 100, '件', '7748242', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 242, 20, 410.00, '副标题', 410.00, 10, 1000.00, '关键字', '备注', '/goods-img/79247aeb-2903-47b0-a711-ac94e22ddd54.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (243, '欧莱雅（LOREAL）纷泽滋润唇膏RC301复古魅红3.7g（金管 口红女 滋润显色）', 99.00, '新蜂精选', 58, 100, '件', '7748243', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 243, 20, 135.00, '副标题', 135.00, 10, 1000.00, '关键字', '备注', '/goods-img/3b420562-b449-448d-ae50-e20aab136e1b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (244, '阿玛尼(Armani) 口红女士唇釉 生日礼物/表白礼物', 285.00, '红管#405番茄红 【李佳琪推荐omg】', 58, 100, '件', '7748244', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 244, 20, 366.00, '副标题', 366.00, 10, 1000.00, '关键字', '备注', '/goods-img/db866c68-e526-42cf-a0b5-520254f30b76.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (245, '美宝莲（MAYBELLINE）绝色持久唇膏雾感哑光系列R09PM 3.9g（女皇色口红新老包装）', 106.00, '新蜂精选', 58, 100, '件', '7748245', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 245, 20, 122.00, '副标题', 122.00, 10, 1000.00, '关键字', '备注', '/goods-img/63d0a187-627d-4edb-870e-717969ad2bd0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (246, '【专柜正品】迪奥999Dior口红唇膏烈艳蓝金 哑光滋润520/888/999送礼礼品套装 烈艳蓝金', 260.00, '844#橘红色赠礼盒礼袋', 0, 100, '件', '7748246', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 246, 20, 339.00, '副标题', 339.00, 10, 1000.00, '关键字', '备注', '/goods-img/9822b4a5-9fd2-435b-bdd1-5bbcdc6fdfdf.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (247, 'Apple Macbook Air 13.3 ', 5999.00, 'Core i5 8G 128G SSD 笔记本电脑 轻薄本 银色 MQD32CH/A', 65, 100, '件', '7748247', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 247, 20, 6928.00, '副标题', 6928.00, 10, 1000.00, '关键字', '备注', '/goods-img/2d827a7e-fb30-493d-840a-cb21766814fd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (248, 'Apple 2019款 Macbook Pro 13.3', 10699.00, '【带触控栏】八代i5 8G 256G RP645显卡 银色 苹果笔记本电脑 MUHR2CH/A', 65, 100, '件', '7748248', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 248, 20, 11499.00, '副标题', 11499.00, 10, 1000.00, '关键字', '备注', '/goods-img/465936e0-40ad-4968-b868-4bea20c7beec.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (249, 'Apple MacBook Air 13.3 ', 7168.00, 'Core i5 8G 256G SSD 银色 笔记本电脑 轻薄本 Z0UU00056原MQD42CH/A', 65, 100, '件', '7748249', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 249, 20, 7999.00, '副标题', 7999.00, 10, 1000.00, '关键字', '备注', '/goods-img/a4132109-8f18-4399-affd-a81fad6902c8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (250, 'Apple 2019款 MacBook Air 13.3 ', 9799.00, 'Retina屏 八代i5 8G 256G SSD 银色 笔记本电脑 轻薄本 MVFL2CH/A', 65, 100, '件', '7748250', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 250, 20, 10399.00, '副标题', 10399.00, 10, 1000.00, '关键字', '备注', '/goods-img/65b62668-3be5-48b0-a40c-bd05826a38c2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (251, 'Apple 2019款 MacBook Air 13.3 ', 8499.00, 'Retina屏 八代i5 8G 128G SSD 深空灰 笔记本电脑 轻薄本 MVFH2CH/A', 65, 100, '件', '7748251', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 251, 20, 8899.00, '副标题', 8899.00, 10, 1000.00, '关键字', '备注', '/goods-img/cb899039-a705-473d-9785-f245a6ed4d89.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (252, 'Apple 2019款 MacBook Air 13.3 ', 8499.00, 'Retina屏 八代i5 8G 128G SSD 银色 笔记本电脑 轻薄本 MVFK2CH/A', 65, 100, '件', '7748252', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 252, 20, 8899.00, '副标题', 8899.00, 10, 1000.00, '关键字', '备注', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (253, 'Apple MacBook Air 13.3 ', 6968.00, '| 定制升级 Core i7 8G 128G SSD硬盘 银色 笔记本电脑 轻薄本 Z0UU00022', 65, 100, '件', '7748253', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 253, 20, 8056.00, '副标题', 8056.00, 10, 1000.00, '关键字', '备注', '/goods-img/53019ece-5e61-4de9-8eac-e1f00a4ef7e3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (254, 'Apple 2019款 Macbook Pro 13.3', 10699.00, '【带触控栏】八代i5 8G 256G RP645显卡 深空灰 苹果笔记本电脑 MUHP2CH/A', 65, 100, '件', '7748254', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 254, 20, 11499.00, '副标题', 11499.00, 10, 1000.00, '关键字', '备注', '/goods-img/f08404a7-0459-4289-aa60-dd1735c95bbe.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (255, '苹果（Apple） MacBook Air', 5488.00, '苹果笔记本电脑 13.3英寸轻薄本 购买套餐更实惠 2017款/i5/8GB/128GB/D32', 65, 100, '件', '7748255', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 255, 20, 6200.00, '副标题', 6200.00, 10, 1000.00, '关键字', '备注', '/goods-img/83740c28-473c-4954-b0dc-3cadab5a87d1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (256, 'Apple 2019款 MacBook Air 13.3 ', 9799.00, 'Retina屏 八代i5 8G 256G SSD 深空灰 笔记本电脑 轻薄本 MVFJ2CH/A', 65, 100, '件', '7748256', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 256, 20, 10399.00, '副标题', 10399.00, 10, 1000.00, '关键字', '备注', '/goods-img/78957148-4c0c-4194-bc46-7360d7b1aa65.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (257, 'Apple 2019新品 Macbook Pro 13.3', 12999.00, '【带触控栏】八代i5 8G 256G 深空灰 笔记本电脑 轻薄本 MV962CH/A', 65, 100, '件', '7748257', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 257, 20, 13899.00, '副标题', 13899.00, 10, 1000.00, '关键字', '备注', '/goods-img/85787c16-8443-4db0-9cae-a811a20a0832.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (258, 'Apple 2019款 MacBook Air 13.3 ', 9799.00, 'Retina屏 八代i5 8G 256G SSD 金色 苹果笔记本电脑 轻薄本 MVFN2CH/A', 65, 100, '件', '7748258', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 258, 20, 10399.00, '副标题', 10399.00, 10, 1000.00, '关键字', '备注', '/goods-img/82bdafc6-5828-495e-b77c-21598938b896.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (259, 'APPLE 苹果2018年19新款MacBook air笔记本电脑13.3英寸超薄笔记本', 7888.00, '金色 i5/8GB内存/128GB闪存【19新款】', 65, 100, '件', '7748259', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 259, 20, 8899.00, '副标题', 8899.00, 10, 1000.00, '关键字', '备注', '/goods-img/270cdf75-8a7f-410e-8f2f-8eeba24f0503.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (260, 'Apple 2019新品 Macbook Pro 15.4', 17099.00, '【带触控栏】全新九代六核i7 16G 256G 深空灰 笔记本电脑轻薄本MV902CH/A', 65, 100, '件', '7748260', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 260, 20, 18199.00, '副标题', 18199.00, 10, 1000.00, '关键字', '备注', '/goods-img/7928eb46-9e1c-420e-a8ab-6c358d01891b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (261, 'APPLE 苹果MacBook air苹果笔记本电脑13.3英寸超薄笔记本', 5988.00, '标配+防水手提包+苹果原装鼠标版（下单送大礼包） i5+8GB内存+128GB闪存【D32】', 65, 100, '件', '7748261', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 261, 20, 6988.00, '副标题', 6988.00, 10, 1000.00, '关键字', '备注', '/goods-img/11968b35-9431-4b1c-a648-6ff46945ebf4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (262, 'APPLE苹果 MacBook Air13.3英寸轻薄笔记本电脑2017款', 5488.00, '官方标配【购套餐版送大礼包】 i5+8GB内存+128GB闪存【D32】', 65, 100, '件', '7748262', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 262, 20, 6188.00, '副标题', 6188.00, 10, 1000.00, '关键字', '备注', '/goods-img/fb08ec83-2960-47f7-8679-8b78896c30d5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (263, 'Apple 2019款 MacBook Air 13.3 ', 8499.00, 'Retina屏 八代i5 8G 128G SSD 金色 笔记本电脑 轻薄本 MVFM2CH/A', 65, 100, '件', '7748263', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 263, 20, 8899.00, '副标题', 8899.00, 10, 1000.00, '关键字', '备注', '/goods-img/50748763-c0d6-4e73-80e5-864818fa3246.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (264, 'Apple 2019款 Macbook Pro 13.3', 9499.00, '【带触控栏】八代i5 8G 128G RP645显卡 深空灰 苹果笔记本电脑 MUHN2CH/A', 65, 100, '件', '7748264', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 264, 20, 9999.00, '副标题', 9999.00, 10, 1000.00, '关键字', '备注', '/goods-img/fe9e33a1-fbd0-4278-931f-825fef4ffb62.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (265, 'Apple MacBook Air 13.3 ', 8499.00, '定制升级 Core i7 8G 256G SSD硬盘 银色 笔记本电脑 轻薄本 Z0UU0004J', 65, 100, '件', '7748265', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 265, 20, 9656.00, '副标题', 9656.00, 10, 1000.00, '关键字', '备注', '/goods-img/0340d6b2-54bf-42a2-96f4-f35c5f47bb2d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (266, 'Apple 2019新品 Macbook Pro 15.4', 20399.00, '【带触控栏】九代八核i9 16G 512G 深空灰 笔记本电脑 轻薄本 MV912CH/A', 65, 100, '件', '7748266', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 266, 20, 21399.00, '副标题', 21399.00, 10, 1000.00, '关键字', '备注', '/goods-img/33a29216-08d6-445b-b979-12d5de81d634.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (267, 'Apple 2019新品 Macbook Pro 13.3', 12999.00, '【带触控栏】八代i5 8G 256G 银色 笔记本电脑 轻薄本 MV992CH/A', 65, 100, '件', '7748267', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 267, 20, 13899.00, '副标题', 13899.00, 10, 1000.00, '关键字', '备注', '/goods-img/a2afdb6c-69a7-4081-bd09-62174f9f5624.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (268, 'Apple Macbook Pro 13.3', 13068.00, '【带触控栏】Core i5 8G 512G SSD 银色 笔记本电脑 轻薄本 MR9V2CH/A', 0, 100, '件', '7748268', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 268, 20, 14999.00, '副标题', 14999.00, 10, 1000.00, '关键字', '备注', '/goods-img/4da4fa5d-ee2d-4496-9950-e53b102f0e8e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (269, 'Apple 2019新品 Macbook Pro 15.4', 17099.00, '【带触控栏】全新九代六核i7 16G 256G 银色 笔记本电脑 轻薄本 MV922CH/A', 0, 100, '件', '7748269', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 269, 20, 18199.00, '副标题', 18199.00, 10, 1000.00, '关键字', '备注', '/goods-img/49c9f6f8-11c2-4f57-98b9-daf12715b938.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (270, 'Apple 2019新品 Macbook Pro 13.3', 14499.00, '【带触控栏】八代i5 8G 512G 银色 笔记本电脑 轻薄本 MV9A2CH/A', 0, 100, '件', '7748270', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 270, 20, 15499.00, '副标题', 15499.00, 10, 1000.00, '关键字', '备注', '/goods-img/9dd28614-7a17-4876-8cdd-232caf4154bc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (271, 'Apple 2019新品 Macbook Pro 15.4', 20399.00, '【带触控栏】九代八核i9 16G 512G 银色 笔记本电脑 轻薄本 MV932CH/A', 0, 100, '件', '7748271', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 271, 20, 21399.00, '副标题', 21399.00, 10, 1000.00, '关键字', '备注', '/goods-img/2dcd61b8-f434-40ee-928f-c6e4ae934db8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (272, '【新品首发】苹果Apple MacBook Pro13.3英寸2019新款18/17苹果笔记本电脑', 10488.00, '19款灰色/256G/带bar/MUHP2CH/A', 0, 100, '件', '7748272', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 272, 20, 12580.00, '副标题', 12580.00, 10, 1000.00, '关键字', '备注', '/goods-img/4dbbfbf1-80c0-4389-a02e-ca19fbeb5340.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (273, '【新品首发】苹果Apple MacBook Pro13.3英寸2019新款18/17苹果笔记本电脑', 9088.00, '19款灰色/128G/带bar/MUHN2CH/A', 0, 100, '件', '7748273', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 273, 20, 10100.00, '副标题', 10100.00, 10, 1000.00, '关键字', '备注', '/goods-img/3b095a66-4001-4c69-9026-2e09139b5f11.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (274, 'Apple 2019新品 Macbook Pro 13.3', 14499.00, '【带触控栏】八代i5 8G 512G 深空灰 苹果笔记本电脑 轻薄本 MV972CH/A', 0, 100, '件', '7748274', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 274, 20, 15499.00, '副标题', 15499.00, 10, 1000.00, '关键字', '备注', '/goods-img/82fb6b31-1afe-4bcb-a243-5205ed32d3ee.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (275, 'Apple Macbook Pro 13.3', 10199.00, '【无触控栏】Core i5 8G 256G SSD 银色 笔记本电脑 轻薄本 MPXU2CH/A', 0, 100, '件', '7748275', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 275, 20, 11299.00, '副标题', 11299.00, 10, 1000.00, '关键字', '备注', '/goods-img/73a8c7e9-40af-4e0a-9826-5f6374361e61.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (276, 'Apple iPhone 11 (A2223)', 5499.00, '64GB 黑色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748276', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 276, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/4755f3e5-257c-424c-a5f4-63908061d6d9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (277, 'Apple iPhone 11 (A2223)', 5999.00, '128GB 白色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748277', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 277, 20, 5999.00, '副标题', 5999.00, 10, 1000.00, '关键字', '备注', '/goods-img/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (278, 'Apple iPhone 11 (A2223)', 5999.00, '128GB 紫色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748278', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 278, 20, 5999.00, '副标题', 5999.00, 10, 1000.00, '关键字', '备注', '/goods-img/8dfe8ea9-2279-4132-a72b-4f8a52d002a4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (279, 'Apple iPhone 11 (A2223)', 5499.00, '64GB 红色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748279', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 279, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/7368f461-fd0a-4f37-bc8b-31d8ad3d6e95.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (280, 'Apple iPhone 11 (A2223)', 5499.00, '64GB 黄色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748280', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 280, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/cea55d85-b11e-4639-88ab-9403b05ce1e8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (281, 'Apple iPhone 11 (A2223)', 6799.00, '256GB 绿色 移动联通电信4G手机 双卡双待', 62, 100, '件', '7748281', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 281, 20, 6799.00, '副标题', 6799.00, 10, 1000.00, '关键字', '备注', '/goods-img/075a188a-9045-45f0-9c67-1e42e0552aa2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (282, 'Apple iPhone XR (A2108)', 5099.00, '128GB 黑色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748282', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 282, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/23ac3107-6309-40c8-bd28-164eb1186b62.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (283, 'Apple iPhone XR (A2108)', 5099.00, '128GB 白色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748283', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 283, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/3f47c376-c603-43fc-bfe5-2daa985ff423.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (284, 'Apple iPhone XR (A2108)', 5099.00, '128GB 红色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748284', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 284, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/56cef3d7-41e6-4aad-825d-a3d423e74dfd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (285, 'Apple iPhone XR (A2108)', 5199.00, '128GB 珊瑚色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748285', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 285, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/c2e3b2e4-1fc8-43f3-b133-6f4eae7faa5d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (286, 'Apple iPhone XR (A2108)', 5199.00, '128GB 蓝色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748286', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 286, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/2f5079e9-57f3-490a-8d3d-5fd64207939d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (287, 'Apple iPhone XR (A2108)', 5199.00, '128GB 黄色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748287', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 287, 20, 5599.00, '副标题', 5599.00, 10, 1000.00, '关键字', '备注', '/goods-img/b1259d73-7c5a-4eca-81eb-53a4e9bcc77e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (288, 'Apple iPhone 11 Pro', 9599.00, 'Max (A2220) 64GB 暗夜绿色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748288', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 288, 20, 9599.00, '副标题', 9599.00, 10, 1000.00, '关键字', '备注', '/goods-img/0656b280-66d9-430b-9d0d-e48bf379d89a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (289, 'Apple iPhone 11 Pro', 10899.00, 'Max (A2220) 256GB 深空灰色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748289', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 289, 20, 10899.00, '副标题', 10899.00, 10, 1000.00, '关键字', '备注', '/goods-img/77ce1f09-3900-4eff-8d97-e67fa8193a84.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (290, 'Apple iPhone 11 Pro', 9599.00, 'Max (A2220) 64GB 金色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748290', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 290, 20, 9599.00, '副标题', 9599.00, 10, 1000.00, '关键字', '备注', '/goods-img/e45be404-d582-4c1e-80e8-48073327551e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (291, 'Apple iPhone 11 Pro', 12699.00, 'Max (A2220) 512GB 银色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748291', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 291, 20, 12699.00, '副标题', 12699.00, 10, 1000.00, '关键字', '备注', '/goods-img/76670f49-4556-40ae-b485-3b25dcdcb636.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (292, 'Apple iPhone 7 (A1660)', 2949.00, '128G 黑色 移动联通电信4G手机', 0, 100, '件', '7748292', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 292, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/101abd40-e9a2-4ab0-9f4e-16569c9dbf82.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (293, 'Apple iPhone 7 (A1660)', 2929.00, '128G 玫瑰金色 移动联通电信4G手机', 0, 100, '件', '7748293', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 293, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/6229468b-bcb7-4415-880a-aea3eef4eea2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (294, 'Apple iPhone 7 (A1660)', 2929.00, '128G 金色 移动联通电信4G手机', 0, 100, '件', '7748294', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 294, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/1f5bb955-fbe7-451a-b12c-3e2115c53020.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (295, 'Apple iPhone 7 (A1660)', 2929.00, '128G 银色 移动联通电信4G手机', 0, 100, '件', '7748295', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 295, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/9fc3c48f-c8e2-426b-915a-c32b0e72998d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (296, 'Apple iPhone XS Max', 8999.00, '(A2104) 256GB 深空灰色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748296', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 296, 20, 9599.00, '副标题', 9599.00, 10, 1000.00, '关键字', '备注', '/goods-img/ec4af4a5-0a53-4246-bd88-919b0541a55c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (297, 'Apple iPhone XS Max', 8999.00, '(A2104) 256GB 金色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748297', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 297, 20, 9599.00, '副标题', 9599.00, 10, 1000.00, '关键字', '备注', '/goods-img/b7d2373a-5a8c-4be5-a4ce-57b408c6d9f2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (298, 'Apple iPhone XS Max', 8999.00, '(A2104) 256GB 银色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748298', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 298, 20, 9599.00, '副标题', 9599.00, 10, 1000.00, '关键字', '备注', '/goods-img/837aaf40-5797-4929-b162-a248bfe73b36.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (299, 'Apple iPhone 8 (A1863)', 3499.00, '64GB 深空灰色 移动联通电信4G手机', 0, 100, '件', '7748299', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 299, 20, 3699.00, '副标题', 3699.00, 10, 1000.00, '关键字', '备注', '/goods-img/8ab049d8-5b2e-4b69-bef0-013bec414598.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (300, 'Apple iPhone 8 (A1863)', 3499.00, '64GB 银色 移动联通电信4G手机', 0, 100, '件', '7748300', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 300, 20, 3699.00, '副标题', 3699.00, 10, 1000.00, '关键字', '备注', '/goods-img/eaeb6faf-2ead-4f5d-84d2-1629686a492c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (301, 'Apple iPhone 8 (A1863)', 3499.00, '64GB 金色 移动联通电信4G手机', 0, 100, '件', '7748301', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 301, 20, 3699.00, '副标题', 3699.00, 10, 1000.00, '关键字', '备注', '/goods-img/0611528c-73c8-4114-a1d8-d9387e771284.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (302, 'Apple iPhone 7 Plus', 3699.00, '(A1661) 128G 黑色 移动联通电信4G手机', 0, 100, '件', '7748302', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 302, 20, 4199.00, '副标题', 4199.00, 10, 1000.00, '关键字', '备注', '/goods-img/dbafc182-23b7-442c-b9cb-0ea825a659a9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (303, 'Apple iPhone 7 Plus', 3699.00, '(A1661) 128G 玫瑰金色 移动联通电信4G手机', 0, 100, '件', '7748303', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 303, 20, 4199.00, '副标题', 4199.00, 10, 1000.00, '关键字', '备注', '/goods-img/c227df08-9a26-430a-88a5-72c1e4da5b6e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (304, 'Apple iPhone 7 Plus', 3699.00, '(A1661) 128G 金色 移动联通电信4G手机', 0, 100, '件', '7748304', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 304, 20, 4199.00, '副标题', 4199.00, 10, 1000.00, '关键字', '备注', '/goods-img/bf58f29f-75ed-411e-8255-3b9f802634f2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (305, 'Apple iPhone 7 Plus', 3699.00, '(A1661) 128G 银色 移动联通电信4G手机', 0, 100, '件', '7748305', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 305, 20, 4199.00, '副标题', 4199.00, 10, 1000.00, '关键字', '备注', '/goods-img/dfab7fee-e787-423d-9771-67e05b03b358.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (306, 'Apple iPhone XS (A2099)', 6299.00, '64GB 金色 移动联通4G手机', 0, 100, '件', '7748306', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 306, 20, 7299.00, '副标题', 7299.00, 10, 1000.00, '关键字', '备注', '/goods-img/b3ff5475-9519-4d94-8f07-5840bb796e60.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (307, 'Apple iPhone XS (A2099)', 6299.00, '64GB 深空灰色 移动联通4G手机', 0, 100, '件', '7748307', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 307, 20, 7299.00, '副标题', 7299.00, 10, 1000.00, '关键字', '备注', '/goods-img/7cc8d012-cfaa-45c4-ba35-70ca46c8bd66.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (308, 'Apple iPhone XS (A2099)', 7699.00, '256GB 银色 移动联通4G手机', 0, 100, '件', '7748308', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 308, 20, 10099.00, '副标题', 10099.00, 10, 1000.00, '关键字', '备注', '/goods-img/776b459b-e981-434f-bbf7-635cafab7418.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (309, 'Apple iPhone 8 Plus', 3999.00, '(A1899) 64GB 深空灰色 移动联通4G手机', 0, 100, '件', '7748309', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 309, 20, 4599.00, '副标题', 4599.00, 10, 1000.00, '关键字', '备注', '/goods-img/8eb2e38b-84e1-4f31-9dae-841800f68038.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (310, 'Apple iPhone 8 Plus', 4399.00, '(A1864) 64GB 金色 移动联通电信4G手机', 0, 100, '件', '7748310', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 310, 20, 4799.00, '副标题', 4799.00, 10, 1000.00, '关键字', '备注', '/goods-img/58c6a2c3-d3f7-4b0a-b4ae-e649b1032087.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (311, 'Apple iPhone 8 Plus', 4399.00, '(A1864) 64GB 银色 移动联通电信4G手机', 0, 100, '件', '7748311', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 311, 20, 4799.00, '副标题', 4799.00, 10, 1000.00, '关键字', '备注', '/goods-img/2839c451-3eaf-4820-8a15-1858ce339407.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (312, 'Apple 苹果 iPhone xr', 4598.00, '手机 双卡双待 黑色 全网通64G', 0, 100, '件', '7748312', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 312, 20, 6199.00, '副标题', 6199.00, 10, 1000.00, '关键字', '备注', '/goods-img/35bbe123-c822-457c-aaf0-fdcd861bc06d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (313, 'Apple 苹果 iPhone xr', 4658.00, '手机 双卡双待 白色 全网通64G', 0, 100, '件', '7748313', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 313, 20, 6199.00, '副标题', 6199.00, 10, 1000.00, '关键字', '备注', '/goods-img/0e565b23-554e-45d3-ac62-a2fb25be7f2c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (314, 'Apple 苹果 iPhone xr', 4698.00, '手机 双卡双待 蓝色 全网通64G', 0, 100, '件', '7748314', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 314, 20, 6199.00, '副标题', 6199.00, 10, 1000.00, '关键字', '备注', '/goods-img/c08b6ddc-735f-4d2c-b47f-1f0e7f62a9b1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (315, 'Apple 苹果 iPhone xr', 4698.00, '手机 双卡双待 黄色 全网通64G', 0, 100, '件', '7748315', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 315, 20, 6199.00, '副标题', 6199.00, 10, 1000.00, '关键字', '备注', '/goods-img/c09636de-93b1-444e-b00e-668506676443.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (316, 'Apple 苹果 iPhone xr', 5038.00, '手机 双卡双待 红色 全网通128G', 0, 100, '件', '7748316', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 316, 20, 6699.00, '副标题', 6699.00, 10, 1000.00, '关键字', '备注', '/goods-img/b26d8460-7ab5-4006-ba5c-e212ee0f31bd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (317, 'Apple 苹果 iPhone xr', 4698.00, '手机 双卡双待 珊瑚色 全网通64G', 0, 100, '件', '7748317', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 317, 20, 6199.00, '副标题', 6199.00, 10, 1000.00, '关键字', '备注', '/goods-img/fab7cf40-9b7d-4141-8227-9ce7e02e8330.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (318, 'Apple iPhone 11 Pro', 9999.00, '(A2217) 256GB 暗夜绿色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748318', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 318, 20, 9999.00, '副标题', 9999.00, 10, 1000.00, '关键字', '备注', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (319, 'Apple iPhone 11 Pro', 8699.00, '(A2217) 64GB 深空灰色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748319', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 319, 20, 8699.00, '副标题', 8699.00, 10, 1000.00, '关键字', '备注', '/goods-img/d0abbd2a-19ca-4ae7-9b3c-1eb4eb77c565.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (320, 'Apple iPhone 11 Pro', 8699.00, '(A2217) 64GB 银色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748320', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 320, 20, 8699.00, '副标题', 8699.00, 10, 1000.00, '关键字', '备注', '/goods-img/7d192eff-938f-4e6d-8952-9d405707033e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (321, '【换修无忧年付版】Apple iPhone 11 Pro', 12598.00, '(A2217) 512GB 金色 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748321', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 321, 20, 12598.00, '副标题', 12598.00, 10, 1000.00, '关键字', '备注', '/goods-img/38b3f3a9-7056-45a3-b183-ad46dc71f493.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (322, 'Apple 苹果 iPhone 6s', 2918.00, 'Plus 4G手机 金色 全网通 128G', 0, 100, '件', '7748322', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 322, 20, 3599.00, '副标题', 3599.00, 10, 1000.00, '关键字', '备注', '/goods-img/22febff2-db52-4f7a-8d16-414e755e788b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (323, 'Apple 苹果 iPhone 6s', 2918.00, 'Plus 4G手机 玫瑰金 全网通 128G', 0, 100, '件', '7748323', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 323, 20, 3599.00, '副标题', 3599.00, 10, 1000.00, '关键字', '备注', '/goods-img/dfb0d434-4d59-4fda-896a-1ebd9e4d9ece.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (324, 'Apple 苹果 iPhone 6s', 2888.00, 'Plus 4G手机 深空灰 全网通 128G', 0, 100, '件', '7748324', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 324, 20, 3599.00, '副标题', 3599.00, 10, 1000.00, '关键字', '备注', '/goods-img/d3a4b902-8010-4619-89e4-96cb88e6d4e4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (325, 'Apple 苹果 iPhone 6s', 2988.00, 'Plus 4G手机 银色 全网通 128G', 0, 100, '件', '7748325', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 325, 20, 3599.00, '副标题', 3599.00, 10, 1000.00, '关键字', '备注', '/goods-img/b4b7e7d3-b7ba-4917-a1f9-70c52f28df9d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (326, '【二手9成新】Apple iPhone XSmax 苹果XSmax', 6088.00, '国行二手手机 XS Max 深空灰 64G', 61, 100, '件', '7748326', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 326, 20, 7766.00, '副标题', 7766.00, 10, 1000.00, '关键字', '备注', '/goods-img/0514e529-6b3e-40d5-9183-84088ddb55e1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (327, '【二手9成新】Apple iPhone XSmax 苹果XSmax', 6088.00, '国行二手手机 XS Max 金色 64G', 61, 100, '件', '7748327', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 327, 20, 14999.00, '副标题', 14999.00, 10, 1000.00, '关键字', '备注', '/goods-img/a0dfd1ad-61ed-43ee-add4-74bdfea1d6c1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (328, '【二手9成新】Apple iPhone XSmax 苹果XSmax', 6938.00, '国行二手手机 XS Max 银色 256G', 61, 100, '件', '7748328', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 328, 20, 14999.00, '副标题', 14999.00, 10, 1000.00, '关键字', '备注', '/goods-img/87b66719-fc17-4c97-a954-de8a78b42a09.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (329, '【二手9成新】Apple iPhone 6s Plus', 1468.00, '苹果6sPlus 二手手机（送一年碎屏险） 玫瑰金色 64G 全网通', 61, 100, '件', '7748329', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 329, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/5b132b57-24e4-4d65-9cb8-3299dc0e9ed6.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (330, '【二手9成新】Apple iPhone 6s Plus', 1499.00, '苹果6sPlus 二手手机（送一年碎屏险） 金色 64G 全网通', 61, 100, '件', '7748330', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 330, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/f289ec14-e0e2-481e-a703-39eec00a1b15.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (331, '【二手9成新】Apple iPhone 6s Plus', 1599.00, '苹果6sPlus 二手手机（送一年碎屏险） 银色 64G 全网通', 61, 100, '件', '7748331', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 331, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/084208d0-4dc2-4f1a-aff4-4114616dfae1.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (332, '【二手9成新】Apple iPhone 6s Plus', 1638.00, '苹果6sPlus 二手手机（送一年碎屏险） 深空灰色 64G 全网通', 61, 100, '件', '7748332', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 332, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/8a598420-0052-4551-b00a-b288b6c22a48.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (333, 'Apple 苹果 iPhone xr', 4699.00, '手机 双卡双待 白色 全网通 64G', 0, 100, '件', '7748333', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 333, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/6110a187-511f-45d0-8b59-ea2a75546a45.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (334, 'Apple 苹果 iPhone xr', 5079.00, '手机 双卡双待 黑色 全网通 128G', 0, 100, '件', '7748334', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 334, 20, 5699.00, '副标题', 5699.00, 10, 1000.00, '关键字', '备注', '/goods-img/41b10e86-857c-435c-b86d-d822e35450ab.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (335, 'Apple 苹果 iPhone xr', 4699.00, '手机 双卡双待 蓝色 全网通 64G', 0, 100, '件', '7748335', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 335, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/d38bcaab-7a0a-4f86-ad75-60ac74a308e6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (336, 'Apple 苹果 iPhone xr', 5079.00, '手机 双卡双待 黄色 全网通 128G', 0, 100, '件', '7748336', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 336, 20, 5699.00, '副标题', 5699.00, 10, 1000.00, '关键字', '备注', '/goods-img/73fc7cb9-5b43-4bce-a2b3-a82516773de0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (337, 'Apple 苹果 iPhone xr', 4699.00, '手机 双卡双待 珊瑚色 全网通 64G', 0, 100, '件', '7748337', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 337, 20, 5499.00, '副标题', 5499.00, 10, 1000.00, '关键字', '备注', '/goods-img/00e53d76-db08-4ae2-864f-ca1cd7c8c32b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (338, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 6088.00, '国行 二手手机 XS max金色 64G 全网通', 61, 100, '件', '7748338', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 338, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/5b9acfd4-7808-4b3b-bf5c-4b367667418c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (339, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 5299.00, '国行 二手手机 XS 金色 64G 全网通', 61, 100, '件', '7748339', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 339, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/cd2b481d-a4a2-4bc0-a4e1-784a28c37ef9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (340, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 6938.00, '国行 二手手机 XS max灰色 256G 全网通', 61, 100, '件', '7748340', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 340, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/1d866674-4e57-483a-955f-5fd1a4f5d921.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (341, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 6088.00, '国行 二手手机 XS max银色 64G 全网通', 61, 100, '件', '7748341', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 341, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/3f3e086e-e4be-464f-9c20-760430cab2df.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (342, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 5299.00, '国行 二手手机 XS 灰色 64G 全网通', 61, 100, '件', '7748342', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 342, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/4a4a0820-aad5-47d4-a926-f040fd090c96.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (343, '【二手95新】Apple iPhonex XSmax苹果x xsmax', 5299.00, '国行 二手手机 XS 银色 64G 全网通', 61, 100, '件', '7748343', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 343, 20, 12999.00, '副标题', 12999.00, 10, 1000.00, '关键字', '备注', '/goods-img/a6b87d83-5ba7-4683-be17-43ab9aa043e3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (344, '【二手9成新】Apple iPhone X 苹果X', 3989.00, '二手手机 深空灰色 64G 全网通', 61, 100, '件', '7748344', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 344, 20, 3989.00, '副标题', 3989.00, 10, 1000.00, '关键字', '备注', '/goods-img/3cd13e20-2a00-4049-8768-0ba662df7e40.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (345, '【二手9成新】Apple iPhone X 苹果X', 4008.00, '二手手机 银色 64G 全网通', 61, 100, '件', '7748345', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 345, 20, 4008.00, '副标题', 4008.00, 10, 1000.00, '关键字', '备注', '/goods-img/fc3db752-e0dc-4ae7-bac3-fd60ab8a1e17.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (346, '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 2399.00, '二手手机 磨砂黑 128G 全网通', 61, 100, '件', '7748346', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 346, 20, 2899.00, '副标题', 2899.00, 10, 1000.00, '关键字', '备注', '/goods-img/24b442e2-1bdd-4350-bbab-4e4d3d3445f1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (347, '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 2399.00, '二手手机 亮黑色 128G 全网通', 61, 100, '件', '7748347', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 347, 20, 2899.00, '副标题', 2899.00, 10, 1000.00, '关键字', '备注', '/goods-img/7601e13f-de8e-449c-84be-65fbc7280cfc.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (348, '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 2399.00, '二手手机 玫瑰金 128G 全网通', 61, 100, '件', '7748348', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 348, 20, 2666.00, '副标题', 2666.00, 10, 1000.00, '关键字', '备注', '/goods-img/771bc653-485b-4c5d-bca3-c84d3e90020d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (349, '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 2399.00, '二手手机 金色 128G 全网通', 61, 100, '件', '7748349', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 349, 20, 2739.00, '副标题', 2739.00, 10, 1000.00, '关键字', '备注', '/goods-img/5a170339-acb4-4890-bd08-bb109864e853.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (350, '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 2466.00, '二手手机 银色 128G 全网通', 61, 100, '件', '7748350', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 350, 20, 2699.00, '副标题', 2699.00, 10, 1000.00, '关键字', '备注', '/goods-img/a419ebb4-18a5-4295-9404-0593dd215ad0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (351, '【二手9成新】Apple iPhone X 苹果X', 3956.00, '二手手机 全网通 深空灰 64G', 61, 100, '件', '7748351', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 351, 20, 5188.00, '副标题', 5188.00, 10, 1000.00, '关键字', '备注', '/goods-img/4f666eee-c2c7-459c-934e-b32714d1e1c4.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (352, '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 3199.00, '苹果8P 二手手机 深空灰 64G 全网通', 61, 100, '件', '7748352', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 352, 20, 3888.00, '副标题', 3888.00, 10, 1000.00, '关键字', '备注', '/goods-img/ada8e547-dca3-47fc-8aab-35884575090a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (353, '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 3199.00, '苹果8P 二手手机 金色 64G 全网通', 61, 100, '件', '7748353', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 353, 20, 3550.00, '副标题', 3550.00, 10, 1000.00, '关键字', '备注', '/goods-img/76a2e417-2f15-412f-ab73-3a5eb2a7d2d1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (354, '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 3238.00, '苹果8P 二手手机 银色 64G 全网通', 61, 100, '件', '7748354', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 354, 20, 3499.00, '副标题', 3499.00, 10, 1000.00, '关键字', '备注', '/goods-img/5bfb8955-0b1c-4652-b162-a9b91b71211a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (355, '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 3299.00, '苹果8P 二手手机 中国红 64G 全网通', 61, 100, '件', '7748355', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 355, 20, 3438.00, '副标题', 3438.00, 10, 1000.00, '关键字', '备注', '/goods-img/d31193ee-04c1-4bac-8a91-1a4690a396be.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (356, '【二手9成新】Apple iPhoneX 苹果X 二手苹果x手机', 3989.00, '深空灰 64G全网通', 61, 100, '件', '7748356', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 356, 20, 4799.00, '副标题', 4799.00, 10, 1000.00, '关键字', '备注', '/goods-img/b9264842-cd50-4d6f-a4a5-e8cc9dd483a4.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (357, '【二手9成新】Apple iPhoneX 苹果X 二手苹果x手机', 4016.00, '银色 64G全网通', 61, 100, '件', '7748357', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 357, 20, 4799.00, '副标题', 4799.00, 10, 1000.00, '关键字', '备注', '/goods-img/58e9a125-61c1-416b-b17f-99cda431a202.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (358, '【二手95新】Apple iPhone XS 苹果xs', 5299.00, '国行全网通二手手机 银色 全网通 64G', 61, 100, '件', '7748358', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 358, 20, 9999.00, '副标题', 9999.00, 10, 1000.00, '关键字', '备注', '/goods-img/5a732ada-1fdb-48f1-b106-666159565a94.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (359, '【二手95新】Apple iPhone XS 苹果xs', 6008.00, '国行全网通二手手机 金色 全网通 256G', 61, 100, '件', '7748359', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 359, 20, 9999.00, '副标题', 9999.00, 10, 1000.00, '关键字', '备注', '/goods-img/f9e9b321-4b25-40c5-af6d-d9f3fe74a053.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (360, '【二手9成新】Apple iPhone X 苹果x', 4639.00, '二手手机 X 银色 256G 全网通', 61, 100, '件', '7748360', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 360, 20, 5058.00, '副标题', 5058.00, 10, 1000.00, '关键字', '备注', '/goods-img/8da60128-fcc7-46ed-98b6-0066c69624c0.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (361, '【二手9成新】Apple iPhone X 苹果x', 3999.00, '国行全网通二手手机 X 灰色 64G 全网通', 61, 100, '件', '7748361', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 361, 20, 6999.00, '副标题', 6999.00, 10, 1000.00, '关键字', '备注', '/goods-img/8aca87a3-65dd-4c42-91c7-bbbd10fcf7a6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (362, '【二手9成新】Apple iPhone X 苹果x', 4078.00, '国行全网通二手手机 X 银色 64G 全网通', 61, 100, '件', '7748362', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 362, 20, 6999.00, '副标题', 6999.00, 10, 1000.00, '关键字', '备注', '/goods-img/fdec1b37-9a2f-46ea-af03-5091d83e546a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (363, '【二手9成新】Apple iPhone XR 苹果xr', 4299.00, '二手手机双卡双待 白色 128G 全网通', 61, 100, '件', '7748363', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 363, 20, 5888.00, '副标题', 5888.00, 10, 1000.00, '关键字', '备注', '/goods-img/9834bb8d-fe1c-4218-a624-4a25aecb0676.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (364, '【二手9成新】Apple iPhone XR 苹果xr', 4399.00, '二手手机双卡双待 蓝色 128G 全网通', 61, 100, '件', '7748364', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 364, 20, 5888.00, '副标题', 5888.00, 10, 1000.00, '关键字', '备注', '/goods-img/3993feaa-0365-4d7e-9cc5-dcf583243ca3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (365, '【二手9成新】Apple iPhone XR 苹果xr', 4055.00, '二手手机双卡双待 黑色 64G 全网通', 61, 100, '件', '7748365', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 365, 20, 5888.00, '副标题', 5888.00, 10, 1000.00, '关键字', '备注', '/goods-img/ba9cf789-60a8-48db-8329-97c3fc13a061.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (366, '荣耀Play3 6.39英寸魅眼全视屏 4000mAh大电池 真4800万AI三摄', 999.00, '麒麟710F自研芯片 全网通4GB+64GB 幻夜黑', 0, 100, '件', '7748366', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 366, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/9aa34959-cd60-418f-b42e-aa7243b6869c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (367, '华为 HUAWEI 畅享10 Plus', 1499.00, '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 4GB+128GB幻夜黑全网通双4G手机', 0, 100, '件', '7748367', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 367, 20, 1499.00, '副标题', 1499.00, 10, 1000.00, '关键字', '备注', '/goods-img/2613a582-460c-4c2b-bbc0-6c7dbf501bd2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (368, '华为 HUAWEI 畅享10 Plus', 1499.00, '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 4GB+128GB翡冷翠全网通双4G手机', 0, 100, '件', '7748368', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 368, 20, 1499.00, '副标题', 1499.00, 10, 1000.00, '关键字', '备注', '/goods-img/21b0751b-f6ae-4a57-8fb8-61e007395c43.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (369, '华为 HUAWEI 畅享10 Plus', 1799.00, '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 6GB+128GB天空之境全网通双4G手机', 0, 100, '件', '7748369', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 369, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/3f68538f-3b56-4e98-9676-99139857428c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (370, '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 999.00, '渐变蓝 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748370', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 370, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/f8ab28c3-8e04-49a0-ba05-2e6a3ae7211f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (371, '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 999.00, '幻夜黑 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748371', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 371, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/de654f42-d58d-4336-8edd-da01c3523449.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (372, '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 999.00, '渐变红 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748372', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 372, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/87254a42-9fdf-4e68-a11e-e8e2eef28d2c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (373, '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 999.00, '铃兰白 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748373', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 373, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/81b7060a-7274-4bff-86c0-72d5fc7ff383.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (374, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 999.00, '4GB+64GB 幻夜黑 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748374', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 374, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/d7f74e8f-5c52-422b-ac99-a8d691830494.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (375, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 999.00, '4GB+64GB 幻影蓝 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748375', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 375, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/7031c07e-a70f-4f6d-9e2d-d0af31e3393a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (376, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 999.00, '4GB+64GB 魅海蓝 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748376', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 376, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/b7bfcc28-98c2-4cb4-8ce3-afe4c482b674.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (377, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 999.00, '4GB+64GB 魅焰红 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748377', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 377, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/6a160b96-9b4a-4844-b335-feb31b1f5d8c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (378, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 999.00, '4GB+64GB 梦幻紫 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748378', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 378, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/8ccc13ec-96fe-4488-a604-526601548c9e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (379, '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB天空之境全网通双4G手机', 3988.00, '新蜂精选', 0, 100, '件', '7748379', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 379, 20, 4288.00, '副标题', 4288.00, 10, 1000.00, '关键字', '备注', '/goods-img/edb7e8ef-7785-418b-a75e-dfed2aa74e39.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (380, '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB亮黑色全网通双4G手机', 3988.00, '新蜂精选', 0, 100, '件', '7748380', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 380, 20, 4288.00, '副标题', 4288.00, 10, 1000.00, '关键字', '备注', '/goods-img/e13294f7-9ab0-42dc-afb1-9f41c59436cf.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (381, '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB珠光贝母全网通双4G手机', 3988.00, '新蜂精选', 0, 100, '件', '7748381', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 381, 20, 4288.00, '副标题', 4288.00, 10, 1000.00, '关键字', '备注', '/goods-img/b9e6d770-06dd-40f4-9ae5-31103cec6e5f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (382, '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB极光色全网通双4G手机', 3988.00, '新蜂精选', 0, 100, '件', '7748382', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 382, 20, 4288.00, '副标题', 4288.00, 10, 1000.00, '关键字', '备注', '/goods-img/20312f4e-da4f-49b9-8150-ab54f0302915.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (383, '华为 HUAWEI P40 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB赤茶橘全网通双4G手机', 3988.00, '新蜂精选', 0, 100, '件', '7748383', 0, 0, 0, 1, 0, '出货地址', '收获地址', 4, 383, 20, 4288.00, '副标题', 4288.00, 10, 1000.00, '关键字', '备注', 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (384, '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1299.00, '渐变蓝 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748384', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 384, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/74146e03-42d1-453c-843d-b02d8bcc24f4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (385, '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1299.00, '渐变红 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748385', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 385, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/4c066fc2-3a58-44df-9dc6-8465b25f92ef.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (386, '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1299.00, '幻夜黑 移动联通电信4G全面屏手机 双卡双待', 0, 100, '件', '7748386', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 386, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/525bdd6e-848b-4e02-b19f-1a08fdb87faa.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (387, '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1599.00, '6.59英寸升降全面屏 全网通6GB+64GB 魅海蓝', 0, 100, '件', '7748387', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 387, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/7b8b7da7-f154-453e-a6a6-ea2f5e7d8b4a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (388, '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1599.00, '6.59英寸升降全面屏 全网通6GB+64GB 幻夜黑', 0, 100, '件', '7748388', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 388, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/d30f7986-bc0f-4ea8-8fbb-94c6bae248f5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (389, '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1399.00, '6.59英寸升降全面屏 全网通4GB+64GB 魅焰红', 0, 100, '件', '7748389', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 389, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/95b5df3b-cfec-40bb-8ead-35e0fe7fb7b2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (390, '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 2499.00, '麒麟Kirin980全网通版8GB+128GB 蓝水翡翠 全面屏手机', 0, 100, '件', '7748390', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 390, 20, 2699.00, '副标题', 2699.00, 10, 1000.00, '关键字', '备注', '/goods-img/2469b8fa-8117-4409-a8d6-3b52a33b3e51.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (391, '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 2499.00, '麒麟Kirin980全网通版8GB+128GB 幻夜黑 全面屏手机', 0, 100, '件', '7748391', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 391, 20, 2699.00, '副标题', 2699.00, 10, 1000.00, '关键字', '备注', '/goods-img/474e2ef0-2321-4363-ab31-7a838546f172.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (392, '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 2499.00, '麒麟Kirin980全网通版8GB+128GB 冰岛白 全面屏手机', 0, 100, '件', '7748392', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 392, 20, 2699.00, '副标题', 2699.00, 10, 1000.00, '关键字', '备注', '/goods-img/77d87d20-4fc7-441c-82a8-baf9089fc3ad.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (393, '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 2499.00, '麒麟Kirin980全网通版8GB+128GB 幻影蓝 全面屏手机', 0, 100, '件', '7748393', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 393, 20, 2699.00, '副标题', 2699.00, 10, 1000.00, '关键字', '备注', '/goods-img/1a200710-8c41-4411-8edf-a49575807a08.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (394, '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2899.00, '双光学防抖 麒麟980 全网通4G 8GB+128GB 冰岛幻境 拍照手机', 0, 100, '件', '7748394', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 394, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/391cd4e6-6071-41ea-a6fc-d983b30a5470.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (395, '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2899.00, '双光学防抖 麒麟980 全网通4G 8GB+128GB 蓝水翡翠 拍照手机', 0, 100, '件', '7748395', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 395, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/5d7ee18f-ca20-4d72-a803-dc5b03bd80e2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (396, '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2899.00, '双光学防抖 麒麟980 全网通4G 8GB+128GB 幻夜星河 拍照手机', 0, 100, '件', '7748396', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 396, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/goods-img/e1505375-d00d-4cd8-a090-a13490b430d5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (397, '荣耀20 PRO × MOSCHINO联名版', 3799.00, '4800万全焦段AI四摄 双光学防抖 麒麟980 8GB+256GB 黑色', 0, 100, '件', '7748397', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 397, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', '/goods-img/0ae89667-8a69-4efc-b8d8-c0ebaf56753a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (398, '华为 HUAWEI 畅享 9S', 1199.00, '6GB+64GB 幻夜黑 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748398', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 398, 20, 1499.00, '副标题', 1499.00, 10, 1000.00, '关键字', '备注', '/goods-img/1b96ae9b-8c56-465e-9e82-ff712305e2d9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (399, '华为 HUAWEI 畅享 9S', 1199.00, '6GB+64GB 极光蓝 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748399', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 399, 20, 1499.00, '副标题', 1499.00, 10, 1000.00, '关键字', '备注', '/goods-img/b49530f5-fe13-42b3-9ca9-6f1367e0f8f8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (400, '华为 HUAWEI 畅享 9S', 1199.00, '6GB+64GB 珊瑚红 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748400', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 400, 20, 1499.00, '副标题', 1499.00, 10, 1000.00, '关键字', '备注', '/goods-img/84397a4c-ff06-4f08-bad5-bd4d5f8e23ff.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (401, '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 2099.00, '4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏手机', 0, 100, '件', '7748401', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 401, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/7a58b5b2-0101-4a55-9872-d7765f08cf19.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (402, '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 2099.00, '4800万深感相机 6GB+128GB 魅海蓝 移动联通电信4G全面屏手机', 0, 100, '件', '7748402', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 402, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/5dd6b4de-0b39-48fc-9285-7356c22edf7b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (403, '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 2099.00, '4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', 0, 100, '件', '7748403', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 403, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/c5a6593b-ef49-42fd-b330-0be8021362d8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (404, '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 2099.00, '4800万深感相机 6GB+128GB 魅丽红 移动联通电信4G全面屏手机', 0, 100, '件', '7748404', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 404, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/b57f705a-ef7f-4a9f-a244-3fc980e17555.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (405, '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 2099.00, '4800万深感相机 6GB+128GB 幻影红 移动联通电信4G全面屏手机', 0, 100, '件', '7748405', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 405, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/3dd91f7d-8f89-4e8a-a808-fa556ee1ceb3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (406, '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2799.00, '6GB+128GB 亮黑色 全网通移动联通电信4G手机 双卡双待', 0, 100, '件', '7748406', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 406, 20, 3088.00, '副标题', 3088.00, 10, 1000.00, '关键字', '备注', '/goods-img/f8edc81a-8fbd-425b-8ed7-d6b4c14ec6a1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (407, '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2679.00, '6GB+64GB 极光色 全网通移动联通电信4G手机 双卡双待', 0, 100, '件', '7748407', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 407, 20, 2788.00, '副标题', 2788.00, 10, 1000.00, '关键字', '备注', '/goods-img/c17c5292-2c20-4196-88e3-7ea813530db5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (408, '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2699.00, '6GB+64GB 宝石蓝 全网通移动联通电信4G手机 双卡双待', 0, 100, '件', '7748408', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 408, 20, 2788.00, '副标题', 2788.00, 10, 1000.00, '关键字', '备注', '/goods-img/b43bcd55-3709-4c32-b3a2-5b59c80f3610.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (409, '华为 HUAWEI P20 AI智慧全面屏', 2679.00, '6GB+64GB 极光闪蝶色 全网通版 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748409', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 409, 20, 2788.00, '副标题', 2788.00, 10, 1000.00, '关键字', '备注', '/goods-img/3b183d9a-ac01-4bed-a7bb-1ddeba6ad416.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (410, '华为 HUAWEI P20 AI智慧全面屏', 2988.00, '6GB+64GB 珠光贝母色 全网通版 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748410', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 410, 20, 3388.00, '副标题', 3388.00, 10, 1000.00, '关键字', '备注', '/goods-img/28e94d5d-9ccc-4843-a296-2747530037ce.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (411, '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 3888.00, '6GB+128GB 香槟金 全网通移动联通电信4G手机 双卡双待', 0, 100, '件', '7748411', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 411, 20, 3888.00, '副标题', 3888.00, 10, 1000.00, '关键字', '备注', '/goods-img/0b11241e-4d6b-44ea-afb0-e029d1b5a54d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (412, '荣耀20S 李现同款 3200万人像超级夜景 4800万超广角AI三摄', 1899.00, '麒麟810旗舰级芯片 全网通版6GB+128GB 蝶羽蓝', 0, 100, '件', '7748412', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 412, 20, 1899.00, '副标题', 1899.00, 10, 1000.00, '关键字', '备注', '/goods-img/8883043d-bef3-442c-9ccf-af9c03510c5d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (413, '华为 HUAWEI 畅享MAX 4GB+64GB', 999.00, '幻夜黑 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748413', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 413, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/522ed5b9-bcae-401f-9933-d2e957bb3384.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (414, '华为 HUAWEI 畅享MAX 4GB+64GB', 999.00, '琥珀棕 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748414', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 414, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/36bdfdb9-21b1-46d5-9534-8b3873c9b6d9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (415, '华为 HUAWEI 畅享MAX 4GB+128GB', 1399.00, '天际白 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', 0, 100, '件', '7748415', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 415, 20, 1899.00, '副标题', 1899.00, 10, 1000.00, '关键字', '备注', '/goods-img/51fa04cf-1c05-49ee-8dea-0c1757ff32c4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (416, '华为 HUAWEI P30 Pro', 4988.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB极光色全网通版双4G手机', 68, 100, '件', '7748416', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 416, 20, 5488.00, '副标题', 5488.00, 10, 1000.00, '关键字', '备注', '/goods-img/65c8e729-aeca-4780-977b-4d0d39d4aa2e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (417, '华为 HUAWEI P30 Pro', 4988.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB亮黑色全网通版双4G手机', 68, 100, '件', '7748417', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 417, 20, 5488.00, '副标题', 5488.00, 10, 1000.00, '关键字', '备注', '/goods-img/bc90bb1e-494a-44d4-b180-42a994ec80fc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (418, '华为 HUAWEI P30 Pro', 4988.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB珠光贝母全网通版双4G手机', 68, 100, '件', '7748418', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 418, 20, 5488.00, '副标题', 5488.00, 10, 1000.00, '关键字', '备注', '/goods-img/a6f309b7-765a-4407-be71-bbd5b764d448.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (419, '华为 HUAWEI P30 Pro', 5488.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB天空之境全网通版双4G手机', 68, 100, '件', '7748419', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 419, 20, 5988.00, '副标题', 5988.00, 10, 1000.00, '关键字', '备注', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (420, '华为 HUAWEI P30 Pro', 5488.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB墨玉蓝全网通版双4G手机', 68, 100, '件', '7748420', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 420, 20, 5988.00, '副标题', 5988.00, 10, 1000.00, '关键字', '备注', '/goods-img/8755a735-baa1-4f17-a9bd-30c4f4f1451b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (421, '华为 HUAWEI P30 Pro', 4988.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB赤茶橘全网通版双4G手机', 68, 100, '件', '7748421', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 421, 20, 5488.00, '副标题', 5488.00, 10, 1000.00, '关键字', '备注', '/goods-img/44e78820-86f3-429d-94af-64f6af308846.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (422, '华为 HUAWEI P40 Pro', 4988.00, '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB嫣紫色全网通版双4G手机', 68, 100, '件', '7748422', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 422, 20, 5488.00, '副标题', 5488.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (423, '华为 HUAWEI nova 5', 2999.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB绮境森林全网通双4G手机', 64, 100, '件', '7748423', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 423, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/2948815e-043a-4f47-896f-7f6ccf916369.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (424, '华为 HUAWEI nova 5', 2999.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB亮黑色全网通双4G手机', 64, 100, '件', '7748424', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 424, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/df1bea42-9172-4cd5-9fc5-f35bb736108f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (425, '华为 HUAWEI nova 5', 2999.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片 8GB+128GB仲夏紫全网通双4G手机', 64, 100, '件', '7748425', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 425, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/ab6f8463-794f-4f40-87b8-d01e6260ff1c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (426, '华为 HUAWEI nova 5', 2999.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB苏音蓝全网通双4G手机', 64, 100, '件', '7748426', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 426, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/98e90b6e-2a5d-462d-8cd1-44699144a0b5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (427, '华为 HUAWEI nova 5', 2999.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB珊瑚橙全网通双4G手机', 64, 100, '件', '7748427', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 427, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/ec0bafed-d651-4be7-b2aa-13e84248219a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (428, '华为 HUAWEI nova 5', 3599.00, 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+256GB仲夏紫星耀礼盒版全网通', 64, 100, '件', '7748428', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 428, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', '/goods-img/83f39052-5a1c-4769-a7db-cf2bd53d2a29.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (429, '华为 HUAWEI nova 5i', 2199.00, '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 苏音蓝 全网通双卡双待', 64, 100, '件', '7748429', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 429, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/4b2bffff-ec0b-42e0-8152-ada9a121ad31.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (430, '华为 HUAWEI nova 5i', 2199.00, '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 幻夜黑 全网通双卡双待', 64, 100, '件', '7748430', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 430, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/04dce482-ff0e-483c-b324-dfc030b6cdd1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (431, '华为 HUAWEI nova 5i', 2199.00, '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 蜜语红 全网通双卡双待', 64, 100, '件', '7748431', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 431, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/b5e139d3-ea6b-4874-9ccc-c18aca44a8bc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (432, '荣耀9X PRO 麒麟810液冷散热 4000mAh超强续航', 2199.00, '4800万超广角夜拍三摄 6.59英寸全网通8GB+128GB 幻影紫', 63, 100, '件', '7748432', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 432, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/86bd80cd-140b-474c-8277-3747332f61b3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (433, '荣耀9X PRO 麒麟810液冷散热 4000mAh超强续航', 2199.00, '4800万超广角夜拍三摄 6.59英寸全网通8GB+128GB 幻夜黑', 63, 100, '件', '7748433', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 433, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/3b008be9-e906-4364-8aa0-0df2e670dbd2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (434, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 799.00, '极光蓝 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748434', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 434, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/7f7d2343-6743-490b-baec-3e0a76d061e5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (435, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 799.00, '铂光金 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748435', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 435, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/b163ca1b-7deb-4b15-818a-dc765c852305.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (436, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 799.00, '星云紫 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748436', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 436, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/f949289a-4c51-4159-a754-871da347e1e5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (437, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+64GB', 1099.00, '幻夜黑 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748437', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 437, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/27c3c018-95c5-429f-9ad7-be0fedd78329.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (438, '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+64GB', 1099.00, '幻影蓝 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748438', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 438, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/61224f59-e11a-4005-84dc-cadfdd4162f6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (439, '华为 HUAWEI 畅享8e 青春版', 549.00, '2GB+32GB全面屏 金色 全网通版 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748439', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 439, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/af23223e-56fa-4aa7-b832-c55c713fa604.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (440, '华为 HUAWEI 畅享8e青春 2GB+32GB全面屏', 549.00, '黑色 全网通版 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748440', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 440, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/bf64e22d-1cd3-40b0-9ce1-cc944e35d2d4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (441, '华为 HUAWEI 畅享8e青春 2GB+32GB全面屏', 549.00, '蓝色 全网通版 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748441', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 441, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/70f9ecf9-4859-45de-8f67-5afbdba6735c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (442, '华为 HUAWEI nova 4e', 1799.00, '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB雀翎蓝全网通版双4G手机', 64, 100, '件', '7748442', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 442, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/55b997f9-fa22-40b0-8b33-429760c2af49.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (443, '华为 HUAWEI nova 4e', 1799.00, '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G手机', 64, 100, '件', '7748443', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 443, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/8d675ec6-efe0-4ca6-8f83-193820b07256.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (444, '华为 HUAWEI nova 4e', 1799.00, '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB珍珠白全网通版双4G手机', 64, 100, '件', '7748444', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 444, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/c8ce9a44-7b40-48b2-91cb-2a1607561b4a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (445, '华为 HUAWEI 畅享9 Plus', 1199.00, '4GB+64GB 极光紫 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748445', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 445, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/5ea16713-f6ae-4fa7-a53d-1700c29cb3d3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (446, '华为 HUAWEI 畅享9 Plus', 1199.00, '4GB+64GB 幻夜黑 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748446', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 446, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/39e4b0c8-c4c5-4162-8a32-3bb9bb483503.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (447, '华为 HUAWEI 畅享9 Plus', 1199.00, '4GB+64GB 宝石蓝 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748447', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 447, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/ca2bb115-c75e-475b-93ab-c2436f31aa16.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (448, '华为 HUAWEI 畅享9 Plus', 1199.00, '4GB+64GB 樱语粉 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', 64, 100, '件', '7748448', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 448, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/65e953c4-1d29-423a-b7d7-4276c4d42aaa.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (449, '华为 HUAWEI nova 3i', 1299.00, '全面屏高清四摄游戏手机4GB+128GB 亮黑色 移动4G+ 移动联通电信4G手机双卡双待', 64, 100, '件', '7748449', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 449, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/2252c604-ced3-4e92-b58b-15402ae7be2c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (450, '华为 HUAWEI nova 3i', 1299.00, '全面屏高清四摄游戏手机4GB+128GB 蓝楹紫 移动4G+ 移动联通电信4G手机双卡双待', 64, 100, '件', '7748450', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 450, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/a17dc2b3-17dc-4be7-a04d-12a3fa62de31.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (451, '华为 HUAWEI nova 5i', 2149.00, 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB翡冷翠全网通双4G手机', 64, 100, '件', '7748451', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 451, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/e3f32e21-1208-481d-bfcd-8447de78043b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (452, '华为 HUAWEI nova 5i', 2149.00, 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB幻夜黑全网通双4G手机', 64, 100, '件', '7748452', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 452, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/1eb1e40c-7f38-47ed-a839-d43c1d0b79a8.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (453, '华为 HUAWEI nova 5i', 2149.00, 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB极光色全网通双4G手机', 64, 100, '件', '7748453', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 453, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/80f05e0d-0d06-4aa8-bca5-0d39a2365b4b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (454, '华为 HUAWEI Mate 20', 3699.00, '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版双4G手机', 66, 100, '件', '7748454', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 454, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', '/goods-img/9024ab8a-be67-4459-8414-8d84225851a7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (455, '华为 HUAWEI Mate 20', 3699.00, '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB极光色全网通版双4G手机', 66, 100, '件', '7748455', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 455, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', '/goods-img/940a6c56-9f7b-4008-8679-c7ef5a44d695.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (456, '华为 HUAWEI Mate 20', 3199.00, '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+64GB翡冷翠全网通版双4G手机', 66, 100, '件', '7748456', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 456, 20, 3299.00, '副标题', 3299.00, 10, 1000.00, '关键字', '备注', '/goods-img/08f9a912-f049-4cf8-a839-115fc6582398.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (457, '华为 HUAWEI Mate 20', 3699.00, '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB宝石蓝全网通版双4G手机', 66, 100, '件', '7748457', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 457, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', '/goods-img/5d57e0ba-1bc7-45a7-9677-f501e0384442.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (458, '华为 HUAWEI 麦芒 8', 1699.00, '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 极光蓝 全网通双4G手机', 64, 100, '件', '7748458', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 458, 20, 1899.00, '副标题', 1899.00, 10, 1000.00, '关键字', '备注', '/goods-img/bde7fc16-fb6b-42b0-8950-13ff287c3cd3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (459, '华为 HUAWEI 麦芒 8', 1699.00, '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 幻夜黑 全网通双4G手机', 64, 100, '件', '7748459', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 459, 20, 1899.00, '副标题', 1899.00, 10, 1000.00, '关键字', '备注', '/goods-img/e299773e-14e4-4168-adab-514f6c6d35ed.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (460, '华为 HUAWEI 麦芒 8', 1699.00, '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 宝石蓝 全网通双4G手机', 64, 100, '件', '7748460', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 460, 20, 1899.00, '副标题', 1899.00, 10, 1000.00, '关键字', '备注', '/goods-img/2a3fb7d2-cb76-47b2-88c6-db0f869b5718.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (461, '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 1199.00, '6GB+64GB 魅海蓝 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748461', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 461, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/c0763005-4e67-4861-98f2-e6a550ec4d87.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (462, '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 1199.00, '6GB+64GB 幻夜黑 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748462', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 462, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/aea7760b-d950-4f64-8db9-ef055f15d234.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (463, '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 1199.00, '6GB+64GB 魅焰红 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748463', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 463, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/f5e2d2e7-541a-44fa-ad5c-4f15f48ebfc9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (464, '华为 HUAWEI Mate 10', 1799.00, '4GB+64GB 亮黑色 移动4G+手机 双卡双待', 64, 100, '件', '7748464', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 464, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/b67a4ac6-7766-4995-8110-1bd442ec0797.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (465, '华为 HUAWEI 畅享9 3GB+32GB', 799.00, '极光蓝 高清珍珠屏 AI长续航 全网通标配版 移动联通电信4G手机', 64, 100, '件', '7748465', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 465, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/bd8b2d93-c251-46b8-9990-77baaf3075f3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (466, '华为 HUAWEI 畅享9 3GB+32GB', 799.00, '幻夜黑 高清珍珠屏 AI长续航 全网通标配版 移动联通电信4G手机', 64, 100, '件', '7748466', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 466, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/71ae1ce8-38e8-4da3-8fa1-5e8157a12685.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (467, '华为 HUAWEI 畅享9 4GB+64GB', 1099.00, '极光紫 高清珍珠屏 AI长续航 全网通高配版 移动联通电信4G手机', 64, 100, '件', '7748467', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 467, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/371386b8-ddf4-4fc1-985e-ef0e1a076710.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (468, '华为 HUAWEI 畅享9 4GB+64GB', 1099.00, '珊瑚红 高清珍珠屏 AI长续航 全网通高配版 移动联通电信4G手机', 64, 100, '件', '7748468', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 468, 20, 1099.00, '副标题', 1099.00, 10, 1000.00, '关键字', '备注', '/goods-img/60392ae1-d076-47b5-a00d-b2278e01ccb5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (469, '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 649.00, '幻夜黑 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748469', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 469, 20, 799.00, '副标题', 799.00, 10, 1000.00, '关键字', '备注', '/goods-img/0a592388-1535-4f9f-8201-ecb78c48bb3d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (470, '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 649.00, '极光蓝 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748470', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 470, 20, 799.00, '副标题', 799.00, 10, 1000.00, '关键字', '备注', '/goods-img/fd218943-8f6f-4fb8-91a4-d6216cc5afdc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (471, '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 649.00, '魅焰红 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748471', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 471, 20, 799.00, '副标题', 799.00, 10, 1000.00, '关键字', '备注', '/goods-img/54641753-d8e7-45da-8c6c-81192552cf15.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (472, '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 649.00, '铂光金 移动联通电信4G全面屏手机 双卡双待', 63, 100, '件', '7748472', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 472, 20, 799.00, '副标题', 799.00, 10, 1000.00, '关键字', '备注', '/goods-img/7b65ad3d-74a4-4322-8653-6bda47a8b4eb.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (473, 'Redmi K20Pro 骁龙855 索尼4800万超广角三摄', 2699.00, 'AMOLED弹出式全面屏 8GB+256GB 碳纤黑 游戏智能手机 小米 红米', 70, 100, '件', '7748473', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 473, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/2a05cc6a-3eea-42f9-ab97-2e2529a72099.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (474, '小米9 Pro 5G 全面屏游戏拍照新品手机', 9999.00, '新蜂精选', 69, 98, '件', '7748474', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 474, 20, 9999.00, '副标题', 9999.00, 10, 1000.00, '关键字', '备注', '/goods-img/d5fc8bec-0add-48d3-b73b-349a0375e8dc.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (475, '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 梦幻蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748475', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 475, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/e4e4c543-6d9a-4b19-bedf-3f40024cb710.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (476, '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 皓月白 游戏智能手机 小米 红米', 70, 100, '件', '7748476', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 476, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/87e0f6ab-45ef-4710-a5f4-e57a470b6b26.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (477, '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 曜石黑 游戏智能手机 小米 红米', 70, 100, '件', '7748477', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 477, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/4a5c5b20-2dd3-4343-a6d1-31195c9edea4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (478, 'Redmi Note7 4800万双摄千元机 满血骁龙660', 1099.00, '18个月超长质保 4000mAh超长续航 6GB+64GB 镜花水月 游戏智能手机 小米 红米', 70, 99, '件', '7748478', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 478, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/30ef1f51-f958-486f-8d79-f48f6d8293dd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (479, 'Redmi Note7 4800万双摄千元机 满血骁龙660', 1099.00, '18个月超长质保 4000mAh超长续航 6GB+64GB 亮黑色 游戏智能手机 小米 红米', 70, 100, '件', '7748479', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 479, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/92beacb0-f692-42ff-a20f-8fecd2b0c046.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (480, 'Redmi Note7 4800万双摄千元机 满血骁龙660', 1099.00, '18个月超长质保 4000mAh超长续航 6GB+64GB 暮光金 游戏智能手机 小米 红米', 70, 100, '件', '7748480', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 480, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/0cf95c37-2665-4894-bd42-5f8de06c6d94.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (481, 'Redmi Note7 4800万双摄千元机 满血骁龙660', 1099.00, '4000mAh超长续航 6GB+64GB 梦幻蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748481', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 481, 20, 1199.00, '副标题', 1199.00, 10, 1000.00, '关键字', '备注', '/goods-img/f6c46245-b957-41ed-b235-133c17cba7f9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (482, '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1399.00, '4500mAh长续航 NFC 18W快充 红外遥控 6GB+64GB 贝母白 游戏智能手机 小米 红米', 70, 100, '件', '7748482', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 482, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/54985ce7-1df6-442f-9a28-0ff0bab924bd.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (483, '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1599.00, '4500mAh长续航 NFC 18W快充 红外遥控 6GB+128GB 冰翡翠 游戏智能手机 小米 红米', 70, 100, '件', '7748483', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 483, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/e3de1717-e373-4544-9f1e-057a91fd2595.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (484, '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1399.00, '4500mAh长续航 NFC 18W快充 红外遥控 6GB+64GB 电光灰 游戏智能手机 小米 红米', 70, 100, '件', '7748484', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 484, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/a1552f03-58ab-4b05-91ec-7df52af18a66.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (485, 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1399.00, '18个月超长质保 4000mAh超长续航 6GB+128GB 亮黑色 游戏智能手机 小米 红米', 70, 100, '件', '7748485', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 485, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/647470fa-85b1-4626-99d0-d5b7512c8f23.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (486, 'Redmi Note7pro 索尼4800万超清双摄 骁龙675', 1399.00, '18个月超长质保 4000mAh超长续航 6GB+128GB 镜花水月 游戏智能手机 小米 红米', 70, 100, '件', '7748486', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 486, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/edb8a694-84a5-47da-9bae-30f7a69d2c63.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (487, 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1399.00, '18个月超长质保 4000mAh超长续航 6GB+128GB 梦幻蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748487', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 487, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/c76edfa6-c16e-45b9-9119-46d300739112.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (488, 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1399.00, '18个月超长质保 4000mAh超长续航 6GB+128GB 暮光金 游戏智能手机 小米 红米', 70, 100, '件', '7748488', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 488, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/bf0c2d17-3630-4709-af38-d7bd14a76f22.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (489, 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 599.00, '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 磨砂黑 游戏智能手机 小米 红米', 70, 100, '件', '7748489', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 489, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/28c56015-cb20-44cb-86fb-246ad509e828.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (490, 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 599.00, '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 晨曦蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748490', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 490, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/d845c984-f749-4f22-86a5-558677b1322c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (491, 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 599.00, '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 雾光金 游戏智能手机 小米 红米', 70, 100, '件', '7748491', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 491, 20, 599.00, '副标题', 599.00, 10, 1000.00, '关键字', '备注', '/goods-img/56ac4c58-8742-40c8-b130-83b4d2925a8c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (492, 'Redmi 7 4000mAh超长续航 骁龙632', 699.00, '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 亮黑色 游戏智能手机 小米 红米', 70, 100, '件', '7748492', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 492, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/0647d1b4-d19a-4424-b6ac-68344addacb4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (493, 'Redmi 7 4000mAh超长续航 骁龙632', 699.00, '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 魅夜红 游戏智能手机 小米 红米', 70, 100, '件', '7748493', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 493, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/711c54f0-f9d0-472e-b61b-94e25c628599.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (494, 'Redmi 7 4000mAh超长续航 骁龙632', 699.00, '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 梦幻蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748494', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 494, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/c8c97b68-3ba6-4f97-8940-d04c9e7c7302.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (495, '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面屏', 1799.00, '白色 多功能 NFC 6GB+128GB 游戏智能拍照手机', 69, 100, '件', '7748495', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 495, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/d423bb5c-60c8-4b66-bd72-3490b5d6461b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (496, '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面屏', 1799.00, '黑色 多功能 NFC 6GB+128GB 游戏智能拍照手机', 69, 99, '件', '7748496', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 496, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/9a554cae-5bec-4964-992f-e2f4de192e2c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (497, '小米9 4800万超广角三摄 6GB+128GB全息幻彩蓝 骁龙855', 2599.00, '全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', 69, 100, '件', '7748497', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 497, 20, 2799.00, '副标题', 2799.00, 10, 1000.00, '关键字', '备注', '/goods-img/55a6dc67-1ed9-421a-9782-acdfa9c123e1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (498, '小米9 4800万超广角三摄 8GB+256GB 透明版', 3699.00, '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', 69, 100, '件', '7748498', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 498, 20, 3699.00, '副标题', 3699.00, 10, 1000.00, '关键字', '备注', '/goods-img/55a6dc67-1ed9-421a-9782-acdfa9c123e1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (499, '小米9 4800万超广角三摄 8GB+128GB 深空灰', 2799.00, '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', 69, 100, '件', '7748499', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 499, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', '/goods-img/e8087861-89fd-43af-b64d-290864b0fe35.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (500, '小米10 4800万超广角三摄 8GB+128GB 全息幻彩紫', 2799.00, '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', 69, 100, '件', '7748500', 0, 0, 0, 1, 0, '出货地址', '收获地址', 1, 500, 20, 2999.00, '副标题', 2999.00, 10, 1000.00, '关键字', '备注', 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (501, '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1299.00, '屏幕指纹 白色恋人 6GB+64GB 游戏智能拍照手机', 69, 100, '件', '7748501', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 501, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/8fc9776e-9393-421d-998c-e516b3877dba.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (502, '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1299.00, '屏幕指纹 暗夜王子 6GB+64GB 游戏智能拍照手机', 69, 100, '件', '7748502', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 502, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/033685d7-bf11-4389-9e52-ef5a51182306.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (503, '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1299.00, '屏幕指纹 深蓝星球 6GB+64GB 游戏智能拍照手机', 69, 100, '件', '7748503', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 503, 20, 1399.00, '副标题', 1399.00, 10, 1000.00, '关键字', '备注', '/goods-img/e8dba692-7fda-4f42-b0ee-6f51ca7dc77d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (504, '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1799.00, '4030mAh 深蓝星球 6GB+64GB 游戏智能拍照手机', 69, 100, '件', '7748504', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 504, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/387afca1-a14a-4ab8-9d99-120b7095029c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (505, '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1799.00, '4030mAh 白色恋人 6GB+64GB 游戏智能拍照手机', 69, 100, '件', '7748505', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 505, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/f96f376e-8341-4bad-ad2a-b3f12486958a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (506, '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1999.00, '4030mAh 暗夜王子 6GB+128GB 游戏智能拍照手机', 69, 99, '件', '7748506', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 506, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/4c148e8e-7e26-4c74-a3d3-f5f37ae9248d.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (507, '小米CC9美图定制版 索尼4800万AI三摄 3200万美颜自拍 全身美型', 2599.00, '多功能NFC 8GB+256GB 游戏智能拍照手机', 69, 100, '件', '7748507', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 507, 20, 2599.00, '副标题', 2599.00, 10, 1000.00, '关键字', '备注', '/goods-img/92482741-3637-4cd3-91ff-cc5aeb0d3316.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (508, '小米Play 流光渐变AI双摄 6GB+128GB 梦幻蓝', 999.00, '移动4G+ 双卡双待 小水滴全面屏拍照游戏智能手机', 69, 100, '件', '7748508', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 508, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/f0b19f6c-6a8b-4128-8e5d-2e4953331c46.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (509, '小米Play 流光渐变AI双摄 6GB+128GB 黑色', 999.00, '移动4G+ 双卡双待 小水滴全面屏拍照游戏智能手机', 69, 100, '件', '7748509', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 509, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/e39da33d-1b55-4e97-b8e6-824ac2cd1062.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (510, '小米Play 流光渐变AI双摄 6GB+64GB 暮光金', 899.00, '全网通4G 双卡双待 小水滴全面屏拍照游戏智能手机', 69, 100, '件', '7748510', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 510, 20, 899.00, '副标题', 899.00, 10, 1000.00, '关键字', '备注', '/goods-img/2a93185a-8d3b-4908-af8c-c17db78e2fb0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (511, '小米9SE 骁龙712 索尼4800万超广角三摄 5.97英寸舒适握感', 1899.00, '全息幻彩蓝 8GB+128GB 游戏智能拍照手机', 69, 99, '件', '7748511', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 511, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/b28f3eac-0091-442f-90f3-68914bf947c7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (512, '小米9 SE 4800万超广角三摄 骁龙712', 1599.00, '水滴全面屏 游戏智能拍照手机 6GB+64GB 深空灰 全网通4G 双卡双待', 69, 100, '件', '7748512', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 512, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/ef8370c4-ed8e-497f-9e10-185de4d01fe9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (513, '小米9SE 骁龙712 索尼4800万超广角三摄 5.97英寸舒适握感', 1999.00, '全息幻彩紫 8GB+128GB 游戏智能拍照手机', 69, 100, '件', '7748513', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 513, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/f436d00b-2253-4dcc-8b4a-d82e99af275a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (514, '小米MIX3 骁龙845AIE AI 双摄', 2599.00, '磁动力滑盖全面屏 三星 AMOLED屏幕 黑色 8GB+128GB 游戏智能拍照手机', 73, 100, '件', '7748514', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 514, 20, 2599.00, '副标题', 2599.00, 10, 1000.00, '关键字', '备注', '/goods-img/3bfc7c72-b56a-4088-8acf-e01e830ce72a.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (515, 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1799.00, '第七代屏下指纹 6GB+128GB 冰川蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748515', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 515, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/ed860c53-955b-4cfd-b605-a8b4bb959e2f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (516, 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1799.00, '第七代屏下指纹 6GB+128GB 火焰红 游戏智能手机 小米 红米', 70, 100, '件', '7748516', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 516, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/8e64ea39-5477-482c-a200-2c12fdeff004.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (517, 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1799.00, '第七代屏下指纹 6GB+128GB 碳纤黑 游戏智能手机 小米 红米', 70, 100, '件', '7748517', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 517, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/38a69084-0bc4-479e-a5ba-aed135dee974.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (518, '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 599.00, '3GB+32GB 流沙金 游戏智能手机 小米', 70, 100, '件', '7748518', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 518, 20, 649.00, '副标题', 649.00, 10, 1000.00, '关键字', '备注', '/goods-img/6c77e8f9-11d8-42c3-925e-4396d0d3709f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (519, '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 599.00, '3GB+32GB 铂银灰 游戏智能手机 小米', 70, 100, '件', '7748519', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 519, 20, 649.00, '副标题', 649.00, 10, 1000.00, '关键字', '备注', '/goods-img/17b2eb9f-7289-45f8-b26a-114ec29ceb3c.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (520, '小米 红米6A 全网通版 2GB内存', 549.00, '樱花粉 16GB 移动联通电信4G手机 双卡双待', 70, 100, '件', '7748520', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 520, 20, 549.00, '副标题', 549.00, 10, 1000.00, '关键字', '备注', '/goods-img/1ba819c2-dc89-41d9-86a9-4649418972da.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (521, '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 599.00, '3GB+32GB 巴厘蓝 游戏智能手机 小米', 70, 100, '件', '7748521', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 521, 20, 649.00, '副标题', 649.00, 10, 1000.00, '关键字', '备注', '/goods-img/1ef84d7e-d804-4064-9140-a53607aa8df2.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (522, '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1499.00, '骁龙八核处理器 蓝色 6GB+128GB 游戏智能拍照手机', 69, 100, '件', '7748522', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 522, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/b6c3eea7-9d34-4ac0-ba66-2fde6f26253b.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (523, '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1499.00, '骁龙八核处理器 黑色 6GB+128GB 游戏智能拍照手机', 69, 100, '件', '7748523', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 523, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/30574476-f5bc-4f3c-80f6-4da22ea48f48.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (524, '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1499.00, '骁龙八核处理器 金色 6GB+128GB 游戏智能拍照手机', 69, 100, '件', '7748524', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 524, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/114e92f8-bf78-481e-8d8a-9936d026d9d4.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (525, 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 梦幻蓝 游戏智能手机 小米 红米', 70, 100, '件', '7748525', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 525, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/8d3ebf2d-8da7-478c-bd6c-e7a869fdde97.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (526, 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 皓月白 游戏智能手机 小米 红米', 70, 100, '件', '7748526', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 526, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/b4ff98bc-ad00-48f7-ac64-0d52780d4c48.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (527, 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 999.00, '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 曜石黑 游戏智能手机 小米 红米', 70, 100, '件', '7748527', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 527, 20, 999.00, '副标题', 999.00, 10, 1000.00, '关键字', '备注', '/goods-img/b82cc8fd-075b-44d3-b211-8ea633fe2ffe.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (528, '小米（MI） 小米8青春版 手机 深空灰', 1168.00, '全网通 6G+128G', 69, 100, '件', '7748528', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 528, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/52425573-6311-4877-bad8-1c04bf01e9d3.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (529, '小米（MI） 小米8青春版 手机 梦幻蓝', 1599.00, '全网通 4G+128G', 69, 100, '件', '7748529', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 529, 20, 1599.00, '副标题', 1599.00, 10, 1000.00, '关键字', '备注', '/goods-img/8c1c9fb2-26aa-4fa0-b9ce-cf278d827fa6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (530, '小米（MI） 小米8青春版 手机 暮光金', 1068.00, '全网通 6G+64G', 69, 100, '件', '7748530', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 530, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/bd94d7e0-f56f-4b7f-8653-b8a4e267bd15.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (531, '小米 红米Note8 pro 手机【6400万四摄', 1599.00, '液冷游戏芯】 冰翡翠 全网通6+128', 69, 100, '件', '7748531', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 531, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/42913aa4-4a49-4121-9c80-3434c12d0ac9.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (532, '小米 红米Note8 pro 手机【6400万四摄', 1599.00, '液冷游戏芯】 贝母白 全网通6+128', 69, 100, '件', '7748532', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 532, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/777ebd38-965d-4c77-970e-f1e25022255f.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (533, '小米 红米Note8 pro 手机【6400万四摄', 1599.00, '液冷游戏芯】 电光灰 全网通6+128', 69, 100, '件', '7748533', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 533, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/db21f41b-34ac-4bc7-a50f-1f812b1522d1.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (534, '小米（MI） 小米8 游戏手机 黑', 1568.00, '6GB+64GB', 69, 100, '件', '7748534', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 534, 20, 1698.00, '副标题', 1698.00, 10, 1000.00, '关键字', '备注', '/goods-img/63588dfb-f85f-41a2-8198-c7ae66aa0261.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (535, '小米（MI） 小米8 游戏手机 白', 1568.00, '6GB+64GB', 69, 100, '件', '7748535', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 535, 20, 1698.00, '副标题', 1698.00, 10, 1000.00, '关键字', '备注', '/goods-img/d55d6e4a-99e7-4a3d-86a4-9b3899a63b42.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (536, '小米（MI） 小米8 游戏手机 蓝', 1868.00, '8GB+128GB', 69, 100, '件', '7748536', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 536, 20, 1998.00, '副标题', 1998.00, 10, 1000.00, '关键字', '备注', '/goods-img/5a2a90aa-fe2c-4bb0-8d8d-1ac1613f453a.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (537, '小米（MI） 小米8 游戏手机 金', 1838.00, '6GB+128GB', 69, 100, '件', '7748537', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 537, 20, 1898.00, '副标题', 1898.00, 10, 1000.00, '关键字', '备注', '/goods-img/c1cdb555-f605-4226-906a-022483612319.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (538, '小米（MI） 小米8青春版 手机 深空灰', 1188.00, '全网通(6G+128G)', 69, 100, '件', '7748538', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 538, 20, 1188.00, '副标题', 1188.00, 10, 1000.00, '关键字', '备注', '/goods-img/fafda3af-7741-47f2-936e-c0d9030fbf5b.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (539, '小米（MI） 小米8青春版 手机 梦幻蓝', 1388.00, '全网通(6G+64G)', 69, 100, '件', '7748539', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 539, 20, 1388.00, '副标题', 1388.00, 10, 1000.00, '关键字', '备注', '/goods-img/ef5ac8cb-5d4e-4dc6-bece-27c9ff5a2e1c.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (540, '小米（MI） 小米8青春版 手机 暮光金', 1578.00, '全网通(6G+128G)', 69, 100, '件', '7748540', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 540, 20, 1578.00, '副标题', 1578.00, 10, 1000.00, '关键字', '备注', '/goods-img/d8b30b9f-faa4-4a0d-84bc-53b9c4745977.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (541, '小米 红米Redmi 7 全网通4G', 808.00, '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 梦幻蓝 4GB+64GB', 69, 100, '件', '7748541', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 541, 20, 1200.00, '副标题', 1200.00, 10, 1000.00, '关键字', '备注', '/goods-img/18ce5224-c98d-4a9c-a024-5ac5b6f9a2d7.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (542, '小米 红米Redmi 7 全网通4G', 818.00, '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 亮黑色 4GB+64GB', 69, 100, '件', '7748542', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 542, 20, 1200.00, '副标题', 1200.00, 10, 1000.00, '关键字', '备注', '/goods-img/f7a9a98d-9e3f-4443-b8a7-5612bcd7c1d0.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (543, '小米 红米Redmi 7 全网通4G', 818.00, '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 魅夜红 4GB+64GB', 69, 100, '件', '7748543', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 543, 20, 1200.00, '副标题', 1200.00, 10, 1000.00, '关键字', '备注', '/goods-img/02523f49-742b-4c45-b59b-f550fe5a60ae.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (544, '小米 小米8屏幕指纹版 手机 黑色', 1808.00, '全网通(6G + 128G )', 69, 100, '件', '7748544', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 544, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/35b9c185-2ca6-4052-af40-2abd2157f200.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (545, '小米 小米8屏幕指纹版 手机 透明版', 2028.00, '全网通(8G + 128G)', 69, 100, '件', '7748545', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 545, 20, 2499.00, '副标题', 2499.00, 10, 1000.00, '关键字', '备注', '/goods-img/fcd1faf9-10b5-4318-b92b-36105be8752f.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (546, '小米 小米8屏幕指纹版 手机 暮光金', 2099.00, '全网通(6G + 128G )', 69, 100, '件', '7748546', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 546, 20, 2099.00, '副标题', 2099.00, 10, 1000.00, '关键字', '备注', '/goods-img/e9818435-c510-4042-91e1-734a818a2577.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (547, '小米 红米6 全网通版 3GB内存', 699.00, '流沙金 32GB 移动联通电信4G手机 双卡双待', 69, 100, '件', '7748547', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 547, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/515706fb-a5f8-4d72-a08e-7523cf4ea113.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (548, '小米 红米6 3GB+32GB 铂银灰', 699.00, '全网通4G手机 双卡双待 老人机 智能拍照手机', 69, 100, '件', '7748548', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 548, 20, 699.00, '副标题', 699.00, 10, 1000.00, '关键字', '备注', '/goods-img/bcec0048-e992-4e57-9aaf-ddbd9fe852ce.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (549, '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 曜石黑（屏幕指纹版）', 1818.00, '6G+128G', 69, 100, '件', '7748549', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 549, 20, 2199.00, '副标题', 2199.00, 10, 1000.00, '关键字', '备注', '/goods-img/e1c2b06f-fd06-4242-acb7-9ebd7179181b.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (550, '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 透明版(屏幕指纹版)', 2018.00, '8G+128G', 69, 100, '件', '7748550', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 550, 20, 2599.00, '副标题', 2599.00, 10, 1000.00, '关键字', '备注', '/goods-img/314274fc-1ee0-474d-bbb5-b9c70a8a9573.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (551, '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 暮光金(屏幕指纹版)', 2058.00, '8G+128G', 69, 100, '件', '7748551', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 551, 20, 2599.00, '副标题', 2599.00, 10, 1000.00, '关键字', '备注', '/goods-img/c2905bd8-bd68-4672-bada-b8a202a9327e.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (552, '小米8 游戏手机 全面屏 黑色', 1558.00, '全网通(6G+64G)', 69, 100, '件', '7748552', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 552, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/5afd1749-a3bc-41c2-90b2-928ede8aedda.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (553, '小米8 游戏手机 全面屏 白色', 1550.00, '全网通(6G+64G)', 69, 100, '件', '7748553', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 553, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/a96dd5bc-2d74-4d57-9336-45a8ac09a363.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (554, '小米8 游戏手机 全面屏 白色', 1798.00, '全网通(6G+128G)', 69, 100, '件', '7748554', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 554, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/25e44283-a440-4e64-bb27-1887370c3d2e.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (555, '小米8 游戏手机 全面屏 金色', 1849.00, '全网通(6G+128G)', 69, 100, '件', '7748555', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 555, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/6b5e5711-8ae6-4f66-bd22-30c9be85d3c6.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (556, '小米8 游戏手机 全面屏 黑色', 1849.00, '全网通(6G+128G)', 69, 100, '件', '7748556', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 556, 20, 1999.00, '副标题', 1999.00, 10, 1000.00, '关键字', '备注', '/goods-img/040a3aa6-1699-4eca-ac67-5021cc419979.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (557, '小米8 游戏手机 全面屏 金色', 1598.00, '全网通(6G+64G)', 69, 100, '件', '7748557', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 557, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/goods-img/47c28778-88a4-42fd-bb4d-c93fe8df36b5.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (558, '小米8 游戏手机 全面屏 屏幕指纹版', 2199.00, '暮光金 全网通(8G+128G)', 69, 100, '件', '7748558', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 558, 20, 3799.00, '副标题', 3799.00, 10, 1000.00, '关键字', '备注', 'http://localhost:28089/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (559, '小米8 游戏手机 全面屏 蓝色', 1598.00, '全网通(6G+64G)', 69, 100, '件', '7748559', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 559, 20, 1799.00, '副标题', 1799.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (560, '小米8 游戏手机 全面屏 金色', 2158.00, '全网通(6G+256G)', 69, 100, '件', '7748560', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 560, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (561, '小米8 游戏手机 全面屏 白色', 2158.00, '全网通(6G+256G)', 69, 100, '件', '7748561', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 561, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (562, '小米8 游戏手机 全面屏 蓝色', 2158.00, '全网通(6G+256G)', 69, 100, '件', '7748562', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 562, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (563, '小米8 游戏手机 全面屏 黑色', 3199.00, '全网通(6G+256G)', 69, 100, '件', '7748563', 0, 0, 0, 0, 0, '出货地址', '收获地址', 4, 563, 20, 3199.00, '副标题', 3199.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (564, '小米8 游戏手机 全面屏 透明探索版', 4299.00, '全网通(8G+128G)', 69, 100, '件', '7748564', 0, 0, 0, 0, 0, '出货地址', '收获地址', 5, 564, 20, 4299.00, '副标题', 4299.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (565, '小米8 游戏手机 全面屏 屏幕指纹版', 3399.00, '暮光金 全网通(6G+128G)', 69, 100, '件', '7748565', 0, 0, 0, 0, 0, '出货地址', '收获地址', 6, 565, 20, 3399.00, '副标题', 3399.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (566, '小米8 游戏手机 全面屏 蓝色', 1849.00, '全网通(6G+128G)', 69, 100, '件', '7748566', 0, 0, 0, 0, 0, '出货地址', '收获地址', 7, 566, 20, 1849.00, '副标题', 1849.00, 10, 1000.00, '关键字', '备注', '/admin/dist/img/no-img.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (567, '小米 红米7 手机 Redmi7', 808.00, 'AI双摄 拍照游戏手机 全网通双卡双待 亮黑色 4G+64G 全网通', 69, 100, '件', '7748567', 0, 0, 0, 0, 0, '出货地址', '收获地址', 8, 567, 20, 1299.00, '副标题', 1299.00, 10, 1000.00, '关键字', '备注', '/goods-img/b6084354-1841-4241-ba7b-7e97186a9076.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (568, '小米 红米7 手机 Redmi7', 818.00, 'AI双摄 拍照游戏手机 全网通双卡双待 魅夜红 4G+64G 全网通', 69, 100, '件', '7748568', 0, 0, 0, 0, 0, '出货地址', '收获地址', 9, 568, 20, 1009.00, '副标题', 1009.00, 10, 1000.00, '关键字', '备注', '/goods-img/7b4e03b1-eca7-42f5-8dda-14d02d3ab318.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (569, '小米 红米7 手机 Redmi7', 715.00, 'AI双摄 拍照游戏手机 全网通双卡双待 梦幻蓝 3G+32G 全网通', 69, 100, '件', '7748569', 0, 0, 0, 0, 0, '出货地址', '收获地址', 10, 569, 20, 787.00, '副标题', 787.00, 10, 1000.00, '关键字', '备注', '/goods-img/7bca8b59-35f3-480a-a95d-99efcbb8cfda.jpg', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (570, 'HUAWEI Mate 30 Pro 双4000万徕卡电影四摄', 5399.00, '超曲面OLED环幕屏 8GB+256GB 全网通4G版（星河银）', 13, 100, '件', '7748570', 0, 0, 0, 0, 0, '出货地址', '收获地址', 1, 570, 20, 5399.00, '副标题', 5399.00, 10, 1000.00, '关键字', '备注', '/goods-img/mate30p2.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (571, 'HUAWEI Mate 30 Pro', 5399.00, '超曲面OLED环幕屏 8GB+128GB 全网通4G版（翡冷翠）', 13, 100, '件', '7748571', 0, 0, 0, 0, 0, '出货地址', '收获地址', 2, 571, 20, 5399.00, '副标题', 5399.00, 10, 1000.00, '关键字', '备注', '/goods-img/mate30p3.png', '详情标题', '详情描述', '产品详情网页内容', 0);
INSERT INTO `pm_commodity` VALUES (572, 'HUAWEI Mate 30 4000万超感光徕卡影像', 3999.00, 'OLED全面屏 8GB+128GB 全网通4G版 （罗兰紫）', 13, 100, '件', '7748572', 0, 0, 0, 0, 0, '出货地址', '收获地址', 3, 572, 20, 3999.00, '副标题', 3999.00, 10, 1000.00, '关键字', '备注', '/goods-img/mate30-3.png', '详情标题', '详情描述', '产品详情网页内容', 0);

-- ----------------------------
-- Table structure for usr_account
-- ----------------------------
DROP TABLE IF EXISTS `usr_account`;
CREATE TABLE `usr_account`  (
  `acco_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '账户id',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户类型',
  `stop` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`acco_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usr_account
-- ----------------------------
INSERT INTO `usr_account` VALUES (1, 'jinqiuyang', '910b15a0dbeab54b326b23686636dab9', 'admin', 'yes', NULL);
INSERT INTO `usr_account` VALUES (2, 'zhangwen', 'c908d0276bf0bd156862101fc01f1a67', 'admin', 'yes', NULL);
INSERT INTO `usr_account` VALUES (3, 'lijia', '7b20fdd1bbf1b89d598653e72615f577', 'admin', 'yes', NULL);
INSERT INTO `usr_account` VALUES (4, 'shixiaoxue', '0a0e874fbb36276f68417e17dae3fa56', 'admin', 'yes', NULL);
INSERT INTO `usr_account` VALUES (5, 'linzhonghu', 'f199d51b584cc039a803e9bf972c89b2', 'admin', 'yes', NULL);
INSERT INTO `usr_account` VALUES (6, 'test', '910b15a0dbeab54b326b23686636dab9', 'admin', 'no', NULL);
INSERT INTO `usr_account` VALUES (7, 'test1', '5a105e8b9d40e1329780d62ea2265d8a', 'normal', 'yes', '2020-04-01 15:59:06');
INSERT INTO `usr_account` VALUES (8, 'test2', 'ad0234829205b9033196ba818f7a872b', 'admin', 'yes', '2020-04-02 08:29:52');
INSERT INTO `usr_account` VALUES (9, '123456', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'yes', '2020-04-07 17:14:55');
INSERT INTO `usr_account` VALUES (10, '18806210404', '4ba666e2fb3dda2dc643747cb1beef16', 'normal', 'yes', '2020-04-08 10:01:19');
INSERT INTO `usr_account` VALUES (11, 'jinqiuyangtest', '910b15a0dbeab54b326b23686636dab9', 'normal', 'yes', '2020-04-08 10:17:15');
INSERT INTO `usr_account` VALUES (12, 'haimeng', 'f42b6b08614fa8f1bca55ef68f3d9d18', 'normal', 'yes', '2020-04-08 17:41:31');
INSERT INTO `usr_account` VALUES (13, '18351540843', 'e10adc3949ba59abbe56e057f20f883e', 'normal', 'yes', '2020-04-10 08:51:39');

-- ----------------------------
-- Table structure for usr_user
-- ----------------------------
DROP TABLE IF EXISTS `usr_user`;
CREATE TABLE `usr_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usr_user
-- ----------------------------
INSERT INTO `usr_user` VALUES (11, '17694829226', '17694829226', 'e10adc3949ba59abbe56e057f20f883e', '', '张文的大于10的收获地址', 0, 0, '2020-03-30 15:54:09');
INSERT INTO `usr_user` VALUES (12, '佳佳', '18816285344', '8350f77ed04af7fb0ccfea09a3a55ef9', '晴天sunny', '江苏省盐城市建湖县上冈镇', 0, 0, '2020-04-02 01:38:55');
INSERT INTO `usr_user` VALUES (13, '佳佳', '18806210404', 'a77978e39d3ffb6e784690530b549f03', '我命由我不由天', '江苏省苏州市独墅湖高教区林泉街399号', 0, 0, '2020-04-02 10:20:52');
INSERT INTO `usr_user` VALUES (14, '13505163290', '13505163290', 'bb8a345d092164a7a9df3da6a5040452', '', '江苏省南京xx小区28栋838', 0, 0, '2020-04-02 13:29:31');
INSERT INTO `usr_user` VALUES (15, '18949721107', '18949721107', 'fae9789b9d6c87d743be19252191b712', '', '', 0, 1, '2020-04-02 20:21:19');
INSERT INTO `usr_user` VALUES (16, '1894972..', '18949721108', '7611392544855b1c119a7be912f4dd6b', 'jinqiuyang', '安徽省滁州市来安县sasadadad', 0, 1, '2020-04-02 20:25:18');
INSERT INTO `usr_user` VALUES (17, '1894972..', '18949721109', '2c64f31f46a96c92af2242c4b7a8ba64', 'hhhh', '安徽省滁州xx小区xx栋', 0, 0, '2020-04-07 11:42:17');
INSERT INTO `usr_user` VALUES (18, '大津巴布韦', '18851540852', 'e10adc3949ba59abbe56e057f20f883e', '原始人wuwuwu', '江苏-苏州-工业园区-文荟人才公寓-9栋', 0, 0, '2020-04-07 16:10:49');
INSERT INTO `usr_user` VALUES (19, '18012538026', '18012538026', 'a77978e39d3ffb6e784690530b549f03', '', '', 0, 0, '2020-04-07 17:12:48');
INSERT INTO `usr_user` VALUES (20, '18806210401', '18806210401', 'a77978e39d3ffb6e784690530b549f03', '', '', 0, 0, '2020-04-07 18:20:02');
INSERT INTO `usr_user` VALUES (22, '18351540852', '18351540852', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2020-04-08 17:33:11');
INSERT INTO `usr_user` VALUES (23, '18851540832', '18851540832', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2020-04-08 17:35:33');

SET FOREIGN_KEY_CHECKS = 1;
