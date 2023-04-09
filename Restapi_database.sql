-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2023 at 08:51 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restproj2`
--

-- --------------------------------------------------------

--
-- Table structure for table `lapitem`
--

CREATE TABLE `lapitem` (
  `p_id` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `typename` varchar(9) DEFAULT NULL,
  `inches` float(3,1) NOT NULL,
  `screenresolution` varchar(41) DEFAULT NULL,
  `cpu` varchar(27) DEFAULT NULL,
  `ram` varchar(4) DEFAULT NULL,
  `memory` varchar(19) DEFAULT NULL,
  `gpu` varchar(28) DEFAULT NULL,
  `opsys` varchar(10) DEFAULT NULL,
  `weight` varchar(6) DEFAULT NULL,
  `price` float(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lapitem`
--

INSERT INTO `lapitem` (`p_id`, `company`, `typename`, `inches`, `screenresolution`, `cpu`, `ram`, `memory`, `gpu`, `opsys`, `weight`, `price`) VALUES
(1, 'Apple', 'Ultrabook', 13.3, '1440x900', 'Intel Core i5 1.8GHz', '8GB', '128GB Flash Storage', 'Intel HD Graphics 6000', 'macOS', '1.34kg', 47895.5234),
(2, 'hp', 'Notebook', 15.6, 'Full HD 1920x1080', 'Intel Core i5 7200U 2.5GHz', '8GB', '256GB SSD', 'Intel HD Graphics 620', 'No OS', '1.86kg', 30636.0000),
(3, 'Apple', 'Ultrabook', 15.4, 'IPS Panel Retina Display 2880x1800', 'Intel Core i7 2.7GHz', '16GB', '512GB SSD', 'AMD Radeon Pro 455', 'macOS', '1.83kg', 135195.3438),
(4, 'Apple', 'Ultrabook', 13.3, 'IPS Panel Retina Display 2560x1600', 'Intel Core i5 3.1GHz', '8GB', '256GB SSD', 'Intel Iris Plus Graphics 650', 'macOS', '1.37kg', 96095.8047),
(5, 'Acer', 'Notebook', 15.6, '1366x768', 'AMD A9-Series 9420 3GHz', '4GB', '500GB HDD', 'AMD Radeon R5', 'Windows 10', '2.1kg', 21312.0000),
(6, 'Apple', 'Ultrabook', 15.4, 'IPS Panel Retina Display 2880x1800', 'Intel Core i7 2.2GHz', '16GB', '256GB Flash Storage', 'Intel Iris Pro Graphics', 'Mac OS X', '2.04kg', 114017.6016),
(7, 'Apple', 'Ultrabook', 13.3, '1440x900', 'Intel Core i5 1.8GHz', '8GB', '256GB Flash Storage', 'Intel HD Graphics 6000', 'macOS', '1.34kg', 61735.5352),
(8, 'Asus', 'Ultrabook', 14.0, 'Full HD 1920x1080', 'Intel Core i7 8550U 1.8GHz', '16GB', '512GB SSD', 'Nvidia GeForce MX150', 'Windows 10', '1.3kg', 79653.6016),
(9, 'Acer', 'Ultrabook', 14.0, 'IPS Panel Full HD 1920x1080', 'Intel Core i5 8250U 1.6GHz', '8GB', '256GB SSD', 'Intel UHD Graphics 620', 'Windows 10', '1.6kg', 41025.6016),
(10, 'HP', 'Notebook', 15.6, '1366x768', 'Intel Core i5 7200U 2.5GHz', '4GB', '500GB HDD', 'Intel HD Graphics 620', 'No OS', '1.86kg', 20986.9922),
(11, 'HP', 'Notebook', 15.6, 'Full HD 1920x1080', 'Intel Core i3 6006U 2GHz', '4GB', '500GB HDD', 'Intel HD Graphics 520', 'No OS', '1.86kg', 18381.0664),
(12, 'Apple', 'Ultrabook', 15.4, 'IPS Panel Retina Display 2880x1800', 'Intel Core i7 2.8GHz', '16GB', '256GB SSD', 'AMD Radeon Pro 555', 'macOS', '1.83kg', 130001.6016),
(13, 'Dell', 'Notebook', 15.6, 'Full HD 1920x1080', 'Intel Core i3 6006U 2GHz', '4GB', '256GB SSD', 'AMD Radeon R5 M430', 'Windows 10', '2.2kg', 26581.3926),
(14, 'Apple', 'Ultrabook', 12.0, 'IPS Panel Retina Display 2304x1440', 'Intel Core M m3 1.2GHz', '8GB', '256GB SSD', 'Intel HD Graphics 615', 'macOS', '0.92kg', 67260.6719),
(15, 'Apple', 'Ultrabook', 13.3, 'IPS Panel Retina Display 2560x1600', 'Intel Core i5 2.3GHz', '8GB', '256GB SSD', 'Intel Iris Plus Graphics 640', 'macOS', '1.37kg', 80908.3438),
(16, 'Dell', 'Notebook', 12.0, 'Full HD 1920x1080', 'Dell', '8GB', '256GB SSD', 'AMD Radeon R5 M430', 'Windows', '10kg', 39693.6016);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'rina', 'rina23@gmail.com', '5687946970', '12345'),
(2, 'puja', 'puja007@gmail.com', '6753247880', '456788');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lapitem`
--
ALTER TABLE `lapitem`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lapitem`
--
ALTER TABLE `lapitem`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
