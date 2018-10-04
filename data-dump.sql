-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: wishlist_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology'),(2,'Clothes'),(3,'Sports'),(4,'Home Improvement'),(5,'Other');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `wishlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_id` (`wishlist_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Gleb Ganin','gleb@trilogy.edu','0.307692307','Burlingame,CA'),(2,'Esteban','esteband@trilogy.edu','0.346153846','San Leandro,CA'),(3,'Stephanie','stephanie@trilogy.edu','0.076923076','San Francisco,CA'),(4,'Alisa Keenan','alisa@trilogy.edu','0.037037037','Burlingame ,CA'),(5,'James Warren','james@trilogy.edu','0.037037037','West Hollywood ,CA'),(6,'Daniel Kolb','daniel@trilogy.edu','0.037037037','San Mateo ,CA'),(7,'steve fox','ddd@ddd.com','01/01/01','San Francisco'),(8,'taylor smith','aaa@aaa.com','1/1/1','Chicago'),(9,'tim rod','bbb@bbb.com','1/1/1','New York'),(11,'josh','ccc@ccc.com','1/1/1','San Francisco'),(12,'josh','aaa@ccc.com','1/1/1','San Francisco'),(14,'adam smith','abc@abc.com','1/1/1','San Francisco'),(15,'omar','rsfsd','1/1/1','San Francisco'),(16,'steven','berkeley@gmail.com','01/01/01','San Francisco');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `item_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1,'Cannon Camera','Technology','www.amazon.com/cannon','www.amazon.com',599.99),(2,1,'Fishing Pole','Sports','www.amazon.com/fishing','www.amazon.com',99.99),(3,1,'Cologne','Other','www.amazon.com/cologe','www.amazon.com',59.99),(4,1,'Kayak','Outdoors','www.amazon.com/kayaks','www.amazon.com',899.99),(5,1,'Motiv Ring','Technology','www.amazon.com/fitnesstrackers','www.amazon.com',199.99),(6,1,'Thule Storage Box','Sports','www.amazon.com/car/accesories','www.amazon.com',299.99),(7,1,'Sun Glasses','Other','www.amazon.com/glasses','www.amazon.com',199.99),(8,2,'Cannon Camera','Technology','www.amazon.com/cannon','www.amazon.com',599.99),(9,2,'Fishing Pole','Sports','www.amazon.com/fishing','www.amazon.com',99.99),(10,2,'Cologne','Other','www.amazon.com/cologe','www.amazon.com',59.99),(11,2,'Kayak','Outdoors','www.amazon.com/kayaks','www.amazon.com',899.99),(12,2,'Motiv Ring','Technology','www.amazon.com/fitnesstrackers','www.amazon.com',299.99),(13,2,'Thule Storage Box','Sports','www.amazon.com/car/accesories','www.amazon.com',299.99),(14,2,'Sun Glasses','Other','www.amazon.com/glasses','www.amazon.com',199.99),(15,3,'Cannon Camera','Technology','www.amazon.com/cannon','www.amazon.com',599.99),(16,3,'Fishing Pole','Sports','www.amazon.com/fishing','www.amazon.com',99.99),(17,3,'Cologne','Other','www.amazon.com/cologe','www.amazon.com',59.99),(18,3,'Kayak','Outdoors','www.amazon.com/kayaks','www.amazon.com',899.99),(19,3,'Motiv Ring','Technology','www.amazon.com/fitnesstrackers','www.amazon.com',299.99),(20,3,'Thule Storage Box','Sports','www.amazon.com/car/accesories','www.amazon.com',299.99),(21,3,'Sun Glasses','Other','www.amazon.com/glasses','www.amazon.com',199.99),(22,2,'playstation','Technology','playstation.com','playstation.com',399.99),(23,2,'shoes','Clothes','www.amazon.com','www.amazon.com',59.99),(24,1,'phone','Technology','www.amazon.com','www.amazon.com',699.99),(25,7,'playstation','Technology','playstation.com','playstation.com',399.99),(26,8,'playstation','Technology','playstation.com','playstation.com',399.99),(27,8,'shoes','Technology','www.amazon.com','www.amazon.com',699.99),(28,8,'shoes','Clothes','www.amazon.com','www.amazon.com',59.99),(29,2,'playstation','Technology','www.playstation.com','playstation.com',399.99),(31,2,'shoes','Clothes','www.amazon.com','www.amazon.com',59.99),(33,16,'playstation','Technology','www.playstation.com','www.amazon.com',699.99);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_categories`
--

DROP TABLE IF EXISTS `wishlist_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wishlist_categories` (
  `wishlist_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `wishlist_id` (`wishlist_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `wishlist_categories_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `users` (`id`),
  CONSTRAINT `wishlist_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_categories`
--

LOCK TABLES `wishlist_categories` WRITE;
/*!40000 ALTER TABLE `wishlist_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-27 17:00:52
