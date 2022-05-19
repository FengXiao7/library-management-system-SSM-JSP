/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.28 : Database - ssmbuild
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmbuild` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssmbuild`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookID` int NOT NULL AUTO_INCREMENT COMMENT '书id',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `bookCounts` int NOT NULL COMMENT '数量',
  `detail` varchar(600) NOT NULL COMMENT '描述',
  `bookType` varchar(10) DEFAULT NULL COMMENT '图书类别',
  `Press` varchar(50) DEFAULT NULL COMMENT '出版社',
  `bookAuthor` varchar(100) DEFAULT NULL COMMENT '书籍作者',
  `bookDate` date DEFAULT NULL,
  `bookPage` int DEFAULT NULL COMMENT '书籍页数',
  UNIQUE KEY `books_bookName_uindex` (`bookName`),
  KEY `bookID` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

/*Data for the table `books` */

insert  into `books`(`bookID`,`bookName`,`bookCounts`,`detail`,`bookType`,`Press`,`bookAuthor`,`bookDate`,`bookPage`) values 
(29,'1',1,'1','1','1','1','2021-11-12',1),
(19,'1984',4000,'栗树荫下，我出卖你，你出卖我','小说','北京十月文艺出版社','[英] 乔治·奥威尔','2010-04-02',304),
(10,'Java基础',15,'从入门到入土','知识','机械工业出版社',' （美）Cay S. Horstmann / （美）Gary Cornell','2013-11-01',720),
(28,'OPUS 作品',111,'动画大师今敏，漫画生涯至高代表作！追悼纪念，遗作重见天日，首度作为单行本出版的蕞后长篇杰作！完整收录生前被拒绝刊登的「神结局」深具自传色彩，你所能想象的今敏风格之盛宴！名作《千年女优》《红辣椒》的前身中文世界初次正版引进','漫画','北京联合出版公司','[日] 今敏','2019-08-23',368),
(24,'万历十五年',1,'见微知著，历史观的颠覆','历史','生活·读书·新知三联书店','[美国] 黄仁宇','1997-05-12',320),
(9,'三体',34900,'地球往事三部曲','科幻','重庆出版社',' 刘慈欣','2008-08-08',302),
(27,'仿生人会梦见电子羊吗？',9001,'《仿生人会梦见电子羊吗？》是菲利普•迪克最负盛名的作品，小说描述了从一天早晨到第二天早晨的二十多个小时，主人公里克•德卡德为了赏金追杀几个仿生人的过程，历经无数变故，狗血共桃花一色，阴谋与暴力齐飞。小说里的人类受到地球辐射尘的影响，相貌丑陋，很多在心智上都发生了退化，而仿生人却外表堂堂，多才多艺。当仿生人在外表和心智上无限逼近人类，甚至表面上已经超越人类时，人究竟何以为人？','科幻','译林出版社','[美] 菲利普·迪克','2017-03-18',267),
(13,'克拉拉与太阳',1,'太阳总有办法照到我们，不管我们在哪里','小说','上海译文出版社','[英] 石黑一雄','2021-03-12',396),
(3,'平凡的世界',9000,'中国当代城市生活全景','小说','北京十月文艺出版社','路遥','2012-03-01',1251),
(21,'房思琪的初恋乐园',7858,'向死而生的文学绝唱','小说','北京联合出版公司',' 林奕含','2018-01-04',272),
(26,'明朝那些事儿（1-9）',998,'《明朝那些事儿》讲述从1344年到1644年，明朝三百年间的历史。作品以史料为基础，以年代和具体人物为主线，运用小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多。作品也是一部明朝政治经济制度、人伦道德的演义。','历史','中国海关出版社','当年明月','2009-04-12',2532),
(16,'永隔一江水',91,'成熟的故乡写作','小说','人民文学出版社','邓安庆','2021-03-15',324),
(12,'活着',217,'生的苦难与伟大','小说','作家出版社','余华','2012-08-13',191),
(22,'白夜行',7864,'一宗离奇命案牵出跨度近20年步步惊心的故事','小说','南海出版公司','[日] 东野圭吾','2013-01-01',538),
(18,'百年孤独',672,'魔幻现实主义','文学','南海出版公司','[哥伦比亚] 加西亚·马尔克斯','2011-06-19',360),
(25,'算法图解',122,'本书示例丰富，图文并茂，以让人容易理解的方式阐释了算法，旨在帮助程序员在日常项目中更好地发挥算法的能量。','知识','人民邮电出版社','[美] Aditya Bhargava','2017-04-14',196),
(7,'红楼梦',18,'都云作者痴，谁解其中味？','文学','人民文学出版社','[清] 曹雪芹 著 / 高鹗 续','1996-12-12',1606),
(17,'美丽黑暗',563,'圣洁与黑暗，幻想与恶意','漫画','后浪丨中国纺织出版社','[法] 法比安·韦尔曼 编 / [法] 凯拉斯科多 绘','2021-04-15',96),
(5,'西游记',450,'广为曲解的一本书','文学','岳麓书社',' 吴承恩','1994-04-29',764),
(23,'追风筝的人',449,'为你，千千万万遍','小说','上海人民出版社','[美] 卡勒德·胡赛尼','2006-05-14',362),
(15,'重返暗夜',2176,'十三个幽暗跌宕的故事','小说','上海人民出版社',' [智利] 罗贝托·波拉尼奥','2021-03-13',272),
(20,'飘',2,'革命时期的爱情，随风而逝','文学','译林出版社','[美国] 玛格丽特·米切尔','2000-09-30',1235);

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `bookID` int NOT NULL COMMENT '图书ID',
  `userID` int NOT NULL COMMENT '用户ID',
  `time` date NOT NULL COMMENT '借阅日期',
  PRIMARY KEY (`bookID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='借阅表';

