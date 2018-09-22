/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 5.6.21-log : Database - healerworld
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`healerworld` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `healerworld`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `aid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `visitTime` varchar(100) DEFAULT NULL,
  `did` bigint(20) NOT NULL,
  `name` varchar(64) NOT NULL,
  `idcast` varchar(20) DEFAULT NULL,
  `aphone` varchar(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`,`did`),
  UNIQUE KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `appointment` */

insert  into `appointment`(`aid`,`uid`,`visitTime`,`did`,`name`,`idcast`,`aphone`,`createtime`,`updatetime`) values (151168892600380,151093275581282,'2017年-11月-28日(星期二)下午',1,'潘伟明','123','123','2017-11-26 17:35:26','2017-11-26 17:35:26'),(151169492899652,151093275581282,'2017年-11月-29日(星期三)上午',4,'潘伟明','1312312','312','2017-11-26 19:15:28','2017-11-26 19:15:28');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `deid` bigint(20) NOT NULL,
  `degrade` int(11) DEFAULT NULL COMMENT '1 一级科室 2 二级科室',
  `dename` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`deid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`deid`,`degrade`,`dename`) values (1,1,'内科'),(2,1,'儿科'),(3,1,'眼科'),(4,1,'骨科'),(5,1,'口腔科'),(6,2,'心血管内科'),(7,2,'神经内科'),(8,2,'内分泌科'),(9,2,'血液科'),(10,2,'肝病科');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `did` bigint(20) NOT NULL,
  `dname` varchar(64) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `hid` bigint(20) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `grade` int(11) DEFAULT NULL COMMENT '1主任医师 2副主任医师 3主治医师 4普通医师',
  `deid` bigint(20) DEFAULT NULL,
  `skill` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `surgeryWeek` varchar(200) DEFAULT NULL COMMENT '手术日期',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `doctor` */

insert  into `doctor`(`did`,`dname`,`gender`,`hid`,`score`,`grade`,`deid`,`skill`,`description`,`image`,`surgeryWeek`) values (1,'曹云','男',1,9.8,2,1,'治疗口腔','从1995到至今武汉同济医院;华中科技大学同济医学院外科学博士；美国加州大学洛杉矶分校（UCLA医学中心泌尿外科博士后','images/yisheng1.png','星期二上午,星期二下午,星期四上午,星期五晚上'),(2,'张三','男',2,9.8,1,1,'治疗口腔','GOOD','images/yisheng1.png','星期一下午,星期三上午,星期三下午'),(3,'李四','男',3,9.8,1,1,'治疗口腔','GOOD','images/yisheng1.png','星期二上午,星期二下午,星期四上午,星期五晚上'),(4,'李五','女',5,9.7,3,2,NULL,'GOOD','images/yisheng2.png','星期一下午,星期三上午,星期三下午'),(5,'李六','男',5,9.6,4,2,NULL,'GOOD','images/yisheng1.png','星期三上午,星期三下午,星期五上午'),(6,'李七','女',8,9,2,1,NULL,'GOOD','images/yisheng2.png','星期三下午,星期四上午,星期四下午');

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `hid` bigint(20) NOT NULL,
  `hname` varchar(64) DEFAULT NULL,
  `hphone` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `grade` varchar(11) DEFAULT NULL COMMENT '1三甲医院 2三乙医院 3二甲医院 4二级医院',
  `description` varchar(200) DEFAULT NULL,
  `insurance` int(1) DEFAULT NULL COMMENT '医保',
  `image` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `times` int(11) DEFAULT NULL COMMENT '提供服务次数',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hospital` */

insert  into `hospital`(`hid`,`hname`,`hphone`,`address`,`score`,`grade`,`description`,`insurance`,`image`,`times`) values (1,'武汉协和医院','123-123','武汉市武昌区',9.8,'三甲','good',1,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',1),(2,'广州协和医院','123-123','广州市白云区',9.8,'三乙','good',1,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',0),(3,'北京协和医院','123-123','北京市朝阳区',9.8,'二甲','good',0,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',0),(5,'上海协和医院','123-123','上海市xx区',9.8,'二级','good',0,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',1),(6,'深圳协和医院','123-123','深圳xx',9.8,'二甲','good',1,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',0),(8,'湛江协和医院','123-123','湛江市xx区',9.8,'二级','good',0,'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `user` varchar(64) DEFAULT NULL,
  `pwd` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`user`,`pwd`,`name`,`gender`,`email`,`phone`,`createTime`,`updateTime`,`code`,`state`) values (151093275581282,'Ming','1544962681d702dab4aefdf580ce1d16','潘伟明','男','969130721@QQ.COM','123123','2017-11-17 23:32:35','2017-11-17 23:32:35','7934bba2a1b146caa7e33b8ed97172e9',1),(151093312149388,'123123','93be6c2e2ed15ede01a68df159ca7d4f','Ming','男','969130721@QQ.COM','123123','2017-11-17 23:38:41','2017-11-17 23:38:41','fde9806a8741485ab6ea153f580f4d32',1),(151100071769897,'1231232','cadca8b9c383d8a19b4a58b20c4d9eda','Ming','男','969130721@QQ.COM','123123','2017-11-18 18:25:17','2017-11-18 18:29:11','baa883d2bce74928b7844b50dcdacf45',1),(151100099070977,'Ming2','cadca8b9c383d8a19b4a58b20c4d9eda','Ming','男','969130721@QQ.COM','','2017-11-18 18:29:50','2017-11-18 18:29:56','719b66a4090041118b27cc7d3e6e5ba0',1),(151101910081945,'123123213','cadca8b9c383d8a19b4a58b20c4d9eda','312321','男','969130721@QQ.CO','','2017-11-18 23:31:40','2017-11-18 23:31:40','f79660a2aa244845a0ffae3b89fc8650',NULL),(151101911629484,'1231232133123','cadca8b9c383d8a19b4a58b20c4d9eda','312321','男','969130721@QQ','123','2017-11-18 23:31:56','2017-11-18 23:31:56','0bb44896aafd41e9a9b32cee470035a9',NULL),(151101926902747,'123123123','cadca8b9c383d8a19b4a58b20c4d9eda','321312','男','969130721@QQ','123123','2017-11-18 23:34:29','2017-11-18 23:34:29','c3e25d67ce7a4d2aa370fc679f59e921',NULL),(151102006444721,'12312312','cadca8b9c383d8a19b4a58b20c4d9eda','123123','男','','','2017-11-18 23:47:44','2017-11-18 23:47:44','ff12393220214bffb5ba5e04629e0d27',NULL),(151102017088307,'12312322','cadca8b9c383d8a19b4a58b20c4d9eda','12312','男','','','2017-11-18 23:49:30','2017-11-18 23:49:30','d980c7073a5643e09ccaabf4ccc63f7a',NULL),(151102024317541,'12312312321','cadca8b9c383d8a19b4a58b20c4d9eda','Ming','男','969130721@QQ.COM','132123','2017-11-18 23:50:43','2017-11-18 23:50:43','5a596a710634435181afdd8c4be4d571',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
