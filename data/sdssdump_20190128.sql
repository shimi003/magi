-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: sdss2_0
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
  `name` varchar(45) NOT NULL,
  `name_ac` varchar(45) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_acc_bot_acc_mid1_idx` (`acc_mid_uid`),
  CONSTRAINT `fk_acc_bot_acc_mid1` FOREIGN KEY (`acc_mid_uid`) REFERENCES `acc_mid` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_bot`
--

LOCK TABLES `acc_bot` WRITE;
/*!40000 ALTER TABLE `acc_bot` DISABLE KEYS */;
INSERT INTO `acc_bot` VALUES (1,1,1100,'普通預金（郵貯）','yuutyo',NULL),(2,1,1110,'普通預金（MUFG）','mufg',NULL),(3,1,1120,'普通預金（中国銀行）','tyuugoku',NULL),(4,1,1130,'普通預金（みなと）','minato',NULL),(5,1,1140,'特定口座（丸三）','marusan',NULL),(6,1,1150,'現金','genkin',NULL),(7,1,1160,'ICOCA','icoca',NULL),(8,1,1170,'ヨドバシポイント','yodobashi',NULL),(9,2,2100,'有価証券','yuuka',NULL),(10,2,2110,'為替出資金','kawasesyussi',NULL),(11,2,2120,'出資金','syussi',NULL),(12,2,2130,'繰延投資利益','kurinobetousirieki',NULL),(13,3,3100,'ソフトウェア','software',NULL),(14,3,3110,'土地','tochi',NULL),(15,3,3120,'備品','bihin',NULL),(16,3,3130,'建物','tatemono',NULL),(17,3,3140,'車両','syaryou',NULL),(18,3,3150,'固定資産減価償却累計額','genkaruikei',NULL),(19,4,4100,'前払金','maebaraikin',NULL),(20,4,4110,'前払保険料','maebaraihokenryou',NULL),(21,4,4120,'前払費用','maebaraihiyou',NULL),(22,4,4130,'未収金','misyuukin',NULL),(23,4,4140,'使途不明金','sitohumeikin',NULL),(24,5,5100,'未払金（セゾン）','mibaraisezon',NULL),(25,5,5110,'未払金（ETC）','mibaraietc',NULL),(26,5,5120,'未払金（J-WEST）','mibaraijwest',NULL),(27,5,5130,'未払保険料','mibaraihokenryou',NULL),(28,5,5140,'その他未払金','sonotamibarai',NULL),(29,5,5150,'繰延投資損失','kurinobetousisonneki',NULL),(30,6,6100,'未払金（長期ローン）','mibarailoan',NULL),(31,7,7100,'繰越利益剰余金','kurikosiriekijyouyokin',NULL),(32,7,7110,'資本金','sihonkin',NULL),(33,7,7120,'当期純損益','toukiyunnsoneki',NULL),(34,8,8100,'その他利害関係者持分','sonotarigai',NULL),(35,16,8800,'その他評価換算差額','sonotahyouka',NULL),(36,9,9100,'通勤費','tuukin',NULL),(37,9,9110,'出張費','syuttyou',NULL),(38,9,9120,'接待交際費','settai',NULL),(39,9,9130,'事務費','jimu',NULL),(40,9,9140,'通信費','tuusin',NULL),(41,9,9150,'服飾費（原価）','hukusyokugenka',NULL),(42,9,9160,'機器購入費（原価）','kikikounyuugenka',NULL),(43,9,9170,'自己投資費','jikotousi',NULL),(44,9,9180,'機器修繕費','kikisyuuzen',NULL),(45,9,9190,'支払利息（原価）','siharairisokugenka',NULL),(46,9,9200,'支払手数料（原価）','siharaitesuuryougenka',NULL),(47,9,9210,'租税公課（原価）','sozeikoukagenka',NULL),(48,9,9220,'その他売上原価','sonotauriagegenka',NULL),(49,10,10100,'支払家賃','siharaiyatin',NULL),(50,10,10110,'租税公課（住居費）','sozeikoukajyuukyo',NULL),(51,10,10120,'支払利息（住居費）','siharairisokujyuukyo',NULL),(52,10,10130,'住居修繕費','jyuukyosyuuzen',NULL),(53,10,10140,'旅費交通費','ryohikoutuuhi',NULL),(54,10,10150,'食費','syokuhi',NULL),(55,10,10160,'飲料費','inryouhi',NULL),(56,10,10170,'医療・厚生費','iryoukouseihi',NULL),(57,10,10180,'新聞図書費','sinbunntosyohi',NULL),(58,10,10190,'消耗品費','syoumouhinnhi',NULL),(59,10,10200,'服飾費（生活）','hukusyokuseikatu',NULL),(60,10,10210,'光熱水費（水道）','kounetusuidou',NULL),(61,10,10220,'光熱水費（電気）','kounetudenki',NULL),(62,10,10230,'光熱水費（ガス）','kounetugasu',NULL),(63,10,10240,'雑品購入費','zappin',NULL),(64,10,10250,'支払手数料（生活費）','siharaitesuuryouseikatu',NULL),(65,10,10260,'その他生活費','sonotaseikatuhi',NULL),(66,11,11100,'外食費','gaisyoku',NULL),(67,11,11110,'菓子類','kasirui',NULL),(68,11,11120,'喫茶費','kissa',NULL),(69,11,11130,'交友費','kouyuu',NULL),(70,11,11140,'娯楽費','goraku',NULL),(71,11,11150,'機器購入費（娯楽）','kikikounyugoraku',NULL),(72,11,11160,'その他娯楽費','sonotagoraku',NULL),(73,12,12100,'所得税','syotokuzei',NULL),(74,12,12110,'租税公課（一般費）','sozeikoukaippan',NULL),(75,12,12120,'厚生年金保険料','kouseinennkin',NULL),(76,12,12130,'国民年金保険料','kokuminnenkin',NULL),(77,12,12140,'社会保険料','syaho',NULL),(78,12,12150,'国民健康保険料','kokuho',NULL),(79,12,12160,'市民・県民税','siminkennminnzei',NULL),(80,12,12170,'雇用保険料','koyouhokenryou',NULL),(81,12,12180,'減価償却費','genkasyoukyakuhi',NULL),(82,12,12190,'車両保険料','syaryouhokenryou',NULL),(83,12,12200,'生命保険料','seimeihokenryou',NULL),(84,12,12210,'その他保険料','sonotahokenryou',NULL),(85,12,12220,'その他公的支出','sonotakoutekisisyutu',NULL),(86,12,12230,'寄付','kihu',NULL),(87,13,13100,'有価証券売却損','yuukasyoukenbaikyakuzon',NULL),(88,13,13110,'有価証券評価損','yuukasyoukenhyoukazon',NULL),(89,13,13120,'為替差損失','kawasesasonnsitu',NULL),(90,13,13130,'その他投資損失','sonotatousisonnsitu',NULL),(91,13,13140,'特別損失','tokubetusonnsitu',NULL),(92,14,14100,'給与所得','kyuuyosyotoku',NULL),(93,14,14110,'売上','uriage',NULL),(94,15,15100,'有価証券売却益','yuukasyoukenbaikyakueki',NULL),(95,15,15110,'有価証券評価益','yuukasyoukennhyoukaeki',NULL),(96,15,15120,'為替差益','kawasesaeki',NULL),(97,15,15130,'受取利息','uketoririsoku',NULL),(98,15,15140,'受取配当金','uketorihaitoukin',NULL),(99,15,15150,'還付償還金','kannpusyoukankin',NULL),(100,15,15160,'その他特別利益','sonotatokubeturieki',NULL),(101,17,0,'（選択してください）','','初期表示用');
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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_top`
--

LOCK TABLES `acc_top` WRITE;
/*!40000 ALTER TABLE `acc_top` DISABLE KEYS */;
INSERT INTO `acc_top` VALUES (1,'資産',1,1,''),(2,'負債',1,-1,NULL),(3,'純資産',1,-1,NULL),(4,'費用',2,1,''),(5,'収益',2,-1,NULL),(6,'営業活動によるキャッシュフロー',3,1,NULL),(7,'投資活動によるキャッシュフロー',3,1,NULL),(8,'財務活動によるキャッシュフロー',3,1,NULL),(9,'ダミー',0,0,NULL);
/*!40000 ALTER TABLE `acc_top` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add acc bot',7,'add_accbot'),(26,'Can change acc bot',7,'change_accbot'),(27,'Can delete acc bot',7,'delete_accbot'),(28,'Can view acc bot',7,'view_accbot'),(29,'Can add acc mid',8,'add_accmid'),(30,'Can change acc mid',8,'change_accmid'),(31,'Can delete acc mid',8,'delete_accmid'),(32,'Can view acc mid',8,'view_accmid'),(33,'Can add acc top',9,'add_acctop'),(34,'Can change acc top',9,'change_acctop'),(35,'Can delete acc top',9,'delete_acctop'),(36,'Can view acc top',9,'view_acctop'),(37,'Can add budget',10,'add_budget'),(38,'Can change budget',10,'change_budget'),(39,'Can delete budget',10,'delete_budget'),(40,'Can view budget',10,'view_budget'),(41,'Can add journal',11,'add_journal'),(42,'Can change journal',11,'change_journal'),(43,'Can delete journal',11,'delete_journal'),(44,'Can view journal',11,'view_journal');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'sdss','accbot'),(8,'sdss','accmid'),(9,'sdss','acctop'),(10,'sdss','budget'),(11,'sdss','journal'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-29 06:14:09.072186'),(2,'auth','0001_initial','2018-10-29 06:14:10.080884'),(3,'admin','0001_initial','2018-10-29 06:14:10.263324'),(4,'admin','0002_logentry_remove_auto_add','2018-10-29 06:14:10.273508'),(5,'admin','0003_logentry_add_action_flag_choices','2018-10-29 06:14:10.291952'),(6,'contenttypes','0002_remove_content_type_name','2018-10-29 06:14:10.379850'),(7,'auth','0002_alter_permission_name_max_length','2018-10-29 06:14:10.478803'),(8,'auth','0003_alter_user_email_max_length','2018-10-29 06:14:10.555400'),(9,'auth','0004_alter_user_username_opts','2018-10-29 06:14:10.563461'),(10,'auth','0005_alter_user_last_login_null','2018-10-29 06:14:10.600927'),(11,'auth','0006_require_contenttypes_0002','2018-10-29 06:14:10.604606'),(12,'auth','0007_alter_validators_add_error_messages','2018-10-29 06:14:10.612882'),(13,'auth','0008_alter_user_username_max_length','2018-10-29 06:14:10.717074'),(14,'auth','0009_alter_user_last_name_max_length','2018-10-29 06:14:10.794916'),(15,'sdss','0001_initial','2018-10-29 06:14:10.802408'),(16,'sessions','0001_initial','2018-10-29 06:14:10.839123');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (23,'20181031','20181109060636702022',7,4784,32,2038138,'初期値'),(24,'20181031','20181109060636702022',1,804686,101,0,''),(25,'20181031','20181109060636702022',4,148093,101,0,''),(26,'20181031','20181109060636702022',2,696086,101,0,''),(27,'20181031','20181109060636702022',3,384489,101,0,''),(42,'20181031','20181109071236655151',6,113086,32,3858396,'initial'),(43,'20181031','20181109071236655151',9,3253380,101,0,''),(44,'20181031','20181109071236655151',5,441156,101,0,''),(45,'20181031','20181109071236655151',21,38000,101,0,''),(46,'20181031','20181109071236655151',13,12774,101,0,''),(47,'20181031','20181109071316776999',15,5252832,32,5252832,''),(48,'20181031','20181109071447481183',32,32387,24,32387,'initial'),(49,'20181101','20181116033737837097',49,38000,21,38000,''),(50,'20181101','20181116033854535290',62,1895,3,1895,''),(51,'20181101','20181116033918215267',24,101915,1,101915,''),(52,'20181104','20181116034033027623',54,732,6,732,''),(53,'20181104','20181116034033027623',55,259,6,457,''),(54,'20181104','20181116034033027623',67,198,101,0,''),(55,'20181104','20181116034033027623',55,252,6,252,''),(56,'20181103','20181116034307236308',53,6400,6,6400,'京都行費用。1100円は西明石での駐車場代'),(57,'20181103','20181116034307236308',53,1100,6,1100,''),(58,'20181103','20181116034307236308',54,2150,6,2150,''),(59,'20181104','20181116034344393773',67,558,6,558,''),(60,'20181104','20181116034344393773',54,1098,6,1098,''),(61,'20181106','20181116034422057562',58,306,6,306,'トイレットペーパー4ロール'),(62,'20181102','20181116034508531062',54,933,6,1388,''),(63,'20181102','20181116034508531062',67,105,101,0,''),(64,'20181102','20181116034508531062',55,350,101,0,''),(65,'20181106','20181116034537151781',54,856,6,1456,''),(66,'20181106','20181116034537151781',67,600,101,0,''),(67,'20181109','20181116034623335825',54,120,6,753,''),(68,'20181109','20181116034623335825',55,300,101,0,''),(69,'20181109','20181116034623335825',67,333,101,0,''),(70,'20181110','20181116034727782335',55,300,6,445,''),(71,'20181110','20181116034727782335',67,145,101,0,''),(72,'20181110','20181116034727782335',54,240,6,240,''),(73,'20181110','20181116034826256014',66,4082,6,4082,'リトファンとスタバ。改めて見るとすごい金額だ・・・。'),(74,'20181110','20181116034826256014',68,1026,6,1026,''),(75,'20181111','20181116034918468975',66,2062,6,2062,'すしろー'),(76,'20181111','20181116035015803920',67,475,6,475,''),(77,'20181111','20181116035015803920',67,410,6,410,''),(78,'20181111','20181116035015803920',54,367,6,367,''),(79,'20181112','20181116035108294134',54,2364,6,2685,''),(80,'20181112','20181116035108294134',67,105,101,0,''),(81,'20181112','20181116035108294134',55,216,101,0,''),(82,'20181114','20181116035133556618',54,1749,6,2149,''),(83,'20181114','20181116035133556618',67,400,101,0,''),(84,'20181103','20181119072744813818',54,450,6,450,''),(85,'20181103','20181119072815144407',66,1130,6,1130,''),(86,'20181118','20181119072909232347',54,115,6,223,''),(87,'20181118','20181119072909232347',55,108,101,0,''),(88,'20181118','20181119072942241526',55,108,6,216,''),(89,'20181118','20181119072942241526',67,108,101,0,''),(90,'20181118','20181119073012070134',66,4436,6,4436,''),(91,'20181118','20181119073113788876',54,1052,6,1362,''),(92,'20181118','20181119073113788876',55,226,101,0,''),(93,'20181118','20181119073113788876',67,84,101,0,''),(94,'20181118','20181119073325787767',53,500,6,500,'駐車場代@岡山'),(95,'20181119','20181119073619762752',62,2644,28,2644,''),(96,'20180928','20181119073911488624',76,16340,6,16340,''),(97,'20181031','20181119073938135558',76,16340,6,16340,''),(98,'20181119','20181119074059806570',76,16340,3,80000,''),(99,'20181119','20181119074059806570',78,26200,101,0,''),(100,'20181119','20181119074059806570',6,37460,101,0,''),(101,'20181119','20181119074157760950',22,50000,100,50000,'スバル不正検査に対する補償金処理'),(102,'20181120','20181121011523391427',67,237,6,237,'ミスドのポケモンドーナツを求めて・・・'),(103,'20181120','20181121011523391427',67,216,6,216,''),(104,'20181120','20181121011523391427',69,432,6,540,''),(105,'20181120','20181121011523391427',67,108,101,0,''),(106,'20181120','20181121011558759212',55,84,6,316,''),(107,'20181120','20181121011558759212',54,232,101,0,''),(108,'20181120','20181121011646522732',68,345,6,345,'スタバブレンドコーヒー トールサイズ'),(109,'20181120','20181121011852523229',53,5266,6,5266,'ガソリン代 35.34L 532.6km 15.1km/L'),(110,'20181119','20181121012215399922',54,1849,6,2299,''),(111,'20181119','20181121012215399922',55,450,101,0,''),(112,'20181119','20181121012300929296',59,4990,6,5269,''),(113,'20181119','20181121012300929296',58,279,101,0,''),(114,'20181121','20181121074016973904',61,3841,28,3841,''),(115,'20181122','20181122090453568198',3,200,6,200,''),(116,'20181123','20181123130747214707',66,1175,6,1175,'ミスタードーナツ飲食'),(117,'20181123','20181123130849625925',54,326,6,794,''),(118,'20181123','20181123130849625925',67,160,101,0,''),(119,'20181123','20181123130849625925',55,308,101,0,''),(120,'20181123','20181123130922783985',66,1467,6,1467,'西崎食堂 飲食'),(121,'20181123','20181123130939041995',68,918,6,918,''),(122,'20181123','20181123141339730951',70,2000,6,2000,'ラウンドワンボーリング2ゲーム'),(123,'20181124','20181126003034206210',54,295,6,295,''),(124,'20181124','20181126003034206210',54,920,6,1101,''),(125,'20181124','20181126003034206210',67,181,101,0,''),(126,'20181124','20181126003253374934',70,1000,6,1000,'カラオケとやつのガソリン代'),(127,'20181124','20181126003253374934',53,2000,6,2000,''),(128,'20181124','20181126003355730377',68,905,6,905,'ミスド'),(129,'20181126','20181126003520337358',59,11800,24,11800,'カバン購入'),(130,'20181122','20181127112404905364',54,1491,6,1811,''),(131,'20181122','20181127112404905364',67,320,101,0,''),(132,'20181128','20181204035330270931',54,1475,6,1797,''),(133,'20181128','20181204035330270931',67,322,101,0,''),(134,'20181129','20181204035357179157',54,321,6,741,''),(135,'20181129','20181204035357179157',55,420,101,0,''),(136,'20181124','20181204041330055285',53,410,25,410,''),(137,'20181201','20181205043644520012',49,38000,21,38000,''),(138,'20181201','20181205043721491800',54,320,6,465,'吉備SA飲食'),(139,'20181201','20181205043721491800',55,145,101,0,''),(140,'20181202','20181205043744777986',54,315,6,315,''),(141,'20181202','20181205043806808919',66,2568,6,2568,'ミスターバーグ'),(142,'20181202','20181205043837371315',68,646,6,646,'ミスドでお茶'),(143,'20181202','20181205043921824177',56,1234,6,1234,''),(144,'20181112','20181205044604623426',26,20310,2,20310,'交通費その他支払'),(145,'20181203','20181205045348600651',28,2644,3,2644,'前月都市ガス'),(146,'20181126','20181205045855014019',82,7950,3,7950,'自動車保険料'),(147,'20181205','20181205050151289012',3,35908,32,35908,'金額修正（原因不明）'),(148,'20181203','20181206040821410756',54,1006,6,1131,'ario'),(149,'20181203','20181206040821410756',55,125,101,0,''),(150,'20181203','20181206040914173330',67,405,6,2195,'Ario無印 バーム３個と乳液'),(151,'20181203','20181206040914173330',56,1790,101,0,''),(152,'20181203','20181206041142419654',58,1363,6,1661,'コーナンで敷きパッド冬用とチョコ'),(153,'20181203','20181206041142419654',67,298,101,0,''),(154,'20181206','20181206041407752432',43,12592,24,12592,'SwichScience M5Stack他開発用HW'),(155,'20181206','20181206041715176091',71,25600,24,34278,'Amazon買い物 機器は３Dプリンタ 交友は山口ういろう'),(156,'20181206','20181206041715176091',57,8678,101,0,''),(157,'20181206','20181206041715176091',69,5039,24,5039,''),(158,'20181126','20181206042024108051',40,4104,1,4104,'インターネット代'),(159,'20181127','20181206042126026472',21,38000,1,38324,'家賃前払い'),(160,'20181127','20181206042126026472',46,324,101,0,''),(161,'20181204','20181206042211702461',24,28718,1,28718,'何らかの支払'),(162,'20181116','20181206042307159463',6,36000,1,36000,''),(163,'20181130','20181206042541337509',101,50000,22,50000,'スバル不正弁済金回収'),(164,'20181205','20181206073521500211',54,1483,6,2193,''),(165,'20181205','20181206073521500211',67,550,101,0,''),(166,'20181205','20181206073521500211',55,160,101,0,''),(167,'20181206','20181206073630367483',67,701,6,701,'ミスド ピカチュウx2他'),(169,'20181207','20181212054744740945',54,531,6,825,''),(170,'20181207','20181212054744740945',55,294,101,0,''),(171,'20181209','20181212054839045117',54,772,6,1221,''),(172,'20181209','20181212054839045117',55,350,101,0,''),(173,'20181209','20181212054839045117',67,99,101,0,''),(174,'20181209','20181212054914335609',68,1219,6,1219,''),(175,'20181209','20181212054937400729',66,1800,6,1800,'はちや ランチ'),(176,'20181209','20181212054957987437',58,1213,6,1213,''),(177,'20181211','20181217024543514869',54,914,6,1468,''),(178,'20181211','20181217024543514869',55,233,101,0,''),(179,'20181211','20181217024543514869',67,321,101,0,''),(180,'20181212','20181217024615148278',54,1250,6,1410,''),(181,'20181212','20181217024615148278',55,160,101,0,''),(182,'20181215','20181217024646419296',54,152,6,822,''),(183,'20181215','20181217024646419296',67,502,101,0,''),(184,'20181215','20181217024646419296',55,168,101,0,''),(185,'20181215','20181217024714665641',58,1294,6,1908,''),(186,'20181215','20181217024714665641',55,520,101,0,''),(187,'20181215','20181217024714665641',67,94,101,0,''),(188,'20181216','20181217024756128482',66,600,6,600,'千成屋 たこやき3パック'),(189,'20181216','20181217024853291719',66,700,6,700,'与島PA うどんかけ 大と小'),(190,'20181216','20181217024939432591',67,1004,6,1004,'与島PA 吉備大福と柿のやつ'),(191,'20181216','20181217025046384045',53,5211,6,5211,'ガソリン代 37.22L 502.8km 13.5km/L'),(192,'20181216','20181217025127382774',68,1026,6,1026,'スタバ ピスタチオ温とジンジャーブレッドラテ温'),(193,'20181216','20181217025210097597',53,1540,25,1540,'児島IC～与島PAの往復代'),(194,'20181206','20181217025501968865',67,148,6,762,''),(195,'20181206','20181217025501968865',55,200,101,0,''),(196,'20181206','20181217025501968865',54,414,101,0,''),(197,'20181215','20181217025610468454',59,900,6,900,'コインランドリー代（洗濯機故障中・・・）'),(198,'20181008','20181221023133488315',53,6801,6,6801,'山陽道小谷SAにて給油'),(199,'20181110','20181221023430451274',53,3780,6,3780,'一宮給油'),(200,'20181214','20181221054953637610',76,16340,6,42540,''),(201,'20181214','20181221054953637610',78,26200,101,0,''),(202,'20181218','20181221055150588019',54,1283,6,1591,''),(203,'20181218','20181221055150588019',55,200,101,0,''),(204,'20181218','20181221055150588019',67,108,101,0,''),(205,'20181220','20181221055309411617',54,300,6,889,''),(206,'20181220','20181221055309411617',55,291,101,0,''),(207,'20181220','20181221055309411617',67,298,101,0,''),(208,'20181220','20181221055335860746',63,1134,6,1134,'本立て@ロフト'),(209,'20181220','20181221055407732010',54,320,6,597,''),(210,'20181220','20181221055407732010',55,277,101,0,''),(211,'20181220','20181221055426810698',59,800,6,800,'洗濯代'),(212,'20181214','20181221055550846493',6,50000,1,50000,'国保等支払用'),(213,'20181219','20181221055629899426',6,20000,3,20000,'新札両替用'),(214,'20181103','20181228013109790393',53,3370,7,3370,'京都行 西明石～京都と京都市内移動 2個目は金額調整'),(215,'20181103','20181228013109790393',7,16,100,16,''),(216,'20181128','20181228013228626872',53,520,7,520,'岡山県内移動'),(217,'20181128','20181228013228626872',7,5000,26,5000,''),(218,'20181218','20181228013440210745',53,640,7,640,'岡山～倉敷'),(219,'20181223','20181228013523853285',53,1360,7,1360,'新三田～梅田往復'),(220,'20181222','20181228015919540151',69,2160,6,2160,'えびせん高級'),(221,'20181222','20181228015939461943',66,2550,6,2550,''),(222,'20181222','20181228020015627899',54,2384,6,2384,'かにすき！'),(223,'20181222','20181228020120976983',54,276,6,1434,'宅飲み用'),(224,'20181222','20181228020120976983',55,412,101,0,''),(225,'20181222','20181228020120976983',67,746,101,0,''),(226,'20181223','20181228020208482324',70,3240,6,3240,'梅田タワレコにて洋楽アルバム3枚 久々！！'),(227,'20181223','20181228020306514032',66,2268,6,2268,'梅田の五右衛門 阪急上 19F？'),(228,'20181223','20181228020436858747',54,614,6,968,'相生ファミマにて軽く昼食 彼女氏がスープを盛大に倒す'),(229,'20181223','20181228020436858747',55,150,101,0,''),(230,'20181223','20181228020436858747',67,204,101,0,''),(231,'20181223','20181228020509896937',55,132,6,242,''),(232,'20181223','20181228020509896937',54,110,101,0,''),(233,'20181223','20181228020658963530',53,3436,6,3436,'新三田駅前ガソリンスタンド アイにフル給油 24L'),(234,'20181223','20181228020739796904',55,151,6,151,'ローソン加東 ほうじ茶ラテ'),(235,'20181224','20181228020815426223',54,550,6,550,'ハビーズ大安寺 お鍋食材'),(236,'20181224','20181228020904571582',66,2750,6,2750,'津山アルネ裏のお洒落蕎麦屋さんにて'),(237,'20181224','20181228020946601267',68,1500,6,1500,'津山コメダ ケーキセットx2♪'),(238,'20181224','20181228021042636648',56,1280,6,1280,'海水？ぽくなる塩入浴剤＠MIMOSA大安寺'),(239,'20181224','20181228021117297487',54,238,6,338,'翌日用'),(240,'20181224','20181228021117297487',55,100,101,0,''),(241,'20181226','20181228021901357744',69,1207,6,1207,'年賀状代'),(242,'20181226','20181228021935716006',55,728,6,2441,''),(243,'20181226','20181228021935716006',54,1713,101,0,''),(244,'20181227','20181228022036752348',53,4504,6,4504,'給油＠赤澤屋 142円'),(245,'20181228','20190107042149168621',54,622,6,2048,''),(246,'20181228','20190107042149168621',55,458,101,0,''),(247,'20181228','20190107042149168621',67,968,101,0,''),(248,'20181229','20190107042305680594',54,674,6,917,''),(249,'20181229','20190107042305680594',55,116,101,0,''),(250,'20181229','20190107042305680594',67,127,101,0,''),(251,'20181230','20190107042337274617',58,569,6,569,''),(252,'20181230','20190107042417352032',66,1485,6,1485,'joyfull'),(253,'20181231','20190107042453537070',68,928,6,928,'スタバ'),(254,'20181231','20190107042544612814',66,1530,6,1530,'マクドナルド野田店'),(255,'20181231','20190107042643261259',54,492,6,1011,'カロリーメイトと歯ブラシとマスク'),(256,'20181231','20190107042643261259',58,519,101,0,''),(257,'20181231','20190107042944572995',54,108,6,2045,'姫路飲み会用他'),(258,'20181231','20190107042944572995',55,918,101,0,''),(259,'20181231','20190107042944572995',67,1019,101,0,''),(260,'20181227','20190107044515141864',21,38000,1,38324,'201901家賃'),(261,'20181227','20190107044515141864',64,324,101,0,''),(262,'20181225','20190107044547131078',40,4104,1,4104,'インターネット代'),(263,'20181228','20190107044703929538',6,46000,1,46000,'正月用資金'),(264,'20181210','20190107053934556077',53,19350,2,19350,'旅費交通費未払い分（ICOCAとETC）'),(265,'20181126','20190107054541816383',82,7950,3,7950,''),(266,'20181217','20190107054816767487',62,3864,3,3864,''),(267,'20181226','20190107054847901677',82,7950,3,7950,''),(268,'20190101','20190107065445907453',53,1000,6,1000,'最上稲荷 駐車場代'),(269,'20190101','20190107065628543007',54,600,6,600,'姫路飲み会代（MV別所）'),(270,'20190101','20190107065654653043',49,38000,21,38000,''),(271,'20190101','20190107065941436988',53,6220,26,6220,'上段は岡山→姫路新幹線二人分、二段目は姫路～とか移動、3段目は相生→岡山こだま自由席'),(272,'20190101','20190107065941436988',53,1110,7,1110,''),(273,'20190101','20190107065941436988',53,2110,26,2110,''),(274,'20190101','20190107070137820726',54,780,6,1241,''),(275,'20190101','20190107070137820726',55,280,101,0,''),(276,'20190101','20190107070137820726',67,181,101,0,''),(277,'20190102','20190107070227248516',54,416,6,862,''),(278,'20190102','20190107070227248516',67,216,101,0,''),(279,'20190102','20190107070227248516',55,230,101,0,''),(280,'20190104','20190107070302438519',66,1116,6,1116,'スシロー（1000円出してもらった）'),(281,'20190104','20190107070459421585',66,1314,6,1314,'joyfullいつものとこ'),(282,'20190104','20190107070716413839',58,481,6,1457,'ダイキにてトイレットペーパーとおかし大量'),(283,'20190104','20190107070716413839',67,976,101,0,''),(284,'20190105','20190107072510126801',67,518,6,518,'マネケン岡山駅'),(285,'20190105','20190107072542140896',67,119,6,227,''),(286,'20190105','20190107072542140896',55,108,101,0,''),(287,'20190105','20190107072627295393',67,198,6,332,''),(288,'20190105','20190107072627295393',54,134,101,0,''),(289,'20190105','20190107072703334880',58,1990,6,1990,'無印乳液'),(290,'20190105','20190107072753826256',66,930,6,930,'吉野家岡山駅前 500円出してもらった気がする'),(291,'20190105','20190107072831905834',54,520,6,1516,''),(292,'20190105','20190107072831905834',67,620,101,0,''),(293,'20190105','20190107072831905834',55,376,101,0,''),(294,'20190106','20190109063253668791',66,580,6,580,'銀だこ 福山イトーヨーカドー店'),(295,'20190106','20190109063349153235',57,2052,6,2052,'啓文社ポートプラザ店 ホモ・サピエンス全史（上）'),(296,'20190107','20190109063420204520',54,529,6,529,'マルナカ'),(297,'20190108','20190109063459605466',54,337,6,835,''),(298,'20190108','20190109063459605466',67,138,101,0,''),(299,'20190108','20190109063459605466',55,360,101,0,''),(300,'20190108','20190109063537517479',54,200,6,920,'ひまわり カップ麺とサプリと'),(301,'20190108','20190109063537517479',56,720,101,0,''),(302,'20190106','20190109063618221788',68,835,6,835,'スタバ中島'),(303,'20190108','20190109063721453567',55,100,6,9718,'寄付は姫工'),(304,'20190108','20190109063721453567',86,3000,101,0,''),(305,'20190108','20190109063721453567',61,6618,101,0,''),(306,'20190110','20190112034157036738',54,1097,6,1718,'かおり氏見舞い用'),(307,'20190110','20190112034157036738',67,300,101,0,''),(308,'20190110','20190112034157036738',55,321,101,0,''),(309,'20190111','20190112034231920976',6,36000,1,36000,''),(310,'20190111','20190112034301036952',54,530,6,530,'パン購入@アリオパン屋'),(311,'20190111','20190112034338177167',54,1480,6,1865,''),(312,'20190111','20190112034338177167',67,210,101,0,''),(313,'20190111','20190112034338177167',55,175,101,0,''),(314,'20190111','20190112034426056867',54,300,6,932,'無印でバウム2個とトイレスリッパ'),(315,'20190111','20190112034426056867',58,632,101,0,''),(316,'20190111','20190112034526553775',56,1060,6,5140,'皮膚科 上段はすわ 下段は薬代 28日分'),(317,'20190111','20190112034526553775',56,4080,101,0,''),(318,'20190113','20190115004500060881',54,140,6,388,'小腹満たし用 ローソン'),(319,'20190113','20190115004500060881',55,248,101,0,''),(320,'20190113','20190115004729145267',53,4381,6,4381,'ガソリン代 31.52L＠139 395.3km 燃費12.5km/L年末年始渋滞？'),(321,'20190113','20190115004811940326',66,1930,6,1930,'与島PAにて'),(322,'20190113','20190115004918441086',53,1700,25,1700,'児島→坂出 間違って一般出口から出たため'),(323,'20190113','20190115005019175251',57,4212,6,4212,'サピエンス全史下巻と新書2冊 啓文社岡山'),(324,'20190113','20190115005117128466',67,591,6,855,'ローソンでアイスとか'),(325,'20190113','20190115005117128466',55,264,101,0,''),(326,'20190114','20190115005209370771',66,1296,6,1296,'マコアでモーニング トーストサンドセットx2'),(327,'20190114','20190115005256207287',58,306,6,306,'マイクロファイバークロス3枚セット ジュンテンドー'),(328,'20190114','20190115005532694786',66,3158,6,3158,'すし丸 17皿 千円出してもらった'),(329,'20190114','20190115005642865104',54,836,6,1101,'自分用マルナカ老松'),(330,'20190114','20190115005642865104',67,127,101,0,''),(331,'20190114','20190115005642865104',55,138,101,0,''),(332,'20190114','20190115005837538605',68,874,6,874,'スタバにてドリンク2種'),(333,'20190113','20190115011549036548',66,1000,6,1000,'イカ焼き2本＠桂浜'),(334,'20181231','20190115050839789810',9,311220,95,311220,'決算修正'),(335,'20181231','20190115050839789810',5,534229,100,534229,''),(336,'20190116','20190116115726835569',54,717,6,2162,'菓子類はナッツその他'),(337,'20190116','20190116115726835569',67,860,101,0,''),(338,'20190116','20190116115726835569',55,585,101,0,''),(339,'20190117','20190121012038649507',63,7719,24,12330,'ヨドバシ買い物 ひげそり、FlashAir4、携帯F10-B用バッテリー'),(340,'20190117','20190121012038649507',44,1061,101,0,''),(341,'20190117','20190121012038649507',8,3550,101,0,''),(342,'20190118','20190121012134832814',54,853,6,1353,'ハピーズアリオ買い物'),(343,'20190118','20190121012134832814',67,320,101,0,''),(344,'20190118','20190121012134832814',55,180,101,0,''),(345,'20190120','20190121012244139915',67,163,6,313,'ローソンチョコとコーヒー'),(346,'20190120','20190121012244139915',55,150,101,0,''),(347,'20190120','20190121012356519909',53,640,25,640,'第二神明〜須磨IC往復'),(348,'20190120','20190121012442729125',66,4082,6,4082,'リトファン生パスタセット二人分。おいしい。'),(349,'20190121','20190124015725500649',54,340,6,712,'マルナカ食材'),(350,'20190121','20190124015725500649',67,105,101,0,''),(351,'20190121','20190124015725500649',55,267,101,0,''),(352,'20190122','20190124015956893870',21,9207,1,90000,'郵貯で国保等支払。前払費用は電気代（1月度電気代だが今まで1か月遅れで払ってるので）'),(353,'20190122','20190124015956893870',78,26200,101,0,''),(354,'20190122','20190124015956893870',76,16340,101,0,''),(355,'20190122','20190124015956893870',6,38253,101,0,''),(356,'20190123','20190124020151237799',63,3304,6,3304,'コーナンにてカラーボックス2個'),(357,'20190123','20190124020322152016',53,6569,6,6569,'ガソリン代 47.6L 726.0km 17.0km/L 香川行きとか須磨行きとか長距離多い'),(358,'20190201','20190124020401539363',61,9207,21,9207,'電気代振替'),(359,'20190104','20190124021249409072',24,75774,1,75774,'なんか買ったんだろな・・・。'),(360,'20190110','20190124021356899122',1,200000,2,200000,'生活資金移動'),(361,'20190110','20190124021501387741',26,11030,2,11030,'未払金（ETC）って不要じゃね・・・？'),(362,'20190122','20190124021915686847',55,475,6,1882,'アリオ食材'),(363,'20190122','20190124021915686847',67,210,101,0,''),(364,'20190122','20190124021915686847',54,1197,101,0,''),(365,'20190124','20190126024441021760',54,491,6,1035,'マルナカ買い物'),(366,'20190124','20190126024441021760',55,233,101,0,''),(367,'20190124','20190126024441021760',67,311,101,0,''),(368,'20190126','20190127001606442038',53,730,7,730,'倉敷→備前西市、岡山→倉敷'),(369,'20190126','20190127001739945349',43,233,6,233,'ユニバーサル基板2枚＠松本無線'),(370,'20190126','20190127001818926788',54,997,6,1391,'アリオ食材'),(371,'20190126','20190127001818926788',67,214,101,0,''),(372,'20190126','20190127001818926788',55,180,101,0,''),(373,'20190105','20190127003125382331',53,210,7,210,'岡山→備前一宮');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-28  9:36:15
