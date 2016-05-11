/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : hzwcarrent

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2016-01-13 20:10:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `flag` varchar(50) DEFAULT NULL,
  `isuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `quanxian` varchar(1000) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00 00:00:00', '1', '1', '117', '1');
INSERT INTO `admin` VALUES ('6', 'hzw', 'e10adc3949ba59abbe56e057f20f883e', '2016-01-11 21:06:20', '', '1', '10', '111');
INSERT INTO `admin` VALUES ('7', 'daxiang', 'e10adc3949ba59abbe56e057f20f883e', '2016-01-13 20:01:34', 'daxiang', '1', '1', '111');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `loginip` varchar(50) DEFAULT NULL,
  `useros` varchar(50) DEFAULT NULL,
  `ok` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=gb2312;


-- ----------------------------
-- Table structure for `affiche`
-- ----------------------------
DROP TABLE IF EXISTS `affiche`;
CREATE TABLE `affiche` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `adder` varchar(50) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of affiche
-- ----------------------------
INSERT INTO `affiche` VALUES ('2', 'haha', 'hahaah', '2016-01-11 21:06:44', 'admin', '1');
INSERT INTO `affiche` VALUES ('3', '侯正伟', '侯正伟发公告', '2016-01-13 20:00:19', 'hzw', '1');

-- ----------------------------
-- Table structure for `friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(50) DEFAULT NULL,
  `linkurl` varchar(50) DEFAULT NULL,
  `linkpic` varchar(200) DEFAULT NULL,
  `intero` varchar(300) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  `ordervalue` int(4) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `replay` int(4) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO `guestbook` VALUES ('44', '游客', 'images/nobody.gif', '呵呵', '2016-01-13 19:40:53', '127.0.0.1', '0', '1');
INSERT INTO `guestbook` VALUES ('45', 'houzheng', 'images/nobody.gif', 'houzhengweitest11', '2016-01-13 19:41:25', '127.0.0.1', '1', '1');
INSERT INTO `guestbook` VALUES ('46', '游客', 'images/nobody.gif', '你好', '2016-01-13 19:49:46', '127.0.0.1', '0', '1');
INSERT INTO `guestbook` VALUES ('47', 'houzheng', 'images/nobody.gif', '我是侯正伟', '2016-01-13 19:51:01', '127.0.0.1', '1', '1');
INSERT INTO `guestbook` VALUES ('48', 'houzheng', 'images/nobody.gif', '呵呵', '2016-01-13 19:53:16', '127.0.0.1', '0', '1');

-- ----------------------------
-- Table structure for `guestvisit`
-- ----------------------------
DROP TABLE IF EXISTS `guestvisit`;
CREATE TABLE `guestvisit` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `vtime` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of guestvisit
-- ----------------------------

