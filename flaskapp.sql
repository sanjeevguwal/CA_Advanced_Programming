-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 01:19 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `destination` text,
  `datefrom` date DEFAULT NULL,
  `dateto` date DEFAULT NULL,
  `num_people` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`name`, `email`, `phone`, `destination`, `datefrom`, `dateto`, `num_people`) VALUES
('test', 'test@test.com', 2147483647, 'paris', '2023-04-06', '2023-04-12', 2),
('test', 'test@test.com', 2147483647, 'New York', '2023-01-01', '2023-01-01', 3),
('test', 'test@test.com', 2147483647, 'New York', '2023-01-01', '2023-01-01', 3),
('test', 'test@test.com', 2147483647, 'New York', '2023-01-01', '2023-01-01', 3),
('test', 'test@test.com', 987654331, 'Tokyo', '2027-06-03', '2030-02-03', 6),
('loda', 'loda@loda.com', 2147483647, 'Paris', '2024-02-04', '2025-02-02', 9),
('as', 'david@david.com', 2147483647, 'Tokyo', '2024-01-01', '2024-02-02', 6),
('sdasf', 'sdf@sg.com', 2147483647, 'New York', '2023-01-01', '2024-01-01', 4);

-- --------------------------------------------------------

--
-- Table structure for table `booking7`
--

CREATE TABLE IF NOT EXISTS `booking7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` text,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `booking7`
--

INSERT INTO `booking7` (`id`, `destination`, `date`) VALUES
(100, 'newyork', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`) VALUES
('hack', 'hack', ''),
('google', 'google', ''),
('rohit', 'rohit', ''),
('asd', 'adsa', ''),
('octomus', 'octomus', ''),
('arth', 'arth', ''),
('kk', 'akk', ''),
(NULL, NULL, ''),
('abcd', 'ABCD', ''),
('test', 'test', ''),
('test1', 'test', NULL),
('test1', 'test', NULL),
('test2', 'test', 'test2@gmmai.com'),
('david', 'david', 'david@david.com'),
('arth', 'arth', 'arth@arth.com'),
('hack2', 'hack', 'hack2@test.com'),
('rohit', 'rohit', 'rohit@bhosdina.com'),
('abcde', 'abs', 'abcd@put.com'),
('testhack', 'hack', 'test@gmail.com'),
('loda', 'loda', 'loda@loda.com'),
('admin', 'password', 'admin@gmail.com'),
('devils', 'hack', 'david@david.com'),
('google', 'google', 'google@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
