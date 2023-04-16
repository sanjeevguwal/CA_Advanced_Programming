-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 11:50 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`destination`, `packageprice`, `datefrom`, `b_id`, `num_people`, `status`, `dateto`) VALUES
('cork', '150', '2023-03-29', 58, 3, '', '2023-04-27'),
('cork', '150', '2023-03-29', 59, 3, '', '2023-04-27'),
('cork', '150', '2023-03-29', 60, 3, '', '2023-04-27'),
('cork', '150', '2023-03-29', 61, 3, '', '2023-04-27'),
('cork', '110', '2023-03-28', 62, 4, '', '2023-03-31'),
('dublin', '150', '2023-03-27', 63, 4, '', '2023-04-11'),
('kilkenny', '120', '2023-04-07', 64, 3, '', '2023-04-26'),
('cork', '110', '2023-04-17', 65, 4, '', '2024-01-01'),
('galway', '120', '2023-04-30', 66, 7, '', '2024-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` text NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `complainttype` text NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`com_id`, `complaint`, `name`, `email`, `complainttype`) VALUES
(1, 'bhhshh', 'test', 'test1@test.com', 'booking'),
(2, 'bhhshh', 'test', 'test1@test.com', 'booking'),
(3, 'bhhshh', 'test', 'test1@test.com', 'booking'),
(4, 'bhhshh', 'test', 'test1@test.com', 'booking'),
(5, 'bhhshh', 'test', 'test1@test.com', 'booking'),
(6, 'sfhshk', 'test`', 'test1@test.com', 'booking'),
(7, 'sfhshk', 'test`', 'test1@test.com', 'booking'),
(8, 'paid issue', 'arth', 'test@test.com', 'payment');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `password`, `email`) VALUES
(1, 'arth', 'arth', 'arth@arth.com'),
(2, 'rohit', 'rohit', 'rohit@rohit.com'),
(3, 'sanjeev', 'sanjeev', 'sanjeev@snajeev.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
