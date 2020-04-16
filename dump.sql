mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: eccubedb
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_authority_role`
--

DROP TABLE IF EXISTS `dtb_authority_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_authority_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authority_id` smallint(5) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `deny_url` varchar(4000) NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A1F70B181EC865B` (`authority_id`),
  KEY `IDX_4A1F70B161220EA6` (`creator_id`),
  CONSTRAINT `FK_4A1F70B161220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_4A1F70B181EC865B` FOREIGN KEY (`authority_id`) REFERENCES `mtb_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_authority_role`
--

LOCK TABLES `dtb_authority_role` WRITE;
/*!40000 ALTER TABLE `dtb_authority_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_authority_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_base_info`
--

DROP TABLE IF EXISTS `dtb_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_base_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_kana` varchar(255) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `addr01` varchar(255) DEFAULT NULL,
  `addr02` varchar(255) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `business_hour` varchar(255) DEFAULT NULL,
  `email01` varchar(255) DEFAULT NULL,
  `email02` varchar(255) DEFAULT NULL,
  `email03` varchar(255) DEFAULT NULL,
  `email04` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_kana` varchar(255) DEFAULT NULL,
  `shop_name_eng` varchar(255) DEFAULT NULL,
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `good_traded` varchar(4000) DEFAULT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `delivery_free_amount` decimal(12,2) unsigned DEFAULT NULL,
  `delivery_free_quantity` int(10) unsigned DEFAULT NULL,
  `option_mypage_order_status_display` tinyint(1) NOT NULL DEFAULT '1',
  `option_nostock_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `option_favorite_product` tinyint(1) NOT NULL DEFAULT '1',
  `option_product_delivery_fee` tinyint(1) NOT NULL DEFAULT '0',
  `option_product_tax_rule` tinyint(1) NOT NULL DEFAULT '0',
  `option_customer_activate` tinyint(1) NOT NULL DEFAULT '1',
  `option_remember_me` tinyint(1) NOT NULL DEFAULT '1',
  `authentication_key` varchar(255) DEFAULT NULL,
  `php_path` varchar(255) DEFAULT NULL,
  `option_point` tinyint(1) NOT NULL DEFAULT '1',
  `basic_point_rate` decimal(10,0) unsigned DEFAULT '1',
  `point_conversion_rate` decimal(10,0) unsigned DEFAULT '1',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D3655F4F92F3E70` (`country_id`),
  KEY `IDX_1D3655F4E171EF5F` (`pref_id`),
  CONSTRAINT `FK_1D3655F4E171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_1D3655F4F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_base_info`
--

LOCK TABLES `dtb_base_info` WRITE;
/*!40000 ALTER TABLE `dtb_base_info` DISABLE KEYS */;
INSERT INTO `dtb_base_info` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tano@bestbeerjapan.com','tano@bestbeerjapan.com','tano@bestbeerjapan.com','tano@bestbeerjapan.com','Best Beer Japan Brewery Inc.',NULL,NULL,'2020-03-17 03:02:55',NULL,NULL,NULL,NULL,1,0,1,0,0,1,1,NULL,NULL,1,1,1,'baseinfo');
/*!40000 ALTER TABLE `dtb_base_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_block`
--

DROP TABLE IF EXISTS `dtb_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_type_id` smallint(5) unsigned DEFAULT NULL,
  `block_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `use_controller` tinyint(1) NOT NULL DEFAULT '0',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_type_id` (`device_type_id`,`file_name`),
  KEY `IDX_6B54DCBD4FFA550E` (`device_type_id`),
  CONSTRAINT `FK_6B54DCBD4FFA550E` FOREIGN KEY (`device_type_id`) REFERENCES `mtb_device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_block`
--

LOCK TABLES `dtb_block` WRITE;
/*!40000 ALTER TABLE `dtb_block` DISABLE KEYS */;
INSERT INTO `dtb_block` VALUES (1,10,'カート','cart',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(2,10,'カテゴリ','category',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(3,10,'カテゴリナビ(PC)','category_nav_pc',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(4,10,'カテゴリナビ(SP)','category_nav_sp',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(5,10,'新入荷商品特集','eyecatch',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(6,10,'フッター','footer',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(7,10,'ヘッダー(商品検索・ログインナビ・カート)','header',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(8,10,'ログインナビ(共通)','login',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(9,10,'ログインナビ(SP)','login_sp',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(10,10,'ロゴ','logo',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(11,10,'新着商品','new_item',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(12,10,'新着情報','news',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(13,10,'商品検索','search_product',1,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block'),(14,10,'トピック','topic',0,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','block');
/*!40000 ALTER TABLE `dtb_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_block_position`
--

DROP TABLE IF EXISTS `dtb_block_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_block_position` (
  `section` int(10) unsigned NOT NULL,
  `block_id` int(10) unsigned NOT NULL,
  `layout_id` int(10) unsigned NOT NULL,
  `block_row` int(10) unsigned DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`section`,`block_id`,`layout_id`),
  KEY `IDX_35DCD731E9ED820C` (`block_id`),
  KEY `IDX_35DCD7318C22AA1A` (`layout_id`),
  CONSTRAINT `FK_35DCD7318C22AA1A` FOREIGN KEY (`layout_id`) REFERENCES `dtb_layout` (`id`),
  CONSTRAINT `FK_35DCD731E9ED820C` FOREIGN KEY (`block_id`) REFERENCES `dtb_block` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_block_position`
--

LOCK TABLES `dtb_block_position` WRITE;
/*!40000 ALTER TABLE `dtb_block_position` DISABLE KEYS */;
INSERT INTO `dtb_block_position` VALUES (3,3,0,2,'blockposition'),(3,3,2,3,'blockposition'),(3,7,0,0,'blockposition'),(3,7,1,0,'blockposition'),(3,7,2,1,'blockposition'),(3,10,0,1,'blockposition'),(3,10,1,1,'blockposition'),(3,10,2,2,'blockposition'),(7,2,0,0,'blockposition'),(7,2,1,2,'blockposition'),(7,3,1,1,'blockposition'),(7,12,0,1,'blockposition'),(7,12,1,0,'blockposition'),(10,6,0,0,'blockposition'),(10,6,1,0,'blockposition'),(10,6,2,1,'blockposition'),(11,4,0,1,'blockposition'),(11,4,1,1,'blockposition'),(11,4,2,2,'blockposition'),(11,9,0,2,'blockposition'),(11,9,1,2,'blockposition'),(11,9,2,3,'blockposition'),(11,13,0,0,'blockposition'),(11,13,1,0,'blockposition'),(11,13,2,1,'blockposition');
/*!40000 ALTER TABLE `dtb_block_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_cart`
--

DROP TABLE IF EXISTS `dtb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `cart_key` varchar(255) DEFAULT NULL,
  `pre_order_id` varchar(255) DEFAULT NULL,
  `total_price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `delivery_fee_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `sort_no` smallint(5) unsigned DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `add_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
  `use_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dtb_cart_pre_order_id_idx` (`pre_order_id`),
  KEY `IDX_FC3C24F09395C3F3` (`customer_id`),
  KEY `dtb_cart_update_date_idx` (`update_date`),
  CONSTRAINT `FK_FC3C24F09395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `dtb_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_cart`
--

LOCK TABLES `dtb_cart` WRITE;
/*!40000 ALTER TABLE `dtb_cart` DISABLE KEYS */;
INSERT INTO `dtb_cart` VALUES (2,NULL,'d9FplDcVJvz8VdUtCBHt9YzzX1kLVXQb_1',NULL,13750.00,0.00,NULL,'2020-03-17 05:41:14','2020-03-17 05:41:14',0,0,'cart');
/*!40000 ALTER TABLE `dtb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_cart_item`
--

DROP TABLE IF EXISTS `dtb_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_cart_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_class_id` int(10) unsigned DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `quantity` decimal(10,0) NOT NULL DEFAULT '0',
  `point_rate` decimal(10,0) unsigned DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0228F7421B06187` (`product_class_id`),
  KEY `IDX_B0228F741AD5CDBF` (`cart_id`),
  CONSTRAINT `FK_B0228F741AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `dtb_cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B0228F7421B06187` FOREIGN KEY (`product_class_id`) REFERENCES `dtb_product_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_cart_item`
--

LOCK TABLES `dtb_cart_item` WRITE;
/*!40000 ALTER TABLE `dtb_cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_category`
--

DROP TABLE IF EXISTS `dtb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_category_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `hierarchy` int(10) unsigned NOT NULL,
  `sort_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5ED2C2B796A8F92` (`parent_category_id`),
  KEY `IDX_5ED2C2B61220EA6` (`creator_id`),
  CONSTRAINT `FK_5ED2C2B61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_5ED2C2B796A8F92` FOREIGN KEY (`parent_category_id`) REFERENCES `dtb_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_category`
--

LOCK TABLES `dtb_category` WRITE;
/*!40000 ALTER TABLE `dtb_category` DISABLE KEYS */;
INSERT INTO `dtb_category` VALUES (7,NULL,1,'季節商品',1,2,'2020-03-17 03:07:26','2020-03-17 04:18:20','category'),(8,NULL,1,'定番商品',1,3,'2020-03-17 03:07:32','2020-03-17 04:18:20','category'),(9,NULL,1,'その他',1,1,'2020-03-17 04:17:21','2020-03-17 04:18:20','category');
/*!40000 ALTER TABLE `dtb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_class_category`
--

DROP TABLE IF EXISTS `dtb_class_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_class_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `backend_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` int(10) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9B0D1DBAB462FB2A` (`class_name_id`),
  KEY `IDX_9B0D1DBA61220EA6` (`creator_id`),
  CONSTRAINT `FK_9B0D1DBA61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_9B0D1DBAB462FB2A` FOREIGN KEY (`class_name_id`) REFERENCES `dtb_class_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_class_category`
--

LOCK TABLES `dtb_class_category` WRITE;
/*!40000 ALTER TABLE `dtb_class_category` DISABLE KEYS */;
INSERT INTO `dtb_class_category` VALUES (11,2,1,'樽 - 15L','樽 - 15L',1,1,'2020-03-17 03:05:58','2020-03-17 03:05:58','classcategory'),(12,2,1,'樽 - 10L','樽 - 10L',2,1,'2020-03-17 03:06:05','2020-03-17 03:06:05','classcategory');
/*!40000 ALTER TABLE `dtb_class_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_class_name`
--

DROP TABLE IF EXISTS `dtb_class_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_class_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `backend_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` int(10) unsigned NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_187C95AD61220EA6` (`creator_id`),
  CONSTRAINT `FK_187C95AD61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_class_name`
--

LOCK TABLES `dtb_class_name` WRITE;
/*!40000 ALTER TABLE `dtb_class_name` DISABLE KEYS */;
INSERT INTO `dtb_class_name` VALUES (2,1,'樽サイズ','樽サイズ',1,'2017-03-07 10:14:52','2020-03-17 03:06:46','classname');
/*!40000 ALTER TABLE `dtb_class_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_csv`
--

DROP TABLE IF EXISTS `dtb_csv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_csv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `csv_type_id` smallint(5) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `entity_name` varchar(255) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `reference_field_name` varchar(255) DEFAULT NULL,
  `disp_name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F55F48C3E8507796` (`csv_type_id`),
  KEY `IDX_F55F48C361220EA6` (`creator_id`),
  CONSTRAINT `FK_F55F48C361220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_F55F48C3E8507796` FOREIGN KEY (`csv_type_id`) REFERENCES `mtb_csv_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_csv`
--

LOCK TABLES `dtb_csv` WRITE;
/*!40000 ALTER TABLE `dtb_csv` DISABLE KEYS */;
INSERT INTO `dtb_csv` VALUES (1,1,NULL,'Eccube\\\\Entity\\\\Product','id',NULL,'商品ID',1,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(2,1,NULL,'Eccube\\\\Entity\\\\Product','Status','id','公開ステータス(ID)',2,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(3,1,NULL,'Eccube\\\\Entity\\\\Product','Status','name','公開ステータス(名称)',3,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(4,1,NULL,'Eccube\\\\Entity\\\\Product','name',NULL,'商品名',4,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(5,1,NULL,'Eccube\\\\Entity\\\\Product','note',NULL,'ショップ用メモ欄',5,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(6,1,NULL,'Eccube\\\\Entity\\\\Product','description_list',NULL,'商品説明(一覧)',6,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(7,1,NULL,'Eccube\\\\Entity\\\\Product','description_detail',NULL,'商品説明(詳細)',7,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(8,1,NULL,'Eccube\\\\Entity\\\\Product','search_word',NULL,'検索ワード',8,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(9,1,NULL,'Eccube\\\\Entity\\\\Product','free_area',NULL,'フリーエリア',9,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(10,1,NULL,'Eccube\\\\Entity\\\\ProductClass','id',NULL,'商品規格ID',10,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(11,1,NULL,'Eccube\\\\Entity\\\\ProductClass','SaleType','id','販売種別(ID)',11,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(12,1,NULL,'Eccube\\\\Entity\\\\ProductClass','SaleType','name','販売種別(名称)',12,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(13,1,NULL,'Eccube\\\\Entity\\\\ProductClass','ClassCategory1','id','規格分類1(ID)',13,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(14,1,NULL,'Eccube\\\\Entity\\\\ProductClass','ClassCategory1','name','規格分類1(名称)',14,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(15,1,NULL,'Eccube\\\\Entity\\\\ProductClass','ClassCategory2','id','規格分類2(ID)',15,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(16,1,NULL,'Eccube\\\\Entity\\\\ProductClass','ClassCategory2','name','規格分類2(名称)',16,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(17,1,NULL,'Eccube\\\\Entity\\\\ProductClass','DeliveryDuration','id','発送日目安(ID)',17,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(18,1,NULL,'Eccube\\\\Entity\\\\ProductClass','DeliveryDuration','name','発送日目安(名称)',18,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(19,1,NULL,'Eccube\\\\Entity\\\\ProductClass','code',NULL,'商品コード',19,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(20,1,NULL,'Eccube\\\\Entity\\\\ProductClass','stock',NULL,'在庫数',20,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(21,1,NULL,'Eccube\\\\Entity\\\\ProductClass','stock_unlimited',NULL,'在庫数無制限フラグ',21,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(22,1,NULL,'Eccube\\\\Entity\\\\ProductClass','sale_limit',NULL,'販売制限数',22,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(23,1,NULL,'Eccube\\\\Entity\\\\ProductClass','price01',NULL,'通常価格',23,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(24,1,NULL,'Eccube\\\\Entity\\\\ProductClass','price02',NULL,'販売価格',24,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(25,1,NULL,'Eccube\\\\Entity\\\\ProductClass','delivery_fee',NULL,'送料',25,0,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(26,1,NULL,'Eccube\\\\Entity\\\\Product','ProductImage','file_name','商品画像',26,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(27,1,NULL,'Eccube\\\\Entity\\\\Product','ProductCategories','category_id','商品カテゴリ(ID)',27,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(28,1,NULL,'Eccube\\\\Entity\\\\Product','ProductCategories','Category','商品カテゴリ(名称)',28,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(29,1,NULL,'Eccube\\\\Entity\\\\Product','ProductTag','tag_id','タグ(ID)',29,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(30,1,NULL,'Eccube\\\\Entity\\\\Product','ProductTag','Tag','タグ(名称)',30,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(31,2,NULL,'Eccube\\\\Entity\\\\Customer','id',NULL,'会員ID',1,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(32,2,NULL,'Eccube\\\\Entity\\\\Customer','name01',NULL,'お名前(姓)',2,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(33,2,NULL,'Eccube\\\\Entity\\\\Customer','name02',NULL,'お名前(名)',3,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(34,2,NULL,'Eccube\\\\Entity\\\\Customer','kana01',NULL,'お名前(セイ)',4,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(35,2,NULL,'Eccube\\\\Entity\\\\Customer','kana02',NULL,'お名前(メイ)',5,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(36,2,NULL,'Eccube\\\\Entity\\\\Customer','company_name',NULL,'会社名',6,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(37,2,NULL,'Eccube\\\\Entity\\\\Customer','postal_code',NULL,'郵便番号',7,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(38,2,NULL,'Eccube\\\\Entity\\\\Customer','Pref','id','都道府県(ID)',9,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(39,2,NULL,'Eccube\\\\Entity\\\\Customer','Pref','name','都道府県(名称)',10,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(40,2,NULL,'Eccube\\\\Entity\\\\Customer','addr01',NULL,'住所1',11,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(41,2,NULL,'Eccube\\\\Entity\\\\Customer','addr02',NULL,'住所2',12,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(42,2,NULL,'Eccube\\\\Entity\\\\Customer','email',NULL,'メールアドレス',13,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(43,2,NULL,'Eccube\\\\Entity\\\\Customer','phone_number',NULL,'TEL',14,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(44,2,NULL,'Eccube\\\\Entity\\\\Customer','Sex','id','性別(ID)',20,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(45,2,NULL,'Eccube\\\\Entity\\\\Customer','Sex','name','性別(名称)',21,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(46,2,NULL,'Eccube\\\\Entity\\\\Customer','Job','id','職業(ID)',22,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(47,2,NULL,'Eccube\\\\Entity\\\\Customer','Job','name','職業(名称)',23,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(48,2,NULL,'Eccube\\\\Entity\\\\Customer','birth',NULL,'誕生日',24,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(49,2,NULL,'Eccube\\\\Entity\\\\Customer','first_buy_date',NULL,'初回購入日',25,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(50,2,NULL,'Eccube\\\\Entity\\\\Customer','last_buy_date',NULL,'最終購入日',26,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(51,2,NULL,'Eccube\\\\Entity\\\\Customer','buy_times',NULL,'購入回数',27,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(52,2,NULL,'Eccube\\\\Entity\\\\Customer','note',NULL,'ショップ用メモ欄',28,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(53,2,NULL,'Eccube\\\\Entity\\\\Customer','Status','id','会員ステータス(ID)',29,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(54,2,NULL,'Eccube\\\\Entity\\\\Customer','Status','name','会員ステータス(名称)',30,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(55,2,NULL,'Eccube\\\\Entity\\\\Customer','create_date',NULL,'登録日',31,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(56,2,NULL,'Eccube\\\\Entity\\\\Customer','update_date',NULL,'更新日',32,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(57,3,NULL,'Eccube\\\\Entity\\\\Order','id',NULL,'注文ID',1,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(58,3,NULL,'Eccube\\\\Entity\\\\Order','order_no',NULL,'注文番号',2,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(59,3,NULL,'Eccube\\\\Entity\\\\Order','Customer','id','会員ID',3,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(60,3,NULL,'Eccube\\\\Entity\\\\Order','name01',NULL,'お名前(姓)',4,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(61,3,NULL,'Eccube\\\\Entity\\\\Order','name02',NULL,'お名前(名)',5,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(62,3,NULL,'Eccube\\\\Entity\\\\Order','kana01',NULL,'お名前(セイ)',6,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(63,3,NULL,'Eccube\\\\Entity\\\\Order','kana02',NULL,'お名前(メイ)',7,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(64,3,NULL,'Eccube\\\\Entity\\\\Order','company_name',NULL,'会社名',8,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(65,3,NULL,'Eccube\\\\Entity\\\\Order','postal_code',NULL,'郵便番号',9,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(66,3,NULL,'Eccube\\\\Entity\\\\Order','Pref','id','都道府県(ID)',10,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(67,3,NULL,'Eccube\\\\Entity\\\\Order','Pref','name','都道府県(名称)',11,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(68,3,NULL,'Eccube\\\\Entity\\\\Order','addr01',NULL,'住所1',12,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(69,3,NULL,'Eccube\\\\Entity\\\\Order','addr02',NULL,'住所2',13,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(70,3,NULL,'Eccube\\\\Entity\\\\Order','email',NULL,'メールアドレス',14,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(71,3,NULL,'Eccube\\\\Entity\\\\Order','phone_number',NULL,'TEL',15,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(72,3,NULL,'Eccube\\\\Entity\\\\Order','Sex','id','性別(ID)',16,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(73,3,NULL,'Eccube\\\\Entity\\\\Order','Sex','name','性別(名称)',17,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(74,3,NULL,'Eccube\\\\Entity\\\\Order','Job','id','職業(ID)',18,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(75,3,NULL,'Eccube\\\\Entity\\\\Order','Job','name','職業(名称)',19,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(76,3,NULL,'Eccube\\\\Entity\\\\Order','birth',NULL,'誕生日',20,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(77,3,NULL,'Eccube\\\\Entity\\\\Order','note',NULL,'ショップ用メモ欄',21,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(78,3,NULL,'Eccube\\\\Entity\\\\Order','subtotal',NULL,'小計',22,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(79,3,NULL,'Eccube\\\\Entity\\\\Order','discount',NULL,'値引き',23,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(80,3,NULL,'Eccube\\\\Entity\\\\Order','delivery_fee_total',NULL,'送料',24,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(81,3,NULL,'Eccube\\\\Entity\\\\Order','tax',NULL,'税金',25,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(82,3,NULL,'Eccube\\\\Entity\\\\Order','total',NULL,'合計',26,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(83,3,NULL,'Eccube\\\\Entity\\\\Order','payment_total',NULL,'支払合計',27,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(84,3,NULL,'Eccube\\\\Entity\\\\Order','OrderStatus','id','対応状況(ID)',28,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(85,3,NULL,'Eccube\\\\Entity\\\\Order','OrderStatus','name','対応状況(名称)',29,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(86,3,NULL,'Eccube\\\\Entity\\\\Order','Payment','id','支払方法(ID)',30,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(87,3,NULL,'Eccube\\\\Entity\\\\Order','payment_method',NULL,'支払方法(名称)',31,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(88,3,NULL,'Eccube\\\\Entity\\\\Order','order_date',NULL,'受注日',32,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(89,3,NULL,'Eccube\\\\Entity\\\\Order','payment_date',NULL,'入金日',33,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(90,3,NULL,'Eccube\\\\Entity\\\\OrderItem','id',NULL,'注文詳細ID',34,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(91,3,NULL,'Eccube\\\\Entity\\\\OrderItem','Product','id','商品ID',35,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(92,3,NULL,'Eccube\\\\Entity\\\\OrderItem','ProductClass','id','商品規格ID',36,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(93,3,NULL,'Eccube\\\\Entity\\\\OrderItem','product_name',NULL,'商品名',37,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(94,3,NULL,'Eccube\\\\Entity\\\\OrderItem','product_code',NULL,'商品コード',38,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(95,3,NULL,'Eccube\\\\Entity\\\\OrderItem','class_name1',NULL,'規格名1',39,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(96,3,NULL,'Eccube\\\\Entity\\\\OrderItem','class_name2',NULL,'規格名2',40,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(97,3,NULL,'Eccube\\\\Entity\\\\OrderItem','class_category_name1',NULL,'規格分類名1',41,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(98,3,NULL,'Eccube\\\\Entity\\\\OrderItem','class_category_name2',NULL,'規格分類名2',42,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(99,3,NULL,'Eccube\\\\Entity\\\\OrderItem','price',NULL,'価格',43,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(100,3,NULL,'Eccube\\\\Entity\\\\OrderItem','quantity',NULL,'個数',44,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(101,3,NULL,'Eccube\\\\Entity\\\\OrderItem','tax_rate',NULL,'税率',45,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(102,3,NULL,'Eccube\\\\Entity\\\\OrderItem','tax_rule',NULL,'税率ルール(ID)',46,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(103,3,NULL,'Eccube\\\\Entity\\\\OrderItem','OrderItemType','id','明細区分(ID)',47,1,'2018-07-23 09:00:00','2018-07-23 09:00:00','csv'),(104,3,NULL,'Eccube\\\\Entity\\\\OrderItem','OrderItemType','name','明細区分(名称)',48,1,'2018-07-23 09:00:00','2018-07-23 09:00:00','csv'),(105,3,NULL,'Eccube\\\\Entity\\\\Shipping','id',NULL,'出荷ID',49,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(106,3,NULL,'Eccube\\\\Entity\\\\Shipping','name01',NULL,'配送先_お名前(姓)',50,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(107,3,NULL,'Eccube\\\\Entity\\\\Shipping','name02',NULL,'配送先_お名前(名)',51,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(108,3,NULL,'Eccube\\\\Entity\\\\Shipping','kana01',NULL,'配送先_お名前(セイ)',52,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(109,3,NULL,'Eccube\\\\Entity\\\\Shipping','kana02',NULL,'配送先_お名前(メイ)',53,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(110,3,NULL,'Eccube\\\\Entity\\\\Shipping','company_name',NULL,'配送先_会社名',54,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(111,3,NULL,'Eccube\\\\Entity\\\\Shipping','postal_code',NULL,'配送先_郵便番号',55,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(112,3,NULL,'Eccube\\\\Entity\\\\Shipping','Pref','id','配送先_都道府県(ID)',56,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(113,3,NULL,'Eccube\\\\Entity\\\\Shipping','Pref','name','配送先_都道府県(名称)',57,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(114,3,NULL,'Eccube\\\\Entity\\\\Shipping','addr01',NULL,'配送先_住所1',58,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(115,3,NULL,'Eccube\\\\Entity\\\\Shipping','addr02',NULL,'配送先_住所2',59,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(116,3,NULL,'Eccube\\\\Entity\\\\Shipping','phone_number',NULL,'配送先_TEL',60,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(117,3,NULL,'Eccube\\\\Entity\\\\Shipping','Delivery','id','配送業者(ID)',61,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(118,3,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_name',NULL,'配送業者(名称)',62,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(119,3,NULL,'Eccube\\\\Entity\\\\Shipping','DeliveryTime','id','お届け時間ID',63,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(120,3,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_time',NULL,'お届け時間(名称)',64,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(121,3,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_date',NULL,'お届け希望日',65,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(122,3,NULL,'Eccube\\\\Entity\\\\Shipping','DeliveryFee','id','送料ID',66,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(123,3,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_fee',NULL,'送料',67,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(124,3,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_date',NULL,'発送日',68,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(125,3,NULL,'Eccube\\\\Entity\\\\Shipping','tracking_number',NULL,'出荷伝票番号',69,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(126,3,NULL,'Eccube\\\\Entity\\\\Shipping','note',NULL,'配達用メモ',70,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(127,3,NULL,'Eccube\\\\Entity\\\\Shipping','mail_send_date',NULL,'出荷メール送信日',71,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(128,4,NULL,'Eccube\\\\Entity\\\\Order','id',NULL,'注文ID',1,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(129,4,NULL,'Eccube\\\\Entity\\\\Order','order_no',NULL,'注文番号',2,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(130,4,NULL,'Eccube\\\\Entity\\\\Order','Customer','id','会員ID',3,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(131,4,NULL,'Eccube\\\\Entity\\\\Order','name01',NULL,'お名前(姓)',4,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(132,4,NULL,'Eccube\\\\Entity\\\\Order','name02',NULL,'お名前(名)',5,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(133,4,NULL,'Eccube\\\\Entity\\\\Order','kana01',NULL,'お名前(セイ)',6,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(134,4,NULL,'Eccube\\\\Entity\\\\Order','kana02',NULL,'お名前(メイ)',7,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(135,4,NULL,'Eccube\\\\Entity\\\\Order','company_name',NULL,'会社名',8,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(136,4,NULL,'Eccube\\\\Entity\\\\Order','postal_code',NULL,'郵便番号',9,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(137,4,NULL,'Eccube\\\\Entity\\\\Order','Pref','id','都道府県(ID)',10,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(138,4,NULL,'Eccube\\\\Entity\\\\Order','Pref','name','都道府県(名称)',11,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(139,4,NULL,'Eccube\\\\Entity\\\\Order','addr01',NULL,'住所1',12,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(140,4,NULL,'Eccube\\\\Entity\\\\Order','addr02',NULL,'住所2',13,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(141,4,NULL,'Eccube\\\\Entity\\\\Order','email',NULL,'メールアドレス',14,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(142,4,NULL,'Eccube\\\\Entity\\\\Order','phone_number',NULL,'TEL',15,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(143,4,NULL,'Eccube\\\\Entity\\\\Order','Sex','id','性別(ID)',16,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(144,4,NULL,'Eccube\\\\Entity\\\\Order','Sex','name','性別(名称)',17,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(145,4,NULL,'Eccube\\\\Entity\\\\Order','Job','id','職業(ID)',18,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(146,4,NULL,'Eccube\\\\Entity\\\\Order','Job','name','職業(名称)',19,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(147,4,NULL,'Eccube\\\\Entity\\\\Order','birth',NULL,'誕生日',20,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(148,4,NULL,'Eccube\\\\Entity\\\\Order','note',NULL,'ショップ用メモ欄',21,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(149,4,NULL,'Eccube\\\\Entity\\\\Order','subtotal',NULL,'小計',22,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(150,4,NULL,'Eccube\\\\Entity\\\\Order','discount',NULL,'値引き',23,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(151,4,NULL,'Eccube\\\\Entity\\\\Order','delivery_fee_total',NULL,'送料',24,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(152,4,NULL,'Eccube\\\\Entity\\\\Order','tax',NULL,'税金',25,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(153,4,NULL,'Eccube\\\\Entity\\\\Order','total',NULL,'合計',26,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(154,4,NULL,'Eccube\\\\Entity\\\\Order','payment_total',NULL,'支払合計',27,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(155,4,NULL,'Eccube\\\\Entity\\\\Order','OrderStatus','id','対応状況(ID)',28,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(156,4,NULL,'Eccube\\\\Entity\\\\Order','OrderStatus','name','対応状況(名称)',29,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(157,4,NULL,'Eccube\\\\Entity\\\\Order','Payment','id','支払方法(ID)',30,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(158,4,NULL,'Eccube\\\\Entity\\\\Order','payment_method',NULL,'支払方法(名称)',31,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(159,4,NULL,'Eccube\\\\Entity\\\\Order','order_date',NULL,'受注日',32,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(160,4,NULL,'Eccube\\\\Entity\\\\Order','payment_date',NULL,'入金日',33,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(161,4,NULL,'Eccube\\\\Entity\\\\OrderItem','id',NULL,'注文詳細ID',34,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(162,4,NULL,'Eccube\\\\Entity\\\\OrderItem','Product','id','商品ID',35,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(163,4,NULL,'Eccube\\\\Entity\\\\OrderItem','ProductClass','id','商品規格ID',36,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(164,4,NULL,'Eccube\\\\Entity\\\\OrderItem','product_name',NULL,'商品名',37,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(165,4,NULL,'Eccube\\\\Entity\\\\OrderItem','product_code',NULL,'商品コード',38,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(166,4,NULL,'Eccube\\\\Entity\\\\OrderItem','class_name1',NULL,'規格名1',39,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(167,4,NULL,'Eccube\\\\Entity\\\\OrderItem','class_name2',NULL,'規格名2',40,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(168,4,NULL,'Eccube\\\\Entity\\\\OrderItem','class_category_name1',NULL,'規格分類名1',41,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(169,4,NULL,'Eccube\\\\Entity\\\\OrderItem','class_category_name2',NULL,'規格分類名2',42,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(170,4,NULL,'Eccube\\\\Entity\\\\OrderItem','price',NULL,'価格',43,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(171,4,NULL,'Eccube\\\\Entity\\\\OrderItem','quantity',NULL,'個数',44,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(172,4,NULL,'Eccube\\\\Entity\\\\OrderItem','tax_rate',NULL,'税率',45,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(173,4,NULL,'Eccube\\\\Entity\\\\OrderItem','tax_rule',NULL,'税率ルール(ID)',46,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(174,4,NULL,'Eccube\\\\Entity\\\\OrderItem','OrderItemType','id','明細区分(ID)',47,1,'2018-07-23 09:00:00','2018-07-23 09:00:00','csv'),(175,4,NULL,'Eccube\\\\Entity\\\\OrderItem','OrderItemType','name','明細区分(名称)',48,1,'2018-07-23 09:00:00','2018-07-23 09:00:00','csv'),(176,4,NULL,'Eccube\\\\Entity\\\\Shipping','id',NULL,'出荷ID',49,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(177,4,NULL,'Eccube\\\\Entity\\\\Shipping','name01',NULL,'配送先_お名前(姓)',50,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(178,4,NULL,'Eccube\\\\Entity\\\\Shipping','name02',NULL,'配送先_お名前(名)',51,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(179,4,NULL,'Eccube\\\\Entity\\\\Shipping','kana01',NULL,'配送先_お名前(セイ)',52,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(180,4,NULL,'Eccube\\\\Entity\\\\Shipping','kana02',NULL,'配送先_お名前(メイ)',53,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(181,4,NULL,'Eccube\\\\Entity\\\\Shipping','company_name',NULL,'配送先_会社名',54,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(182,4,NULL,'Eccube\\\\Entity\\\\Shipping','postal_code',NULL,'配送先_郵便番号',55,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(183,4,NULL,'Eccube\\\\Entity\\\\Shipping','Pref','id','配送先_都道府県(ID)',56,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(184,4,NULL,'Eccube\\\\Entity\\\\Shipping','Pref','name','配送先_都道府県(名称)',57,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(185,4,NULL,'Eccube\\\\Entity\\\\Shipping','addr01',NULL,'配送先_住所1',58,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(186,4,NULL,'Eccube\\\\Entity\\\\Shipping','addr02',NULL,'配送先_住所2',59,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(187,4,NULL,'Eccube\\\\Entity\\\\Shipping','phone_number',NULL,'配送先_TEL',60,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(188,4,NULL,'Eccube\\\\Entity\\\\Shipping','Delivery','id','配送業者(ID)',61,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(189,4,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_name',NULL,'配送業者(名称)',62,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(190,4,NULL,'Eccube\\\\Entity\\\\Shipping','DeliveryTime','id','お届け時間ID',63,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(191,4,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_time',NULL,'お届け時間(名称)',64,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(192,4,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_date',NULL,'お届け希望日',65,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(193,4,NULL,'Eccube\\\\Entity\\\\Shipping','DeliveryFee','id','送料ID',66,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(194,4,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_delivery_fee',NULL,'送料',67,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(195,4,NULL,'Eccube\\\\Entity\\\\Shipping','shipping_date',NULL,'発送日',68,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(196,4,NULL,'Eccube\\\\Entity\\\\Shipping','tracking_number',NULL,'出荷伝票番号',69,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(197,4,NULL,'Eccube\\\\Entity\\\\Shipping','note',NULL,'配達用メモ',70,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(198,4,NULL,'Eccube\\\\Entity\\\\Shipping','mail_send_date',NULL,'出荷メール送信日',71,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(199,5,NULL,'Eccube\\\\Entity\\\\Category','id',NULL,'カテゴリID',1,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(200,5,NULL,'Eccube\\\\Entity\\\\Category','sort_no',NULL,'表示ランク',2,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(201,5,NULL,'Eccube\\\\Entity\\\\Category','name',NULL,'カテゴリ名',3,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(202,5,NULL,'Eccube\\\\Entity\\\\Category','Parent','id','親カテゴリID',4,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(203,5,NULL,'Eccube\\\\Entity\\\\Category','level',NULL,'階層',5,1,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv'),(204,1,NULL,'Eccube\\\\Entity\\\\ProductClass','TaxRule','tax_rate','税率',31,0,'2017-03-07 10:14:00','2017-03-07 10:14:00','csv');
/*!40000 ALTER TABLE `dtb_csv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer`
--

DROP TABLE IF EXISTS `dtb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_status_id` smallint(5) unsigned DEFAULT NULL,
  `sex_id` smallint(5) unsigned DEFAULT NULL,
  `job_id` smallint(5) unsigned DEFAULT NULL,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `name01` varchar(255) NOT NULL,
  `name02` varchar(255) NOT NULL,
  `kana01` varchar(255) DEFAULT NULL,
  `kana02` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `addr01` varchar(255) DEFAULT NULL,
  `addr02` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `birth` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) NOT NULL,
  `first_buy_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `last_buy_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `buy_times` decimal(10,0) unsigned DEFAULT '0',
  `buy_total` decimal(12,2) unsigned DEFAULT '0.00',
  `note` varchar(4000) DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expire` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `point` decimal(12,0) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `secret_key` (`secret_key`),
  KEY `IDX_8298BBE3C00AF8A7` (`customer_status_id`),
  KEY `IDX_8298BBE35A2DB2A0` (`sex_id`),
  KEY `IDX_8298BBE3BE04EA9` (`job_id`),
  KEY `IDX_8298BBE3F92F3E70` (`country_id`),
  KEY `IDX_8298BBE3E171EF5F` (`pref_id`),
  KEY `dtb_customer_buy_times_idx` (`buy_times`),
  KEY `dtb_customer_buy_total_idx` (`buy_total`),
  KEY `dtb_customer_create_date_idx` (`create_date`),
  KEY `dtb_customer_update_date_idx` (`update_date`),
  KEY `dtb_customer_last_buy_date_idx` (`last_buy_date`),
  KEY `dtb_customer_email_idx` (`email`),
  CONSTRAINT `FK_8298BBE35A2DB2A0` FOREIGN KEY (`sex_id`) REFERENCES `mtb_sex` (`id`),
  CONSTRAINT `FK_8298BBE3BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `mtb_job` (`id`),
  CONSTRAINT `FK_8298BBE3C00AF8A7` FOREIGN KEY (`customer_status_id`) REFERENCES `mtb_customer_status` (`id`),
  CONSTRAINT `FK_8298BBE3E171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_8298BBE3F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer`
--

LOCK TABLES `dtb_customer` WRITE;
/*!40000 ALTER TABLE `dtb_customer` DISABLE KEYS */;
INSERT INTO `dtb_customer` VALUES (1,2,NULL,NULL,NULL,13,'田野','誠','タノ','マコト','バー蒲田クラフト','1440035','大田区南蒲田','BBJビル１階','tano+demo@bestbeerjapan.com','08012345678',NULL,'de483a94bbad4a9d2e5cfbac8fc7a149806fc04e3063160f845eacf1ef65db9b','31f0e8615c','viKzKQJzF0G5ZhFJjRVlydrlpSKNBzLp','2020-03-17 04:49:06','2020-03-17 04:49:06',1,59660.00,NULL,'xgGkSreC3wkhIfRaEtppUqs7nqOspTRB','2020-03-17 05:44:07',0,'2020-03-17 04:46:40','2020-03-17 05:34:07','customer');
/*!40000 ALTER TABLE `dtb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer_address`
--

DROP TABLE IF EXISTS `dtb_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_customer_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `name01` varchar(255) NOT NULL,
  `name02` varchar(255) NOT NULL,
  `kana01` varchar(255) DEFAULT NULL,
  `kana02` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `addr01` varchar(255) DEFAULT NULL,
  `addr02` varchar(255) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C38C0F89395C3F3` (`customer_id`),
  KEY `IDX_6C38C0F8F92F3E70` (`country_id`),
  KEY `IDX_6C38C0F8E171EF5F` (`pref_id`),
  CONSTRAINT `FK_6C38C0F89395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `dtb_customer` (`id`),
  CONSTRAINT `FK_6C38C0F8E171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_6C38C0F8F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer_address`
--

LOCK TABLES `dtb_customer_address` WRITE;
/*!40000 ALTER TABLE `dtb_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer_favorite_product`
--

DROP TABLE IF EXISTS `dtb_customer_favorite_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_customer_favorite_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ED6313839395C3F3` (`customer_id`),
  KEY `IDX_ED6313834584665A` (`product_id`),
  CONSTRAINT `FK_ED6313834584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_ED6313839395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `dtb_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer_favorite_product`
--

LOCK TABLES `dtb_customer_favorite_product` WRITE;
/*!40000 ALTER TABLE `dtb_customer_favorite_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_customer_favorite_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivery`
--

DROP TABLE IF EXISTS `dtb_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `sale_type_id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `confirm_url` varchar(4000) DEFAULT NULL,
  `sort_no` int(10) unsigned DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3420D9FA61220EA6` (`creator_id`),
  KEY `IDX_3420D9FAB0524E01` (`sale_type_id`),
  CONSTRAINT `FK_3420D9FA61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_3420D9FAB0524E01` FOREIGN KEY (`sale_type_id`) REFERENCES `mtb_sale_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivery`
--

LOCK TABLES `dtb_delivery` WRITE;
/*!40000 ALTER TABLE `dtb_delivery` DISABLE KEYS */;
INSERT INTO `dtb_delivery` VALUES (1,1,1,'サンプル業者','サンプル業者',NULL,NULL,1,0,'2017-03-07 10:14:52','2020-03-17 03:14:19','delivery'),(2,1,2,'サンプル宅配','サンプル宅配',NULL,NULL,2,0,'2017-03-07 10:14:52','2020-03-17 03:14:18','delivery'),(3,1,1,'クール便','クール便',NULL,NULL,3,1,'2020-03-17 03:14:11','2020-03-17 03:14:11','delivery');
/*!40000 ALTER TABLE `dtb_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivery_duration`
--

DROP TABLE IF EXISTS `dtb_delivery_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_delivery_duration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `duration` smallint(6) NOT NULL DEFAULT '0',
  `sort_no` int(10) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivery_duration`
--

LOCK TABLES `dtb_delivery_duration` WRITE;
/*!40000 ALTER TABLE `dtb_delivery_duration` DISABLE KEYS */;
INSERT INTO `dtb_delivery_duration` VALUES (1,'即日',0,0,'deliveryduration'),(2,'1～2日後',1,1,'deliveryduration'),(3,'3～4日後',3,2,'deliveryduration'),(4,'1週間以降',7,3,'deliveryduration'),(5,'2週間以降',14,4,'deliveryduration'),(6,'3週間以降',21,5,'deliveryduration'),(7,'1ヶ月以降',30,6,'deliveryduration'),(8,'2ヶ月以降',60,7,'deliveryduration'),(9,'お取り寄せ(商品入荷後)',-1,8,'deliveryduration');
/*!40000 ALTER TABLE `dtb_delivery_duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivery_fee`
--

DROP TABLE IF EXISTS `dtb_delivery_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_delivery_fee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` int(10) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `fee` decimal(12,2) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_491552412136921` (`delivery_id`),
  KEY `IDX_4915524E171EF5F` (`pref_id`),
  CONSTRAINT `FK_491552412136921` FOREIGN KEY (`delivery_id`) REFERENCES `dtb_delivery` (`id`),
  CONSTRAINT `FK_4915524E171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivery_fee`
--

LOCK TABLES `dtb_delivery_fee` WRITE;
/*!40000 ALTER TABLE `dtb_delivery_fee` DISABLE KEYS */;
INSERT INTO `dtb_delivery_fee` VALUES (1,1,1,1000.00,'deliveryfee'),(2,1,2,1000.00,'deliveryfee'),(3,1,3,1000.00,'deliveryfee'),(4,1,4,1000.00,'deliveryfee'),(5,1,5,1000.00,'deliveryfee'),(6,1,6,1000.00,'deliveryfee'),(7,1,7,1000.00,'deliveryfee'),(8,1,8,1000.00,'deliveryfee'),(9,1,9,1000.00,'deliveryfee'),(10,1,10,1000.00,'deliveryfee'),(11,1,11,1000.00,'deliveryfee'),(12,1,12,1000.00,'deliveryfee'),(13,1,13,1000.00,'deliveryfee'),(14,1,14,1000.00,'deliveryfee'),(15,1,15,1000.00,'deliveryfee'),(16,1,16,1000.00,'deliveryfee'),(17,1,17,1000.00,'deliveryfee'),(18,1,18,1000.00,'deliveryfee'),(19,1,19,1000.00,'deliveryfee'),(20,1,20,1000.00,'deliveryfee'),(21,1,21,1000.00,'deliveryfee'),(22,1,22,1000.00,'deliveryfee'),(23,1,23,1000.00,'deliveryfee'),(24,1,24,1000.00,'deliveryfee'),(25,1,25,1000.00,'deliveryfee'),(26,1,26,1000.00,'deliveryfee'),(27,1,27,1000.00,'deliveryfee'),(28,1,28,1000.00,'deliveryfee'),(29,1,29,1000.00,'deliveryfee'),(30,1,30,1000.00,'deliveryfee'),(31,1,31,1000.00,'deliveryfee'),(32,1,32,1000.00,'deliveryfee'),(33,1,33,1000.00,'deliveryfee'),(34,1,34,1000.00,'deliveryfee'),(35,1,35,1000.00,'deliveryfee'),(36,1,36,1000.00,'deliveryfee'),(37,1,37,1000.00,'deliveryfee'),(38,1,38,1000.00,'deliveryfee'),(39,1,39,1000.00,'deliveryfee'),(40,1,40,1000.00,'deliveryfee'),(41,1,41,1000.00,'deliveryfee'),(42,1,42,1000.00,'deliveryfee'),(43,1,43,1000.00,'deliveryfee'),(44,1,44,1000.00,'deliveryfee'),(45,1,45,1000.00,'deliveryfee'),(46,1,46,1000.00,'deliveryfee'),(47,1,47,1000.00,'deliveryfee'),(48,2,1,0.00,'deliveryfee'),(49,2,2,0.00,'deliveryfee'),(50,2,3,0.00,'deliveryfee'),(51,2,4,0.00,'deliveryfee'),(52,2,5,0.00,'deliveryfee'),(53,2,6,0.00,'deliveryfee'),(54,2,7,0.00,'deliveryfee'),(55,2,8,0.00,'deliveryfee'),(56,2,9,0.00,'deliveryfee'),(57,2,10,0.00,'deliveryfee'),(58,2,11,0.00,'deliveryfee'),(59,2,12,0.00,'deliveryfee'),(60,2,13,0.00,'deliveryfee'),(61,2,14,0.00,'deliveryfee'),(62,2,15,0.00,'deliveryfee'),(63,2,16,0.00,'deliveryfee'),(64,2,17,0.00,'deliveryfee'),(65,2,18,0.00,'deliveryfee'),(66,2,19,0.00,'deliveryfee'),(67,2,20,0.00,'deliveryfee'),(68,2,21,0.00,'deliveryfee'),(69,2,22,0.00,'deliveryfee'),(70,2,23,0.00,'deliveryfee'),(71,2,24,0.00,'deliveryfee'),(72,2,25,0.00,'deliveryfee'),(73,2,26,0.00,'deliveryfee'),(74,2,27,0.00,'deliveryfee'),(75,2,28,0.00,'deliveryfee'),(76,2,29,0.00,'deliveryfee'),(77,2,30,0.00,'deliveryfee'),(78,2,31,0.00,'deliveryfee'),(79,2,32,0.00,'deliveryfee'),(80,2,33,0.00,'deliveryfee'),(81,2,34,0.00,'deliveryfee'),(82,2,35,0.00,'deliveryfee'),(83,2,36,0.00,'deliveryfee'),(84,2,37,0.00,'deliveryfee'),(85,2,38,0.00,'deliveryfee'),(86,2,39,0.00,'deliveryfee'),(87,2,40,0.00,'deliveryfee'),(88,2,41,0.00,'deliveryfee'),(89,2,42,0.00,'deliveryfee'),(90,2,43,0.00,'deliveryfee'),(91,2,44,0.00,'deliveryfee'),(92,2,45,0.00,'deliveryfee'),(93,2,46,0.00,'deliveryfee'),(94,2,47,0.00,'deliveryfee'),(95,3,1,2270.00,'deliveryfee'),(96,3,2,1910.00,'deliveryfee'),(97,3,3,1910.00,'deliveryfee'),(98,3,4,1910.00,'deliveryfee'),(99,3,5,1910.00,'deliveryfee'),(100,3,6,1910.00,'deliveryfee'),(101,3,7,1910.00,'deliveryfee'),(102,3,8,1910.00,'deliveryfee'),(103,3,9,1910.00,'deliveryfee'),(104,3,10,1910.00,'deliveryfee'),(105,3,11,1910.00,'deliveryfee'),(106,3,12,1910.00,'deliveryfee'),(107,3,13,1910.00,'deliveryfee'),(108,3,14,1910.00,'deliveryfee'),(109,3,15,1910.00,'deliveryfee'),(110,3,16,1910.00,'deliveryfee'),(111,3,17,1910.00,'deliveryfee'),(112,3,18,1910.00,'deliveryfee'),(113,3,19,1910.00,'deliveryfee'),(114,3,20,1910.00,'deliveryfee'),(115,3,21,1910.00,'deliveryfee'),(116,3,22,1910.00,'deliveryfee'),(117,3,23,1910.00,'deliveryfee'),(118,3,24,1990.00,'deliveryfee'),(119,3,25,1990.00,'deliveryfee'),(120,3,26,1990.00,'deliveryfee'),(121,3,27,1990.00,'deliveryfee'),(122,3,28,1990.00,'deliveryfee'),(123,3,29,1990.00,'deliveryfee'),(124,3,30,1990.00,'deliveryfee'),(125,3,31,2090.00,'deliveryfee'),(126,3,32,2090.00,'deliveryfee'),(127,3,33,2090.00,'deliveryfee'),(128,3,34,2090.00,'deliveryfee'),(129,3,35,2090.00,'deliveryfee'),(130,3,36,2090.00,'deliveryfee'),(131,3,37,2090.00,'deliveryfee'),(132,3,38,2090.00,'deliveryfee'),(133,3,39,2090.00,'deliveryfee'),(134,3,40,2270.00,'deliveryfee'),(135,3,41,2270.00,'deliveryfee'),(136,3,42,2270.00,'deliveryfee'),(137,3,43,2270.00,'deliveryfee'),(138,3,44,2270.00,'deliveryfee'),(139,3,45,2270.00,'deliveryfee'),(140,3,46,2270.00,'deliveryfee'),(141,3,47,2270.00,'deliveryfee');
/*!40000 ALTER TABLE `dtb_delivery_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivery_time`
--

DROP TABLE IF EXISTS `dtb_delivery_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_delivery_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` int(10) unsigned DEFAULT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E80EE3A612136921` (`delivery_id`),
  CONSTRAINT `FK_E80EE3A612136921` FOREIGN KEY (`delivery_id`) REFERENCES `dtb_delivery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivery_time`
--

LOCK TABLES `dtb_delivery_time` WRITE;
/*!40000 ALTER TABLE `dtb_delivery_time` DISABLE KEYS */;
INSERT INTO `dtb_delivery_time` VALUES (1,1,'午前',1,1,'2017-03-07 10:14:52','2017-03-07 10:14:52','deliverytime'),(2,1,'午後',2,1,'2017-03-07 10:14:52','2017-03-07 10:14:52','deliverytime');
/*!40000 ALTER TABLE `dtb_delivery_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_layout`
--

DROP TABLE IF EXISTS `dtb_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_type_id` smallint(5) unsigned DEFAULT NULL,
  `layout_name` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A62AA7C4FFA550E` (`device_type_id`),
  CONSTRAINT `FK_5A62AA7C4FFA550E` FOREIGN KEY (`device_type_id`) REFERENCES `mtb_device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_layout`
--

LOCK TABLES `dtb_layout` WRITE;
/*!40000 ALTER TABLE `dtb_layout` DISABLE KEYS */;
INSERT INTO `dtb_layout` VALUES (0,10,'トップページ用レイアウト','2017-03-07 10:14:52','2020-03-17 03:43:18','layout'),(1,10,'トップページ用レイアウト','2017-03-07 10:14:52','2017-03-07 10:14:52','layout'),(2,10,'下層ページ用レイアウト','2017-03-07 10:14:52','2017-03-07 10:14:52','layout');
/*!40000 ALTER TABLE `dtb_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mail_history`
--

DROP TABLE IF EXISTS `dtb_mail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_mail_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `send_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `mail_subject` varchar(255) DEFAULT NULL,
  `mail_body` longtext,
  `mail_html_body` longtext,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4870AB118D9F6D38` (`order_id`),
  KEY `IDX_4870AB1161220EA6` (`creator_id`),
  CONSTRAINT `FK_4870AB1161220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_4870AB118D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `dtb_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mail_history`
--

LOCK TABLES `dtb_mail_history` WRITE;
/*!40000 ALTER TABLE `dtb_mail_history` DISABLE KEYS */;
INSERT INTO `dtb_mail_history` VALUES (1,1,NULL,'2020-03-17 04:49:06','[Best Beer Japan Brewery Inc.] ご注文ありがとうございます','田野 誠 様\n\nこの度はご注文いただき誠にありがとうございます。下記ご注文内容にお間違えがないかご確認下さい。\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文日時：2020/03/17 13:49:06\nご注文番号：1\nお支払い合計：￥59,660\nお支払い方法：請求書払\nご利用ポイント：0 pt\n加算ポイント：525 pt\nお問い合わせ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード：PZ-20201201-15L\n商品名：Plazma Pale Ale  樽 - 15L   \n単価：￥19,250\n数量：3\n\n-------------------------------------------------\n小　計：￥57,750\n手数料：￥0\n送　料：￥1,910\n-------------------------------------------------\n合　計：￥59,660\n        (10 %対象：￥59,660)\n    ============================================\nお支払い合計：￥59,660\n\n************************************************\n　ご注文者情報\n************************************************\nお名前：田野 誠 様\nお名前(カナ)：タノ マコト 様\n会社名：バー蒲田クラフト\n郵便番号：〒1440035\n住所：東京都大田区南蒲田BBJビル１階\n電話番号：08012345678\nメールアドレス：tano+demo@bestbeerjapan.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前：田野 誠 様\nお名前(カナ)：タノ マコト 様\n会社名：バー蒲田クラフト\n郵便番号：〒1440035\n住所：東京都大田区南蒲田BBJビル１階\n電話番号：08012345678\n\n配送方法：クール便\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード：PZ-20201201-15L\n商品名：Plazma Pale Ale  樽 - 15L  \n数量：3\n\n\n\n============================================\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n','<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n\n<body bgcolor=\"#F0F0F0\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;\">\n<br>\n<br>\n<div align=\"center\"><a href=\"http://localhost:8080/\" style=\"font-family:Helvetica, Arial, sans-serif;font-size:30px;color:#333333;text-decoration:none;\">Best Beer Japan Brewery Inc.</a></div>\n<!-- 100% background wrapper (grey background) -->\n<table border=\"0\" width=\"100%\" height=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#F0F0F0\" style=\"border-spacing:0;mso-table-lspace:0pt;mso-table-rspace:0pt;\">\n    <tr>\n        <td align=\"center\" valign=\"top\" bgcolor=\"#F0F0F0\" style=\"background-color:#F0F0F0;border-collapse:collapse;\">\n            <br>\n            <!-- 600px container (white background) -->\n            <table id=\"html-mail-table1\" border=\"0\" width=\"600px\" cellpadding=\"10\" cellspacing=\"0\" class=\"container\" style=\"border-spacing:0;mso-table-lspace:0pt;mso-table-rspace:0pt;\">\n                <tr>\n                    <td class=\"container-padding content\" align=\"left\" style=\"border-collapse:collapse;padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff;\">\n                        <br>\n                        <div class=\"title\" style=\"font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#333333;\">この度はご注文いただき誠にありがとうございます。</div>\n                        <br>\n                        <div class=\"body-text\" style=\"font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#333333;\">\n                            田野 誠 様<br/>\n                            <br/>\n                            下記ご注文内容にお間違えがないかご確認下さい。<br/>\n                            <br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            　ご請求金額<br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            ご注文日時：2020/03/17 13:49:06<br/>\n                            ご注文番号：1<br/>\n                            お支払い合計：￥59,660<br/>\n                            お支払い方法：請求書払<br/>\n                                                        ご利用ポイント：0 pt<br/>\n                            加算ポイント：525 pt<br/>\n                                                        お問い合わせ：<br/>\n                            <br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            　ご注文商品明細<br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                                                                                        商品コード：PZ-20201201-15L<br/>\n                                商品名：Plazma Pale Ale  樽 - 15L  <br/>\n                                単価：￥19,250<br/>\n                                数量：3<br/>\n                                <br/>\n                                                                                    <hr style=\"border-top: 2px dashed #8c8b8b;\">\n                            小　計：￥57,750<br/>\n                            手数料：￥0<br/>\n                            送　料：￥1,910<br/>\n                                                        <hr style=\"border-top: 1px dotted #8c8b8b;\">\n                            合　計：￥59,660<br/>\n                                                            (10 %対象：￥59,660)<br/>\n                                                                                    <hr style=\"border-top: 1px dotted #8c8b8b;\">\n                            お支払い合計：￥59,660\n                            <br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            ご注文者情報<br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            お名前：田野 誠 様<br/>\n                            お名前(カナ)：タノ マコト 様<br/>\n                                                            会社名：バー蒲田クラフト<br/>\n                                                        郵便番号：〒1440035<br/>\n                            住所：東京都大田区南蒲田BBJビル１階<br/>\n                            電話番号：08012345678<br/>\n                            メールアドレス：tano+demo@bestbeerjapan.com<br/>\n                            <br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n                            　配送情報<br/>\n                            <hr style=\"border-top: 3px double #8c8b8b;\">\n\n                                                            ◎お届け先<br/>\n                                <br/>\n                                お名前：田野 誠 様<br/>\n                                お名前(カナ)：タノ マコト 様<br/>\n                                                                    会社名：バー蒲田クラフト<br/>\n                                                                郵便番号：〒1440035<br/>\n                                住所：東京都大田区南蒲田BBJビル１階<br/>\n                                電話番号：08012345678<br/>\n                                <br/>\n                                配送方法：クール便<br/>\n                                お届け日：指定なし<br/>\n                                お届け時間：指定なし<br/>\n                                <br/>\n                                                                    商品コード：PZ-20201201-15L<br/>\n                                    商品名：Plazma Pale Ale  樽 - 15L  <br/>\n                                    数量：3<br/>\n                                    <br/>\n                                                                                                                    <hr style=\"border-top: 2px dotted #8c8b8b;\">\n                            このメッセージはお客様へのお知らせ専用ですので、<br/>\n                            このメッセージへの返信としてご質問をお送りいただいても回答できません。<br/>\n                            ご了承ください。<br/>\n                        </div>\n                    </td>\n                </tr>\n            </table>\n            <!--/600px container -->\n            <br>\n            <br>\n            <table id=\"html-mail-table2\" border=\"0\" width=\"600px\" cellpadding=\"10\" cellspacing=\"0\" class=\"container\" style=\"border-spacing:0;mso-table-lspace:0pt;mso-table-rspace:0pt;\">\n                <tr>\n                    <td class=\"container-padding content footer-text\" align=\"left\" style=\"border-collapse:collapse;font-family:Helvetica, Arial, sans-serif;font-size:12px;line-height:16px;color:#aaaaaa;padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff;\">\n                        本メールは、Best Beer Japan Brewery Inc.より送信しております。<br/>\n                        もしお心当たりが無い場合は、その旨 <a href=\"mailto:tano@bestbeerjapan.com\" style=\"text-decoration:none;\">tano@bestbeerjapan.com</a> までご連絡いただければ幸いです。<br/>\n                        <br/>\n                        <div class=\"title\" style=\"font-size:14px;font-family:Helvetica, Arial, sans-serif;font-weight:600;color:#374550;\"><a href=\"http://localhost:8080/\" style=\"color:#aaaaaa;text-decoration:none;\">Best Beer Japan Brewery Inc.</a></div>\n                        <div>copyright &copy; Best Beer Japan Brewery Inc. all rights reserved.</div>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>\n<!--/100% background wrapper-->\n<br>\n<br>\n</body>\n\n</html>\n','mailhistory');
/*!40000 ALTER TABLE `dtb_mail_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mail_template`
--

DROP TABLE IF EXISTS `dtb_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_mail_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `mail_subject` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1CB16DB261220EA6` (`creator_id`),
  CONSTRAINT `FK_1CB16DB261220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mail_template`
--

LOCK TABLES `dtb_mail_template` WRITE;
/*!40000 ALTER TABLE `dtb_mail_template` DISABLE KEYS */;
INSERT INTO `dtb_mail_template` VALUES (1,NULL,'注文受付メール','Mail/order.twig','ご注文ありがとうございます','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(2,NULL,'会員仮登録メール','Mail/entry_confirm.twig','会員登録のご確認','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(3,NULL,'会員本登録メール','Mail/entry_complete.twig','会員登録が完了しました。','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(4,NULL,'会員退会メール','Mail/customer_withdraw_mail.twig','退会手続きのご完了','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(5,NULL,'問合受付メール','Mail/contact_mail.twig','お問い合わせを受け付けました。','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(6,NULL,'パスワードリセット','Mail/forgot_mail.twig','パスワード変更のご確認','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(7,NULL,'パスワードリマインダー','Mail/reset_complete_mail.twig','パスワード変更のお知らせ','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate'),(8,NULL,'出荷通知メール','Mail/shipping_notify.twig','商品出荷のお知らせ','2017-03-07 10:14:52','2017-03-07 10:14:52','mailtemplate');
/*!40000 ALTER TABLE `dtb_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_member`
--

DROP TABLE IF EXISTS `dtb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `work_id` smallint(5) unsigned DEFAULT NULL,
  `authority_id` smallint(5) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `login_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_10BC3BE6BB3453DB` (`work_id`),
  KEY `IDX_10BC3BE681EC865B` (`authority_id`),
  KEY `IDX_10BC3BE661220EA6` (`creator_id`),
  CONSTRAINT `FK_10BC3BE661220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_10BC3BE681EC865B` FOREIGN KEY (`authority_id`) REFERENCES `mtb_authority` (`id`),
  CONSTRAINT `FK_10BC3BE6BB3453DB` FOREIGN KEY (`work_id`) REFERENCES `mtb_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_member`
--

LOCK TABLES `dtb_member` WRITE;
/*!40000 ALTER TABLE `dtb_member` DISABLE KEYS */;
INSERT INTO `dtb_member` VALUES (1,1,0,1,'管理者','Best Beer Japan Brewery Inc.','bestbeerjapan','2f2436e0c6deabeff5b446fc3d40f6c98f4a22ef2860a552e11b88720bcf7723','oXkXQ5NKv3urL5A3hXoyTZ5CRj9m12et',1,'2020-03-17 03:02:55','2020-03-17 06:10:17','2020-03-17 06:10:17','member');
/*!40000 ALTER TABLE `dtb_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_news`
--

DROP TABLE IF EXISTS `dtb_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `url` varchar(4000) DEFAULT NULL,
  `link_method` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EA4C351761220EA6` (`creator_id`),
  CONSTRAINT `FK_EA4C351761220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_news`
--

LOCK TABLES `dtb_news` WRITE;
/*!40000 ALTER TABLE `dtb_news` DISABLE KEYS */;
INSERT INTO `dtb_news` VALUES (1,1,'2018-09-01 09:00:00','Best Beer Japan Brewery のビールがサイトから購入いただけるようになりました。','お電話、メールなどでお手数おかけしておりましたが、Best Beer Japan Brewery のビールがこのサイトを通じてお買い上げいただけるようになりました。\r\nサイトは弊社からの承認制となっております。新規会員登録からご登録ください。','https://www.bestbeerjapan.com/',1,'2018-09-01 09:00:00','2020-03-17 04:43:18',1,'news');
/*!40000 ALTER TABLE `dtb_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order`
--

DROP TABLE IF EXISTS `dtb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `sex_id` smallint(5) unsigned DEFAULT NULL,
  `job_id` smallint(5) unsigned DEFAULT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `device_type_id` smallint(5) unsigned DEFAULT NULL,
  `pre_order_id` varchar(255) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `name01` varchar(255) NOT NULL,
  `name02` varchar(255) NOT NULL,
  `kana01` varchar(255) DEFAULT NULL,
  `kana02` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `addr01` varchar(255) DEFAULT NULL,
  `addr02` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `subtotal` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `delivery_fee_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `charge` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) DEFAULT NULL,
  `note` varchar(4000) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `order_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `payment_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `currency_code` varchar(255) DEFAULT NULL,
  `complete_message` longtext,
  `complete_mail_message` longtext,
  `add_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
  `use_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
  `order_status_id` smallint(5) unsigned DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dtb_order_pre_order_id_idx` (`pre_order_id`),
  KEY `IDX_1D66D8079395C3F3` (`customer_id`),
  KEY `IDX_1D66D807F92F3E70` (`country_id`),
  KEY `IDX_1D66D807E171EF5F` (`pref_id`),
  KEY `IDX_1D66D8075A2DB2A0` (`sex_id`),
  KEY `IDX_1D66D807BE04EA9` (`job_id`),
  KEY `IDX_1D66D8074C3A3BB` (`payment_id`),
  KEY `IDX_1D66D8074FFA550E` (`device_type_id`),
  KEY `IDX_1D66D807D7707B45` (`order_status_id`),
  KEY `dtb_order_email_idx` (`email`),
  KEY `dtb_order_order_date_idx` (`order_date`),
  KEY `dtb_order_payment_date_idx` (`payment_date`),
  KEY `dtb_order_update_date_idx` (`update_date`),
  KEY `dtb_order_order_no_idx` (`order_no`),
  CONSTRAINT `FK_1D66D8074C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `dtb_payment` (`id`),
  CONSTRAINT `FK_1D66D8074FFA550E` FOREIGN KEY (`device_type_id`) REFERENCES `mtb_device_type` (`id`),
  CONSTRAINT `FK_1D66D8075A2DB2A0` FOREIGN KEY (`sex_id`) REFERENCES `mtb_sex` (`id`),
  CONSTRAINT `FK_1D66D8079395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `dtb_customer` (`id`),
  CONSTRAINT `FK_1D66D807BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `mtb_job` (`id`),
  CONSTRAINT `FK_1D66D807E171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_1D66D807F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order`
--

LOCK TABLES `dtb_order` WRITE;
/*!40000 ALTER TABLE `dtb_order` DISABLE KEYS */;
INSERT INTO `dtb_order` VALUES (1,1,NULL,13,NULL,NULL,5,10,'3b4a1a3ba736a0f715693f95774b3735f15c9cec','1',NULL,'田野','誠','タノ','マコト','バー蒲田クラフト','tano+demo@bestbeerjapan.com','08012345678','1440035','大田区南蒲田','BBJビル１階',NULL,57750.00,0.00,1910.00,0.00,5424.00,59660.00,59660.00,'請求書払',NULL,'2020-03-17 04:48:45','2020-03-17 04:49:06','2020-03-17 04:49:06',NULL,'JPY',NULL,NULL,525,0,1,'order');
/*!40000 ALTER TABLE `dtb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_item`
--

DROP TABLE IF EXISTS `dtb_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_class_id` int(10) unsigned DEFAULT NULL,
  `shipping_id` int(10) unsigned DEFAULT NULL,
  `rounding_type_id` smallint(5) unsigned DEFAULT NULL,
  `tax_type_id` smallint(5) unsigned DEFAULT NULL,
  `tax_display_type_id` smallint(5) unsigned DEFAULT NULL,
  `order_item_type_id` smallint(5) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `class_name1` varchar(255) DEFAULT NULL,
  `class_name2` varchar(255) DEFAULT NULL,
  `class_category_name1` varchar(255) DEFAULT NULL,
  `class_category_name2` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `quantity` decimal(10,0) NOT NULL DEFAULT '0',
  `tax` decimal(10,0) NOT NULL DEFAULT '0',
  `tax_rate` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `tax_adjust` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `tax_rule_id` smallint(5) unsigned DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `processor_name` varchar(255) DEFAULT NULL,
  `point_rate` decimal(10,0) unsigned DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A0C8C3ED8D9F6D38` (`order_id`),
  KEY `IDX_A0C8C3ED4584665A` (`product_id`),
  KEY `IDX_A0C8C3ED21B06187` (`product_class_id`),
  KEY `IDX_A0C8C3ED4887F3F8` (`shipping_id`),
  KEY `IDX_A0C8C3ED1BD5C574` (`rounding_type_id`),
  KEY `IDX_A0C8C3ED84042C99` (`tax_type_id`),
  KEY `IDX_A0C8C3EDA2505856` (`tax_display_type_id`),
  KEY `IDX_A0C8C3EDCAD13EAD` (`order_item_type_id`),
  CONSTRAINT `FK_A0C8C3ED1BD5C574` FOREIGN KEY (`rounding_type_id`) REFERENCES `mtb_rounding_type` (`id`),
  CONSTRAINT `FK_A0C8C3ED21B06187` FOREIGN KEY (`product_class_id`) REFERENCES `dtb_product_class` (`id`),
  CONSTRAINT `FK_A0C8C3ED4584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_A0C8C3ED4887F3F8` FOREIGN KEY (`shipping_id`) REFERENCES `dtb_shipping` (`id`),
  CONSTRAINT `FK_A0C8C3ED84042C99` FOREIGN KEY (`tax_type_id`) REFERENCES `mtb_tax_type` (`id`),
  CONSTRAINT `FK_A0C8C3ED8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `dtb_order` (`id`),
  CONSTRAINT `FK_A0C8C3EDA2505856` FOREIGN KEY (`tax_display_type_id`) REFERENCES `mtb_tax_display_type` (`id`),
  CONSTRAINT `FK_A0C8C3EDCAD13EAD` FOREIGN KEY (`order_item_type_id`) REFERENCES `mtb_order_item_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_item`
--

LOCK TABLES `dtb_order_item` WRITE;
/*!40000 ALTER TABLE `dtb_order_item` DISABLE KEYS */;
INSERT INTO `dtb_order_item` VALUES (1,1,3,14,1,1,1,1,1,'Plazma Pale Ale','PZ-20201201-15L','樽サイズ',NULL,'樽 - 15L',NULL,17500.00,3,1750,10,0,NULL,'JPY',NULL,NULL,'orderitem'),(3,1,NULL,NULL,NULL,1,1,2,3,'手数料',NULL,NULL,NULL,NULL,NULL,0.00,1,0,10,0,NULL,'JPY','Eccube\\Service\\PurchaseFlow\\Processor\\PaymentChargePreprocessor',NULL,'orderitem'),(5,1,NULL,NULL,1,1,1,2,2,'送料',NULL,NULL,NULL,NULL,NULL,1910.00,1,174,10,0,NULL,'JPY','Eccube\\Service\\PurchaseFlow\\Processor\\DeliveryFeePreprocessor',NULL,'orderitem');
/*!40000 ALTER TABLE `dtb_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_pdf`
--

DROP TABLE IF EXISTS `dtb_order_pdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_order_pdf` (
  `member_id` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message1` varchar(255) DEFAULT NULL,
  `message2` varchar(255) DEFAULT NULL,
  `message3` varchar(255) DEFAULT NULL,
  `note1` varchar(255) DEFAULT NULL,
  `note2` varchar(255) DEFAULT NULL,
  `note3` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_pdf`
--

LOCK TABLES `dtb_order_pdf` WRITE;
/*!40000 ALTER TABLE `dtb_order_pdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order_pdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_page`
--

DROP TABLE IF EXISTS `dtb_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_page_id` int(10) unsigned DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `edit_type` smallint(5) unsigned NOT NULL DEFAULT '1',
  `author` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `meta_robots` varchar(255) DEFAULT NULL,
  `meta_tags` varchar(4000) DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3951A67D0618E8C` (`master_page_id`),
  KEY `dtb_page_url_idx` (`url`),
  CONSTRAINT `FK_E3951A67D0618E8C` FOREIGN KEY (`master_page_id`) REFERENCES `dtb_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_page`
--

LOCK TABLES `dtb_page` WRITE;
/*!40000 ALTER TABLE `dtb_page` DISABLE KEYS */;
INSERT INTO `dtb_page` VALUES (0,NULL,'プレビューデータ','preview',NULL,1,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(1,NULL,'TOPページ','homepage','index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(2,NULL,'商品一覧ページ','product_list','Product/list',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(3,NULL,'商品詳細ページ','product_detail','Product/detail',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2020-03-17 05:46:48',NULL,'<meta property=\"og:type\" content=\"og:product\" /><meta property=\"og:title\" content=\"{{ Product.name }}\" />\r\n<meta property=\"og:image\" content=\"{{ url(\'homepage\') }}{{ asset(Product.main_list_image|no_image_product, \'save_image\') }}\" />\r\n<meta property=\"og:description\" content=\"{{ Product.description_list|striptags }}\" />\r\n<meta property=\"og:url\" content=\"{{ url(\'product_detail\', {\'id\': Product.id}) }}\" />\r\n<meta property=\"product:price:amount\" content=\"{{ Product.getPrice02IncTaxMin }}\"/>\r\n<meta property=\"product:price:currency\" content=\"{{ eccube_config.currency }}\"/>\r\n<meta property=\"product:product_link\" content=\"{{ url(\'product_detail\', {\'id\': Product.id}) }}\"/>\r\n<meta property=\"product:retailer_title\" content=\"{{ Product.name }}\"/>','page'),(4,NULL,'MYページ','mypage','Mypage/index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(5,NULL,'MYページ/会員登録内容変更(入力ページ)','mypage_change','Mypage/change',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(6,NULL,'MYページ/会員登録内容変更(完了ページ)','mypage_change_complete','Mypage/change_complete',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(7,NULL,'MYページ/お届け先一覧','mypage_delivery','Mypage/delivery',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(8,NULL,'MYページ/お届け先追加','mypage_delivery_new','Mypage/delivery_edit',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(9,NULL,'MYページ/お気に入り一覧','mypage_favorite','Mypage/favorite',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(10,NULL,'MYページ/購入履歴詳細','mypage_history','Mypage/history',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(11,NULL,'MYページ/ログイン','mypage_login','Mypage/login',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(12,NULL,'MYページ/退会手続き(入力ページ)','mypage_withdraw','Mypage/withdraw',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(13,NULL,'MYページ/退会手続き(完了ページ)','mypage_withdraw_complete','Mypage/withdraw_complete',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(14,NULL,'当サイトについて','help_about','Help/about',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(15,NULL,'現在のカゴの中','cart','Cart/index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(16,NULL,'お問い合わせ(入力ページ)','contact','Contact/index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(17,NULL,'お問い合わせ(完了ページ)','contact_complete','Contact/complete',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(18,NULL,'会員登録(入力ページ)','entry','Entry/index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(19,NULL,'ご利用規約','help_agreement','Help/agreement',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(20,NULL,'会員登録(完了ページ)','entry_complete','Entry/complete',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(21,NULL,'特定商取引に関する法律に基づく表記','help_tradelaw','Help/tradelaw',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(22,NULL,'本会員登録(完了ページ)','entry_activate','Entry/activate',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(23,NULL,'商品購入','shopping','Shopping/index',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(24,NULL,'商品購入/お届け先の指定','shopping_shipping','Shopping/shipping',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(25,NULL,'商品購入/お届け先の複数指定','shopping_shipping_multiple','Shopping/shipping_multiple',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(28,NULL,'商品購入/ご注文完了','shopping_complete','Shopping/complete',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52','noindex',NULL,'page'),(29,NULL,'プライバシーポリシー','help_privacy','Help/privacy',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(30,NULL,'商品購入ログイン','shopping_login','Shopping/login',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(31,NULL,'非会員購入情報入力','shopping_nonmember','Shopping/nonmember',2,NULL,NULL,NULL,'2017-03-07 10:14:52','2017-03-07 10:14:52',NULL,NULL,'page'),(32,NULL,'商品購入/お届け先の追加','shopping_shipping_edit','Shopping/shipping_edit',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02','noindex',NULL,'page'),(33,NULL,'商品購入/お届け先の複数指定(お届け先の追加)','shopping_shipping_multiple_edit','Shopping/shipping_multiple_edit',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02','noindex',NULL,'page'),(34,NULL,'商品購入/購入エラー','shopping_error','Shopping/shopping_error',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02','noindex',NULL,'page'),(35,NULL,'ご利用ガイド','help_guide','Help/guide',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02',NULL,NULL,'page'),(36,NULL,'パスワード再発行(入力ページ)','forgot','Forgot/index',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02',NULL,NULL,'page'),(37,NULL,'パスワード再発行(完了ページ)','forgot_complete','Forgot/complete',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:02','noindex',NULL,'page'),(38,NULL,'パスワード再発行(再設定ページ)','forgot_reset','Forgot/reset',2,NULL,NULL,NULL,'2017-03-07 01:15:02','2017-03-07 01:15:05','noindex',NULL,'page'),(42,NULL,'商品購入/遷移','shopping_redirect_to','Shopping/index',2,NULL,NULL,NULL,'2017-03-07 01:15:03','2017-03-07 01:15:03','noindex',NULL,'page'),(44,8,'MYページ/お届け先編集','mypage_delivery_edit','Mypage/delivery_edit',2,NULL,NULL,NULL,'2017-03-07 01:15:05','2017-03-07 01:15:05','noindex',NULL,'page'),(45,NULL,'商品購入/ご注文確認','shopping_confirm','Shopping/confirm',2,NULL,NULL,NULL,'2017-03-07 01:15:03','2017-03-07 01:15:03','noindex',NULL,'page');
/*!40000 ALTER TABLE `dtb_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_page_layout`
--

DROP TABLE IF EXISTS `dtb_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_page_layout` (
  `page_id` int(10) unsigned NOT NULL,
  `layout_id` int(10) unsigned NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`page_id`,`layout_id`),
  KEY `IDX_F2799941C4663E4` (`page_id`),
  KEY `IDX_F27999418C22AA1A` (`layout_id`),
  CONSTRAINT `FK_F27999418C22AA1A` FOREIGN KEY (`layout_id`) REFERENCES `dtb_layout` (`id`),
  CONSTRAINT `FK_F2799941C4663E4` FOREIGN KEY (`page_id`) REFERENCES `dtb_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_page_layout`
--

LOCK TABLES `dtb_page_layout` WRITE;
/*!40000 ALTER TABLE `dtb_page_layout` DISABLE KEYS */;
INSERT INTO `dtb_page_layout` VALUES (0,0,2,'pagelayout'),(1,1,41,'pagelayout'),(2,2,41,'pagelayout'),(3,2,41,'pagelayout'),(4,2,6,'pagelayout'),(5,2,41,'pagelayout'),(6,2,8,'pagelayout'),(7,2,36,'pagelayout'),(8,2,37,'pagelayout'),(9,2,9,'pagelayout'),(10,2,10,'pagelayout'),(11,2,11,'pagelayout'),(12,2,12,'pagelayout'),(13,2,14,'pagelayout'),(14,2,13,'pagelayout'),(15,2,15,'pagelayout'),(16,2,16,'pagelayout'),(17,2,17,'pagelayout'),(18,2,41,'pagelayout'),(19,2,33,'pagelayout'),(20,2,19,'pagelayout'),(21,2,20,'pagelayout'),(22,2,21,'pagelayout'),(23,2,35,'pagelayout'),(24,2,22,'pagelayout'),(25,2,34,'pagelayout'),(28,2,23,'pagelayout'),(29,2,24,'pagelayout'),(30,2,25,'pagelayout'),(31,2,26,'pagelayout'),(32,2,27,'pagelayout'),(33,2,28,'pagelayout'),(34,2,29,'pagelayout'),(35,2,30,'pagelayout'),(36,2,31,'pagelayout'),(37,2,32,'pagelayout'),(38,2,39,'pagelayout'),(42,2,38,'pagelayout'),(44,2,40,'pagelayout'),(45,2,41,'pagelayout');
/*!40000 ALTER TABLE `dtb_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_payment`
--

DROP TABLE IF EXISTS `dtb_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `charge` decimal(12,2) unsigned DEFAULT '0.00',
  `rule_max` decimal(12,2) unsigned DEFAULT NULL,
  `sort_no` smallint(5) unsigned DEFAULT NULL,
  `fixed` tinyint(1) NOT NULL DEFAULT '1',
  `payment_image` varchar(255) DEFAULT NULL,
  `rule_min` decimal(12,2) unsigned DEFAULT NULL,
  `method_class` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7AFF628F61220EA6` (`creator_id`),
  CONSTRAINT `FK_7AFF628F61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_payment`
--

LOCK TABLES `dtb_payment` WRITE;
/*!40000 ALTER TABLE `dtb_payment` DISABLE KEYS */;
INSERT INTO `dtb_payment` VALUES (1,1,'郵便振替',0.00,NULL,4,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2020-03-17 03:10:05','payment'),(2,1,'現金書留',0.00,NULL,3,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2020-03-17 03:10:06','payment'),(3,1,'銀行振込',0.00,NULL,2,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2020-03-17 03:10:07','payment'),(4,1,'代金引換',0.00,NULL,1,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2020-03-17 03:10:08','payment'),(5,1,'請求書払',0.00,NULL,5,1,NULL,NULL,'Eccube\\Service\\Payment\\Method\\Cash',1,'2020-03-17 03:09:54','2020-03-17 03:09:54','payment');
/*!40000 ALTER TABLE `dtb_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_payment_option`
--

DROP TABLE IF EXISTS `dtb_payment_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_payment_option` (
  `delivery_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`delivery_id`,`payment_id`),
  KEY `IDX_5631540D12136921` (`delivery_id`),
  KEY `IDX_5631540D4C3A3BB` (`payment_id`),
  CONSTRAINT `FK_5631540D12136921` FOREIGN KEY (`delivery_id`) REFERENCES `dtb_delivery` (`id`),
  CONSTRAINT `FK_5631540D4C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `dtb_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_payment_option`
--

LOCK TABLES `dtb_payment_option` WRITE;
/*!40000 ALTER TABLE `dtb_payment_option` DISABLE KEYS */;
INSERT INTO `dtb_payment_option` VALUES (1,1,'paymentoption'),(1,2,'paymentoption'),(1,3,'paymentoption'),(1,4,'paymentoption'),(2,3,'paymentoption'),(3,5,'paymentoption');
/*!40000 ALTER TABLE `dtb_payment_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_plugin`
--

DROP TABLE IF EXISTS `dtb_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `initialized` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_plugin`
--

LOCK TABLES `dtb_plugin` WRITE;
/*!40000 ALTER TABLE `dtb_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product`
--

DROP TABLE IF EXISTS `dtb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `product_status_id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(4000) DEFAULT NULL,
  `description_list` varchar(4000) DEFAULT NULL,
  `description_detail` varchar(4000) DEFAULT NULL,
  `search_word` varchar(4000) DEFAULT NULL,
  `free_area` longtext,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C49DE22F61220EA6` (`creator_id`),
  KEY `IDX_C49DE22F557B630` (`product_status_id`),
  CONSTRAINT `FK_C49DE22F557B630` FOREIGN KEY (`product_status_id`) REFERENCES `mtb_product_status` (`id`),
  CONSTRAINT `FK_C49DE22F61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product`
--

LOCK TABLES `dtb_product` WRITE;
/*!40000 ALTER TABLE `dtb_product` DISABLE KEYS */;
INSERT INTO `dtb_product` VALUES (3,1,1,'Plazma Pale Ale',NULL,'アルコール：5.0%　／　IBU：36','アルコール：5.0%\r\nIBU：36\r\n\r\n本場チェコ産の最上級ザーツホップ(Saaz)を使用し、伝統的製法「トリプルデコクション」によって麦汁を煮込む作業を繰り返すことにより、真の黄金色に仕上げました。ザーツホップの爽やかなアロマと、デコクションによる独特のカラメルフレーヴァーが特徴のオールドスタイル・ボヘミアンピルスナーです。','ペールエール','画面下部にも好きな文言を入れることができます。','2020-03-17 04:03:52','2020-03-17 06:40:28','product'),(4,1,1,'鯉 IPA',NULL,'アルコール6.5-7.5％','アルコール6.5-7.5％\r\n\r\n毎回限定で仕込んでいるアメリカンIPAシリーズ。\r\n​強烈な苦みと柑橘系の香りとハイアルコールが特徴です。',NULL,NULL,'2020-03-17 04:35:18','2020-03-17 06:40:45','product'),(5,1,1,'CHARCOAL DARK',NULL,'アルコール 9.0％','アルコール 9.0％\r\n\r\n石炭をイメージして作成したビール。\r\n飲み口の強烈な苦さがクセになると好評頂いています。\r\n\r\n数量限定販売です。お早めに！\r\n\r\n【原材料】麦芽、ホップ\r\n【Alc.】5.5％\r\n【賞味期限】製造年月日より120日\r\n【色】黒色\r\n【味】すっきりの中にほのかな甘さ\r\n【香り】モルト\r\n【飲みごろ温度】12～14℃\r\n【コ　ク】★★★☆☆\r\n【キ　レ】★★★☆☆\r\n【苦　味】★☆☆☆☆\r\n【喉ごし】★★☆☆☆\r\n【香　り】★★★☆☆',NULL,NULL,'2020-03-17 04:38:59','2020-03-17 06:40:09','product');
/*!40000 ALTER TABLE `dtb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_category`
--

DROP TABLE IF EXISTS `dtb_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product_category` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `IDX_B05778914584665A` (`product_id`),
  KEY `IDX_B057789112469DE2` (`category_id`),
  CONSTRAINT `FK_B057789112469DE2` FOREIGN KEY (`category_id`) REFERENCES `dtb_category` (`id`),
  CONSTRAINT `FK_B05778914584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_category`
--

LOCK TABLES `dtb_product_category` WRITE;
/*!40000 ALTER TABLE `dtb_product_category` DISABLE KEYS */;
INSERT INTO `dtb_product_category` VALUES (3,8,'productcategory'),(4,8,'productcategory'),(5,7,'productcategory');
/*!40000 ALTER TABLE `dtb_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_class`
--

DROP TABLE IF EXISTS `dtb_product_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `sale_type_id` smallint(5) unsigned DEFAULT NULL,
  `class_category_id1` int(10) unsigned DEFAULT NULL,
  `class_category_id2` int(10) unsigned DEFAULT NULL,
  `delivery_duration_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `stock` decimal(10,0) DEFAULT NULL,
  `stock_unlimited` tinyint(1) NOT NULL DEFAULT '0',
  `sale_limit` decimal(10,0) unsigned DEFAULT NULL,
  `price01` decimal(12,2) DEFAULT NULL,
  `price02` decimal(12,2) NOT NULL,
  `delivery_fee` decimal(12,2) unsigned DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `currency_code` varchar(255) DEFAULT NULL,
  `point_rate` decimal(10,0) unsigned DEFAULT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A11D1BA4584665A` (`product_id`),
  KEY `IDX_1A11D1BAB0524E01` (`sale_type_id`),
  KEY `IDX_1A11D1BA248D128` (`class_category_id1`),
  KEY `IDX_1A11D1BA9B418092` (`class_category_id2`),
  KEY `IDX_1A11D1BABA4269E` (`delivery_duration_id`),
  KEY `IDX_1A11D1BA61220EA6` (`creator_id`),
  KEY `dtb_product_class_price02_idx` (`price02`),
  KEY `dtb_product_class_stock_stock_unlimited_idx` (`stock`,`stock_unlimited`),
  CONSTRAINT `FK_1A11D1BA248D128` FOREIGN KEY (`class_category_id1`) REFERENCES `dtb_class_category` (`id`),
  CONSTRAINT `FK_1A11D1BA4584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_1A11D1BA61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_1A11D1BA9B418092` FOREIGN KEY (`class_category_id2`) REFERENCES `dtb_class_category` (`id`),
  CONSTRAINT `FK_1A11D1BAB0524E01` FOREIGN KEY (`sale_type_id`) REFERENCES `mtb_sale_type` (`id`),
  CONSTRAINT `FK_1A11D1BABA4269E` FOREIGN KEY (`delivery_duration_id`) REFERENCES `dtb_delivery_duration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_class`
--

LOCK TABLES `dtb_product_class` WRITE;
/*!40000 ALTER TABLE `dtb_product_class` DISABLE KEYS */;
INSERT INTO `dtb_product_class` VALUES (12,3,1,NULL,NULL,2,1,'PA20201201',NULL,1,NULL,NULL,12500.00,NULL,0,'2020-03-17 04:03:52','2020-03-17 04:06:03','JPY',NULL,'productclass'),(13,3,1,12,NULL,2,1,'PZ-20201201-10L',NULL,1,NULL,NULL,12500.00,NULL,1,'2020-03-17 04:06:03','2020-03-17 04:06:03','JPY',NULL,'productclass'),(14,3,1,11,NULL,2,1,'PZ-20201201-15L',NULL,1,NULL,NULL,17500.00,NULL,1,'2020-03-17 04:06:03','2020-03-17 04:06:03','JPY',NULL,'productclass'),(15,4,1,NULL,NULL,2,1,NULL,NULL,1,NULL,NULL,14500.00,NULL,0,'2020-03-17 04:35:18','2020-03-17 04:36:08','JPY',NULL,'productclass'),(16,4,1,12,NULL,2,1,'KI-20201201-10L',NULL,1,NULL,NULL,13500.00,NULL,1,'2020-03-17 04:36:08','2020-03-17 04:36:08','JPY',NULL,'productclass'),(17,4,1,11,NULL,2,1,'KI-20201201-15L',NULL,1,NULL,NULL,18500.00,NULL,1,'2020-03-17 04:36:08','2020-03-17 04:36:08','JPY',NULL,'productclass'),(18,5,1,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,14500.00,NULL,0,'2020-03-17 04:38:59','2020-03-17 04:39:38','JPY',NULL,'productclass'),(19,5,1,12,NULL,2,1,'CD-20201201-10L',NULL,1,NULL,NULL,15500.00,NULL,1,'2020-03-17 04:39:38','2020-03-17 04:39:38','JPY',NULL,'productclass'),(20,5,1,11,NULL,2,1,'CD-20201201-15L',NULL,1,NULL,NULL,20500.00,NULL,1,'2020-03-17 04:39:38','2020-03-17 04:39:38','JPY',NULL,'productclass');
/*!40000 ALTER TABLE `dtb_product_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_image`
--

DROP TABLE IF EXISTS `dtb_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3267CC7A4584665A` (`product_id`),
  KEY `IDX_3267CC7A61220EA6` (`creator_id`),
  CONSTRAINT `FK_3267CC7A4584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_3267CC7A61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_image`
--

LOCK TABLES `dtb_product_image` WRITE;
/*!40000 ALTER TABLE `dtb_product_image` DISABLE KEYS */;
INSERT INTO `dtb_product_image` VALUES (7,3,1,'0317130039_5e704b67f0b1c.jpg',1,'2020-03-17 04:03:52','productimage'),(8,4,1,'0317133355_5e70533314918.jpg',1,'2020-03-17 04:35:18','productimage'),(9,5,1,'0317133722_5e705402f2027.jpg',1,'2020-03-17 04:38:59','productimage');
/*!40000 ALTER TABLE `dtb_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_stock`
--

DROP TABLE IF EXISTS `dtb_product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_class_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `stock` decimal(10,0) DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC6C9E4521B06187` (`product_class_id`),
  KEY `IDX_BC6C9E4561220EA6` (`creator_id`),
  CONSTRAINT `FK_BC6C9E4521B06187` FOREIGN KEY (`product_class_id`) REFERENCES `dtb_product_class` (`id`),
  CONSTRAINT `FK_BC6C9E4561220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_stock`
--

LOCK TABLES `dtb_product_stock` WRITE;
/*!40000 ALTER TABLE `dtb_product_stock` DISABLE KEYS */;
INSERT INTO `dtb_product_stock` VALUES (12,12,1,NULL,'2020-03-17 04:03:52','2020-03-17 04:03:52','productstock'),(13,13,1,NULL,'2020-03-17 04:06:03','2020-03-17 04:06:03','productstock'),(14,14,1,NULL,'2020-03-17 04:06:03','2020-03-17 04:06:03','productstock'),(15,15,1,NULL,'2020-03-17 04:35:18','2020-03-17 04:35:18','productstock'),(16,16,1,NULL,'2020-03-17 04:36:08','2020-03-17 04:36:08','productstock'),(17,17,1,NULL,'2020-03-17 04:36:08','2020-03-17 04:36:08','productstock'),(18,18,1,NULL,'2020-03-17 04:38:59','2020-03-17 04:38:59','productstock'),(19,19,1,NULL,'2020-03-17 04:39:38','2020-03-17 04:39:38','productstock'),(20,20,1,NULL,'2020-03-17 04:39:38','2020-03-17 04:39:38','productstock');
/*!40000 ALTER TABLE `dtb_product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_tag`
--

DROP TABLE IF EXISTS `dtb_product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_product_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `tag_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4433E7214584665A` (`product_id`),
  KEY `IDX_4433E721BAD26311` (`tag_id`),
  KEY `IDX_4433E72161220EA6` (`creator_id`),
  CONSTRAINT `FK_4433E7214584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_4433E72161220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_4433E721BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `dtb_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_tag`
--

LOCK TABLES `dtb_product_tag` WRITE;
/*!40000 ALTER TABLE `dtb_product_tag` DISABLE KEYS */;
INSERT INTO `dtb_product_tag` VALUES (8,5,3,1,'2020-03-17 06:40:09','producttag'),(9,5,7,1,'2020-03-17 06:40:09','producttag'),(10,3,6,1,'2020-03-17 06:40:28','producttag'),(11,3,2,1,'2020-03-17 06:40:28','producttag'),(14,4,5,1,'2020-03-17 06:40:45','producttag'),(15,4,2,1,'2020-03-17 06:40:45','producttag');
/*!40000 ALTER TABLE `dtb_product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_shipping`
--

DROP TABLE IF EXISTS `dtb_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `delivery_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `name01` varchar(255) NOT NULL,
  `name02` varchar(255) NOT NULL,
  `kana01` varchar(255) DEFAULT NULL,
  `kana02` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `addr01` varchar(255) DEFAULT NULL,
  `addr02` varchar(255) DEFAULT NULL,
  `delivery_name` varchar(255) DEFAULT NULL,
  `time_id` int(10) unsigned DEFAULT NULL,
  `delivery_time` varchar(255) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `shipping_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `tracking_number` varchar(255) DEFAULT NULL,
  `note` varchar(4000) DEFAULT NULL,
  `sort_no` smallint(5) unsigned DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `mail_send_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2EBD22CE8D9F6D38` (`order_id`),
  KEY `IDX_2EBD22CEF92F3E70` (`country_id`),
  KEY `IDX_2EBD22CEE171EF5F` (`pref_id`),
  KEY `IDX_2EBD22CE12136921` (`delivery_id`),
  KEY `IDX_2EBD22CE61220EA6` (`creator_id`),
  CONSTRAINT `FK_2EBD22CE12136921` FOREIGN KEY (`delivery_id`) REFERENCES `dtb_delivery` (`id`),
  CONSTRAINT `FK_2EBD22CE61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_2EBD22CE8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `dtb_order` (`id`),
  CONSTRAINT `FK_2EBD22CEE171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_2EBD22CEF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_shipping`
--

LOCK TABLES `dtb_shipping` WRITE;
/*!40000 ALTER TABLE `dtb_shipping` DISABLE KEYS */;
INSERT INTO `dtb_shipping` VALUES (1,1,NULL,13,3,NULL,'田野','誠','タノ','マコト','バー蒲田クラフト','08012345678','1440035','大田区南蒲田','BBJビル１階','クール便',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-17 04:48:45','2020-03-17 04:48:45',NULL,'shipping');
/*!40000 ALTER TABLE `dtb_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_tag`
--

DROP TABLE IF EXISTS `dtb_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_tag`
--

LOCK TABLES `dtb_tag` WRITE;
/*!40000 ALTER TABLE `dtb_tag` DISABLE KEYS */;
INSERT INTO `dtb_tag` VALUES (1,'新商品',1,'tag'),(2,'おすすめ商品',2,'tag'),(3,'限定品',3,'tag'),(4,'ピルスナー',4,'tag'),(5,'IPA',5,'tag'),(6,'ペールエール',6,'tag'),(7,'スタウト',7,'tag'),(8,'アンバーエール',8,'tag'),(9,'フルーツビール',9,'tag'),(10,'リアルエール',10,'tag'),(11,'ヴァイツェン',11,'tag');
/*!40000 ALTER TABLE `dtb_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_tax_rule`
--

DROP TABLE IF EXISTS `dtb_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_tax_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_class_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `country_id` smallint(5) unsigned DEFAULT NULL,
  `pref_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `rounding_type_id` smallint(5) unsigned DEFAULT NULL,
  `tax_rate` decimal(10,0) unsigned NOT NULL DEFAULT '8',
  `tax_adjust` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `apply_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_59F696DE21B06187` (`product_class_id`),
  KEY `IDX_59F696DE61220EA6` (`creator_id`),
  KEY `IDX_59F696DEF92F3E70` (`country_id`),
  KEY `IDX_59F696DEE171EF5F` (`pref_id`),
  KEY `IDX_59F696DE4584665A` (`product_id`),
  KEY `IDX_59F696DE1BD5C574` (`rounding_type_id`),
  CONSTRAINT `FK_59F696DE1BD5C574` FOREIGN KEY (`rounding_type_id`) REFERENCES `mtb_rounding_type` (`id`),
  CONSTRAINT `FK_59F696DE21B06187` FOREIGN KEY (`product_class_id`) REFERENCES `dtb_product_class` (`id`),
  CONSTRAINT `FK_59F696DE4584665A` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
  CONSTRAINT `FK_59F696DE61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
  CONSTRAINT `FK_59F696DEE171EF5F` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
  CONSTRAINT `FK_59F696DEF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_tax_rule`
--

LOCK TABLES `dtb_tax_rule` WRITE;
/*!40000 ALTER TABLE `dtb_tax_rule` DISABLE KEYS */;
INSERT INTO `dtb_tax_rule` VALUES (1,NULL,1,NULL,NULL,NULL,1,10,0,'2017-03-07 10:14:52','2017-03-07 10:14:52','2020-03-17 03:14:35','taxrule');
/*!40000 ALTER TABLE `dtb_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_template`
--

DROP TABLE IF EXISTS `dtb_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtb_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_type_id` smallint(5) unsigned DEFAULT NULL,
  `template_code` varchar(255) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94C12A694FFA550E` (`device_type_id`),
  CONSTRAINT `FK_94C12A694FFA550E` FOREIGN KEY (`device_type_id`) REFERENCES `mtb_device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_template`
--

LOCK TABLES `dtb_template` WRITE;
/*!40000 ALTER TABLE `dtb_template` DISABLE KEYS */;
INSERT INTO `dtb_template` VALUES (1,10,'default','デフォルト','2017-03-07 10:14:52','2017-03-07 10:14:52','template');
/*!40000 ALTER TABLE `dtb_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_authority`
--

DROP TABLE IF EXISTS `mtb_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_authority` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_authority`
--

LOCK TABLES `mtb_authority` WRITE;
/*!40000 ALTER TABLE `mtb_authority` DISABLE KEYS */;
INSERT INTO `mtb_authority` VALUES (0,'システム管理者',0,'authority'),(1,'店舗オーナー',1,'authority');
/*!40000 ALTER TABLE `mtb_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_country`
--

DROP TABLE IF EXISTS `mtb_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_country` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_country`
--

LOCK TABLES `mtb_country` WRITE;
/*!40000 ALTER TABLE `mtb_country` DISABLE KEYS */;
INSERT INTO `mtb_country` VALUES (4,'アフガニスタン',4,'country'),(8,'アルバニア',12,'country'),(10,'南極',149,'country'),(12,'アルジェリア',9,'country'),(16,'アメリカ領サモア',7,'country'),(20,'アンドラ',17,'country'),(24,'アンゴラ',15,'country'),(28,'アンティグア・バーブーダ',16,'country'),(31,'アゼルバイジャン',3,'country'),(32,'アルゼンチン',10,'country'),(36,'オーストラリア',39,'country'),(40,'オーストリア',40,'country'),(44,'バハマ',167,'country'),(48,'バーレーン',161,'country'),(50,'バングラデシュ',175,'country'),(51,'アルメニア',13,'country'),(52,'バルバドス',172,'country'),(56,'ベルギー',201,'country'),(60,'バミューダ諸島|バミューダ',169,'country'),(64,'ブータン',181,'country'),(68,'ボリビア|ボリビア多民族国',206,'country'),(70,'ボスニア・ヘルツェゴビナ',203,'country'),(72,'ボツワナ',204,'country'),(74,'ブーベ島',182,'country'),(76,'ブラジル',186,'country'),(84,'ベリーズ',199,'country'),(86,'イギリス領インド洋地域',20,'country'),(90,'ソロモン諸島',121,'country'),(92,'イギリス領ヴァージン諸島',21,'country'),(96,'ブルネイ|ブルネイ・ダルサラーム',193,'country'),(100,'ブルガリア',191,'country'),(104,'ミャンマー',224,'country'),(108,'ブルンジ',194,'country'),(112,'ベラルーシ',198,'country'),(116,'カンボジア',55,'country'),(120,'カメルーン',53,'country'),(124,'カナダ',51,'country'),(132,'カーボベルデ',45,'country'),(136,'ケイマン諸島',75,'country'),(140,'中央アフリカ共和国',130,'country'),(144,'スリランカ',108,'country'),(148,'チャド',129,'country'),(152,'チリ',134,'country'),(156,'中華人民共和国|中国',131,'country'),(158,'台湾',125,'country'),(162,'クリスマス島 (オーストラリア)|クリスマス島',71,'country'),(166,'ココス諸島|ココス（キーリング）諸島',78,'country'),(170,'コロンビア',81,'country'),(174,'コモロ',80,'country'),(175,'マヨット',214,'country'),(178,'コンゴ共和国',82,'country'),(180,'コンゴ民主共和国',83,'country'),(184,'クック諸島',69,'country'),(188,'コスタリカ',79,'country'),(191,'クロアチア',74,'country'),(192,'キューバ',60,'country'),(196,'キプロス',59,'country'),(203,'チェコ',128,'country'),(204,'ベナン',196,'country'),(208,'デンマーク',136,'country'),(212,'ドミニカ国',141,'country'),(214,'ドミニカ共和国',140,'country'),(218,'エクアドル',33,'country'),(222,'エルサルバドル',38,'country'),(226,'赤道ギニア',113,'country'),(231,'エチオピア',36,'country'),(232,'エリトリア',37,'country'),(233,'エストニア',35,'country'),(234,'フェロー諸島',184,'country'),(238,'フォークランド諸島|フォークランド（マルビナス）諸島',185,'country'),(239,'サウスジョージア・サウスサンドウィッチ諸島',85,'country'),(242,'フィジー',178,'country'),(246,'フィンランド',180,'country'),(248,'オーランド諸島',41,'country'),(250,'フランス',187,'country'),(254,'フランス領ギアナ',188,'country'),(258,'フランス領ポリネシア',189,'country'),(260,'フランス領南方・南極地域',190,'country'),(262,'ジブチ',94,'country'),(266,'ガボン',52,'country'),(268,'グルジア',72,'country'),(270,'ガンビア',54,'country'),(275,'パレスチナ',173,'country'),(276,'ドイツ',137,'country'),(288,'ガーナ',44,'country'),(292,'ジブラルタル',95,'country'),(296,'キリバス',63,'country'),(300,'ギリシャ',62,'country'),(304,'グリーンランド',70,'country'),(308,'グレナダ',73,'country'),(312,'グアドループ',66,'country'),(316,'グアム',67,'country'),(320,'グアテマラ',65,'country'),(324,'ギニア',57,'country'),(328,'ガイアナ',47,'country'),(332,'ハイチ',162,'country'),(334,'ハード島とマクドナルド諸島',160,'country'),(336,'バチカン|バチカン市国',164,'country'),(340,'ホンジュラス',209,'country'),(344,'香港',208,'country'),(348,'ハンガリー',174,'country'),(352,'アイスランド',1,'country'),(356,'インド',26,'country'),(360,'インドネシア',27,'country'),(364,'イラン|イラン・イスラム共和国',25,'country'),(368,'イラク',24,'country'),(372,'アイルランド',2,'country'),(376,'イスラエル',22,'country'),(380,'イタリア',23,'country'),(384,'コートジボワール',77,'country'),(388,'ジャマイカ',97,'country'),(392,'日本',153,'country'),(398,'カザフスタン',48,'country'),(400,'ヨルダン',236,'country'),(404,'ケニア',76,'country'),(408,'朝鮮民主主義人民共和国',133,'country'),(410,'大韓民国',124,'country'),(414,'クウェート',68,'country'),(417,'キルギス',64,'country'),(418,'ラオス|ラオス人民民主共和国',237,'country'),(422,'レバノン',247,'country'),(426,'レソト',246,'country'),(428,'ラトビア',238,'country'),(430,'リベリア',242,'country'),(434,'リビア',240,'country'),(438,'リヒテンシュタイン',241,'country'),(440,'リトアニア',239,'country'),(442,'ルクセンブルク',244,'country'),(446,'マカオ',211,'country'),(450,'マダガスカル',213,'country'),(454,'マラウイ',215,'country'),(458,'マレーシア',219,'country'),(462,'モルディブ',230,'country'),(466,'マリ共和国|マリ',216,'country'),(470,'マルタ',217,'country'),(474,'マルティニーク',218,'country'),(478,'モーリタニア',227,'country'),(480,'モーリシャス',226,'country'),(484,'メキシコ',225,'country'),(492,'モナコ',229,'country'),(496,'モンゴル国|モンゴル',233,'country'),(498,'モルドバ|モルドバ共和国',231,'country'),(499,'モンテネグロ',234,'country'),(500,'モントセラト',235,'country'),(504,'モロッコ',232,'country'),(508,'モザンビーク',228,'country'),(512,'オマーン',42,'country'),(516,'ナミビア',148,'country'),(520,'ナウル',147,'country'),(524,'ネパール',157,'country'),(528,'オランダ',43,'country'),(531,'キュラソー島|キュラソー',61,'country'),(533,'アルバ',11,'country'),(534,'シント・マールテン|シント・マールテン（オランダ領）',100,'country'),(535,'BES諸島|ボネール、シント・ユースタティウスおよびサバ',205,'country'),(540,'ニューカレドニア',155,'country'),(548,'バヌアツ',166,'country'),(554,'ニュージーランド',156,'country'),(558,'ニカラグア',151,'country'),(562,'ニジェール',152,'country'),(566,'ナイジェリア',146,'country'),(570,'ニウエ',150,'country'),(574,'ノーフォーク島',158,'country'),(578,'ノルウェー',159,'country'),(580,'北マリアナ諸島',56,'country'),(581,'合衆国領有小離島',50,'country'),(583,'ミクロネシア連邦',221,'country'),(584,'マーシャル諸島',210,'country'),(585,'パラオ',170,'country'),(586,'パキスタン',163,'country'),(591,'パナマ',165,'country'),(598,'パプアニューギニア',168,'country'),(600,'パラグアイ',171,'country'),(604,'ペルー',200,'country'),(608,'フィリピン',179,'country'),(612,'ピトケアン諸島|ピトケアン',177,'country'),(616,'ポーランド',202,'country'),(620,'ポルトガル',207,'country'),(624,'ギニアビサウ',58,'country'),(626,'東ティモール',176,'country'),(630,'プエルトリコ',183,'country'),(634,'カタール',49,'country'),(638,'レユニオン',248,'country'),(642,'ルーマニア',243,'country'),(643,'ロシア|ロシア連邦',249,'country'),(646,'ルワンダ',245,'country'),(652,'サン・バルテルミー島|サン・バルテルミー',88,'country'),(654,'セントヘレナ・アセンションおよびトリスタンダクーニャ',118,'country'),(659,'セントクリストファー・ネイビス',116,'country'),(660,'アンギラ',14,'country'),(662,'セントルシア',119,'country'),(663,'サン・マルタン (西インド諸島)|サン・マルタン（フランス領）',92,'country'),(666,'サンピエール島・ミクロン島',90,'country'),(670,'セントビンセント・グレナディーン|セントビンセントおよびグレナディーン諸島',117,'country'),(674,'サンマリノ',91,'country'),(678,'サントメ・プリンシペ',87,'country'),(682,'サウジアラビア',84,'country'),(686,'セネガル',114,'country'),(688,'セルビア',115,'country'),(690,'セーシェル',112,'country'),(694,'シエラレオネ',93,'country'),(702,'シンガポール',99,'country'),(703,'スロバキア',109,'country'),(704,'ベトナム',195,'country'),(705,'スロベニア',110,'country'),(706,'ソマリア',120,'country'),(710,'南アフリカ共和国|南アフリカ',222,'country'),(716,'ジンバブエ',101,'country'),(724,'スペイン',106,'country'),(728,'南スーダン',223,'country'),(729,'スーダン',104,'country'),(732,'西サハラ',154,'country'),(740,'スリナム',107,'country'),(744,'スヴァールバル諸島およびヤンマイエン島',105,'country'),(748,'スワジランド',111,'country'),(752,'スウェーデン',103,'country'),(756,'スイス',102,'country'),(760,'シリア|シリア・アラブ共和国',98,'country'),(762,'タジキスタン',126,'country'),(764,'タイ王国|タイ',123,'country'),(768,'トーゴ',138,'country'),(772,'トケラウ',139,'country'),(776,'トンガ',145,'country'),(780,'トリニダード・トバゴ',142,'country'),(784,'アラブ首長国連邦',8,'country'),(788,'チュニジア',132,'country'),(792,'トルコ',144,'country'),(795,'トルクメニスタン',143,'country'),(796,'タークス・カイコス諸島',122,'country'),(798,'ツバル',135,'country'),(800,'ウガンダ',29,'country'),(804,'ウクライナ',30,'country'),(807,'マケドニア共和国|マケドニア旧ユーゴスラビア共和国',212,'country'),(818,'エジプト',34,'country'),(826,'イギリス',19,'country'),(831,'ガーンジー',46,'country'),(832,'ジャージー',96,'country'),(833,'マン島',220,'country'),(834,'タンザニア',127,'country'),(840,'アメリカ合衆国',5,'country'),(850,'アメリカ領ヴァージン諸島',6,'country'),(854,'ブルキナファソ',192,'country'),(858,'ウルグアイ',32,'country'),(860,'ウズベキスタン',31,'country'),(862,'ベネズエラ|ベネズエラ・ボリバル共和国',197,'country'),(876,'ウォリス・フツナ',28,'country'),(882,'サモア',86,'country'),(887,'イエメン',18,'country'),(894,'ザンビア',89,'country');
/*!40000 ALTER TABLE `mtb_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_csv_type`
--

DROP TABLE IF EXISTS `mtb_csv_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_csv_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_csv_type`
--

LOCK TABLES `mtb_csv_type` WRITE;
/*!40000 ALTER TABLE `mtb_csv_type` DISABLE KEYS */;
INSERT INTO `mtb_csv_type` VALUES (1,'商品CSV',3,'csvtype'),(2,'会員CSV',4,'csvtype'),(3,'受注CSV',1,'csvtype'),(4,'配送CSV',1,'csvtype'),(5,'カテゴリCSV',5,'csvtype');
/*!40000 ALTER TABLE `mtb_csv_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_customer_order_status`
--

DROP TABLE IF EXISTS `mtb_customer_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_customer_order_status` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_customer_order_status`
--

LOCK TABLES `mtb_customer_order_status` WRITE;
/*!40000 ALTER TABLE `mtb_customer_order_status` DISABLE KEYS */;
INSERT INTO `mtb_customer_order_status` VALUES (1,'注文受付',0,'customerorderstatus'),(3,'注文取消し',4,'customerorderstatus'),(4,'注文受付',3,'customerorderstatus'),(5,'発送済み',6,'customerorderstatus'),(6,'注文受付',2,'customerorderstatus'),(7,'注文受付',1,'customerorderstatus'),(8,'注文未完了',5,'customerorderstatus'),(9,'返品',7,'customerorderstatus');
/*!40000 ALTER TABLE `mtb_customer_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_customer_status`
--

DROP TABLE IF EXISTS `mtb_customer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_customer_status` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_customer_status`
--

LOCK TABLES `mtb_customer_status` WRITE;
/*!40000 ALTER TABLE `mtb_customer_status` DISABLE KEYS */;
INSERT INTO `mtb_customer_status` VALUES (1,'仮会員',0,'customerstatus'),(2,'本会員',1,'customerstatus'),(3,'退会',2,'customerstatus');
/*!40000 ALTER TABLE `mtb_customer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_device_type`
--

DROP TABLE IF EXISTS `mtb_device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_device_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_device_type`
--

LOCK TABLES `mtb_device_type` WRITE;
/*!40000 ALTER TABLE `mtb_device_type` DISABLE KEYS */;
INSERT INTO `mtb_device_type` VALUES (2,'モバイル',0,'devicetype'),(10,'PC',1,'devicetype');
/*!40000 ALTER TABLE `mtb_device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_job`
--

DROP TABLE IF EXISTS `mtb_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_job` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_job`
--

LOCK TABLES `mtb_job` WRITE;
/*!40000 ALTER TABLE `mtb_job` DISABLE KEYS */;
INSERT INTO `mtb_job` VALUES (1,'公務員',0,'job'),(2,'コンサルタント',1,'job'),(3,'コンピューター関連技術職',2,'job'),(4,'コンピューター関連以外の技術職',3,'job'),(5,'金融関係',4,'job'),(6,'医師',5,'job'),(7,'弁護士',6,'job'),(8,'総務・人事・事務',7,'job'),(9,'営業・販売',8,'job'),(10,'研究・開発',9,'job'),(11,'広報・宣伝',10,'job'),(12,'企画・マーケティング',11,'job'),(13,'デザイン関係',12,'job'),(14,'会社経営・役員',13,'job'),(15,'出版・マスコミ関係',14,'job'),(16,'学生・フリーター',15,'job'),(17,'主婦',16,'job'),(18,'その他',17,'job');
/*!40000 ALTER TABLE `mtb_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_order_item_type`
--

DROP TABLE IF EXISTS `mtb_order_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_order_item_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_order_item_type`
--

LOCK TABLES `mtb_order_item_type` WRITE;
/*!40000 ALTER TABLE `mtb_order_item_type` DISABLE KEYS */;
INSERT INTO `mtb_order_item_type` VALUES (1,'商品',0,'orderitemtype'),(2,'送料',1,'orderitemtype'),(3,'手数料',2,'orderitemtype'),(4,'割引',3,'orderitemtype'),(5,'税',4,'orderitemtype'),(6,'ポイント',5,'orderitemtype');
/*!40000 ALTER TABLE `mtb_order_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_order_status`
--

DROP TABLE IF EXISTS `mtb_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_order_status` (
  `id` smallint(5) unsigned NOT NULL,
  `display_order_count` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_order_status`
--

LOCK TABLES `mtb_order_status` WRITE;
/*!40000 ALTER TABLE `mtb_order_status` DISABLE KEYS */;
INSERT INTO `mtb_order_status` VALUES (1,1,'新規受付',0,'orderstatus'),(3,0,'注文取消し',3,'orderstatus'),(4,1,'対応中',2,'orderstatus'),(5,0,'発送済み',4,'orderstatus'),(6,1,'入金済み',1,'orderstatus'),(7,0,'決済処理中',6,'orderstatus'),(8,0,'購入処理中',5,'orderstatus'),(9,0,'返品',7,'orderstatus');
/*!40000 ALTER TABLE `mtb_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_order_status_color`
--

DROP TABLE IF EXISTS `mtb_order_status_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_order_status_color` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_order_status_color`
--

LOCK TABLES `mtb_order_status_color` WRITE;
/*!40000 ALTER TABLE `mtb_order_status_color` DISABLE KEYS */;
INSERT INTO `mtb_order_status_color` VALUES (1,'#437ec4',0,'orderstatuscolor'),(3,'#C04949',3,'orderstatuscolor'),(4,'#EEB128',2,'orderstatuscolor'),(5,'#25B877',4,'orderstatuscolor'),(6,'#25B877',1,'orderstatuscolor'),(7,'#A3A3A3',6,'orderstatuscolor'),(8,'#A3A3A3',5,'orderstatuscolor'),(9,'#C04949',7,'orderstatuscolor');
/*!40000 ALTER TABLE `mtb_order_status_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_page_max`
--

DROP TABLE IF EXISTS `mtb_page_max`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_page_max` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_page_max`
--

LOCK TABLES `mtb_page_max` WRITE;
/*!40000 ALTER TABLE `mtb_page_max` DISABLE KEYS */;
INSERT INTO `mtb_page_max` VALUES (10,'10',0,'pagemax'),(20,'20',1,'pagemax'),(30,'30',2,'pagemax'),(40,'40',3,'pagemax'),(50,'50',4,'pagemax'),(60,'60',5,'pagemax'),(70,'70',6,'pagemax'),(80,'80',7,'pagemax'),(90,'90',8,'pagemax'),(100,'100',9,'pagemax');
/*!40000 ALTER TABLE `mtb_page_max` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_pref`
--

DROP TABLE IF EXISTS `mtb_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_pref` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_pref`
--

LOCK TABLES `mtb_pref` WRITE;
/*!40000 ALTER TABLE `mtb_pref` DISABLE KEYS */;
INSERT INTO `mtb_pref` VALUES (1,'北海道',1,'pref'),(2,'青森県',2,'pref'),(3,'岩手県',3,'pref'),(4,'宮城県',4,'pref'),(5,'秋田県',5,'pref'),(6,'山形県',6,'pref'),(7,'福島県',7,'pref'),(8,'茨城県',8,'pref'),(9,'栃木県',9,'pref'),(10,'群馬県',10,'pref'),(11,'埼玉県',11,'pref'),(12,'千葉県',12,'pref'),(13,'東京都',13,'pref'),(14,'神奈川県',14,'pref'),(15,'新潟県',15,'pref'),(16,'富山県',16,'pref'),(17,'石川県',17,'pref'),(18,'福井県',18,'pref'),(19,'山梨県',19,'pref'),(20,'長野県',20,'pref'),(21,'岐阜県',21,'pref'),(22,'静岡県',22,'pref'),(23,'愛知県',23,'pref'),(24,'三重県',24,'pref'),(25,'滋賀県',25,'pref'),(26,'京都府',26,'pref'),(27,'大阪府',27,'pref'),(28,'兵庫県',28,'pref'),(29,'奈良県',29,'pref'),(30,'和歌山県',30,'pref'),(31,'鳥取県',31,'pref'),(32,'島根県',32,'pref'),(33,'岡山県',33,'pref'),(34,'広島県',34,'pref'),(35,'山口県',35,'pref'),(36,'徳島県',36,'pref'),(37,'香川県',37,'pref'),(38,'愛媛県',38,'pref'),(39,'高知県',39,'pref'),(40,'福岡県',40,'pref'),(41,'佐賀県',41,'pref'),(42,'長崎県',42,'pref'),(43,'熊本県',43,'pref'),(44,'大分県',44,'pref'),(45,'宮崎県',45,'pref'),(46,'鹿児島県',46,'pref'),(47,'沖縄県',47,'pref');
/*!40000 ALTER TABLE `mtb_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_list_max`
--

DROP TABLE IF EXISTS `mtb_product_list_max`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_product_list_max` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_list_max`
--

LOCK TABLES `mtb_product_list_max` WRITE;
/*!40000 ALTER TABLE `mtb_product_list_max` DISABLE KEYS */;
INSERT INTO `mtb_product_list_max` VALUES (20,'20件',0,'productlistmax'),(40,'40件',1,'productlistmax'),(60,'60件',2,'productlistmax');
/*!40000 ALTER TABLE `mtb_product_list_max` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_list_order_by`
--

DROP TABLE IF EXISTS `mtb_product_list_order_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_product_list_order_by` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_list_order_by`
--

LOCK TABLES `mtb_product_list_order_by` WRITE;
/*!40000 ALTER TABLE `mtb_product_list_order_by` DISABLE KEYS */;
INSERT INTO `mtb_product_list_order_by` VALUES (1,'価格が低い順',0,'productlistorderby'),(2,'新着順',2,'productlistorderby'),(3,'価格が高い順',1,'productlistorderby');
/*!40000 ALTER TABLE `mtb_product_list_order_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_status`
--

DROP TABLE IF EXISTS `mtb_product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_product_status` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_status`
--

LOCK TABLES `mtb_product_status` WRITE;
/*!40000 ALTER TABLE `mtb_product_status` DISABLE KEYS */;
INSERT INTO `mtb_product_status` VALUES (1,'公開',0,'productstatus'),(2,'非公開',1,'productstatus'),(3,'廃止',2,'productstatus');
/*!40000 ALTER TABLE `mtb_product_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_rounding_type`
--

DROP TABLE IF EXISTS `mtb_rounding_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_rounding_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_rounding_type`
--

LOCK TABLES `mtb_rounding_type` WRITE;
/*!40000 ALTER TABLE `mtb_rounding_type` DISABLE KEYS */;
INSERT INTO `mtb_rounding_type` VALUES (1,'四捨五入',0,'roundingtype'),(2,'切り捨て',1,'roundingtype'),(3,'切り上げ',2,'roundingtype');
/*!40000 ALTER TABLE `mtb_rounding_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_sale_type`
--

DROP TABLE IF EXISTS `mtb_sale_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_sale_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_sale_type`
--

LOCK TABLES `mtb_sale_type` WRITE;
/*!40000 ALTER TABLE `mtb_sale_type` DISABLE KEYS */;
INSERT INTO `mtb_sale_type` VALUES (1,'販売種別A',0,'saletype'),(2,'販売種別B',1,'saletype');
/*!40000 ALTER TABLE `mtb_sale_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_sex`
--

DROP TABLE IF EXISTS `mtb_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_sex` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_sex`
--

LOCK TABLES `mtb_sex` WRITE;
/*!40000 ALTER TABLE `mtb_sex` DISABLE KEYS */;
INSERT INTO `mtb_sex` VALUES (1,'男性',0,'sex'),(2,'女性',1,'sex');
/*!40000 ALTER TABLE `mtb_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_tax_display_type`
--

DROP TABLE IF EXISTS `mtb_tax_display_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_tax_display_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_tax_display_type`
--

LOCK TABLES `mtb_tax_display_type` WRITE;
/*!40000 ALTER TABLE `mtb_tax_display_type` DISABLE KEYS */;
INSERT INTO `mtb_tax_display_type` VALUES (1,'税抜',0,'taxdisplaytype'),(2,'税込',1,'taxdisplaytype');
/*!40000 ALTER TABLE `mtb_tax_display_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_tax_type`
--

DROP TABLE IF EXISTS `mtb_tax_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_tax_type` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_tax_type`
--

LOCK TABLES `mtb_tax_type` WRITE;
/*!40000 ALTER TABLE `mtb_tax_type` DISABLE KEYS */;
INSERT INTO `mtb_tax_type` VALUES (1,'課税',0,'taxtype'),(2,'不課税',1,'taxtype'),(3,'非課税',2,'taxtype');
/*!40000 ALTER TABLE `mtb_tax_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_work`
--

DROP TABLE IF EXISTS `mtb_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtb_work` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_no` smallint(5) unsigned NOT NULL,
  `discriminator_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_work`
--

LOCK TABLES `mtb_work` WRITE;
/*!40000 ALTER TABLE `mtb_work` DISABLE KEYS */;
INSERT INTO `mtb_work` VALUES (0,'非稼働',0,'work'),(1,'稼働',1,'work');
/*!40000 ALTER TABLE `mtb_work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-17  7:00:36
