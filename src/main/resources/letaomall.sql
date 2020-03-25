/*
 Navicat Premium Data Transfer

 Source Server         : Aaron
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : letaomall

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 23/03/2020 14:13:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for om_address
-- ----------------------------
DROP TABLE IF EXISTS `om_address`;
CREATE TABLE `om_address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `acco_id` int(11) DEFAULT NULL COMMENT '账号id',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for om_cart
-- ----------------------------
DROP TABLE IF EXISTS `om_cart`;
CREATE TABLE `om_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `comm_id` int(11) DEFAULT NULL COMMENT '商品的id',
  `acco_id` int(11) DEFAULT NULL COMMENT '账户id',
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) DEFAULT NULL COMMENT '销售属性1',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"银色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for om_order
-- ----------------------------
DROP TABLE IF EXISTS `om_order`;
CREATE TABLE `om_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) NOT NULL COMMENT '账户id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `created_time` datetime DEFAULT NULL COMMENT '提交时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for om_order_item
-- ----------------------------
DROP TABLE IF EXISTS `om_order_item`;
CREATE TABLE `om_order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `comm_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `orderItemPrice` decimal(10,2) DEFAULT NULL COMMENT '订单项目价格',
  `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性1',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for om_return
-- ----------------------------
DROP TABLE IF EXISTS `om_return`;
CREATE TABLE `om_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `created_time` datetime DEFAULT NULL COMMENT '申请创建时间',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `return_name` varchar(64) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(64) DEFAULT NULL COMMENT '退货人电话',
  `status` int(11) DEFAULT NULL COMMENT '申请状态',
  `reason` varchar(200) DEFAULT NULL COMMENT '申请原因',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_brand
-- ----------------------------
DROP TABLE IF EXISTS `pm_brand`;
CREATE TABLE `pm_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL COMMENT '是否显示',
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_comm_category
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_category`;
CREATE TABLE `pm_comm_category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
  `cname` varchar(64) DEFAULT NULL COMMENT '商品分类名称',
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `product_unit` varchar(64) DEFAULT NULL COMMENT '商品单位',
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_comm_comment
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_comment`;
CREATE TABLE `pm_comm_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comm_id` int(11) DEFAULT NULL COMMENT '商品id',
  `user_name` varchar(100) DEFAULT NULL COMMENT '顾客名称',
  `star` int(11) DEFAULT NULL COMMENT '评论星数',
  `created_time` datetime DEFAULT NULL COMMENT '评论创建时间',
  `content` varchar(200) DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_comm_images
-- ----------------------------
DROP TABLE IF EXISTS `pm_comm_images`;
CREATE TABLE `pm_comm_images` (
  `imageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `comm_id` int(11) DEFAULT NULL COMMENT '商品id',
  `location` varchar(20) DEFAULT NULL COMMENT '图片位置',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_commodity
-- ----------------------------
DROP TABLE IF EXISTS `pm_commodity`;
CREATE TABLE `pm_commodity` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(64) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `description` text COMMENT '商品描述',
  `commodity_category_id` int(11) DEFAULT NULL COMMENT '商品分类id',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '商品的条码',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sale_address` varchar(100) DEFAULT NULL COMMENT '出货地址',
  `make_address` varchar(100) DEFAULT NULL COMMENT '制造地址',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL COMMENT '详情标题',
  `detail_desc` text COMMENT '详情描述',
  `detail_html` text COMMENT '产品详情网页内容',
  PRIMARY KEY (`comm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usr_account
-- ----------------------------
DROP TABLE IF EXISTS `usr_account`;
CREATE TABLE `usr_account` (
  `acco_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `type` varchar(10) DEFAULT NULL COMMENT '账户类型',
  `stop` varchar(10) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`acco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usr_user
-- ----------------------------
DROP TABLE IF EXISTS `usr_user`;
CREATE TABLE `usr_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `age` int(11) NOT NULL COMMENT '年龄',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `address` varchar(200) DEFAULT NULL COMMENT '所在地',
  `contact_info` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `acco_id` int(11) NOT NULL COMMENT '关联账户id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
