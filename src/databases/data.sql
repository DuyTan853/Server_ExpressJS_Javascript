-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: DB_local
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.1

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL COMMENT 'home-hero, home-sub, category-top, sidebar',
  `isActive` tinyint(1) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `idBrand` int NOT NULL AUTO_INCREMENT,
  `nameBrand` varchar(255) DEFAULT NULL COMMENT 'Apple, Samsung, Xiaomi',
  `logo` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Oppo','1763900555158_image_1425_2.webp',1,NULL,'2025-11-23');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL COMMENT 'Giỏ hàng 1-1 với user',
  `items` json DEFAULT NULL COMMENT 'Mảng sản phẩm trong giỏ',
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `idCate` int NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(255) DEFAULT NULL COMMENT 'Điện thoại, Laptop, Âm thanh',
  `logo` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`idCate`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tai nghe','1763900566358_iphone_air.webp',1,NULL,'2025-11-23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderItems`
--

DROP TABLE IF EXISTS `orderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderItems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `variantId` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Snapshot tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Snapshot giá tại thời điểm mua',
  `qty` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  KEY `variantId` (`variantId`),
  CONSTRAINT `orderItems_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderItems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`),
  CONSTRAINT `orderItems_ibfk_3` FOREIGN KEY (`variantId`) REFERENCES `productVariants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItems`
--

