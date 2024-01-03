-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2024 at 12:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `chattbl`
--

CREATE TABLE `chattbl` (
  `id` int(11) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chattbl`
--

INSERT INTO `chattbl` (`id`, `sender`, `receiver`, `msg`, `msg_time`) VALUES
(1, 'mohil@mokaria.com', 'mohil@mokaria.com', 'hello future me!!', '2023-12-31 12:42:21'),
(2, 'mohil@mokaria.com', 'mohil@mokaria.com', 'isdhfj', '2024-01-01 03:13:51'),
(3, 'mohil@mokaria.com', 'mohil@mokaria.com', 'jjhkbjh', '2024-01-03 05:09:34'),
(4, 'mohil@mokaria.com', 'mohil@mokaria.com', 'dxngvc', '2024-01-03 05:11:49'),
(5, 'abc@mail.com', 'mohil@mokaria.com', 'test mail', '2024-01-03 05:14:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chattbl`
--
ALTER TABLE `chattbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chattbl`
--
ALTER TABLE `chattbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
