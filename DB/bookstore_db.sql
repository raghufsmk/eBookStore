CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_author`
--

DROP TABLE IF EXISTS `tbl_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_author`
--

LOCK TABLES `tbl_author` WRITE;
/*!40000 ALTER TABLE `tbl_author` DISABLE KEYS */;
INSERT INTO `tbl_author` VALUES (1,'Khuswant Singh',NULL),(2,'Nirad C Chaudhary',NULL),(3,'Mulk Raj Anand',NULL),(4,'RK Narayan',NULL),(5,'Raja Rao',NULL),(6,'Anita Desai',NULL),(7,'Nayantara Sehgal',NULL),(8,'Nirad C Chaudhari',NULL),(9,'Salman Rushdie',NULL),(10,'Vikram Seth',NULL),(11,'Amitav Ghosh',NULL),(12,'Arundhati Roy',NULL),(13,'Jhumpa Lahiri',NULL),(14,'Kiran Desai',NULL),(15,'Upmanyu Chatterjee',NULL),(16,'Arvind Adiga',NULL),(17,'Kishwar Desai',NULL),(18,'Jeet Thayil',NULL),(19,'Cyrus Mistry',NULL),(20,'Anuradha Roy',NULL),(21,'Neel Mukherjee',NULL),(22,'Mitch Albom',NULL),(23,'Daniel James Brown',NULL),(24,'Audrey Niffenegger',NULL),(25,'Charles Freeman',NULL),(26,'Thomas de Wesselow',NULL),(27,'Arthur Benjamin',NULL),(28,'Michael M. Woolfson',NULL),(29,'Harper Lee',NULL),(31,'William Shakespeare',NULL),(32,'William Golding',NULL),(33,'John Steinbeck',NULL),(34,'Malcolm Gladwell',NULL),(37,'Daniel Kahneman',NULL),(38,'Lauren Groff',NULL),(39,'Ta-Nehisi Coates',NULL),(40,'Melissa Guion',NULL),(41,'Benjamin Graham',NULL),(42,'Peter Lynch',NULL),(43,'Stacy Schiff',NULL),(44,'Janet Evanovich',NULL),(45,'Thug Kitchen',NULL),(46,'The RAND Corporation',NULL),(47,'David Dubowski',NULL),(48,'Graham Johnson',NULL),(49,'Meghan Doherty',NULL),(50,'Theo Nicole Lorenz',NULL);
/*!40000 ALTER TABLE `tbl_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_book` (
  `author_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `isbn` bigint(20) NOT NULL,
  `publish_year` date DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `available_copies` int(11) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `tbl_book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `tbl_author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (41,'English','HarperBusiness',13.25,97800605556,'2015-12-12','Finance','Paperback','Business & Money',4,'HarperBusiness','The Intelligent Investor: The Definitive Book','/assets/coverimages/5345664.jpg'),(29,'English','Harper',15,97800624098,'2015-12-12','Literature','Hardcover','Classics , Atticus , Scott',10,'Harper','Go Set a Watchman: A Novel','/assets/coverimages/76809.jpg'),(33,'English','Penguin Books',7,97801401773,'1993-12-12','Literature','Paperback','Classics',8,'Penguin Books','Of Mice and Men','/assets/coverimages/76809.jpg'),(23,'English','Penguin Books',9.49,97801431254,'2014-12-12','Sports & Outdoors','Paperback','Canoeing',3,'Penguin Books','The Boys in the Boat: Nine Americans and Their Epic Quest for Gold at the 1936 Berlin Olympics','/assets/coverimages/76809.jpg'),(34,'English','Little, Brown and Company',12.42,97803160179,'2008-12-12','Psychology','Hardcover','Success',5,'Little, Brown and Company','Outliers: The Story of Success','/assets/coverimages/76809.jpg'),(43,'English','Little, Brown and Company',17.6,97803162006,'2015-12-12','State & Local','Hardcover','Witchcraft',9,'Little, Brown and Company','The Witches: Salem, 1692','/assets/coverimages/76809.jpg'),(34,'English','Little, Brown and Company',17.25,97803162043,'2013-12-12','Psychology','Hardcover','Success, Underdog',3,'Little, Brown and Company','David and Goliath: Underdogs, Misfits, and the Art of Battling Giants','/assets/coverimages/76809.jpg'),(34,'English','Back Bay Books',12.55,97803163466,'2002-12-12','Business, Psychology','Paperback','Marketing',2,'Back Bay Books','The Tipping Point: How Little Things Can Make a Big Difference','/assets/coverimages/76809.jpg'),(44,'English','Bantam',15.1,97803455429,'2015-12-12','Mystery','Hardcover','Women Sleuths',5,'Bantam','Tricky Twenty-Two: A Stephanie Plum Novel','/assets/coverimages/76809.jpg'),(40,'English','Philomel Books',6.99,97803991755,'2015-12-12','Humor','Hardcover','Children\"s Books',5,'Philomel Books','Baby Penguins Love their Mama','/assets/coverimages/76809.jpg'),(32,'English','Perigee Books',6.2,97803995014,'2003-12-12','Literature','Paperback','Classics',2,'Perigee Books','Lord of the Flies','/assets/coverimages/76809.jpg'),(48,'English','Perigee Books',9.95,97803995364,'2011-12-12','Love, Sex & Marriage','Paperback','Humor',6,'Perigee Books','Images You Should Not Masturbate To','/assets/coverimages/76809.jpg'),(29,'English','Harper',5.15,97804463107,'1988-12-12','Literature','Paperback','Classics, Atticus, Scott',2,'Harper','To Kill a Mockingbird','/assets/coverimages/76809.jpg'),(26,'English','Plume',12,97804522990,'2012-10-16','History','Hardcover','Christian',4,'Plume','The Sign: The Shroud of Turin and the Secret of the Resurrection','/assets/coverimages/76809.jpg'),(27,'English','Basic Books',14.84,97804650547,'2015-12-12','History','Hardcover','Mathematics',2,'Basic Books','The Magic of Math: Solving for x and Figuring Out Why','/assets/coverimages/76809.jpg'),(42,'English','Simon & Schuster',9.55,97807432004,'2000-12-12','Professionals & Academics','Paperback','Business',6,'Simon & Schuster','One Up On Wall Street','/assets/coverimages/76809.jpg'),(31,'English','Simon & Schuster',3.68,97807434771,'2004-12-12','Literature','Paperback','Classics, Plays',2,'Simon & Schuster','Romeo and Juliet (Folger Shakespeare Library','/assets/coverimages/76809.jpg'),(39,'English','Spiegel & Grau',14.4,97808129935,'2015-12-12','Memoirs','Hardcover','Biographies & Memoirs',6,'Spiegel & Grau','Between the World and Me','/assets/coverimages/76809.jpg'),(46,'English','American Book Publishers',54.18,97808330304,'2001-12-12','Probability & Statistics','Hardcover','Mathematics',1,'American Book Publishers','A Million Random Digits with 100,000 Normal Deviates','/assets/coverimages/76809.jpg'),(25,'English','Vintage',13.32,97814000338,'2005-12-12','Religion','Paperback','Culture',4,'Vintage','The Closing of the Western Mind: The Rise of Faith and the Fall of Reason','/assets/coverimages/76809.jpg'),(22,'English','Hachette Books',8.42,97814013128,'2013-12-12','Religion','Paperback','Time, Christian',5,'Hachette Books','The Time Keeper','/assets/coverimages/76809.jpg'),(47,'English','CreateSpace Independent Publishing Platform',15.95,97814610025,'2011-12-12','Probability & Statistics','Hardcover','Mathematics',8,'CreateSpace Independent Publishing Platform','A Million Random Digits THE SEQUEL: with Perfectly Uniform Distribution','/assets/coverimages/76809.jpg'),(24,'English','Scribner',14.28,97814767648,'2004-12-12','Science Fiction','Paperback','Time Travel',6,'Scribner','The Time Traveler\"s Wife','/assets/coverimages/76809.jpg'),(50,'English','CreateSpace Independent Publishing Platform',6.99,97814774685,'2015-12-12','Cold Truth','Paperback','Humor',6,'CreateSpace Independent Publishing Platform','Unicorns Are Jerks: a coloring book exposing the cold, hard, sparkly truth','/assets/coverimages/76809.jpg'),(38,'English','Riverhead Books',16.77,97815946344,'2015-12-12','Family Life','Hardcover','tragedy',6,'Riverhead Books','Fates and Furies: A Novel','/assets/coverimages/76809.jpg'),(45,'English','Rodale Books',15.59,97816233663,'2015-12-12','Entertaining & Holidays','Hardcover','Party Planning',3,'Rodale Books','Thug Kitchen Party Grub: For Social Motherf*ckers','/assets/coverimages/76809.jpg'),(28,'English','World Scientific Publishing Company',83.05,97818481627,'2009-12-12','Science','Paperback','Cosmology',4,'World Scientific Publishing Company','Time Space, Stars & Man: The Story of the Big Bang','/assets/coverimages/76809.jpg'),(49,'English','Zest Books',12.89,97819369760,'2013-12-12','Social Issues','Hardcover','Teens',2,'Zest Books','How Not to Be a Dick: An Everyday Etiquette Guide','/assets/coverimages/76809.jpg');
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile_no` int(11) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1001,'Raghu','N','raghun','root123','raghu.n@gmail.com',12345,'35th Main, 4A Cross','Bangalore','Karnataka','India',560076);
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_details`
--

