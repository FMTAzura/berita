-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_rsa
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `admin_pasien`
--

DROP TABLE IF EXISTS `admin_pasien`;
/*!50001 DROP VIEW IF EXISTS `admin_pasien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `admin_pasien` (
  `pasien` tinyint NOT NULL,
  `nama` tinyint NOT NULL,
  `no_hp` tinyint NOT NULL,
  `jurusan` tinyint NOT NULL,
  `nama_dokter` tinyint NOT NULL,
  `spesialis` tinyint NOT NULL,
  `tanggal_temu` tinyint NOT NULL,
  `catatan` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dokter`
--

DROP TABLE IF EXISTS `tbl_dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dokter` (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(50) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dokter`
--

LOCK TABLES `tbl_dokter` WRITE;
/*!40000 ALTER TABLE `tbl_dokter` DISABLE KEYS */;
INSERT INTO `tbl_dokter` VALUES (1,'Dr. Stephen Strange','Ilmu Hitam'),(2,'Dr. Banner','Ahli Saraf'),(3,'Drs. Yoon Myung Joo','Hati'),(4,'Drs. Kang Mo-yeon','Jiwa');
/*!40000 ALTER TABLE `tbl_dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pasien`
--

DROP TABLE IF EXISTS `tbl_pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pasien` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `no_hp` int(15) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pasien`
--

LOCK TABLES `tbl_pasien` WRITE;
/*!40000 ALTER TABLE `tbl_pasien` DISABLE KEYS */;
INSERT INTO `tbl_pasien` VALUES ('20.83.1111','Galuh','Sistem Informasi',1223),('20.83.1222','Levaa','Sistem Informasi',1223),('20.83.1234','Eldiva Tegar','Teknik Komputer',2147483647),('20.83.1235','Andi Muh','Hubungan Internasion',2147483647),('20.83.1244','Rangga','Geografi',2147483647),('20.83.1255','Galuh','Sistem Informasi',1223),('20.83.1333','Levaa Ody','Teknik Komputer',2147483647);
/*!40000 ALTER TABLE `tbl_pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rawat`
--

DROP TABLE IF EXISTS `tbl_rawat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_rawat` (
  `pasien` varchar(20) NOT NULL,
  `dokter` int(11) NOT NULL,
  `tanggal_temu` date NOT NULL,
  `catatan` text DEFAULT NULL,
  `status` enum('Proses','Selesai') NOT NULL,
  KEY `fk_pasien_rawat` (`pasien`),
  KEY `fk_dokter_rawat` (`dokter`),
  CONSTRAINT `fk_dokter_rawat` FOREIGN KEY (`dokter`) REFERENCES `tbl_dokter` (`id_dokter`),
  CONSTRAINT `fk_pasien_rawat` FOREIGN KEY (`pasien`) REFERENCES `tbl_pasien` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rawat`
--

LOCK TABLES `tbl_rawat` WRITE;
/*!40000 ALTER TABLE `tbl_rawat` DISABLE KEYS */;
INSERT INTO `tbl_rawat` VALUES ('20.83.1234',3,'2022-07-29','Mantan Saya','Selesai'),('20.83.1244',2,'2022-09-23','','Proses'),('20.83.1235',4,'2022-07-26','COT','Proses'),('20.83.1222',3,'2022-08-04','','Proses'),('20.83.1333',4,'2022-08-05','','Proses'),('20.83.1111',4,'2022-08-03','','Proses');
/*!40000 ALTER TABLE `tbl_rawat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `admin_pasien`
--

/*!50001 DROP TABLE IF EXISTS `admin_pasien`*/;
/*!50001 DROP VIEW IF EXISTS `admin_pasien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_pasien` AS select `r`.`pasien` AS `pasien`,`p`.`nama` AS `nama`,`p`.`no_hp` AS `no_hp`,`p`.`jurusan` AS `jurusan`,`d`.`nama_dokter` AS `nama_dokter`,`d`.`spesialis` AS `spesialis`,`r`.`tanggal_temu` AS `tanggal_temu`,`r`.`catatan` AS `catatan`,`r`.`status` AS `status` from ((`tbl_rawat` `r` join `tbl_pasien` `p`) join `tbl_dokter` `d`) where `r`.`pasien` = `p`.`nim` and `r`.`dokter` = `d`.`id_dokter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27  1:46:26
