-- 导出 looklook_order 的数据库结构
DROP DATABASE IF EXISTS `looklook_order`;
CREATE DATABASE IF NOT EXISTS `looklook_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `looklook_order`;

-- 导出  表 looklook_order.homestay_order 结构
DROP TABLE IF EXISTS `homestay_order`;
CREATE TABLE IF NOT EXISTS `homestay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  `sn` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '下单用户id',
  `homestay_id` bigint NOT NULL DEFAULT '0' COMMENT '民宿id',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `info` varchar(4069) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '介绍',
  `people_num` tinyint(1) NOT NULL DEFAULT '0' COMMENT '容纳人的数量',
  `row_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售卖类型0：按房间出售 1:按人次出售',
  `need_food` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不需要餐食 1:需要参数',
  `food_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '餐食标准',
  `food_price` bigint NOT NULL COMMENT '餐食价格(分)',
  `homestay_price` bigint NOT NULL COMMENT '民宿价格(分)',
  `market_homestay_price` bigint NOT NULL DEFAULT '0' COMMENT '民宿市场价格(分)',
  `homestay_business_id` bigint NOT NULL DEFAULT '0' COMMENT '店铺id',
  `homestay_user_id` bigint NOT NULL DEFAULT '0' COMMENT '店铺房东id',
  `live_start_date` date NOT NULL COMMENT '开始入住日期',
  `live_end_date` date NOT NULL COMMENT '结束入住日期',
  `live_people_num` tinyint NOT NULL DEFAULT '0' COMMENT '实际入住人数',
  `trade_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1: 已取消 0:待支付 1:未使用 2:已使用  3:已退款 4:已过期',
  `trade_code` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '确认码',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户下单备注',
  `order_total_price` bigint NOT NULL DEFAULT '0' COMMENT '订单总价格（餐食总价格+民宿总价格）(分)',
  `food_total_price` bigint NOT NULL DEFAULT '0' COMMENT '餐食总价格(分)',
  `homestay_total_price` bigint NOT NULL DEFAULT '0' COMMENT '民宿总价格(分)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='每一间民宿';

-- 数据导出被取消选择。


-- 导出 looklook_payment 的数据库结构
DROP DATABASE IF EXISTS `looklook_payment`;
CREATE DATABASE IF NOT EXISTS `looklook_payment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `looklook_payment`;

-- 导出  表 looklook_payment.third_payment 结构
DROP TABLE IF EXISTS `third_payment`;
CREATE TABLE IF NOT EXISTS `third_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sn` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '流水单号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint(1) NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `pay_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付方式 1:微信支付',
  `trade_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方支付类型',
  `trade_state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方交易状态',
  `pay_total` bigint NOT NULL DEFAULT '0' COMMENT '支付总金额(分)',
  `transaction_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方支付单号',
  `trade_state_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付状态描述',
  `order_sn` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务单号',
  `service_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型 ',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '平台内交易状态   -1:支付失败 0:未支付 1:支付成功 2:已退款',
  `pay_time` datetime NOT NULL DEFAULT '1970-01-01 08:00:00' COMMENT '支付成功时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='第三方支付流水记录';

-- 数据导出被取消选择。


-- 导出 looklook_travel 的数据库结构
DROP DATABASE IF EXISTS `looklook_travel`;
CREATE DATABASE IF NOT EXISTS `looklook_travel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `looklook_travel`;

-- 导出  表 looklook_travel.homestay 结构
DROP TABLE IF EXISTS `homestay`;
CREATE TABLE IF NOT EXISTS `homestay` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `banner` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '轮播图，第一张封面',
  `info` varchar(4069) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '介绍',
  `people_num` tinyint(1) NOT NULL DEFAULT '0' COMMENT '容纳人的数量',
  `homestay_business_id` bigint NOT NULL DEFAULT '0' COMMENT '民宿店铺id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '房东id，冗余字段',
  `row_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:下架 1:上架',
  `row_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售卖类型0：按房间出售 1:按人次出售',
  `food_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '餐食标准',
  `food_price` bigint NOT NULL DEFAULT '0' COMMENT '餐食价格（分）',
  `homestay_price` bigint NOT NULL DEFAULT '0' COMMENT '民宿价格（分）',
  `market_homestay_price` bigint NOT NULL DEFAULT '0' COMMENT '民宿市场价格（分）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='每一间民宿';

-- 数据导出被取消选择。

-- 导出  表 looklook_travel.homestay_activity 结构
DROP TABLE IF EXISTS `homestay_activity`;
CREATE TABLE IF NOT EXISTS `homestay_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `row_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动类型',
  `data_id` bigint NOT NULL DEFAULT '0' COMMENT '业务表id（id跟随活动类型走）',
  `row_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:下架 1:上架',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `idx_rowType` (`row_type`,`row_status`,`del_state`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='每一间民宿';

-- 数据导出被取消选择。

-- 导出  表 looklook_travel.homestay_business 结构
DROP TABLE IF EXISTS `homestay_business`;
CREATE TABLE IF NOT EXISTS `homestay_business` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '关联的用户id',
  `info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺介绍',
  `boss_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房东介绍',
  `license_fron` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '营业执照正面',
  `license_back` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '营业执照背面',
  `row_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁止营业 1:正常营业',
  `star` double(2,1) NOT NULL DEFAULT '0.0' COMMENT '店铺整体评价，冗余',
  `tags` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '每个店家一个标签，自己编辑',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `header_img` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店招门头图片',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_userId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='民宿店铺';

-- 数据导出被取消选择。

-- 导出  表 looklook_travel.homestay_comment 结构
DROP TABLE IF EXISTS `homestay_comment`;
CREATE TABLE IF NOT EXISTS `homestay_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `homestay_id` bigint NOT NULL DEFAULT '0' COMMENT '民宿id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `star` json NOT NULL COMMENT '星星数,多个维度',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='民宿评价';

-- 数据导出被取消选择。


-- 导出 looklook_usercenter 的数据库结构
DROP DATABASE IF EXISTS `looklook_usercenter`;
CREATE DATABASE IF NOT EXISTS `looklook_usercenter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `looklook_usercenter`;

-- 导出  表 looklook_usercenter.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0:男 1:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- 数据导出被取消选择。

-- 导出  表 looklook_usercenter.user_auth 结构
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` tinyint NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '0' COMMENT '版本号',
  `user_id` bigint NOT NULL DEFAULT '0',
  `auth_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '平台唯一id',
  `auth_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '平台类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_type_key` (`auth_type`,`auth_key`) USING BTREE,
  UNIQUE KEY `idx_userId_key` (`user_id`,`auth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户授权表';