DROP TABLE IF EXISTS `tbl_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_order_details` (
  `order_id` int(11) NOT NULL,
  `isbn` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ship_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`,`isbn`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `tbl_book` (`isbn`),
  CONSTRAINT `tbl_order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_details`
--

LOCK TABLES `tbl_order_details` WRITE;
/*!40000 ALTER TABLE `tbl_order_details` DISABLE KEYS */;
INSERT INTO `tbl_order_details` VALUES (4,97800605556,1,NULL),(4,97803160179,1,NULL),(4,97803163466,2,NULL),(4,97803455429,1,NULL),(4,97807434771,1,NULL),(4,97808129935,1,NULL),(4,97814774685,1,NULL),(4,97818481627,1,NULL);
/*!40000 ALTER TABLE `tbl_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `ship_date` datetime DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `order_status` varchar(40) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `tbl_orders_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `tbl_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders`
--

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;
INSERT INTO `tbl_orders` VALUES (1,'2013-12-12 00:00:00',NULL,1001,'placed_order',NULL,NULL),(2,'0001-01-01 00:00:00',NULL,1001,'placed',NULL,NULL),(3,'0001-01-01 00:00:00',NULL,1001,'placed',NULL,NULL),(4,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(5,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(6,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(10,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(11,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(12,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(13,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(14,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(15,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(16,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(17,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(18,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(19,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(20,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(21,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(22,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(23,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(24,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL),(25,'2019-03-21 00:00:00',NULL,1001,'placed',NULL,NULL);
/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-22  0:06:02
