/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 09/06/2018 22:46:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作者',
  `authorId` int(11) NULL DEFAULT NULL COMMENT '作者id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '博客内容',
  `createTime` datetime NULL DEFAULT NULL COMMENT '发表时间',
  `mark` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签',
  `sorts` int(10) NULL DEFAULT NULL COMMENT '分类',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '随机一张图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '博客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 'xieyong', 'xieyong', 1, '346576898e02fjksndjksnjdkl;今年的理科九十八 的数据库懒得理你', '2018-05-26 18:19:59', 'spring', 1, 'static/assets/i/f18.jpg');
INSERT INTO `blog` VALUES (6, 'ceshi yixia ', '谢泳', 1, '老张得了一个闺女。老张说，挺好，就是大了别长得像我丽的手就伸进爸爸的嘴里。  说时迟，那时快，老张抬手就是一掌，把母女两个打了个趔趄。老张在地质队，天天握探锤打石头，手上总有百来斤的力气。老张的老婆没有提防，就跌到了。到底是母亲，着地的关头，一扭身仰着将美丽抓在胸口。  美丽大哭。老张的老婆脑后淌出血来，从来没有骂过人的人，骂人了，老张的老婆骂老张。 老张呆了，浑身哆嗦着，喘不出气来，汗从头上淌进领子里。  老张进了医院，两天一夜，才说出话来——   六零年，闹饥荒，饿死人，全国都闹，除了云南。那年，我毕业实习，进山找矿。  后来，我迷路了。有指南针，没用。我饿，我饿呀。慌，心慌，一慌就急。本来还会想，这下完了。一直就吃不够，体力差，肝里的糖说耗完就耗完。后来就出汗，后来汗也不出了。什么也不敢想，用脑子最消耗热量了。躺着。胃里冒酸水儿，杀得牙软。  后来，从肚子开始发热，脚心，脖子，指头尖儿，越来越烫。安徒生不是写过个卖火柴的小女孩儿吗？这个丹麦的老东西，他写得对。人饿死前，就是发热，热过了，就是死。  我没死。死了怎么还能跟你结婚？怎么还能有美丽？   我醒的时候，好半天才看得清东西。我瞧见远处有烟。当时，我只有一个念头儿，烧饭才会有烟。爬吧。 就别说怎么才爬到了吧。到了，是个人家。我趴在门口说，救个命吧，给口吃的吧。没人应。对，可能我的', '2018-05-26 18:42:39', 'es', 3, 'static/assets/i/f18.jpg');
INSERT INTO `blog` VALUES (2, 'ceshi yixia ', '谢泳', 1, '老张得了一个闺女。老张说，挺好，就是大了别长得像我丽的手就伸进爸爸的嘴里。  说时迟，那时快，老张抬手就是一掌，把母女两个打了个趔趄。老张在地质队，天天握探锤打石头，手上总有百来斤的力气。老张的老婆没有提防，就跌到了。到底是母亲，着地的关头，一扭身仰着将美丽抓在胸口。  美丽大哭。老张的老婆脑后淌出血来，从来没有骂过人的人，骂人了，老张的老婆骂老张。 老张呆了，浑身哆嗦着，喘不出气来，汗从头上淌进领子里。  老张进了医院，两天一夜，才说出话来——   六零年，闹饥荒，饿死人，全国都闹，除了云南。那年，我毕业实习，进山找矿。  后来，我迷路了。有指南针，没用。我饿，我饿呀。慌，心慌，一慌就急。本来还会想，这下完了。一直就吃不够，体力差，肝里的糖说耗完就耗完。后来就出汗，后来汗也不出了。什么也不敢想，用脑子最消耗热量了。躺着。胃里冒酸水儿，杀得牙软。  后来，从肚子开始发热，脚心，脖子，指头尖儿，越来越烫。安徒生不是写过个卖火柴的小女孩儿吗？这个丹麦的老东西，他写得对。人饿死前，就是发热，热过了，就是死。  我没死。死了怎么还能跟你结婚？怎么还能有美丽？   我醒的时候，好半天才看得清东西。我瞧见远处有烟。当时，我只有一个念头儿，烧饭才会有烟。爬吧。 就别说怎么才爬到了吧。到了，是个人家。我趴在门口说，救个命吧，给口吃的吧。没人应。对，可能我的', '2018-05-26 18:42:39', 'es', 3, 'static/assets/i/f18.jpg');
INSERT INTO `blog` VALUES (3, 'xieyong', 'xieyong', 1, '346576898e02fjksndjksnjdkl;今年的理科九十八 的数据库懒得理你', '2018-05-26 18:19:59', 'spring', 1, 'static/assets/i/f18.jpg');
INSERT INTO `blog` VALUES (4, 'ceshi yixia ', '谢泳', 1, '老张得了一个闺女。老张说，挺好，就是大了别长得像我丽的手就伸进爸爸的嘴里。  说时迟，那时快，老张抬手就是一掌，把母女两个打了个趔趄。老张在地质队，天天握探锤打石头，手上总有百来斤的力气。老张的老婆没有提防，就跌到了。到底是母亲，着地的关头，一扭身仰着将美丽抓在胸口。  美丽大哭。老张的老婆脑后淌出血来，从来没有骂过人的人，骂人了，老张的老婆骂老张。 老张呆了，浑身哆嗦着，喘不出气来，汗从头上淌进领子里。  老张进了医院，两天一夜，才说出话来——   六零年，闹饥荒，饿死人，全国都闹，除了云南。那年，我毕业实习，进山找矿。  后来，我迷路了。有指南针，没用。我饿，我饿呀。慌，心慌，一慌就急。本来还会想，这下完了。一直就吃不够，体力差，肝里的糖说耗完就耗完。后来就出汗，后来汗也不出了。什么也不敢想，用脑子最消耗热量了。躺着。胃里冒酸水儿，杀得牙软。  后来，从肚子开始发热，脚心，脖子，指头尖儿，越来越烫。安徒生不是写过个卖火柴的小女孩儿吗？这个丹麦的老东西，他写得对。人饿死前，就是发热，热过了，就是死。  我没死。死了怎么还能跟你结婚？怎么还能有美丽？   我醒的时候，好半天才看得清东西。我瞧见远处有烟。当时，我只有一个念头儿，烧饭才会有烟。爬吧。 就别说怎么才爬到了吧。到了，是个人家。我趴在门口说，救个命吧，给口吃的吧。没人应。对，可能我的', '2018-05-26 18:42:39', 'es', 3, 'static/assets/i/f18.jpg');
INSERT INTO `blog` VALUES (5, 'ceshi yixia ', '谢泳', 1, '老张得了一个闺女。老张说，挺好，就是大了别长得像我丽的手就伸进爸爸的嘴里。  说时迟，那时快，老张抬手就是一掌，把母女两个打了个趔趄。老张在地质队，天天握探锤打石头，手上总有百来斤的力气。老张的老婆没有提防，就跌到了。到底是母亲，着地的关头，一扭身仰着将美丽抓在胸口。  美丽大哭。老张的老婆脑后淌出血来，从来没有骂过人的人，骂人了，老张的老婆骂老张。 老张呆了，浑身哆嗦着，喘不出气来，汗从头上淌进领子里。  老张进了医院，两天一夜，才说出话来——   六零年，闹饥荒，饿死人，全国都闹，除了云南。那年，我毕业实习，进山找矿。  后来，我迷路了。有指南针，没用。我饿，我饿呀。慌，心慌，一慌就急。本来还会想，这下完了。一直就吃不够，体力差，肝里的糖说耗完就耗完。后来就出汗，后来汗也不出了。什么也不敢想，用脑子最消耗热量了。躺着。胃里冒酸水儿，杀得牙软。  后来，从肚子开始发热，脚心，脖子，指头尖儿，越来越烫。安徒生不是写过个卖火柴的小女孩儿吗？这个丹麦的老东西，他写得对。人饿死前，就是发热，热过了，就是死。  我没死。死了怎么还能跟你结婚？怎么还能有美丽？   我醒的时候，好半天才看得清东西。我瞧见远处有烟。当时，我只有一个念头儿，烧饭才会有烟。爬吧。 就别说怎么才爬到了吧。到了，是个人家。我趴在门口说，救个命吧，给口吃的吧。没人应。对，可能我的', '2018-05-26 18:42:39', 'es', 3, 'static/assets/i/f18.jpg');

-- ----------------------------
-- Table structure for markword
-- ----------------------------
DROP TABLE IF EXISTS `markword`;
CREATE TABLE `markword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '博客标签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '博客类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户密码',
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '格言',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
