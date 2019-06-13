-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: sdss2_0
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `acc_bot`
--

DROP TABLE IF EXISTS `acc_bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_bot` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_mid_uid` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `acc_cs_uid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `name_ac` varchar(45) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_acc_bot_acc_mid1_idx` (`acc_mid_uid`),
  KEY `fk_acc_bot_acc_top1_idx` (`acc_cs_uid`),
  CONSTRAINT `fk_acc_bot_acc_cs1` FOREIGN KEY (`acc_cs_uid`) REFERENCES `acc_mid` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_bot_acc_mid1` FOREIGN KEY (`acc_mid_uid`) REFERENCES `acc_mid` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_bot`
--

LOCK TABLES `acc_bot` WRITE;
/*!40000 ALTER TABLE `acc_bot` DISABLE KEYS */;
INSERT INTO `acc_bot` VALUES (1,1,1100,1,'普通預金（郵貯）','yuutyo',NULL),(2,1,1110,1,'普通預金（MUFG）','mufg',NULL),(3,1,1120,1,'普通預金（中国銀行）','tyuugoku',NULL),(4,1,1130,1,'普通預金（みなと）','minato',NULL),(5,1,1140,1,'特定口座（丸三）','marusan',NULL),(6,1,1150,1,'現金','genkin',NULL),(7,1,1160,1,'ICOCA','icoca',NULL),(8,1,1170,1,'ヨドバシポイント','yodobashi',NULL),(9,2,2100,1,'有価証券','yuuka',NULL),(10,2,2110,1,'為替出資金','kawasesyussi',NULL),(11,2,2120,1,'出資金','syussi',NULL),(12,2,2130,1,'繰延投資利益','kurinobetousirieki',NULL),(13,3,3100,1,'ソフトウェア','software',NULL),(14,3,3110,1,'土地','tochi',NULL),(15,3,3120,1,'備品','bihin',NULL),(16,3,3130,1,'建物','tatemono',NULL),(17,3,3140,1,'車両','syaryou',NULL),(18,7,7050,1,'固定資産減価償却累計額','genkaruikei',NULL),(19,4,4100,1,'前払金','maebaraikin',NULL),(20,4,4110,1,'前払保険料','maebaraihokenryou',NULL),(21,4,4120,1,'前払費用','maebaraihiyou',NULL),(22,4,4130,1,'未収金','misyuukin',NULL),(23,4,4140,1,'使途不明金','sitohumeikin',NULL),(24,5,5100,1,'未払金（セゾン）','mibaraisezon',NULL),(25,5,5110,1,'未払金（ETC）','mibaraietc',NULL),(26,5,5120,1,'未払金（J-WEST）','mibaraijwest',NULL),(27,5,5130,1,'未払保険料','mibaraihokenryou',NULL),(28,5,5140,1,'その他未払金','sonotamibarai',NULL),(29,5,5150,1,'繰延投資損失','kurinobetousisonneki',NULL),(30,6,6100,1,'未払金（長期ローン）','mibarailoan',NULL),(31,7,7100,1,'繰越利益剰余金','kurikosiriekijyouyokin',NULL),(32,7,7110,1,'資本金','sihonkin',NULL),(33,7,7120,1,'当期純損益','toukiyunnsoneki',NULL),(34,8,8100,1,'その他利害関係者持分','sonotarigai',NULL),(35,16,8800,1,'その他評価換算差額','sonotahyouka',NULL),(36,9,9100,1,'通勤費','tuukin',NULL),(37,9,9110,1,'出張費','syuttyou',NULL),(38,9,9120,1,'接待交際費','settai',NULL),(39,9,9130,1,'事務費','jimu',NULL),(40,9,9140,1,'通信費','tuusin',NULL),(41,9,9150,1,'服飾費（原価）','hukusyokugenka',NULL),(42,9,9160,1,'機器購入費（原価）','kikikounyuugenka',NULL),(43,9,9170,1,'自己投資費','jikotousi',NULL),(44,9,9180,1,'機器修繕費','kikisyuuzen',NULL),(45,9,9190,1,'支払利息（原価）','siharairisokugenka',NULL),(46,9,9200,1,'支払手数料（原価）','siharaitesuuryougenka',NULL),(47,9,9210,1,'租税公課（原価）','sozeikoukagenka',NULL),(48,9,9220,1,'その他売上原価','sonotauriagegenka',NULL),(49,10,10100,1,'支払家賃','siharaiyatin',NULL),(50,10,10110,1,'租税公課（住居費）','sozeikoukajyuukyo',NULL),(51,10,10120,1,'支払利息（住居費）','siharairisokujyuukyo',NULL),(52,10,10130,1,'住居修繕費','jyuukyosyuuzen',NULL),(53,10,10140,1,'旅費交通費','ryohikoutuuhi',NULL),(54,10,10150,1,'食費','syokuhi',NULL),(55,10,10160,1,'飲料費','inryouhi',NULL),(56,10,10170,1,'医療・厚生費','iryoukouseihi',NULL),(57,10,10180,1,'新聞図書費','sinbunntosyohi',NULL),(58,10,10190,1,'消耗品費','syoumouhinnhi',NULL),(59,10,10200,1,'服飾費（生活）','hukusyokuseikatu',NULL),(60,10,10210,1,'光熱水費（水道）','kounetusuidou',NULL),(61,10,10220,1,'光熱水費（電気）','kounetudenki',NULL),(62,10,10230,1,'光熱水費（ガス）','kounetugasu',NULL),(63,10,10240,1,'雑品購入費','zappin',NULL),(64,10,10250,1,'支払手数料（生活費）','siharaitesuuryouseikatu',NULL),(65,10,10260,1,'その他生活費','sonotaseikatuhi',NULL),(66,11,11100,1,'外食費','gaisyoku',NULL),(67,11,11110,1,'菓子類','kasirui',NULL),(68,11,11120,1,'喫茶費','kissa',NULL),(69,11,11130,1,'交友費','kouyuu',NULL),(70,11,11140,1,'娯楽費','goraku',NULL),(71,11,11150,1,'機器購入費（娯楽）','kikikounyugoraku',NULL),(72,11,11160,1,'その他娯楽費','sonotagoraku',NULL),(73,12,12100,1,'所得税','syotokuzei',NULL),(74,12,12110,1,'租税公課（一般費）','sozeikoukaippan',NULL),(75,12,12120,1,'厚生年金保険料','kouseinennkin',NULL),(76,12,12130,1,'国民年金保険料','kokuminnenkin',NULL),(77,12,12140,1,'社会保険料','syaho',NULL),(78,12,12150,1,'国民健康保険料','kokuho',NULL),(79,12,12160,1,'市民・県民税','siminkennminnzei',NULL),(80,12,12170,1,'雇用保険料','koyouhokenryou',NULL),(81,12,12180,1,'減価償却費','genkasyoukyakuhi',NULL),(82,12,12190,1,'車両保険料','syaryouhokenryou',NULL),(83,12,12200,1,'生命保険料','seimeihokenryou',NULL),(84,12,12210,1,'その他保険料','sonotahokenryou',NULL),(85,12,12220,1,'その他公的支出','sonotakoutekisisyutu',NULL),(86,12,12230,1,'寄付','kihu',NULL),(87,13,13100,1,'有価証券売却損','yuukasyoukenbaikyakuzon',NULL),(88,13,13110,1,'有価証券評価損','yuukasyoukenhyoukazon',NULL),(89,13,13120,1,'為替差損失','kawasesasonnsitu',NULL),(90,13,13130,1,'その他投資損失','sonotatousisonnsitu',NULL),(91,13,13140,1,'特別損失','tokubetusonnsitu',NULL),(92,14,14100,1,'給与所得','kyuuyosyotoku',NULL),(93,14,14110,1,'売上','uriage',NULL),(94,15,15100,1,'有価証券売却益','yuukasyoukenbaikyakueki',NULL),(95,15,15110,1,'有価証券評価益','yuukasyoukennhyoukaeki',NULL),(96,15,15120,1,'為替差益','kawasesaeki',NULL),(97,15,15130,1,'受取利息','uketoririsoku',NULL),(98,15,15140,1,'受取配当金','uketorihaitoukin',NULL),(99,15,15150,1,'還付金','kannpusyoukankin',NULL),(100,15,15160,1,'その他特別利益','sonotatokubeturieki',NULL),(101,17,0,17,'（選択してください）','','初期表示用');
/*!40000 ALTER TABLE `acc_bot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_mid`
--

DROP TABLE IF EXISTS `acc_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_mid` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_top_uid` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_acc_mid_acc_top_idx` (`acc_top_uid`),
  CONSTRAINT `fk_acc_mid_acc_top` FOREIGN KEY (`acc_top_uid`) REFERENCES `acc_top` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_mid`
--

