/*
Navicat MySQL Data Transfer

Source Server         : hibernateDB
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : emousika

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-19 15:26:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advice`
-- ----------------------------
DROP TABLE IF EXISTS `advice`;
CREATE TABLE `advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advice
-- ----------------------------

-- ----------------------------
-- Table structure for `annoucement`
-- ----------------------------
DROP TABLE IF EXISTS `annoucement`;
CREATE TABLE `annoucement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` longtext NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of annoucement
-- ----------------------------

-- ----------------------------
-- Table structure for `areadict`
-- ----------------------------
DROP TABLE IF EXISTS `areadict`;
CREATE TABLE `areadict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(20) NOT NULL,
  `areaCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areadict
-- ----------------------------
INSERT INTO `areadict` VALUES ('1', '大数据', '1');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `link` varchar(200) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `savetime` datetime(6) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `pubtime` date NOT NULL,
  `isNews` tinyint(1) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_area_id_347f4878_fk_areaDict_id` (`area_id`),
  CONSTRAINT `article_area_id_347f4878_fk_areaDict_id` FOREIGN KEY (`area_id`) REFERENCES `areadict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '阿斯蒂芬', '阿斯蒂芬如果', '', '', '2018-04-19 15:21:33.961841', '百科', '0', '2018-04-19', '0', '1');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add log entry', '6', 'add_log');
INSERT INTO `auth_permission` VALUES ('22', 'Can change log entry', '6', 'change_log');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete log entry', '6', 'delete_log');
INSERT INTO `auth_permission` VALUES ('24', 'Can add User Setting', '7', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('25', 'Can change User Setting', '7', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete User Setting', '7', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('27', 'Can add User Widget', '8', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('28', 'Can change User Widget', '8', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete User Widget', '8', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('30', 'Can add Bookmark', '9', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('31', 'Can change Bookmark', '9', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('32', 'Can delete Bookmark', '9', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('33', 'Can view Bookmark', '9', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('34', 'Can view log entry', '6', 'view_log');
INSERT INTO `auth_permission` VALUES ('35', 'Can view User Setting', '7', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('36', 'Can view User Widget', '8', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('37', 'Can add version', '10', 'add_version');
INSERT INTO `auth_permission` VALUES ('38', 'Can change version', '10', 'change_version');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete version', '10', 'delete_version');
INSERT INTO `auth_permission` VALUES ('40', 'Can add revision', '11', 'add_revision');
INSERT INTO `auth_permission` VALUES ('41', 'Can change revision', '11', 'change_revision');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete revision', '11', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('43', 'Can view revision', '11', 'view_revision');
INSERT INTO `auth_permission` VALUES ('44', 'Can view version', '10', 'view_version');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 书籍', '12', 'add_book');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 书籍', '12', 'change_book');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 书籍', '12', 'delete_book');
INSERT INTO `auth_permission` VALUES ('48', 'Can add 视频', '13', 'add_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can change 视频', '13', 'change_video');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete 视频', '13', 'delete_video');
INSERT INTO `auth_permission` VALUES ('51', 'Can add 领域', '14', 'add_areadict');
INSERT INTO `auth_permission` VALUES ('52', 'Can change 领域', '14', 'change_areadict');
INSERT INTO `auth_permission` VALUES ('53', 'Can delete 领域', '14', 'delete_areadict');
INSERT INTO `auth_permission` VALUES ('54', 'Can add 文章', '15', 'add_article');
INSERT INTO `auth_permission` VALUES ('55', 'Can change 文章', '15', 'change_article');
INSERT INTO `auth_permission` VALUES ('56', 'Can delete 文章', '15', 'delete_article');
INSERT INTO `auth_permission` VALUES ('57', 'Can view 领域', '14', 'view_areadict');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 文章', '15', 'view_article');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 书籍', '12', 'view_book');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 视频', '13', 'view_video');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 课件', '16', 'add_material');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 课件', '16', 'change_material');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 课件', '16', 'delete_material');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 题库试题', '17', 'add_question');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 题库试题', '17', 'change_question');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 题库试题', '17', 'delete_question');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 选项', '18', 'add_choice');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 选项', '18', 'change_choice');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 选项', '18', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 课堂测验', '19', 'add_testpaper');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 课堂测验', '19', 'change_testpaper');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 课堂测验', '19', 'delete_testpaper');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 选项', '18', 'view_choice');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 课件', '16', 'view_material');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 题库试题', '17', 'view_question');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课堂测验', '19', 'view_testpaper');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 学生分享', '20', 'add_share');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 学生分享', '20', 'change_share');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 学生分享', '20', 'delete_share');
INSERT INTO `auth_permission` VALUES ('80', 'Can add 教学通知', '21', 'add_announcement');
INSERT INTO `auth_permission` VALUES ('81', 'Can change 教学通知', '21', 'change_announcement');
INSERT INTO `auth_permission` VALUES ('82', 'Can delete 教学通知', '21', 'delete_announcement');
INSERT INTO `auth_permission` VALUES ('83', 'Can add 教学建议', '22', 'add_advice');
INSERT INTO `auth_permission` VALUES ('84', 'Can change 教学建议', '22', 'change_advice');
INSERT INTO `auth_permission` VALUES ('85', 'Can delete 教学建议', '22', 'delete_advice');
INSERT INTO `auth_permission` VALUES ('86', 'Can add 学生管理', '23', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('87', 'Can change 学生管理', '23', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('88', 'Can delete 学生管理', '23', 'delete_userprofile');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) NOT NULL,
  `discription` longtext NOT NULL,
  `img` varchar(100) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `author` varchar(30) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `savetime` datetime(6) NOT NULL,
  `pubtime` date NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_area_id_340b5bcf_fk_areaDict_id` (`area_id`),
  CONSTRAINT `book_area_id_340b5bcf_fk_areaDict_id` FOREIGN KEY (`area_id`) REFERENCES `areadict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for `choice`
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choiceText` varchar(100) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Choice_question_id_806517f8_fk_question_id` (`question_id`),
  CONSTRAINT `Choice_question_id_806517f8_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of choice
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('18', 'inClass', 'choice');
INSERT INTO `django_content_type` VALUES ('16', 'inClass', 'material');
INSERT INTO `django_content_type` VALUES ('17', 'inClass', 'question');
INSERT INTO `django_content_type` VALUES ('19', 'inClass', 'testpaper');
INSERT INTO `django_content_type` VALUES ('22', 'interaction', 'advice');
INSERT INTO `django_content_type` VALUES ('21', 'interaction', 'announcement');
INSERT INTO `django_content_type` VALUES ('20', 'interaction', 'share');
INSERT INTO `django_content_type` VALUES ('23', 'interaction', 'userprofile');
INSERT INTO `django_content_type` VALUES ('14', 'resource', 'areadict');
INSERT INTO `django_content_type` VALUES ('15', 'resource', 'article');
INSERT INTO `django_content_type` VALUES ('12', 'resource', 'book');
INSERT INTO `django_content_type` VALUES ('13', 'resource', 'video');
INSERT INTO `django_content_type` VALUES ('11', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('10', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('6', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('7', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'resource', '0001_initial', '2018-04-19 15:17:10.493310');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0001_initial', '2018-04-19 15:17:10.984837');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0002_remove_content_type_name', '2018-04-19 15:17:12.013033');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0001_initial', '2018-04-19 15:17:16.000825');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2018-04-19 15:17:17.677781');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2018-04-19 15:17:17.726806');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2018-04-19 15:17:17.783997');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2018-04-19 15:17:17.826258');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2018-04-19 15:17:17.866154');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0007_alter_validators_add_error_messages', '2018-04-19 15:17:17.903912');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0008_alter_user_username_max_length', '2018-04-19 15:17:17.949381');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0009_alter_user_last_name_max_length', '2018-04-19 15:17:17.993112');
INSERT INTO `django_migrations` VALUES ('13', 'interaction', '0001_initial', '2018-04-19 15:17:28.730944');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0001_initial', '2018-04-19 15:17:30.940987');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0002_logentry_remove_auto_add', '2018-04-19 15:17:31.039679');
INSERT INTO `django_migrations` VALUES ('16', 'inClass', '0001_initial', '2018-04-19 15:17:36.438234');
INSERT INTO `django_migrations` VALUES ('17', 'reversion', '0001_initial', '2018-04-19 15:17:40.924190');
INSERT INTO `django_migrations` VALUES ('18', 'reversion', '0002_auto_20141216_1509', '2018-04-19 15:17:40.960217');
INSERT INTO `django_migrations` VALUES ('19', 'reversion', '0003_auto_20160601_1600', '2018-04-19 15:17:40.990240');
INSERT INTO `django_migrations` VALUES ('20', 'reversion', '0004_auto_20160611_1202', '2018-04-19 15:17:41.025824');
INSERT INTO `django_migrations` VALUES ('21', 'sessions', '0001_initial', '2018-04-19 15:17:41.648684');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0001_initial', '2018-04-19 15:17:46.386910');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0002_log', '2018-04-19 15:17:48.832598');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0003_auto_20160715_0100', '2018-04-19 15:17:49.739553');
INSERT INTO `django_migrations` VALUES ('25', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2018-04-19 15:17:49.781582');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5z0r32lbs8ixbfb5bs6t8q8q0gcj00mf', 'MmE4ZDE2MWEwNGVkY2Q5ZGRkMDRhYmQxMmViNWQ1MzMyNGM0MDI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siaW50ZXJhY3Rpb24iLCJzaGFyZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiYmFlYzEyM2M3OTlkMzc5NDI1YTY1MThiMDRiNWIwMWVlNTYzYTgzZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-05-03 15:25:27.023400');

-- ----------------------------
-- Table structure for `meterial`
-- ----------------------------
DROP TABLE IF EXISTS `meterial`;
CREATE TABLE `meterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) NOT NULL,
  `slice` varchar(100) NOT NULL,
  `upload_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meterial
-- ----------------------------

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(100) NOT NULL,
  `answer` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for `reversion_revision`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_user_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for `reversion_version`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `reason` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `share_time` datetime(6) NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `share_area_id_4b177f9b_fk_areaDict_id` (`area_id`),
  KEY `share_student_id_0dac7c5b_fk_user_id` (`student_id`),
  CONSTRAINT `share_area_id_4b177f9b_fk_areaDict_id` FOREIGN KEY (`area_id`) REFERENCES `areadict` (`id`),
  CONSTRAINT `share_student_id_0dac7c5b_fk_user_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('1', '很想', '1', '阿斯蒂芬as水电费水电费是', '发送到发广告', '0', '2018-04-19 15:25:26.801226', '2018-04-19 15:25:26.801226', '1', '1');

-- ----------------------------
-- Table structure for `testpaper`
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `number` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testpaper
-- ----------------------------

-- ----------------------------
-- Table structure for `testpaper_questions`
-- ----------------------------
DROP TABLE IF EXISTS `testpaper_questions`;
CREATE TABLE `testpaper_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testpaper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testpaper_questions_testpaper_id_question_id_27caee63_uniq` (`testpaper_id`,`question_id`),
  KEY `testpaper_questions_question_id_fd95f126_fk_question_id` (`question_id`),
  CONSTRAINT `testpaper_questions_question_id_fd95f126_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `testpaper_questions_testpaper_id_3ebc6d2b_fk_testpaper_id` FOREIGN KEY (`testpaper_id`) REFERENCES `testpaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testpaper_questions
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'pbkdf2_sha256$100000$p8cYZpG60S0H$azSrhf2Q/ulF1V/pZuJK1Ze7GwChvUzdcRXPrRk43oc=', '2018-04-19 15:18:59.917189', '1', 'zjp', '', '', '1440409921@qq.com', '1', '1', '2018-04-19 15:18:32.173144');

-- ----------------------------
-- Table structure for `user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_userprofile_id_group_id_4f89dcbd_uniq` (`userprofile_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_userprofile_id_beb76c2d_fk_user_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `user_interest`
-- ----------------------------
DROP TABLE IF EXISTS `user_interest`;
CREATE TABLE `user_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `areadict_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_interest_userprofile_id_areadict_id_72e95eeb_uniq` (`userprofile_id`,`areadict_id`),
  KEY `user_interest_areadict_id_8c85b401_fk_areaDict_id` (`areadict_id`),
  CONSTRAINT `user_interest_areadict_id_8c85b401_fk_areaDict_id` FOREIGN KEY (`areadict_id`) REFERENCES `areadict` (`id`),
  CONSTRAINT `user_interest_userprofile_id_d8089af7_fk_user_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_interest
-- ----------------------------

-- ----------------------------
-- Table structure for `user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `user_user_permissions`;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_userprofile_id_permission_id_4ee72930_uniq` (`userprofile_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_userprofile_id_e8e85966_fk_user_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `savetime` datetime(6) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `link` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `pubtime` date NOT NULL,
  `resource` varchar(100) DEFAULT NULL,
  `summary` longtext,
  `area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_area_id_0348be64_fk_areaDict_id` (`area_id`),
  CONSTRAINT `video_area_id_0348be64_fk_areaDict_id` FOREIGN KEY (`area_id`) REFERENCES `areadict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-04-19 15:21:19.259545', '127.0.0.1', '1', '大数据', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-04-19 15:21:33.984927', '127.0.0.1', '1', '阿斯蒂芬', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-04-19 15:25:26.833528', '127.0.0.1', '1', '很想', 'create', '已添加。', '20', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
