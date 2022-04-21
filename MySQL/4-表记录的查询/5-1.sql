
drop database if exists chapter3;
create database chapter3;
use chapter3;


SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `tb_action`;
CREATE TABLE `tb_action` (
  `fid` char(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `time` datetime DEFAULT NULL,
  `point` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_action` VALUES ('10002', '新少林寺', '2011-01-19 00:00:00', '5.9');
INSERT INTO `tb_action` VALUES ('20002', '功夫之王', '2008-04-24 00:00:00', '5.3');
INSERT INTO `tb_action` VALUES ('30004', '夜宴', '2009-09-14 00:00:00', '5.6');


DROP TABLE IF EXISTS `tb_affecional`;
CREATE TABLE `tb_affecional` (
  `fid` char(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `time` datetime DEFAULT NULL,
  `point` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_affecional` VALUES ('10004', '李米的猜想', '2008-09-18 00:00:00', '7.7');
INSERT INTO `tb_affecional` VALUES ('30004', '夜宴', '2006-09-14 00:00:00', '5.6');
INSERT INTO `tb_affecional` VALUES ('40003', '非常完美', '2009-08-13 00:00:00', '6.0');


DROP TABLE IF EXISTS `tb_buyers`;
CREATE TABLE `tb_buyers` (
  `bid` int(4) NOT NULL,
  `bname` varchar(10) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_buyers` VALUES ('1', '钱多多', '女', '汇众传媒', '13601606523');
INSERT INTO `tb_buyers` VALUES ('2', '王欣', '女', '', '13601606548');
INSERT INTO `tb_buyers` VALUES ('3', '孙飞', '男', '果客zone', '13601954569');
INSERT INTO `tb_buyers` VALUES ('4', '王坚', '男', '新谦科技', '13601957841');
INSERT INTO `tb_buyers` VALUES ('5', '陈中民', '男', '', '13601957368');
INSERT INTO `tb_buyers` VALUES ('6', '于舒雅', '女', '上海戌询科技', '13601957796');
INSERT INTO `tb_buyers` VALUES ('7', '黄程君', '男', '', '13621714531');
INSERT INTO `tb_buyers` VALUES ('8', '张海妹', '女', '', '13621718615');
INSERT INTO `tb_buyers` VALUES ('9', '林少伟', '女', '', '13621712115');
INSERT INTO `tb_buyers` VALUES ('10', '杨小琪', '男', '', '13621758964');
INSERT INTO `tb_buyers` VALUES ('11', '朱思强', '男', '', '13621758990');


DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `region_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_dept` VALUES ('1', 'Finance', '1');
INSERT INTO `tb_dept` VALUES ('2', 'Sales', '1');
INSERT INTO `tb_dept` VALUES ('3', 'Sales', '2');
INSERT INTO `tb_dept` VALUES ('4', 'Sales', '3');
INSERT INTO `tb_dept` VALUES ('5', 'Sales', '4');
INSERT INTO `tb_dept` VALUES ('6', 'Sales', '5');
INSERT INTO `tb_dept` VALUES ('7', 'Operations ', '1');
INSERT INTO `tb_dept` VALUES ('8', 'Operations', '2');
INSERT INTO `tb_dept` VALUES ('9', 'Operations', '3');
INSERT INTO `tb_dept` VALUES ('10', 'Operations', '4');
INSERT INTO `tb_dept` VALUES ('11', 'Operations', '5');
INSERT INTO `tb_dept` VALUES ('12', 'Administration', '1');


DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_id` smallint(6) DEFAULT NULL,
  `salary` decimal(11,2) DEFAULT NULL,
  `comm_pct` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_emp` VALUES ('1', 'Carmen', null, 'President', '12', '4500.00', null);
INSERT INTO `tb_emp` VALUES ('2', 'LaDoris', '1', 'VP, Operations', '7', '3450.00', null);
INSERT INTO `tb_emp` VALUES ('3', 'Midori', '1', 'VP, Sales', '2', '3400.00', null);
INSERT INTO `tb_emp` VALUES ('4', 'Mark', '1', 'VP, Finance', '1', '3450.00', null);
INSERT INTO `tb_emp` VALUES ('5', 'Audry', '1', 'VP, Administration', '12', '3550.00', null);
INSERT INTO `tb_emp` VALUES ('6', 'Molly', '2', 'Warehouse Manager', '7', '3200.00', null);
INSERT INTO `tb_emp` VALUES ('7', 'Roberta', '2', 'Warehouse Manager', '8', '3250.00', null);
INSERT INTO `tb_emp` VALUES ('8', 'Ben', '2', 'Warehouse Manager', '9', '3100.00', null);
INSERT INTO `tb_emp` VALUES ('9', 'Antoinette', '2', 'Warehouse Manager', '10', '3300.00', null);
INSERT INTO `tb_emp` VALUES ('10', 'Marta', '2', 'Warehouse Manager', '11', '3307.00', null);
INSERT INTO `tb_emp` VALUES ('11', 'Colin', '3', 'Sales Representative', '2', '3400.00', '101.00');
INSERT INTO `tb_emp` VALUES ('12', 'Henry', '3', 'Sales Representative', '3', '3490.00', '125.00');
INSERT INTO `tb_emp` VALUES ('13', 'Yasmin', '3', 'Sales Representative', '4', '3515.00', '100.00');
INSERT INTO `tb_emp` VALUES ('14', 'Mai', '3', 'Sales Representative', '5', '3525.00', '150.00');
INSERT INTO `tb_emp` VALUES ('15', 'Andre', '3', 'Sales Representative', '6', '3450.00', '175.00');
INSERT INTO `tb_emp` VALUES ('16', 'Elena', '6', 'Stock Clerk', '7', '3400.00', null);
INSERT INTO `tb_emp` VALUES ('17', 'Akira', '7', 'Stock Clerk', '8', '3200.00', null);
INSERT INTO `tb_emp` VALUES ('18', 'Vikram', '7', 'Stock Clerk', '8', '2795.00', null);
INSERT INTO `tb_emp` VALUES ('19', 'Chad', '8', 'Stock Clerk', '9', '1750.00', null);
INSERT INTO `tb_emp` VALUES ('20', 'Alexander', '8', 'Stock Clerk', '9', '2850.00', null);
INSERT INTO `tb_emp` VALUES ('21', 'Eddie', '9', 'Stock Clerk', '10', '1800.00', null);
INSERT INTO `tb_emp` VALUES ('22', 'Radha', '9', 'Stock Clerk', '5', '2795.00', null);
INSERT INTO `tb_emp` VALUES ('23', 'Bela', '10', 'Stock Clerk', '11', '860.00', null);


DROP TABLE IF EXISTS `tb_houses`;
CREATE TABLE `tb_houses` (
  `hid` int(4) NOT NULL,
  `hname` varchar(20) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `hsquare` int(11) DEFAULT NULL,
  `price_per` decimal(8,2) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `hyear` datetime DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_houses` VALUES ('101', '博爱家园', '三室', '116', '67241.00', '浦东', null);
INSERT INTO `tb_houses` VALUES ('102', '仁恒森兰雅苑', '四室', '208', '80769.00', '浦东', null);
INSERT INTO `tb_houses` VALUES ('103', '三航小区', '两室', '52', '71153.00', '浦东', null);
INSERT INTO `tb_houses` VALUES ('104', '三林苑', '三室', '84', '51190.00', '浦东', null);
INSERT INTO `tb_houses` VALUES ('105', '樟树苑', '一室', '15', '46666.00', '浦东', null);
INSERT INTO `tb_houses` VALUES ('201', '海洲丽园', '三室', '158', '80379.00', '黄浦', null);
INSERT INTO `tb_houses` VALUES ('202', '家化中房苑', '三室', '154', '74675.00', '黄浦', null);
INSERT INTO `tb_houses` VALUES ('203', '陆家嘴外滩公寓', '两室', '90', '77777.00', '黄浦', null);
INSERT INTO `tb_houses` VALUES ('204', '绿地黄浦滨江', '四室以上', '378', '179894.00', '黄浦', null);
INSERT INTO `tb_houses` VALUES ('205', '蓬莱公园', '一室', '30', '73260.00', '黄浦', null);
INSERT INTO `tb_houses` VALUES ('301', '创世纪花园', '四室', '202', '80769.00', '徐汇', null);
INSERT INTO `tb_houses` VALUES ('302', '和成阁公寓', '三室', '42', '66666.00', '徐汇', null);
INSERT INTO `tb_houses` VALUES ('303', '华苑大厦', '四室', '197', '50761.00', '徐汇', null);
INSERT INTO `tb_houses` VALUES ('304', '君蓬宏润丽苑', '三室', '106', '29059.00', '徐汇', null);
INSERT INTO `tb_houses` VALUES ('401', '复地香栀花园', '四室', '381', '49868.00', '长宁', null);
INSERT INTO `tb_houses` VALUES ('402', '南李苑小区', '两室', '10', '51190.00', '长宁', null);
INSERT INTO `tb_houses` VALUES ('403', '怡佳公馆', '三室', '106', '45283.00', '长宁', null);


DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bid` int(4) NOT NULL,
  `hid` int(4) NOT NULL,
  `subscription` decimal(5,0) DEFAULT NULL,
  `bank_loan` bit(1) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


INSERT INTO `tb_order` VALUES ('1', '1', '301', '20', '', '2017-12-04 00:00:00');
INSERT INTO `tb_order` VALUES ('2', '1', '402', '45', '', '2018-01-05 00:00:00');
INSERT INTO `tb_order` VALUES ('3', '1', '203', null, '', '2018-05-06 00:00:00');
INSERT INTO `tb_order` VALUES ('4', '2', '103', '10', '', '2018-02-07 00:00:00');
INSERT INTO `tb_order` VALUES ('5', '2', '204', '15', '', '2018-03-21 00:00:00');
INSERT INTO `tb_order` VALUES ('6', '2', '401', '8', '', '2018-05-12 00:00:00');
INSERT INTO `tb_order` VALUES ('7', '2', '101', '6', '', '2018-06-10 00:00:00');
INSERT INTO `tb_order` VALUES ('8', '4', '105', '12', '', '2018-01-21 00:00:00');
INSERT INTO `tb_order` VALUES ('9', '4', '402', '30', '', '2018-04-02 00:00:00');
INSERT INTO `tb_order` VALUES ('10', '3', '205', '22', '', '2018-03-23 00:00:00');
INSERT INTO `tb_order` VALUES ('11', '5', '204', '7', '', '2018-03-24 00:00:00');
INSERT INTO `tb_order` VALUES ('12', '5', '203', '9', '', '2018-06-02 00:00:00');
INSERT INTO `tb_order` VALUES ('13', '5', '103', '14', '', '2018-03-26 00:00:00');
INSERT INTO `tb_order` VALUES ('14', '6', '402', null, '', '2018-02-15 00:00:00');
INSERT INTO `tb_order` VALUES ('15', '6', '103', '25', '', '2018-02-09 00:00:00');
INSERT INTO `tb_order` VALUES ('16', '9', '301', '20', '', '2018-04-12 00:00:00');
INSERT INTO `tb_order` VALUES ('17', '9', '202', '16', '', '2018-04-02 00:00:00');
INSERT INTO `tb_order` VALUES ('18', '10', '301', '9', '', '2018-06-10 00:00:00');
INSERT INTO `tb_order` VALUES ('19', '11', '101', '5', '', '2018-05-06 00:00:00');
INSERT INTO `tb_order` VALUES ('20', '11', '303', '6', '', '2018-04-02 00:00:00');


DROP TABLE IF EXISTS `tb_region`;
CREATE TABLE `tb_region` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_region` VALUES ('1', 'North America', 'CHICAGO');
INSERT INTO `tb_region` VALUES ('2', 'South America', 'BOSTON');
INSERT INTO `tb_region` VALUES ('3', 'Africa / Middle East', 'CAIRO');
INSERT INTO `tb_region` VALUES ('4', 'Asia', 'BEIJING');
INSERT INTO `tb_region` VALUES ('5', 'Europe', 'Landon');


DROP TABLE IF EXISTS `tb_salgrade`;
CREATE TABLE `tb_salgrade` (
  `grade` smallint(6) NOT NULL,
  `lowSal` decimal(18,2) NOT NULL,
  `higSal` decimal(18,2) NOT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tb_salgrade` VALUES ('1', '700.00', '1000.00');
INSERT INTO `tb_salgrade` VALUES ('2', '1001.00', '2000.00');
INSERT INTO `tb_salgrade` VALUES ('3', '2001.00', '2800.00');
INSERT INTO `tb_salgrade` VALUES ('4', '2801.00', '3500.00');
INSERT INTO `tb_salgrade` VALUES ('5', '3502.00', '9999.00');


DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `dep` varchar(12) DEFAULT NULL,
  `sal` decimal(10,0) DEFAULT NULL,
  `comm_pat` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


