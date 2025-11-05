-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ReactJS_ExpressJS_MySql
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduct` varchar(50) NOT NULL,
  `nameProduct` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `categoryId` varchar(50) NOT NULL,
  `brandId` varchar(50) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `originalPrice` decimal(12,2) NOT NULL,
  `discountPercent` int NOT NULL,
  `thumbnail` text NOT NULL,
  `shortDescription` text,
  `description` text,
  `allowInstallment` tinyint(1) DEFAULT '1',
  `allowOnlinePrice` tinyint(1) DEFAULT '1',
  `quantity` int NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idProduct` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'P001','iPhone 15 Pro Max','iphone-15-pro-max','cate001','brand001',34990000.00,37990000.00,8,'https://example.com/images/iphone15promax.jpg','Flagship mới nhất của Apple với chip A17 Pro và thiết kế titan.','iPhone 15 Pro Max mang đến hiệu năng mạnh mẽ, camera đỉnh cao và màn hình tuyệt vời.',1,1,10,'2025-11-05 00:10:35','2025-11-05 00:10:35'),(2,'P002','Samsung Galaxy S24 Ultra','samsung-galaxy-s24-ultra','cate001','brand002',29990000.00,33990000.00,12,'https://example.com/images/s24ultra.jpg','Flagship Android mạnh nhất 2025 với bút S Pen và Snapdragon 8 Gen 3.','Samsung Galaxy S24 Ultra sở hữu camera 200MP, thiết kế viền vuông, pin lớn và hiệu năng mạnh.',1,1,20,'2025-11-05 00:11:58','2025-11-05 00:11:58'),(3,'P003','Xiaomi 14T Pro','xiaomi-14t-pro','cate001','brand003',15990000.00,17990000.00,11,'https://example.com/images/xiaomi14tpro.jpg','Điện thoại hiệu năng cao với camera Leica, sạc nhanh 120W.','Xiaomi 14T Pro trang bị chip Dimensity 9200+, sạc nhanh 120W, camera Leica cực chất.',1,1,25,'2025-11-05 00:12:07','2025-11-05 00:12:07'),(4,'P004','OPPO Find X7 Pro','oppo-find-x7-pro','cate001','brand004',21990000.00,24990000.00,12,'https://example.com/images/findx7pro.jpg','Siêu phẩm chụp ảnh với cảm biến Sony LYT-900.','Find X7 Pro sử dụng chip Snapdragon 8 Gen 3, camera Hasselblad và sạc nhanh 100W.',1,1,12,'2025-11-05 00:12:12','2025-11-05 00:12:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 23:09:55
