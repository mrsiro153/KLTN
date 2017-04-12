CREATE DATABASE  IF NOT EXISTS `quizz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `quizz`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: quizz
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `cauhoi`
--

DROP TABLE IF EXISTS `cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cauhoi` (
  `idCauHoi` int(11) NOT NULL,
  `NoiDungCauHoi` mediumtext,
  `DapAnDung` varchar(5) DEFAULT NULL,
  `MaNoiDung` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCauHoi`),
  KEY `Fok_cauhoi_noidung` (`MaNoiDung`),
  CONSTRAINT `Fok_cauhoi_noidung` FOREIGN KEY (`MaNoiDung`) REFERENCES `noidung` (`idNoiDung`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi`
--

LOCK TABLES `cauhoi` WRITE;
/*!40000 ALTER TABLE `cauhoi` DISABLE KEYS */;
INSERT INTO `cauhoi` VALUES (1,'Thuật toán quick sort có mấy bước ','A',1),(2,'Độ phức tạp của quicksort là bao nhiêu?','B',1),(3,'Kết quả sau khi chạy selection sort ở bước 5 là','A',1),(4,'Có mấy loại cây nhị phân','C',2),(5,'Cây nhị phân được ứng dụng vào đâu?','D',2),(6,'Cây nhị phân nào cân bằng','C',2),(7,'Từ khóa abstract dùng làm gì ?','D',3),(8,'Class thì khác gì Structure','C',3),(9,'Interface là gì ?','B',3),(10,'Làm sao để in 1 dòng lệnh ra console trong C#','C',4),(11,'Dùng từ khóa nào để viết lại phương thức của lớp cha trong C#','D',4),(12,'1 lớp con có thể có bao nhiêu lớp cha?','A',4),(13,'CSDL là gì ?','C',5),(14,'Siêu dữ liệu là gì ','D',5),(15,'Relational database là gì ?','B',5),(16,'Kết quả của câu lệnh truy vấn SQL sau: select....','A',6),(17,'Kết quả của truy vấn sau: select * from..where...','D',6),(18,'Kết quả của truy vấn sau: select from where group...','C',6),(19,'Các ngôn ngữ chính cấu thành website?','D',7),(20,'HTML 5 có gì mới so với các cái còn lại','C',7),(21,'CSS là viết tắt của ?','A',7),(22,'Java servlet là gì ?','C',8),(23,'JSP là gì?','D',8),(24,'Sự khác biệt JSP và servlet','A',8),(25,'có bao nhiêu kiểu kết nối mạng','C',9),(26,'Mạng internet là gì ?','B',9),(27,'Mạng hình sao khác gì với mạng thẳng','A',9),(28,'Có mấy bước để cấu hình Router','D',10),(29,'Làm sao để coi IP của máy tính','A',10),(30,'Switch và router khác biêt gì ?','D',10),(31,'Cây Nhị phân là gì?','D',2);
/*!40000 ALTER TABLE `cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietcauhoi`
--

DROP TABLE IF EXISTS `chitietcauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietcauhoi` (
  `MaCauHoi` int(11) NOT NULL AUTO_INCREMENT,
  `DapAnA` mediumtext,
  `DapAnB` mediumtext,
  `DapAnC` mediumtext,
  `DapAnD` mediumtext,
  PRIMARY KEY (`MaCauHoi`),
  CONSTRAINT `Fok_chitietcauhoi_cauhoi` FOREIGN KEY (`MaCauHoi`) REFERENCES `cauhoi` (`idCauHoi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietcauhoi`
--

LOCK TABLES `chitietcauhoi` WRITE;
/*!40000 ALTER TABLE `chitietcauhoi` DISABLE KEYS */;
INSERT INTO `chitietcauhoi` VALUES (1,'5','4','6','7'),(2,'2(n)','n/2','n(n)','sqrt(n)'),(3,'3 3 4','4 2 3','2 1 2','9 7 8'),(4,'1','2','3','4'),(5,'Máy tính','Cuộc sống','lập trình','Các thiết bị điện tử'),(6,'Số 1','Số 2','Số 3','Số 4'),(7,'Viết lại phương thức cha','Khai báo đối tượng ảo','Khai báo interface','Viết lại phương thức trong interface'),(8,'Giống nhau','class là class và structure là structure','Class có phương thức, structure thì không','Sự khai báo khi sử dụng'),(9,'Giao diện','lớp ảo hóa chứa các phương thức thuần ảo','là một abstract class','giống với structure'),(10,'Sử dụng System.out..','Sử dụng console.write()','Sử dụng Console.write()','Sử dụng out.print()'),(11,'Implement','Override','rewrite','Không cái nào đúng'),(12,'1','2','4','Nhiều lớp cha'),(13,'Là dữ liệu thông thường','là dữ liệu được sắp xếp','là các dữ liệu được mã hóa','là các dữ liệu có liên quan tới nhau'),(14,'Dòng chữ, văn bản...','Các bảng dữ liệu','Dữ liệu chọn lọc','Dữ liệu đa kiểu'),(15,'là các dữ liệu không liên quan tới nhau','là các dữ liệu có liên quan tới nhau','là các dữ liệu có liên quan tới nhau và có sự liên kết giữa chúng','không cái nào đúng'),(16,'ab','ac','bc','dd'),(17,'12','32','13','54'),(18,'admin','student','exam','bank'),(19,'C# C++','Java JSP','PHP','HTML CSS Javascript'),(20,'dễ sử dụng hơn','nhanh hơn','tiện lợi hơn','không cái nào đúng'),(21,'Cascading Style Sheets','Cost System Sending','Cross Site Scripting','không cái nào đúng'),(22,'là java','Là java hỗ trợ các thư viện cho nền tảng web','là JSP','là ngôn ngữ client side'),(23,'Là java servlet','là javascript','là ngôn ngữ client side','Java sever page'),(24,'Không khác gì','là HTML trong java và java trong HTML','servlet là client side, còn JSP là server side','Đều là ngôn ngữ java'),(25,'3','4','5','6'),(26,'là mạng nhện','mạng lưới kết nối các máy tính trong 1 công ty','là mạng lưới kết nối các máy tính trong 1 đất nước','là mạng kết nối các máy tính khắp thế giời'),(27,'1 cái hình sao, 1 cái thẳng','về quyền của các máy trong kết nối','về cách kết nối','không khác gì nhau'),(28,'5','4','3','7'),(29,'cmd-&gt;ipconfig/all','mở control panel và xem thông số','bấm widows+enter','Ctrl+D'),(30,'Không khác gì','router bảo mật hơn switch','switch mắc hơn router','Không khác gì nhiều'),(31,'là 1 cái cây','là cây nhị phân','là cây nhị phân cân bằng','không đáp án nào đúng');
/*!40000 ALTER TABLE `chitietcauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dethi`
--

DROP TABLE IF EXISTS `dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dethi` (
  `idDeThi` int(11) NOT NULL,
  `ThoiLuong` varchar(45) DEFAULT NULL,
  `SoCauHoi` int(11) DEFAULT NULL,
  `NgayMoDeThi` date DEFAULT NULL,
  `GioMoDeThi` time DEFAULT NULL,
  `MaMonHoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeThi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi`
--

LOCK TABLES `dethi` WRITE;
/*!40000 ALTER TABLE `dethi` DISABLE KEYS */;
INSERT INTO `dethi` VALUES (1,'3600',5,'2016-12-10','12:00:00',1),(2,'1800',6,'2016-12-11','11:00:00',2),(3,'1800',5,'2016-12-15','16:00:00',2),(4,'1800',6,'2017-12-14','22:00:00',3),(5,'120',4,'2017-12-27','17:46:00',3),(6,'300',4,'2015-06-29','08:05:00',5),(7,'600',4,'2015-12-29','13:50:00',5),(8,'3000',5,'2017-02-07','00:00:00',4);
/*!40000 ALTER TABLE `dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dethi_cauhoi`
--

DROP TABLE IF EXISTS `dethi_cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dethi_cauhoi` (
  `MaDeThi` int(11) NOT NULL,
  `MaCauHoi` int(11) NOT NULL,
  PRIMARY KEY (`MaDeThi`,`MaCauHoi`),
  KEY `Fok_dethicauhoi_cauhoi` (`MaCauHoi`),
  CONSTRAINT `Fok_dethicauhoi_cauhoi` FOREIGN KEY (`MaCauHoi`) REFERENCES `cauhoi` (`idCauHoi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fok_dethicauhoi_dethi` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`idDeThi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi_cauhoi`
--

LOCK TABLES `dethi_cauhoi` WRITE;
/*!40000 ALTER TABLE `dethi_cauhoi` DISABLE KEYS */;
INSERT INTO `dethi_cauhoi` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,7),(3,7),(2,8),(3,8),(2,9),(2,10),(3,10),(2,11),(3,11),(2,12),(3,12),(4,13),(4,14),(5,14),(4,15),(5,15),(4,16),(4,17),(5,17),(4,18),(5,18),(8,19),(8,20),(8,21),(8,22),(8,24),(6,25),(7,25),(7,26),(6,27),(6,28),(7,28),(6,29),(7,30);
/*!40000 ALTER TABLE `dethi_cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monhoc` (
  `idMonHoc` int(11) NOT NULL,
  `TenMonHoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMonHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'Cấu trúc dữ liệu'),(2,'Lập trình hướng đối tượng'),(3,'Cơ sở dữ liệu'),(4,'Lập trình web'),(5,'Mạng máy tính căn bản');
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noidung`
--

DROP TABLE IF EXISTS `noidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noidung` (
  `idNoiDung` int(11) NOT NULL,
  `idMonHoc` int(11) DEFAULT NULL,
  `TenNoiDung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNoiDung`),
  KEY `Fok_noidung_monhoc` (`idMonHoc`),
  CONSTRAINT `Fok_noidung_monhoc` FOREIGN KEY (`idMonHoc`) REFERENCES `monhoc` (`idMonHoc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noidung`
--

LOCK TABLES `noidung` WRITE;
/*!40000 ALTER TABLE `noidung` DISABLE KEYS */;
INSERT INTO `noidung` VALUES (1,1,'Các thuật toán sắp xếp'),(2,1,'Cây nhị phân'),(3,2,'Cơ bản hướng đối tượng'),(4,2,'Hướng đối tượng trong C#'),(5,3,'Khái niệm căn bản về CSDL'),(6,3,'Truy vấn SQL'),(7,4,'HTML và CSS'),(8,4,'Lập trình với JSP'),(9,5,'Phân loại và kiểu mạng'),(10,5,'Cách cấu hình mạng');
/*!40000 ALTER TABLE `noidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quyen`
--

DROP TABLE IF EXISTS `quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quyen` (
  `idQuyen` int(11) NOT NULL,
  `TenQuyen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quyen`
--

LOCK TABLES `quyen` WRITE;
/*!40000 ALTER TABLE `quyen` DISABLE KEYS */;
INSERT INTO `quyen` VALUES (1,'admin'),(2,'sinh viên'),(3,'người ra đề thi'),(4,'quản trị kỳ thi'),(5,'quản trị ngân hàng đề thi');
/*!40000 ALTER TABLE `quyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary`
--

DROP TABLE IF EXISTS `temporary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary` (
  `idUser` varchar(10) NOT NULL,
  `idExam` int(11) NOT NULL,
  `timeRe` varchar(10) DEFAULT NULL,
  `idQuizz` int(11) NOT NULL,
  `yourAns` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idExam`,`idQuizz`),
  KEY `fok_idx` (`idQuizz`),
  CONSTRAINT `fok` FOREIGN KEY (`idQuizz`) REFERENCES `cauhoi` (`idCauHoi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary`
--

LOCK TABLES `temporary` WRITE;
/*!40000 ALTER TABLE `temporary` DISABLE KEYS */;
INSERT INTO `temporary` VALUES ('sv1',6,'234',1,'D'),('sv1',6,'234',2,'B'),('sv1',6,'234',3,''),('sv1',6,'234',4,'');
/*!40000 ALTER TABLE `temporary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  `SDT` varchar(12) DEFAULT NULL,
  `Password` text,
  `quyen` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fok_quyen` (`quyen`),
  CONSTRAINT `Fok_quyen` FOREIGN KEY (`quyen`) REFERENCES `quyen` (`idQuyen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ad1','Nguyễn Hoàng Nam','1990-10-10','Nam','100 Hoàng Văn Thụ','121015566','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',1),('ad2','Hoàng Thương Thương','1990-12-01','Nữ','25 Nguyễn Đình Chiểu','0121545','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',1),('ad3','Ngọc Hải','1990-05-03','Nam','Hoàng Đức','01225','$2a$10$k0ZyiE87uoq03NUI5GkwvOQ1BHYRWs3vbPn5WtFzMSadbiXXkxHlS',1),('bank1','Thế Phi','1990-02-05','Nam','120 Tôn Thất Thuyế','035125522','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',5),('bank2','Ngọc Nữ 2','1990-02-05','Nữ','Trần phú','12345678','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',5),('exam1','Trần Thành Nhân','1990-02-05','Nam','366 Điện Biên Phủ','02154542121','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',4),('exam2','Hoàng Lan','1990-01-08','Nữ','235 Kha Vạn Cân','01255223123','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',4),('lec1','Vũ Thị Ngọc bích','1990-05-05','Nữ','23 Võ Văn Ngân','012663488','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',3),('lec2','Hoàng Thái Tú','1990-02-06','Nam','150 Công Định','015255666','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',3),('sv1','Đặng Đức Thái','1990-10-09','Nam','122 Phạm Văn Hai','01236541258','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',2),('sv2','Hoàng Trân','1990-05-09','Nữ','95 Nguyễn Ái Quốc','0231254879','$2a$10$xajhlnBd54vp6H3rzPJi8eXG/MnE4qYT7fQT7cUNnuTrTlJx0u84y',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dethi`
--

DROP TABLE IF EXISTS `user_dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dethi` (
  `MaSinhVien` varchar(10) NOT NULL,
  `MaDeThi` int(11) NOT NULL,
  `Diem` float DEFAULT NULL,
  PRIMARY KEY (`MaSinhVien`,`MaDeThi`),
  KEY `Fok_sinhviendethi_dethi` (`MaDeThi`),
  CONSTRAINT `Fok_sinhviendethi_dethi` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`idDeThi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fok_sinhviendethi_sinhvien` FOREIGN KEY (`MaSinhVien`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dethi`
--

LOCK TABLES `user_dethi` WRITE;
/*!40000 ALTER TABLE `user_dethi` DISABLE KEYS */;
INSERT INTO `user_dethi` VALUES ('sv1',1,2),('sv1',7,10);
/*!40000 ALTER TABLE `user_dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'quizz'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 23:08:42