LOCK TABLES `acc_mid` WRITE;
/*!40000 ALTER TABLE `acc_mid` DISABLE KEYS */;
INSERT INTO `acc_mid` VALUES (1,1,1100,'現金預金',''),(2,1,1200,'投資資産等',NULL),(3,1,1300,'固定資産',NULL),(4,1,1400,'繰延資産',NULL),(5,2,2100,'流動負債',NULL),(6,2,2200,'固定負債',NULL),(7,3,3100,'自己資本',NULL),(8,3,3200,'他人資本',NULL),(9,4,4100,'売上原価',NULL),(10,4,4200,'生活費',NULL),(11,4,4300,'娯楽交友費',NULL),(12,4,4400,'一般費',NULL),(13,4,4500,'営業外費用',NULL),(14,5,5100,'営業収益',NULL),(15,5,5200,'営業外収益',NULL),(16,3,3300,'評価換算差額等',NULL),(17,9,0,'ダミー','ダミー入力用');
/*!40000 ALTER TABLE `acc_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_top`
--

DROP TABLE IF EXISTS `acc_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_top` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `union_bs1_pl2_cs3` int(11) DEFAULT NULL,
  `is_br` int(11) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_top`
--

LOCK TABLES `acc_top` WRITE;
/*!40000 ALTER TABLE `acc_top` DISABLE KEYS */;
INSERT INTO `acc_top` VALUES (1,'資産',1,1,'',1),(2,'負債',1,-1,NULL,1),(3,'純資産',1,-1,NULL,1),(4,'費用',2,1,'',1),(5,'収益',2,-1,NULL,1),(6,'営業活動によるキャッシュフロー',3,1,NULL,1),(7,'投資活動によるキャッシュフロー',3,1,NULL,1),(8,'財務活動によるキャッシュフロー',3,1,NULL,1),(9,'ダミー',0,0,NULL,1);
/*!40000 ALTER TABLE `acc_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_group`
--

DROP TABLE IF EXISTS `account_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_group` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_group`
--

LOCK TABLES `account_group` WRITE;
/*!40000 ALTER TABLE `account_group` DISABLE KEYS */;
INSERT INTO `account_group` VALUES (1,'食べ飲み関係',1000,'飲食全般（生活費と娯楽費まとめて）');
/*!40000 ALTER TABLE `account_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_group_list`
--

DROP TABLE IF EXISTS `account_group_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_group_list` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(200) DEFAULT NULL,
  `acc_bot_uid` int(11) NOT NULL,
  `account_group_uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `account_group_list_acc_bot_uid_655ffc6f_fk_acc_bot_uid` (`acc_bot_uid`),
  KEY `account_group_list_account_group_uid_ebe4816f_fk_account_g` (`account_group_uid`),
  CONSTRAINT `account_group_list_acc_bot_uid_655ffc6f_fk_acc_bot_uid` FOREIGN KEY (`acc_bot_uid`) REFERENCES `acc_bot` (`uid`),
  CONSTRAINT `account_group_list_account_group_uid_ebe4816f_fk_account_g` FOREIGN KEY (`account_group_uid`) REFERENCES `account_group` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_group_list`
--

LOCK TABLES `account_group_list` WRITE;
/*!40000 ALTER TABLE `account_group_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_group_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add acc bot',7,'add_accbot'),(26,'Can change acc bot',7,'change_accbot'),(27,'Can delete acc bot',7,'delete_accbot'),(28,'Can view acc bot',7,'view_accbot'),(29,'Can add acc mid',8,'add_accmid'),(30,'Can change acc mid',8,'change_accmid'),(31,'Can delete acc mid',8,'delete_accmid'),(32,'Can view acc mid',8,'view_accmid'),(33,'Can add acc top',9,'add_acctop'),(34,'Can change acc top',9,'change_acctop'),(35,'Can delete acc top',9,'delete_acctop'),(36,'Can view acc top',9,'view_acctop'),(37,'Can add budget',10,'add_budget'),(38,'Can change budget',10,'change_budget'),(39,'Can delete budget',10,'delete_budget'),(40,'Can view budget',10,'view_budget'),(41,'Can add journal',11,'add_journal'),(42,'Can change journal',11,'change_journal'),(43,'Can delete journal',11,'delete_journal'),(44,'Can view journal',11,'view_journal'),(45,'Can add regularly payment',12,'add_regularlypayment'),(46,'Can change regularly payment',12,'change_regularlypayment'),(47,'Can delete regularly payment',12,'delete_regularlypayment'),(48,'Can view regularly payment',12,'view_regularlypayment'),(49,'Can add fixed asset',13,'add_fixedasset'),(50,'Can change fixed asset',13,'change_fixedasset'),(51,'Can delete fixed asset',13,'delete_fixedasset'),(52,'Can view fixed asset',13,'view_fixedasset'),(53,'Can add account group list',14,'add_accountgrouplist'),(54,'Can change account group list',14,'change_accountgrouplist'),(55,'Can delete account group list',14,'delete_accountgrouplist'),(56,'Can view account group list',14,'view_accountgrouplist'),(57,'Can add account group',15,'add_accountgroup'),(58,'Can change account group',15,'change_accountgroup'),(59,'Can delete account group',15,'delete_accountgroup'),(60,'Can view account group',15,'view_accountgroup');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$U6mvGPCPYpCp$7GtzCAZhPdZ3CYaewSYnYYFQtxq51FGqvnMZe8ddjKk=','2019-04-19 11:34:06.165117',1,'wtaichi','','','wakisaka.taichi@gmail.com',1,1,'2019-02-16 04:47:24.070385');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_bot_uid` int(11) NOT NULL,
  `from` varchar(10) NOT NULL DEFAULT '1900-01-01',
  `for` varchar(10) NOT NULL DEFAULT '2100-12-31',
  `amount_per_month` int(11) NOT NULL DEFAULT '0',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_budget_acc_bot1_idx` (`acc_bot_uid`),
  CONSTRAINT `fk_budget_acc_bot1` FOREIGN KEY (`acc_bot_uid`) REFERENCES `acc_bot` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,36,'20190329','22001231',10000,'とりあえず設定'),(2,39,'20190329','22001231',3000,'とりあえず'),(3,40,'20190401','22001231',10000,'高い・・・高くない？'),(4,49,'20190401','22001231',50000,NULL);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-16 16:00:45.312689','487','Journal object (487)',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',11,1),(2,'2019-03-29 12:46:45.645371','1','Budget object (1)',1,'[{\"added\": {}}]',10,1),(3,'2019-03-29 12:55:53.125092','2','Budget object (2)',1,'[{\"added\": {}}]',10,1),(4,'2019-03-29 13:51:56.789879','2','Budget object (2)',2,'[{\"changed\": {\"fields\": [\"acc_bot_uid\"]}}]',10,1),(5,'2019-04-01 03:37:45.171264','1','Budget object (1)',2,'[{\"changed\": {\"fields\": [\"acc_bot_uid\", \"for_field\", \"amount_per_month\", \"note\"]}}]',10,1),(6,'2019-04-01 03:39:08.378389','2','Budget object (2)',2,'[{\"changed\": {\"fields\": [\"acc_bot_uid\", \"from_field\", \"for_field\", \"note\"]}}]',10,1),(7,'2019-04-01 03:40:02.931049','3','Budget object (3)',1,'[{\"added\": {}}]',10,1),(8,'2019-04-01 03:49:48.480478','4','Budget object (4)',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'sdss','accbot'),(8,'sdss','accmid'),(15,'sdss','accountgroup'),(14,'sdss','accountgrouplist'),(9,'sdss','acctop'),(10,'sdss','budget'),(13,'sdss','fixedasset'),(11,'sdss','journal'),(12,'sdss','regularlypayment'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-29 06:14:09.072186'),(2,'auth','0001_initial','2018-10-29 06:14:10.080884'),(3,'admin','0001_initial','2018-10-29 06:14:10.263324'),(4,'admin','0002_logentry_remove_auto_add','2018-10-29 06:14:10.273508'),(5,'admin','0003_logentry_add_action_flag_choices','2018-10-29 06:14:10.291952'),(6,'contenttypes','0002_remove_content_type_name','2018-10-29 06:14:10.379850'),(7,'auth','0002_alter_permission_name_max_length','2018-10-29 06:14:10.478803'),(8,'auth','0003_alter_user_email_max_length','2018-10-29 06:14:10.555400'),(9,'auth','0004_alter_user_username_opts','2018-10-29 06:14:10.563461'),(10,'auth','0005_alter_user_last_login_null','2018-10-29 06:14:10.600927'),(11,'auth','0006_require_contenttypes_0002','2018-10-29 06:14:10.604606'),(12,'auth','0007_alter_validators_add_error_messages','2018-10-29 06:14:10.612882'),(13,'auth','0008_alter_user_username_max_length','2018-10-29 06:14:10.717074'),(14,'auth','0009_alter_user_last_name_max_length','2018-10-29 06:14:10.794916'),(15,'sdss','0001_initial','2018-10-29 06:14:10.802408'),(16,'sessions','0001_initial','2018-10-29 06:14:10.839123'),(17,'sdss','0002_regularlypayment','2019-03-16 04:11:43.429955'),(18,'sdss','0003_regularlypayment_payment_day','2019-03-17 08:39:23.575642'),(19,'sdss','0004_auto_20190317_0839','2019-03-17 08:39:23.697443'),(20,'sdss','0005_auto_20190318_0114','2019-03-18 01:15:46.602954'),(21,'sdss','0006_auto_20190401_1534','2019-04-01 15:34:17.756787'),(22,'sdss','0007_auto_20190404_0121','2019-04-04 01:21:26.546808'),(23,'sdss','0008_auto_20190418_0155','2019-04-18 01:55:35.556225'),(24,'sdss','0009_accountgroup_accountgrouplist','2019-04-27 14:18:40.990068');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('aveohszpj1y805cjasdn32r9o8bkhtm8','YTZlOTM5MGQwZjJlY2NkOGFjNmVhYjJkYmY5MWY5OWVlZjE2ZjQ0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmY1NzQ5MzkwMWIwNWUzZTRhOGY4NzdiYjBlZDE3NDY5MzQwYWI2In0=','2019-03-03 06:11:11.739922'),('nj3amn58pif3wgp7b03ynwvdyaev0x4s','YTZlOTM5MGQwZjJlY2NkOGFjNmVhYjJkYmY5MWY5OWVlZjE2ZjQ0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmY1NzQ5MzkwMWIwNWUzZTRhOGY4NzdiYjBlZDE3NDY5MzQwYWI2In0=','2019-05-03 11:34:06.172522'),('yi48c36xztvdc0818xntd3j3erueurww','YTZlOTM5MGQwZjJlY2NkOGFjNmVhYjJkYmY5MWY5OWVlZjE2ZjQ0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmY1NzQ5MzkwMWIwNWUzZTRhOGY4NzdiYjBlZDE3NDY5MzQwYWI2In0=','2019-04-12 12:40:29.309253');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_asset`
--

DROP TABLE IF EXISTS `fixed_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixed_asset` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(20) DEFAULT NULL,
  `asset_name` varchar(45) NOT NULL,
  `get_date` varchar(10) NOT NULL,
  `acquisition_cost` int(11) NOT NULL,
  `carrying_value` int(11) NOT NULL,
  `amortization_way` varchar(10) NOT NULL,
  `amortization_term_in_month` int(11) NOT NULL,
  `passed_months` int(11) NOT NULL,
  `amortization_cost_per_month` int(11) NOT NULL,
  `amortizated_total_cost` int(11) NOT NULL,
  `sales_income` int(11) NOT NULL,
  `is_using` tinyint(1) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `acc_bot_uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `fixed_asset_acc_bot_uid_3211863f_fk_acc_bot_uid` (`acc_bot_uid`),
  CONSTRAINT `fixed_asset_acc_bot_uid_3211863f_fk_acc_bot_uid` FOREIGN KEY (`acc_bot_uid`) REFERENCES `acc_bot` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_asset`
--

LOCK TABLES `fixed_asset` WRITE;
/*!40000 ALTER TABLE `fixed_asset` DISABLE KEYS */;
INSERT INTO `fixed_asset` VALUES (1,'fshi0201209','test','20180417',198000,132000,'定額法',36,0,5500,66000,0,0,'test',13),(2,'shi020202','test','20180317',2000000,1277785,'定額法',36,0,55555,722215,0,1,'test',14);
/*!40000 ALTER TABLE `fixed_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `was_regist_by_system` tinyint(1) DEFAULT '1',
  `group_id` varchar(20) NOT NULL,
  `br_acc_bot_uid` int(11) NOT NULL,
  `br_amount` int(11) DEFAULT NULL,
  `cr_acc_bot_uid` int(11) NOT NULL,
  `cr_amount` int(11) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_journal_acc_bot1_idx` (`br_acc_bot_uid`),
  KEY `fk_journal_acc_bot2_idx` (`cr_acc_bot_uid`),
  CONSTRAINT `fk_journal_acc_bot1` FOREIGN KEY (`br_acc_bot_uid`) REFERENCES `acc_bot` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_journal_acc_bot2` FOREIGN KEY (`cr_acc_bot_uid`) REFERENCES `acc_bot` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (23,'20181031',1,'20181109060636702022',7,4784,32,2038138,'初期値'),(24,'20181031',1,'20181109060636702022',1,804686,101,0,''),(25,'20181031',1,'20181109060636702022',4,148093,101,0,''),(26,'20181031',1,'20181109060636702022',2,696086,101,0,''),(27,'20181031',1,'20181109060636702022',3,384489,101,0,''),(42,'20181031',1,'20181109071236655151',6,113086,32,3858396,'initial'),(43,'20181031',1,'20181109071236655151',9,3253380,101,0,''),(44,'20181031',1,'20181109071236655151',5,441156,101,0,''),(45,'20181031',1,'20181109071236655151',21,38000,101,0,''),(46,'20181031',1,'20181109071236655151',13,12774,101,0,''),(47,'20181031',1,'20181109071316776999',15,5252832,32,5252832,''),(48,'20181031',1,'20181109071447481183',32,32387,24,32387,'initial'),(49,'20181101',1,'20181116033737837097',49,38000,21,38000,''),(50,'20181101',1,'20181116033854535290',62,1895,3,1895,''),(51,'20181101',1,'20181116033918215267',24,101915,1,101915,''),(52,'20181104',1,'20181116034033027623',54,732,6,732,''),(53,'20181104',1,'20181116034033027623',55,259,6,457,''),(54,'20181104',1,'20181116034033027623',67,198,101,0,''),(55,'20181104',1,'20181116034033027623',55,252,6,252,''),(56,'20181103',1,'20181116034307236308',53,6400,6,6400,'京都行費用。1100円は西明石での駐車場代'),(57,'20181103',1,'20181116034307236308',53,1100,6,1100,''),(58,'20181103',1,'20181116034307236308',54,2150,6,2150,''),(59,'20181104',1,'20181116034344393773',67,558,6,558,''),(60,'20181104',1,'20181116034344393773',54,1098,6,1098,''),(61,'20181106',1,'20181116034422057562',58,306,6,306,'トイレットペーパー4ロール'),(62,'20181102',1,'20181116034508531062',54,933,6,1388,''),(63,'20181102',1,'20181116034508531062',67,105,101,0,''),(64,'20181102',1,'20181116034508531062',55,350,101,0,''),(65,'20181106',1,'20181116034537151781',54,856,6,1456,''),(66,'20181106',1,'20181116034537151781',67,600,101,0,''),(67,'20181109',1,'20181116034623335825',54,120,6,753,''),(68,'20181109',1,'20181116034623335825',55,300,101,0,''),(69,'20181109',1,'20181116034623335825',67,333,101,0,''),(70,'20181110',1,'20181116034727782335',55,300,6,445,''),(71,'20181110',1,'20181116034727782335',67,145,101,0,''),(72,'20181110',1,'20181116034727782335',54,240,6,240,''),(73,'20181110',1,'20181116034826256014',66,4082,6,4082,'リトファンとスタバ。改めて見るとすごい金額だ・・・。'),(74,'20181110',1,'20181116034826256014',68,1026,6,1026,''),(75,'20181111',1,'20181116034918468975',66,2062,6,2062,'すしろー'),(76,'20181111',1,'20181116035015803920',67,475,6,475,''),(77,'20181111',1,'20181116035015803920',67,410,6,410,''),(78,'20181111',1,'20181116035015803920',54,367,6,367,''),(79,'20181112',1,'20181116035108294134',54,2364,6,2685,''),(80,'20181112',1,'20181116035108294134',67,105,101,0,''),(81,'20181112',1,'20181116035108294134',55,216,101,0,''),(82,'20181114',1,'20181116035133556618',54,1749,6,2149,''),(83,'20181114',1,'20181116035133556618',67,400,101,0,''),(84,'20181103',1,'20181119072744813818',54,450,6,450,''),(85,'20181103',1,'20181119072815144407',66,1130,6,1130,''),(86,'20181118',1,'20181119072909232347',54,115,6,223,''),(87,'20181118',1,'20181119072909232347',55,108,101,0,''),(88,'20181118',1,'20181119072942241526',55,108,6,216,''),(89,'20181118',1,'20181119072942241526',67,108,101,0,''),(90,'20181118',1,'20181119073012070134',66,4436,6,4436,''),(91,'20181118',1,'20181119073113788876',54,1052,6,1362,''),(92,'20181118',1,'20181119073113788876',55,226,101,0,''),(93,'20181118',1,'20181119073113788876',67,84,101,0,''),(94,'20181118',1,'20181119073325787767',53,500,6,500,'駐車場代@岡山'),(95,'20181119',1,'20181119073619762752',62,2644,28,2644,''),(96,'20180928',1,'20181119073911488624',76,16340,6,16340,''),(97,'20181031',1,'20181119073938135558',76,16340,6,16340,''),(98,'20181119',1,'20181119074059806570',76,16340,3,80000,''),(99,'20181119',1,'20181119074059806570',78,26200,101,0,''),(100,'20181119',1,'20181119074059806570',6,37460,101,0,''),(101,'20181119',1,'20181119074157760950',22,50000,100,50000,'スバル不正検査に対する補償金処理'),(102,'20181120',1,'20181121011523391427',67,237,6,237,'ミスドのポケモンドーナツを求めて・・・'),(103,'20181120',1,'20181121011523391427',67,216,6,216,''),(104,'20181120',1,'20181121011523391427',69,432,6,540,''),(105,'20181120',1,'20181121011523391427',67,108,101,0,''),(106,'20181120',1,'20181121011558759212',55,84,6,316,''),(107,'20181120',1,'20181121011558759212',54,232,101,0,''),(108,'20181120',1,'20181121011646522732',68,345,6,345,'スタバブレンドコーヒー トールサイズ'),(109,'20181120',1,'20181121011852523229',53,5266,6,5266,'ガソリン代 35.34L 532.6km 15.1km/L'),(110,'20181119',1,'20181121012215399922',54,1849,6,2299,''),(111,'20181119',1,'20181121012215399922',55,450,101,0,''),(112,'20181119',1,'20181121012300929296',59,4990,6,5269,''),(113,'20181119',1,'20181121012300929296',58,279,101,0,''),(114,'20181121',1,'20181121074016973904',61,3841,28,3841,''),(115,'20181122',1,'20181122090453568198',3,200,6,200,''),(116,'20181123',1,'20181123130747214707',66,1175,6,1175,'ミスタードーナツ飲食'),(117,'20181123',1,'20181123130849625925',54,326,6,794,''),(118,'20181123',1,'20181123130849625925',67,160,101,0,''),(119,'20181123',1,'20181123130849625925',55,308,101,0,''),(120,'20181123',1,'20181123130922783985',66,1467,6,1467,'西崎食堂 飲食'),(121,'20181123',1,'20181123130939041995',68,918,6,918,''),(122,'20181123',1,'20181123141339730951',70,2000,6,2000,'ラウンドワンボーリング2ゲーム'),(123,'20181124',1,'20181126003034206210',54,295,6,295,''),(124,'20181124',1,'20181126003034206210',54,920,6,1101,''),(125,'20181124',1,'20181126003034206210',67,181,101,0,''),(126,'20181124',1,'20181126003253374934',70,1000,6,1000,'カラオケとやつのガソリン代'),(127,'20181124',1,'20181126003253374934',53,2000,6,2000,''),(128,'20181124',1,'20181126003355730377',68,905,6,905,'ミスド'),(129,'20181126',1,'20181126003520337358',59,11800,24,11800,'カバン購入'),(130,'20181122',1,'20181127112404905364',54,1491,6,1811,''),(131,'20181122',1,'20181127112404905364',67,320,101,0,''),(132,'20181128',1,'20181204035330270931',54,1475,6,1797,''),(133,'20181128',1,'20181204035330270931',67,322,101,0,''),(134,'20181129',1,'20181204035357179157',54,321,6,741,''),(135,'20181129',1,'20181204035357179157',55,420,101,0,''),(136,'20181124',1,'20181204041330055285',53,410,25,410,''),(137,'20181201',1,'20181205043644520012',49,38000,21,38000,''),(138,'20181201',1,'20181205043721491800',54,320,6,465,'吉備SA飲食'),(139,'20181201',1,'20181205043721491800',55,145,101,0,''),(140,'20181202',1,'20181205043744777986',54,315,6,315,''),(141,'20181202',1,'20181205043806808919',66,2568,6,2568,'ミスターバーグ'),(142,'20181202',1,'20181205043837371315',68,646,6,646,'ミスドでお茶'),(143,'20181202',1,'20181205043921824177',56,1234,6,1234,''),(144,'20181112',1,'20181205044604623426',26,20310,2,20310,'交通費その他支払'),(145,'20181203',1,'20181205045348600651',28,2644,3,2644,'前月都市ガス'),(146,'20181126',1,'20181205045855014019',82,7950,3,7950,'自動車保険料'),(147,'20181205',1,'20181205050151289012',3,40248,32,40248,'金額修正（原因不明）'),(148,'20181203',1,'20181206040821410756',54,1006,6,1131,'ario'),(149,'20181203',1,'20181206040821410756',55,125,101,0,''),(150,'20181203',1,'20181206040914173330',67,405,6,2195,'Ario無印 バーム３個と乳液'),(151,'20181203',1,'20181206040914173330',56,1790,101,0,''),(152,'20181203',1,'20181206041142419654',58,1363,6,1661,'コーナンで敷きパッド冬用とチョコ'),(153,'20181203',1,'20181206041142419654',67,298,101,0,''),(154,'20181206',1,'20181206041407752432',43,12592,24,12592,'SwichScience M5Stack他開発用HW'),(155,'20181206',1,'20181206041715176091',71,25600,24,34278,'Amazon買い物 機器は３Dプリンタ 交友は山口ういろう'),(156,'20181206',1,'20181206041715176091',57,8678,101,0,''),(157,'20181206',1,'20181206041715176091',69,5039,24,5039,''),(158,'20181126',1,'20181206042024108051',40,4104,1,4104,'インターネット代'),(159,'20181127',1,'20181206042126026472',21,38000,1,38324,'家賃前払い'),(160,'20181127',1,'20181206042126026472',46,324,101,0,''),(161,'20181204',1,'20181206042211702461',24,28718,1,28718,'何らかの支払'),(162,'20181116',1,'20181206042307159463',6,36000,1,36000,''),(163,'20181130',1,'20181206042541337509',101,50000,22,50000,'スバル不正弁済金回収'),(164,'20181205',1,'20181206073521500211',54,1483,6,2193,''),(165,'20181205',1,'20181206073521500211',67,550,101,0,''),(166,'20181205',1,'20181206073521500211',55,160,101,0,''),(167,'20181206',1,'20181206073630367483',67,701,6,701,'ミスド ピカチュウx2他'),(169,'20181207',1,'20181212054744740945',54,531,6,825,''),(170,'20181207',1,'20181212054744740945',55,294,101,0,''),(171,'20181209',1,'20181212054839045117',54,772,6,1221,''),(172,'20181209',1,'20181212054839045117',55,350,101,0,''),(173,'20181209',1,'20181212054839045117',67,99,101,0,''),(174,'20181209',1,'20181212054914335609',68,1219,6,1219,''),(175,'20181209',1,'20181212054937400729',66,1800,6,1800,'はちや ランチ'),(176,'20181209',1,'20181212054957987437',58,1213,6,1213,''),(177,'20181211',1,'20181217024543514869',54,914,6,1468,''),(178,'20181211',1,'20181217024543514869',55,233,101,0,''),(179,'20181211',1,'20181217024543514869',67,321,101,0,''),(180,'20181212',1,'20181217024615148278',54,1250,6,1410,''),(181,'20181212',1,'20181217024615148278',55,160,101,0,''),(182,'20181215',1,'20181217024646419296',54,152,6,822,''),(183,'20181215',1,'20181217024646419296',67,502,101,0,''),(184,'20181215',1,'20181217024646419296',55,168,101,0,''),(185,'20181215',1,'20181217024714665641',58,1294,6,1908,''),(186,'20181215',1,'20181217024714665641',55,520,101,0,''),(187,'20181215',1,'20181217024714665641',67,94,101,0,''),(188,'20181216',1,'20181217024756128482',66,600,6,600,'千成屋 たこやき3パック'),(189,'20181216',1,'20181217024853291719',66,700,6,700,'与島PA うどんかけ 大と小'),(190,'20181216',1,'20181217024939432591',67,1004,6,1004,'与島PA 吉備大福と柿のやつ'),(191,'20181216',1,'20181217025046384045',53,5211,6,5211,'ガソリン代 37.22L 502.8km 13.5km/L'),(192,'20181216',1,'20181217025127382774',68,1026,6,1026,'スタバ ピスタチオ温とジンジャーブレッドラテ温'),(193,'20181216',1,'20181217025210097597',53,1540,25,1540,'児島IC～与島PAの往復代'),(194,'20181206',1,'20181217025501968865',67,148,6,762,''),(195,'20181206',1,'20181217025501968865',55,200,101,0,''),(196,'20181206',1,'20181217025501968865',54,414,101,0,''),(197,'20181215',1,'20181217025610468454',59,900,6,900,'コインランドリー代（洗濯機故障中・・・）'),(198,'20181008',1,'20181221023133488315',53,6801,6,6801,'山陽道小谷SAにて給油'),(199,'20181110',1,'20181221023430451274',53,3780,6,3780,'一宮給油'),(200,'20181214',1,'20181221054953637610',76,16340,6,42540,''),(201,'20181214',1,'20181221054953637610',78,26200,101,0,''),(202,'20181218',1,'20181221055150588019',54,1283,6,1591,''),(203,'20181218',1,'20181221055150588019',55,200,101,0,''),(204,'20181218',1,'20181221055150588019',67,108,101,0,''),(205,'20181220',1,'20181221055309411617',54,300,6,889,''),(206,'20181220',1,'20181221055309411617',55,291,101,0,''),(207,'20181220',1,'20181221055309411617',67,298,101,0,''),(208,'20181220',1,'20181221055335860746',63,1134,6,1134,'本立て@ロフト'),(209,'20181220',1,'20181221055407732010',54,320,6,597,''),(210,'20181220',1,'20181221055407732010',55,277,101,0,''),(211,'20181220',1,'20181221055426810698',59,800,6,800,'洗濯代'),(212,'20181214',1,'20181221055550846493',6,50000,1,50000,'国保等支払用'),(213,'20181219',1,'20181221055629899426',6,20000,3,20000,'新札両替用'),(214,'20181103',1,'20181228013109790393',53,3370,7,3370,'京都行 西明石～京都と京都市内移動 2個目は金額調整'),(215,'20181103',1,'20181228013109790393',7,16,100,16,''),(216,'20181128',1,'20181228013228626872',53,520,7,520,'岡山県内移動'),(217,'20181128',1,'20181228013228626872',7,5000,26,5000,''),(218,'20181218',1,'20181228013440210745',53,640,7,640,'岡山～倉敷'),(219,'20181223',1,'20181228013523853285',53,1360,7,1360,'新三田～梅田往復'),(220,'20181222',1,'20181228015919540151',69,2160,6,2160,'えびせん高級'),(221,'20181222',1,'20181228015939461943',66,2550,6,2550,''),(222,'20181222',1,'20181228020015627899',54,2384,6,2384,'かにすき！'),(223,'20181222',1,'20181228020120976983',54,276,6,1434,'宅飲み用'),(224,'20181222',1,'20181228020120976983',55,412,101,0,''),(225,'20181222',1,'20181228020120976983',67,746,101,0,''),(226,'20181223',1,'20181228020208482324',70,3240,6,3240,'梅田タワレコにて洋楽アルバム3枚 久々！！'),(227,'20181223',1,'20181228020306514032',66,2268,6,2268,'梅田の五右衛門 阪急上 19F？'),(228,'20181223',1,'20181228020436858747',54,614,6,968,'相生ファミマにて軽く昼食 彼女氏がスープを盛大に倒す'),(229,'20181223',1,'20181228020436858747',55,150,101,0,''),(230,'20181223',1,'20181228020436858747',67,204,101,0,''),(231,'20181223',1,'20181228020509896937',55,132,6,242,''),(232,'20181223',1,'20181228020509896937',54,110,101,0,''),(233,'20181223',1,'20181228020658963530',53,3436,6,3436,'新三田駅前ガソリンスタンド アイにフル給油 24L'),(234,'20181223',1,'20181228020739796904',55,151,6,151,'ローソン加東 ほうじ茶ラテ'),(235,'20181224',1,'20181228020815426223',54,550,6,550,'ハビーズ大安寺 お鍋食材'),(236,'20181224',1,'20181228020904571582',66,2750,6,2750,'津山アルネ裏のお洒落蕎麦屋さんにて'),(237,'20181224',1,'20181228020946601267',68,1500,6,1500,'津山コメダ ケーキセットx2♪'),(238,'20181224',1,'20181228021042636648',56,1280,6,1280,'海水？ぽくなる塩入浴剤＠MIMOSA大安寺'),(239,'20181224',1,'20181228021117297487',54,238,6,338,'翌日用'),(240,'20181224',1,'20181228021117297487',55,100,101,0,''),(241,'20181226',1,'20181228021901357744',69,1207,6,1207,'年賀状代'),(242,'20181226',1,'20181228021935716006',55,728,6,2441,''),(243,'20181226',1,'20181228021935716006',54,1713,101,0,''),(244,'20181227',1,'20181228022036752348',53,4504,6,4504,'給油＠赤澤屋 142円'),(245,'20181228',1,'20190107042149168621',54,622,6,2048,''),(246,'20181228',1,'20190107042149168621',55,458,101,0,''),(247,'20181228',1,'20190107042149168621',67,968,101,0,''),(248,'20181229',1,'20190107042305680594',54,674,6,917,''),(249,'20181229',1,'20190107042305680594',55,116,101,0,''),(250,'20181229',1,'20190107042305680594',67,127,101,0,''),(251,'20181230',1,'20190107042337274617',58,569,6,569,''),(252,'20181230',1,'20190107042417352032',66,1485,6,1485,'joyfull'),(253,'20181231',1,'20190107042453537070',68,928,6,928,'スタバ'),(254,'20181231',1,'20190107042544612814',66,1530,6,1530,'マクドナルド野田店'),(255,'20181231',1,'20190107042643261259',54,492,6,1011,'カロリーメイトと歯ブラシとマスク'),(256,'20181231',1,'20190107042643261259',58,519,101,0,''),(257,'20181231',1,'20190107042944572995',54,108,6,2045,'姫路飲み会用他'),(258,'20181231',1,'20190107042944572995',55,918,101,0,''),(259,'20181231',1,'20190107042944572995',67,1019,101,0,''),(260,'20181227',1,'20190107044515141864',21,38000,1,38324,'201901家賃'),(261,'20181227',1,'20190107044515141864',64,324,101,0,''),(262,'20181225',1,'20190107044547131078',40,4104,1,4104,'インターネット代'),(263,'20181228',1,'20190107044703929538',6,46000,1,46000,'正月用資金'),(264,'20181210',1,'20190107053934556077',53,19350,2,19350,'旅費交通費未払い分（ICOCAとETC）'),(265,'20181126',1,'20190107054541816383',82,7950,3,7950,''),(266,'20181217',1,'20190107054816767487',62,3864,3,3864,''),(267,'20181226',1,'20190107054847901677',82,7950,3,7950,''),(268,'20190101',1,'20190107065445907453',53,1000,6,1000,'最上稲荷 駐車場代'),(269,'20190101',1,'20190107065628543007',54,600,6,600,'姫路飲み会代（MV別所）'),(270,'20190101',1,'20190107065654653043',49,38000,21,38000,''),(271,'20190101',1,'20190107065941436988',53,6220,26,6220,'上段は岡山→姫路新幹線二人分、二段目は姫路～とか移動、3段目は相生→岡山こだま自由席'),(272,'20190101',1,'20190107065941436988',53,1110,7,1110,''),(273,'20190101',1,'20190107065941436988',53,2110,26,2110,''),(274,'20190101',1,'20190107070137820726',54,780,6,1241,''),(275,'20190101',1,'20190107070137820726',55,280,101,0,''),(276,'20190101',1,'20190107070137820726',67,181,101,0,''),(277,'20190102',1,'20190107070227248516',54,416,6,862,''),(278,'20190102',1,'20190107070227248516',67,216,101,0,''),(279,'20190102',1,'20190107070227248516',55,230,101,0,''),(280,'20190104',1,'20190107070302438519',66,1116,6,1116,'スシロー（1000円出してもらった）'),(281,'20190104',1,'20190107070459421585',66,1314,6,1314,'joyfullいつものとこ'),(282,'20190104',1,'20190107070716413839',58,481,6,1457,'ダイキにてトイレットペーパーとおかし大量'),(283,'20190104',1,'20190107070716413839',67,976,101,0,''),(284,'20190105',1,'20190107072510126801',67,518,6,518,'マネケン岡山駅'),(285,'20190105',1,'20190107072542140896',67,119,6,227,''),(286,'20190105',1,'20190107072542140896',55,108,101,0,''),(287,'20190105',1,'20190107072627295393',67,198,6,332,''),(288,'20190105',1,'20190107072627295393',54,134,101,0,''),(289,'20190105',1,'20190107072703334880',58,1990,6,1990,'無印乳液'),(290,'20190105',1,'20190107072753826256',66,930,6,930,'吉野家岡山駅前 500円出してもらった気がする'),(291,'20190105',1,'20190107072831905834',54,520,6,1516,''),(292,'20190105',1,'20190107072831905834',67,620,101,0,''),(293,'20190105',1,'20190107072831905834',55,376,101,0,''),(294,'20190106',1,'20190109063253668791',66,580,6,580,'銀だこ 福山イトーヨーカドー店'),(295,'20190106',1,'20190109063349153235',57,2052,6,2052,'啓文社ポートプラザ店 ホモ・サピエンス全史（上）'),(296,'20190107',1,'20190109063420204520',54,529,6,529,'マルナカ'),(297,'20190108',1,'20190109063459605466',54,337,6,835,''),(298,'20190108',1,'20190109063459605466',67,138,101,0,''),(299,'20190108',1,'20190109063459605466',55,360,101,0,''),(300,'20190108',1,'20190109063537517479',54,200,6,920,'ひまわり カップ麺とサプリと'),(301,'20190108',1,'20190109063537517479',56,720,101,0,''),(302,'20190106',1,'20190109063618221788',68,835,6,835,'スタバ中島'),(303,'20190108',1,'20190109063721453567',55,100,6,9718,'寄付は姫工'),(304,'20190108',1,'20190109063721453567',86,3000,101,0,''),(305,'20190108',1,'20190109063721453567',61,6618,101,0,''),(306,'20190110',1,'20190112034157036738',54,1097,6,1718,'かおり氏見舞い用'),(307,'20190110',1,'20190112034157036738',67,300,101,0,''),(308,'20190110',1,'20190112034157036738',55,321,101,0,''),(309,'20190111',1,'20190112034231920976',6,36000,1,36000,''),(310,'20190111',1,'20190112034301036952',54,530,6,530,'パン購入@アリオパン屋'),(311,'20190111',1,'20190112034338177167',54,1480,6,1865,''),(312,'20190111',1,'20190112034338177167',67,210,101,0,''),(313,'20190111',1,'20190112034338177167',55,175,101,0,''),(314,'20190111',1,'20190112034426056867',54,300,6,932,'無印でバウム2個とトイレスリッパ'),(315,'20190111',1,'20190112034426056867',58,632,101,0,''),(316,'20190111',1,'20190112034526553775',56,1060,6,5140,'皮膚科 上段はすわ 下段は薬代 28日分'),(317,'20190111',1,'20190112034526553775',56,4080,101,0,''),(318,'20190113',1,'20190115004500060881',54,140,6,388,'小腹満たし用 ローソン'),(319,'20190113',1,'20190115004500060881',55,248,101,0,''),(320,'20190113',1,'20190115004729145267',53,4381,6,4381,'ガソリン代 31.52L＠139 395.3km 燃費12.5km/L年末年始渋滞？'),(321,'20190113',1,'20190115004811940326',66,1930,6,1930,'与島PAにて'),(322,'20190113',1,'20190115004918441086',53,1700,25,1700,'児島→坂出 間違って一般出口から出たため'),(323,'20190113',1,'20190115005019175251',57,4212,6,4212,'サピエンス全史下巻と新書2冊 啓文社岡山'),(324,'20190113',1,'20190115005117128466',67,591,6,855,'ローソンでアイスとか'),(325,'20190113',1,'20190115005117128466',55,264,101,0,''),(326,'20190114',1,'20190115005209370771',66,1296,6,1296,'マコアでモーニング トーストサンドセットx2'),(327,'20190114',1,'20190115005256207287',58,306,6,306,'マイクロファイバークロス3枚セット ジュンテンドー'),(328,'20190114',1,'20190115005532694786',66,3158,6,3158,'すし丸 17皿 千円出してもらった'),(329,'20190114',1,'20190115005642865104',54,836,6,1101,'自分用マルナカ老松'),(330,'20190114',1,'20190115005642865104',67,127,101,0,''),(331,'20190114',1,'20190115005642865104',55,138,101,0,''),(332,'20190114',1,'20190115005837538605',68,874,6,874,'スタバにてドリンク2種'),(333,'20190113',1,'20190115011549036548',66,1000,6,1000,'イカ焼き2本＠桂浜'),(334,'20181231',1,'20190115050839789810',9,311220,95,311220,'決算修正'),(335,'20181231',1,'20190115050839789810',5,534229,100,534229,''),(336,'20190116',1,'20190116115726835569',54,717,6,2162,'菓子類はナッツその他'),(337,'20190116',1,'20190116115726835569',67,860,101,0,''),(338,'20190116',1,'20190116115726835569',55,585,101,0,''),(339,'20190117',1,'20190121012038649507',63,7719,24,12330,'ヨドバシ買い物 ひげそり、FlashAir4、携帯F10-B用バッテリー'),(340,'20190117',1,'20190121012038649507',44,1061,101,0,''),(341,'20190117',1,'20190121012038649507',8,3550,101,0,''),(342,'20190118',1,'20190121012134832814',54,853,6,1353,'ハピーズアリオ買い物'),(343,'20190118',1,'20190121012134832814',67,320,101,0,''),(344,'20190118',1,'20190121012134832814',55,180,101,0,''),(345,'20190120',1,'20190121012244139915',67,163,6,313,'ローソンチョコとコーヒー'),(346,'20190120',1,'20190121012244139915',55,150,101,0,''),(347,'20190120',1,'20190121012356519909',53,640,25,640,'第二神明〜須磨IC往復'),(348,'20190120',1,'20190121012442729125',66,4082,6,4082,'リトファン生パスタセット二人分。おいしい。'),(349,'20190121',1,'20190124015725500649',54,340,6,712,'マルナカ食材'),(350,'20190121',1,'20190124015725500649',67,105,101,0,''),(351,'20190121',1,'20190124015725500649',55,267,101,0,''),(352,'20190122',1,'20190124015956893870',21,9207,1,90000,'郵貯で国保等支払。前払費用は電気代（1月度電気代だが今まで1か月遅れで払ってるので）'),(353,'20190122',1,'20190124015956893870',78,26200,101,0,''),(354,'20190122',1,'20190124015956893870',76,16340,101,0,''),(355,'20190122',1,'20190124015956893870',6,38253,101,0,''),(356,'20190123',1,'20190124020151237799',63,3304,6,3304,'コーナンにてカラーボックス2個'),(357,'20190123',1,'20190124020322152016',53,6569,6,6569,'ガソリン代 47.6L 726.0km 17.0km/L 香川行きとか須磨行きとか長距離多い'),(358,'20190201',1,'20190124020401539363',61,9207,21,9207,'電気代振替'),(359,'20190104',1,'20190124021249409072',24,75774,1,75774,'なんか買ったんだろな・・・。'),(360,'20190110',1,'20190124021356899122',1,200000,2,200000,'生活資金移動'),(361,'20190110',1,'20190124021501387741',26,11030,2,11030,'未払金（ETC）って不要じゃね・・・？'),(362,'20190122',1,'20190124021915686847',55,475,6,1882,'アリオ食材'),(363,'20190122',1,'20190124021915686847',67,210,101,0,''),(364,'20190122',1,'20190124021915686847',54,1197,101,0,''),(365,'20190124',1,'20190126024441021760',54,491,6,1035,'マルナカ買い物'),(366,'20190124',1,'20190126024441021760',55,233,101,0,''),(367,'20190124',1,'20190126024441021760',67,311,101,0,''),(368,'20190126',1,'20190127001606442038',53,730,7,730,'倉敷→備前西市、岡山→倉敷'),(369,'20190126',1,'20190127001739945349',43,233,6,233,'ユニバーサル基板2枚＠松本無線'),(370,'20190126',1,'20190127001818926788',54,997,6,1391,'アリオ食材'),(371,'20190126',1,'20190127001818926788',67,214,101,0,''),(372,'20190126',1,'20190127001818926788',55,180,101,0,''),(373,'20190105',1,'20190127003125382331',53,210,7,210,'岡山→備前一宮'),(374,'20190127',1,'20190129011106832604',66,1553,6,1553,'西崎食堂'),(375,'20190127',1,'20190129011203742849',54,1000,6,1000,'マルナカで夕食材料二人分'),(376,'20190128',1,'20190129011303336873',54,442,6,442,'ローソン倉敷沖店 アップルサイダー捜索 見つからず'),(377,'20190128',1,'20190129011359222966',54,643,6,1208,'ハローズで買い物'),(378,'20190128',1,'20190129011359222966',67,265,101,0,''),(379,'20190128',1,'20190129011359222966',55,300,101,0,''),(380,'20190130',1,'20190131045908714707',54,1576,6,1886,'アリオ買い物'),(381,'20190130',1,'20190131045908714707',55,95,101,0,''),(382,'20190130',1,'20190131045908714707',67,215,101,0,''),(383,'20190201',1,'20190202003424868497',54,359,6,901,'ハローズ買い物'),(384,'20190201',1,'20190202003424868497',67,318,101,0,''),(385,'20190201',1,'20190202003424868497',55,224,101,0,''),(386,'20190202',1,'20190204012656768196',67,132,6,232,'ローソン コーヒーとガルボ'),(387,'20190202',1,'20190204012656768196',55,100,101,0,''),(388,'20190202',1,'20190204012726358176',66,1600,6,1600,'総社でうどん定食二人分'),(389,'20190202',1,'20190204012814987813',68,1166,6,1166,'スタバイオン岡山 バレンタインミックスホット＆フラペ'),(390,'20190202',1,'20190204012916759368',70,2322,6,2322,'コートダジュール2時間 1時間無料券 紅茶2杯とフライドポテト'),(391,'20190202',1,'20190204013016638980',54,256,6,515,'ローソンでおにぎりと飲み物'),(392,'20190202',1,'20190204013016638980',55,259,101,0,''),(393,'20190203',1,'20190204013051814229',53,1000,6,1000,'かおり氏の車へ給油'),(394,'20190203',1,'20190204013132538289',67,430,6,430,'しまなみ街道のPAにてもみじ饅頭他'),(395,'20190203',1,'20190204013432727960',53,5060,26,5060,'倉敷→笠岡 西瀬戸尾道→今治 坂出→倉敷 【参考】ETC割引前10260'),(396,'20190130',1,'20190205052322006631',21,38000,1,38324,'家賃'),(397,'20190130',1,'20190205052322006631',64,324,101,0,''),(398,'20190130',1,'20190205052431980543',82,7950,3,7950,''),(399,'20190123',1,'20190205052545948278',40,4104,1,4104,'インターネット代'),(400,'20190123',1,'20190205052628767126',57,3131,24,3131,'WSJ電子版'),(401,'20190123',1,'20190205052745967391',40,2704,24,2704,'MobileSIM IIJ 2回線とSonyMobile1回線'),(402,'20190123',1,'20190205052745967391',40,756,24,756,''),(403,'20181130',1,'20190205052820422199',40,3220,4,3220,'ガラケー代 計上時期ミス2019/1/31→2018/11/30'),(404,'20190201',1,'20190205053101577523',62,4263,3,4263,'ガス代'),(405,'20190204',1,'20190205053140635516',24,12167,1,28167,'郵貯から'),(406,'20190204',1,'20190205053140635516',6,16000,101,0,''),(407,'20190204',1,'20190205053329288479',54,240,6,776,'アリオ買い物'),(408,'20190204',1,'20190205053329288479',67,108,101,0,''),(409,'20190204',1,'20190205053329288479',58,428,101,0,''),(410,'20190205',1,'20190206025235182488',43,5700,26,5700,'情報処理試験H31春季ES'),(411,'20190204',1,'20190206040525779938',58,3359,8,3550,'ヨドバシで収納用品とかワイパーゴムとか購入'),(412,'20190204',1,'20190206040525779938',63,2459,24,2268,''),(424,'20190205',1,'20190207124651261170',55,324,6,708,'マルナカ買い物'),(425,'20190205',1,'20190207124651261170',54,384,101,0,'マルナカ買い物'),(426,'20190207',1,'20190207124741034840',54,845,6,1645,'アリオ買い物 菓子類はナッツ600円（200g）を含む'),(427,'20190207',1,'20190207124741034840',67,800,101,0,'アリオ買い物 菓子類はナッツ600円（200g）を含む'),(428,'20190208',1,'20190208014436472078',56,590,6,590,'皮膚科代 上：診療費、下：薬代'),(429,'20190208',1,'20190208014436472078',56,4640,6,4640,'皮膚科代 上：診療費、下：薬代'),(430,'20190201',1,'20190212011924255355',53,240,7,240,'ミスターバーグをゴチになった後北長瀬まで運転してそっから帰還した北長瀬→倉敷の電車賃'),(431,'20190208',1,'20190212012746351219',54,128,6,279,'ファミマ買い物'),(432,'20190208',1,'20190212012746351219',55,151,101,0,'ファミマ買い物'),(433,'20190208',1,'20190212012840038016',54,116,6,346,'ローソン買い物'),(434,'20190208',1,'20190212012840038016',55,230,101,0,'ローソン買い物'),(435,'20190210',1,'20190212013050805345',53,100,6,100,'笠岡ラーメンお多津（三洋旅館1F）へ。コイパ代と中華そばｘ２'),(436,'20190210',1,'20190212013050805345',66,1300,6,1300,'笠岡ラーメンお多津（三洋旅館1F）へ。コイパ代と中華そばｘ２'),(437,'20190210',1,'20190212013258288948',54,415,6,786,'笠岡のファミマにて'),(438,'20190210',1,'20190212013258288948',55,241,101,0,'笠岡のファミマにて'),(439,'20190210',1,'20190212013258288948',67,130,101,0,'笠岡のファミマにて'),(440,'20190210',1,'20190212013425476749',54,108,6,366,'井原セブン 昼寝後生茶飲みたいとのリクにより'),(441,'20190210',1,'20190212013425476749',55,258,101,0,'井原セブン 昼寝後生茶飲みたいとのリクにより'),(442,'20190210',1,'20190212013517601435',58,398,6,398,'ナンバ備中高松店 軍手12双購入'),(443,'20190210',1,'20190212013606416712',67,470,6,470,'ナンバ内３１にてスモールダブルカップ キャラメルリボンとバニラと'),(444,'20190210',1,'20190212013705147828',53,200,6,200,'西川沿いのコイパ代。イルミ観覧'),(445,'20190210',1,'20190212013832690625',66,1510,6,1510,'吉備SA内レストランにて 1000円だしてもらう'),(446,'20190210',1,'20190212013947069299',55,113,6,291,'セブンイレブン 歯ブラシと100%ジュース'),(447,'20190210',1,'20190212013947069299',58,178,101,0,'セブンイレブン 歯ブラシと100%ジュース'),(448,'20190211',1,'20190212014053879851',53,440,6,440,'辛川下→岡山駅前バス代'),(449,'20190211',1,'20190212014119690439',66,780,6,780,'ドトールにてモーニング'),(450,'20190211',1,'20190212014154528926',67,356,6,356,'岡山駅内マネケン'),(451,'20190211',1,'20190212014245746264',53,1510,7,1510,'岡山→高松'),(452,'20190211',1,'20190212014317911040',53,550,6,550,'高松→宇多津'),(453,'20190211',1,'20190212014358014287',54,150,6,310,'宇多津駅構内セブンイレブン'),(454,'20190211',1,'20190212014358014287',67,160,101,0,'宇多津駅構内セブンイレブン'),(455,'20190211',1,'20190212014513556171',70,1512,6,1512,'宇多津ゴールドタワー搭乗券2人分 hightがすげえ高い '),(456,'20190211',1,'20190212014547791691',53,160,7,160,'宇多津→丸亀'),(457,'20190211',1,'20190212014639940035',66,2404,6,2404,'一鶴丸亀本店 ひな２ むすび２'),(458,'20190211',1,'20190212014723787402',53,1110,7,1110,'丸亀→備前一宮 乗車券'),(459,'20190211',1,'20190212014956404244',53,1000,6,1000,'丸亀→岡山自由席特急券 550ｘ２ー出してもらった端数100円'),(460,'20190211',1,'20190212015057534581',54,310,6,310,'いつものローソン'),(461,'20190211',1,'20190212015214673366',54,951,6,1675,'マルナカ買い物'),(462,'20190211',1,'20190212015214673366',55,319,101,0,'マルナカ買い物'),(463,'20190211',1,'20190212015214673366',67,405,101,0,'マルナカ買い物'),(464,'20190211',1,'20190212015359342817',53,5813,6,5813,'ガソリン代 43.71L 617.7km 14.1km/L  5円引きクーポン 133円/L'),(465,'20190110',1,'20190212022821459440',53,2300,7,2300,'倉敷→日生、日生→岡山、岡山→倉敷'),(466,'20190110',1,'20190212022843356494',7,5000,26,5000,'チャージ'),(467,'20190212',1,'20190213010721316352',54,1404,6,2095,'アリオ倉敷'),(468,'20190212',1,'20190213010721316352',55,445,101,0,'アリオ倉敷'),(469,'20190212',1,'20190213010721316352',67,246,101,0,'アリオ倉敷'),(470,'20190212',1,'20190213010800584731',55,193,6,371,'大安寺ハピーズ'),(471,'20190212',1,'20190213010800584731',67,178,101,0,'大安寺ハピーズ'),(472,'20190212',1,'20190213010836357158',69,820,6,820,'かおり氏誕生日ケーキ'),(487,'20190216',1,'20190216160000596087',6,16000,1,16000,'生活費'),(488,'20190216',1,'20190216160145417551',54,1789,6,2067,'Ario'),(489,'20190216',1,'20190216160145417551',67,108,101,0,''),(490,'20190216',1,'20190216160145417551',55,170,101,0,''),(491,'20190217',1,'20190218002444218167',53,370,26,370,'倉敷IC→吉備SIC'),(492,'20190217',1,'20190218002532000112',66,1070,6,1070,'吉備SAにてラーメンチャーハンセット'),(493,'20190217',1,'20190218002607458782',54,200,6,560,'吉備SA パン'),(494,'20190217',1,'20190218002607458782',67,360,101,0,''),(495,'20190217',1,'20190218002923599198',55,280,6,280,'飲み物代 吉備SAコーヒーと道の駅くめなんでのいろはす'),(496,'20190217',1,'20190218002954089617',68,540,6,540,'スタバ さくらのやつ'),(497,'20190217',1,'20190218003025753547',58,226,6,226,'うさぎやでのりとマーカー替え芯'),(498,'20190217',1,'20190218003104953004',66,2271,6,2271,'リトファン 単品 千円もらう'),(499,'20190217',1,'20190218003151279007',53,1000,6,1000,'あいたん給油'),(512,'20190218',1,'20190220015012280007',54,300,6,818,'マルナカ'),(513,'20190218',1,'20190220015012280007',55,138,101,0,''),(514,'20190218',1,'20190220015012280007',67,380,101,0,''),(523,'20190218',1,'20190220021217920030',62,3654,28,3654,''),(524,'20190221',1,'20190225080118080298',54,1202,6,1669,'Ario'),(525,'20190221',1,'20190225080118080298',67,108,101,0,''),(526,'20190221',1,'20190225080118080298',55,359,101,0,''),(527,'20190223',1,'20190225080155700275',54,930,6,1024,'ario'),(528,'20190223',1,'20190225080155700275',55,94,101,0,''),(529,'20190223',1,'20190225080312712454',55,108,6,769,'ファミマ チョコケーキ・ワッフル、フィナンシェ２個'),(530,'20190223',1,'20190225080312712454',67,661,101,0,''),(531,'20190224',1,'20190225080411465866',53,1290,26,1290,'ETC 倉敷→吉備、西瀬戸尾道←→因島北'),(532,'20190224',1,'20190225080532456303',66,880,6,880,'福山SA カツ定食'),(533,'20190224',1,'20190225080554267346',54,334,6,334,'福山SA パン2個'),(534,'20190224',1,'20190225080657730367',55,139,6,420,'道中ファミマ バウムとフィナンシェ'),(535,'20190224',1,'20190225080657730367',67,281,101,0,''),(536,'20190224',1,'20190225080811710222',54,140,6,248,'ローソン 水とパン'),(537,'20190224',1,'20190225080811710222',55,108,101,0,''),(538,'20190224',1,'20190225080917001398',54,454,6,527,'帰りのマルナカ 鍋食材とか 千円出してもらっての金額'),(539,'20190224',1,'20190225080917001398',67,73,101,0,''),(540,'20190225',1,'20190226145446643084',54,329,6,805,''),(541,'20190225',1,'20190226145446643084',55,211,101,0,''),(542,'20190225',1,'20190226145446643084',67,265,101,0,''),(543,'20190226',1,'20190226145511758983',54,393,6,1204,''),(544,'20190226',1,'20190226145511758983',55,398,101,0,''),(545,'20190226',1,'20190226145511758983',67,413,101,0,''),(546,'20190226',1,'20190226145744947403',61,7418,6,7418,'2月分電気代。処理の簡便化を目的に当月支払分を当月費用に算入する'),(547,'20190226',1,'20190226145825849844',6,80000,1,80000,'国保等支払用'),(548,'20190226',1,'20190226145914038467',76,16340,6,16340,''),(549,'20190226',1,'20190226145930957799',78,26200,6,26200,''),(550,'20190211',1,'20190227012850879895',6,16000,1,16000,''),(551,'20190225',1,'20190227012928372763',40,4104,1,4104,'インターネット代'),(552,'20190212',1,'20190227043127703965',26,8550,2,8550,'交通系未払金支払（ETC or スマートICOCA）'),(553,'20190218',1,'20190227043216743117',2,3,97,3,'預入40万円に対し利息3円とは・・・。'),(554,'20190218',1,'20190227043259464635',3,2,97,2,'もはや記帳する意味はあるのか'),(555,'20190218',1,'20190227043513027611',60,3864,3,3864,'水道代 2ヶ月分？'),(556,'20190226',1,'20190227043608850948',82,7950,3,7950,'任意保険料'),(557,'20190201',1,'20190227044344837411',49,38000,21,38000,''),(558,'20190302',1,'20190302233446102041',54,1211,6,1887,'Ario買い物 消耗品はトイレットペーパー'),(559,'20190302',1,'20190302233446102041',55,341,101,0,''),(560,'20190302',1,'20190302233446102041',67,95,101,0,''),(561,'20190302',1,'20190302233446102041',58,240,101,0,''),(562,'20190302',1,'20190302233515231923',54,494,6,825,'マルナカ買い物'),(563,'20190302',1,'20190302233515231923',67,223,101,0,''),(564,'20190302',1,'20190302233515231923',55,108,101,0,''),(565,'20190301',1,'20190302233541612394',49,38000,21,38000,''),(566,'20190303',1,'20190304022339173992',66,1500,6,1500,'大野辻の笠岡ラーメン店'),(567,'20190303',1,'20190304022420894760',67,388,6,496,'ローソンでアイスとか'),(568,'20190303',1,'20190304022420894760',54,108,101,0,''),(569,'20190303',1,'20190304022456906029',68,1100,6,1100,'おしゃれゾーンの新スタバ'),(570,'20190303',1,'20190304022541869135',58,916,6,916,'ゆずソルト入浴剤'),(571,'20190303',1,'20190304022632045306',67,285,6,388,'gfjとアイスたち'),(572,'20190303',1,'20190304022632045306',55,103,101,0,''),(573,'20190303',1,'20190304022703728006',55,179,6,284,'ハローズでパンと水買い物'),(574,'20190303',1,'20190304022703728006',54,105,101,0,''),(575,'20190305',1,'20190306004659095526',54,729,6,1271,'アリオ買い物'),(576,'20190305',1,'20190306004659095526',55,542,101,0,''),(577,'20190305',1,'20190306004721619193',54,345,6,345,'アリオパン屋でパン2個'),(578,'20190306',1,'20190307004232064099',54,568,6,970,'マルナカ'),(579,'20190306',1,'20190307004232064099',55,216,101,0,''),(580,'20190306',1,'20190307004232064099',67,186,101,0,''),(581,'20190307',1,'20190309034722681368',7,5000,6,5000,'上から倉敷→和気、和気→姫路、姫路→ひめじ別所'),(582,'20190307',1,'20190309034722681368',53,760,7,1930,''),(583,'20190307',1,'20190309034722681368',53,970,101,0,''),(584,'20190307',1,'20190309034722681368',53,200,101,0,''),(585,'20190307',1,'20190309034812437881',69,4000,6,4000,'飲み会代 計18000円、だいこん1万円、らんだと4000円ずつ（端数はらんだ）'),(586,'20190307',1,'20190309034933790110',53,200,7,520,'上からひめじ別所→姫路、姫路→岡山（新幹線）、岡山→倉敷'),(587,'20190307',1,'20190309034933790110',53,3220,26,3220,''),(588,'20190307',1,'20190309034933790110',53,320,101,0,''),(589,'20190307',1,'20190309034958460179',55,130,6,130,'覚えはないが飲んでそうなので'),(590,'20190307',1,'20190309035510737276',1,190000,2,200000,''),(591,'20190307',1,'20190309035510737276',6,10000,101,0,''),(592,'20190308',1,'20190309040259906624',53,320,7,530,'倉敷→岡山、岡山→備前一宮'),(593,'20190308',1,'20190309040259906624',53,210,101,0,''),(594,'20190308',1,'20190309040338480790',57,3672,6,3672,'ゼロから作るDeep Learning'),(595,'20190308',1,'20190309040411404083',67,798,6,798,'岡山駅地下のアップルパイ2個'),(596,'20190308',1,'20190309040513796714',58,279,6,525,'ファブリーズ詰め替えと味好み'),(597,'20190308',1,'20190309040513796714',67,246,101,0,''),(598,'20190308',1,'20190309040537726850',54,763,6,763,'マルナカ一宮店'),(599,'20190309',1,'20190309040611023912',53,410,7,410,'備前一宮→倉敷'),(600,'20181231',1,'20190309041440258931',40,3220,28,3220,'ガラケー代'),(601,'20190104',1,'20190309041511961977',28,3220,4,3220,''),(602,'20190131',1,'20190309041533817293',40,3220,4,3220,'ガラケー代'),(603,'20190228',1,'20190309041605210519',40,3220,4,3220,'ガラケー代'),(604,'20190227',1,'20190309043108017980',21,38000,1,38324,'家賃3月分'),(605,'20190227',1,'20190309043108017980',64,324,101,0,''),(606,'20190304',1,'20190309043145611209',24,24276,1,24276,'なんか買ったぽい'),(607,'20190307',1,'20190309043631858951',6,36000,2,36000,''),(608,'20190310',1,'20190310082248043152',53,5044,6,5044,'ガソリン代 中庄 543.0km 39.41L 13.8km/L'),(609,'20190310',1,'20190310082338229011',66,1000,6,1000,'笠岡 おたづ ラーメン2杯'),(610,'20190310',1,'20190310082408422929',54,770,6,770,'笠岡ベイファーム みかん、みたらし団子、焼き芋'),(611,'20190309',1,'20190310160702356439',69,853,6,853,'前田さんと倉敷駅前スタバ'),(612,'20190310',1,'20190312234017174863',66,1803,6,1803,'城下町 カツ丼その他'),(613,'20190312',1,'20190312234248439029',54,1870,6,2674,'アリオ 最後のはホワイトデー用'),(614,'20190312',1,'20190312234248439029',67,266,101,0,''),(615,'20190312',1,'20190312234248439029',69,538,101,0,''),(616,'20190313',1,'20190312234449717237',60,4124,28,4124,'水道代 20190111～0312'),(617,'20190313',1,'20190313023018729011',56,1340,6,1340,'上段・診察料、下段・薬代'),(618,'20190313',1,'20190313023018729011',56,5010,6,5010,''),(619,'20190314',1,'20190315004322493468',53,320,7,560,'倉敷→岡山、北長瀬→倉敷'),(620,'20190314',1,'20190315004322493468',53,240,101,0,''),(621,'20190314',1,'20190315004343290466',55,130,6,130,'ほうじ茶ほっと'),(622,'20190314',1,'20190315004407121900',54,1056,6,1402,'アリオ'),(623,'20190314',1,'20190315004407121900',55,175,101,0,''),(624,'20190314',1,'20190315004407121900',67,171,101,0,''),(625,'20190316',NULL,'20190318010142782657',58,1468,6,1468,'コーナンにてお香その他'),(626,'20190316',NULL,'20190318010209591948',54,636,6,1414,'アリオ'),(627,'20190316',NULL,'20190318010209591948',55,778,101,0,''),(628,'20190317',NULL,'20190318010243162692',55,108,6,233,'ローソン いろはすとフレンチクルーラー的なやつ'),(629,'20190317',NULL,'20190318010243162692',67,125,101,0,''),(630,'20190317',NULL,'20190318010312759123',66,5443,6,5443,'倉敷とりでん'),(631,'20190317',NULL,'20190318013859969946',66,850,6,850,'大野辻の笠岡ラーメン屋さん 塩ラーメン定食'),(632,'20190318',NULL,'20190318051836296828',62,4088,28,4088,'2/19～3/18ガス代 13m3  4/1引き落とし'),(633,'20190318',NULL,'20190318125953628277',84,10000,6,10000,'家賃保証委託料 20190325～ 1年間'),(634,'20190318',NULL,'20190318130019811530',54,260,6,260,'ローソン パン2個'),(635,'20190318',NULL,'20190318130202917662',54,510,6,1204,'マルナカ 焼き芋とか卵とかGFJとか小枝とか'),(636,'20190318',NULL,'20190318130202917662',55,523,101,0,''),(637,'20190318',NULL,'20190318130202917662',67,171,101,0,''),(638,'20190320',NULL,'20190321173248548576',41,1940,6,1940,'散髪代'),(639,'20190320',NULL,'20190321173313173240',6,16000,1,16000,''),(640,'20190320',NULL,'20190321173336512981',54,839,6,1010,'アリオ'),(641,'20190320',NULL,'20190321173336512981',67,171,101,0,''),(642,'20190320',NULL,'20190321173401449868',67,300,6,429,'ローソン買い物'),(643,'20190320',NULL,'20190321173401449868',55,129,101,0,''),(644,'20190321',NULL,'20190321173437305662',53,290,26,290,'備前IC→赤穂IC'),(645,'20190321',NULL,'20190321173516767810',66,650,6,650,'赤穂フレプラ？マクドナルド。老夫婦がキレる'),(646,'20190321',NULL,'20190321173538464206',53,500,6,500,'相生駐車場代'),(647,'20190321',NULL,'20190321173609204245',7,5000,26,5000,'クイックチャージ'),(648,'20190321',NULL,'20190321173643614379',53,1940,7,2220,'相生→大阪、梅田→天王寺'),(649,'20190321',NULL,'20190321173643614379',53,280,101,0,''),(650,'20190321',NULL,'20190321173719956167',70,1800,6,1800,'大阪市立美術館にてフェルメール展鑑賞'),(651,'20190321',NULL,'20190321173802071704',43,568,6,568,'日本橋にて電子部品購入'),(652,'20190321',NULL,'20190321173844117000',53,230,7,230,'難波→梅田'),(653,'20190321',NULL,'20190321173922647814',66,1210,6,1210,'北新地の一鶴'),(654,'20190321',NULL,'20190321173956112502',53,1940,7,1940,'北新地→相生'),(655,'20190321',NULL,'20190321174019703015',55,290,7,290,'飲み物'),(656,'20190321',NULL,'20190321174040253777',68,1500,6,1500,'大安寺スタバ'),(657,'20190322',NULL,'20190324144738797088',54,455,6,996,'ハローズ買い物'),(658,'20190322',NULL,'20190324144738797088',55,403,101,0,''),(659,'20190322',NULL,'20190324144738797088',67,138,101,0,''),(660,'20190324',NULL,'20190324144954901668',55,138,6,265,'マルイ大福店 ゆずはちみつドリンクと栗入り特大どら焼き'),(661,'20190324',NULL,'20190324144954901668',54,127,101,0,''),(662,'20190324',NULL,'20190324145031033935',67,615,6,615,'与島SAにて瓦せんべい'),(663,'20190324',NULL,'20190324145102611091',53,370,26,370,'倉敷IC→吉備SIC'),(664,'20190324',NULL,'20190324145152939111',53,3730,26,3730,'水島IC→南国IC 金額少し違うかも'),(665,'20190324',NULL,'20190324145228966866',53,1700,26,1700,'南国IC（高知）→善通寺IC（香川）'),(666,'20190324',NULL,'20190324145303120494',53,2350,26,2350,'坂出IC→吉備SIC'),(667,'20190324',NULL,'20190324145343002174',54,471,6,1194,'マルナカ老松店'),(668,'20190324',NULL,'20190324145343002174',67,320,101,0,''),(669,'20190324',NULL,'20190324145343002174',55,403,101,0,''),(670,'20190325',NULL,'20190325093853002522',9,825000,5,825712,'JR西日本株買い増し 売買手数料は原価に含みそうな気がするが証券会社の表示と合わせる'),(671,'20190325',NULL,'20190325093853002522',46,712,101,0,''),(672,'20190327',NULL,'20190327045408384317',39,1728,6,1728,'証明写真代'),(673,'20190327',NULL,'20190327045501976209',6,180000,1,80000,'住民税等支払い用'),(674,'20190327',NULL,'20190327045501976209',101,0,3,100000,''),(675,'20190327',NULL,'20190327045537340464',78,26200,6,26200,''),(676,'20190327',NULL,'20190327045608915940',76,16340,6,16340,'H31.3'),(677,'20190327',NULL,'20190327045806359487',79,121600,6,121600,'H30.10～H31.3'),(678,'20190327',NULL,'20190327050153464043',61,4785,6,4785,'H31.2.20～3.19 179kWh '),(679,'20190327',NULL,'20190328002630826426',54,1059,6,1496,'アリオ 菓子類は108ぽい疑惑が・・・。'),(680,'20190327',NULL,'20190328002630826426',67,216,101,0,''),(681,'20190327',NULL,'20190328002630826426',55,221,101,0,''),(682,'20190325',NULL,'20190329005402410930',40,4104,1,4104,'インターネット代'),(683,'20190327',NULL,'20190329005449642272',21,38000,1,38324,'家賃前払'),(684,'20190327',NULL,'20190329005449642272',64,324,101,0,''),(685,'20190327',NULL,'20190329012946889305',5,1754,98,2200,'エディオン配当金 @973x100 2.26%（税引き前3/29現在株価）'),(686,'20190327',NULL,'20190329012946889305',79,110,101,0,''),(687,'20190327',NULL,'20190329012946889305',73,336,101,0,''),(688,'20190330',NULL,'20190330055525825019',54,779,6,1369,'アリオ 菓子類はシュークリーム'),(689,'20190330',NULL,'20190330055525825019',55,505,101,0,''),(690,'20190330',NULL,'20190330055525825019',67,85,101,0,''),(691,'20190331',NULL,'20190331151729607049',55,110,6,110,'与島PA いろはす'),(692,'20190331',NULL,'20190331151844484056',66,1652,6,1652,'おか泉＠宇多津 ひや天おろし＆こんぴら '),(693,'20190331',NULL,'20190331151920951836',55,360,6,360,'もろもろ'),(694,'20190331',NULL,'20190331152013290488',53,720,6,720,'宇多津←→詫間（JR四）'),(695,'20190331',NULL,'20190331152055780821',53,400,6,400,'紫雲出山 バス往復代'),(696,'20190331',NULL,'20190331152129442734',53,100,6,100,'三豊市コミュニティバス 大浜→詫間駅'),(697,'20190331',NULL,'20190331152145570553',55,130,6,130,'あたたかいもの'),(698,'20190331',NULL,'20190331152228695755',54,138,6,419,'宇多津駅 セブンイレブン'),(699,'20190331',NULL,'20190331152228695755',55,151,101,0,''),(700,'20190331',NULL,'20190331152228695755',67,130,101,0,''),(701,'20190331',NULL,'20190331152256478056',53,500,6,500,'宇多津駅前パーキング代（先払）'),(702,'20190331',NULL,'20190331152330812795',54,980,6,980,'与島PA とんかつ定食 うまい'),(703,'20190401',NULL,'20190401120122423438',49,38000,21,38000,''),(704,'20190401',NULL,'20190401120144055353',54,280,6,866,'マルナカ'),(705,'20190401',NULL,'20190401120144055353',55,309,101,0,''),(706,'20190401',NULL,'20190401120144055353',67,277,101,0,''),(707,'20190403',NULL,'20190404011220274729',54,1385,6,1493,'アリオ買い物'),(708,'20190403',NULL,'20190404011220274729',55,108,101,0,''),(709,'20190404',NULL,'20190405000058976379',7,5000,26,5000,'倉敷岡山往復'),(710,'20190404',NULL,'20190405000058976379',53,640,7,640,''),(711,'20190405',NULL,'20190405013844596266',22,5852,24,5852,'頼まれもの moraでハイレゾ音源購入'),(712,'20190405',NULL,'20190405014156121262',43,12312,24,12312,'Jetson開発キット手配 5月入荷？'),(713,'20190405',NULL,'20190405014339617186',22,1680,24,10761,'上からmicroSD（頼まれもの）、情報処理201901、ピンセット等、3Dプリンタシートとフィラメント'),(714,'20190405',NULL,'20190405014339617186',57,1730,101,0,''),(715,'20190405',NULL,'20190405014339617186',63,1552,101,0,''),(716,'20190405',NULL,'20190405014339617186',58,5799,101,0,''),(717,'20190406',NULL,'20190407232903435072',53,320,7,320,'倉敷→岡山'),(718,'20190406',NULL,'20190407233214375933',57,3240,6,3240,'丸善岡山 オライリー コンピュータビジョン'),(719,'20190406',NULL,'20190407233306749124',69,540,6,540,'大阪城公園花見会用 機会はなかった'),(720,'20190406',NULL,'20190407233432770735',54,158,6,858,'大阪城公園花見会用もろもろ マルナカ'),(721,'20190406',NULL,'20190407233432770735',67,168,101,0,''),(722,'20190406',NULL,'20190407233432770735',55,532,101,0,''),(723,'20190406',NULL,'20190407233602471489',7,3000,26,3000,'クイックチャージと岡山→倉敷'),(724,'20190406',NULL,'20190407233602471489',53,320,7,320,''),(725,'20190407',NULL,'20190407233630834844',53,3350,7,3350,'倉敷→大阪'),(726,'20190407',NULL,'20190407233653189226',53,160,7,160,'大阪→大阪城公園'),(727,'20190407',NULL,'20190407233923744367',69,4000,6,4000,'大阪城公園花見会 わーべきゅー参加費'),(728,'20190407',NULL,'20190407233957993419',53,180,7,180,'大阪城公園→新大阪（環状線経由）'),(729,'20190408',NULL,'20190407234026409200',55,110,7,110,'いろはす＠大阪駅ホーム'),(730,'20190407',NULL,'20190407234114315605',53,5500,26,5500,'みどりの窓口超混雑によりEX予約 新大阪→岡山 自由席'),(731,'20190407',NULL,'20190407234224861488',53,190,7,190,'岡山→北長瀬 関西圏に比べると高い'),(732,'20190407',NULL,'20190407234310096119',66,2070,6,2070,'大安寺コメダ二人分 ほっと一息'),(733,'20190407',NULL,'20190407234333450475',53,240,7,240,'北長瀬→倉敷'),(734,'20190311',NULL,'20190408001057630394',26,17250,2,17250,'旅費交通費等未払分'),(735,'20190301',NULL,'20190408002126075871',28,3654,3,3654,'2月都市ガス'),(736,'20190326',NULL,'20190408002210416647',82,7950,3,7950,''),(737,'20190401',NULL,'20190408002324471149',28,4088,3,4088,''),(738,'20190331',NULL,'20190408002700673182',57,3131,24,3131,'WSJ電子版'),(739,'20190331',NULL,'20190408002733915486',40,2704,24,2704,'IIJsim2回線'),(740,'20190331',NULL,'20190408002808252039',40,756,24,756,'SonySIM'),(741,'20190331',NULL,'20190408002856412303',40,3220,4,3220,'携帯電話代（4/1引き落としかも）'),(742,'20190401',NULL,'20190408003636387970',25,4290,26,4290,'未払金（ETC）を今後使用しないので振り替え'),(743,'20190401',NULL,'20190408004033540097',1,2,97,2,''),(744,'20190404',NULL,'20190408004101286821',24,9107,1,9107,''),(745,'20190404',NULL,'20190408004119252335',6,36000,1,36000,''),(746,'20190408',NULL,'20190408141640236995',54,829,6,1212,'アリオ買い物 チョコ等'),(747,'20190408',NULL,'20190408141640236995',67,278,101,0,''),(748,'20190408',NULL,'20190408141640236995',55,105,101,0,''),(749,'20181130',NULL,'20190411045039153818',57,3131,24,3131,'各種サービス使用量 上からWSJ、iij、SonyMobile、AppleMusic、ATOK'),(750,'20181130',NULL,'20190411045039153818',40,2704,24,2704,''),(751,'20181130',NULL,'20190411045039153818',40,756,24,756,''),(752,'20181130',NULL,'20190411045039153818',70,980,24,980,''),(753,'20181130',NULL,'20190411045039153818',39,540,24,540,''),(754,'20181231',NULL,'20190411045339798109',57,3220,24,3220,'WSJ、IIJ、SonyMobile、AppleMusic、ATOK'),(755,'20181231',NULL,'20190411045339798109',40,2704,24,2704,''),(756,'20181231',NULL,'20190411045339798109',40,756,24,756,''),(757,'20181231',NULL,'20190411045339798109',70,980,24,980,''),(758,'20181231',NULL,'20190411045339798109',39,540,24,540,''),(759,'20190131',NULL,'20190411045728945213',70,980,24,980,''),(760,'20190131',NULL,'20190411045728945213',39,540,24,540,''),(761,'20190228',NULL,'20190411045929562150',57,3131,24,3131,''),(762,'20190228',NULL,'20190411045929562150',40,2704,24,2704,''),(763,'20190228',NULL,'20190411045929562150',40,756,24,756,''),(764,'20190228',NULL,'20190411045929562150',70,980,24,980,''),(765,'20190228',NULL,'20190411045929562150',39,540,24,540,''),(766,'20190331',NULL,'20190411050037877494',70,980,24,980,''),(767,'20190331',NULL,'20190411050037877494',39,540,24,540,''),(768,'20190411',NULL,'20190415003041174353',54,632,6,1332,'マルナカ'),(769,'20190411',NULL,'20190415003041174353',55,400,101,0,''),(770,'20190411',NULL,'20190415003041174353',67,300,101,0,''),(771,'20190413',NULL,'20190415003142785213',58,781,6,781,'コーナンで洗濯洗剤漂白剤＆食器洗い洗剤'),(772,'20190413',NULL,'20190415003226528167',58,429,6,429,'重曹1kg。300gでいいのに・・・。'),(773,'20190413',NULL,'20190415003305124974',54,2107,6,2428,'アリオ食材。消耗品はトイレットペーパー'),(774,'20190413',NULL,'20190415003305124974',58,321,101,0,''),(775,'20190413',NULL,'20190415003352301746',68,939,6,939,'スタバ新作の行列に並びつつレギュラーメニューを頼む二人。'),(776,'20190413',NULL,'20190415003431556255',54,1057,6,1057,'ハピーズ おべんと二人分と味噌と塩'),(777,'20190414',NULL,'20190415003613506288',66,1533,6,1533,'マコアモーニング二人分'),(778,'20190414',NULL,'20190415003756411306',53,5571,6,5571,'ガソリン代@136 40.96L 926.7km（20L給油込み） 15.2km/L 香川等'),(779,'20190415',NULL,'20190418232504331948',54,344,6,746,'マルナカおやつ等'),(780,'20190415',NULL,'20190418232504331948',67,314,101,0,''),(781,'20190415',NULL,'20190418232504331948',55,88,101,0,''),(782,'20190418',NULL,'20190418232545327629',54,1285,6,1626,'アリオ買い物'),(783,'20190418',NULL,'20190418232545327629',67,203,101,0,''),(784,'20190418',NULL,'20190418232545327629',55,138,101,0,''),(785,'20190421',NULL,'20190422012833863230',53,1000,6,1000,'かおり氏ガソリン代ちょい足し'),(786,'20190421',NULL,'20190422012919994067',55,108,6,338,'セブンイレブンおにぎり等'),(787,'20190421',NULL,'20190422012919994067',54,230,101,0,''),(788,'20190421',NULL,'20190422013018444108',54,224,6,347,'ローソンカロリーメイトとかチョコとか'),(789,'20190421',NULL,'20190422013018444108',67,123,101,0,''),(790,'20190421',NULL,'20190422013035738332',55,130,6,130,'麦茶'),(791,'20190421',NULL,'20190422013052953436',67,722,6,722,'おみやマネケン'),(792,'20190421',NULL,'20190422013129026590',54,544,6,820,'マルナカ'),(793,'20190421',NULL,'20190422013129026590',55,95,101,0,''),(794,'20190421',NULL,'20190422013129026590',67,181,101,0,''),(795,'20190421',NULL,'20190424004412041058',53,210,7,210,'岡山→備前一宮'),(796,'20190422',NULL,'20190424004441758541',53,1940,7,1940,'倉敷→姫路'),(797,'20190422',NULL,'20190424004506888584',53,200,7,200,'姫路→ひめじ別所'),(798,'20190422',NULL,'20190424005039180935',54,140,6,248,'佐土デイリーヤマザキ おにぎりと水'),(799,'20190422',NULL,'20190424005039180935',55,108,101,0,''),(800,'20190422',NULL,'20190424005132990927',69,4910,6,4910,'八剣伝佐土 合計18910だが二人が7千円ずつ出してくれたので'),(801,'20190422',NULL,'20190424010639889198',53,190,7,190,'御着→姫路'),(802,'20190422',NULL,'20190424010705008378',53,3220,26,3220,'姫路→岡山新幹線'),(803,'20190422',NULL,'20190424010904121842',53,320,7,320,'岡山→倉敷'),(804,'20190424',NULL,'20190425002441176154',54,422,6,611,'ハローズ'),(805,'20190424',NULL,'20190425002441176154',67,189,101,0,''),(806,'20190426',NULL,'20190426025542626214',57,324,24,324,'Blender入門書02'),(807,'20190426',NULL,'20190427063414764899',54,1299,6,1707,'アリオ買い物'),(808,'20190426',NULL,'20190427063414764899',67,108,101,0,''),(809,'20190426',NULL,'20190427063414764899',55,300,101,0,''),(810,'20190426',NULL,'20190427090442626126',1,30000,3,60108,''),(811,'20190426',NULL,'20190427090442626126',6,30000,101,0,''),(812,'20190426',NULL,'20190427090442626126',64,108,101,0,''),(813,'20190427',NULL,'20190427131820500634',54,1404,6,1724,''),(814,'20190427',NULL,'20190427131820500634',55,214,101,0,''),(815,'20190427',NULL,'20190427131820500634',67,106,101,0,''),(816,'20190428',NULL,'20190507043431661940',55,106,6,500,'ザグザグ 重曹など'),(817,'20190428',NULL,'20190507043431661940',67,160,101,0,''),(818,'20190428',NULL,'20190507043431661940',58,234,101,0,''),(819,'20190428',NULL,'20190507043511970509',66,1900,6,1900,'城下町カツ丼'),(820,'20190428',NULL,'20190507043600954094',67,132,6,244,'ガルボと水'),(821,'20190428',NULL,'20190507043600954094',55,112,101,0,''),(822,'20190428',NULL,'20190507043711745270',54,1114,6,1114,'生鮭とか米とか ホイル焼き他'),(823,'20190429',NULL,'20190507044047757781',53,1850,26,2430,'水島→高松中央'),(824,'20190429',NULL,'20190507044047757781',53,580,101,0,''),(825,'20190429',NULL,'20190507044117614842',66,260,6,260,'与島PA コロッケ2個'),(826,'20190429',NULL,'20190507044155085698',66,450,6,450,'与島PA たこ焼き'),(827,'20190429',NULL,'20190507044224187396',70,200,6,200,'屋島 瓦投げ'),(828,'20190429',NULL,'20190507044342807418',53,500,26,500,'府中湖PA→高松東（間違い）、高松東→児島'),(829,'20190429',NULL,'20190507044342807418',53,670,53,2370,''),(830,'20190429',NULL,'20190507044342807418',53,1700,101,0,''),(831,'20190429',NULL,'20190507044420026736',67,917,6,917,'与島PA 一六タルト小箱2種'),(832,'20190430',NULL,'20190507050443320855',67,1000,6,1000,'五大北天まんじゅう@津山'),(833,'20190430',NULL,'20190507050530773711',54,171,6,331,'津山ザグザグ プロテインバーとチョコ'),(834,'20190430',NULL,'20190507050530773711',67,160,101,0,''),(835,'20190430',NULL,'20190507050614896287',66,1500,6,1500,'大輔@津山 豚骨ラーメン二人分'),(836,'20190430',NULL,'20190507050859745672',68,1123,6,1123,'スタバ@岡山駅'),(837,'20190430',NULL,'20190507051036058356',53,4231,6,4231,'30.66L 451.3km 9.38円/km 14.7km/L'),(838,'20190430',NULL,'20190507052426774440',57,3131,24,3131,'WSJ'),(839,'20190430',NULL,'20190507052445523136',40,2704,24,2704,'IIJ'),(840,'20190430',NULL,'20190507052507899305',40,756,24,756,'sony mobile'),(841,'20190430',NULL,'20190507052531762183',40,3220,4,3220,'携帯代'),(842,'20190430',NULL,'20190507052612443755',21,38000,1,38324,''),(843,'20190430',NULL,'20190507052612443755',64,324,101,0,''),(844,'20190430',NULL,'20190507053841462656',40,4104,24,4104,'光回線'),(845,'20190430',NULL,'20190507053917750127',39,540,24,540,'ATOK passport'),(846,'20190430',NULL,'20190507053940171926',70,980,24,980,'Apple Music'),(847,'20190415',NULL,'20190507054628956622',53,1080,26,1080,'J-WESTカード年間費'),(848,'20190501',NULL,'20190507060204078122',49,38000,21,38000,''),(849,'20190507',NULL,'20190507060231367040',24,37010,1,37010,''),(850,'20190501',NULL,'20190507060909443750',7,5000,26,5000,'倉敷→御着 神戸の叔父通夜・葬儀参列のため'),(851,'20190501',NULL,'20190507060909443750',53,1940,7,1940,''),(852,'20190502',NULL,'20190507061306236086',53,1660,26,1660,'御着→北長瀬'),(853,'20190502',NULL,'20190507062855157424',66,1402,6,1402,'南区トマオニ'),(854,'20190503',NULL,'20190507063204497702',66,880,6,880,'コメダ津山モーニング'),(855,'20190503',NULL,'20190507063408398103',55,108,6,228,'津山ローソン 水とおにぎり'),(856,'20190503',NULL,'20190507063408398103',54,120,101,0,''),(857,'20190503',NULL,'20190507063510762300',54,195,6,195,'津山鏡野ローソン トイレ休憩'),(858,'20190503',NULL,'20190507063703070601',69,540,6,540,'ネギ塩だれ@奥津湖 実家美作BBQ用'),(859,'20190503',NULL,'20190507063747471815',55,428,6,428,'マルイ上井店@倉吉 道中飲み物'),(860,'20190504',NULL,'20190507063837105810',55,112,6,262,'BBQ帰り いつものローソン'),(861,'20190504',NULL,'20190507063837105810',54,150,101,0,''),(862,'20190505',NULL,'20190507064005874490',55,132,6,292,'福山ローソン スコーンと飲み物'),(863,'20190505',NULL,'20190507064005874490',54,160,101,0,''),(864,'20190505',NULL,'20190507064035087562',53,100,6,100,'笠岡コインP'),(865,'20190505',NULL,'20190507064105149662',66,1400,6,1400,'笠岡ラーメンいではら 坂本さんお休みのため'),(866,'20190505',NULL,'20190507064232999622',54,681,6,939,'マルナカ一宮 野菜炒めと味噌汁用'),(867,'20190505',NULL,'20190507064232999622',67,258,101,0,''),(868,'20190506',NULL,'20190507064325217210',67,138,6,267,'津山へ行き雨で引き返して赤磐のローソンで'),(869,'20190506',NULL,'20190507064325217210',55,129,101,0,''),(870,'20190506',NULL,'20190507064408885726',68,1198,6,1198,'第二のスタバ コーヒーとティーとタルト'),(871,'20190506',NULL,'20190507064458027147',54,328,6,328,'マルナカ一宮 20時半 半額の半額・・・？'),(872,'20190506',NULL,'20190507064518068368',53,1000,6,1000,'アイ用'),(873,'20190507',NULL,'20190507071511613462',5,826647,9,724600,'JR西 100株売却@8534'),(874,'20190507',NULL,'20190507071511613462',46,737,95,128800,''),(875,'20190507',NULL,'20190507071511613462',73,19512,101,0,''),(876,'20190507',NULL,'20190507071511613462',79,6504,101,0,''),(877,'20190507',NULL,'20190507150009991717',54,1436,6,1923,'アリオ'),(878,'20190507',NULL,'20190507150009991717',55,84,101,0,''),(879,'20190507',NULL,'20190507150009991717',67,403,101,0,''),(880,'20190430',NULL,'20190507150301432395',61,4562,28,4562,'4月未払計上'),(881,'20190430',NULL,'20190507150301432395',76,16410,27,16410,'');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regularly`
--

DROP TABLE IF EXISTS `regularly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regularly` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `is_regist_automaticaly` tinyint(1) NOT NULL,
  `acc_bot_uid` int(11) NOT NULL,
  `amount_per_month` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `payment_day` varchar(20) DEFAULT NULL,
  `acc_bot_uid_from` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `regularly_acc_bot_uid_from_a07b5622_fk_acc_bot_uid` (`acc_bot_uid_from`),
  KEY `regularly_acc_bot_uid_3e7e9779_fk_acc_bot_uid` (`acc_bot_uid`),
  CONSTRAINT `regularly_acc_bot_uid_3e7e9779_fk_acc_bot_uid` FOREIGN KEY (`acc_bot_uid`) REFERENCES `acc_bot` (`uid`),
  CONSTRAINT `regularly_acc_bot_uid_from_a07b5622_fk_acc_bot_uid` FOREIGN KEY (`acc_bot_uid_from`) REFERENCES `acc_bot` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regularly`
--

LOCK TABLES `regularly` WRITE;
/*!40000 ALTER TABLE `regularly` DISABLE KEYS */;
INSERT INTO `regularly` VALUES (5,0,57,3131,'WSJ電子版','28',24),(6,0,40,2704,'IIJ sim2回線','28',24),(7,0,40,756,'SonyMobile sim','28',24),(8,0,40,3220,'携帯','28',4),(9,0,49,38000,'家賃','28',1),(10,0,64,324,'家賃の引き落とし手数料','28',1),(11,0,40,4104,'光回線代','28',1),(12,0,39,540,'JustSystem ATOK passport','28',24),(13,0,70,980,'Apple Music利用料','28',24);
/*!40000 ALTER TABLE `regularly` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-08 15:39:39
