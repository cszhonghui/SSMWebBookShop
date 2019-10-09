-- MySQL dump 10.13
--
-- Host: localhost    Database: webbookshop
-- ------------------------------------------------------
-- Server version	6.0.4-alpha-community-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_administrator`
--

DROP TABLE IF EXISTS `t_administrator`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_administrator` (
  `a_id` int(4) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(16) NOT NULL,
  `a_password` varchar(16) NOT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `a_username` (`a_username`)
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_administrator`
--

LOCK TABLES `t_administrator` WRITE;
/*!40000 ALTER TABLE `t_administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_book`
--

DROP TABLE IF EXISTS `t_book`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_book` (
  `b_id` int(8) NOT NULL AUTO_INCREMENT,
  `b_isbn` varchar(13) NOT NULL,
  `b_name` varchar(50) NOT NULL,
  `b_author` varchar(30) NOT NULL,
  `b_publisher` varchar(20) NOT NULL,
  `b_price` float NOT NULL,
  `bt_id` int(8) NOT NULL,
  `b_pic` varchar(50) NOT NULL,
  `b_stock` int(6) NOT NULL,
  `b_content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  UNIQUE KEY `b_isbn` (`b_isbn`)
) ENGINE=MyISAM AUTO_INCREMENT=100011 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_book`
--

LOCK TABLES `t_book` WRITE;
/*!40000 ALTER TABLE `t_book` DISABLE KEYS */;
INSERT INTO `t_book` VALUES (100007,'131331313','外科风云','朱朱','浙江文艺出版社',78,1,'16.jpg',2,'正午阳光影业继《琅琊榜》《欢乐颂》后，又一热播医疗职场励志剧同名小说。直击中国医患矛盾的情感极致力作，温暖而明亮的职场励志小说。老干部靳东演绎的中国医疗精英。'),(100008,'12323211','追风筝的人','[美]卡勒德·胡赛尼（Khaled Hosseini）','上海人民出版社',17,1002,'12.jpg',93,'中文版，快乐大本营高圆圆感动推荐，奥巴马送给女儿的新年礼物。为你，千千万万遍！'),(100009,'12321321','从你的全世界路过','张嘉佳 ','湖南文艺出版社',1001,3,'13.jpg',99,'2015央视年度好书，近二十年华语小说销量奇迹，超40亿阅读，每个故事都在变成电影，每一分钟，都有人看到自己。张嘉佳献给你的心动故事！'),(100010,'133444344','解忧杂货店','(日)东野圭吾','南海出版公司',27,1004,'14.jpg',52,'《白夜行》后东野圭吾备受欢迎作品：不是推理小说，却更扣人心弦');
/*!40000 ALTER TABLE `t_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_booktype`
--

DROP TABLE IF EXISTS `t_booktype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_booktype` (
  `bt_id` int(4) NOT NULL AUTO_INCREMENT,
  `bt_name` varchar(50) NOT NULL,
  PRIMARY KEY (`bt_id`),
  UNIQUE KEY `bt_name` (`bt_name`)
) ENGINE=MyISAM AUTO_INCREMENT=1011 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_booktype`
--

LOCK TABLES `t_booktype` WRITE;
/*!40000 ALTER TABLE `t_booktype` DISABLE KEYS */;
INSERT INTO `t_booktype` VALUES (1006,'教育'),(1007,'励志'),(1008,'感悟'),(1009,'文学'),(1010,'计算机');
/*!40000 ALTER TABLE `t_booktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cart`
--

DROP TABLE IF EXISTS `t_cart`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_cart` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(8) NOT NULL,
  `b_id` int(8) NOT NULL,
  `c_bnum` int(5) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000053 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_cart`
--

LOCK TABLES `t_cart` WRITE;
/*!40000 ALTER TABLE `t_cart` DISABLE KEYS */;
INSERT INTO `t_cart` VALUES (100000050,1000001,100001,3),(100000051,1000001,100003,5),(100000052,1000001,100006,7);
/*!40000 ALTER TABLE `t_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `b_id` int(8) NOT NULL,
  `u_id` int(8) NOT NULL,
  `c_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000017 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (10000014,100001,1000001,'2019-08-29 07:16:38','书真的不错奥，，，厉害！！！！！'),(10000015,100002,1000001,'2019-08-29 07:16:38','书很好很好的，，，牛！！！！！'),(10000016,100003,1000002,'2019-08-29 07:16:38','我是被迫来评论的，，，呜呜呜！！！！！');
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_history`
--

DROP TABLE IF EXISTS `t_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_history` (
  `h_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(8) NOT NULL,
  `b_id` int(8) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_history`
--

LOCK TABLES `t_history` WRITE;
/*!40000 ALTER TABLE `t_history` DISABLE KEYS */;
INSERT INTO `t_history` VALUES (4,1000001,100001),(5,1000001,100002),(6,1000002,100002);
/*!40000 ALTER TABLE `t_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_order` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(8) NOT NULL,
  `r_id` int(8) DEFAULT NULL,
  `o_amount` double NOT NULL,
  `o_opdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `o_number` varchar(20) NOT NULL,
  `o_status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `o_number` (`o_number`)
) ENGINE=MyISAM AUTO_INCREMENT=10000078 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (10000076,1000001,1000001,186,'2019-08-29 07:17:09','ls1231456',0),(10000077,1000001,1000001,250,'2019-08-29 07:17:10','ls888888',1);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orderdetail`
--

DROP TABLE IF EXISTS `t_orderdetail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_orderdetail` (
  `od_id` int(10) NOT NULL AUTO_INCREMENT,
  `o_number` varchar(20) NOT NULL,
  `b_id` int(8) NOT NULL,
  `b_num` int(4) NOT NULL,
  `od_comStatus` int(1) NOT NULL DEFAULT '1',
  `od_price` double NOT NULL,
  PRIMARY KEY (`od_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000016 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_orderdetail`
--

LOCK TABLES `t_orderdetail` WRITE;
/*!40000 ALTER TABLE `t_orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_receive`
--

DROP TABLE IF EXISTS `t_receive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_receive` (
  `r_id` int(8) NOT NULL AUTO_INCREMENT,
  `u_id` int(8) NOT NULL,
  `r_phone` varchar(12) NOT NULL,
  `r_mailaddr` varchar(50) NOT NULL,
  `r_targetname` varchar(10) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000015 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_receive`
--

LOCK TABLES `t_receive` WRITE;
/*!40000 ALTER TABLE `t_receive` DISABLE KEYS */;
INSERT INTO `t_receive` VALUES (1000010,1000001,'13333333333','home','战三'),(1000011,1000002,'1444444444','内蒙古带学','李四'),(1000012,1000003,'1444444444','内蒙古农业带学','王五'),(1000013,1000001,'121233113','呼和浩特','张三'),(1000014,1000001,'144444443','包头市','李四');
/*!40000 ALTER TABLE `t_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `t_user` (
  `u_id` int(8) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(16) NOT NULL,
  `u_password` varchar(16) NOT NULL,
  `u_email` varchar(30) NOT NULL,
  `u_phone` varchar(11) DEFAULT NULL,
  `u_gender` int(1) DEFAULT NULL,
  `u_birthdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_username` (`u_username`)
) ENGINE=MyISAM AUTO_INCREMENT=1000022 DEFAULT CHARSET=gbk;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1000019,'张三','w8G/hOj4MbU=','zhangsan@gmail.com','121313131',1,'2019-08-29 07:16:30','u1.jpg'),(1000020,'李四','w8G/hOj4MbU=','lisi@gmail.com','121313131',0,'2019-08-29 07:16:30','u2.jpg'),(1000021,'王五','w8G/hOj4MbU=','wangwu@gmail.com','121313131',1,'2019-08-29 07:16:31','u3.jpg');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-29  7:18:02