/*Data for the table `borrow` */

insert  into `borrow`(`bookID`,`userID`,`time`) values 
(3,3,'2021-05-17'),
(3,4,'2021-05-30'),
(3,5,'2021-05-07'),
(3,6,'2021-06-01'),
(3,9,'2021-06-01'),
(3,11,'2021-06-01'),
(5,3,'2021-05-30'),
(5,4,'2021-02-28'),
(5,6,'2021-06-01'),
(5,7,'2021-05-30'),
(5,9,'2021-05-31'),
(5,10,'2021-06-12'),
(5,11,'2021-06-01'),
(7,6,'2021-06-01'),
(7,9,'2021-06-01'),
(7,11,'2021-06-01'),
(9,1,'2021-10-30'),
(9,4,'2021-05-30'),
(9,6,'2021-05-30'),
(9,9,'2020-06-01'),
(9,10,'2021-06-12'),
(9,11,'2021-06-01'),
(10,6,'2021-05-30'),
(10,7,'2021-06-19'),
(10,9,'2021-06-01'),
(10,11,'2021-06-01'),
(10,16,'2021-06-06'),
(12,4,'2021-05-30'),
(12,10,'2021-06-01'),
(12,11,'2021-06-01'),
(12,16,'2021-06-04'),
(13,6,'2021-06-01'),
(13,11,'2021-06-01'),
(13,16,'2021-06-04'),
(15,3,'2021-05-30'),
(15,11,'2021-06-01'),
(15,16,'2021-06-04'),
(16,6,'2021-06-01'),
(16,10,'2021-06-01'),
(16,11,'2021-06-01'),
(16,16,'2021-06-04'),
(17,10,'2021-06-01'),
(17,11,'2021-06-01'),
(18,3,'2021-05-30'),
(18,16,'2021-06-04'),
(19,1,'2021-10-30'),
(19,6,'2021-06-26'),
(19,10,'2021-06-12'),
(19,16,'2021-06-06'),
(20,3,'2021-05-30'),
(20,4,'2020-05-08'),
(20,10,'2021-06-12'),
(21,1,'2021-10-30'),
(21,9,'2021-05-31'),
(21,16,'2021-06-04'),
(22,5,'2021-05-06'),
(22,16,'2021-06-06'),
(23,3,'2021-06-01'),
(23,12,'2021-06-01'),
(23,16,'2021-06-04'),
(24,12,'2021-06-01'),
(25,1,'2021-11-15'),
(27,1,'2021-11-15'),
(28,1,'2021-10-30'),
(28,7,'2021-06-19');

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `userID` int NOT NULL,
  `bookID` int NOT NULL,
  `bookComments` varchar(500) DEFAULT NULL,
  `CommentDate` date DEFAULT NULL COMMENT '评论日期',
  PRIMARY KEY (`userID`,`bookID`),
  KEY `bookID` (`bookID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='评论表';

/*Data for the table `comments` */

insert  into `comments`(`userID`,`bookID`,`bookComments`,`CommentDate`) values 
(1,7,'2222','2021-06-26'),
(1,9,'三体是真的好看啊！!','2021-11-15'),
(1,10,'Java基础yyds！！！','2021-06-24'),
(1,13,'张三来抢沙发咯！\r\n','2021-06-26'),
(1,17,'可以喔！！！','2021-06-15'),
(1,19,'1984是真的好看啊','2021-06-19'),
(1,22,'！！！','2021-06-13'),
(1,25,'还可以','2021-11-15'),
(1,26,'222','2021-06-26'),
(1,28,'OPUS 作品，可以喔！','2021-06-13'),
(2,10,'《Java基础》yyds！！！','2021-06-13'),
(2,19,'我觉得1984还可以','2021-06-13'),
(2,24,'没书看了。。。','2021-06-15'),
(2,25,'《算法图解》tql!','2021-06-13'),
(15,9,'超级好看！！','2021-06-15');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `managerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`managerID`),
  UNIQUE KEY `manager_ID_uindex` (`managerID`),
  UNIQUE KEY `manager_Name_uindex` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='管理员';

/*Data for the table `manager` */

insert  into `manager`(`managerID`,`Name`,`password`) values 
(1,'冯成祥','123'),
(4,'闵盼','123456'),
(5,'马唯杰','123'),
(11,'李家伟','123456'),
(12,'卢立波','7777'),
(13,'刘建彤','2222'),
(14,'周绪海','7777'),
(16,'11','11');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL COMMENT '姓名',
  `userPassword` varchar(100) NOT NULL COMMENT '用户密码',
  `userPhone` varchar(100) DEFAULT NULL,
  `userSex` varchar(2) DEFAULT NULL,
  `userAge` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `user_userName_uindex` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`userID`,`userName`,`userPassword`,`userPhone`,`userSex`,`userAge`) values 
(1,'张张','123456','18284557821','男',12),
(2,'李四','1234','18284557827','女',19),
(3,'王五','12345',NULL,NULL,NULL),
(4,'赵六','123456',NULL,NULL,NULL),
(5,'钱七','1234567',NULL,NULL,NULL),
(6,'小冯','123',NULL,NULL,NULL),
(7,'444','444',NULL,NULL,NULL),
(9,'老八','888',NULL,NULL,NULL),
(10,'李10','101010','15284557826','男',23),
(11,'王11','111',NULL,NULL,NULL),
(12,'张12','1212',NULL,NULL,NULL),
(13,'刘13','1313',NULL,NULL,NULL),
(14,'赵14','1414',NULL,NULL,NULL),
(15,'王15','12345',NULL,NULL,NULL),
(16,'李16','123456',NULL,NULL,NULL),
(17,'11','12',NULL,NULL,NULL),
(18,'111','111',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
