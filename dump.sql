-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2021 at 07:48 AM
-- Server version: 8.0.17
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tank`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_asset`
--

CREATE TABLE `tbl_asset` (
  `id` int(11) NOT NULL,
  `assetCategoryId` int(11) NOT NULL,
  `assetTypeId` int(11) NOT NULL,
  `assetNumber` varchar(20) NOT NULL,
  `manufacturerName` varchar(50) NOT NULL,
  `manufacturerSerialNo` varchar(50) NOT NULL,
  `buildYear` int(11) NOT NULL,
  `grossWeight` float(10,2) NOT NULL,
  `tareWeight` float(10,2) NOT NULL,
  `netWeight` float(10,3) DEFAULT NULL,
  `ownershipType` varchar(20) NOT NULL,
  `leaseId` int(11) DEFAULT NULL,
  `ownershipDate` date NOT NULL,
  `assetImages` varchar(200) DEFAULT NULL,
  `assetCertificates` varchar(200) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL,
  `depotId` int(11) NOT NULL,
  `assetStatusId` int(11) NOT NULL,
  `firstHydroTestDate` date NOT NULL,
  `lastHydroTestDate` date NOT NULL,
  `nextTestDate` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `id` int(11) NOT NULL,
  `countryName` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currency_type`
--

CREATE TABLE `tbl_currency_type` (
  `id` int(11) NOT NULL,
  `currencyCode` varchar(5) NOT NULL,
  `currencyName` varchar(30) NOT NULL,
  `currencySymbol` varchar(4) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL DEFAULT '1',
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_depot`
--

CREATE TABLE `tbl_depot` (
  `id` int(11) NOT NULL,
  `depotName` varchar(50) NOT NULL,
  `depotCode` varchar(10) NOT NULL,
  `countryId` int(11) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL,
  `depotManager` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contactNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `depotAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_depot`
--

INSERT INTO `tbl_depot` (`id`, `depotName`, `depotCode`, `countryId`, `locationId`, `depotManager`, `contactNumber`, `depotAddress`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(10, 'RSA', '005', NULL, NULL, NULL, NULL, NULL, '2021-02-07 03:36:03', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lease`
--

CREATE TABLE `tbl_lease` (
  `id` int(11) NOT NULL,
  `leaseNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `leaseReferenceNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `leaseCompany` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `leaseStartDate` date DEFAULT NULL,
  `leaseEndDate` date DEFAULT NULL,
  `leaseRate` float(10,2) DEFAULT NULL,
  `currencyId` int(11) DEFAULT NULL,
  `leaseCost` float(10,2) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_lease`
--

INSERT INTO `tbl_lease` (`id`, `leaseNumber`, `leaseReferenceNo`, `leaseCompany`, `leaseStartDate`, `leaseEndDate`, `leaseRate`, `currencyId`, `leaseCost`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(11, 'UTAS39F668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-07 03:37:05', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `id` int(11) NOT NULL,
  `locationName` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`id`, `locationName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(21, 'DUBAI', '2021-02-07 03:32:12', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tank_category`
--

CREATE TABLE `tbl_tank_category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT '1',
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_tank_category`
--

INSERT INTO `tbl_tank_category` (`id`, `categoryName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(41, 'ISO', '2021-02-07 03:29:58', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tank_status`
--

CREATE TABLE `tbl_tank_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_tank_status`
--

INSERT INTO `tbl_tank_status` (`id`, `status`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(19, 'AV', '2021-02-07 03:33:59', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tank_type`
--

CREATE TABLE `tbl_tank_type` (
  `id` int(11) NOT NULL,
  `tankTypeName` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_tank_type`
--

INSERT INTO `tbl_tank_type` (`id`, `tankTypeName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `isActive`) VALUES
(24, 'T11', '2021-02-07 03:30:45', NULL, NULL, NULL, 1),
(25, 'T12', '2021-02-07 03:30:45', NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_asset`
--
ALTER TABLE `tbl_asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assetNumber_UNIQUE` (`assetNumber`),
  ADD KEY `fk_asset_depot_idx` (`depotId`),
  ADD KEY `fk_asset_lease_idx` (`leaseId`),
  ADD KEY `fk_asset_tank_category_idx` (`assetCategoryId`),
  ADD KEY `fk_asset_tank_type_idx` (`assetTypeId`),
  ADD KEY `fk_asset_location_idx` (`locationId`),
  ADD KEY `fk_asset_tank_status_idx` (`assetStatusId`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_currency_type`
--
ALTER TABLE `tbl_currency_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_depot`
--
ALTER TABLE `tbl_depot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_depot_location_idx` (`locationId`);

--
-- Indexes for table `tbl_lease`
--
ALTER TABLE `tbl_lease`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lease_currency_idx` (`currencyId`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tank_category`
--
ALTER TABLE `tbl_tank_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tank_status`
--
ALTER TABLE `tbl_tank_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tank_type`
--
ALTER TABLE `tbl_tank_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_asset`
--
ALTER TABLE `tbl_asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=961;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tbl_currency_type`
--
ALTER TABLE `tbl_currency_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `tbl_depot`
--
ALTER TABLE `tbl_depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_lease`
--
ALTER TABLE `tbl_lease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_tank_category`
--
ALTER TABLE `tbl_tank_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_tank_status`
--
ALTER TABLE `tbl_tank_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_tank_type`
--
ALTER TABLE `tbl_tank_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_asset`
--
ALTER TABLE `tbl_asset`
  ADD CONSTRAINT `fk_asset_depot` FOREIGN KEY (`depotId`) REFERENCES `tbl_depot` (`id`),
  ADD CONSTRAINT `fk_asset_lease` FOREIGN KEY (`leaseId`) REFERENCES `tbl_lease` (`id`),
  ADD CONSTRAINT `fk_asset_location` FOREIGN KEY (`locationId`) REFERENCES `tbl_location` (`id`),
  ADD CONSTRAINT `fk_asset_tank_category` FOREIGN KEY (`assetCategoryId`) REFERENCES `tbl_tank_category` (`id`),
  ADD CONSTRAINT `fk_asset_tank_status` FOREIGN KEY (`assetStatusId`) REFERENCES `tbl_tank_status` (`id`),
  ADD CONSTRAINT `fk_asset_tank_type` FOREIGN KEY (`assetTypeId`) REFERENCES `tbl_tank_type` (`id`);

--
-- Constraints for table `tbl_depot`
--
ALTER TABLE `tbl_depot`
  ADD CONSTRAINT `fk_depot_location` FOREIGN KEY (`locationId`) REFERENCES `tbl_location` (`id`);

--
-- Constraints for table `tbl_lease`
--
ALTER TABLE `tbl_lease`
  ADD CONSTRAINT `fk_lease_currency` FOREIGN KEY (`currencyId`) REFERENCES `tbl_currency_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
