/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : shopping_chart

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-05-14 22:23:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'book', '2', 'image/book.png');
INSERT INTO `goods` VALUES ('2', 'pen', '1.5', 'image/pen.png');
INSERT INTO `goods` VALUES ('3', 'bag', '30', 'image/bag.png');
INSERT INTO `goods` VALUES ('4', 'pencil', '1', 'image/pencil.png');

-- ----------------------------
-- Table structure for user_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `user_shoppingcart`;
CREATE TABLE `user_shoppingcart` (
  `good_id` int(11) NOT NULL,
  `good_num` int(11) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_shoppingcart
-- ----------------------------
INSERT INTO `user_shoppingcart` VALUES ('2', '2', '3');
INSERT INTO `user_shoppingcart` VALUES ('3', '1', '30');
INSERT INTO `user_shoppingcart` VALUES ('4', '1', '1');
