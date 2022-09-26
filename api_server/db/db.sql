-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db02
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator_tb`
--

DROP TABLE IF EXISTS `administrator_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator_tb` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `administrator_name` varchar(20) DEFAULT NULL,
  `administrator_password` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`administrator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_tb`
--

LOCK TABLES `administrator_tb` WRITE;
/*!40000 ALTER TABLE `administrator_tb` DISABLE KEYS */;
INSERT INTO `administrator_tb` VALUES (1,'root','123456');
/*!40000 ALTER TABLE `administrator_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carID` int DEFAULT NULL COMMENT '车主ID',
  `carNum` char(8) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `fk_car_carID` (`carID`),
  CONSTRAINT `fk_car_carID` FOREIGN KEY (`carID`) REFERENCES `carmaster` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车辆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,2,'粤F11111','2年','这是车主号为2的第一辆车'),(2,2,'粤A123111','1年','这是车主号为2的第二辆车'),(3,3,'粤A56911','3年','这是车主号为3的第一辆车'),(4,3,'粤F34911','2年','这是车主号为3的第二辆车'),(5,1,'粤F31911','2年','这是车主号为1的第一辆车'),(6,5,'粤F121211','2年','这是车主号为5的第一辆车'),(7,6,'粤F11981','4年','这是车主号为6的第一辆车'),(8,4,'粤F11151','1年','这是车主号为4的第一辆车'),(9,7,'粤A13411','7年','这是车主号为7的第一辆车'),(10,8,'粤A31520','2年','这是车主号为8的第一辆车'),(11,9,'粤F113115','3年','这是车主号为2的第一辆车'),(12,10,'京A11451','2年','这是车主号为10的第一辆车'),(13,12,'粤H16511','4年','这是车主号为12的第一辆车'),(14,11,'粤A11231','3年','这是车主号为11的第一辆车'),(15,14,'粤B13151','5年','这是车主号为14的第一辆车'),(16,13,'粤F12311','8年','这是车主号为13的第一辆车'),(17,16,'粤C23111','6年','这是车主号为16的第一辆车');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_parkspace`
--

DROP TABLE IF EXISTS `car_parkspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_parkspace` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carID` int DEFAULT NULL,
  `parkspaceID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carID` (`carID`),
  KEY `parkspaceID` (`parkspaceID`),
  CONSTRAINT `car_parkspace_ibfk_1` FOREIGN KEY (`carID`) REFERENCES `car` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_parkspace_ibfk_2` FOREIGN KEY (`parkspaceID`) REFERENCES `parking_space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车位车辆表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_parkspace`
--

LOCK TABLES `car_parkspace` WRITE;
/*!40000 ALTER TABLE `car_parkspace` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_parkspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carmaster`
--

DROP TABLE IF EXISTS `carmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carmaster` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `number` char(18) DEFAULT NULL COMMENT '身份证号码',
  `tel` char(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmaster`
--

LOCK TABLES `carmaster` WRITE;
/*!40000 ALTER TABLE `carmaster` DISABLE KEYS */;
INSERT INTO `carmaster` VALUES (1,'李四','123546789009876543','17771902784','韶关'),(2,'柳岩666','123456789012345678','13482345657','广州'),(3,'张无忌','123456789012345670','14782345657','韶关'),(4,'韦一笑','123456789712345670','16582345657','韶关'),(5,'赵敏','123456757123845670','16232345657','东莞'),(6,'杨逍','12345678931234567X','16782340657','肇庆'),(7,'范瑶','123456789212345670','16982345657','韶关'),(8,'黛绮丝','123456157123645670','19782345657','韶关'),(9,'范凉凉','123156789012345678','16782345057','广州'),(10,'陈友谅','123456789012345670','16782334657','东莞'),(11,'张士诚','123567897123465670','16882345657','湛江'),(12,'常遇春','123446757152345670','16785345657','东莞'),(13,'张三丰','123656789012345678','16782345654','广州'),(14,'灭绝','123456719012345670','12782345657','广州'),(15,'胡青牛','12345674971234567X','16723345657','韶关'),(16,'周芷若','12354674971234567X','16782345657','韶关'),(17,'小昭','123456769012345678','16782345689','上海');
/*!40000 ALTER TABLE `carmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parkNum` int NOT NULL COMMENT '停车场编号',
  `carNum` int DEFAULT NULL COMMENT '车辆数量',
  `latitudes` decimal(9,6) DEFAULT NULL COMMENT '纬度',
  `longitudes` decimal(9,6) DEFAULT NULL COMMENT '经度',
  `parkingLocation` text COMMENT '停车场位置',
  `note` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='停车场';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (1,1,200,124.123456,68.239876,'大润发地下停车场',NULL);
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_space`
--

DROP TABLE IF EXISTS `parking_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_space` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parkID` int NOT NULL COMMENT '车位号',
  `parkAdd` text NOT NULL COMMENT '车位地址',
  `park_state` enum('占用','空闲') NOT NULL DEFAULT '空闲' COMMENT '车位状态',
  `lock_pass` char(6) NOT NULL COMMENT '锁密码',
  `note` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_ps_parkID` (`parkID`),
  CONSTRAINT `fk_ps_parkID` FOREIGN KEY (`parkID`) REFERENCES `parking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_space`
--

LOCK TABLES `parking_space` WRITE;
/*!40000 ALTER TABLE `parking_space` DISABLE KEYS */;
INSERT INTO `parking_space` VALUES (1,1,'大润发地下层A区0001','空闲','123456',NULL);
/*!40000 ALTER TABLE `parking_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tb` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_nickname` varchar(20) NOT NULL COMMENT '用户账号名',
  `user_name` varchar(20) NOT NULL COMMENT '用户姓名',
  `user_password` char(6) NOT NULL COMMENT '用户密码',
  `user_identity_id` char(18) NOT NULL COMMENT '用户身份证号',
  `user_tel` char(11) NOT NULL COMMENT '用户联系方式',
  `user_balance` decimal(6,0) NOT NULL COMMENT '用户账户余额',
  `user_register_date` datetime NOT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

LOCK TABLES `user_tb` WRITE;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` VALUES (1,'用户13345','张三','123456','123456789012345678','12345678901',0,'2022-06-13 09:06:00');
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 10:05:38
