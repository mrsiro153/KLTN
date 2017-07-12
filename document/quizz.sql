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
INSERT INTO `cauhoi` VALUES (1,'Thuật toán quick sort có mấy bước ','A',1),(2,'Độ phức tạp của quicksort là bao nhiêu?','B',1),(3,'Kết quả sau khi chạy selection sort ở bước 5 là','A',1),(4,'Có mấy loại cây nhị phân','C',2),(5,'Cây nhị phân được ứng dụng vào đâu?','D',2),(6,'Cây nhị phân nào cân bằng','C',2),(7,'Từ khóa abstract dùng làm gì ?','D',3),(8,'Class thì khác gì Structure','C',3),(9,'Interface là gì ?','B',3),(10,'Làm sao để in 1 dòng lệnh ra console trong C#','C',4),(11,'Dùng từ khóa nào để viết lại phương thức của lớp cha trong C#','D',4),(12,'1 lớp con có thể có bao nhiêu lớp cha?','A',4),(13,'CSDL là gì ?','C',5),(14,'Siêu dữ liệu là gì ','D',5),(15,'Relational database là gì ?','B',5),(16,'Kết quả của câu lệnh truy vấn SQL sau: select....','A',6),(17,'Kết quả của truy vấn sau: select * from..where...','D',6),(18,'Kết quả của truy vấn sau: select from where group...','C',6),(19,'Các ngôn ngữ chính cấu thành website?','D',7),(20,'HTML 5 có gì mới so với các cái còn lại','C',7),(21,'CSS là viết tắt của ?','A',7),(22,'Java servlet là gì ?','C',8),(23,'JSP là gì?','D',8),(24,'Sự khác biệt JSP và servlet','A',8),(25,'có bao nhiêu kiểu kết nối mạng','C',9),(26,'Mạng internet là gì ?','B',9),(27,'Mạng hình sao khác gì với mạng thẳng','A',9),(28,'Có mấy bước để cấu hình Router','D',10),(29,'Làm sao để coi IP của máy tính','A',10),(30,'Switch và router khác biêt gì ?','D',10),(31,'Cây Nhị phân là gì?','D',2),(32,'Phương pháp selectionsort khác gì quick sort','A',1),(33,'Lập trình hướng đối tượng là gì','C',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietcauhoi`
--

LOCK TABLES `chitietcauhoi` WRITE;
/*!40000 ALTER TABLE `chitietcauhoi` DISABLE KEYS */;
INSERT INTO `chitietcauhoi` VALUES (1,'5','4','6','7'),(2,'2(n)','n/2','n(n)','sqrt(n)'),(3,'3 3 4','4 2 3','2 1 2','9 7 8'),(4,'1','2','3','4'),(5,'Máy tính','Cuộc sống','lập trình','Các thiết bị điện tử'),(6,'Số 1','Số 2','Số 3','Số 4'),(7,'Viết lại phương thức cha','Khai báo đối tượng ảo','Khai báo interface','Viết lại phương thức trong interface'),(8,'Giống nhau','class là class và structure là structure','Class có phương thức, structure thì không','Sự khai báo khi sử dụng'),(9,'Giao diện','lớp ảo hóa chứa các phương thức thuần ảo','là một abstract class','giống với structure'),(10,'Sử dụng System.out..','Sử dụng console.write()','Sử dụng Console.write()','Sử dụng out.print()'),(11,'Implement','Override','rewrite','Không cái nào đúng'),(12,'1','2','4','Nhiều lớp cha'),(13,'Là dữ liệu thông thường','là dữ liệu được sắp xếp','là các dữ liệu được mã hóa','là các dữ liệu có liên quan tới nhau'),(14,'Dòng chữ, văn bản...','Các bảng dữ liệu','Dữ liệu chọn lọc','Dữ liệu đa kiểu'),(15,'là các dữ liệu không liên quan tới nhau','là các dữ liệu có liên quan tới nhau','là các dữ liệu có liên quan tới nhau và có sự liên kết giữa chúng','không cái nào đúng'),(16,'ab','ac','bc','dd'),(17,'12','32','13','54'),(18,'admin','student','exam','bank'),(19,'C# C++','Java JSP','PHP','HTML CSS Javascript'),(20,'dễ sử dụng hơn','nhanh hơn','tiện lợi hơn','không cái nào đúng'),(21,'Cascading Style Sheets','Cost System Sending','Cross Site Scripting','không cái nào đúng'),(22,'là java','Là java hỗ trợ các thư viện cho nền tảng web','là JSP','là ngôn ngữ client side'),(23,'Là java servlet','là javascript','là ngôn ngữ client side','Java sever page'),(24,'Không khác gì','là HTML trong java và java trong HTML','servlet là client side, còn JSP là server side','Đều là ngôn ngữ java'),(25,'3','4','5','6'),(26,'là mạng nhện','mạng lưới kết nối các máy tính trong 1 công ty','là mạng lưới kết nối các máy tính trong 1 đất nước','là mạng kết nối các máy tính khắp thế giời'),(27,'1 cái hình sao, 1 cái thẳng','về quyền của các máy trong kết nối','về cách kết nối','không khác gì nhau'),(28,'5','4','3','7'),(29,'cmd-&gt;ipconfig/all','mở control panel và xem thông số','bấm widows+enter','Ctrl+D'),(30,'Không khác gì','router bảo mật hơn switch','switch mắc hơn router','Không khác gì nhiều'),(31,'là 1 cái cây xanh bình thường','là cây nhị phân','là cây nhị phân cân bằng','không đáp án nào đúng'),(32,'Không khác gì cả','Quick sort nhanh hơn selection sort','Khác nhau về độ tính toán','Quicksort tính phức tạp hơn Selection sort'),(33,'là OOP - Oriented ','là lập trình thủ tục','không là gì cả','là lập trình hàm');
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
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`idDeThi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi`
--

LOCK TABLES `dethi` WRITE;
/*!40000 ALTER TABLE `dethi` DISABLE KEYS */;
INSERT INTO `dethi` VALUES (1,'3600',5,'2016-12-10','12:00:00',1,0),(3,'1800',5,'2016-12-15','16:00:00',2,0),(4,'1800',6,'2017-12-14','22:00:00',3,0),(5,'120',4,'2017-12-27','17:46:00',3,0),(6,'180',6,'2017-05-23','00:00:00',5,0),(7,'600',4,'2015-12-29','13:50:00',5,0),(8,'2340',4,NULL,NULL,1,1),(10,'120',5,'2017-06-15','01:59:00',5,1);
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
INSERT INTO `dethi_cauhoi` VALUES (1,1),(8,1),(1,2),(1,3),(1,4),(8,4),(1,5),(8,6),(3,7),(3,8),(3,10),(3,11),(3,12),(4,13),(4,14),(5,14),(4,15),(5,15),(4,16),(4,17),(5,17),(4,18),(5,18),(6,25),(7,25),(10,25),(6,26),(7,26),(10,27),(6,28),(7,28),(10,28),(6,29),(6,30),(7,30);
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
  `DiaChi` varchar(1024) DEFAULT NULL,
  `SDT` varchar(16) DEFAULT NULL,
  `Password` text,
  `quyen` int(11) NOT NULL,
  `lop` varchar(45) DEFAULT 'undefine',
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
INSERT INTO `user` VALUES ('ad1','Nguyễn Hoàng Nam','1990-10-10','Nam','100 Hoàng Văn Thụ','121015566','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',1,'undefine'),('ad2','Hoàng Thương Thương Bảo','1990-12-01','Nữ','25 Nguyễn Đình Chiểu','012154554','$2a$10$b4IMEIMrFk5RzNMoqp5oze9X/Hhg9OebqK1L1C3s2OgHQ7HuK3izy',1,'undefine'),('bank1','Thế Phi','1990-02-05','Nam','120 Tôn Thất Thuyế','035125522','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',5,'undefine'),('bank2','Ngọc Mai','1990-02-23','Nữ','123 Nguyễn ĐC','1362222','$2a$10$nDex9gw7295LrK4sJocgoe8p8VLI52eQqEhCHG8xKKbB9Xp/IoGPm',5,'undefine'),('exam1','Trần Thành Nhân','1990-02-05','Nam','366 Điện Biên Phủ','02154542121','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',4,'undefine'),('exam2','Hoàng Lan','1990-01-08','Nữ','235 Kha Vạn Cân','01255223123','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',4,'undefine'),('lec1','Vũ Thị Ngọc bích','1990-05-05','Nữ','23 Võ Văn Ngân','012663488','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',3,'undefine'),('lec2','Hoàng Thái Tú Nam','1990-02-06','Nam','150 Công Định','015255666','$2a$10$0aBXc99TEOruz2lZdJuWfuKwiPWQRfLtvwAfwK8O0pg9QGTwqpZzK',3,'undefine'),('sv1','Đặng Đức Thái','1990-10-09','Nam','122 Phạm Văn Hai','01236541258','$2a$10$J.ju7Nq2yiYEINWlVuJHjuSHOr.p.jZYtumqDpM5Q4xgMWxDgWRBG',2,'class1'),('sv1088','Nguyễn Minh Đức','1990-02-05','Nam','39 Bạch Đằng, Phường 2 Quận Tân Bình, TP Hồ Chí Minh','918122588','$2a$10$SBkqe3/KCPzG1UJhZA8n1O5UwJPSvEBg0.zlq7CSPCAlR3OpE18ZC',2,'class2'),('sv1211','Lê Thị Giang','1990-02-05','Nữ','40 Bạch Đằng, Phường 2 Quận Tân Bình, TP Hồ Chí Minh','918660420','$2a$10$WakFPCS1QPGoG3BIGaNh9uKxIlSEixwWuTe2oCm5mcUqkqKrkaBa.',2,'class2'),('sv12149','Bùi Thị Muôn','1990-02-05','Nữ',' 94 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$UG3x2yKaUA8Y/3AXSb53ye7OGUF0Fv6T38XGczkKQhpO9345EXUFi',2,'class4'),('sv12172','Trịnh Văn Thuận','1990-02-05','Nam',' 22 Cửu Long, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','973753259','$2a$10$/pK5N8tlfofxMdojOObcc.bsZLwZzPyoRBRIABmcvjeJDSJvj1sNy',2,'class7'),('sv12234','Bạch Huỳnh Như','1990-02-05','Nam','29 Thăng Long, Phường 4, Quận Tân Bình, TP Hồ Chí Minh ','925048498','$2a$10$X.NElAjmv0RjyK25D67Rq.aEYScKvUjo86.cEFRpTXjKzRB3CALVS',2,'class8'),('sv12575','Bùi Mạnh Khởi','1990-02-05','Nam','193 Pasteur, quận 3, Tp. Hồ Chí Minh ','948881449','$2a$10$dzjRHTP5.8UxJs90xNf3su4sHqDd8Xy/ATRBW6.JDnDuZqMByYWvC',2,'class7'),('sv12655','Trịnh Văn Cử','1990-02-05','Nam','30 Thăng Long, Phường 4, Quận Tân Bình, TP Hồ Chí Minh ','925048498','$2a$10$86t7ZjYfLHYm4h1Uik4uh.hUTBhwRFR2wlkW6cOxAdaz/42VVp/lu',2,'class8'),('sv1350','Lê Ngọc Hùng Hiệp','1990-02-05','Nam',' 280 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','1295779916','$2a$10$zFgOwDulss3unL2ZSZ87nO151foY7u4bBtVnJoE4f.TVpiHyHBMc.',2,'class2'),('sv1426','Nguyễn Văn Hải','1990-02-05','Nam',' 279 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','963939994','$2a$10$LjPzVus0R8OGh4i3/UGdeeau3gjmc5xXzxxGyz7yDybelNVACI0Zy',2,'class2'),('sv1481','Nguyễn Tiến Hiếu','1990-02-05','Nam',' 281 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','1693535884','$2a$10$qizaLbit05IadVYnPCgG2u3fqyLbFGw83HUZv82Vt/LML8kGdWP62',2,'class2'),('sv1482','Nguyễn Thị Thu Hoài','1990-02-05','Nữ',' 282 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','919444383','$2a$10$ElD0Rd8CsYW8teL6IXHOXeyQdfm3qshgiKrxVMOTtMqmvxR7Z3wUC',2,'class2'),('sv1507','Nguyễn Thu Hoài','1990-02-05','Nam',' 283 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','1697277498','$2a$10$BwTgMr8tAt3lkkAGk5KWd.9b5WVOf8QBsQYj7QwPg3YWHK2DvTpg2',2,'class1'),('sv1559','Đặng Tuấn Hoàng','1990-02-05','Nam',' 284 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','986716397','$2a$10$.KSHKEZx4Et87X71m0z9G.rwOxi.XPqFcFWw18/J6X2C6bqssTWmO',2,'class1'),('sv1609','Phạm Văn Hoàng','1990-02-05','Nam',' 285 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','837271516','$2a$10$nlBUA8axMc.39JzxzLQNrOrl8DLpPX1J52ukndQYDzz6b2wU4COL2',2,'class1'),('sv16338','Nguyễn Ngọc Mai','1990-02-05','Nữ','181 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','907000350','$2a$10$GtbWeMP09hJZ6eR/lvA7me6AL/d8k7l3EAbiN2plR/66z6Tz/x3cG',2,'class6'),('sv16438','Mai Minh Tuấn','1990-02-05','Nam','786 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','907000350','$2a$10$6Wv0DFtBEIn/ErqTvBzoNu.aBHdFosTv8ackzDFiZ4Ygin6pemO0W',2,'class6'),('sv16563','Võ Văn Một','1990-02-05','Nam','182 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','948881449','$2a$10$FbgoRqIqJFP4k5zjGsi32.w55rO0oIjRs6jmEyXO4kMyvNl.qy08W',2,'class6'),('sv165636','Nguyễn Thanh Dân','1990-02-05','Nam','191 Pasteur, quận 3, Tp. Hồ Chí Minh ','948881449','$2a$10$2cAsMFwaItkDF3EoisH79OrWgJFswKcjLsivquMJbnWJzYL4O9GTO',2,'class7'),('sv16825','Hoàng Văn Hùng','1990-02-05','Nam','45 Lê Thánh Tôn, phường Bến Nghé, quận 1, Tp. Hồ Chí Minh ','925048498','$2a$10$rGcf.W9jdtspNLGv1GhFvOcSXxvr88.1cNR9GATX6cWnPGWnQ9sfC',2,'class8'),('sv18349','Vỏ Văn Kha','1990-02-05','Nam',' 89 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$r67ihuVY1XVS6Y/wcc6R6e4f.micFra/qLpuOvW0UDIXXK8C3FL9C',2,'class4'),('sv1850','Trần Đức Học','1990-02-05','Nam',' 286 đường D2, Phường 25 quận Bình Thạnh, Thành phố HCM','913133894','$2a$10$LwwwOIJb.6gSz3t6Cqwa..K.0L7D7KeJiHtF90lFAWpKKmrnzTFse',2,'class1'),('sv1903','Trần Thị Thúy Hường','1990-02-05','Nam','50D Bùi Thị Xuân, phường Bến Thành, Quận 1, TP Hồ Chí Minh ','907094345','$2a$10$0Pt8LwSICxrgGHyvEbJ7NeWNYcXgIQXol8/gbsW3hvpKSvxASf8aa',2,'class1'),('sv1919','Lê Văn Hưng','1990-02-05','Nam','50D Bùi Thị Xuân, phường Bến Thành, Quận 1, TP Hồ Chí Minh ','1677303904','$2a$10$jpq.5gjZfrIrkXMQtAMbveYDhi/8uLFXG50aVk9EWIzK9lIRLAvH.',2,'class1'),('sv1931','Bùi Thị Ngọc Hường','1990-02-05','Nữ','50D Bùi Thị Xuân, phường Bến Thành, Quận 1, TP Hồ Chí Minh ','916438487','$2a$10$eghOLwPTp1Mzsos6rN/9XONSc3fLgtvRgyiNuPQEdK8JHTKh7LH7q',2,'class1'),('sv19522','Phan Cẩm Thi','1990-02-05','Nữ',' 93 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$C1it2s3zfxaSD787efjM5.s4UTtFgEWpkwhh5XMQ65nXE9owepsjK',2,'class4'),('sv2','Hoàng Trân','1990-05-09','Nữ','95 Nguyễn Ái Quốc','0231254879','$2a$10$xajhlnBd54vp6H3rzPJi8eXG/MnE4qYT7fQT7cUNnuTrTlJx0u84y',2,'class1'),('sv2051','Dương Đình Kiệt','1990-02-05','Nam','106 A Cư xá Nguyễn Văn Trỗi, phường 17, quận Phú Nhuận, Tp. Hồ Chí Minh ','917326426','$2a$10$CSGBc3LeGJhooXOwh4ilLOwvxP7enbbTqvT6kLWozldsbdZ4uJ1/G',2,'class1'),('sv20655','Bùi Văn Thanh','1990-02-05','Nam','313 đường Hoàng Diệu, phường 6, quận 4, Tp. Hồ Chí Minh ','907000350','$2a$10$FBt9hCdYtsk4h6BV3dwu6Oq8FIjXyFTkzjx4lDP2f1YBeO3VO96NW',2,'class4'),('sv2089','Nguyễn Thị Hương','1990-02-05','Nam','50D Bùi Thị Xuân, phường Bến Thành, Quận 1, TP Hồ Chí Minh ','925048498','$2a$10$H1NXYg/ApMFNfac.ayUPMelXbMvY1vZu54oaR9ydNlUzQI.HvpnpC',2,'class1'),('sv2147','Nguyễn Đạt Trí Khang','1990-02-05','Nam','108 A Cư xá Nguyễn Văn Trỗi, phường 17, quận Phú Nhuận, Tp. Hồ Chí Minh ','1656364757','$2a$10$sph5.lutOav9qM9hBNbsC.PYxln4hjnx5KNV9kb1BuiW7G3mcj7EK',2,'class1'),('sv2187','Nguyễn Vân Lập','1990-02-05','Nam','109 A Cư xá Nguyễn Văn Trỗi, phường 17, quận Phú Nhuận, Tp. Hồ Chí Minh ','903918485','$2a$10$vYxwwk0C3j1h515PDEtBJeUQs9FWzZLy/BM9oKe61M2zbA3yvTjk6',2,'class1'),('sv22588','Nguyễn Văn Diệu','1990-02-05','Nam','37 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','988992518','$2a$10$mv1s8qA4VfMBlgGCyhit4.yMsGET55syguVPnAuIqChp6F.XIDfnC',2,'class5'),('sv2259','Hoàng Văn Kiên','1990-02-05','Nam','107 A Cư xá Nguyễn Văn Trỗi, phường 17, quận Phú Nhuận, Tp. Hồ Chí Minh ','1633871544','$2a$10$EWlr5OxqkU4s0Mm0hhoGsur.gm8hjmrNnDbqHkEZjdibY2h9ua31e',2,'class1'),('sv2418','Mai Thị Linh','1990-02-05','Nữ','110 A Cư xá Nguyễn Văn Trỗi, phường 17, quận Phú Nhuận, Tp. Hồ Chí Minh ','939849458','$2a$10$upxdKatK8cqLRYL9Gl55quX0W9sFQk2XJM7nPJr42LvhbqdJUIPeC',2,'class1'),('sv2460','Tống Thị Mến','1990-02-05','Nữ',' 25 Pasteur, phường Nguyễn Thái Bình, quận 1, Tp. Hồ Chí Minh ','1656364757','$2a$10$47pUERf7fe4S0Q7bCKb2j.8GyEYT3Ys6ljGJIyIOytSkD5ySfBKBu',2,'class1'),('sv2487','Nguyễn Đức Minh','1990-02-05','Nam',' 26 Pasteur, phường Nguyễn Thái Bình, quận 1, Tp. Hồ Chí Minh ','918035895','$2a$10$/ZkZaMVvlGD0jA28YeD56uuxRnelqhX2O.LsQbTSUk/CHPtDIo.KC',2,'class1'),('sv25898','Phạm Quang Trường','1990-02-05','Nam',' 90 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$/K4/RHPT1VLaQKK0IzSR7.jA18QRzcbZ77ycfW6Ap8IKPah7L3uJi',2,'class4'),('sv2600','Phan Thị Nhật Minh','1990-02-05','Nam',' 27 Pasteur, phường Nguyễn Thái Bình, quận 1, Tp. Hồ Chí Minh ','1257542074','$2a$10$pTD3KoPCztr0oQRGhyjSQuZ6XbRC6AXRg4VE4D1zXfzbSoVq5PVOy',2,'class1'),('sv2785','Phan Hoàng Nam','1990-02-05','Nam',' 29 Pasteur, phường Nguyễn Thái Bình, quận 1, Tp. Hồ Chí Minh ','948881449','$2a$10$y.S.6vuM0oUgeZkjbJ3kae.cBnnWC2lrZVKTy/1bCNmMWCsC8W/4O',2,'class3'),('sv3083','Phạm Nhật Nam','1990-02-05','Nam',' 28 Pasteur, phường Nguyễn Thái Bình, quận 1, Tp. Hồ Chí Minh ','942600799','$2a$10$Ks3fY2EdWH8nwZGeda2qweAHUq/GeP.wpYa6JQxg/cB6rI8TgfN4W',2,'class1'),('sv3122','Nguyễn Thị Nhung','1990-02-05','Nữ',' 01 phổ quang, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','6503820328','$2a$10$MAp8LgiYXB6fygCXCAccpOQVjLzIxQJRBPrpNBHYdyyES7zMnd17G',2,'class3'),('sv31331','Nguyễn Thị Pha','1990-02-05','Nam','784 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','945213369','$2a$10$/KE/ammrRPzmLN3zQQ1GcOfSPeNFChFCWjiudfz3nZys3WcKEBuxW',2,'class6'),('sv3206','Lê Thị Quỳnh','1990-02-05','Nam',' 2 phổ quang, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','1217221021','$2a$10$vOCMKy6HYeiUYADoZXkYvubHAOHpX0xKpx.C2vLpZm/Vf0Ls6LcsW',2,'class3'),('sv3344','Phạm Anh Tuấn','1990-02-05','Nam','2-4-6 Đồng Khởi, Bến Nghé, quận I, Tp. Hồ Chí Minh ','1223444945','$2a$10$7YqX0UseQKMtZTyhUZFlf.Knydbz6603ANYz/EoftOFFc3bZvVeia',2,'class3'),('sv3350','Hoàng Văn Thái','1990-02-05','Nam',' 36 Nguyễn Trường Tộ, phường 12, quận 4, Tp. Hồ Chí Minh ','1265558169','$2a$10$2RTrenXSJayUNYoWEfmda.9f/taR613KxQHPwGo1RQ0jm5ixnD1gu',2,'class3'),('sv3369','Nguyễn Mạnh Thái','1990-02-05','Nam',' 37 Nguyễn Trường Tộ, phường 12, quận 4, Tp. Hồ Chí Minh ','973152724','$2a$10$QhwB/gqaQ00wte2vFKFiHO8JWZlIN0wcVo3AfIDrOlIm0Q87Pd/z6',2,'class3'),('sv3701','Chu Minh Thành','1990-02-05','Nam',' 38 Nguyễn Trường Tộ, phường 12, quận 4, Tp. Hồ Chí Minh ','912029889','$2a$10$57Is0VNmZ6MhugCMvnMi9eBdQZ1m19h2nXMpFqTuFCmxiN.lo2AA2',2,'class3'),('sv3730','Nguyễn Thu Thủy','1990-02-05','Nữ',' 39 Nguyễn Trường Tộ, phường 12, quận 4, Tp. Hồ Chí Minh ','1682562472','$2a$10$K9dqtWIYzL13YXvieitOEeufk/5SA.DUnXdOH2az8jt9HY7TB3.tS',2,'class3'),('sv3791','Nguyễn Hoàng Sơn','1990-02-05','Nam',' 3 phổ quang, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','933029135','$2a$10$UgxUQDDxbPviEymtxeydW.1V7Pb.fz2L9I1QjbxQSeoSqkoJp6c5a',2,'class3'),('sv3898','Nguyễn Thị Quỳnh Thương','1990-02-05','Nữ',' 40 Nguyễn Trường Tộ, phường 12, quận 4, Tp. Hồ Chí Minh ','982594154','$2a$10$DJQZwhhGnr5R9IONNkekV.n70v1M.9yvQs7ruKfi8sVkrUFihi7hy',2,'class3'),('sv3928','Trần Thu Trang','1990-02-05','Nữ','205 Nguyễn Xí, phường 26, quận Bình Thạnh, thành phố Hồ Chí Minh ','977446455','$2a$10$KeoAJrDmVC1EzIddJR8r5.9wU1Yd9a.lGifXOw8ukfcb4DbGaCRiO',2,'class3'),('sv3941','Phạm Minh Trí','1990-02-05','Nam','206 Nguyễn Xí, phường 26, quận Bình Thạnh, thành phố Hồ Chí Minh ','939079699','$2a$10$h4MGQguLF7Zf4CxWvp5SDOA4HY3JVwZt2ExKFV10fbg5VQ2JbWw6q',2,'class3'),('sv39994','Trần Thị Kim Em','1990-02-05','Nữ','39 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','988992518','$2a$10$l97U3LtHBCvx7gdOp1sR0uTqWI2VoKgH3k9PNT8U2wLCU80iD6sQ6',2,'class5'),('sv40935','Đỗ Thị Tuyết Loan','1990-02-05','Nữ','301 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','988992518','$2a$10$cX6UnWUliU7JbPuuHOvse.T3A809k9X5pJ9ld7hi2c7tgurDopJ5a',2,'class5'),('sv4135','Nguyễn Anh Tú','1990-02-05','Nữ',' 5 phổ quang, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','935611126','$2a$10$RmW./Jpdq7li5BdVIMlCxu0bmFcOi.yyaLyXFD9AzyWQnl7SaSVWW',2,'class3'),('sv4315','Nguyễn Đức Trọng','1990-02-05','Nam','207 Nguyễn Xí, phường 26, quận Bình Thạnh, thành phố Hồ Chí Minh ','937711864','$2a$10$nDZ8VCBVk9Adr/sgxRYYOOI8EI6Jl2sSDQOSuyo4lfdHqskXRFnsC',2,'class3'),('sv4425','Lê Anh Văn','1990-02-05','Nam','208 Nguyễn Xí, phường 26, quận Bình Thạnh, thành phố Hồ Chí Minh ','937711864','$2a$10$IXpoIBSsmoDD3FF6q3sZuuPgE./wEaWi6CWWkIvclC4hpLJhKvzQ6',2,'class4'),('sv4442','Nguyễn Thị Hải Yến','1990-02-05','Nữ','309 đường Hoàng Diệu, phường 6, quận 4, Tp. Hồ Chí Minh ','945213369','$2a$10$iC2XQpcSqAl6RPSAvnORZOGjHlfoWO70iMcjSGWBIGlXVIZqZe0K6',2,'class4'),('sv44438','Trịnh Thị Lài','1990-02-05','Nữ','42 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','945213369','$2a$10$1Uw/ehSea.jPD1VqCNVo2.KDhE7AxRqbpYINGroqFI7pmL05K0TiS',2,'class5'),('sv4452','Nguyễn Đức Vượng','1990-02-05','Nam','209 Nguyễn Xí, phường 26, quận Bình Thạnh, thành phố Hồ Chí Minh ','945213369','$2a$10$xdqr0ayLDHeLhEgOxzjphu1g79Ja2j6gdOGENK1SbwXk7kLeDnZyG',2,'class4'),('sv45565','Hà Văn Huyện','1990-02-05','Nam','299 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','988992518','$2a$10$eSFoIV.tjjyvrFj3yEs1aepaMYLgG2jRsdhkB0RldmrAfhWd3qewe',2,'class4'),('sv48494','Lê Văn Bình','1990-02-05','Nam','302 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','988992518','$2a$10$8TkIj/vJKBeZ5sjChnAXmum0qQMbM3CtRH8tjcquNS1CoqhFu3kbS',2,'class5'),('sv5','Nam Hoàng','1997-06-05','Nam','123 đặng đức thuật','1362222','$2a$10$/yHhTHBFxzQ94nF3sDEp6eMwfcJ2kqkVQT5bICOI70mr.VzFxRuOS',2,'class2'),('sv5041','Tạ Xuân Tiến','1990-02-05','Nam',' 4 phổ quang, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','973753259','$2a$10$C98JRrD8IbaIVsHrohJh4e6N.GynNM3AxUhCpM7Dn/vQndFPX06m6',2,'class3'),('sv53588','Trang Mỹ Loan','1990-02-05','Nữ','41 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','945213369','$2a$10$2814d7c9lClu7DlXL5nhvuFBQ.rI6ia5LvTgRBFciT1UyM9ZG8H4e',2,'class5'),('sv5523','Dương Minh Đức','1990-02-05','Nam','36 Bạch Đằng, Phường 2 Quận Tân Bình, TP Hồ Chí Minh','914409356','$2a$10$k1hYQmVPCzjj.Lfwbglcpe9//h8wY1jF5bCjDbZTIEs9iU7wcBgUO',2,'class2'),('sv5610','Nguyễn Đức Du','1990-02-05','Nam',' 9 Út Tịch, Phường 04, Quận Tân Bình, Thành phố Hồ Chí Minh','1235099415','$2a$10$C0PUNUiNYRT0J7vDT9SMK.QaEzp/84sKxN8Ux6s6SYqCcBGNhymfK',2,'class2'),('sv5647','LêTuấn Duy','1990-02-05','Nam',' 10 Út Tịch, Phường 04, Quận Tân Bình, Thành phố Hồ Chí Minh','906919522','$2a$10$7Us4nuWFDWgSTrsUb5Smp.mqnSUFyZklYhwjAdBQ9b4jablbGu0HC',2,'class2'),('sv65038','Lâm Thị Gái','1990-02-05','Nữ',' 21 Cửu Long, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','973753259','$2a$10$.ElcMRxo/RYUmD8BPYcs3uW7h1drBVXUqk9B2vAMjuWjY8R.5bFua',2,'class7'),('sv66042','Tạ Quốc Thiện','1990-02-05','Nam','38 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','988992518','$2a$10$ujsN7.G96RaBisgHBpft5exP5jHgxOMnaeoSiIcEg6T3bW2LVOgta',2,'class5'),('sv66160','Trần Văn Cao','1990-02-05','Nam','300 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','988992518','$2a$10$5c6PUYzjNT/fVoZoaTi5auHsaXSm41VAHyJzeC9HISg9vdDgAGrjm',2,'class5'),('sv67077','Huỳnh Minh Nhật','1990-02-05','Nam',' 91 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$WFLbpqainXaKrhWGYWHqhuX5r04Z8KpV/b2z9n3YlRz5aH6MZfUTq',2,'class4'),('sv70003','Vương Thị Thảo Ly','1990-02-05','Nữ','312 đường Hoàng Diệu, phường 6, quận 4, Tp. Hồ Chí Minh ','907000350','$2a$10$qnkZ.MH4xXi01tax85nFW./RuEV7ODgtKEn6nQsy.2HZCktKLieAa',2,'class4'),('sv71639','Lý Hùng Dũng','1990-02-05','Nam','782 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','945213369','$2a$10$OmceTkRKuADpY8faP.U55OnMG.9p80qSZmyygpWwcE.oN6iHLcQEO',2,'class5'),('sv727151','Nguyễn Chí Cường','1990-02-05','Nam','783 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','945213369','$2a$10$pERTYtmzG9bvskRLv7QaCO23h3MKC57KJQWbhAt0zQE4HG41leSqe',2,'class6'),('sv72774','Nguyễn Thị Mỹ','1990-02-05','Nữ','781 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','945213369','$2a$10$Lxs4SGfjpm06xrJYE0/SCumYiKZvxFlY9mLruXaTdD.WCEz1TlLUO',2,'class5'),('sv77303','Mai Văn Sang','1990-02-05','Nam','785 Lê Hồng Phong, phường 12, quận 10, Tp. Hồ Chí Minh ','907000350','$2a$10$Ugz1PUMB7ceKSXXxGjeL4.erVj7lfWNmp947pS5aZFiGW/dOCP0fi',2,'class6'),('sv77991','Lê Thị Kim Anh','1990-02-05','Nữ','40 Đường 22 Khu phố 2, Phường Bình An, Quận 2, Tp Hồ Chí Minh ','945213369','$2a$10$bOX2XV4Bjgs97Nu0SM/jt.A4v4DJWka3iuK1l8UxALkup10U0bBmO',2,'class5'),('sv8042','Nguyễn Anh Đức','1990-02-05','Nam','38 Bạch Đằng, Phường 2 Quận Tân Bình, TP Hồ Chí Minh','913199757','$2a$10$bELc.ky4soOlFVspPFPixuPvZILBAsSVQslFcY4J3olFRfwHVTk52',2,'class2'),('sv83627','Lê Văn Nghệ','1990-02-05','Nữ','311 đường Hoàng Diệu, phường 6, quận 4, Tp. Hồ Chí Minh ','1688883627','$2a$10$6Dw2ZbEtth89ih.zez/kEuMjzLnnT3DdnyWMrh82rZbxAojxEXkJy',2,'class4'),('sv8749','Phan Thị Hải Duyên','1990-02-05','Nữ',' 11 Út Tịch, Phường 04, Quận Tân Bình, Thành phố Hồ Chí Minh','1214907840','$2a$10$8gyRE1uk8BxTdWrM33Jl2uR/4eX9d055evQQ97T7cWLLjOcUavgmK',2,'class2'),('sv8829','Lê Xuân Đức','1990-02-05','Nam','37 Bạch Đằng, Phường 2 Quận Tân Bình, TP Hồ Chí Minh','979748494','$2a$10$SMekrXKgBP9BUVbzFFzMQuv3.efEGzLZUtqS8L3TSccTUMCg9On.S',2,'class2'),('sv8978','Lê Văn Dương','1990-02-05','Nam',' 12 Út Tịch, Phường 04, Quận Tân Bình, Thành phố Hồ Chí Minh','939945565','$2a$10$wQlWzw3kM77S7JpWYEgGI./7g7EfpGiXZyhMhZ8Jl1hSjT6F77xFG',2,'class2'),('sv8993','Nguyễn Văn Độ','1990-02-05','Nam',' 13 Út Tịch, Phường 04, Quận Tân Bình, Thành phố Hồ Chí Minh','939166160','$2a$10$uwYrHP5BwSy21TX9FelsneLsCgXXno9em.1nGweVi5nLIGm0/o7b6',2,'class2'),('sv90391','Trần Quang Tôn','1990-02-05','Nam','183 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','948881449','$2a$10$Gy6ra35etuPHc1E329d/4.SGa0ZHXhnBfy.zCeN7/1GASuylRSTni',2,'class6'),('sv90709','Hồng Hạnh','1990-02-05','Nữ','178 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','907000350','$2a$10$FhmhqdUHWKEbg4m4RAk9bORZNanmHblAQl0/.hNfe/gVh5AJApAGS',2,'class6'),('sv91202','Huỳnh Văn Đức','1990-02-05','Nam','32 Thăng Long, Phường 4, Quận Tân Bình, TP Hồ Chí Minh ','925048498','$2a$10$0.mQ2Ta1S42/eKzke7LMlu7aQkrAcpLwATO7SgoaZb0lcI0bHOh6y',2,'class8'),('sv91732','Trần Thanh Hải','1990-02-05','Nam','180 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','907000350','$2a$10$wogOThPkMYt/oUhcU1cn3elxTyGp0xFh/SwKb9uZATTlEoQlkgqXu',2,'class6'),('sv91803','Huỳnh Bá Quang','1990-02-05','Nam','192 Pasteur, quận 3, Tp. Hồ Chí Minh ','948881449','$2a$10$cVN8TpvW2qS17DvOnUBrb.ttruGYW7eXPEBd2Ob41EORE4FPQbouy',2,'class7'),('sv92504','Lê Chí Đệ','1990-02-05','Nam','179 Ban Kỳ Khởi nghĩa, Phường 6, Quận 3, Thành phố HCM ','907000350','$2a$10$a6AYqmHjLNn8okOPVtp4qeF9XP3zSETKmtJ6BOsl2Oo3A93vnxIL.',2,'class6'),('sv92518','Nguyễn Ngọc Diễm','1990-02-05','Nữ','310 đường Hoàng Diệu, phường 6, quận 4, Tp. Hồ Chí Minh ','988992518','$2a$10$xEDckc5JHfo9VdgcXRgSrOJBovkVj7pExjmMZXHJlaqkL4pN2qpHC',2,'class4'),('sv93302','Bồ Văn Cu','1990-02-05','Nam',' 23 Cửu Long, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','973753259','$2a$10$y0pBza7btFkXnG0HsBlLA.LD7YX2N6Pb7dxcSoSacbUBefSR8bOhm',2,'class7'),('sv93984','Nguyễn Ngọc Mai','1990-02-05','Nữ','190 Pasteur, quận 3, Tp. Hồ Chí Minh ','948881449','$2a$10$3zbS/I7brSfQJQMgSyV.ROaHpMJT2R78dkTmbHvLQEq.htQt4ZQC2',2,'class6'),('sv93994','Trần Văn Sang','1990-02-05','Nam','298 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','907000350','$2a$10$y9.4GvAQbbLinMqdcSaF2uhHipQDaIfmAqGMHdtnjo8G0CE3dtilO',2,'class4'),('sv94260','Chu Hữu Đoan Trang','1990-02-05','Nữ','194 Pasteur, quận 3, Tp. Hồ Chí Minh ','973753259','$2a$10$qSCKNmCFHLYhQl7keOmyE.i72u.FTreZqVyvNW/KzM.3EpjOPneKm',2,'class7'),('sv94888','Trần Thị Châu','1990-02-05','Nữ','195 Pasteur, quận 3, Tp. Hồ Chí Minh ','973753259','$2a$10$o7WF9yTQd/UenXjb.2EMeOlM9T41fuiSzwARIFTXlZtRpM4WW4Thm',2,'class7'),('sv97315','Huỳnh Thị Hồng Nhâm','1990-02-05','Nam','31 Thăng Long, Phường 4, Quận Tân Bình, TP Hồ Chí Minh ','925048498','$2a$10$AWMLref.VwkwNvAyFC31OOkRAplhwRCUDF8KBgb5pnCNk4Dm0lwee',2,'class8'),('sv97375','Nguyễn Ngọc Thanh','1990-02-05','Nam',' 24 Cửu Long, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','973753259','$2a$10$6elQ0HJkkSXGBxkC5lPfBOfNjCc1/auuHJrwWoKyZsj55q3QgCTR6',2,'class7'),('sv97378','Huỳnh Văn Thiết','1990-02-05','Nam',' 25 Cửu Long, phường 2, quận Tân Bình, Tp. Hồ Chí Minh ','925048498','$2a$10$AxxC9.oSS4hbYLhmJ2CDvO6dqzmJrFVd5fhP9f8A7t.JmARaYwqk.',2,'class8'),('sv98259','Nguyễn Hữu Huy','1990-02-05','Nam','46 Lê Thánh Tôn, phường Bến Nghé, quận 1, Tp. Hồ Chí Minh ','925048498','$2a$10$9uPgpgE846QSd2.5eMdiTegE7pCP4HeL5GT3nL3tVOAL4szpQc3Qe',2,'class8'),('sv99415','Trần Bình Phước','1990-02-05','Nam',' 92 Cách mạng tháng 8, phường Bến Thành, quận I, TP. Hồ Chí Minh','907000350','$2a$10$HoYAT3VSjV/T5LGmhLlzOukhU9I5EneCKZlolfmI4W2zHJjIPPf3i',2,'class4'),('sv99757','Nguyễn Nhiệm Toàn','1990-02-05','Nam','303 Huỳnh Tấn Phát, phường Tân Thuận Tây, quận 7, Tp. Hồ Chí Minh ','988992518','$2a$10$/vymBBaecxUx6CRtf10Ie.itB//PUTC/7Tnsyvieq.EC3LEEvVt1e',2,'class5');
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
INSERT INTO `user_dethi` VALUES ('sv1',1,4),('sv1',3,NULL),('sv1',6,NULL),('sv1',10,NULL),('sv2',1,NULL),('sv2',3,NULL),('sv2',6,NULL),('sv2',10,NULL),('sv22588',1,NULL),('sv39994',1,NULL),('sv40935',1,NULL),('sv44438',1,NULL),('sv48494',1,NULL),('sv53588',1,NULL),('sv66042',1,NULL),('sv66160',1,NULL),('sv71639',1,NULL),('sv72774',1,NULL),('sv77991',1,NULL),('sv99757',1,NULL);
/*!40000 ALTER TABLE `user_dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quizz'
--

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

-- Dump completed on 2017-07-13  1:50:29
