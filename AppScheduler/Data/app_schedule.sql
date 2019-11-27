-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2019 at 01:22 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_schedule`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sproc_AppScheduleGet` ()  BEGIN
SELECT tbappinfo.AppName, tbscheduledjobs.AppID, tbscheduledjobs.JobsID, tbscheduledjobs.Time, tbscheduledjobs.Day, tbscheduledjobs.Success, tbscheduledjobs.Files_DwUp, tbscheduledjobs.Files_Sorted
FROM tbappinfo
LEFT JOIN tbscheduledjobs on tbappinfo.ID = tbscheduledjobs.AppID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbappinfo`
--

CREATE TABLE `tbappinfo` (
  `ID` int(11) NOT NULL,
  `AppName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbappinfo`
--

INSERT INTO `tbappinfo` (`ID`, `AppName`) VALUES
(1001, 'Metro Hospital'),
(1002, 'Capital Risk'),
(1003, 'Disney'),
(1004, 'ET');

-- --------------------------------------------------------

--
-- Table structure for table `tbscheduledjobs`
--

CREATE TABLE `tbscheduledjobs` (
  `JobsID` int(11) NOT NULL,
  `AppID` int(11) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Day` varchar(255) DEFAULT NULL,
  `Success` varchar(255) DEFAULT NULL,
  `Files_DwUp` int(11) DEFAULT NULL,
  `Files_Sorted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbscheduledjobs`
--

INSERT INTO `tbscheduledjobs` (`JobsID`, `AppID`, `Time`, `Day`, `Success`, `Files_DwUp`, `Files_Sorted`) VALUES
(1, 1002, '04:00:00', 'Monday', 'Success', 60, 60),
(2, 1003, '06:01:00', 'Friday', 'Success', 500, 400),
(3, 1002, '04:00:00', 'Tuesday', 'Failed', 0, 0),
(4, 1002, '04:00:00', 'Thursday', 'Success', 100, 100),
(5, 1004, '08:00:00', 'Monday', 'Success', 200, 200),
(6, 1001, '06:01:00', 'Monday', 'Success', 60, 60),
(7, 1001, '06:01:00', 'Tuesday', 'Success', 60, 0),
(8, 1001, '06:01:00', 'Wednesday', 'Success', 60, 0),
(9, 1001, '06:01:00', 'Thursday', 'Success', 60, 60),
(10, 1001, '06:01:00', 'Sunday', 'Success', 60, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbappinfo`
--
ALTER TABLE `tbappinfo`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbscheduledjobs`
--
ALTER TABLE `tbscheduledjobs`
  ADD PRIMARY KEY (`JobsID`),
  ADD KEY `AppID` (`AppID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbscheduledjobs`
--
ALTER TABLE `tbscheduledjobs`
  ADD CONSTRAINT `tbscheduledjobs_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `tbappinfo` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