LOCK TABLES `orderItems` WRITE;
/*!40000 ALTER TABLE `orderItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `orderCode` varchar(255) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `shippingFee` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL COMMENT 'COD | VNPAY | MOMO | BANK',
  `paymentStatus` varchar(255) DEFAULT NULL COMMENT 'unpaid | paid',
  `status` varchar(255) DEFAULT NULL COMMENT 'pending | confirmed | delivering | completed | cancelled',
  `shippingInfo` json DEFAULT NULL COMMENT 'Thông tin giao hàng',
  `voucherCode` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderCode` (`orderCode`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL COMMENT 'Payment 1-1 với order',
  `amount` decimal(10,2) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL COMMENT 'VNPAY, MOMO, ZaloPay',
  `transactionId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT 'pending | success | failed',
  `paidAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `content` text COMMENT 'Nội dung bài viết',
  `category` varchar(255) DEFAULT NULL COMMENT 'tin-cong-nghe | danh-gia | thu-thuat',
  `tags` json DEFAULT NULL,
  `authorId` int DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productImages`
--

DROP TABLE IF EXISTS `productImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `isPrimary` tinyint(1) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `productImages_ibfk_1` (`productId`),
  CONSTRAINT `productImages_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productImages`
--

LOCK TABLES `productImages` WRITE;
/*!40000 ALTER TABLE `productImages` DISABLE KEYS */;
INSERT INTO `productImages` VALUES (42,'PROD-5ce96a19-40c3-498d-a2bf-ffdff3d317d4','1763898626832_image_1425_2.webp',0,NULL,'2025-11-23 11:50:26','2025-11-23 11:50:26'),(43,'PROD-5ce96a19-40c3-498d-a2bf-ffdff3d317d4','1763898626832_iphone_air.webp',0,NULL,'2025-11-23 11:50:26','2025-11-23 11:50:26'),(44,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507563_image_1425_2.webp',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(45,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507564_Screenshot from 2025-11-19 10-04-13.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(46,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507563_iphone_air.webp',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(47,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507563_Screenshot from 2025-11-19 09-56-10.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(48,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507563_Screenshot from 2025-11-19 09-59-56.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(49,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507565_Screenshot from 2025-11-19 10-06-52.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(50,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507566_Screenshot from 2025-11-19 10-06-58.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47'),(51,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','1763900507566_Screenshot from 2025-11-19 13-38-42.png',0,NULL,'2025-11-23 12:21:47','2025-11-23 12:21:47');
/*!40000 ALTER TABLE `productImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productPromotions`
--

DROP TABLE IF EXISTS `productPromotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productPromotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `promotionId` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL COMMENT 'tặng cáp sạc, ưu đãi thêm 200K',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `promotionId` (`promotionId`),
  CONSTRAINT `productPromotions_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`),
  CONSTRAINT `productPromotions_ibfk_2` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`idPromotion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productPromotions`
--

LOCK TABLES `productPromotions` WRITE;
/*!40000 ALTER TABLE `productPromotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `productPromotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productQuestions`
--

DROP TABLE IF EXISTS `productQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productQuestions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL COMMENT 'Nullable nếu khách vãng lai',
  `guestName` varchar(255) DEFAULT NULL,
  `question` text,
  `answer` text,
  `answeredBy` int DEFAULT NULL COMMENT 'Staff trả lời',
  `status` varchar(255) DEFAULT NULL COMMENT 'pending | answered',
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  KEY `answeredBy` (`answeredBy`),
  CONSTRAINT `productQuestions_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`),
  CONSTRAINT `productQuestions_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`idUser`),
  CONSTRAINT `productQuestions_ibfk_3` FOREIGN KEY (`answeredBy`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productQuestions`
--

LOCK TABLES `productQuestions` WRITE;
/*!40000 ALTER TABLE `productQuestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `productQuestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productReviews`
--

DROP TABLE IF EXISTS `productReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productReviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `rating` int DEFAULT NULL COMMENT '1-5 sao',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `images` json DEFAULT NULL COMMENT 'Ảnh review',
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `productReviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`),
  CONSTRAINT `productReviews_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productReviews`
--

LOCK TABLES `productReviews` WRITE;
/*!40000 ALTER TABLE `productReviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `productReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productSpecs`
--

DROP TABLE IF EXISTS `productSpecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productSpecs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `screenSize` varchar(50) DEFAULT NULL,
  `screenTechnology` varchar(100) DEFAULT NULL,
  `rearCamera` text,
  `frontCamera` varchar(100) DEFAULT NULL,
  `chipset` varchar(50) DEFAULT NULL,
  `internalMemory` varchar(50) DEFAULT NULL,
  `battery` varchar(100) DEFAULT NULL,
  `operatingSystem` varchar(50) DEFAULT NULL,
  `screenResolution` varchar(50) DEFAULT NULL,
  `screenFeatures` text,
  `cpuType` varchar(50) DEFAULT NULL,
  `compatibility` text,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productSpecs`
--

LOCK TABLES `productSpecs` WRITE;
/*!40000 ALTER TABLE `productSpecs` DISABLE KEYS */;
INSERT INTO `productSpecs` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20),(3,'PROD-001','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15),(4,'PROD-PROD-54025d36-0a85-44bb-8c92-3e532bd60ffc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'PROD-PROD-c4f47614-3111-4cef-ba7f-b41bcd9647dc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'PROD-PROD-ffa8d99f-6631-47dc-993c-b237110f847f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'PROD-PROD-9c15fe26-e688-44b7-8bde-a5169f3069ce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(8,'PROD-5cdb65ac-f194-440a-92ae-54306cbc5169','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15),(9,'PROD-a1472a82-fd4d-4b4f-b1f3-e65c66c5586e','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15),(46,'PROD-5ce96a19-40c3-498d-a2bf-ffdff3d317d4','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15),(47,'PROD-c3fa77b7-e718-4ad4-ade9-6d4dacedd780','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15),(48,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','6.8 inch','Dynamic AMOLED 2X','200MP + 12MP + 12MP','40MP','Exynos 2400','512GB','5000 mAh','Android 14','3088 x 1440','120Hz, HDR10+','Octa-core','5G, Wi-Fi 7, Bluetooth 5.3',15);
/*!40000 ALTER TABLE `productSpecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productVariants`
--

DROP TABLE IF EXISTS `productVariants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productVariants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(255) DEFAULT NULL,
  `variantName` varchar(255) DEFAULT NULL COMMENT '128GB - Xanh',
  `color` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `originalPrice` decimal(10,2) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `productId` (`productId`),
  CONSTRAINT `productVariants_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productVariants`
--

LOCK TABLES `productVariants` WRITE;
/*!40000 ALTER TABLE `productVariants` DISABLE KEYS */;
/*!40000 ALTER TABLE `productVariants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduct` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `nameProduct` varchar(255) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `brandId` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `originalPrice` decimal(10,2) DEFAULT NULL,
  `discountPercent` int DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `shortDesc` varchar(255) DEFAULT NULL,
  `description` text COMMENT 'Mô tả dài HTML',
  `status` varchar(255) DEFAULT NULL COMMENT 'active | out_of_stock | coming_soon',
  `isFeatured` tinyint(1) DEFAULT NULL,
  `allowInstallment` tinyint(1) DEFAULT NULL,
  `allowOnlinePrice` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE KEY `id` (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`idCate`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (66,'PROD-5ce96a19-40c3-498d-a2bf-ffdff3d317d4','iphone-15-pro-max','iPhone 15 Pro Max',1,1,32990000.00,34990000.00,10,'1763898626831_image_1425_2.webp','Điện thoại cao cấp nhất của Apple.','Mô tả chi tiết sản phẩm iPhone 15 Pro Max...','available',1,1,1,'2025-11-23 11:50:26','2025-11-23 11:50:26'),(67,'PROD-c3fa77b7-e718-4ad4-ade9-6d4dacedd780','iphone-15-pro-max','iPhone 15 Pro Max',1,1,32990000.00,34990000.00,10,NULL,'Điện thoại cao cấp nhất của Apple.','Mô tả chi tiết sản phẩm iPhone 15 Pro Max...','available',1,1,1,'2025-11-23 12:21:23','2025-11-23 12:21:23'),(68,'PROD-d8bf72a8-0efc-4d2f-a316-7cbfffcf810a','iphone-15-pro-max','iPhone 15 Pro Max',1,1,32990000.00,34990000.00,10,'1763900507563_iphone_air.webp','Điện thoại cao cấp nhất của Apple.','Mô tả chi tiết sản phẩm iPhone 15 Pro Max...','available',1,1,1,'2025-11-23 12:21:47','2025-11-23 12:21:47');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` int NOT NULL,
  `idPromotion` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT 'Giảm 500K khi thanh toán VNPAY',
  `description` text,
  `type` varchar(255) DEFAULT NULL COMMENT 'percent | fixed | gift | bank',
  `value` decimal(10,2) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `applyFor` varchar(255) DEFAULT NULL COMMENT 'product | category | brand | order',
  `bankCode` varchar(255) DEFAULT NULL COMMENT 'Mã ngân hàng nếu KM bank',
  PRIMARY KEY (`idPromotion`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'admin, sales, content, delivery',
  `permissions` json DEFAULT NULL COMMENT 'Mảng quyền hạn',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs`
--

DROP TABLE IF EXISTS `specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screenSize` varchar(500) DEFAULT NULL,
  `screenTechnology` varchar(500) DEFAULT NULL,
  `rearCamera` text,
  `frontCamera` varchar(500) DEFAULT NULL,
  `chipset` varchar(500) DEFAULT NULL,
  `internalMemory` varchar(500) DEFAULT NULL,
  `battery` varchar(500) DEFAULT NULL,
  `operatingSystem` varchar(500) DEFAULT NULL,
  `screenResolution` varchar(500) DEFAULT NULL,
  `screenFeatures` text,
  `cpuType` varchar(500) DEFAULT NULL,
  `compatibility` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs`
--

LOCK TABLES `specs` WRITE;
/*!40000 ALTER TABLE `specs` DISABLE KEYS */;
INSERT INTO `specs` VALUES (1,NULL,NULL,'Wide camera: 12MP, ƒ/1.8, Digital zoom up to 5x; Panorama: 63MP',NULL,'A16 Chip','128 GB','Built-in Li-Po 28.93 Wh battery','iPadOS 18','2360 x 1640 pixels','Multi-Touch screen with LED backlight and IPS; True Tone; 500 nits brightness; Fingerprint-resistant coating','5-core CPU','Supports Apple Pencil (USB-C); Supports Apple Pencil (1st generation)'),(2,NULL,'Liquid Retina','Wide camera: 12MP, ƒ/1.8, Digital zoom up to 5x; Panorama: 63MP','12MP, ƒ/2.4','A16 Chip','128 GB',NULL,'iPadOS 18','2360 x 1640 pixels','Multi-Touch screen with LED backlight and IPS; True Tone; 500 nits brightness; Fingerprint-resistant coating','5-core CPU','Supports Apple Pencil (USB-C); Supports Apple Pencil (1st generation)'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `idUser` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'Email đăng nhập',
  `password` varchar(255) DEFAULT NULL COMMENT 'Password đã hash',
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL COMMENT 'customer | staff | admin',
  `isVerified` tinyint(1) DEFAULT NULL,
  `addresses` json DEFAULT NULL COMMENT 'Mảng địa chỉ giao hàng',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT 'Mã giảm giá',
  `discountType` varchar(255) DEFAULT NULL COMMENT 'percent | fixed',
  `discountValue` decimal(10,2) DEFAULT NULL,
  `minOrder` decimal(10,2) DEFAULT NULL COMMENT 'Đơn hàng tối thiểu',
  `maxDiscount` decimal(10,2) DEFAULT NULL,
  `expiredAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 19:32:16
