/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.17-log : Database - ebook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ebook` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ebook`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` int(11) NOT NULL COMMENT '图书价格',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `press` varchar(100) DEFAULT NULL,
  `publish_time` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `page_num` int(11) DEFAULT NULL,
  `word_num` int(11) DEFAULT NULL,
  `cid` bigint(20) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`author`,`price`,`num`,`press`,`publish_time`,`edition`,`page_num`,`word_num`,`cid`,`image`) values (391,'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）','贾蓓',80,100,'清华大学出版社','2013-7-1',1,640,1030000,NULL,'http://118.24.86.231:8080/images/book_img/23268958-1_w.jpg'),(392,'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】','Richard',99,100,'人民邮电出版社','2013-1-1',1,468,721000,NULL,'http://118.24.86.231:8080/images/book_img/22938396-1_w.jpg'),(393,'Java核心技术：卷Ⅰ基础知识（原书第8版）','昊斯特曼',98,100,'机械工业出版社','2008-6-1',1,694,0,NULL,'http://118.24.86.231:8080/images/book_img/20285763-1_w.jpg'),(394,'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）','霍尔顿',118,100,'清华大学出版社','2012-8-1',1,1124,1918000,NULL,'http://118.24.86.231:8080/images/book_img/22813026-1_w.jpg'),(395,'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)','霍斯特曼',109,100,'人民邮电出版社','2013-7-1',1,0,1197000,NULL,'http://118.24.86.231:8080/images/book_img/23280479-1_w.jpg'),(396,'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）','无',99,100,'清华大学出版社','0',1,0,1754000,NULL,'http://118.24.86.231:8080/images/book_img/21110930-1_w_1.jpg'),(397,'Java深入解析——透析Java本质的36个话题','梁勇',49,100,'电子工业出版社','2013-11-1',1,298,424000,NULL,'http://118.24.86.231:8080/images/book_img/23363997-1_w_1.jpg'),(398,'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)','Nicholas C. Zakas',148,100,'人民邮电出版社','2013-4-1',1,1048,0,NULL,'http://118.24.86.231:8080/images/book_img/23224089-1_w.jpg'),(399,'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）','明日科技',70,100,'清华大学出版社','2012-9-1',1,532,939000,NULL,'http://118.24.86.231:8080/images/book_img/22862057-1_w.jpg'),(400,'Struts2技术内幕：深入解析Struts架构设计与实现原理','陆舟',69,100,'机械工业出版社','2012-1-1',1,379,0,NULL,'http://118.24.86.231:8080/images/book_img/22577578-1_w.jpg'),(401,'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)','孙卫琴',80,100,'电子工业出版社','2009-1-1',1,734,1216000,NULL,'http://118.24.86.231:8080/images/book_img/20420983-1_w.jpg'),(402,'JAVA核心技术卷II：高级特性（原书第8版）','霍斯特曼',118,100,'机械工业出版社','2008-12-1',1,852,0,NULL,'http://118.24.86.231:8080/images/book_img/20446562-1_w.jpg'),(403,'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)','Venkat Subramaniam',59,100,'机械工业出版社','2013-5-1',1,215,0,NULL,'http://118.24.86.231:8080/images/book_img/23239786-1_w.jpg'),(404,'基于MVC的JavaScript Web富应用开发','麦卡劳',59,100,'电子工业出版社','2012-5-1',1,282,462000,NULL,'http://118.24.86.231:8080/images/book_img/22757564-1_w.jpg'),(405,'数据结构与算法分析Java语言描述 第2版','韦斯',55,100,'机械工业出版社','2009-1-1',2,440,0,NULL,'http://118.24.86.231:8080/images/book_img/20417467-1_w.jpg'),(406,'Java程序员修炼之道','埃文斯',89,100,'人民邮电出版社','2013-8-1',1,395,658000,NULL,'http://118.24.86.231:8080/images/book_img/23301847-1_w_1.jpg'),(407,'深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）','周志明',69,100,'机械工业出版社','0',1,0,0,NULL,'http://118.24.86.231:8080/images/book_img/21108671-1_w_1.jpg'),(408,'Java核心技术 卷1 基础知识（原书第9版）','霍斯特曼，科内尔',119,100,'机械工业出版社','2014-1-1',1,704,0,NULL,'http://118.24.86.231:8080/images/book_img/23362142-1_w_1.jpg'),(409,'Effective Java中文版(第2版)','布洛克',52,100,'机械工业出版社','2009-1-1',2,287,0,NULL,'http://118.24.86.231:8080/images/book_img/20459091-1_w.jpg'),(410,'JavaScript宝典（第7版）（配光盘）','古德曼',128,100,'清华大学出版社','2013-1-1',1,1012,1657000,NULL,'http://118.24.86.231:8080/images/book_img/23169892-1_w.jpg'),(411,'Java语言程序设计：进阶篇（原书第8版）','梁勇',79,100,'机械工业出版社','2011-6-1',1,507,0,NULL,'http://118.24.86.231:8080/images/book_img/21117631-1_w_1.jpg'),(412,'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）','弗兰纳根',139,100,'机械工业出版社','2012-4-1',1,1004,0,NULL,'http://118.24.86.231:8080/images/book_img/22722790-1_w.jpg'),(413,'HTML5+JavaScript动画基础','兰贝塔',69,100,'人民邮电出版社','2013-6-1',1,393,553000,NULL,'http://118.24.86.231:8080/images/book_img/23266633-1_w.jpg'),(414,'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）','Craig Walls',59,100,'人民邮电出版社','2013-6-1',1,374,487000,NULL,'http://118.24.86.231:8080/images/book_img/23254532-1_w.jpg'),(415,'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）','明日科技',70,100,'清华大学出版社','2012-9-1',1,547,979000,NULL,'http://118.24.86.231:8080/images/book_img/22862056-1_w.jpg'),(416,'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘','刘京华',100,100,'清华大学出版社','2010-1-1',1,1010,1368000,NULL,'http://118.24.86.231:8080/images/book_img/20756351-1_w_1.jpg'),(417,'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)','Bear Bibeault　Yehuda Katz ',69,100,'人民邮电出版社','2012-3-1',1,394,617000,NULL,'http://118.24.86.231:8080/images/book_img/22638286-1_w.jpg'),(418,'JavaScript经典实例','鲍尔斯',78,100,'中国电力出版社','2012-3-1',1,512,625000,NULL,'http://118.24.86.231:8080/images/book_img/22692811-1_w.jpg'),(419,'深入浅出Ext JS(第3版)','徐会生',69,100,'人民邮电出版社','2013-10-1',3,413,642000,NULL,'http://118.24.86.231:8080/images/book_img/23351049-1_w_1.jpg'),(420,'Spring源码深度解析','郝佳',69,100,'人民邮电出版社','2013-9-1',1,386,545000,NULL,'http://118.24.86.231:8080/images/book_img/23329703-1_w_1.jpg'),(421,'亮剑Java Web项目开发案例导航(含DVD光盘1张)','朱雪琴',69,100,'电子工业出版社','2012-3-1',1,526,875000,NULL,'http://118.24.86.231:8080/images/book_img/22623766-1_w.jpg'),(422,'Spring 3.x企业应用开发实战(含CD光盘1张)','陈雄华',90,100,'电子工业出版社','2012-2-1',1,710,1158000,NULL,'http://118.24.86.231:8080/images/book_img/22605701-1_w.jpg'),(423,'疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）','李刚',59,100,'电子工业出版社','2013-1-1',1,484,7710000,NULL,'http://118.24.86.231:8080/images/book_img/23042420-1_w.jpg'),(424,'了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）','Guillermo Rauch',79,100,'电子工业出版社','2014-1-1',1,292,436000,NULL,'http://118.24.86.231:8080/images/book_img/23368351-1_w_2.jpg'),(425,'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）','明日科技',60,100,'清华大学出版社','2012-9-1',3,564,1013000,NULL,'http://118.24.86.231:8080/images/book_img/22862060-1_w.jpg'),(426,'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)','Nicholas C. Zakas',99,100,'人民邮电出版社','2012-3-1',1,730,1092000,NULL,'http://118.24.86.231:8080/images/book_img/22628333-1_w.jpg'),(427,'Java程序性能优化','葛一鸣',59,100,'清华大学出版社','2012-10-1',1,400,649000,NULL,'http://118.24.86.231:8080/images/book_img/22881618-1_w.jpg'),(428,'JavaScript设计模式','Addy Osmani',49,100,'人民邮电出版社','2013-6-1',1,241,301000,NULL,'http://118.24.86.231:8080/images/book_img/23266635-1_w.jpg'),(429,'JavaScript和jQuery实战手册（原书第2版）','麦克法兰',99,100,'机械工业出版社','2013-3-11',1,504,0,NULL,'http://118.24.86.231:8080/images/book_img/23201813-1_w.jpg'),(430,'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）','明日科技',70,100,'清华大学出版社','2011-1-1',2,605,1037000,NULL,'http://118.24.86.231:8080/images/book_img/20991549-1_w_1.jpg'),(431,'深入分析Java Web技术内幕','许令波',69,100,'电子工业出版社','2012-9-1',1,442,746000,NULL,'http://118.24.86.231:8080/images/book_img/22881803-1_w.jpg'),(432,'Java程序员面试宝典（第三版）','欧立奇',49,100,'电子工业出版社','2013-9-1',1,359,446400,NULL,'http://118.24.86.231:8080/images/book_img/23348683-1_w_1.jpg'),(433,'21天学通Java(第6版)（中文版累计销量超30000册）','Rogers Cadenhead',55,100,'人民邮电出版社','2013-4-1',1,410,781000,NULL,'http://118.24.86.231:8080/images/book_img/23219731-1_w.jpg'),(434,'Java网络编程（第3版）——O’Reilly Java系列','哈诺德',85,100,'中国电力出版社','2005-11-1',1,718,668000,NULL,'http://118.24.86.231:8080/images/book_img/9062293-1_w.jpg'),(435,'学通Java Web的24堂课（配光盘）（软件开发羊皮卷）','陈丹丹',80,100,'清华大学出版社','2011-6-1',1,718,1488000,NULL,'http://118.24.86.231:8080/images/book_img/21118835-1_w_1.jpg'),(436,'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）','李世民',60,100,'清华大学出版社','2012-8-1',1,459,745000,NULL,'http://118.24.86.231:8080/images/book_img/22839309-1_w.jpg'),(437,'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）','耿祥义',40,100,'清华大学出版社','2012-8-1',4,479,782000,NULL,'http://118.24.86.231:8080/images/book_img/22844118-1_w.jpg'),(438,'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)','霍斯特曼',119,100,'人民邮电出版社','2013-7-1',1,1118,1370000,NULL,'http://118.24.86.231:8080/images/book_img/23280478-1_w.jpg'),(439,'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）','陶国荣',59,100,'机械工业出版社','2011-1-1',1,385,0,NULL,'http://118.24.86.231:8080/images/book_img/21006995-1_w_1.jpg'),(440,'轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)','李刚',99,100,'电子工业出版社','2012-4-1',1,816,1440000,NULL,'http://118.24.86.231:8080/images/book_img/22685703-1_w.jpg'),(441,'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）','明日科技',70,100,'清华大学出版社','2012-9-1',1,548,986000,NULL,'http://118.24.86.231:8080/images/book_img/22862061-1_w.jpg'),(442,'《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）','计文柯',69,100,'机械工业出版社','2012-2-1',2,399,0,NULL,'http://118.24.86.231:8080/images/book_img/22606836-1_w.jpg'),(443,'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）','哈弗贝克',49,100,'械工业出版社','2012-9-1',1,162,0,NULL,'http://118.24.86.231:8080/images/book_img/22873894-1_w.jpg'),(444,'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）','塞若',79,100,'中国电力出版社','2007-2-1',1,689,983000,NULL,'http://118.24.86.231:8080/images/book_img/9265169-1_w.jpg'),(445,'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）','刘西杰',49,100,'人民邮电出版社','2012-12-24',1,450,705000,NULL,'http://118.24.86.231:8080/images/book_img/22928649-1_w.jpg'),(446,'JavaScript DOM编程艺术(第2版)','基思',49,100,'人民邮电出版社','2011-4-1',1,286,443000,NULL,'http://118.24.86.231:8080/images/book_img/21049601-1_w_1.jpg'),(447,'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）','无',99,100,'清华大学出版社','0',0,0,1746000,NULL,'http://118.24.86.231:8080/images/book_img/21110929-1_w_1.jpg'),(448,'疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）','李刚',79,100,'电子工业出版社','2013-2-1',1,624,997000,NULL,'http://118.24.86.231:8080/images/book_img/23184673-1_w.jpg'),(449,'Flash ActionScript 3.0全站互动设计','刘欢 ',70,100,'人民邮电出版社','2012-10-1',1,488,760000,NULL,'http://118.24.86.231:8080/images/book_img/22886581-1_w.jpg'),(450,'Java编程思想（英文版·第4版）','埃克尔 ',79,100,'机械工业出版社','2007-4-1',1,1482,0,NULL,'http://118.24.86.231:8080/images/book_img/9288920-1_w.jpg'),(451,'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)','孙鑫',119,100,'电子工业出版社','2012-5-1',1,889,1760000,NULL,'http://118.24.86.231:8080/images/book_img/22788412-1_w.jpg'),(452,'Java编程全能词典(含DVD光盘2张)','明日科技',98,100,'电子工业出版社','2010-3-1',1,486,496000,NULL,'http://118.24.86.231:8080/images/book_img/20813806-1_w_1.jpg'),(453,'JavaScript模式','斯特凡洛夫',38,100,'中国电力出版社','2012-7-1',1,208,253000,NULL,'http://118.24.86.231:8080/images/book_img/22819430-1_w.jpg'),(454,'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）','陈雄华',59,100,'人民邮电出版社','2013-1-1',1,380,530000,NULL,'http://118.24.86.231:8080/images/book_img/22938474-1_w.jpg'),(455,'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）','张志锋',98,100,'清华大学出版社','2013-6-1',1,878,0,NULL,'http://118.24.86.231:8080/images/book_img/23266270-1_w.jpg'),(456,'Java语言程序设计：基础篇（原书第8版）','梁勇',75,100,'机械工业出版社','2011-6-1',1,586,0,NULL,'http://118.24.86.231:8080/images/book_img/21122188-1_w_1.jpg'),(457,'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）','陶国荣',59,100,'机械工业出版社','2012-8-1',1,249,0,NULL,'http://118.24.86.231:8080/images/book_img/22847009-1_w.jpg'),(458,'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)','Tom Negrino　Dori Smith',69,100,'人民邮电出版社','2012-4-1',1,392,694000,NULL,'http://118.24.86.231:8080/images/book_img/22717349-1_w.jpg'),(459,'经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)','无',79,100,'电子工业出版社','2010-8-1',1,0,0,NULL,'http://118.24.86.231:8080/images/book_img/20928547-1_w_1.jpg'),(460,'名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）','李兴华',70,100,'清华大学出版社','2010-8-1',1,554,819000,NULL,'http://118.24.86.231:8080/images/book_img/20915948-1_w_3.jpg'),(461,'锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)','单东林',49,100,'人民邮电出版社','2012-7-1',2,380,598000,NULL,'http://118.24.86.231:8080/images/book_img/22786088-1_w.jpg'),(462,'jQuery UI开发指南','Eric Sarrion',39,100,'人民邮电出版社','2012-12-1',1,212,286000,NULL,'http://118.24.86.231:8080/images/book_img/22910975-1_w.jpg'),(463,'JavaScript:The Good Parts(影印版）','克罗克福特',28,100,'东南大学出版社','2009-1-1',1,153,181000,NULL,'http://118.24.86.231:8080/images/book_img/20412979-1_w.jpg'),(464,'Java从入门到精通（附光盘）','魔乐科技',59,100,'人民邮电出版社','2010-4-1',1,519,884000,NULL,'http://118.24.86.231:8080/images/book_img/20810282-1_w_1.jpg'),(465,'编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)','秦小波',59,100,'机械工业出版社','2012-1-1',1,303,0,NULL,'http://118.24.86.231:8080/images/book_img/22579686-1_w.jpg'),(466,'JavaScript语言精粹（修订版）','道格拉斯·克罗克福德',49,100,'电子工业出版社','2012-9-1',1,155,258000,NULL,'http://118.24.86.231:8080/images/book_img/22872884-1_w.jpg'),(467,'名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）','李兴华',80,100,'清华大学出版社','2009-8-1',1,831,1222000,NULL,'http://118.24.86.231:8080/images/book_img/20637368-1_w_2.jpg'),(468,'Java编程思想（第4版）','布鲁斯.艾克尔',108,100,'机械工业出版社','2007-6-1',1,880,0,NULL,'http://118.24.86.231:8080/images/book_img/9317290-1_w.jpg'),(469,'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）','袁江',80,100,'清华大学出版社','2013-6-1',1,619,1109000,NULL,'http://118.24.86.231:8080/images/book_img/23263012-1_w.jpg'),(470,'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)','克内恩席尔德',69,100,'机械工业出版社','2013-9-1',1,251,0,NULL,'http://118.24.86.231:8080/images/book_img/23339643-1_w.jpg'),(471,'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作','Brian Goetz',69,100,'机械工业出版社','2012-2-1',1,290,0,NULL,'http://118.24.86.231:8080/images/book_img/22606835-1_w.jpg'),(472,'Java 经典实例','达尔文',98,100,'中国电力出版社','2009-2-1',1,784,805000,NULL,'http://118.24.86.231:8080/images/book_img/20500255-1_w.jpg'),(473,'深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）','周志明',79,100,'机械工业出版社','2013-6-1',2,433,0,NULL,'http://118.24.86.231:8080/images/book_img/23259731-1_w.jpg'),(474,'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】','Trevor Burnham ',32,100,'人民邮电出版社','2013-6-1',1,118,98000,NULL,'http://118.24.86.231:8080/images/book_img/23252196-1_w.jpg'),(475,'Java设计模式(第2版)','Steven John Metsker',75,100,'电子工业出版社','2012-9-1',1,0,0,NULL,'http://118.24.86.231:8080/images/book_img/22868759-1_w.jpg'),(476,'疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)','李刚',69,100,'电子工业出版社','2012-5-1',1,500,819000,NULL,'http://118.24.86.231:8080/images/book_img/22783904-1_w.jpg'),(477,'精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)','孙卫琴',75,100,'电子工业出版社','2010-2-1',1,695,1148800,NULL,'http://118.24.86.231:8080/images/book_img/20773347-1_w_1.jpg'),(478,'疯狂Java讲义（第2版，附光盘）','李刚',109,100,'电子工业出版社','2012-1-1',1,844,1747000,NULL,'http://118.24.86.231:8080/images/book_img/22588603-1_w.jpg'),(479,'编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）','Nicholas C. Zakas',55,100,'人民邮电出版社','2013-4-1',1,227,400000,NULL,'http://118.24.86.231:8080/images/book_img/23200995-1_w.jpg'),(480,'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作','jQuery社区专家组',69,100,'人民邮电出版社','2013-5-1',1,425,573000,NULL,'http://118.24.86.231:8080/images/book_img/23219358-1_w.jpg'),(481,'JUnit实战(第2版)','塔凯文',79,100,'人民邮电出版社','2012-4-1',1,442,640000,NULL,'http://118.24.86.231:8080/images/book_img/22633574-1_w.jpg'),(482,'Java Web典型模块与项目实战大全（配光盘）','常建功',100,100,'清华大学出版社','2011-1-1',1,922,1473000,NULL,'http://118.24.86.231:8080/images/book_img/20988080-1_w_1.jpg'),(483,'JAVA面向对象编程','孙卫琴 ',66,100,'电子工业出版社','2006-7-1',1,625,1030400,NULL,'http://118.24.86.231:8080/images/book_img/9186890-1_w.jpg'),(484,'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）','阎宏',88,100,'电子工业出版社','2002-10-1',1,1024,16704000,NULL,'http://118.24.86.231:8080/images/book_img/696673-1_w.jpg'),(485,'Spring攻略(第2版)(Spring攻略(第2版))','Gary Mak　Josh Long　Daniel Rubio',128,100,'人民邮电出版社','2012-3-1',1,938,1322000,NULL,'http://118.24.86.231:8080/images/book_img/22623020-1_w.jpg'),(486,'深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）','周志明',79,100,'机械工业出版社','2013-2-1',1,414,0,NULL,'http://118.24.86.231:8080/images/book_img/23179003-1_w.jpg');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`description`) values (5,'图形图像多媒体','图形图像多媒体'),(6,'操作系统/系统开发','操作系统/系统开发'),(7,'系统开发','系统开发分类'),(9,'数据库','数据库');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` bigint(20) NOT NULL,
  `oid` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `press` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL COMMENT '订单id',
  `payment` int(11) NOT NULL COMMENT '实付金额',
  `status` int(11) NOT NULL COMMENT '1未付款, 2已付款但未发货, 3已发货未确认收货, 4确认收货了交易成功, 5已取消(只有未付款才能取消)',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_order` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`created`,`updated`) values (1,'1','1','ww','2018-03-13 20:34:55','2018-03-10 20:35:20'),(8,'puyang','123','18382244536','2018-05-19 00:18:16','2018-05-19 00:18:15');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
