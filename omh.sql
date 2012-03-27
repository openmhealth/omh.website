-- MySQL dump 10.13  Distrib 5.5.20, for Linux (x86_64)
--
-- Host: localhost    Database: omh
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Mr WordPress','','http://wordpress.org/','','2012-02-23 12:24:56','2012-02-23 12:24:56','Hi, this is a comment.<br />To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'post-trashed','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
INSERT INTO `wp_links` VALUES (1,'http://codex.wordpress.org/','Documentation','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(2,'http://wordpress.org/news/','WordPress Blog','','','','Y',1,0,'0000-00-00 00:00:00','','','http://wordpress.org/news/feed/'),(3,'http://wordpress.org/extend/ideas/','Suggest Ideas','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(4,'http://wordpress.org/support/','Support Forum','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(5,'http://wordpress.org/extend/plugins/','Plugins','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(6,'http://wordpress.org/extend/themes/','Themes','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(7,'http://planet.wordpress.org/','WordPress Planet','','','','Y',1,0,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (3,0,'siteurl','http://omh.ideasphere.biz','yes'),(4,0,'blogname','Open mHealth','yes'),(5,0,'blogdescription','Empowering mobile health innovation through open source architecture.','yes'),(6,0,'users_can_register','0','yes'),(7,0,'admin_email','admin@openmhealth.org','yes'),(8,0,'start_of_week','1','yes'),(9,0,'use_balanceTags','0','yes'),(10,0,'use_smilies','1','yes'),(11,0,'require_name_email','1','yes'),(12,0,'comments_notify','1','yes'),(13,0,'posts_per_rss','10','yes'),(14,0,'rss_use_excerpt','0','yes'),(15,0,'mailserver_url','mail.example.com','yes'),(16,0,'mailserver_login','login@example.com','yes'),(17,0,'mailserver_pass','password','yes'),(18,0,'mailserver_port','110','yes'),(19,0,'default_category','1','yes'),(20,0,'default_comment_status','open','yes'),(21,0,'default_ping_status','open','yes'),(22,0,'default_pingback_flag','1','yes'),(23,0,'default_post_edit_rows','20','yes'),(24,0,'posts_per_page','10','yes'),(25,0,'date_format','F j, Y','yes'),(26,0,'time_format','g:i a','yes'),(27,0,'links_updated_date_format','F j, Y g:i a','yes'),(28,0,'links_recently_updated_prepend','<em>','yes'),(29,0,'links_recently_updated_append','</em>','yes'),(30,0,'links_recently_updated_time','120','yes'),(31,0,'comment_moderation','0','yes'),(32,0,'moderation_notify','1','yes'),(33,0,'permalink_structure','','yes'),(34,0,'gzipcompression','0','yes'),(35,0,'hack_file','0','yes'),(36,0,'blog_charset','UTF-8','yes'),(37,0,'moderation_keys','','no'),(38,0,'active_plugins','a:2:{i:0;s:25:\"bwp-minify/bwp-minify.php\";i:1;s:13:\"pods/init.php\";}','yes'),(39,0,'home','http://omh.ideasphere.biz','yes'),(40,0,'category_base','','yes'),(41,0,'ping_sites','http://rpc.pingomatic.com/','yes'),(42,0,'advanced_edit','0','yes'),(43,0,'comment_max_links','2','yes'),(44,0,'gmt_offset','0','yes'),(45,0,'default_email_category','1','yes'),(46,0,'recently_edited','','no'),(47,0,'template','omh-theme','yes'),(48,0,'stylesheet','omh-theme','yes'),(49,0,'comment_whitelist','1','yes'),(50,0,'blacklist_keys','','no'),(51,0,'comment_registration','0','yes'),(52,0,'rss_language','en','yes'),(53,0,'html_type','text/html','yes'),(54,0,'use_trackback','0','yes'),(55,0,'default_role','subscriber','yes'),(56,0,'db_version','19470','yes'),(57,0,'uploads_use_yearmonth_folders','1','yes'),(58,0,'upload_path','','yes'),(59,0,'blog_public','1','yes'),(60,0,'default_link_category','2','yes'),(61,0,'show_on_front','posts','yes'),(62,0,'tag_base','','yes'),(63,0,'show_avatars','1','yes'),(64,0,'avatar_rating','G','yes'),(65,0,'upload_url_path','','yes'),(66,0,'thumbnail_size_w','150','yes'),(67,0,'thumbnail_size_h','150','yes'),(68,0,'thumbnail_crop','1','yes'),(69,0,'medium_size_w','300','yes'),(70,0,'medium_size_h','300','yes'),(71,0,'avatar_default','mystery','yes'),(72,0,'enable_app','0','yes'),(73,0,'enable_xmlrpc','0','yes'),(74,0,'large_size_w','1024','yes'),(75,0,'large_size_h','1024','yes'),(76,0,'image_default_link_type','file','yes'),(77,0,'image_default_size','','yes'),(78,0,'image_default_align','','yes'),(79,0,'close_comments_for_old_posts','0','yes'),(80,0,'close_comments_days_old','14','yes'),(81,0,'thread_comments','1','yes'),(82,0,'thread_comments_depth','5','yes'),(83,0,'page_comments','0','yes'),(84,0,'comments_per_page','50','yes'),(85,0,'default_comments_page','newest','yes'),(86,0,'comment_order','asc','yes'),(87,0,'sticky_posts','a:0:{}','yes'),(88,0,'widget_categories','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(89,0,'widget_text','a:0:{}','yes'),(90,0,'widget_rss','a:0:{}','yes'),(91,0,'timezone_string','','yes'),(92,0,'embed_autourls','1','yes'),(93,0,'embed_size_w','','yes'),(94,0,'embed_size_h','600','yes'),(95,0,'page_for_posts','0','yes'),(96,0,'page_on_front','0','yes'),(97,0,'default_post_format','0','yes'),(98,0,'initial_db_version','19470','yes'),(99,0,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(100,0,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(101,0,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,0,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,0,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,0,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,0,'sidebars_widgets','a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:22:\"omh_featured_project-2\";i:2;s:18:\"omh_latest_posts-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:9:\"sidebar-4\";a:0:{}s:9:\"sidebar-5\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(106,0,'cron','a:6:{i:1329999918;a:2:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1329999919;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1329999927;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1330008690;a:1:{s:26:\"upgrader_scheduled_cleanup\";a:1:{s:32:\"adcb9b75260590ff6058773ddcb9ddd6\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:1:{i:0;i:4;}}}}i:1330019109;a:1:{s:8:\"do_pings\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}s:7:\"version\";i:2;}','yes'),(107,0,'_transient_doing_cron','1330119689','yes'),(108,0,'_site_transient_update_core','O:8:\"stdClass\":3:{s:7:\"updates\";a:0:{}s:15:\"version_checked\";s:5:\"3.3.1\";s:12:\"last_checked\";i:1330099364;}','yes'),(109,0,'_site_transient_update_plugins','O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1330099364;}','yes'),(110,0,'_site_transient_update_themes','O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1330099365;}','yes'),(111,0,'dashboard_widget_options','a:4:{s:25:\"dashboard_recent_comments\";a:1:{s:5:\"items\";i:5;}s:24:\"dashboard_incoming_links\";a:5:{s:4:\"home\";s:16:\"http://localhost\";s:4:\"link\";s:92:\"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/\";s:3:\"url\";s:129:\"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/omh/\";s:5:\"items\";i:10;s:9:\"show_date\";b:0;}s:17:\"dashboard_primary\";a:7:{s:4:\"link\";s:26:\"http://wordpress.org/news/\";s:3:\"url\";s:31:\"http://wordpress.org/news/feed/\";s:5:\"title\";s:14:\"WordPress Blog\";s:5:\"items\";i:2;s:12:\"show_summary\";i:1;s:11:\"show_author\";i:0;s:9:\"show_date\";i:1;}s:19:\"dashboard_secondary\";a:7:{s:4:\"link\";s:28:\"http://planet.wordpress.org/\";s:3:\"url\";s:33:\"http://planet.wordpress.org/feed/\";s:5:\"title\";s:20:\"Other WordPress News\";s:5:\"items\";i:5;s:12:\"show_summary\";i:0;s:11:\"show_author\";i:0;s:9:\"show_date\";i:0;}}','yes'),(114,0,'can_compress_scripts','1','yes'),(120,0,'_transient_timeout_plugin_slugs','1330106831','no'),(121,0,'_transient_plugin_slugs','a:4:{i:0;s:19:\"akismet/akismet.php\";i:1;s:25:\"bwp-minify/bwp-minify.php\";i:2;s:9:\"hello.php\";i:3;s:13:\"pods/init.php\";}','no'),(124,0,'recently_activated','a:1:{s:19:\"akismet/akismet.php\";i:1330003667;}','yes'),(125,0,'_transient_random_seed','87513ab0229b7a2394227cea7596fc73','yes'),(126,0,'ftp_credentials','a:3:{s:8:\"hostname\";s:9:\"localhost\";s:8:\"username\";s:4:\"maku\";s:15:\"connection_type\";s:4:\"ftps\";}','yes'),(127,0,'pods_version','1.12.3','yes'),(146,0,'_site_transient_timeout_wporg_theme_feature_list','1330031982','yes'),(147,0,'_site_transient_wporg_theme_feature_list','a:0:{}','yes'),(148,0,'theme_mods_twentyeleven','a:2:{s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:3;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1330019949;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:9:\"sidebar-4\";a:0:{}s:9:\"sidebar-5\";a:0:{}}}}','yes'),(149,0,'current_theme','Open mHealth --&gt; Based on Wordpress twentyeleven','yes'),(150,0,'theme_mods_omh-theme','a:4:{i:0;b:0;s:12:\"header_image\";s:78:\"http://localhost/omh/wp-content/themes/omh-theme/images/headers/chessboard.jpg\";s:16:\"header_textcolor\";s:3:\"000\";s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:3;}}','yes'),(151,0,'theme_switched','','yes'),(152,0,'twentyeleven_theme_options','a:3:{s:12:\"color_scheme\";s:5:\"light\";s:10:\"link_color\";s:7:\"#1b8be0\";s:12:\"theme_layout\";s:15:\"sidebar-content\";}','yes'),(157,0,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:1:{i:0;i:3;}}','yes'),(166,0,'_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f','1330142566','no'),(167,0,'_transient_dash_20494a3d90a6669585674ed0eb8dcd8f','<p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 72.14.204.147: Permission denied</p>','no'),(168,0,'_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51','1330142566','no'),(169,0,'_transient_dash_4077549d03da2e451c8b5f002294ff51','<div class=\"rss-widget\"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 72.233.56.139: Permission denied</p></div>','no'),(170,0,'_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0','1330142567','no'),(171,0,'_transient_dash_aa95765b5cc111c56d5993d476b1c2f0','<div class=\"rss-widget\"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 72.233.56.138: Permission denied</p></div>','no'),(172,0,'_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e','1330142567','no'),(173,0,'_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e','','no'),(174,0,'_transient_timeout_settings_errors','1330118990','no'),(175,0,'_transient_settings_errors','a:1:{i:0;a:4:{s:7:\"setting\";s:7:\"general\";s:4:\"code\";s:16:\"settings_updated\";s:7:\"message\";s:15:\"Settings saved.\";s:4:\"type\";s:7:\"updated\";}}','no'),(176,0,'widget_my_widget','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(177,0,'widget_omh_latest_posts','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(178,0,'widget_omh_featured_project','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(179,0,'pods_package','{\\\"meta\\\":{\\\"version\\\":\\\"198\\\",\\\"build\\\":\\\"1311624692\\\"},\\\"helpers\\\":[{\\\"name\\\":\\\"image/full\\\",\\\"helper_type\\\":\\\"display\\\",\\\"phpcode\\\":\\\"<?php\\\\n\\\\/\\\\/ you can set a default image url to show\\\\n\\\\/\\\\/ if no image was uploaded, below\\\\n$default = \\\'\\\';\\\\n\\\\n$size = \\\'full\\\';\\\\nif (empty($value) && !empty($default))\\\\n    echo $default;\\\\nelseif (is_array($value) && !empty($value)) {\\\\n    if (isset($value[0]))\\\\n        $value = $value[0];\\\\n    if (is_array($value) && isset($value[\\\'guid\\\']))\\\\n        $value = $value[\\\'guid\\\'];\\\\n    if (!empty($value))\\\\n        echo $value;\\\\n}\\\\nelseif (!empty($value))\\\\n    echo $value;\\\"},{\\\"name\\\":\\\"image/thumbnail\\\",\\\"helper_type\\\":\\\"display\\\",\\\"phpcode\\\":\\\"<?php\\\\n\\\\/\\\\/ you can set a default image url to show\\\\n\\\\/\\\\/ if no image was uploaded, below\\\\n$default = \\\'\\\';\\\\n\\\\n$size = \\\'thumbnail\\\';\\\\nif (empty($value) && !empty($default))\\\\n    echo $default;\\\\nelseif (is_array($value) && !empty($value)) {\\\\n    if (isset($value[0]))\\\\n        $value = $value[0];\\\\n    if (is_array($value) && isset($value[\\\'ID\\\']))\\\\n        $value = $value[\\\'ID\\\'];\\\\n    if (!empty($value)) {\\\\n        $sized = image_downsize((int) $value,$size);\\\\n        if (is_array($sized) && isset($sized[0]))\\\\n            echo $sized[0];\\\\n        else\\\\n            echo $default;\\\\n    }\\\\n}\\\\nelseif (!empty($value))\\\\n    echo $value;\\\"},{\\\"name\\\":\\\"image/medium\\\",\\\"helper_type\\\":\\\"display\\\",\\\"phpcode\\\":\\\"<?php\\\\n\\\\/\\\\/ you can set a default image url to show\\\\n\\\\/\\\\/ if no image was uploaded, below\\\\n$default = \\\'\\\';\\\\n\\\\n$size = \\\'medium\\\';\\\\nif (empty($value) && !empty($default))\\\\n    echo $default;\\\\nelseif (is_array($value) && !empty($value)) {\\\\n    if (isset($value[0]))\\\\n        $value = $value[0];\\\\n    if (is_array($value) && isset($value[\\\'ID\\\']))\\\\n        $value = $value[\\\'ID\\\'];\\\\n    if (!empty($value)) {\\\\n        $sized = image_downsize((int) $value,$size);\\\\n        if (is_array($sized) && isset($sized[0]))\\\\n            echo $sized[0];\\\\n        else\\\\n            echo $default;\\\\n    }\\\\n}\\\\nelseif (!empty($value))\\\\n    echo $value;\\\"},{\\\"name\\\":\\\"image/large\\\",\\\"helper_type\\\":\\\"display\\\",\\\"phpcode\\\":\\\"<?php\\\\n\\\\/\\\\/ you can set a default image url to show\\\\n\\\\/\\\\/ if no image was uploaded, below\\\\n$default = \\\'\\\';\\\\n\\\\n$size = \\\'large\\\';\\\\nif (empty($value) && !empty($default))\\\\n    echo $default;\\\\nelseif (is_array($value) && !empty($value)) {\\\\n    if (isset($value[0]))\\\\n        $value = $value[0];\\\\n    if (is_array($value) && isset($value[\\\'ID\\\']))\\\\n        $value = $value[\\\'ID\\\'];\\\\n    if (!empty($value)) {\\\\n        $sized = image_downsize((int) $value,$size);\\\\n        if (is_array($sized) && isset($sized[0]))\\\\n            echo $sized[0];\\\\n        else\\\\n            echo $default;\\\\n    }\\\\n}\\\\nelseif (!empty($value))\\\\n    echo $value;\\\"}]}','yes'),(182,0,'_site_transient_timeout_theme_roots','1330126137','yes'),(183,0,'_site_transient_theme_roots','a:3:{s:9:\"omh-theme\";s:7:\"/themes\";s:12:\"twentyeleven\";s:7:\"/themes\";s:9:\"twentyten\";s:7:\"/themes\";}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod`
--

DROP TABLE IF EXISTS `wp_pod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod` (
  `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT,
  `tbl_row_id` bigint(15) unsigned DEFAULT NULL,
  `datatype` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author_id` bigint(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datatype_row_idx` (`datatype`,`tbl_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod`
--

LOCK TABLES `wp_pod` WRITE;
/*!40000 ALTER TABLE `wp_pod` DISABLE KEYS */;
INSERT INTO `wp_pod` VALUES (1,1,1,'PTSD Explorer','2012-02-23 13:27:26','2012-02-24 23:18:40',1),(3,1,4,'mission','2012-02-23 17:36:31','2012-02-23 22:36:31',1);
/*!40000 ALTER TABLE `wp_pod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_fields`
--

DROP TABLE IF EXISTS `wp_pod_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datatype` int(10) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `coltype` varchar(4) DEFAULT NULL,
  `pickval` varchar(32) DEFAULT NULL,
  `sister_field_id` int(10) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT '0',
  `display_helper` text,
  `input_helper` text,
  `pick_filter` text,
  `pick_orderby` text,
  `required` tinyint(4) DEFAULT NULL,
  `unique` tinyint(4) DEFAULT NULL,
  `multiple` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datatype_idx` (`datatype`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_fields`
--

LOCK TABLES `wp_pod_fields` WRITE;
/*!40000 ALTER TABLE `wp_pod_fields` DISABLE KEYS */;
INSERT INTO `wp_pod_fields` VALUES (1,1,'name','Name','','txt',NULL,NULL,0,NULL,NULL,NULL,NULL,1,NULL,NULL),(2,1,'slug','Permalink','Leave blank to auto-generate','slug',NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL),(3,1,'location','Location','','txt','',0,2,'','','','',0,0,0),(4,1,'image','Image','','file','',0,3,'','','','',0,0,0),(5,1,'description','Description','','desc','',0,4,'','','','',0,0,0),(6,1,'short_description','Short Description','','desc','',0,5,'','','','',0,0,0),(7,1,'start_date','Start Date','','date','',0,6,'','','','',0,0,0),(8,1,'end_date','End Date','','date','',0,7,'','','','',0,0,0),(9,1,'url','URL','','txt','',0,8,'','','','',0,0,0),(10,1,'featured','Is Featured','','bool','',0,9,'','','','',0,0,0),(13,3,'name','Name','','txt',NULL,NULL,0,NULL,NULL,NULL,NULL,1,NULL,NULL),(14,3,'slug','Permalink','Leave blank to auto-generate','slug',NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL),(15,4,'name','Name','','txt','',0,0,'','','','',1,1,0),(17,5,'name','Name','','txt',NULL,NULL,0,NULL,NULL,NULL,NULL,1,NULL,NULL),(18,5,'slug','Permalink','Leave blank to auto-generate','slug',NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL),(19,4,'html','HTML','','desc','',0,1,'','','','',1,0,0);
/*!40000 ALTER TABLE `wp_pod_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_helpers`
--

DROP TABLE IF EXISTS `wp_pod_helpers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_helpers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `helper_type` varchar(16) NOT NULL DEFAULT 'display',
  `phpcode` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_helpers`
--

LOCK TABLES `wp_pod_helpers` WRITE;
/*!40000 ALTER TABLE `wp_pod_helpers` DISABLE KEYS */;
INSERT INTO `wp_pod_helpers` VALUES (1,'showimages','display','<?php\n// verify this is an array\nif (is_array($value)) {\n  echo \'<ul class=\"thumbnails\">\';\n\n  // for the rel attribute, use a unique identifier based on the pod ID\n  $img_group = \'pod\' . $this->get_pod_id();\n\n  // loop through the array\n  foreach ($value as $img) {\n    echo \'<li>\';\n    echo \'<a href=\"\' . $img[\'guid\'] . \'\" title=\"\' . $img[\'post_name\'] . \'\" rel=\"\' . $img_group . \'\">\';\n    echo \'<img src=\"\' . wp_get_attachment_thumb_url($img[\'ID\']) . \'\" alt=\"\" />\';\n    echo \'</a>\';\n    echo \'</li>\';\n  }\n  echo \'</ul>\';\n}\n?>'),(2,'image/full','display','<?php\n// you can set a default image url to show\n// if no image was uploaded, below\n$default = \'\';\n\n$size = \'full\';\nif (empty($value) && !empty($default))\n    echo $default;\nelseif (is_array($value) && !empty($value)) {\n    if (isset($value[0]))\n        $value = $value[0];\n    if (is_array($value) && isset($value[\'guid\']))\n        $value = $value[\'guid\'];\n    if (!empty($value))\n        echo $value;\n}\nelseif (!empty($value))\n    echo $value;'),(3,'image/thumbnail','display','<?php\n// you can set a default image url to show\n// if no image was uploaded, below\n$default = \'\';\n\n$size = \'thumbnail\';\nif (empty($value) && !empty($default))\n    echo $default;\nelseif (is_array($value) && !empty($value)) {\n    if (isset($value[0]))\n        $value = $value[0];\n    if (is_array($value) && isset($value[\'ID\']))\n        $value = $value[\'ID\'];\n    if (!empty($value)) {\n        $sized = image_downsize((int) $value,$size);\n        if (is_array($sized) && isset($sized[0]))\n            echo $sized[0];\n        else\n            echo $default;\n    }\n}\nelseif (!empty($value))\n    echo $value;'),(4,'image/medium','display','<?php\n// you can set a default image url to show\n// if no image was uploaded, below\n$default = \'\';\n\n$size = \'medium\';\nif (empty($value) && !empty($default))\n    echo $default;\nelseif (is_array($value) && !empty($value)) {\n    if (isset($value[0]))\n        $value = $value[0];\n    if (is_array($value) && isset($value[\'ID\']))\n        $value = $value[\'ID\'];\n    if (!empty($value)) {\n        $sized = image_downsize((int) $value,$size);\n        if (is_array($sized) && isset($sized[0]))\n            echo $sized[0];\n        else\n            echo $default;\n    }\n}\nelseif (!empty($value))\n    echo $value;'),(5,'image/large','display','<?php\n// you can set a default image url to show\n// if no image was uploaded, below\n$default = \'\';\n\n$size = \'large\';\nif (empty($value) && !empty($default))\n    echo $default;\nelseif (is_array($value) && !empty($value)) {\n    if (isset($value[0]))\n        $value = $value[0];\n    if (is_array($value) && isset($value[\'ID\']))\n        $value = $value[\'ID\'];\n    if (!empty($value)) {\n        $sized = image_downsize((int) $value,$size);\n        if (is_array($sized) && isset($sized[0]))\n            echo $sized[0];\n        else\n            echo $default;\n    }\n}\nelseif (!empty($value))\n    echo $value;');
/*!40000 ALTER TABLE `wp_pod_helpers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_pages`
--

DROP TABLE IF EXISTS `wp_pod_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `phpcode` longtext,
  `precode` longtext,
  `page_template` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_pages`
--

LOCK TABLES `wp_pod_pages` WRITE;
/*!40000 ALTER TABLE `wp_pod_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pod_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_rel`
--

DROP TABLE IF EXISTS `wp_pod_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pod_id` bigint(15) unsigned DEFAULT NULL,
  `sister_pod_id` bigint(15) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `tbl_row_id` bigint(15) unsigned DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_pod_idx` (`field_id`,`pod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_rel`
--

LOCK TABLES `wp_pod_rel` WRITE;
/*!40000 ALTER TABLE `wp_pod_rel` DISABLE KEYS */;
INSERT INTO `wp_pod_rel` VALUES (9,1,NULL,4,40,0);
/*!40000 ALTER TABLE `wp_pod_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_tbl_app`
--

DROP TABLE IF EXISTS `wp_pod_tbl_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_tbl_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_tbl_app`
--

LOCK TABLES `wp_pod_tbl_app` WRITE;
/*!40000 ALTER TABLE `wp_pod_tbl_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pod_tbl_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_tbl_case_studies`
--

DROP TABLE IF EXISTS `wp_pod_tbl_case_studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_tbl_case_studies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_tbl_case_studies`
--

LOCK TABLES `wp_pod_tbl_case_studies` WRITE;
/*!40000 ALTER TABLE `wp_pod_tbl_case_studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pod_tbl_case_studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_tbl_page_fragment`
--

DROP TABLE IF EXISTS `wp_pod_tbl_page_fragment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_tbl_page_fragment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `html` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_tbl_page_fragment`
--

LOCK TABLES `wp_pod_tbl_page_fragment` WRITE;
/*!40000 ALTER TABLE `wp_pod_tbl_page_fragment` DISABLE KEYS */;
INSERT INTO `wp_pod_tbl_page_fragment` VALUES (1,'mission','<p><strong>Open mHealth’s</strong> mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.</p>');
/*!40000 ALTER TABLE `wp_pod_tbl_page_fragment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_tbl_project`
--

DROP TABLE IF EXISTS `wp_pod_tbl_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_tbl_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `description` longtext,
  `short_description` longtext,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_tbl_project`
--

LOCK TABLES `wp_pod_tbl_project` WRITE;
/*!40000 ALTER TABLE `wp_pod_tbl_project` DISABLE KEYS */;
INSERT INTO `wp_pod_tbl_project` VALUES (1,'PTSD Explorer','ptsd-explorer','San Fransisco','<p>Collaboration between Open MHealth and Veteran\'s Affairs. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero.</p>','<p>Collaboration between Open MHealth and Veteran\'s Affairs.</p>','2011-12-01 13:24:58','2012-05-31 13:24:58','http://mhealth.ideasphere.biz/ptsd/index.jsp',1);
/*!40000 ALTER TABLE `wp_pod_tbl_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_templates`
--

DROP TABLE IF EXISTS `wp_pod_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_templates`
--

LOCK TABLES `wp_pod_templates` WRITE;
/*!40000 ALTER TABLE `wp_pod_templates` DISABLE KEYS */;
INSERT INTO `wp_pod_templates` VALUES (1,'page_fragment_template','<div class=\"pageFragment {@name}\">\n  {@html}\n</div>'),(2,'project_widget_template','<div class=\'projectWidget\'>\n  <h2>Featured Project:</h2>\n  <div class=\'images\'>{@image, image/thumbnail}</div>\n  <div class=\'title\'>\n    {@name}\n  </div>\n  <div class=\'description\'>\n    {@description}\n  </div>\n</div>');
/*!40000 ALTER TABLE `wp_pod_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pod_types`
--

DROP TABLE IF EXISTS `wp_pod_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_pod_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `is_toplevel` tinyint(1) DEFAULT '0',
  `detail_page` varchar(128) DEFAULT NULL,
  `list_filters` text,
  `pre_save_helpers` text,
  `pre_drop_helpers` text,
  `post_save_helpers` text,
  `post_drop_helpers` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pod_types`
--

LOCK TABLES `wp_pod_types` WRITE;
/*!40000 ALTER TABLE `wp_pod_types` DISABLE KEYS */;
INSERT INTO `wp_pod_types` VALUES (1,'project','Projects',1,'project/{@slug}/',NULL,'','','',''),(3,'case_studies','Case Studies',1,'case-studies/{@slug}/',NULL,'','','',''),(4,'page_fragment','Page Fragments',1,'',NULL,'','','',''),(5,'app','App',1,'apps/{@slug}/',NULL,'','','','');
/*!40000 ALTER TABLE `wp_pod_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,4,'_wp_attached_file','2012/02/bwp-minify.zip'),(3,4,'_wp_attachment_context','upgrader'),(6,2,'_edit_lock','1330118909:1'),(7,2,'_edit_last','1'),(8,7,'_edit_last','1'),(9,7,'_edit_lock','1330004330:1'),(10,7,'_wp_page_template','default'),(11,9,'_edit_last','1'),(12,9,'_edit_lock','1330004278:1'),(13,9,'_wp_page_template','default'),(14,9,'_wp_trash_meta_status','publish'),(15,9,'_wp_trash_meta_time','1330018625'),(16,7,'_wp_trash_meta_status','publish'),(17,7,'_wp_trash_meta_time','1330018625'),(18,1,'_wp_trash_meta_status','publish'),(19,1,'_wp_trash_meta_time','1330018856'),(20,1,'_wp_trash_meta_comments_status','a:1:{i:1;s:1:\"1\";}'),(21,25,'_edit_last','1'),(22,25,'_edit_lock','1330108605:1'),(23,25,'_pingme','1'),(24,25,'_encloseme','1'),(27,33,'_menu_item_type','custom'),(28,33,'_menu_item_menu_item_parent','0'),(29,33,'_menu_item_object_id','33'),(30,33,'_menu_item_object','custom'),(31,33,'_menu_item_target',''),(32,33,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(33,33,'_menu_item_xfn',''),(34,33,'_menu_item_url','/learn'),(36,34,'_menu_item_type','custom'),(37,34,'_menu_item_menu_item_parent','0'),(38,34,'_menu_item_object_id','34'),(39,34,'_menu_item_object','custom'),(40,34,'_menu_item_target',''),(41,34,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(42,34,'_menu_item_xfn',''),(43,34,'_menu_item_url','http://discover'),(45,35,'_menu_item_type','custom'),(46,35,'_menu_item_menu_item_parent','0'),(47,35,'_menu_item_object_id','35'),(48,35,'_menu_item_object','custom'),(49,35,'_menu_item_target',''),(50,35,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(51,35,'_menu_item_xfn',''),(52,35,'_menu_item_url','http://get-involved'),(60,39,'_wp_attached_file','2012/02/ptsd1.png'),(61,39,'_wp_attachment_metadata','a:0:{}'),(62,40,'_wp_attached_file','2012/02/ptsd2.png'),(63,40,'_wp_attachment_metadata','a:0:{}'),(64,25,'_pingme','1'),(65,25,'_encloseme','1'),(66,25,'_pingme','1'),(67,25,'_encloseme','1'),(68,43,'_edit_last','1'),(69,43,'_edit_lock','1330108394:1'),(70,43,'_pingme','1'),(71,43,'_encloseme','1'),(72,45,'_edit_last','1'),(73,45,'_pingme','1'),(74,45,'_encloseme','1'),(75,45,'_edit_lock','1330108384:1'),(76,45,'_pingme','1'),(77,45,'_encloseme','1'),(78,43,'_pingme','1'),(79,43,'_encloseme','1'),(80,25,'_pingme','1'),(81,25,'_encloseme','1');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2012-02-23 12:24:56','2012-02-23 12:24:56','Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!','Hello world!','','trash','open','open','','hello-world','','','2012-02-23 17:40:56','2012-02-23 17:40:56','',0,'http://localhost/omh/?p=1',0,'post','',1),(2,1,'2012-02-23 12:24:56','2012-02-23 12:24:56','[pods name=\"page_fragment\" id=\"1\" template=\"page_fragment_template\"]\r\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','publish','closed','closed','','home','','','2012-02-24 19:47:25','2012-02-24 19:47:25','',0,'http://localhost/omh/?page_id=2',0,'page','',0),(3,1,'2012-02-23 12:25:28','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2012-02-23 12:25:28','0000-00-00 00:00:00','',0,'http://localhost/omh/?p=3',0,'post','',0),(4,1,'2012-02-23 12:51:30','2012-02-23 12:51:30','http://localhost/omh/wp-content/uploads/2012/02/bwp-minify.zip','bwp-minify.zip','','private','open','open','','bwp-minify-zip','','','2012-02-23 12:51:30','2012-02-23 12:51:30','',0,'http://localhost/omh/wp-content/uploads/2012/02/bwp-minify.zip',0,'attachment','',0),(6,1,'2012-02-23 12:24:56','2012-02-23 12:24:56','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickies to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/omh/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','inherit','open','open','','2-revision','','','2012-02-23 12:24:56','2012-02-23 12:24:56','',2,'http://localhost/omh/?p=6',0,'revision','',0),(7,1,'2012-02-23 13:35:06','2012-02-23 13:35:06','Empowering mobile health innovation through open source architecture.','Tag Line','','trash','open','open','','tag-line-10-words','','','2012-02-23 17:37:05','2012-02-23 17:37:05','',2,'http://localhost/omh/?page_id=7',0,'page','',0),(8,1,'2012-02-23 13:35:02','2012-02-23 13:35:02','Empowering mobile health innovation through open source architecture.','Tag Line  < 10 Words','','inherit','open','open','','7-revision','','','2012-02-23 13:35:02','2012-02-23 13:35:02','',7,'http://localhost/omh/?p=8',0,'revision','',0),(9,1,'2012-02-23 13:36:59','2012-02-23 13:36:59','<strong>Open mHealth\'s</strong> mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.','Mission Statement','','trash','open','open','','mission-statement-25-words','','','2012-02-23 17:37:05','2012-02-23 17:37:05','',2,'http://localhost/omh/?page_id=9',0,'page','',0),(10,1,'2012-02-23 13:36:18','2012-02-23 13:36:18','Open mHealth\'s mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.','Mission Statement','','inherit','open','open','','9-revision','','','2012-02-23 13:36:18','2012-02-23 13:36:18','',9,'http://localhost/omh/?p=10',0,'revision','',0),(11,1,'2012-02-23 13:36:59','2012-02-23 13:36:59','<strong>Open mHealth\'s</strong> mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.','Mission Statement ~25 Words','','inherit','open','open','','9-revision-2','','','2012-02-23 13:36:59','2012-02-23 13:36:59','',9,'http://localhost/omh/?p=11',0,'revision','',0),(12,1,'2012-02-23 13:37:05','2012-02-23 13:37:05','<strong>Open mHealth\'s</strong> mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.','Mission Statement ~25 Words','','inherit','open','open','','9-revision-3','','','2012-02-23 13:37:05','2012-02-23 13:37:05','',9,'http://localhost/omh/?p=12',0,'revision','',0),(13,1,'2012-02-23 13:35:06','2012-02-23 13:35:06','Empowering mobile health innovation through open source architecture.','Tag Line  < 10 Words','','inherit','open','open','','7-revision-2','','','2012-02-23 13:35:06','2012-02-23 13:35:06','',7,'http://localhost/omh/?p=13',0,'revision','',0),(14,1,'2012-02-23 13:39:50','2012-02-23 13:39:50','<strong>Open mHealth\'s</strong> mission is to tip the current mHealth ecosystem towards greater openness, integration, and evidence in order to improve both individual and public health outcomes.','Mission Statement','','inherit','open','open','','9-revision-4','','','2012-02-23 13:39:50','2012-02-23 13:39:50','',9,'http://localhost/omh/?p=14',0,'revision','',0),(15,1,'2012-02-23 13:40:13','2012-02-23 13:40:13','Empowering mobile health innovation through open source architecture.','Tag Line','','inherit','open','open','','7-revision-3','','','2012-02-23 13:40:13','2012-02-23 13:40:13','',7,'http://localhost/omh/?p=15',0,'revision','',0),(16,1,'2012-02-23 13:30:25','2012-02-23 13:30:25','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickies to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href=\"http://localhost/omh/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Home','','inherit','open','open','','2-revision-2','','','2012-02-23 13:30:25','2012-02-23 13:30:25','',2,'http://localhost/omh/?p=16',0,'revision','',0),(17,1,'2012-02-23 17:38:00','2012-02-23 17:38:00','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-3','','','2012-02-23 17:38:00','2012-02-23 17:38:00','',2,'http://localhost/omh/?p=17',0,'revision','',0),(18,1,'2012-02-23 12:24:56','2012-02-23 12:24:56','Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!','Hello world!','','inherit','open','open','','1-revision','','','2012-02-23 12:24:56','2012-02-23 12:24:56','',1,'http://localhost/omh/1-revision/',0,'revision','',0),(19,1,'2012-02-23 17:38:30','2012-02-23 17:38:30','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-4','','','2012-02-23 17:38:30','2012-02-23 17:38:30','',2,'http://localhost/omh/2-revision-4/',0,'revision','',0),(20,1,'2012-02-23 17:41:09','2012-02-23 17:41:09','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-5','','','2012-02-23 17:41:09','2012-02-23 17:41:09','',2,'http://localhost/omh/2-revision-5/',0,'revision','',0),(21,1,'2012-02-23 17:41:30','2012-02-23 17:41:30','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-6','','','2012-02-23 17:41:30','2012-02-23 17:41:30','',2,'http://localhost/omh/2-revision-6/',0,'revision','',0),(22,1,'2012-02-23 17:41:50','2012-02-23 17:41:50','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-7','','','2012-02-23 17:41:50','2012-02-23 17:41:50','',2,'http://localhost/omh/2-revision-7/',0,'revision','',0),(23,1,'2012-02-23 17:42:03','2012-02-23 17:42:03','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-8','','','2012-02-23 17:42:03','2012-02-23 17:42:03','',2,'http://localhost/omh/?p=23',0,'revision','',0),(24,1,'2012-02-23 17:43:26','2012-02-23 17:43:26','[pods name=\"page_fragment\" order=\"t.id DESC\" limit=\"10\"]','Home','','inherit','open','open','','2-revision-9','','','2012-02-23 17:43:26','2012-02-23 17:43:26','',2,'http://localhost/omh/?p=24',0,'revision','',0),(25,1,'2012-02-23 17:45:09','2012-02-23 17:45:09','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Oldest Post','','publish','open','open','','first-post','','','2012-02-24 18:33:21','2012-02-24 18:33:21','',0,'http://localhost/omh/?p=25',0,'post','',0),(26,1,'2012-02-23 17:44:58','2012-02-23 17:44:58','','Auto Draft','','inherit','open','open','','25-revision','','','2012-02-23 17:44:58','2012-02-23 17:44:58','',25,'http://localhost/omh/?p=26',0,'revision','',0),(27,1,'2012-02-23 17:45:06','2012-02-23 17:45:06','','First Post','','inherit','open','open','','25-revision-2','','','2012-02-23 17:45:06','2012-02-23 17:45:06','',25,'http://localhost/omh/?p=27',0,'revision','',0),(28,1,'2012-02-23 17:44:11','2012-02-23 17:44:11','[pods name=\"page_fragment\"]','Home','','inherit','open','open','','2-revision-10','','','2012-02-23 17:44:11','2012-02-23 17:44:11','',2,'http://localhost/omh/?p=28',0,'revision','',0),(29,1,'2012-02-23 17:46:56','2012-02-23 17:46:56','[pods name=\"page_fragment\"]','Home','','inherit','open','open','','2-revision-11','','','2012-02-23 17:46:56','2012-02-23 17:46:56','',2,'http://localhost/omh/?p=29',0,'revision','',0),(30,1,'2012-02-24 19:48:26','2012-02-24 19:48:26','[pods name=\"page_fragment\" id=\"1\" template=\"page_fragment_template\"]\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\n\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\n\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-autosave','','','2012-02-24 19:48:26','2012-02-24 19:48:26','',2,'http://localhost/omh/?p=30',0,'revision','',0),(32,1,'2012-02-24 18:21:45','2012-02-24 18:21:45','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','First Post','','inherit','open','open','','25-autosave','','','2012-02-24 18:21:45','2012-02-24 18:21:45','',25,'http://localhost/omh/?p=32',0,'revision','',0),(33,1,'2012-02-23 18:37:59','2012-02-23 18:37:59','','Learn','','publish','open','open','','learn','','','2012-02-23 18:37:59','2012-02-23 18:37:59','',0,'http://localhost/omh/?p=33',1,'nav_menu_item','',0),(34,1,'2012-02-23 18:37:59','2012-02-23 18:37:59','','Discover','','publish','open','open','','discover','','','2012-02-23 18:37:59','2012-02-23 18:37:59','',0,'http://localhost/omh/?p=34',3,'nav_menu_item','',0),(35,1,'2012-02-23 18:37:59','2012-02-23 18:37:59','','Get Involved','','publish','open','open','','get-involved','','','2012-02-23 18:37:59','2012-02-23 18:37:59','',0,'http://localhost/omh/?p=35',2,'nav_menu_item','',0),(39,1,'2012-02-24 17:10:24','2012-02-24 17:10:24','','ptsd','','inherit','open','open','','ptsd','','','2012-02-24 17:10:24','2012-02-24 17:10:24','',0,'http://localhost/wp-content/uploads/2012/02/ptsd1.png',0,'attachment','image/png',0),(40,1,'2012-02-24 17:11:27','2012-02-24 17:11:27','','ptsd','','inherit','open','open','','ptsd-2','','','2012-02-24 17:11:27','2012-02-24 17:11:27','',0,'http://localhost/wp-content/uploads/2012/02/ptsd2.png',0,'attachment','image/png',0),(41,1,'2012-02-23 17:45:09','2012-02-23 17:45:09','[pods name=\"page_fragment\"]','First Post','','inherit','open','open','','25-revision-3','','','2012-02-23 17:45:09','2012-02-23 17:45:09','',25,'http://localhost/?p=41',0,'revision','',0),(42,1,'2012-02-24 18:15:08','2012-02-24 18:15:08','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','First Post','','inherit','open','open','','25-revision-4','','','2012-02-24 18:15:08','2012-02-24 18:15:08','',25,'http://localhost/?p=42',0,'revision','',0),(43,1,'2012-02-24 18:32:15','2012-02-24 18:32:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Old Post','','publish','open','open','','second-post','','','2012-02-24 18:33:14','2012-02-24 18:33:14','',0,'http://localhost/?p=43',0,'post','',0),(44,1,'2012-02-24 18:32:09','2012-02-24 18:32:09','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Second Post','','inherit','open','open','','43-revision','','','2012-02-24 18:32:09','2012-02-24 18:32:09','',43,'http://localhost/?p=44',0,'revision','',0),(45,1,'2012-02-24 18:32:32','2012-02-24 18:32:32','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Newest Post','','publish','open','open','','third-post','','','2012-02-24 18:33:04','2012-02-24 18:33:04','',0,'http://localhost/?p=45',0,'post','',0),(46,1,'2012-02-24 18:32:25','2012-02-24 18:32:25','','Auto Draft','','inherit','open','open','','45-revision','','','2012-02-24 18:32:25','2012-02-24 18:32:25','',45,'http://localhost/?p=46',0,'revision','',0),(47,1,'2012-02-24 18:32:32','2012-02-24 18:32:32','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Third Post','','inherit','open','open','','45-revision-2','','','2012-02-24 18:32:32','2012-02-24 18:32:32','',45,'http://localhost/?p=47',0,'revision','',0),(48,1,'2012-02-24 18:32:15','2012-02-24 18:32:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','Second Post','','inherit','open','open','','43-revision-2','','','2012-02-24 18:32:15','2012-02-24 18:32:15','',43,'http://localhost/?p=48',0,'revision','',0),(49,1,'2012-02-24 18:20:44','2012-02-24 18:20:44','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra erat libero, a consequat erat. Aliquam suscipit mi at ante tincidunt posuere. Sed eget placerat libero. Maecenas varius odio ut metus semper quis mattis enim.','First Post','','inherit','open','open','','25-revision-5','','','2012-02-24 18:20:44','2012-02-24 18:20:44','',25,'http://localhost/?p=49',0,'revision','',0),(50,1,'2012-02-23 17:49:22','2012-02-23 17:49:22','[pods name=\"page_fragment\" template=\"page_fragment_template\"]','Home','','inherit','open','open','','2-revision-12','','','2012-02-23 17:49:22','2012-02-23 17:49:22','',2,'http://localhost/?p=50',0,'revision','',0),(51,1,'2012-02-24 18:37:44','2012-02-24 18:37:44','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-13','','','2012-02-24 18:37:44','2012-02-24 18:37:44','',2,'http://localhost/?p=51',0,'revision','',0),(52,1,'2012-02-24 18:53:01','2012-02-24 18:53:01','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-14','','','2012-02-24 18:53:01','2012-02-24 18:53:01','',2,'http://localhost/?p=52',0,'revision','',0),(53,1,'2012-02-24 19:42:19','2012-02-24 19:42:19','[podsname=\"page_fragment\" slug=\"mission\" limit=\"1\" template=\"page_fragment_template\"]\r\n\r\n<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</p>\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-15','','','2012-02-24 19:42:19','2012-02-24 19:42:19','',2,'http://localhost/?p=53',0,'revision','',0),(54,1,'2012-02-24 19:42:55','2012-02-24 19:42:55','[podsname=\"page_fragment\" slug=\"mission\" limit=\"1\" template=\"page_fragment_template\"]\r\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-16','','','2012-02-24 19:42:55','2012-02-24 19:42:55','',2,'http://localhost/?p=54',0,'revision','',0),(55,1,'2012-02-24 19:43:25','2012-02-24 19:43:25','[pods name=\"page_fragment\" slug=\"mission\" limit=\"1\" template=\"page_fragment_template\"]\r\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-17','','','2012-02-24 19:43:25','2012-02-24 19:43:25','',2,'http://localhost/?p=55',0,'revision','',0),(56,1,'2012-02-24 19:43:53','2012-02-24 19:43:53','[pods name=\"page_fragment\" slug=\"mission\" template=\"page_fragment_template\"]\r\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-18','','','2012-02-24 19:43:53','2012-02-24 19:43:53','',2,'http://localhost/?p=56',0,'revision','',0),(57,1,'2012-02-24 19:46:42','2012-02-24 19:46:42','[pods name=\"page_fragment\" id=\"2\" template=\"page_fragment_template\"]\r\n<span style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed neque sem, id tempus quam. Vivamus pretium nisl nec libero rhoncus facilisis. Duis consectetur viverra sapien, vel sagittis nisl faucibus non. Nullam et imperdiet elit. Nulla facilisi. Maecenas posuere tortor sit amet purus venenatis sit amet pulvinar mauris iaculis. Fusce at turpis eu libero cursus dictum. Ut venenatis arcu nec elit placerat in convallis mi tempus. Vivamus consectetur lectus eu ipsum interdum at malesuada felis imperdiet. Sed quis urna est, sed blandit nibh. Suspendisse fermentum elementum elit at gravida. Nam vel nulla elit. Pellentesque gravida, tellus et gravida aliquet, nibh tellus convallis lorem, vel lacinia velit purus sit amet neque. Aenean sed dui tellus.</span>\r\n\r\nAenean pharetra, justo interdum blandit iaculis, justo dolor iaculis nulla, sed pharetra augue dolor vel nisi. Nunc sapien risus, placerat in pharetra in, pretium eu erat. Suspendisse vulputate tempor bibendum. Quisque et mi odio. Vivamus elit turpis, interdum id pellentesque semper, semper eu augue. Donec pellentesque risus eget dolor ullamcorper tristique. Ut quis justo ornare magna accumsan porttitor. Sed varius nibh non mauris tincidunt rutrum. In aliquet ultrices aliquam. Aliquam vel consectetur velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac neque eros. Nunc ullamcorper sodales lorem, non ultrices risus convallis a. Proin bibendum purus in dui luctus at consectetur eros lobortis. Suspendisse elit orci, consectetur id adipiscing eu, fringilla ut felis. Sed eros tortor, tincidunt in tristique aliquam, rutrum eu metus.\r\n\r\nMauris leo diam, consectetur dignissim pretium consequat, suscipit rutrum mauris. Donec semper nulla ac libero porta aliquam. Aenean sem felis, consequat in consequat a, consectetur a arcu. Ut nec lorem in erat molestie luctus nec ac ipsum. Suspendisse eleifend vulputate consequat. Sed turpis eros, lobortis blandit dignissim ut, rutrum sed nisl. Praesent aliquet dui porta tellus bibendum sodales sagittis enim dictum. Ut vestibulum velit aliquam libero malesuada placerat. Donec ultrices urna sed orci facilisis quis laoreet ipsum dapibus. Nulla facilisi. Morbi non arcu eget est posuere pellentesque. Morbi porta risus dolor. Quisque eros risus, lobortis eu iaculis in, gravida et quam. Duis justo enim, laoreet vel consequat sed, faucibus nec nibh.','Home','','inherit','open','open','','2-revision-19','','','2012-02-24 19:46:42','2012-02-24 19:46:42','',2,'http://localhost/?p=57',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(1,2,0),(2,2,0),(3,2,0),(4,2,0),(5,2,0),(6,2,0),(7,2,0),(25,1,0),(33,3,0),(34,3,0),(35,3,0),(43,1,0),(45,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,3),(2,2,'link_category','',0,7),(3,3,'nav_menu','',0,3);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'Blogroll','blogroll',0),(3,'Main Menu','main-menu',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";s:1:\"1\";}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers','wp330_toolbar,wp330_media_uploader,wp330_saving_widgets'),(13,1,'show_welcome_panel','1'),(14,1,'wp_dashboard_quick_press_last_post_id','3'),(15,1,'wp_user-settings','hidetb=1&editor=tinymce'),(16,1,'wp_user-settings-time','1330112570'),(17,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),(18,1,'metaboxhidden_nav-menus','a:2:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";}'),(19,1,'nav_menu_recently_edited','3');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$BcCF3qHv/62WpXk1mEN8clLB7xu.ZU.','admin','admin@openmhealth.org','','2012-02-23 12:24:55','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-24 16:42:12
