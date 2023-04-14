-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 06:28 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `destination` varchar(30) NOT NULL,
  `packageprice` varchar(30) NOT NULL,
  `datefrom` date NOT NULL,
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `num_people` int(11) NOT NULL,
  `status` text NOT NULL,
  `dateto` date NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`destination`, `packageprice`, `datefrom`, `b_id`, `num_people`, `status`, `dateto`) VALUES
('dublin', '150', '2024-01-01', 1, 3, '', '2025-01-01'),
('cork', '120', '2026-03-31', 2, 5, '', '2028-04-02'),
('cork', '120', '2026-03-31', 3, 5, '', '2028-04-02'),
('cork', '120', '2026-03-31', 4, 5, '', '2028-04-02'),
('cork', '120', '2025-02-28', 5, 3, '', '2024-02-03'),
('belfast', '120', '2023-02-02', 6, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 7, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 8, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 9, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 10, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 11, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 12, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 13, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 14, 2, '', '2024-02-01'),
('belfast', '120', '2023-02-02', 15, 2, '', '2024-02-01'),
('cork', '120', '2023-01-01', 16, 3, '', '2024-01-01'),
('cork', '120', '2023-01-01', 17, 3, '', '2024-01-01'),
('cork', '120', '2023-01-01', 18, 3, '', '2024-01-01'),
('cork', '120', '2023-01-01', 19, 3, '', '2024-01-01'),
('kilkenny', '120', '2025-02-01', 20, 3, '', '2024-02-03'),
('kilkenny', '120', '2025-02-01', 21, 3, '', '2024-02-03'),
('kilkenny', '120', '2025-02-01', 22, 3, '', '2024-02-03'),
('galway', '120', '2025-02-03', 23, 3, '', '2024-03-02'),
('galway', '120', '2025-02-03', 24, 3, '', '2024-03-02'),
('galway', '120', '2025-02-03', 25, 3, '', '2024-03-02'),
('galway', '120', '2025-02-03', 26, 3, '', '2024-03-02'),
('belfast', '110', '2025-02-02', 27, 5, '', '2024-02-01'),
('belfast', '110', '2025-02-02', 28, 5, '', '2024-02-01'),
('belfast', '110', '2024-03-01', 29, 2, '', '2024-02-02'),
('belfast', '110', '2024-03-01', 30, 2, '', '2024-02-02'),
('belfast', '110', '2024-03-01', 31, 2, '', '2024-02-02'),
('belfast', '110', '2024-03-01', 32, 2, '', '2024-02-02'),
('belfast', '110', '2024-03-01', 33, 2, '', '2024-02-02'),
('belfast', '120', '2022-11-30', 34, 3, '', '2022-11-30'),
('belfast', '120', '2022-11-30', 35, 3, '', '2022-11-30'),
('cork', '110', '2023-03-28', 36, 4, '', '2023-03-30'),
('cork', '120', '2023-04-01', 37, 4, '', '2023-04-05'),
('cork', '110', '2023-04-02', 38, 3, '', '2023-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `b_id` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `price` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `b_id` (`b_id`),
  KEY `u_id` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `password`, `email`) VALUES
(1, 'arth', 'arth', 'arth@arth.com'),
(2, 'rohit', 'rohit', 'rohit@rohit.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
