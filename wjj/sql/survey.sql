/*
Navicat MySQL Data Transfer

Source Server         : 000
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : survey

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-04-15 19:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_release
-- ----------------------------
DROP TABLE IF EXISTS `admin_release`;
CREATE TABLE `admin_release` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `over_time` datetime DEFAULT NULL COMMENT '结束时间',
  `release` bit(10) DEFAULT b'0' COMMENT '发布状态',
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_release
-- ----------------------------
INSERT INTO `admin_release` VALUES ('1', '不医灵魂', '2021-03-24 18:56:37', '2021-03-24 18:56:42', '2021-03-24 18:56:46', '\0\0', null);
INSERT INTO `admin_release` VALUES ('2', ' 查理九世', '2021-03-24 19:31:12', '2021-03-24 19:31:15', '2021-03-24 19:31:18', '\0\0', null);
INSERT INTO `admin_release` VALUES ('3', '狼图腾', '2021-03-24 19:34:46', '2021-03-25 19:34:49', '2021-03-23 19:34:53', '\0', null);
INSERT INTO `admin_release` VALUES ('4', '三不知', '2021-03-11 10:17:51', '2021-03-24 10:17:55', '2021-03-26 10:17:59', '\0\0', null);
INSERT INTO `admin_release` VALUES ('5', '残酷月光', '2021-03-24 10:18:26', '2021-03-25 10:18:30', '2021-03-26 10:18:34', '\0\0', null);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `admin_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(255) DEFAULT NULL COMMENT '管理员名称',
  `admin_password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', '12', '12');

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '答案id',
  `answer_pid` int(32) DEFAULT NULL COMMENT '问卷表id',
  `answer_uid` int(255) DEFAULT NULL COMMENT '填写人id',
  `answer_date` date DEFAULT NULL COMMENT '填写时间',
  PRIMARY KEY (`answer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('53', '143', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('54', '143', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('55', '143', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('56', '143', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('57', '143', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('58', '144', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('59', '144', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('60', '148', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('61', '148', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('62', '148', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('63', '148', '14', '2021-04-08');
INSERT INTO `answer` VALUES ('64', '149', '5', '2021-04-09');
INSERT INTO `answer` VALUES ('65', '149', '5', '2021-04-09');
INSERT INTO `answer` VALUES ('66', '149', '5', '2021-04-09');

-- ----------------------------
-- Table structure for answer_dat
-- ----------------------------
DROP TABLE IF EXISTS `answer_dat`;
CREATE TABLE `answer_dat` (
  `dat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ans_id` int(11) DEFAULT NULL COMMENT '问卷id',
  `ordtm` int(11) DEFAULT NULL COMMENT '题目序号',
  `an_data` varchar(255) DEFAULT NULL COMMENT '题目答案',
  PRIMARY KEY (`dat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer_dat
-- ----------------------------
INSERT INTO `answer_dat` VALUES ('47', '143', '1', '钢铁侠');
INSERT INTO `answer_dat` VALUES ('48', '143', '2', '绿巨人');
INSERT INTO `answer_dat` VALUES ('49', '143', '2', '钢铁侠');
INSERT INTO `answer_dat` VALUES ('50', '143', '2', '黑寡妇');
INSERT INTO `answer_dat` VALUES ('51', '143', '3', '复仇者联盟');
INSERT INTO `answer_dat` VALUES ('52', '144', '1', '是是是');
INSERT INTO `answer_dat` VALUES ('53', '144', '2', '不是不是');
INSERT INTO `answer_dat` VALUES ('54', '148', '1', '选择1');
INSERT INTO `answer_dat` VALUES ('55', '148', '2', '选择1');
INSERT INTO `answer_dat` VALUES ('56', '148', '3', '44');
INSERT INTO `answer_dat` VALUES ('57', '148', '4', '55');
INSERT INTO `answer_dat` VALUES ('58', '149', '1', '不困难');
INSERT INTO `answer_dat` VALUES ('59', '149', '2', 'php');
INSERT INTO `answer_dat` VALUES ('60', '149', '3', '好东西');

-- ----------------------------
-- Table structure for circle
-- ----------------------------
DROP TABLE IF EXISTS `circle`;
CREATE TABLE `circle` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '发布id',
  `title` varchar(255) DEFAULT NULL COMMENT '问卷标题',
  `time` date DEFAULT NULL COMMENT '发布时间',
  `issuer` varchar(255) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of circle
-- ----------------------------
INSERT INTO `circle` VALUES ('1', 'sbws', '2020-03-26', '纹身');

-- ----------------------------
-- Table structure for home_user
-- ----------------------------
DROP TABLE IF EXISTS `home_user`;
CREATE TABLE `home_user` (
  `front_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `front_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `front_password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `front_sid` int(32) DEFAULT NULL COMMENT '问卷id',
  `front_account` varchar(255) DEFAULT NULL COMMENT '账号类型',
  `front_email` varchar(255) DEFAULT NULL COMMENT '邮件地址',
  `front_phone` int(11) DEFAULT NULL COMMENT '手机号码',
  `front_wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`front_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_user
-- ----------------------------
INSERT INTO `home_user` VALUES ('5', '123456', '123456', '0', '', '', '0', '');
INSERT INTO `home_user` VALUES ('6', 'username', 'password', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('7', 'username', 'password', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('8', '7457', '75775', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('17', '123456789', '123456789', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('10', '74567', '45645', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('11', '456354', '674678', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('13', '786786', '786786', null, null, null, null, null);
INSERT INTO `home_user` VALUES ('14', '88488', '8848', '587', '87578', '5375', '78378', '786378');
INSERT INTO `home_user` VALUES ('15', '666', '666', null, null, null, null, null);

-- ----------------------------
-- Table structure for opti
-- ----------------------------
DROP TABLE IF EXISTS `opti`;
CREATE TABLE `opti` (
  `opti_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `opti_wid` int(32) DEFAULT NULL COMMENT '问题id',
  `opti_nono` int(32) DEFAULT NULL COMMENT '选项编号',
  `opti_text` varchar(255) DEFAULT NULL COMMENT '选项内容',
  `opti_state` varchar(255) DEFAULT NULL COMMENT '选中状态',
  PRIMARY KEY (`opti_id`),
  KEY `opti_wid` (`opti_wid`)
) ENGINE=MyISAM AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opti
-- ----------------------------
INSERT INTO `opti` VALUES ('293', '168', '1', '钢铁侠', 'false');
INSERT INTO `opti` VALUES ('294', '168', '2', '黑寡妇', 'false');
INSERT INTO `opti` VALUES ('295', '169', '1', '黑寡妇', 'false');
INSERT INTO `opti` VALUES ('296', '169', '2', '钢铁侠', 'false');
INSERT INTO `opti` VALUES ('297', '169', '3', '绿巨人', 'false');
INSERT INTO `opti` VALUES ('298', '170', '1', '', null);
INSERT INTO `opti` VALUES ('299', '170', '2', '', null);
INSERT INTO `opti` VALUES ('300', '171', '1', '', null);
INSERT INTO `opti` VALUES ('301', '171', '2', '', null);
INSERT INTO `opti` VALUES ('302', '172', '1', '', null);
INSERT INTO `opti` VALUES ('303', '172', '2', '', null);
INSERT INTO `opti` VALUES ('304', '173', '1', '', null);
INSERT INTO `opti` VALUES ('305', '173', '2', '', null);
INSERT INTO `opti` VALUES ('306', '174', '1', '', null);
INSERT INTO `opti` VALUES ('307', '174', '2', '', null);
INSERT INTO `opti` VALUES ('308', '175', '1', '', null);
INSERT INTO `opti` VALUES ('309', '175', '2', '', null);
INSERT INTO `opti` VALUES ('310', '176', '1', '', null);
INSERT INTO `opti` VALUES ('311', '176', '2', '', null);
INSERT INTO `opti` VALUES ('312', '177', '1', '', null);
INSERT INTO `opti` VALUES ('313', '177', '2', '', null);
INSERT INTO `opti` VALUES ('314', '178', '1', '选择1', 'false');
INSERT INTO `opti` VALUES ('315', '178', '2', '选择2', 'false');
INSERT INTO `opti` VALUES ('316', '179', '1', '', null);
INSERT INTO `opti` VALUES ('317', '179', '2', '', null);
INSERT INTO `opti` VALUES ('318', '180', '1', '', null);
INSERT INTO `opti` VALUES ('319', '180', '2', '', null);
INSERT INTO `opti` VALUES ('320', '181', '1', '', null);
INSERT INTO `opti` VALUES ('321', '181', '2', '', null);
INSERT INTO `opti` VALUES ('322', '182', '1', '', null);
INSERT INTO `opti` VALUES ('323', '182', '2', '', null);
INSERT INTO `opti` VALUES ('324', '183', '1', '选择1', 'false');
INSERT INTO `opti` VALUES ('325', '183', '2', '选择2', 'false');
INSERT INTO `opti` VALUES ('326', '184', '1', '选择1', 'false');
INSERT INTO `opti` VALUES ('327', '184', '2', '选择2', 'false');
INSERT INTO `opti` VALUES ('328', '185', '1', '', null);
INSERT INTO `opti` VALUES ('329', '185', '2', '', null);
INSERT INTO `opti` VALUES ('330', '186', '1', '', null);
INSERT INTO `opti` VALUES ('331', '186', '2', '', null);
INSERT INTO `opti` VALUES ('332', '187', '1', '困难', 'false');
INSERT INTO `opti` VALUES ('333', '187', '2', '不困难', 'false');
INSERT INTO `opti` VALUES ('334', '188', '1', 'js', 'false');
INSERT INTO `opti` VALUES ('335', '188', '2', 'php', 'false');
INSERT INTO `opti` VALUES ('336', '188', '3', 'java', 'false');
INSERT INTO `opti` VALUES ('337', '189', '1', '', null);
INSERT INTO `opti` VALUES ('338', '189', '2', '', null);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `ques_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `ques_sid` int(32) DEFAULT NULL COMMENT '问卷id',
  `ques_type` varchar(255) DEFAULT NULL COMMENT '问题类型',
  `ques_name` varchar(255) DEFAULT NULL COMMENT '问题主题',
  `ques_tion` int(255) DEFAULT NULL COMMENT '问题编号',
  `quer_ired` int(32) DEFAULT NULL COMMENT '是否必填',
  `quer_text` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`ques_id`),
  KEY `ques_sid` (`ques_sid`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('168', '143', 'radio', '选择你喜欢的超级英雄', '1', null, null);
INSERT INTO `question` VALUES ('169', '143', 'checkbox', '选择的超级英雄(多选)', '2', null, null);
INSERT INTO `question` VALUES ('170', '143', '', '谈一谈复仇者联盟好看还是正义联盟好看', '3', null, null);
INSERT INTO `question` VALUES ('171', '144', '', '.请输入题目', '1', null, null);
INSERT INTO `question` VALUES ('172', '144', '', '.请输入题目', '2', null, null);
INSERT INTO `question` VALUES ('173', '145', '', '.请输入题目', '1', null, null);
INSERT INTO `question` VALUES ('174', '145', '', '.请输入题目', '2', null, null);
INSERT INTO `question` VALUES ('175', '146', '', '.请输入题目', '1', null, null);
INSERT INTO `question` VALUES ('176', '146', '', '.请输入题目', '2', null, null);
INSERT INTO `question` VALUES ('177', '146', '', '.请输入题目', '3', null, null);
INSERT INTO `question` VALUES ('178', '146', 'radio', '.请输入题目', '4', null, null);
INSERT INTO `question` VALUES ('179', '147', '', '.请输入题目', '1', null, null);
INSERT INTO `question` VALUES ('180', '147', '', '.请输入题目', '2', null, null);
INSERT INTO `question` VALUES ('181', '147', '', '.请输入题目', '3', null, null);
INSERT INTO `question` VALUES ('182', '147', '', '.请输入题目', '4', null, null);
INSERT INTO `question` VALUES ('183', '148', 'radio', '.请输入题目', '1', null, null);
INSERT INTO `question` VALUES ('184', '148', 'checkbox', '.请输入题目', '2', null, null);
INSERT INTO `question` VALUES ('185', '148', '', '.请输入题目', '3', null, null);
INSERT INTO `question` VALUES ('186', '148', '', '.请输入题目', '4', null, null);
INSERT INTO `question` VALUES ('187', '149', 'radio', '你觉得学习php困难吗？', '1', null, null);
INSERT INTO `question` VALUES ('188', '149', 'checkbox', '下面你喜欢哪一些？', '2', null, null);
INSERT INTO `question` VALUES ('189', '149', '', '谈一谈你对php的了解', '3', null, null);

-- ----------------------------
-- Table structure for survey_info
-- ----------------------------
DROP TABLE IF EXISTS `survey_info`;
CREATE TABLE `survey_info` (
  `survey_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '调查表id',
  `survey_name` varchar(255) NOT NULL COMMENT '调查表名称',
  `surve_brief` varchar(255) DEFAULT NULL COMMENT '问卷介绍',
  `survey_send_time` datetime DEFAULT NULL COMMENT '结束时间',
  `user_id` int(255) NOT NULL COMMENT '用户id',
  `inser_time` datetime DEFAULT NULL COMMENT '插入时间',
  `survey_add_time` datetime DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey_info
-- ----------------------------
INSERT INTO `survey_info` VALUES ('144', '发生大事', '', null, '14', '2021-04-08 11:38:59', null);
INSERT INTO `survey_info` VALUES ('145', '阿斯达', '', null, '14', '2021-04-08 11:53:09', null);
INSERT INTO `survey_info` VALUES ('146', '阿斯达啊', '', null, '14', '2021-04-08 11:54:44', null);
INSERT INTO `survey_info` VALUES ('147', '你觉得11', '', null, '14', '2021-04-08 11:58:22', null);
INSERT INTO `survey_info` VALUES ('148', '复仇者联盟aa', '', null, '14', '2021-04-08 11:58:55', null);
INSERT INTO `survey_info` VALUES ('149', 'php', '学习php', null, '14', '2021-04-09 01:12:51', null);
