CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cartID` varchar(45) NOT NULL,
  `memID` varchar(45) DEFAULT NULL,
  `pID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES ('1','admin','1'),('2','admin','2'),('3','admin','10'),('4','admin','10');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `counterID` int(11) NOT NULL,
  `count` varchar(45) NOT NULL,
  PRIMARY KEY (`counterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,'34');
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` varchar(30) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('11111','1234111',NULL,'111@111',NULL,NULL,NULL,NULL),('admin','1234','Wang','null@123','男','2021-01-08 00:00:00','22222','1111'),('admin123','1234','','46@456',NULL,NULL,NULL,NULL),('admin456','1234',NULL,'132313@132',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `memberID` varchar(45) DEFAULT NULL,
  `star` varchar(45) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `productID` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `messageID` varchar(45) NOT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('1','1','1','2020-11-11','1','1','1'),(NULL,NULL,NULL,NULL,'123',NULL,'2'),('admin','5','123123','2021-01-10','16','No330Geographer','3'),('admin','3','11111','2021-01-10','11','No325King','4'),('admin','4','465','2021-01-10','13','No327Alcoholic','5'),('admin','5','456456','2021-01-10','10','B612','6'),('admin','2','123123','2021-01-10','10','B612','7');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `price` varchar(45) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `quantity` varchar(45) NOT NULL,
  `star5` int(11) DEFAULT NULL,
  `star4` int(11) DEFAULT NULL,
  `star3` int(11) DEFAULT NULL,
  `star2` int(11) DEFAULT NULL,
  `star1` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `crate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Jupiter','product/planet/Jupiter.png','100','朱比特Jupiter<br>星球：木星<br>種類：巨行星(氫和氦為主，體積和質量都很大，密度相對很小，表面是氣態)<br>象徵：主神<br>世界之最，沒有之一。','1',69,8,27,56,0,'1','1','2'),(2,'Mars','product/planet/Mars.png','100','馬爾斯Mars<br>星球：火星<br>種類：類地行星(矽酸鹽為主的岩石)<br>象徵：戰神<br>擁有最強大的武力，有永遠不滅的勇氣與熱情，還有最會策略的頭腦。','1',12,3,29,45,0,'1','2','1'),(3,'Mercury','product/planet/Mercury.png','100','麥丘里  Mercury<br>星球：水星<br>種類：類地行星(矽酸鹽為主的岩石)<br>象徵：商業神<br>讓你擁有世界上最厲害的商業頭腦，永遠比其他人快一步，擁有比其他人更快的速度。','1',45,8,33,12,0,'1','3','1'),(4,'Moon','product/planet/Moon.png','100','月兔住的那顆啦','1',23,5,4,56,0,'1','4','1'),(5,'Neptune','product/planet/Neptune.png','100','拿普頓Neptune<br>星球：海王星<br>種類：遠日行星(距離太陽遠)<br>象徵：海神','1',56,2,7,45,0,'1','5','1'),(6,'Pluto','product/planet/Pluto.png','100','布魯托Pluto，冥界之神<br>星球：冥王星<br>種類：矮行星<br>象徵：冥界之神','1',56,45,5,12,0,'1','6','1'),(7,'Saturn','product/planet/Saturn.png','100','薩頓Saturn<br>星球：土星<br>種類：巨行星(氫和氦為主，體積和質量都很大，密度相對很小，表面是氣態)<br>象徵：農業<br>能讓農作物順利豐收，不怕沒有東西可以吃。','1',45,2,2,56,0,'1','7','1'),(8,'Uranus','product/planet/Uranus.png','100','烏蘭諾斯Uranus<br>星球：天王星<br>種類：遠日行星(距離太陽遠)<br>象徵：希望與未來<br>對於未來擁有希望，永不放棄','1',78,4,1,45,0,'1','8','1'),(9,'Venus','product/planet/Venus.png','100','維納斯Venus<br>星球：金星<br>種類：類地行星(矽酸鹽為主的岩石)<br>象徵：掌管美麗的女神<br>成為世界上最美的人，閃亮動人，讓其他人不管是男生女生對你如癡如醉。','1',12,9,66,12,0,'1','9','1'),(10,'B612','product/growingup/B612.png','100','《成長系列》B612 / 找回初衷<br><br>成長系列星球 - B612<br>這是一顆出現在《小王子》故事中的星球，在這上面你能與小王子見面，也可以見到史上最美麗的玫瑰。購買即可讓你遇見故事中的蛇，放下現在有的任何一切，回到最純真的自己，過著最樸實的生活。','1',10,20,10,2,1,'2','1','37'),(11,'No325King','product/growingup/No325King.png','100','《成長系列》No.325 King<br><br>成長系列星球 - 第325號<br>讓你磨練自己的耐心與聆聽的技巧，你會遇到一位自大的國王，他以為他是宇宙中最有權力的人。你可以請他命令太陽下山，會發現其實太陽是照自己的生活走。看著他的生活你會發現以自己為中心的人，往往是最容易受傷也讓自己失望的人。','1',45,3,2,56,0,'2','2','10'),(12,'No326','product/growingup/No326.png','100','《成長系列》No.326 Vanity<br><br>成長系列星球 - 第326號<br>星球上有一位愛慕虛榮的人，他只聆聽對他來說是讚美的話，也因此可以讓你學習如何稱讚老闆，受到老闆的喜愛；同時你也能了解到，不想去聆聽其他人的建議，只活在自己的世界的人，永遠不想跳出舒適圈，只能一直維持原地，這也是為什麼他離不開這顆星球。','1',23,1,45,45,0,'2','3','2'),(13,'No327Alcoholic','product/growingup/No327Alcoholic.png','100','《成長系列》No.327 Alcoholic<br><br>成長系列星球 - 第327號<br>如果你喜歡喝酒，那你能與這位酒鬼作伴，但他喝的是鬱悶的酒。他每日每夜都在喝酒，但他從不說為什麼他喜歡喝酒。喝酒或許能暫時忘記難過的事情，卻不能解決任何事情，在這裡你能體驗到逃避會造成甚麼樣的後果，是不是該面對問題才是最好的解決辦法呢?<br>不過，你是開心喝酒的話，那也無妨 :)<br>ps理性飲酒','1',45,2,21,12,0,'2','4','5'),(14,'No328Business','product/growingup/No328Business.png','100','《成長系列》No.328 Businessman<br><br>成長系列星球 - 第328號<br>星球上有位很厲害的商人，能教你任何商業技巧，能讓你一夕之間賺大錢，但你踏入了這個地方只能一直工作一直工作，商人是不容許浪費任何時間。一生中都在賺錢，卻沒有時間花錢，你覺得這樣值得嗎? 是否該停下腳步，看看周遭的世界呢?','1',8,3,45,45,0,'2','5','1'),(15,'No329Lighter','product/growingup/No329Lighter.png','100','《成長系列》No.329 Lighter<br><br>成長系列星球 - 第329號<br>這顆星球上有位很盡責的點燈人，他會在規定的時間做該做的事。在這裡你可以學習如何成為一個盡責的人，守時守規矩也很有責任感。久而久之，你可能會發現點燈人唯一的缺點，也是在成長的過程中很難接受的缺點。中規中矩是很不錯，但真的是這麼美好的事情嗎。','1',2,8,8,56,0,'2','6','1'),(16,'No330Geographer','product/growingup/No330Geographer.png','100','《成長系列》No.330 Geographer<br><br>成長系列星球 - 第330號<br>這裡你會遇到一位地理學家，他很厲害、很聰明，知道海洋、草地、土等等，他把他紀錄的了下來。不過你可以問他，「你去過嗎」你會對他的答案很震驚。不能總是盲目的堅持在小小的事情上，有時候我們只是需要一點勇氣，去嘗試自己的夢想。','1',5,4,6,12,0,'2','7','8'),(17,'Covid-19','product/virus/Covid-19.png','100','世界之罪/世界英雄小行星<br><br>這是最近最新上市的病毒小行星，擁有他你可以控制整個人類，讓各個國家都聽信於你，否則你就製造病毒投射在那個國家。製作病毒的原料就是這顆行星。可以聯絡這位邪惡科學家：杜芬舒斯博士，借用他的終結者，讓你稱霸全世界。<br>如果你是很善良的人，希望能你把這個行星買走，並且消滅他，讓這個世界回到一個健康的世界，你就會是全地球人的希望。','1',89,8,78,56,0,'3','1','1'),(18,'H1N1','product/virus/H1N1.png','100','再見雷隊友小行星<br><br>於2009上市的病毒小行星，也因為世界上已經有疫苗，所以算是中等病毒。<br><br>用途：你如果遇到雷隊友，妳可以讓他感染這個病毒直到你想給他疫苗，讓你可以跟老師說他得流感不方便合作，直接踢出你的組別，等成績出來後再給他疫苗恢復。讓你討厭的人受苦，又不用讓人躺分，一舉兩得。','1',78,2,5,45,0,'3','2','2'),(19,'Sars','product/virus/Sars.png','100','原始病毒小行星<br><br>如果想得知病毒世界的奧妙，這個星球最適合你了。以前這些動物(果子狸、貂、獾，蝙蝠，猴子、蛇、老鼠)都存在在這個星球上，許多病毒也是從他們身上傳染給其他人的，但因為這星球太過於可怕沒有人敢在此研究。因此，想要研究病毒的人你，可以買下這個行星，用不同的基因(病毒)產生不一樣的火花，可能也因此得到最佳的解藥。<br>PS 科學家購買可以打9折','1',55,1,2,12,0,'3','3','2'),(20,'0420','product/birth/0420.jpg','100','《生日快樂》<br>擁有屬於自己的生日行星，當作禮物送給家人、朋友、戀人的最好選擇。','1',25,2,1,45,0,'4','1','1'),(21,'0618','product/birth/0618.jpg','100','《生日快樂》<br>擁有屬於自己的生日行星，當作禮物送給家人、朋友、戀人的最好選擇。','1',20,1,2,12,0,'4','2','1'),(22,'1102','product/birth/1102.jpg','100','《生日快樂》<br>擁有屬於自己的生日行星，當作禮物送給家人、朋友、戀人的最好選擇。','1',30,8,5,56,0,'4','3','1'),(23,'1212','product/birth/1212.jpg','100','《生日快樂》<br>擁有屬於自己的生日行星，當作禮物送給家人、朋友、戀人的最好選擇。','1',45,5,8,45,0,'4','4','1');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-10 22:26:41
