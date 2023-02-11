-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2023 at 04:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `muazzam`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`id`, `name`) VALUES
(1, 'Model One'),
(2, 'Model Two');

-- --------------------------------------------------------

--
-- Table structure for table `car_sfx`
--

CREATE TABLE `car_sfx` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car_variant`
--

CREATE TABLE `car_variant` (
  `variant_id` int(11) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `model_id` int(11) NOT NULL,
  `sfx_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `variant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `filter_data`
--

CREATE TABLE `filter_data` (
  `id` int(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `wholesaler` varchar(255) NOT NULL,
  `steering_type` varchar(255) NOT NULL,
  `car_model` varchar(255) NOT NULL,
  `car_sfx` varchar(255) NOT NULL,
  `car_variant` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `jan` int(11) NOT NULL,
  `feb` int(11) NOT NULL,
  `mar` int(11) NOT NULL,
  `apr` int(11) NOT NULL,
  `may` int(11) NOT NULL,
  `jun` int(11) NOT NULL,
  `jul` int(11) NOT NULL,
  `aug` int(11) NOT NULL,
  `sep` int(11) NOT NULL,
  `oct` int(11) NOT NULL,
  `nov` int(11) NOT NULL,
  `dec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filter_data`
--

INSERT INTO `filter_data` (`id`, `supplier`, `wholesaler`, `steering_type`, `car_model`, `car_sfx`, `car_variant`, `color`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`) VALUES
(1, '1', '1', '1', '1', '1', '1', '1', 10, 5, 10, 20, 15, 0, 5, 12, 15, 18, 20, 14),
(2, '2', '2', '2', '2', '2', '2', '2', 10, 5, 10, 20, 15, 0, 5, 12, 15, 18, 20, 14),
(3, '1', '1', '1', '1', '1', '1', '1', 10, 5, 10, 20, 15, 0, 5, 12, 15, 18, 20, 14);

-- --------------------------------------------------------

--
-- Table structure for table `quantity_data`
--

CREATE TABLE `quantity_data` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `wholesaler_id` int(11) NOT NULL,
  `steering_type_id` int(11) NOT NULL,
  `car_model_id` int(11) NOT NULL,
  `car_sfx_id` int(11) NOT NULL,
  `car_variant_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `jan_2023` int(11) NOT NULL,
  `feb_2023` int(11) NOT NULL,
  `mar_2023` int(11) NOT NULL,
  `apr_2023` int(11) NOT NULL,
  `may_2023` int(11) NOT NULL,
  `jun_2023` int(11) NOT NULL,
  `jul_2023` int(11) NOT NULL,
  `aug_2023` int(11) NOT NULL,
  `sep_2023` int(11) NOT NULL,
  `oct_2023` int(11) NOT NULL,
  `nov_2023` int(11) NOT NULL,
  `dec_2023` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `steering_types`
--

CREATE TABLE `steering_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `steering_types`
--

INSERT INTO `steering_types` (`id`, `name`) VALUES
(1, 'Left Hand Driven (LHD)'),
(2, 'Right Hand Driven (RHD)');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`) VALUES
(1, 'Supplier One'),
(2, 'Supplier Two'),
(3, 'Supplier Three');

-- --------------------------------------------------------

--
-- Table structure for table `wholesalers`
--

CREATE TABLE `wholesalers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wholesalers`
--

INSERT INTO `wholesalers` (`id`, `name`) VALUES
(1, 'Whole Seller One'),
(2, 'Whole Seller Two'),
(3, 'Whole Seller Three');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_sfx`
--
ALTER TABLE `car_sfx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_variant`
--
ALTER TABLE `car_variant`
  ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `filter_data`
--
ALTER TABLE `filter_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quantity_data`
--
ALTER TABLE `quantity_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `steering_types`
--
ALTER TABLE `steering_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wholesalers`
--
ALTER TABLE `wholesalers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car_sfx`
--
ALTER TABLE `car_sfx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_variant`
--
ALTER TABLE `car_variant`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filter_data`
--
ALTER TABLE `filter_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quantity_data`
--
ALTER TABLE `quantity_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `steering_types`
--
ALTER TABLE `steering_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wholesalers`
--
ALTER TABLE `wholesalers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_sfx`
--
ALTER TABLE `car_sfx`
  ADD CONSTRAINT `car_sfx_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`);

--
-- Constraints for table `car_variant`
--
ALTER TABLE `car_variant`
  ADD CONSTRAINT `car_variant_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`),
  ADD CONSTRAINT `car_variant_ibfk_2` FOREIGN KEY (`sfx_id`) REFERENCES `car_sfx` (`id`);

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `car_variant` (`variant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
