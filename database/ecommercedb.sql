-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_type` enum('BILLING','BOTH','SHIPPING') NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `is_default` bit(1) DEFAULT NULL,
  `postal_code` varchar(20) NOT NULL,
  `state` varchar(100) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1fa36y2oqhao3wgg2rw1pi459` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'SHIPPING','Gasabo District, Kigali','Rwanda',_binary '','00000','Kigali','kg689st',2);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `price` decimal(38,2) NOT NULL,
  `quantity` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `status` enum('ABANDONED','ACTIVE','CONVERTED') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb5o626f86h46m4s7ms6ginnop` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2025-05-20 14:34:59.990389','ACTIVE','2025-05-20 14:34:59.990414',1),(2,'2025-05-20 15:27:46.115453','ACTIVE','2025-05-20 15:27:46.115485',2);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Dive into worlds of imagination with our carefully curated fiction collection','https://images.unsplash.com/photo-1544947950-fa07a98d237f','Fiction',NULL),(6,'Expand your knowledge with our expertly selected non-fiction titles','https://images.unsplash.com/photo-1461360370896-922624d12aa1','Non-Fiction',NULL),(7,'Inspire young minds with our engaging children\'s literature','https://images.unsplash.com/photo-1633477189729-9290b3261d0a','Children\'s Books',NULL),(8,'Enhance your reading experience with premium accessories','https://images.unsplash.com/photo-1610116306796-6fea9f4fae38','Book Accessories',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(38,2) NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,17.50,2,1,201),(2,36.00,1,1,202);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billing_address` text NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `shipping_address` text NOT NULL,
  `status` enum('CANCELLED','DELIVERED','PENDING','PROCESSING','SHIPPED') NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'kg689st, Gasabo District, Kigali, Kigali 00000, Rwanda','2025-05-20 15:58:32.035983','Credit Card','kg689st, Gasabo District, Kigali, Kigali 00000, Rwanda','PENDING',71.00,'2025-05-20 15:58:32.035983',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_order` int DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` bit(1) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,0,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '',1001),(2,1,'https://images.unsplash.com/photo-1629992101753-56d196c8aabb',_binary '\0',1001),(3,0,'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf',_binary '',1002),(4,0,'https://images.unsplash.com/photo-1531072901881-d644216d4bf9',_binary '',1003),(5,0,'https://images.unsplash.com/photo-1474366521946-c3d4b507abf2',_binary '',1004),(6,0,'https://images.unsplash.com/photo-1589998059171-988d887df646',_binary '',2001),(7,1,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '\0',2001),(8,0,'https://images.unsplash.com/photo-1461360370896-922624d12aa1',_binary '',2002),(9,0,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '',2003),(10,0,'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8',_binary '',2004),(11,0,'https://images.unsplash.com/photo-1512820790803-83ca734da794',_binary '',3001),(12,0,'https://images.unsplash.com/photo-1629992101753-56d196c8aabb',_binary '',3002),(13,0,'https://images.unsplash.com/photo-1633477189729-9290b3261d0a',_binary '',3003),(14,0,'https://images.unsplash.com/photo-1512436991641-6745cdb1723f',_binary '',3004),(15,0,'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38',_binary '',4001),(16,0,'https://images.unsplash.com/photo-1598901865264-4f18cac7e204',_binary '',4002),(17,0,'https://images.unsplash.com/photo-1589998059171-988d887df646',_binary '',4003),(18,0,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '',4004),(19,0,'https://images.unsplash.com/photo-1512820790803-83ca734da794',_binary '',101),(20,0,'https://images.unsplash.com/photo-1531072901881-d644216d4bf9',_binary '',102),(21,0,'https://images.unsplash.com/photo-1633477189729-9290b3261d0a',_binary '',103),(22,0,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '',104),(23,0,'https://images.unsplash.com/photo-1544947950-fa07a98d237f',_binary '',201),(24,1,'https://images.unsplash.com/photo-1629992101753-56d196c8aabb',_binary '\0',201),(25,0,'https://images.unsplash.com/photo-1543002588-bfa74002ed7e',_binary '',202),(26,1,'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf',_binary '\0',202),(27,0,'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38',_binary '',203),(28,1,'https://images.unsplash.com/photo-1613685703305-dec0d139ea35',_binary '\0',203),(29,0,'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8',_binary '',204),(30,1,'https://images.unsplash.com/photo-1474366521946-c3d4b507abf2',_binary '\0',204),(31,0,'https://images.unsplash.com/photo-1589998059171-988d887df646',_binary '',205),(32,1,'https://images.unsplash.com/photo-1598014082230-e8f1566be762',_binary '\0',205),(33,0,'https://images.unsplash.com/photo-1476275466078-4007374efbbe',_binary '',206),(34,1,'https://images.unsplash.com/photo-1491841573634-28140fc7ced7',_binary '\0',206);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `product_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `FKpur2885qb9ae6fiquu77tcv1o` (`tag_id`),
  CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKpur2885qb9ae6fiquu77tcv1o` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (201,1),(202,1),(1001,1),(2001,1),(2002,1),(101,2),(103,2),(201,2),(203,2),(1001,2),(1002,2),(2003,2),(3002,2),(4003,2),(3001,3),(206,4),(1003,4),(2002,4),(3003,4),(4002,4),(102,5),(202,5),(205,5),(1002,5),(4001,5),(103,6),(104,6),(2001,6),(2003,6),(3002,6),(3003,6),(3001,7),(204,8),(1004,8),(2004,8),(3004,8),(4004,8);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text,
  `is_subscription` bit(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `sale_price` decimal(38,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (101,_binary '','2025-05-20 17:13:00.000000','A gripping mystery thriller that will keep you on the edge of your seat',_binary '\0','The Midnight Chronicles',18.99,22.00,100,'2025-05-20 17:13:00.000000',5),(102,_binary '','2025-05-20 17:13:00.000000','A beautifully crafted literary masterpiece about the ocean\'s secrets',_binary '\0','Whispers of the Ocean - Hardcover Edition',32.50,39.99,75,'2025-05-20 17:13:00.000000',5),(103,_binary '','2025-05-20 17:13:00.000000','An enchanting tale of adventure for young readers',_binary '\0','The Little Adventurer - Children\'s Book',16.99,19.50,150,'2025-05-20 17:13:00.000000',7),(104,_binary '','2025-05-20 17:13:00.000000','A comprehensive guide to fostering innovation in business',_binary '\0','Creativity and Innovation - Business Handbook',45.99,59.99,100,'2025-05-20 17:13:00.000000',6),(201,_binary '','2025-05-20 17:13:00.000000','A captivating mystery set in an ancient library',_binary '\0','The Silent Library - Bestselling Mystery Novel',14.99,17.50,118,'2025-05-20 17:13:00.000000',5),(202,_binary '','2025-05-20 17:13:00.000000','An epic fantasy collection that transports readers to magical worlds',_binary '\0','Eternal Gardens - Fantasy Series Collection',28.99,36.00,89,'2025-05-20 17:13:00.000000',5),(203,_binary '','2025-05-20 17:13:00.000000','Elegant and modern bookends for the contemporary bookshelf',_binary '\0','Modern Bookends Set (Set of 2)',24.99,32.00,200,'2025-05-20 17:13:00.000000',8),(204,_binary '','2025-05-20 17:13:00.000000','A curated monthly selection of books for avid readers',_binary '','Monthly Book Club Subscription Box',29.99,35.00,NULL,'2025-05-20 17:13:00.000000',5),(205,_binary '','2025-05-20 17:13:00.000000','Luxurious leather bookmarks with classic designs',_binary '\0','Oxford Premium Leather Bookmark Set',31.99,39.99,150,'2025-05-20 17:13:00.000000',8),(206,_binary '','2025-05-20 17:13:00.000000','Versatile reading light for comfortable nighttime reading',_binary '\0','Adjustable Book Reading Light',12.99,15.00,250,'2025-05-20 17:13:00.000000',8),(1001,_binary '','2025-05-20 16:53:20.000000','Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived.',_binary '\0','The Midnight Library',24.99,19.99,100,'2025-05-20 16:53:20.000000',5),(1002,_binary '','2025-05-20 16:53:20.000000','An epic fantasy tale of magic, betrayal, and ancient powers awakening in a world on the brink of war.',_binary '\0','Eternal Gardens',22.99,18.50,75,'2025-05-20 16:53:20.000000',5),(1003,_binary '','2025-05-20 16:53:20.000000','A beautifully written story about family secrets, forgiveness, and finding oneself on a remote island.',_binary '\0','Whispers of the Ocean',19.99,15.99,85,'2025-05-20 16:53:20.000000',5),(1004,_binary '','2025-05-20 16:53:20.000000','Curated selection of bestselling fiction books delivered monthly',_binary '','Monthly Fiction Box',39.99,NULL,NULL,'2025-05-20 16:53:20.000000',5),(2001,_binary '','2025-05-20 16:53:20.000000','Transform your life with tiny changes in behavior. The breakthrough guide to building good habits and breaking bad ones.',_binary '\0','Atomic Habits',29.99,24.99,150,'2025-05-20 16:53:20.000000',6),(2002,_binary '','2025-05-20 16:53:20.000000','Train your mind for peace and purpose every day with ancient wisdom for modern life.',_binary '\0','Think Like a Monk',27.99,22.99,80,'2025-05-20 16:53:20.000000',6),(2003,_binary '','2025-05-20 16:53:20.000000','A groundbreaking exploration of forgotten civilizations and their lasting impact on our world today.',_binary '\0','The Hidden History of Humanity',32.50,27.99,45,'2025-05-20 16:53:20.000000',6),(2004,_binary '','2025-05-20 16:53:20.000000','Curated selection of thought-provoking non-fiction books delivered monthly',_binary '','Monthly Non-Fiction Box',44.99,NULL,NULL,'2025-05-20 16:53:20.000000',6),(3001,_binary '','2025-05-20 16:53:20.000000','The beloved tale of Max\'s wild adventure, a timeless classic that has enchanted generations.',_binary '\0','Where the Wild Things Are',18.99,15.99,200,'2025-05-20 16:53:20.000000',7),(3002,_binary '','2025-05-20 16:53:20.000000','Join Sam on an exciting journey through magical lands filled with friendly creatures and valuable lessons.',_binary '\0','The Little Adventurer',16.99,14.50,175,'2025-05-20 16:53:20.000000',7),(3003,_binary '','2025-05-20 16:53:20.000000','An interactive adventure through our solar system, perfect for young space enthusiasts.',_binary '\0','Space Explorers',19.99,16.99,140,'2025-05-20 16:53:20.000000',7),(3004,_binary '','2025-05-20 16:53:20.000000','Monthly subscription box with age-appropriate books and activities',_binary '','Kids\' Book Club Box',34.99,NULL,NULL,'2025-05-20 16:53:20.000000',7),(4001,_binary '','2025-05-20 16:53:20.000000','Set of 3 handcrafted genuine leather bookmarks with classic designs',_binary '\0','Premium Leather Bookmark Set',24.99,19.99,250,'2025-05-20 16:53:20.000000',8),(4002,_binary '','2025-05-20 16:53:20.000000','Ergonomic book stand with adjustable angles and page holders, crafted from sustainable bamboo',_binary '\0','Adjustable Bamboo Book Stand',32.50,27.99,80,'2025-05-20 16:53:20.000000',8),(4003,_binary '','2025-05-20 16:53:20.000000','Set of 4 scented candles inspired by classic literature',_binary '\0','Literary Candle Collection',28.99,24.99,120,'2025-05-20 16:53:20.000000',8),(4004,_binary '','2025-05-20 16:53:20.000000','Monthly subscription box of premium reading accessories',_binary '','Reader\'s Essential Box',29.99,NULL,NULL,'2025-05-20 16:53:20.000000',8);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1nv3auyahyyy79hvtrcqgtfo9` (`user_id`,`product_id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` enum('ROLE_ADMIN','ROLE_USER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t48xdq560gs3gap9g7jg36kgc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (3,'Award Winner'),(1,'Bestseller'),(7,'Classic'),(6,'Educational'),(5,'Limited Edition'),(8,'Monthly Subscription'),(2,'New Release'),(4,'Staff Pick');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'2025-05-20 15:27:43.358038','admin@admin.com','admin','admin','1234','000000','2025-05-20 15:27:43.358071','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `wishlist_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1tt7y773rvi7jkh499ipw7r8w` (`wishlist_id`,`product_id`),
  KEY `FKqxj7lncd242b59fb78rqegyxj` (`product_id`),
  CONSTRAINT `FKkem9l8vd14pk3cc4elnpl0n00` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`id`),
  CONSTRAINT `FKqxj7lncd242b59fb78rqegyxj` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES (1,'2025-05-20 14:35:25.799272',4,1),(2,'2025-05-20 14:35:27.176971',3,1),(3,'2025-05-20 15:44:33.596597',201,2),(4,'2025-05-20 15:58:00.930258',202,2);
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_obh8c909a28dx3aqh4cbdhh25` (`user_id`),
  CONSTRAINT `FK330pyw2el06fn5g28ypyljt16` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,'2025-05-20 14:35:12.693945','2025-05-20 14:35:27.186855',1),(2,'2025-05-20 15:44:33.583767','2025-05-20 15:58:00.931575',2);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 18:32:52
