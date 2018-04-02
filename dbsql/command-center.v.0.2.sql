/*
建表语句
*/


CREATE TABLE `t_cc_moniter_flush` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`delivery_time`  int(11) NULL DEFAULT NULL ,
`flush_timepoint`  int(11) NULL DEFAULT NULL ,
`busy_start`  int(11) NULL DEFAULT NULL COMMENT '线程控制字段，开始运行时间，运行完后设置为0' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;


CREATE TABLE `t_cc_moniter_sorting_ci` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`ciid`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品代码' ,
`siid`  int(11) NOT NULL COMMENT 'standard_item_id' ,
`city`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市' ,
`warehouse`  int(11) NOT NULL DEFAULT 0 COMMENT '仓库' ,
`class1`  int(11) NOT NULL DEFAULT 0 COMMENT '大类' ,
`class1_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`class2`  int(11) NOT NULL DEFAULT 0 COMMENT '小类' ,
`class2_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类名称' ,
`item_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`expect_weight`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订购重量' ,
`expect_num`  decimal(10,0) NOT NULL DEFAULT 0 COMMENT '订单条数' ,
`real_weight`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '分拣重量' ,
`real_num`  decimal(10,0) NOT NULL DEFAULT 0 COMMENT '分拣条数' ,
`delivery_time`  int(11) NOT NULL COMMENT '配送时间' ,
`u_t`  int(11) NULL DEFAULT NULL COMMENT '分拣时间' ,
`c_t`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `index_ci` (`delivery_time`, `city`, `warehouse`, `ciid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;



CREATE TABLE `t_cc_moniter_sorting_timeline` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`datatype`  int(1) NOT NULL COMMENT '0:all,1:city ,2:warehouse ,3:class1, 4:class2' ,
`delivery_time`  int(11) NOT NULL ,
`city`  int(11) NULL DEFAULT NULL ,
`warehouse`  int(11) NULL DEFAULT NULL ,
`class1`  int(11) NULL DEFAULT NULL ,
`class2`  int(11) NULL DEFAULT NULL ,
`timepoint`  int(11) NULL DEFAULT NULL COMMENT '快照时间' ,
`expect_weight`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '订购量' ,
`real_weight`  decimal(10,2) NULL DEFAULT 0.00 ,
`expect_num`  decimal(10,0) NULL DEFAULT NULL ,
`real_num`  decimal(10,0) NULL DEFAULT NULL ,
`rate_weight`  decimal(10,4) NULL DEFAULT NULL COMMENT '按重量进度' ,
`rate_num`  decimal(10,4) NULL DEFAULT NULL COMMENT '数量进度' ,
PRIMARY KEY (`id`),
INDEX `index_sorting` (`datatype`, `delivery_time`, `city`, `warehouse`, `class1`, `class2`) USING BTREE ,
INDEX `index_timepoint` (`delivery_time`, `timepoint`, `city`, `warehouse`, `class1`, `class2`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;


CREATE TABLE `t_cc_moniter_timepoint` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`delivery_time`  int(11) NOT NULL ,
`timepoint`  int(11) NOT NULL ,
`isflush`  int(1) NULL DEFAULT 0 COMMENT '0：没刷新  1：已经刷新' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;


CREATE TABLE `t_cc_systemset` (
  `skey` varchar(10) DEFAULT NULL,
  `sname` varchar(50) DEFAULT NULL,
  `svalue` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cc_systemset
-- ----------------------------
INSERT INTO `t_cc_systemset` VALUES ('dataflush', '数据同步标示', '1');