-- ----------------------------
-- Table structure for `js`
-- ----------------------------
DROP TABLE IF EXISTS `js`;
CREATE TABLE `js` (
  `js` text
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of js
-- ----------------------------
INSERT INTO `js` VALUES ('<p>撒地方首发式地方<img src=\"/carrentsystem/FCKeditor/editor/images/smiley/msn/wink_smile.gif\" alt=\"\" /></p>');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `regtime` varchar(50) DEFAULT NULL,
  `ifuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `lastip` varchar(50) DEFAULT NULL,
  `jf` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'xiaoqiang', 'e10adc3949ba59abbe56e057f20f883e', 'person', '2012-02-23 16:19:24', '1', '46', '2016-01-13 19:35:26', '127.0.0.1', '61288');
INSERT INTO `member` VALUES ('2', 'houzheng', 'e10adc3949ba59abbe56e057f20f883e', 'person', '2016-01-11 21:44:00', '1', '8', '2016-01-13 19:50:12', '127.0.0.1', null);
INSERT INTO `member` VALUES ('3', 'qqqq', 'e10adc3949ba59abbe56e057f20f883e', 'person', '2016-01-12 13:16:14', '1', '0', '2016-01-12 13:16:14', '127.0.0.1', null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `sj` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('30', '新闻一', '<p>撒大苏打</p>\r\n<p><strong>&nbsp;适当放宽就是可怜的风景a</strong></p>', '2016-01-13 06:47:16');
INSERT INTO `news` VALUES ('31', 'newstest', '<p><img src=\"http://localhost:8080/carrentsystem/images/sp_nav.gif\" alt=\"http://localhost:8080/carrentsystem/images/sp_nav.gif\" class=\"transparent\" />呵呵</p>', '2016-01-13 07:58:20');
INSERT INTO `news` VALUES ('32', 'hze', '<p><img src=\"http://localhost:8080/carrentsystem/images/sp_nav.gif\" alt=\"http://localhost:8080/carrentsystem/images/sp_nav.gif\" class=\"transparent\" />很好的活动活动和</p>', '2016-01-13 07:59:05');

-- ----------------------------
-- Table structure for `pmember`
-- ----------------------------
DROP TABLE IF EXISTS `pmember`;
CREATE TABLE `pmember` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mid` int(4) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `bir` varchar(50) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pmember
-- ----------------------------
INSERT INTO `pmember` VALUES ('2', '2', '123213', 'm', '', '浙江', '宁波', '12345232222', '123123@11.com', '213213', '我是谁', 'houzhengwei');
INSERT INTO `pmember` VALUES ('3', '3', '呵呵', 'm', '123', '内蒙古', '呼和浩特', '12345232222', '123123@11.com', '123', '1234', '1212');

-- ----------------------------
-- Table structure for `qc`
-- ----------------------------
DROP TABLE IF EXISTS `qc`;
CREATE TABLE `qc` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cm` varchar(50) DEFAULT NULL,
  `fl` varchar(50) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `cp` varchar(50) DEFAULT NULL,
  `zj` double DEFAULT NULL,
  `csjg` double DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of qc
-- ----------------------------
INSERT INTO `qc` VALUES ('38', 'qwe', '23', '/upload_file/sale/1452683801020313.jpg', '12345444444', '2222', '222', '222');
INSERT INTO `qc` VALUES ('39', 'test2', '22', '/upload_file/sale/1452683827073313.jpg', '12376829999', '1111', '1111', '12312');
INSERT INTO `qc` VALUES ('40', 'houzhengwei', '27', '/upload_file/sale/1452685512880172ea326bb41ade4dd0c9ee1f9_560.jpg', '12376829999', '10000', '1000', 'adfasd');
INSERT INTO `qc` VALUES ('41', 'test3333', '24', '/upload_file/sale/14526861398242a4dd48315afcb5fb1f29f54b36ae79c.jpg', '12345444444', '1231', '111', 'asd');

-- ----------------------------
-- Table structure for `replay`
-- ----------------------------
DROP TABLE IF EXISTS `replay`;
CREATE TABLE `replay` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mid` int(4) DEFAULT NULL,
  `replay` varchar(200) DEFAULT NULL,
  `replayer` varchar(50) DEFAULT NULL,
  `replaytime` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of replay
-- ----------------------------
INSERT INTO `replay` VALUES ('8', '45', 'nihao霓虹', 'hzw', '2016-01-13 19:42:21');
INSERT INTO `replay` VALUES ('9', '47', '你好，我是管理员', 'hzw', '2016-01-13 19:53:04');

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `reasons` varchar(100) DEFAULT NULL,
  `dir` varchar(100) DEFAULT NULL,
  `record` varchar(100) DEFAULT NULL,
  `copyright` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', '汽车租赁管理系统', '汽车租赁管理系统', '汽车租赁管理系统', '汽车租赁管理系统', '汽车租赁管理系统', 'open', '汽车租赁管理系统', 'admin', '汽车租赁管理系统', '汽车租赁管理系统');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('22', 'hzw车', '2016-01-12 11:01:16');
INSERT INTO `type` VALUES ('23', '豪华', '2016-01-12 12:46:28');
INSERT INTO `type` VALUES ('24', '一般', '2016-01-12 12:46:33');
INSERT INTO `type` VALUES ('25', '客车', '2016-01-12 12:46:39');
INSERT INTO `type` VALUES ('26', 'hhhhhh', '2016-01-13 19:39:14');
INSERT INTO `type` VALUES ('27', 'houzhengwei', '2016-01-13 19:44:41');
INSERT INTO `type` VALUES ('28', '猴子', '2016-01-13 19:57:12');

-- ----------------------------
-- Table structure for `zc`
-- ----------------------------
DROP TABLE IF EXISTS `zc`;
CREATE TABLE `zc` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `qcid` varchar(50) DEFAULT NULL,
  `qcsj` varchar(50) DEFAULT NULL,
  `qcdd` varchar(50) DEFAULT NULL,
  `hcsj` varchar(50) DEFAULT NULL,
  `hcdd` varchar(50) DEFAULT NULL,
  `member` varchar(50) DEFAULT NULL,
  `zt` varchar(50) DEFAULT NULL,
  `xz` varchar(50) DEFAULT '未',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of zc
-- ----------------------------
INSERT INTO `zc` VALUES ('9', '39', '2016-01-12', 'hehe', '2016-01-13', 'hehe', 'xiaoqiang', '已审核', '未');
INSERT INTO `zc` VALUES ('10', '39', '2016-01-14', '我家', '2016-01-16', '你家', 'houzheng', '已审核', '已');
INSERT INTO `zc` VALUES ('11', '39', '2016-01-14', '仁爱学院', '2016-01-29', '哈啊哈', 'houzheng', '已审核', '未');
INSERT INTO `zc` VALUES ('13', '40', '2016-01-13', '仁爱学院', '2016-01-22', '呵呵', 'houzheng', '已审核', '未');
INSERT INTO `zc` VALUES ('14', '41', '2016-01-14', '请问', '2016-01-23', '阿三', 'houzheng', '已审核', '未');
