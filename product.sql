-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 02, 2024 at 06:08 PM
-- Server version: 5.7.44
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--
CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `productname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dissciption` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `stockon` int(11) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dateadd` DATE NOT NULL,
  `dateup` DATE NOT NULL,
  `status` enum('พร้อมขาย','หมดสต๊อก') CHARACTER SET utf8 NOT NULL,
  `admin` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `productname`, `brand`, `dissciption`, `stockon`, `price`, `category`, `dateadd`, `dateup`, `status`, `admin`, `note`) VALUES
(1, 'IPhone', 'Apple', 'IPhon13 promax สีขาว', 560 , 30000, 'อุปกรณ์อิเล็กทรอนิกส์','2018-01-27','2020-03-26','พร้อมขาย','admin', 'สินค้ามีคุณภาพ'),
(2, 'IPad', 'Apple', 'IPad Air5 สีม่วง', 560 , 35000, 'อุปกรณ์อิเล็กทรอนิกส์','2018-01-27','2020-03-26','พร้อมขาย','admin', 'สินค้ามีคุณภาพ'),
(3, 'Cereals', 'Copp Sky', 'อาหารเช้าซีเรียล เคลือน้ำผึ้ง', 300 , 20, 'อาหารและเครื่องดื่ม','2019-01-15','2020-03-26','หมดสต๊อก','admin', 'สินค้าเข้าวันที่20'),
(4, 'Milk', 'Dutch Mill', 'นมสดดัชมิลล์ รสสตอเบอรี่', 300 , 20, 'อาหารและเครื่องดื่ม','2019-01-15','2020-03-26','พร้อมขาย','admin', 'สินค้าเข้าวันที่20'),
(5, 'Laptop', 'Asus', 'Laptop Asus Vivobook สีดำ', 300 , 27000, 'อุปกรณ์อิเล็กทรอนิกส์','2021-08-20','2024-03-26','พร้อมขาย','admin', 'สินค้าพร้อมขาย'),
(6, 'Candy', 'Mentos', 'ลูกอมเมนโตส รสสตอเบอรี่', 300 , 20, 'อาหารและเครื่องดื่ม','2023-07-12','2024-03-26','หมดสต๊อก','admin', 'สินค้าเข้าวันที่20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;