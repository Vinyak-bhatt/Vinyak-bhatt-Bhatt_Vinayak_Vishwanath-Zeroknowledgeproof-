-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 27, 2024 at 11:06 AM
-- Server version: 10.4.34-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vinayak_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `create_prescription`
--

CREATE TABLE `create_prescription` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(45) DEFAULT NULL,
  `prescription` varchar(45) DEFAULT NULL,
  `tests` varchar(40) NOT NULL,
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `create_prescription`
--

INSERT INTO `create_prescription` (`id`, `patient_id`, `prescription`, `tests`, `status`) VALUES
(1, '1', '6fa9642d74336c60159f4a06794ee292', '', 0),
(2, '2', '6fa9642d74336c60159f4a06794ee292', '', 0),
(3, '2', '86861db0505d76718e8dc8cd2e16de9b', '', 0),
(11, '2', '6fa9642d74336c60159f4a06794ee292', '', 0),
(12, '1', '0f106ad728de68bf89dfeb364e1e658e', '', 0),
(13, '1', 'c2561ebb7dc37ec40b1948f16d7b0df8', '', 0),
(14, '132456', '6fa9642d74336c60159f4a06794ee292', 'test1,test2', 0),
(17, '132457', '86861db0505d76718e8dc8cd2e16de9b', 'test1,test2,test3', 0),
(18, '132457', '86861db0505d76718e8dc8cd2e16de9b', '', 0),
(19, '132457', 'e18a1ed55fd16cd01905ea2fe93e63d9', 'test1,test2,test3,test4,test5', 0),
(20, '132456', 'e18a1ed55fd16cd01905ea2fe93e63d9', 'test1,test2', 0),
(21, '132459', '3285a507394ed07a2a6eb5f914b4cdf3', 'test1,test2,test3', 0),
(22, '132459', '049dd99299de05e87954b90dd8d70d02', '', 0),
(23, '132456', '9555e01df30a74da7bc9993d70f69711', '', 0),
(24, '132456', '40e60ec472a3fa7ba1e5a1fe28129a83', 'test1,test2', 0),
(25, '132456', 'a5f3c6a11b03839d46af9fb43c97c188', 'test1,test2', 0),
(26, '132456', '8b67e815150b5e57f986d65920ca06d0', 'test1,test2,test3,test4,test5', 0),
(27, '132456', '835cd97f5b5f8609aae7f3b68740ac5d', 'test1,test2', 0),
(28, '132456', 'e18a1ed55fd16cd01905ea2fe93e63d9', 'test1,test2', 0),
(29, '132456', '8c43d58e6ab603b43481e0241dc906c6', 'test1,test2,test3', 0),
(30, '132456', '68005bfee264e492bf2b3ddb4466d217', 'test1,test2', 0),
(31, '132456', 'ff8a152bc62bc8e4f4db6e5ebe2b8e2d', 'test1,test2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lab_reports`
--

CREATE TABLE `lab_reports` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `test_id` varchar(45) DEFAULT NULL,
  `test_values` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lab_reports`
--

INSERT INTO `lab_reports` (`id`, `patient_id`, `test_id`, `test_values`, `status`) VALUES
(1, 2, '4', 'b2ef9c7b10eb0985365f913420ccb84a', 0),
(2, 2, '4', 'd4576b3b305e1df6f8ef4517ec2f9615', 0),
(3, 2, '4', '202cb962ac59075b964b07152d234b70', 0),
(4, 2, '2', 'f899139df5e1059396431415e770c6dd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `statusl` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `email`, `phone`, `statusl`) VALUES
(132456, 'test demo', 'demo123@gmail.com', '07975785489', 0),
(132457, 'test demo', 'demo123@gmail.com', '07975785489', 0),
(132458, 'abc', 'abc@abc.com', '90009000', 0),
(132459, 'xyz', 'admin@gmail.com', '900000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', 0),
(6, 'test2', 'doctor@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'doctor', 0),
(8, 'test demo', 'tcechnician@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'lab_technician', 0),
(9, 'test demo', 'demo123@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'lab_technician', 0),
(10, 'test demo', 'demo123@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'lab_technician', 0),
(11, 'test', 'newuser11@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'doctor', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `create_prescription`
--
ALTER TABLE `create_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `create_prescription`
--
ALTER TABLE `create_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `lab_reports`
--
ALTER TABLE `lab_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
