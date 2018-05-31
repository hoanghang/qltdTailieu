-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlytindung
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `anhkhachhang`
--

DROP TABLE IF EXISTS `anhkhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anhkhachhang` (
  `Ma` int(11) NOT NULL,
  `DuongDan` varchar(1000) NOT NULL,
  `MaKhachHang` int(11) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaKhachHang` (`MaKhachHang`),
  CONSTRAINT `anhkhachhang_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhkhachhang`
--

LOCK TABLES `anhkhachhang` WRITE;
/*!40000 ALTER TABLE `anhkhachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `anhkhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anhtaisan`
--

DROP TABLE IF EXISTS `anhtaisan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anhtaisan` (
  `Ma` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiSanHopDong` int(11) NOT NULL,
  `DuongDan` varchar(300) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaTaiSanHopDong_idx` (`MaTaiSanHopDong`),
  CONSTRAINT `MaTaiSanHopDong` FOREIGN KEY (`MaTaiSanHopDong`) REFERENCES `taisanhopdong` (`Ma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhtaisan`
--

LOCK TABLES `anhtaisan` WRITE;
/*!40000 ALTER TABLE `anhtaisan` DISABLE KEYS */;
/*!40000 ALTER TABLE `anhtaisan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batho`
--

DROP TABLE IF EXISTS `batho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batho` (
  `MaHopDong` int(11) NOT NULL,
  `TienDuaKhach` decimal(15,0) NOT NULL,
  `TongTien` decimal(15,0) NOT NULL,
  `TongSoNgay` smallint(5) unsigned NOT NULL,
  `ChuKyDongTien` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`MaHopDong`),
  CONSTRAINT `fk_hopdong` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batho`
--

LOCK TABLES `batho` WRITE;
/*!40000 ALTER TABLE `batho` DISABLE KEYS */;
/*!40000 ALTER TABLE `batho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chucvu` (
  `maChucVu` int(11) NOT NULL AUTO_INCREMENT,
  `chucvu` varchar(200) NOT NULL,
  `mota` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`maChucVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuahang` (
  `MaCuaHang` int(11) NOT NULL,
  `TenCuahang` varchar(30) NOT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `NguoiDaiDien` varchar(50) NOT NULL,
  `VonDauTu` decimal(15,2) unsigned DEFAULT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1',
  `NgayTao` date NOT NULL,
  `MaDiaChi` int(11) NOT NULL,
  PRIMARY KEY (`MaCuaHang`),
  KEY `MaDiaChi` (`MaDiaChi`),
  CONSTRAINT `cuahang_ibfk_1` FOREIGN KEY (`MaDiaChi`) REFERENCES `xa` (`ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dongtien`
--

DROP TABLE IF EXISTS `dongtien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dongtien` (
  `Ma` int(11) NOT NULL,
  `MaHopDong` int(11) NOT NULL,
  `NgayBatDau` date NOT NULL,
  `NgayKetThuc` date NOT NULL,
  `SoTien` decimal(15,2) NOT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ma`),
  KEY `DongTien_HopDongBatHo_fkey` (`MaHopDong`),
  CONSTRAINT `DongTien_HopDongBatHo_fkey` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dongtien`
--

LOCK TABLES `dongtien` WRITE;
/*!40000 ALTER TABLE `dongtien` DISABLE KEYS */;
/*!40000 ALTER TABLE `dongtien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghino`
--

DROP TABLE IF EXISTS `ghino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghino` (
  `Ma` int(11) NOT NULL,
  `NgayGhi` date NOT NULL,
  `SoTien` decimal(15,0) NOT NULL,
  `NoTra` enum('ghino','trano') NOT NULL,
  `MaHopDong` int(11) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaHopDong` (`MaHopDong`),
  CONSTRAINT `ghino_ibfk_1` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghino`
--

LOCK TABLES `ghino` WRITE;
/*!40000 ALTER TABLE `ghino` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gopvon`
--

DROP TABLE IF EXISTS `gopvon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gopvon` (
  `Ma` int(11) NOT NULL AUTO_INCREMENT,
  `NhaDauTu` varchar(100) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `MaCuaHang` int(11) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaCuaHang_idx` (`MaCuaHang`),
  CONSTRAINT `MaCuaHang` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gopvon`
--

LOCK TABLES `gopvon` WRITE;
/*!40000 ALTER TABLE `gopvon` DISABLE KEYS */;
/*!40000 ALTER TABLE `gopvon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hopdong` (
  `Ma` int(11) NOT NULL,
  `MaKhachHang` int(11) NOT NULL,
  `NgayLap` date NOT NULL,
  `GhiChu` varchar(300) DEFAULT NULL,
  `MaNhanVien` int(11) NOT NULL,
  `LoaiHopDong` tinyint(1) NOT NULL DEFAULT '1',
  `MaCuaHang` int(11) NOT NULL,
  `MaHopDongGoc` int(11) DEFAULT NULL,
  `TrangThai` tinyint(2) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `HopDongBatHo_KhachHang_fkey` (`MaKhachHang`),
  KEY `MaNhanVien` (`MaNhanVien`),
  KEY `cuahang_fk` (`MaCuaHang`),
  KEY `MaHopDongGoc` (`MaHopDongGoc`),
  CONSTRAINT `cuahang_fk` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`) ON UPDATE NO ACTION,
  CONSTRAINT `HopDongBatHo_KhachHang_fkey` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON UPDATE CASCADE,
  CONSTRAINT `hopdong_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`) ON UPDATE NO ACTION,
  CONSTRAINT `hopdong_ibfk_2` FOREIGN KEY (`MaHopDongGoc`) REFERENCES `hopdong` (`Ma`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

LOCK TABLES `hopdong` WRITE;
/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huyen`
--

DROP TABLE IF EXISTS `huyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huyen` (
  `Ma` int(11) NOT NULL,
  `Ten` int(11) NOT NULL,
  `MaTinh` int(11) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaTinh` (`MaTinh`),
  CONSTRAINT `huyen_ibfk_1` FOREIGN KEY (`MaTinh`) REFERENCES `tinh` (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huyen`
--

LOCK TABLES `huyen` WRITE;
/*!40000 ALTER TABLE `huyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `huyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL,
  `TenKhachHang` varchar(50) NOT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `DienThoai` varchar(15) DEFAULT NULL,
  `CMND` int(11) DEFAULT NULL,
  `MaCuaHang` int(11) NOT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1',
  `NgayTao` date NOT NULL,
  `MaDiaChi` int(11) NOT NULL,
  PRIMARY KEY (`MaKhachHang`),
  KEY `KhachHang_CuaHang_fkey` (`MaCuaHang`),
  KEY `madiachi` (`MaDiaChi`),
  CONSTRAINT `KhachHang_CuaHang_fkey` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaDiaChi`) REFERENCES `xa` (`ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichsuthaotachopdong`
--

DROP TABLE IF EXISTS `lichsuthaotachopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lichsuthaotachopdong` (
  `Ma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ThoiGian` datetime NOT NULL,
  `MaNhanVienThucHien` int(11) NOT NULL,
  `NoiDung` varchar(300) NOT NULL,
  `MaHopDong` int(11) NOT NULL,
  `SoTien` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaNhanVien_idx` (`MaNhanVienThucHien`),
  KEY `MaHopDong_idx` (`MaHopDong`),
  CONSTRAINT `MaHopDong` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MaNhanVien` FOREIGN KEY (`MaNhanVienThucHien`) REFERENCES `nhanvien` (`MaNhanVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichsuthaotachopdong`
--

LOCK TABLES `lichsuthaotachopdong` WRITE;
/*!40000 ALTER TABLE `lichsuthaotachopdong` DISABLE KEYS */;
/*!40000 ALTER TABLE `lichsuthaotachopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(300) NOT NULL,
  `TenNhanVien` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `MaCuaHang` int(11) DEFAULT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1',
  `NgayTao` date NOT NULL,
  `ChucVu` int(11) NOT NULL,
  PRIMARY KEY (`MaNhanVien`),
  UNIQUE KEY `UN_TenDangNhap` (`TenDangNhap`),
  KEY `NhanVien_CuaHang_fkey` (`MaCuaHang`),
  KEY `ChucVu_idx` (`ChucVu`),
  CONSTRAINT `ChucVu` FOREIGN KEY (`ChucVu`) REFERENCES `chucvu` (`maChucVu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NhanVien_CuaHang_fkey` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quyen`
--

DROP TABLE IF EXISTS `quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quyen` (
  `maQuyen` int(11) NOT NULL AUTO_INCREMENT,
  `quyen` varchar(300) NOT NULL,
  `mota` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`maQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quyen`
--

LOCK TABLES `quyen` WRITE;
/*!40000 ALTER TABLE `quyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `quyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quyenchucvu`
--

DROP TABLE IF EXISTS `quyenchucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quyenchucvu` (
  `ma` int(11) NOT NULL AUTO_INCREMENT,
  `maQuyen` int(11) NOT NULL,
  `maChucVu` int(11) NOT NULL,
  PRIMARY KEY (`ma`),
  KEY `quyen_idx` (`maQuyen`),
  KEY `chucVu_idx` (`maChucVu`),
  CONSTRAINT `maChucVu` FOREIGN KEY (`maChucVu`) REFERENCES `chucvu` (`maChucVu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quyen` FOREIGN KEY (`maQuyen`) REFERENCES `quyen` (`maQuyen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quyenchucvu`
--

LOCK TABLES `quyenchucvu` WRITE;
/*!40000 ALTER TABLE `quyenchucvu` DISABLE KEYS */;
/*!40000 ALTER TABLE `quyenchucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taisan`
--

DROP TABLE IF EXISTS `taisan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taisan` (
  `MaTaiSan` int(11) NOT NULL AUTO_INCREMENT,
  `TenTaiSan` varchar(200) NOT NULL,
  `GhiChu` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`MaTaiSan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taisan`
--

LOCK TABLES `taisan` WRITE;
/*!40000 ALTER TABLE `taisan` DISABLE KEYS */;
/*!40000 ALTER TABLE `taisan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taisanhopdong`
--

DROP TABLE IF EXISTS `taisanhopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taisanhopdong` (
  `Ma` int(11) NOT NULL,
  `ThongTin` varchar(100) NOT NULL,
  `MaHopDong` int(11) NOT NULL,
  `MaTaiSan` int(11) NOT NULL,
  `NoiLuuTru` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaHopDong` (`MaHopDong`),
  KEY `MaTaiSan_idx` (`MaTaiSan`),
  CONSTRAINT `MaTaiSan` FOREIGN KEY (`MaTaiSan`) REFERENCES `taisan` (`MaTaiSan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taisanhopdong_ibfk_1` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taisanhopdong`
--

LOCK TABLES `taisanhopdong` WRITE;
/*!40000 ALTER TABLE `taisanhopdong` DISABLE KEYS */;
/*!40000 ALTER TABLE `taisanhopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuchi`
--

DROP TABLE IF EXISTS `thuchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thuchi` (
  `Ma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NoiDung` varchar(45) NOT NULL,
  `ThuChi` tinyint(1) NOT NULL,
  `CacLoaiThuChi` tinyint(2) DEFAULT NULL,
  `MaNhanVienThucHien` int(11) NOT NULL,
  PRIMARY KEY (`Ma`),
  KEY `MaNhanVienThucHien_idx` (`MaNhanVienThucHien`),
  CONSTRAINT `MaNhanVienThucHien` FOREIGN KEY (`MaNhanVienThucHien`) REFERENCES `nhanvien` (`MaNhanVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuchi`
--

LOCK TABLES `thuchi` WRITE;
/*!40000 ALTER TABLE `thuchi` DISABLE KEYS */;
/*!40000 ALTER TABLE `thuchi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinh`
--

DROP TABLE IF EXISTS `tinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinh` (
  `Ma` int(11) NOT NULL,
  `Ten` int(11) NOT NULL,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinh`
--

LOCK TABLES `tinh` WRITE;
/*!40000 ALTER TABLE `tinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaylai`
--

DROP TABLE IF EXISTS `vaylai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaylai` (
  `MaHopDong` int(11) NOT NULL,
  `TienVay` decimal(15,0) NOT NULL COMMENT 'Tổng tiền gốc khách hàng vay',
  `HinhThucLai` enum('ngay','tuan','thang','nam','thangcodinh') NOT NULL,
  `ThoiGianVay` smallint(6) NOT NULL COMMENT 'Tổng số thời gian vay theo hình thức lãi',
  `ChuKyLai` smallint(6) NOT NULL COMMENT 'Số chu kỳ lãi',
  `Lai` decimal(15,0) NOT NULL COMMENT 'Tiền lãi tính trên 1 chu kỳ cho 1 triệu',
  `KieuTinhLai` enum('mottrieu','chuky','phantram','') NOT NULL COMMENT 'tính tiền lãi theo 3K 1 triệu 1 ngày, theo 3K/1 chuky, theo phàn trăm chu kỳ',
  PRIMARY KEY (`MaHopDong`),
  CONSTRAINT `vaylai_ibfk_1` FOREIGN KEY (`MaHopDong`) REFERENCES `hopdong` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaylai`
--

LOCK TABLES `vaylai` WRITE;
/*!40000 ALTER TABLE `vaylai` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaylai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xa`
--

DROP TABLE IF EXISTS `xa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xa` (
  `ma` int(11) NOT NULL,
  `ten` int(11) NOT NULL,
  `mahuyen` int(11) NOT NULL,
  PRIMARY KEY (`ma`),
  KEY `mahuyen` (`mahuyen`),
  CONSTRAINT `xa_ibfk_1` FOREIGN KEY (`mahuyen`) REFERENCES `huyen` (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xa`
--

LOCK TABLES `xa` WRITE;
/*!40000 ALTER TABLE `xa` DISABLE KEYS */;
/*!40000 ALTER TABLE `xa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quanlytindung'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 13:52:18
