-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 13, 2016 at 12:58 PM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

use urban_renewal;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Urban_Renewal`
--

-- --------------------------------------------------------

--
-- Table structure for table `appraisers`
--

CREATE TABLE `appraisers` (
  `appraiser_id` int(11) NOT NULL,
  `appraiser_name` varchar(30) NOT NULL,
  `company_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appraises`
--

CREATE TABLE `appraises` (
  `appraise_id` int(11) NOT NULL,
  `appraiser_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `imps_value` int(11) DEFAULT NULL,
  `area_house` int(11) DEFAULT NULL,
  `land_value` int(11) DEFAULT NULL,
  `total_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `building_id` int(11) NOT NULL,
  `st_name` varchar(30) NOT NULL,
  `apt_no` varchar(20) NOT NULL,
  `num_units` int(11) DEFAULT NULL,
  `area_of_imps` int(11) DEFAULT NULL,
  `land_use` varchar(20) DEFAULT NULL,
  `case_id` int(11) NOT NULL,
  `tenants_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `case_id` int(11) NOT NULL,
  `concurred_price` int(11) DEFAULT NULL,
  `date_concurred` date DEFAULT NULL,
  `date_prel_title_search` date DEFAULT NULL,
  `date_offer_made` date DEFAULT NULL,
  `date_offer_accepted` date DEFAULT NULL,
  `date_condemn_approval` date DEFAULT NULL,
  `date_assigned_to_attorney` date DEFAULT NULL,
  `date_petition_filed` date DEFAULT NULL,
  `date_commis_hearing` date DEFAULT NULL,
  `date_order_vesting_title` date DEFAULT NULL,
  `date_final_title_certi` date DEFAULT NULL,
  `block_no` int(11) NOT NULL,
  `parcel_no` int(11) NOT NULL,
  `ward_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `owner_id` int(11) NOT NULL,
  `owner_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenants_id` int(11) NOT NULL,
  `tenants_name` varchar(30) NOT NULL,
  `date_vacated` date DEFAULT NULL,
  `rent_per_month` int(11) DEFAULT NULL,
  `rent_refund` int(11) DEFAULT NULL,
  `rent_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appraisers`
--
ALTER TABLE `appraisers`
  ADD PRIMARY KEY (`appraiser_id`);

--
-- Indexes for table `appraises`
--
ALTER TABLE `appraises`
  ADD PRIMARY KEY (`appraise_id`),
  ADD KEY `appraiser_id` (`appraiser_id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `tenants_id` (`tenants_id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenants_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appraises`
--
ALTER TABLE `appraises`
  ADD CONSTRAINT `appraises_ibfk_1` FOREIGN KEY (`appraiser_id`) REFERENCES `appraisers` (`appraiser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appraises_ibfk_2` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buildings_ibfk_2` FOREIGN KEY (`tenants_id`) REFERENCES `tenants` (`tenants_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buildings_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`) ON DELETE CASCADE ON UPDATE CASCADE;
